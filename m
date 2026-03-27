Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE845366064
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774578009; cv=none; b=VQpTOD0QfapY4qgADVjwkBJp6IbGf0Wn9V4Z/mo3+3N6QJuRnNlRS7YVR9mnKKXYm3Dt2MrXe1HBsg/wbqfYoGDcxfsS22PLysf260Tmr9BRR4E5LAzjbdh1s7TDqnEnEC7h0LQdJl9wc5IrDYso2LKYvjpWCpCAFKBMFn9SO20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774578009; c=relaxed/simple;
	bh=KbDRQZgON9sRRjUDBEU4VQwvvaWrMcTapPPTDSvsixM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iCDo++W1FmxrCIayNElzEB5qXkIawuxpJ7lr+1Hma//2AtsqRdEEdntoheQl2go9hm43kVzZsWxgAJjmsV0GMWA+q6gAjRhwwHvtjk23F8iKR/C4q08XprFGul/jQMpJa9Sa5av20oJ0HkOY6b70GiKkxxhMTx9TTDnTkFNGIoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3FVqVlaz; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=S1ALP5G+; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3FVqVlaz";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="S1ALP5G+"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774578006;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ztgf+bvmZ8chEdMsyRUoulIOp3HtnYuEqxiwj/UIqdo=;
	b=3FVqVlazUYmGhkcPFd2vODdnkBOS/l4ghy4PXruhqDVAJkrGqGfgvZW5FgHZbX+BXu+VFG
	q9JCANERGss/fQYeH6imtlweu7EItyTgf0SHq1WgRsmyQGB+eyh+/vFAtmkQbVgaeQMnZj
	tb+Q1nVJE4NNpJkZUj+ca4S7XwgsO5bkrpQXLDekQHzyELkEEI796XxqNlFkG5qqO/baJM
	Hly4pNufSCJaWlpGi6EqICK7Ybqil8V7rfse72sPlUrfMs/I2Xp3Cuh+BYMcv0Gibo1fm1
	wKYqi7HzmPfL7HP/08+ZvfBZdklPKz2dST36LuK70B9EnRMWc9VnrkP1pjdHqg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774578006;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ztgf+bvmZ8chEdMsyRUoulIOp3HtnYuEqxiwj/UIqdo=;
	b=S1ALP5G+cIGn1xhwAX7PEb95KCYug7SzukzPGn++X/H89r+4YtTkgfTeYWRfq+THoM8w7I
	nZtp3E1XfBOzdUDw==
To: Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Sean Christopherson <seanjc@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Christian Ludloff <ludloff@gmail.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>,
	x86@kernel.org,
	x86-cpuid@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	"Ahmed S. Darwish" <darwi@linutronix.de>
Subject: [PATCH v6 45/90] x86/cpu/amd: Use parsed CPUID(0x80000005)
Date: Fri, 27 Mar 2026 03:15:59 +0100
Message-ID: <20260327021645.555257-46-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For AMD BSP init, use parsed CPUID(0x80000005) instead of issuing a direct
CPUID query and doing ugly bitwise operations.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/amd.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
index 224420f53ea9..67c983fd8d67 100644
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 #include <linux/export.h>
 #include <linux/bitops.h>
+#include <linux/sizes.h>
 #include <linux/elf.h>
 #include <linux/mm.h>
 #include <linux/kvm_types.h>
@@ -421,6 +422,8 @@ static void tsa_init(struct cpuinfo_x86 *c)
 
 static void bsp_init_amd(struct cpuinfo_x86 *c)
 {
+	const struct leaf_0x80000005_0 *el5 = cpuid_leaf(c, 0x80000005);
+
 	if (cpu_has(c, X86_FEATURE_CONSTANT_TSC)) {
 
 		if (c->x86 > 0x10 ||
@@ -433,13 +436,8 @@ static void bsp_init_amd(struct cpuinfo_x86 *c)
 		}
 	}
 
-	if (c->x86 == 0x15) {
-		unsigned long upperbit;
-		u32 cpuid, assoc;
-
-		cpuid	 = cpuid_edx(0x80000005);
-		assoc	 = cpuid >> 16 & 0xff;
-		upperbit = ((cpuid >> 24) << 10) / assoc;
+	if (c->x86 == 0x15 && el5) {
+		unsigned long upperbit = (el5->l1_icache_size_kb * SZ_1K) / el5->l1_icache_assoc;
 
 		va_align.mask	  = (upperbit - 1) & PAGE_MASK;
 		va_align.flags    = ALIGN_VA_32 | ALIGN_VA_64;
-- 
2.53.0

