Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE55393DDC
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774578164; cv=none; b=c+bznyaUXhGMFbDESWN6mqRcB9I2D6OiSRYZcmMgVgew1vU448qnPuU/RhgLqU2ZppdjglaDLJB18Xvwf7PwxwzcsSczyOk9ncNBLPaUlZY1qBPOoZQX0fAfMbh+G4JSjb74oyirBp8w96lJKl51F3cp71L0m8McgnFSVlgtFaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774578164; c=relaxed/simple;
	bh=848d03O4fqGkPw8RNKK0B5rZdud1fHSIT/vsGY/eySI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lT9sZMB8RSnbS1D4/BeD2pq3hWPEReYtkODXOiygv/nZ91GHHJyn0xMIn40XUDmQaqRR2FfPguM8jAfT8IH8XSVR2R4TUj4Sl6l2C2+iNe/gcL+yy5LtzTucvb48PmUyidi9trsnjh6g290JbsUYIz1aCz6EnprlQplWRlBGbTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BvVVceFI; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wWkdcO7m; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BvVVceFI";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wWkdcO7m"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774578160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9dkS9uSyMgO/9YEi0dhzEZ5jY0wmaplyfiAhz43RAAc=;
	b=BvVVceFIHrrWxPJdOMHKyP/QHZMumb88Z+VKLl3Ezi/bFVosUoMfJNF7dj8KE/YUCVQjmb
	gSJ1EwEWCg8JodibVaoL5cx09F/0YvbWVxqQa8sdBFIOqMy2MJx456/q4rV4Pai+hBn8xq
	NxYNDxX+VSzCDlTcgr43JXsw6XMk61N8iCI3TtDQZr/b7ICZnTXDV8H1T+MAP4Oj2w/tUH
	HZ+/NAvsNN6dVi4bevuiyW2u82YTiJYhmcwGeHO2t3kT9kn8MtRxrloDU4RjKa8BUe5CxY
	A+36oK+UvyvO/HaJaCBs9JydKQSZISkvNByimiGCfVOQXJ537chXS6yXB/Nwgw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774578160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9dkS9uSyMgO/9YEi0dhzEZ5jY0wmaplyfiAhz43RAAc=;
	b=wWkdcO7mq9fVkmHoddPvSTdYUmvF06KEJfYZx51R1Gummkuoj2SO1TMmCo9PyByiimBnjn
	fviPeA+smZaLVKCw==
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
Subject: [PATCH v6 89/90] x86/cpu: Remove x86_capability[] and x86_power
Date: Fri, 27 Mar 2026 03:16:43 +0100
Message-ID: <20260327021645.555257-90-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
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
index 5ee0dcbd548c..b5c89229d9a2 100644
--- a/arch/x86/include/asm/processor.h
+++ b/arch/x86/include/asm/processor.h
@@ -153,15 +153,6 @@ struct cpuinfo_x86 {
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
@@ -173,7 +164,6 @@ struct cpuinfo_x86 {
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
index 4c2739f31e3d..a5e94f09c5dd 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -1727,7 +1727,6 @@ static void __init cpu_parse_early_param(void)
  */
 static void __init early_identify_cpu(struct cpuinfo_x86 *c)
 {
-	memset(&c->x86_capability, 0, sizeof(c->x86_capability));
 	memset(&c->cpuid, 0, sizeof(c->cpuid));
 	c->extended_cpuid_level = 0;
 
@@ -1959,7 +1958,6 @@ static void identify_cpu(struct cpuinfo_x86 *c)
 	c->x86_virt_bits = 32;
 #endif
 	c->x86_cache_alignment = c->x86_clflush_size;
-	memset(&c->x86_capability, 0, sizeof(c->x86_capability));
 	memset(&c->cpuid, 0, sizeof(c->cpuid));
 #ifdef CONFIG_X86_VMX_FEATURE_NAMES
 	memset(&c->vmx_capability, 0, sizeof(c->vmx_capability));
@@ -1987,9 +1985,6 @@ static void identify_cpu(struct cpuinfo_x86 *c)
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
index 6dcc27014641..7f38331ee083 100644
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
2.53.0

