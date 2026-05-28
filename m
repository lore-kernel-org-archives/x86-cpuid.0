Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BA043E4A8
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983011; cv=none; b=gLFTOP9qvqLjMQ175U3DBd7C6gUXLkNfI2LBd575gtZdHxyuQMMcQUq1rSGVbEfnOAeZp5DT36/GhLKZbY7lR97VDpx2Ass6WqSpHO010mSJ8yi4cL4ghyoMpEKyNfZelWZ5HOHqqafE4VoUQ44Y2/YheKWreKg7pxflX3VUasA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983011; c=relaxed/simple;
	bh=Ay8jRlRhMa11kVphSg2fA0IvQ6NnDAjbsAKjqz7HKks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CWaR3DhgDYnOUV54j0uELoViZSzUo7wZw1jVSeJIiLakM7ZZj5Hr4s4PdEqIg15dEcngDcC45S8ZY1icEileYE1wVDEb/yz/iNDo0xll7FtAoZRG1SD5U2rBgEMbhaj8Dx/FnfC0NSw6vkFhCJYeV/CRPWipn/ngmUdY0lfvTLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=LlybJ7M+; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=LG81Xy8a; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LlybJ7M+";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LG81Xy8a"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=enZw8stDcOdPph8kfKDf63ZaVueS30wf93Ur4ndtgr4=;
	b=LlybJ7M+QMA49jHT64OUTWXeg40fVFIaOHI+W/OadkcVV8AZuFaoD+3Fz256G8FUXmiZjl
	tBlsEnj7nRgqg48LXxEbALBjTh68dvujK2MJzB7IEBIeArABvcQkC/5xgK+Np+JJRkgaPB
	ggeov6PVkfjSuddZsA9cF8nEbap8srMRHjYUHmkGi1jOF+aibjCl8tAdIgQcmYyPB5JjrZ
	yyW2fhRcVGtx3oAFeguUhstLnK/e6nBknuwmNV/SlXCaQ8bkM8cU9zR61uAK7XGAROMvq/
	VNE2Yxb4/n6jw2YgD3KVvB2PsXza+kU1ztC5kR2/gWT/TlkrrPNzz0ClGMPKmg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=enZw8stDcOdPph8kfKDf63ZaVueS30wf93Ur4ndtgr4=;
	b=LG81Xy8ajLFyaoBs5zXCsCdavpMGcNvsvH6JLUcZckEP1HfGhh+yHP65ayuCYDb0Em2sNE
	jqZ0XJW4vIoR2JBg==
To: Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Christian Ludloff <ludloff@gmail.com>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>,
	x86@kernel.org,
	x86-cpuid@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	"Ahmed S. Darwish" <darwi@linutronix.de>
Subject: [PATCH v7 064/120] x86/process: Use parsed CPUID(0x5)
Date: Thu, 28 May 2026 17:38:26 +0200
Message-ID: <20260528153923.403473-65-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use parsed CPUID(0x5) instead of doing manual bitwise operations and a
direct CPUID query..

Remove the MWAIT_C1_SUBSTATE_MASK flag as it has no more users.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/mwait.h |  1 -
 arch/x86/kernel/process.c    | 10 ++++------
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/x86/include/asm/mwait.h b/arch/x86/include/asm/mwait.h
index e4815e15dc9a..40c827e7929e 100644
--- a/arch/x86/include/asm/mwait.h
+++ b/arch/x86/include/asm/mwait.h
@@ -13,7 +13,6 @@
 #define MWAIT_SUBSTATE_SIZE		4
 #define MWAIT_HINT2CSTATE(hint)		(((hint) >> MWAIT_SUBSTATE_SIZE) & MWAIT_CSTATE_MASK)
 #define MWAIT_HINT2SUBSTATE(hint)	((hint) & MWAIT_CSTATE_MASK)
-#define MWAIT_C1_SUBSTATE_MASK  0xf0
 
 #define CPUID5_ECX_EXTENSIONS_SUPPORTED 0x1
 #define CPUID5_ECX_INTERRUPT_BREAK	0x2
diff --git a/arch/x86/kernel/process.c b/arch/x86/kernel/process.c
index 4c718f8adc59..6c1a69dbc71f 100644
--- a/arch/x86/kernel/process.c
+++ b/arch/x86/kernel/process.c
@@ -876,34 +876,32 @@ void __noreturn stop_this_cpu(void *dummy)
 static __init bool prefer_mwait_c1_over_halt(void)
 {
 	const struct cpuinfo_x86 *c = &boot_cpu_data;
-	u32 eax, ebx, ecx, edx;
+	const struct leaf_0x5_0 *l5 = cpuid_leaf(c, 0x5);
 
 	/* If override is enforced on the command line, fall back to HALT. */
 	if (boot_option_idle_override != IDLE_NO_OVERRIDE)
 		return false;
 
 	/* MWAIT is not supported on this platform. Fallback to HALT */
-	if (!cpu_has(c, X86_FEATURE_MWAIT))
+	if (!cpu_has(c, X86_FEATURE_MWAIT) || !l5)
 		return false;
 
 	/* Monitor has a bug or APIC stops in C1E. Fallback to HALT */
 	if (boot_cpu_has_bug(X86_BUG_MONITOR) || boot_cpu_has_bug(X86_BUG_AMD_APIC_C1E))
 		return false;
 
-	cpuid(CPUID_LEAF_MWAIT, &eax, &ebx, &ecx, &edx);
-
 	/*
 	 * If MWAIT extensions are not available, it is safe to use MWAIT
 	 * with EAX=0, ECX=0.
 	 */
-	if (!(ecx & CPUID5_ECX_EXTENSIONS_SUPPORTED))
+	if (!l5->mwait_ext)
 		return true;
 
 	/*
 	 * If MWAIT extensions are available, there should be at least one
 	 * MWAIT C1 substate present.
 	 */
-	return !!(edx & MWAIT_C1_SUBSTATE_MASK);
+	return l5->n_c1_substates;
 }
 
 /*
-- 
2.54.0

