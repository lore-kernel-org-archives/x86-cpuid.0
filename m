Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F74481231
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983182; cv=none; b=Czo0Vrjl4I4aVG070jI0nbehEO7uXSuD5ZO+4aP8kVbE2xzkLYMdbSlGDEjkM3n3WB21xQC6W5j8RI4pSKAdVf0feEQ/dJ0rG53tM7AiWSYpWxpNaZ1ZSaUiAGXWuWl+JoyNLlB6bER1HcC5URpm2z/srOw1KwBYY2qqsQqmhPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983182; c=relaxed/simple;
	bh=W7U6wWe/I2+lT3vCDE2qREnRZ9fFkarc9o491wkV1xc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W2Ul8mB4WQqFlOEYeg7B6hKqH5yXdhClQlSivIKNMM5EJVycEf7v/fEJ7GFgT0f5xrGWm2DrBH2BkQHffGBeNxMoa3QhoErKp6qTSHyfPzb2M9juzAdPzU2QvH7OLOmdL9rdI57Jx7e3XYYiCYXG7ouYzkJoVcLTW6bPcbel91E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=z+CaIWz3; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=UNJ94m7J; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="z+CaIWz3";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="UNJ94m7J"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OCsDXxYBoKdnZ5dXB3QihAcAs8Sqv94XNjh5VkbTMPk=;
	b=z+CaIWz3QHqdpDY7NtcPPv2FgZJ9VNULwfL0oh4Y2rOpQlEXTNP1dCrc1bBbN5Io7EcH5b
	qnwTu44YZjgUfpdAQhfTQnfs9t2b1mQ29CMJSPXZi+TSRiFwpFlJRorVDEz+rKH1xGqVvX
	r5ZVkdnewdxgAMX1dzCM0r5RfBGwlzqASFbMaet/XzQGFb/jboxTTWsvz9i+8FzCIiDkUS
	siSTJJF34twfndWcG0auAMrbt10qbeVZcldp8ium6tS0nQXZcb73o9QWqu8bJC3F81p5FR
	4IFfeonEcqkW+JWX6J1bB+cbugI8/28Wg7PqKJsbmfzFj1dX2uXLqDh4V3Y0CA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OCsDXxYBoKdnZ5dXB3QihAcAs8Sqv94XNjh5VkbTMPk=;
	b=UNJ94m7JlxfwqscX7BS8wZGBk+6TauXqTaiUiUUh7zbNqut0jOoHjVWoTPMOl1YVrXqSDg
	HsyJcYbytUoHtuAg==
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
Subject: [PATCH v7 119/120] x86/cpu: Remove x86_capability[] and x86_power
Date: Thu, 28 May 2026 17:39:21 +0200
Message-ID: <20260528153923.403473-120-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

X86_FEATURE queries are now routed to the CPUID tables instead of to
x86_capability[].

x86_power call sites have all been converted to parsed CPUID(0x80000007)
access.

Remove x86_capability[] and x86_power from struct cpuinfo_x86.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/processor.h | 10 ----------
 arch/x86/kernel/asm-offsets.c    |  1 -
 arch/x86/kernel/cpu/common.c     |  5 -----
 arch/x86/kernel/head_32.S        |  2 --
 4 files changed, 18 deletions(-)

diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
index 70c414eab154..cdd6ba7e3e5c 100644
--- a/arch/x86/include/asm/processor.h
+++ b/arch/x86/include/asm/processor.h
@@ -158,15 +158,6 @@ struct cpuinfo_x86 {
 	__u32			extended_cpuid_level;
 	/* Maximum supported CPUID level, -1=no CPUID: */
 	int			cpuid_level;
-	/*
-	 * Align to size of unsigned long because the x86_capability array
-	 * is passed to bitops which require the alignment. Use unnamed
-	 * union to enforce the array is aligned to size of unsigned long.
-	 */
-	union {
-		__u32		x86_capability[NCAPINTS + NBUGINTS];
-		unsigned long	x86_capability_alignment;
-	};
 	char			x86_vendor_id[16];
 	char			x86_model_id[64];
 	struct cpuinfo_topology	topo;
@@ -178,7 +169,6 @@ struct cpuinfo_x86 {
 	int			x86_cache_max_rmid;	/* max index */
 	int			x86_cache_occ_scale;	/* scale to bytes */
 	int			x86_cache_mbm_width_offset;
-	int			x86_power;
 	unsigned long		loops_per_jiffy;
 	/* protected processor identification number */
 	u64			ppin;
diff --git a/arch/x86/kernel/asm-offsets.c b/arch/x86/kernel/asm-offsets.c
index 0bc36d617801..98d2cd03d0af 100644
--- a/arch/x86/kernel/asm-offsets.c
+++ b/arch/x86/kernel/asm-offsets.c
@@ -38,7 +38,6 @@ static void __used common(void)
 	OFFSET(CPUINFO_x86_model, cpuinfo_x86, x86_model);
 	OFFSET(CPUINFO_x86_stepping, cpuinfo_x86, x86_stepping);
 	OFFSET(CPUINFO_cpuid_level, cpuinfo_x86, cpuid_level);
-	OFFSET(CPUINFO_x86_capability, cpuinfo_x86, x86_capability);
 	OFFSET(CPUINFO_x86_vendor_id, cpuinfo_x86, x86_vendor_id);
 	DEFINE(CPUINFO_CPUID_0x1_EDX,
 	       offsetof(struct cpuinfo_x86, cpuid)		+
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 08e7c44dbc77..8c52503ae360 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -1729,7 +1729,6 @@ static void __init cpu_parse_early_param(void)
  */
 static void __init early_identify_cpu(struct cpuinfo_x86 *c)
 {
-	memset(&c->x86_capability, 0, sizeof(c->x86_capability));
 	memset(&c->cpuid, 0, sizeof(c->cpuid));
 	c->extended_cpuid_level = 0;
 
@@ -1961,7 +1960,6 @@ static void identify_cpu(struct cpuinfo_x86 *c)
 	c->x86_virt_bits = 32;
 #endif
 	c->x86_cache_alignment = c->x86_clflush_size;
-	memset(&c->x86_capability, 0, sizeof(c->x86_capability));
 	memset(&c->cpuid, 0, sizeof(c->cpuid));
 #ifdef CONFIG_X86_VMX_FEATURE_NAMES
 	memset(&c->vmx_capability, 0, sizeof(c->vmx_capability));
@@ -1989,9 +1987,6 @@ static void identify_cpu(struct cpuinfo_x86 *c)
 	 * features a certain CPU supports which CPUID doesn't
 	 * tell us, CPUID claiming incorrect flags, or other bugs,
 	 * we handle them here.
-	 *
-	 * At the end of this section, c->x86_capability better
-	 * indicate the features this CPU genuinely supports!
 	 */
 	if (this_cpu->c_init)
 		this_cpu->c_init(c);
diff --git a/arch/x86/kernel/head_32.S b/arch/x86/kernel/head_32.S
index 9c96fdf66aa9..8e90999fbf5b 100644
--- a/arch/x86/kernel/head_32.S
+++ b/arch/x86/kernel/head_32.S
@@ -41,7 +41,6 @@
 #define X86_STEPPING	new_cpu_data+CPUINFO_x86_stepping
 #define X86_HARD_MATH	new_cpu_data+CPUINFO_hard_math
 #define X86_CPUID	new_cpu_data+CPUINFO_cpuid_level
-#define X86_CAPABILITY	new_cpu_data+CPUINFO_x86_capability
 #define X86_VENDOR_ID	new_cpu_data+CPUINFO_x86_vendor_id
 #define X86_FEATUREFLAG	new_cpu_data+CPUINFO_CPUID_0x1_EDX
 
@@ -263,7 +262,6 @@ SYM_FUNC_START(startup_32_smp)
 	movb %al,X86_MODEL
 	andb $0x0f,%cl		# mask mask revision
 	movb %cl,X86_STEPPING
-	movl %edx,X86_CAPABILITY
 	movl %edx,X86_FEATUREFLAG
 
 .Lis486:
-- 
2.54.0

