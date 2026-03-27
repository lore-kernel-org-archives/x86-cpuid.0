Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA8733E358
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774578048; cv=none; b=X2kcP00WUgY2zGjSkORbgMVuOMNc8Y8wHFN7n1eOP5KJ85G2JGVK4ODsYeHYLXSk5GzCJMaqF//fKdX6uL259ThyennYIfwuMjpX6exBNzo8fYMmyDwYOppMuoAGPcbNaOJxSz/wmoYvGwH45Dsg7jz+jULoljsLbBQroPh+CUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774578048; c=relaxed/simple;
	bh=BAtrVKMVi846Ie6chOl8KFQS2IufHw/jv9kl0xAXZcA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zuvk+EhyU32sqmABKbLSVQDmsO1adl7GFuDaJNVomZXAtnIUO0WPUjw+RkdLbCy5rqmLLs9V+9aV2ykneW92qgzM/zTIdJ/mYErOmhz3NyLBylDgV+/tAHK9eHR4hB63G8bYGl/q1tR1eO06vgMwwPbk2cl8u4IuHhuZnm8aWpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=KKrsq9Ar; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=j2zXp7Ta; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KKrsq9Ar";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="j2zXp7Ta"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774578043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L6IhjQkwIqi8FH44qYfqOqFMRg8JhPc5lRljpQEpfb8=;
	b=KKrsq9Argr+YAGqnkhqYakJuZJJ8OrJ4WXJJouPLDj5l/2PqqNQN8rHUj7Pt6hUhD8j015
	OGVck7X0uuMxNKUa2O0FZlw9AXRz8fimF67SlB0zaJCDvgzsImILMfAh9LiIBZ/HcyIo8+
	wmDbJxFaAfG96DIxg7vzeGyDGniZUo3L/2gn6Ydm2szd49TDo/o0dtZx0M2Mr88gY/cNuB
	v/cTtmJCHxBVQGMWiwlK10WoMfcXUl7Mx2uQSesYV6yGwcsNzLBjWQZyM8G3Gev7Q01j1M
	3W9UFwm7NzQ5/sDLcbrc02X0WNRQK0TcTWMfcY9G1ZJYG40ppD8cFviNVdeK7g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774578043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L6IhjQkwIqi8FH44qYfqOqFMRg8JhPc5lRljpQEpfb8=;
	b=j2zXp7Tax76cK0wClJ1q4qRYBuTwstKYTABcTSPLc1TA9cNO91Yqtd5v4aQjNYEpCVpk0C
	HLPt2OcJ8Fesy3AA==
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
Subject: [PATCH v6 55/90] perf/x86/intel: Use parsed CPUID(0xa)
Date: Fri, 27 Mar 2026 03:16:09 +0100
Message-ID: <20260327021645.555257-56-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For Intel perfmon, use parsed CPUID(0xa) instead of issuing CPUID queries
and defining custom CPUID output data types.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/events/intel/core.c | 41 ++++++++++++++++++------------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index d1107129d5ad..20dece48b994 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -6577,10 +6577,11 @@ static __init void intel_arch_events_quirk(void)
 
 static __init void intel_nehalem_quirk(void)
 {
-	union cpuid10_ebx ebx;
+	struct leaf_0xa_0 l = { };
+	struct cpuid_regs *regs = (struct cpuid_regs *)&l;
 
-	ebx.full = x86_pmu.events_maskl;
-	if (ebx.split.no_branch_misses_retired) {
+	regs->ebx = x86_pmu.events_maskl;
+	if (l.no_br_misses_retired) {
 		/*
 		 * Erratum AAJ80 detected, we work it around by using
 		 * the BR_MISP_EXEC.ANY event. This will over-count
@@ -6588,8 +6589,8 @@ static __init void intel_nehalem_quirk(void)
 		 * architectural event which is often completely bogus:
 		 */
 		intel_perfmon_event_map[PERF_COUNT_HW_BRANCH_MISSES] = 0x7f89;
-		ebx.split.no_branch_misses_retired = 0;
-		x86_pmu.events_maskl = ebx.full;
+		l.no_br_misses_retired = 0;
+		x86_pmu.events_maskl = regs->ebx;
 		pr_info("CPU erratum AAJ80 worked around\n");
 	}
 }
@@ -7522,15 +7523,13 @@ static __always_inline void intel_pmu_init_arw(struct pmu *pmu)
 
 __init int intel_pmu_init(void)
 {
+	const struct cpuid_regs *regs = cpuid_leaf_raw(&boot_cpu_data, 0xa);
+	const struct leaf_0xa_0 *leaf = cpuid_leaf(&boot_cpu_data, 0xa);
 	struct attribute **extra_skl_attr = &empty_attrs;
 	struct attribute **extra_attr = &empty_attrs;
 	struct attribute **td_attr    = &empty_attrs;
 	struct attribute **mem_attr   = &empty_attrs;
 	struct attribute **tsx_attr   = &empty_attrs;
-	union cpuid10_edx edx;
-	union cpuid10_eax eax;
-	union cpuid10_ebx ebx;
-	unsigned int fixed_mask;
 	bool pmem = false;
 	int version, i;
 	char *name;
@@ -7554,27 +7553,29 @@ __init int intel_pmu_init(void)
 		return -ENODEV;
 	}
 
+	if (!leaf || !regs)
+		return -ENODEV;
+
 	/*
 	 * Check whether the Architectural PerfMon supports
 	 * Branch Misses Retired hw_event or not.
 	 */
-	cpuid(10, &eax.full, &ebx.full, &fixed_mask, &edx.full);
-	if (eax.split.mask_length < ARCH_PERFMON_EVENTS_COUNT)
+	if (leaf->events_mask_len < ARCH_PERFMON_EVENTS_COUNT)
 		return -ENODEV;
 
-	version = eax.split.version_id;
+	version = leaf->pmu_version;
 	if (version < 2)
 		x86_pmu = core_pmu;
 	else
 		x86_pmu = intel_pmu;
 
 	x86_pmu.version			= version;
-	x86_pmu.cntr_mask64		= GENMASK_ULL(eax.split.num_counters - 1, 0);
-	x86_pmu.cntval_bits		= eax.split.bit_width;
-	x86_pmu.cntval_mask		= (1ULL << eax.split.bit_width) - 1;
+	x86_pmu.cntr_mask64		= GENMASK_ULL(leaf->num_counters_gp - 1, 0);
+	x86_pmu.cntval_bits		= leaf->bit_width_gp;
+	x86_pmu.cntval_mask		= (1ULL << leaf->bit_width_gp) - 1;
 
-	x86_pmu.events_maskl		= ebx.full;
-	x86_pmu.events_mask_len		= eax.split.mask_length;
+	x86_pmu.events_maskl		= regs->ebx;
+	x86_pmu.events_mask_len		= leaf->events_mask_len;
 
 	x86_pmu.pebs_events_mask	= intel_pmu_pebs_mask(x86_pmu.cntr_mask64);
 	x86_pmu.pebs_capable		= PEBS_COUNTER_MASK;
@@ -7588,9 +7589,9 @@ __init int intel_pmu_init(void)
 		int assume = 3 * !boot_cpu_has(X86_FEATURE_HYPERVISOR);
 
 		x86_pmu.fixed_cntr_mask64 =
-			GENMASK_ULL(max((int)edx.split.num_counters_fixed, assume) - 1, 0);
+			GENMASK_ULL(max((int)leaf->num_counters_fixed, assume) - 1, 0);
 	} else if (version >= 5)
-		x86_pmu.fixed_cntr_mask64 = fixed_mask;
+		x86_pmu.fixed_cntr_mask64 = leaf->pmu_fcounters_bitmap;
 
 	if (boot_cpu_has(X86_FEATURE_PDCM)) {
 		u64 capabilities;
@@ -7612,7 +7613,7 @@ __init int intel_pmu_init(void)
 	x86_add_quirk(intel_arch_events_quirk); /* Install first, so it runs last */
 
 	if (version >= 5) {
-		x86_pmu.intel_cap.anythread_deprecated = edx.split.anythread_deprecated;
+		x86_pmu.intel_cap.anythread_deprecated = leaf->anythread_deprecation;
 		if (x86_pmu.intel_cap.anythread_deprecated)
 			pr_cont(" AnyThread deprecated, ");
 	}
-- 
2.53.0

