Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFA047A0DB
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983096; cv=none; b=jm9cx2xYpGLzUN/h9L+xbKnVV13StYEqYgYnftlX75LOY4YhzLyqZDKMZnVI4e/sTtZhVJMt6FWF3G9Ev8n7VSFhiJ5rjSd2jjm19GW4/tNQ9EoZ5S+yS1MzdbC+wtPI3LB9uqWckRuW56cyPsTPqtIX9mk73XGs1UhEd1YfIuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983096; c=relaxed/simple;
	bh=ePXl5vv82gnhcqr/N8k4LBUE6iQTrlx9g2cyD4BSOXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IQTb4h4Uqf2S9BQoAht0YDlNJTAtn6Q4FSEVhJ2gtXkq9ZQ0ZHSE4MrKiPy8qAacKmlT9zhVwf6efmuh1i4S8uZ3Cxd+2Zn9aIPFk/9a0VERz1jSVvSYdchMAgBpKACLzTCf24gaaxTGveR9leqc4BYqJwR06jIdVVuiulEcA0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=czKl0Vpn; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wKzyyNgG; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="czKl0Vpn";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wKzyyNgG"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e25+zWiMK424bRvB3b2r/6PxBzokv8pdpLpq3y3ZxY4=;
	b=czKl0VpntEvIEwvp51100ztteRetyQCtEdByxGZDPNdK9v6jVEokh4XHCWEYPb8Aofy+AL
	NBn9bUWS5EpeuRBa2s8aWXxULWoEHGxkvC5WdPtm1gY0ZmWVxWiqXEgatSI3b37hs90OSQ
	5xy3Kt3taSktk6hCa5QjQBCnWqFg5+Yvvhh2R4GHLM+JbNGpNRzeGMT3n9v9l6bfBJ9gF/
	LwJX5V/wyPiBIhNSXwWknqgMU/aceiI1n0pBGDNYYNrpoln4iB8pgIYtyEI9Pu26dZbVap
	rQoS8UV9V5Jy/1xW4myokV6sfk2H8kqCCOhP1stl26Udlc/4vHpXj/cfSjJWKw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e25+zWiMK424bRvB3b2r/6PxBzokv8pdpLpq3y3ZxY4=;
	b=wKzyyNgGKss9mG9YZAtjF836cFO0c7HygfJa/v21bcYt3Z8mHKVNPy94VxysH4A15RZh5X
	Cqd2HMwRehu0yUDA==
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
Subject: [PATCH v7 091/120] perf/x86/lbr: Use parsed CPUID(0x1c)
Date: Thu, 28 May 2026 17:38:53 +0200
Message-ID: <20260528153923.403473-92-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use parsed CPUID(0x1c) instead of a direct CPUID query and custom perf
CPUID(0x1c) data types.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/events/intel/lbr.c | 33 +++++++++++++++------------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/arch/x86/events/intel/lbr.c b/arch/x86/events/intel/lbr.c
index cae2e02fe6cc..7bc48f5e5e52 100644
--- a/arch/x86/events/intel/lbr.c
+++ b/arch/x86/events/intel/lbr.c
@@ -1587,19 +1587,16 @@ static bool is_arch_lbr_xsave_available(void)
 
 void __init intel_pmu_arch_lbr_init(void)
 {
+	const struct leaf_0x1c_0 *l = cpuid_leaf(&boot_cpu_data, 0x1c);
 	struct pmu *pmu = x86_get_pmu(smp_processor_id());
-	union cpuid28_eax eax;
-	union cpuid28_ebx ebx;
-	union cpuid28_ecx ecx;
-	unsigned int unused_edx;
 	bool arch_lbr_xsave;
 	size_t size;
 	u64 lbr_nr;
 
-	/* Arch LBR Capabilities */
-	cpuid(28, &eax.full, &ebx.full, &ecx.full, &unused_edx);
+	if (!l)
+		goto clear_arch_lbr;
 
-	lbr_nr = fls(eax.split.lbr_depth_mask) * 8;
+	lbr_nr = fls(l->lbr_depth_mask) * 8;
 	if (!lbr_nr)
 		goto clear_arch_lbr;
 
@@ -1607,17 +1604,17 @@ void __init intel_pmu_arch_lbr_init(void)
 	if (wrmsrq_safe(MSR_ARCH_LBR_DEPTH, lbr_nr))
 		goto clear_arch_lbr;
 
-	x86_pmu.lbr_depth_mask = eax.split.lbr_depth_mask;
-	x86_pmu.lbr_deep_c_reset = eax.split.lbr_deep_c_reset;
-	x86_pmu.lbr_lip = eax.split.lbr_lip;
-	x86_pmu.lbr_cpl = ebx.split.lbr_cpl;
-	x86_pmu.lbr_filter = ebx.split.lbr_filter;
-	x86_pmu.lbr_call_stack = ebx.split.lbr_call_stack;
-	x86_pmu.lbr_mispred = ecx.split.lbr_mispred;
-	x86_pmu.lbr_timed_lbr = ecx.split.lbr_timed_lbr;
-	x86_pmu.lbr_br_type = ecx.split.lbr_br_type;
-	x86_pmu.lbr_counters = ecx.split.lbr_counters;
-	x86_pmu.lbr_nr = lbr_nr;
+	x86_pmu.lbr_depth_mask		= l->lbr_depth_mask;
+	x86_pmu.lbr_deep_c_reset	= l->lbr_deep_c_reset;
+	x86_pmu.lbr_lip			= l->lbr_ip_is_lip;
+	x86_pmu.lbr_cpl			= l->lbr_cpl;
+	x86_pmu.lbr_filter		= l->lbr_branch_filter;
+	x86_pmu.lbr_call_stack		= l->lbr_call_stack;
+	x86_pmu.lbr_mispred		= l->lbr_mispredict;
+	x86_pmu.lbr_timed_lbr		= l->lbr_timed_lbr;
+	x86_pmu.lbr_br_type		= l->lbr_branch_type;
+	x86_pmu.lbr_counters		= l->lbr_events_gpc_bmp;
+	x86_pmu.lbr_nr			= lbr_nr;
 
 	if (!!x86_pmu.lbr_counters)
 		x86_pmu.flags |= PMU_FL_BR_CNTR | PMU_FL_DYN_CONSTRAINT;
-- 
2.54.0

