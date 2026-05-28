Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE91247B403
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983107; cv=none; b=E0axGKOGzs2pJNkaiQFlzoSMTYtGpQUAldT8EbmVaNMobx9Wo0dSvp1puEWTj4S4rhQ398vmS5Yg6wRaFu2wtYOLmXgmdbmjbchigVAMjKmHycAhXtQuHyuFcDz9ib+Mk3uemzkJl/oVRmx+njs9VSuetpG3HQPh2iET6urOeu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983107; c=relaxed/simple;
	bh=PLwbz1v8EDRcQ8a3v8SRnErGjeGdEeiS/RYfP97t/KE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VJMMZ+HMasGqquW1g2RENUVMvzfDOCUJnN2oUlTcOmQrGzLppyKL3mNovK5neYaC4vfeVyr+u3TOhh2TQwA9s8SQQtpYCFBe2FCYk/3UdI8VFTYuqku0YpTx+z53H2rivHhc+fz3q3deUcY69nlnJ89djqNh/YjgUqIvw4BEX1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Z68lnBqk; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=b0NLFhu+; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Z68lnBqk";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="b0NLFhu+"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hDnA2M3jSSM0SmRpPh8nZgNIuIo7ocPnD9bEREQCtX8=;
	b=Z68lnBqkutE6yzLvqvP36fvkjLnrFw9OW1JE9UkSviogyEBdUbh78uru8s6jMerQZlCnNX
	xjah8h87L10BeBBAVnVPVTWcCd7GLT8C/uEUKyAOZmekRk5Wf8NS8wBLyc5k8SUIrRlG3x
	tmzI2dUQ32h0BfB0D3bpPjG0V85CSkssAahQlrO5kWtJdT0t/fgv2ReJBnJm214v7MCdG0
	rhTKG8Y3C03tVJm7gGLxNgpiseQEX47g0C19oSwzB4jfYdA9cvLeQlv0Qeh/DTdMoprBAI
	vHkVOZY1tZnsfm6MoeO/4OksFEXFmbsC2OqextEP1QOtmXRVz7nzP7MBlR2uhw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hDnA2M3jSSM0SmRpPh8nZgNIuIo7ocPnD9bEREQCtX8=;
	b=b0NLFhu+4FfvpojHJkyVDa8U5hdHbTZOy7FJMrlOL0ui8U/LE+vX1+4nUZAwJzu7o+Knav
	JY9A/J7FCySewZCg==
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
Subject: [PATCH v7 094/120] perf/x86/intel: Use parsed per-CPU CPUID(0x23)
Date: Thu, 28 May 2026 17:38:56 +0200
Message-ID: <20260528153923.403473-95-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For Intel PMU capabilities, use parsed CPUID(0x23) instead of direct CPUID
queries and custom perf CPUID(0x23) data types.

Replace manual subleaves availability checks with checking whether the
CPUID APIs return NULL.  This is sufficient since the CPUID parser
validates all the leaves and subleaves beforehand.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/events/intel/core.c | 62 +++++++++++++++++-------------------
 1 file changed, 30 insertions(+), 32 deletions(-)

diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index 53c614c61531..2effa7269c3c 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -5926,51 +5926,49 @@ static inline void __intel_update_large_pebs_flags(struct pmu *pmu)
 
 #define counter_mask(_gp, _fixed) ((_gp) | ((u64)(_fixed) << INTEL_PMC_IDX_FIXED))
 
-static void update_pmu_cap(struct pmu *pmu)
-{
-	unsigned int eax, ebx, ecx, edx;
-	union cpuid35_eax eax_0;
-	union cpuid35_ebx ebx_0;
+static void update_pmu_cap(struct pmu *pmu, int cpu)
+{
+	struct cpuinfo_x86 *cpuinfo = is_hybrid() ? &cpu_data(cpu) : &boot_cpu_data;
+	const struct leaf_0x23_0 *sl0 = cpuid_subleaf(cpuinfo, 0x23, 0);
+	const struct leaf_0x23_1 *sl1 = cpuid_subleaf(cpuinfo, 0x23, 1);
+	const struct leaf_0x23_2 *sl2 = cpuid_subleaf(cpuinfo, 0x23, 2);
+	const struct leaf_0x23_4 *sl4 = cpuid_subleaf(cpuinfo, 0x23, 4);
+	const struct leaf_0x23_5 *sl5 = cpuid_subleaf(cpuinfo, 0x23, 5);
+	u64 pdists_mask = 0;
 	u64 cntrs_mask = 0;
 	u64 pebs_mask = 0;
-	u64 pdists_mask = 0;
 
-	cpuid(ARCH_PERFMON_EXT_LEAF, &eax_0.full, &ebx_0.full, &ecx, &edx);
+	if (!sl0)
+		return;
 
-	if (ebx_0.split.umask2)
+	if (sl0->unitmask2)
 		hybrid(pmu, config_mask) |= ARCH_PERFMON_EVENTSEL_UMASK2;
-	if (ebx_0.split.eq)
+	if (sl0->eq)
 		hybrid(pmu, config_mask) |= ARCH_PERFMON_EVENTSEL_EQ;
-	if (ebx_0.split.rdpmc_user_disable)
+	if (sl0->rdpmc_user_disable)
 		hybrid(pmu, config_mask) |= ARCH_PERFMON_EVENTSEL_RDPMC_USER_DISABLE;
 
-	if (eax_0.split.cntr_subleaf) {
-		cpuid_count(ARCH_PERFMON_EXT_LEAF, ARCH_PERFMON_NUM_COUNTER_LEAF,
-			    &eax, &ebx, &ecx, &edx);
-		hybrid(pmu, cntr_mask64) = eax;
-		hybrid(pmu, fixed_cntr_mask64) = ebx;
-		cntrs_mask = counter_mask(eax, ebx);
+	if (sl1) {
+		hybrid(pmu, cntr_mask64) = sl1->gp_counters;
+		hybrid(pmu, fixed_cntr_mask64) = sl1->fixed_counters;
+		cntrs_mask = counter_mask(sl1->gp_counters, sl1->fixed_counters);
 	}
 
-	if (eax_0.split.acr_subleaf) {
-		cpuid_count(ARCH_PERFMON_EXT_LEAF, ARCH_PERFMON_ACR_LEAF,
-			    &eax, &ebx, &ecx, &edx);
+	if (sl2) {
 		/* The mask of the counters which can be reloaded */
-		hybrid(pmu, acr_cntr_mask64) = counter_mask(eax, ebx);
+		hybrid(pmu, acr_cntr_mask64) = counter_mask(sl2->acr_gp_reload, sl2->acr_fixed_reload);
 		/* The mask of the counters which can cause a reload of reloadable counters */
-		hybrid(pmu, acr_cause_mask64) = counter_mask(ecx, edx);
+		hybrid(pmu, acr_cause_mask64) = counter_mask(sl2->acr_gp_trigger, sl2->acr_fixed_trigger);
 	}
 
-	/* Bits[5:4] should be set simultaneously if arch-PEBS is supported */
-	if (eax_0.split.pebs_caps_subleaf && eax_0.split.pebs_cnts_subleaf) {
-		cpuid_count(ARCH_PERFMON_EXT_LEAF, ARCH_PERFMON_PEBS_CAP_LEAF,
-			    &eax, &ebx, &ecx, &edx);
-		hybrid(pmu, arch_pebs_cap).caps = (u64)ebx << 32;
+	/* Both subleaves should be available if arch-PEBS is supported */
+	if (sl4 && sl5) {
+		const struct cpuid_regs *sl4_regs = (const struct cpuid_regs *)sl4;
+
+		hybrid(pmu, arch_pebs_cap).caps = (u64)sl4_regs->ebx << 32;
 
-		cpuid_count(ARCH_PERFMON_EXT_LEAF, ARCH_PERFMON_PEBS_COUNTER_LEAF,
-			    &eax, &ebx, &ecx, &edx);
-		pebs_mask   = counter_mask(eax, ecx);
-		pdists_mask = counter_mask(ebx, edx);
+		pebs_mask   = counter_mask(sl5->pebs_gp, sl5->pebs_fixed);
+		pdists_mask = counter_mask(sl5->pebs_pdist_gp, sl5->pebs_pdist_fixed);
 		hybrid(pmu, arch_pebs_cap).counters = pebs_mask;
 		hybrid(pmu, arch_pebs_cap).pdists = pdists_mask;
 
@@ -6073,7 +6071,7 @@ static bool init_hybrid_pmu(int cpu)
 		goto end;
 
 	if (this_cpu_has(X86_FEATURE_ARCH_PERFMON_EXT))
-		update_pmu_cap(&pmu->pmu);
+		update_pmu_cap(&pmu->pmu, cpu);
 
 	intel_pmu_check_hybrid_pmus(pmu);
 
@@ -8488,7 +8486,7 @@ __init int intel_pmu_init(void)
 	 * when a new type is online.
 	 */
 	if (!is_hybrid() && boot_cpu_has(X86_FEATURE_ARCH_PERFMON_EXT))
-		update_pmu_cap(NULL);
+		update_pmu_cap(NULL, 0);
 
 	if (x86_pmu.arch_pebs) {
 		static_call_update(intel_pmu_disable_event_ext,
-- 
2.54.0

