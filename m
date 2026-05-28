Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C1F3FF893
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983019; cv=none; b=m5WCGE18/Gj0LP0Fs99tDvRyjF5P+WSss1oW7WnbqyBrFyTXN5Cps8nb6etSLczjERVMDCs2esJ1/klJun9xJD2gq0p7SBGM9qnr77Dx44oBNSQf7odJXkaU/bUCPAanQBmXDAxhL/feb3+KYjJqMHIij5JfxB3R50wwjQhgj2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983019; c=relaxed/simple;
	bh=oJbzE3XXdZOz0MA1OWa2Z/1p1LG8DGkZdXZAzMjz/bg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e67wnbLkFHPq3La8cl3b6FX+/46q0uuxTPP84Jm7FhjBublHsDCJEwnVoLj7zjLgb6SXyvKvKrdarWwHVWb0JrtzKX1qTTmEopO/+Qi6kHCiuPdfP3R9hEgUeJ3aKww+mPVoe+jcVmzS26jEjrRc/jOgGUignhE8OceHVR+NB1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ICkY8O80; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GfxxnY56; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ICkY8O80";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GfxxnY56"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xaROBArRkuazSJcno8u12j6VwuHC1hoJddM5EQabGF4=;
	b=ICkY8O80+MbcLSPkALrBIesUK/wpWplATWuWNAfsYytn/wISqj/zL6x6xrSSJeI9A9ZWJX
	ND6NyDaFAQNxWGljgKwa4zxTBdzGoFEeizxRDa8eqGG6cz/KYGRvWitODLCHULTjvgK7oB
	6yxHkLJflZt4v7R4JhMQlMJhOzyayFIuO2vlSvxuHaytXnPgHWd8JFdYxYgicYSYaxbFK6
	DlDQ4wDvezOQakId6yplnsWh73wCnEotun0BP6yfHPcmmaeJ+qj6FYXD5KX6NmcFxb7sP2
	0RHQ0ZWfkMITdsJau0h21lwbXLcPdoWTPTp1FziXVYkWSxH8fyA/auGSg+6S2A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xaROBArRkuazSJcno8u12j6VwuHC1hoJddM5EQabGF4=;
	b=GfxxnY56kWD9qRMIFLMKazCEVn33UNYPb0yd4duZ4ZsjW43IWY5K0MBf0vtfiOAv1WITcq
	pIE2KDoEQs/4j8Cg==
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
Subject: [PATCH v7 067/120] intel_idle: Use parsed CPUID(0x5)
Date: Thu, 28 May 2026 17:38:29 +0200
Message-ID: <20260528153923.403473-68-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use parsed CPUID(0x5), plus CPUID(0x5) APIs, instead of doing ugly bitwise
operations and a direct CPUID query.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 drivers/idle/intel_idle.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/idle/intel_idle.c b/drivers/idle/intel_idle.c
index f49354e37777..e1cf5ed4b995 100644
--- a/drivers/idle/intel_idle.c
+++ b/drivers/idle/intel_idle.c
@@ -113,12 +113,11 @@ static struct device *sysfs_root __initdata;
 
 static const struct idle_cpu *icpu __initdata;
 static struct cpuidle_state *cpuidle_state_table __initdata;
+static const struct leaf_0x5_0 *mwait_leaf __initdata;
 
 /* C-states data from the 'intel_idle.table' cmdline parameter */
 static struct cpuidle_state cmdline_states[CPUIDLE_STATE_MAX] __initdata;
 
-static unsigned int mwait_substates __initdata;
-
 /*
  * Enable interrupts before entering the C-state. On some platforms and for
  * some C-states, this may measurably decrease interrupt latency.
@@ -2047,7 +2046,7 @@ static void __init sklh_idle_state_table_update(void)
 		return;
 
 	/* if PC10 not present in CPUID.MWAIT.EDX */
-	if ((mwait_substates & (0xF << 28)) == 0)
+	if (mwait_leaf->n_c7_substates == 0)
 		return;
 
 	rdmsrq(MSR_PKG_CST_CONFIG_CONTROL, msr);
@@ -2135,10 +2134,8 @@ static void __init byt_cht_auto_demotion_disable(void)
 
 static bool __init intel_idle_verify_cstate(unsigned int mwait_hint)
 {
-	unsigned int mwait_cstate = (MWAIT_HINT2CSTATE(mwait_hint) + 1) &
-					MWAIT_CSTATE_MASK;
-	unsigned int num_substates = (mwait_substates >> mwait_cstate * 4) &
-					MWAIT_SUBSTATE_MASK;
+	unsigned int mwait_cstate = (MWAIT_HINT2CSTATE(mwait_hint) + 1) & MWAIT_CSTATE_MASK;
+	unsigned int num_substates = cpuid_mwait_n_substates(mwait_leaf, mwait_cstate);
 
 	/* Ignore the C-state if there are NO sub-states in CPUID for it. */
 	if (num_substates == 0)
@@ -2641,8 +2638,8 @@ static void __init cmdline_table_adjust(struct cpuidle_driver *drv)
 
 static int __init intel_idle_init(void)
 {
+	const struct cpuid_regs *mwait_leaf_raw;
 	const struct x86_cpu_id *id;
-	unsigned int eax, ebx, ecx;
 	int retval;
 
 	/* Do not load intel_idle at all for now if idle= is passed */
@@ -2666,14 +2663,15 @@ static int __init intel_idle_init(void)
 			return -ENODEV;
 	}
 
-	cpuid(CPUID_LEAF_MWAIT, &eax, &ebx, &ecx, &mwait_substates);
+	mwait_leaf = cpuid_leaf(&boot_cpu_data, 0x5);
+	if (!mwait_leaf || !mwait_leaf->mwait_ext || !mwait_leaf->mwait_irq_break)
+		return -ENODEV;
 
-	if (!(ecx & CPUID5_ECX_EXTENSIONS_SUPPORTED) ||
-	    !(ecx & CPUID5_ECX_INTERRUPT_BREAK) ||
-	    !mwait_substates)
-			return -ENODEV;
+	mwait_leaf_raw = cpuid_leaf_raw(&boot_cpu_data, 0x5);
+	if (!mwait_leaf_raw || !mwait_leaf_raw->edx)
+		return -ENODEV;
 
-	pr_debug("MWAIT substates: 0x%x\n", mwait_substates);
+	pr_debug("MWAIT substates: 0x%x\n", mwait_leaf_raw->edx);
 
 	icpu = (const struct idle_cpu *)id->driver_data;
 	if (icpu && ignore_native()) {
-- 
2.54.0

