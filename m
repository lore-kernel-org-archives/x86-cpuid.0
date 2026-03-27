Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A9937A4AF
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774578083; cv=none; b=Wj0lAhNzuWpG7TRW6v4D5278AIellYzSZRVhTID55aVSAfmozGCU2vD+b7ehU7D1Z0mzYucVAk4sniE72WgXqelknbLQEXnD6JyXrxri8kdDvlLvclwCU4tqNJeyBjl76CN3oGptsmnT6AJ3kS/8Bh0NoJSKYN6hXs+wkYaSgzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774578083; c=relaxed/simple;
	bh=r3JSn1+HEA3ajw2VPnamJpdfIFaiDQcAloOf66/dtKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JHKRIYoBG3Qg42godz9kI8v/drG4GIK4tpzTk7kIgsZLKeNkYOeczYeARCnMsi1Ph5upbD0ssz7vo/D+An1Ot/lV11n09JV3LC3HCvFWQqtbWkZr7FxwQqR3L4qScUmhXI8HfQA8edD/Scl5Z6LIIaX89Gl8mIMGaMKlKwWYD7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sAxtdWOr; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=QAscarOZ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sAxtdWOr";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QAscarOZ"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774578081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ppk0/jYqr8dqJV5JRSY9GhFkYl4GLYVf87y+tfWguGA=;
	b=sAxtdWOrbxEJ/sDf5uJu4OkO1AUbGEBaZKGDkwBOh+3LpVGjTqueaD8PzuLqBFOITb6NVo
	N/+cFBUkG8MZ4NSp0Aek8t9+pj9A6ktfyX+RUCiu5+SVtVvn1ZHJCs0cMJBeqkhGwRrMss
	+qWfxw2ZEaMvITheeS+PvtbqAeE4fM3OFYLSKDddtviAyMmLgiaAaLbc+Xsqif/T3NLs31
	mqEUBjxHmoQZ6NkZxIsU2O9mlyP/KqUj3fb+4ZcK6N7ZCsACVIPoQv8zBwQ/toxRzGXPkG
	O614HylantsZxE2EjgOemy2P9MoiX0fihPFEtoijzT8I+BZWwMoW49bAZGbuVw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774578081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ppk0/jYqr8dqJV5JRSY9GhFkYl4GLYVf87y+tfWguGA=;
	b=QAscarOZHSqpa3rWbeEgJB4sbkQtj+aGTqwDCvVo19rdLWwobKOO87rtQTLIJKxUFvkxSf
	MRkd3c9ERSgPPBAg==
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
Subject: [PATCH v6 66/90] x86/cpuid: Parse CPUID(0x80000022)
Date: Fri, 27 Mar 2026 03:16:20 +0100
Message-ID: <20260327021645.555257-67-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Parse CPUID(0x80000022).

Add AMD and Hygon vendor tags as it is only supported on these CPUs.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpuid/types.h | 1 +
 arch/x86/kernel/cpu/cpuid_parser.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/x86/include/asm/cpuid/types.h b/arch/x86/include/asm/cpuid/types.h
index 70ccd52a6848..deddb534486a 100644
--- a/arch/x86/include/asm/cpuid/types.h
+++ b/arch/x86/include/asm/cpuid/types.h
@@ -229,6 +229,7 @@ struct cpuid_leaves {
 	CPUID_LEAF   (  0x80000006,	0  );
 	CPUID_LEAF   (  0x80000008,	0  );
 	CPUID_LEAF_N (  0x8000001d,	8  );
+	CPUID_LEAF   (  0x80000022,	0  );
 	CPUID_LEAF   (  0x80860000,	0  );
 	CPUID_LEAF   (  0x80860001,	0  );
 	CPUID_LEAF   (  0x80860002,	0  );
diff --git a/arch/x86/kernel/cpu/cpuid_parser.h b/arch/x86/kernel/cpu/cpuid_parser.h
index 46f06792afb1..59a4d562320a 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.h
+++ b/arch/x86/kernel/cpu/cpuid_parser.h
@@ -163,6 +163,7 @@ struct cpuid_parse_entry {
 	CPUID_PARSE_ENTRY   (	0x80000006,	0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80000008,	0,		generic			),	\
 	CPUID_PARSE_ENTRY_N (	0x8000001d,			deterministic_cache	),	\
+	CPUID_PARSE_ENTRY   (	0x80000022,	0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80860000,	0,		0x80860000		),	\
 	CPUID_PARSE_ENTRY   (	0x80860001,	0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80860002,	0,		generic			),	\
@@ -211,6 +212,7 @@ struct cpuid_vendor_entry {
 	CPUID_VENDOR_ENTRY(0x1c,	X86_VENDOR_INTEL),				\
 	CPUID_VENDOR_ENTRY(0x23,	X86_VENDOR_INTEL),				\
 	CPUID_VENDOR_ENTRY(0x8000001d,	X86_VENDOR_AMD, X86_VENDOR_HYGON),		\
+	CPUID_VENDOR_ENTRY(0x80000022,	X86_VENDOR_AMD, X86_VENDOR_HYGON),		\
 	CPUID_VENDOR_ENTRY(0x80860000,	X86_VENDOR_TRANSMETA),				\
 	CPUID_VENDOR_ENTRY(0x80860001,	X86_VENDOR_TRANSMETA),				\
 	CPUID_VENDOR_ENTRY(0x80860002,	X86_VENDOR_TRANSMETA),				\
-- 
2.53.0

