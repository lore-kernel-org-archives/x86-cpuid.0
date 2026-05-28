Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACE240242F
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983074; cv=none; b=pbXI6HqpgACjxGvyGV91/PKsuaL5he0UTzWxNkwh6fJ3YKNBWFyJcpbX/PJST+Oqd6rQ2/KwahK2jZA/7VHKIb7A8A5dClE1v/JFs5I8kxpy8S/ZTnxjP2/Ufhu/cOFSsfCT9bPvaKWdvHFKd40uPQdD11mCYocxynzjfv6vDmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983074; c=relaxed/simple;
	bh=NUOCGS99Vck8biaCr0xWLcUa5k7xD/Y6THW6wi3/q+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fwrfs/Lmf/RK1L5tdkihGFt+q15UWMWT7g07PU8fLDAl3W6Yj9wDNifckMQhHBaNur7jcUHFpA6PlyOEO1GWQlG4hF77ht2m1WJ24fMMxJHMp6mAp4SCpH1/Oau4P/0PgUrqOU0ji7qi0lUK4P3xZFF0e8NcUOvM9E++4hQoKKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xzUu2mtl; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GZIVkNnU; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xzUu2mtl";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GZIVkNnU"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mhCjCJni4mRVwiJTlRqiqt97Sj2p2flgvvbNsg5HUIc=;
	b=xzUu2mtlETX6cH75ur5q6oAL0L0gKLOeF4OFJIgzrtmAotWzrPVw0KDy+1lG9uYjQ51OAH
	3kUSPs5p2H8DQvg3TxbN4aSoEHGIGhq47K5C1i3bFRRXt0X87qhAwkvG2HoAtdWYdgxc88
	efEkcsJvqp/QEU1LeFvC7N/QEmQctLdRRUQIqSGAbHcUZzv+22z4F+978W1zIZDwbIGsp5
	qbnnWfwiVsy6Elr2HMI/LdNPdqo8Ee1hvplU96qLK62eNXYg9Wjt+uIpPM6eSNWyT1Jl0b
	vaQFscpwQaOfEXITpX7rTmEyvsdyFRafYS3DUMM4bEbvGpDAIuJSVvFFYMxvTQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mhCjCJni4mRVwiJTlRqiqt97Sj2p2flgvvbNsg5HUIc=;
	b=GZIVkNnUMs2/bepVkTY0GD1ZX8ROLveZuMeHUzwbGMqmYAUnCVk8+QPSZs79fSEGSVy8OJ
	0gwI19zJIlqs9wBw==
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
Subject: [PATCH v7 085/120] perf/x86/intel: Use parsed CPUID(0xa)
Date: Thu, 28 May 2026 17:38:47 +0200
Message-ID: <20260528153923.403473-86-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
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
index ea7507bb7047..53c614c61531 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -6612,10 +6612,11 @@ static __init void intel_arch_events_quirk(void)
 
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
@@ -6623,8 +6624,8 @@ static __init void intel_nehalem_quirk(void)
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
@@ -7558,15 +7559,13 @@ static __always_inline void intel_pmu_init_arw(struct pmu *pmu)
 
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
@@ -7590,27 +7589,29 @@ __init int intel_pmu_init(void)
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
@@ -7624,9 +7625,9 @@ __init int intel_pmu_init(void)
 		int assume = 3 * !boot_cpu_has(X86_FEATURE_HYPERVISOR);
 
 		x86_pmu.fixed_cntr_mask64 =
-			GENMASK_ULL(max((int)edx.split.num_counters_fixed, assume) - 1, 0);
+			GENMASK_ULL(max((int)leaf->num_counters_fixed, assume) - 1, 0);
 	} else if (version >= 5)
-		x86_pmu.fixed_cntr_mask64 = fixed_mask;
+		x86_pmu.fixed_cntr_mask64 = leaf->pmu_fcounters_bitmap;
 
 	if (boot_cpu_has(X86_FEATURE_PDCM)) {
 		u64 capabilities;
@@ -7648,7 +7649,7 @@ __init int intel_pmu_init(void)
 	x86_add_quirk(intel_arch_events_quirk); /* Install first, so it runs last */
 
 	if (version >= 5) {
-		x86_pmu.intel_cap.anythread_deprecated = edx.split.anythread_deprecated;
+		x86_pmu.intel_cap.anythread_deprecated = leaf->anythread_deprecation;
 		if (x86_pmu.intel_cap.anythread_deprecated)
 			pr_cont(" AnyThread deprecated, ");
 	}
-- 
2.54.0

