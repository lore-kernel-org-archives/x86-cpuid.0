Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14239AD2C
	for <x86-cpuid@lists.linux.dev>; Fri,  7 Nov 2025 07:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762499799; cv=none; b=mqHOHK7mtt64sJcEiUeLtv/ZuDZx4BOPBagzi+WiLt4D/kFy6nhswrqL8xDKsxUlEtyvPVtKH738CNxEFDWZDkj6UCCtxiQFWE3XQiDtpXyBrLN8hGkrgnuECqK2m/oOeppF3anPVXBC5utakHVU8wwk+nhpAJWYNMYoC+ajR1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762499799; c=relaxed/simple;
	bh=ZE4zGX/pGY4FSG36edklVAt8h82wW/pMxO8mJJ9/9w0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=a0RQBt8UXYSRAMs0P5BAwHNdIFuubge6y+PajPveR2aXzGzoi10beE+6kUelUT9Elo1vnYmwWIKZ+fRsKDI6BvkKODLtBX/dKMwwcTsZYQZnF8zE6Vx0O8HbGwOl1e+TWFTNs6SDz9s1QMwV9nLBlgGO2Pjbqi/kCTRLmXn34HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TNPerWzf; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TNPerWzf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762499797; x=1794035797;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZE4zGX/pGY4FSG36edklVAt8h82wW/pMxO8mJJ9/9w0=;
  b=TNPerWzfhS1C1X9gkDdjy0kA6Z0IiUIHL+jfGAVja3BRn4B9DFQNBA3a
   uamgnmFNV1EmRlSb9T4L5JVNHJj226Ik8nV4qZbg0Kghh10EekAbqG+b0
   ihX/NL+4QvNBRybE+Dvxb8eXgDuJxuPq8mIA7xNa9plvaLmGXUBjIMzmm
   yZsdnALt/l5AqPSGXWiSZSQJj8aVUCIIqqX55f6gXh5lUIqpyqOH9+iIo
   PVPrlUgh2o2SMj8v+NuMOpiqUxJbg/hvhM+6vzKGcXij5sm0ewC+znkXf
   cippYgh6VO1/ZZKs85fbj2iFshcd0sjBV4MzrewZhbhkZBXhN2iLoX/AM
   Q==;
X-CSE-ConnectionGUID: LOCYnJGRT5WOzyH/kgG3Cw==
X-CSE-MsgGUID: xK7uz/6JR+K/sWgINYrLjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="68508428"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; 
   d="scan'208";a="68508428"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 23:16:36 -0800
X-CSE-ConnectionGUID: lF80zo7vRSSrUsCSJWoP0A==
X-CSE-MsgGUID: +IyYTQYnRF2jheWbIgv7Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; 
   d="scan'208";a="187812303"
Received: from baandr0id001.iind.intel.com ([10.66.253.151])
  by fmviesa006.fm.intel.com with ESMTP; 06 Nov 2025 23:16:33 -0800
From: Kaushlendra Kumar <kaushlendra.kumar@intel.com>
To: bp@alien8.de,
	tglx@linutronix.de,
	x86@kernel.org,
	darwi@linutronix.de,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com
Cc: x86-cpuid@lists.linux.dev,
	Kaushlendra Kumar <kaushlendra.kumar@intel.com>
Subject: [PATCH] tools/x86: Support clang compilation for Android
Date: Fri,  7 Nov 2025 12:44:24 +0530
Message-Id: <20251107071424.746477-1-kaushlendra.kumar@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing stdint.h include and replace compiler-gcc.h with
compiler.h to fix clang compilation errors on Android builds.
Change u64 typedef to use standard uint64_t with header guards
to maintain backward compatibility with existing Linux builds.

This resolves clang build failures where uint64_t is undefined and
ensures the tool compiles on both Android NDK and Linux toolchains.

Signed-off-by: Kaushlendra Kumar <kaushlendra.kumar@intel.com>
---
 tools/arch/x86/kcpuid/kcpuid.c       | 5 ++++-
 tools/include/linux/compiler_types.h | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/arch/x86/kcpuid/kcpuid.c b/tools/arch/x86/kcpuid/kcpuid.c
index 7dc6b9235d02..5243b49556be 100644
--- a/tools/arch/x86/kcpuid/kcpuid.c
+++ b/tools/arch/x86/kcpuid/kcpuid.c
@@ -7,6 +7,7 @@
 #include <stdbool.h>
 #include <stdio.h>
 #include <stdlib.h>
+#include <stdint.h>
 #include <string.h>
 
 #define ARRAY_SIZE(x)	(sizeof(x) / sizeof((x)[0]))
@@ -14,7 +15,9 @@
 #define __noreturn	__attribute__((__noreturn__))
 
 typedef unsigned int u32;
-typedef unsigned long long u64;
+#ifndef u64
+#define u64 uint64_t
+#endif
 
 char *def_csv = "/usr/share/misc/cpuid.csv";
 char *user_csv;
diff --git a/tools/include/linux/compiler_types.h b/tools/include/linux/compiler_types.h
index d09f9dc172a4..0333c234fe3d 100644
--- a/tools/include/linux/compiler_types.h
+++ b/tools/include/linux/compiler_types.h
@@ -33,7 +33,7 @@
 
 /* Compiler specific macros. */
 #ifdef __GNUC__
-#include <linux/compiler-gcc.h>
+#include <linux/compiler.h>
 #endif
 
 #ifndef asm_goto_output
-- 
2.34.1

