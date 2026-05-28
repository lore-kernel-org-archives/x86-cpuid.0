Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B90647CC92
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983119; cv=none; b=kDVyNDDA1+EANcRQ4YcWcGaSyiwt7TQbiemhZ3eORaV0c5j78G4X+hMf1GrXjDWxY5zywbuTAw7gnDJ78GuSIbbTzafk+0UjvV4IZuogLttNbO+UAw4ivzu5xtGV2H9P28IkfNki767/6Zssqv83MTC6TZjmfhjCHxVb58L5hy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983119; c=relaxed/simple;
	bh=VhGrs3bP7IQqFV96JRyFv/OuuYovutuzXux64dV8A98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S//VMtxfNsmRFZvVMX3lHQzTdjAlOAOEEljpfEEIahSUAhFiUCPjP/EJxqE3VCrIQoXHlHB9uQPjm3qAxn3TMCd5ZR8kG/87sGqXuVYZlYnV7rhzLCwgFp6JVFkDYxVd++SEVDOnLDKGHDQQxe051X6tZxieHGoyHgyo2m4TYWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RdGoqpyv; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jIrc3RO7; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="RdGoqpyv";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jIrc3RO7"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zCTfxpXdaW9qpQOGTE5yg0Y1hc+Y+zTSRa5GepkIlN8=;
	b=RdGoqpyvXBb8lc+VKjWD6pNY5kaU9tOY93+ozgTB9tXnVnengrg2W2in6pKGu7XOdyhw3d
	y5KFJw8rTKnf0I/TPQMkGl7EWLGNkHwltMUDs4Ps0wuKFPMBfS9gOpuyXv/5wNNerLzklS
	CeXopZuT8C5cMrWad1xfvc4XcMX97a6WC0kyM3VZ2ix1pteKcbaTI9G+6udGxBwEyR6QGi
	iLe0n4HpveL/3SNf5J+P1iye6J74gIxnXEki6QjlPz3olV61eKSAaaH3JVCtgQE0DN3Fi5
	aBQs5047LniT92aEeclJziAPs5s338AAoOmM0amW0AzAoejIaMeAzpKTdWAJ1A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zCTfxpXdaW9qpQOGTE5yg0Y1hc+Y+zTSRa5GepkIlN8=;
	b=jIrc3RO7YOJiWMoDgaK3C79GMkL2iIIgIGcHbEMxS5TCzWkVYiM63dPgJk3/IJsuxaO7ua
	AsOLnNzc8th+r2Ag==
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
Subject: [PATCH v7 098/120] perf/x86/amd: Use parsed CPUID(0x80000022)
Date: Thu, 28 May 2026 17:39:00 +0200
Message-ID: <20260528153923.403473-99-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For AMD perf, use parsed CPUID(0x80000022) instead of direct CPUID queries
and custom perf data types.

For the uncore CPU hotplug callbacks, ensure that the correct per-CPU CPUID
table is queried.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/events/amd/core.c   |  8 +++-----
 arch/x86/events/amd/uncore.c | 18 +++++++-----------
 2 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/arch/x86/events/amd/core.c b/arch/x86/events/amd/core.c
index d66a357f219d..b070d0be36c4 100644
--- a/arch/x86/events/amd/core.c
+++ b/arch/x86/events/amd/core.c
@@ -1410,7 +1410,7 @@ static const struct attribute_group *amd_attr_update[] = {
 
 static int __init amd_core_pmu_init(void)
 {
-	union cpuid_0x80000022_ebx ebx;
+	const struct leaf_0x80000022_0 *leaf = cpuid_leaf(&boot_cpu_data, 0x80000022);
 	u64 even_ctr_mask = 0ULL;
 	int i;
 
@@ -1430,14 +1430,12 @@ static int __init amd_core_pmu_init(void)
 	x86_pmu.cntr_mask64	= GENMASK_ULL(AMD64_NUM_COUNTERS_CORE - 1, 0);
 
 	/* Check for Performance Monitoring v2 support */
-	if (boot_cpu_has(X86_FEATURE_PERFMON_V2)) {
-		ebx.full = cpuid_ebx(EXT_PERFMON_DEBUG_FEATURES);
-
+	if (leaf && boot_cpu_has(X86_FEATURE_PERFMON_V2)) {
 		/* Update PMU version for later usage */
 		x86_pmu.version = 2;
 
 		/* Find the number of available Core PMCs */
-		x86_pmu.cntr_mask64 = GENMASK_ULL(ebx.split.num_core_pmc - 1, 0);
+		x86_pmu.cntr_mask64 = GENMASK_ULL(leaf->n_pmc_core - 1, 0);
 
 		amd_pmu_global_cntr_mask = x86_pmu.cntr_mask64;
 
diff --git a/arch/x86/events/amd/uncore.c b/arch/x86/events/amd/uncore.c
index 05cff39968ec..6a5d8f8cfbc0 100644
--- a/arch/x86/events/amd/uncore.c
+++ b/arch/x86/events/amd/uncore.c
@@ -692,7 +692,7 @@ static int amd_uncore_df_add(struct perf_event *event, int flags)
 static
 void amd_uncore_df_ctx_scan(struct amd_uncore *uncore, unsigned int cpu)
 {
-	union cpuid_0x80000022_ebx ebx;
+	const struct leaf_0x80000022_0 *leaf = cpuid_leaf(&cpu_data(cpu), 0x80000022);
 	union amd_uncore_info info;
 
 	if (!boot_cpu_has(X86_FEATURE_PERFCTR_NB))
@@ -703,10 +703,8 @@ void amd_uncore_df_ctx_scan(struct amd_uncore *uncore, unsigned int cpu)
 	info.split.gid = 0;
 	info.split.cid = topology_logical_package_id(cpu);
 
-	if (pmu_version >= 2) {
-		ebx.full = cpuid_ebx(EXT_PERFMON_DEBUG_FEATURES);
-		info.split.num_pmcs = ebx.split.num_df_pmc;
-	}
+	if (leaf && pmu_version >= 2)
+		info.split.num_pmcs = leaf->n_pmc_northbridge;
 
 	*per_cpu_ptr(uncore->info, cpu) = info;
 }
@@ -990,16 +988,14 @@ static void amd_uncore_umc_read(struct perf_event *event)
 static
 void amd_uncore_umc_ctx_scan(struct amd_uncore *uncore, unsigned int cpu)
 {
-	union cpuid_0x80000022_ebx ebx;
+	const struct leaf_0x80000022_0 *leaf = cpuid_leaf(&cpu_data(cpu), 0x80000022);
 	union amd_uncore_info info;
-	unsigned int eax, ecx, edx;
 
-	if (pmu_version < 2)
+	if (!leaf || pmu_version < 2)
 		return;
 
-	cpuid(EXT_PERFMON_DEBUG_FEATURES, &eax, &ebx.full, &ecx, &edx);
-	info.split.aux_data = ecx;	/* stash active mask */
-	info.split.num_pmcs = ebx.split.num_umc_pmc;
+	info.split.aux_data = leaf->active_umc_bitmask;
+	info.split.num_pmcs = leaf->n_pmc_umc;
 	info.split.gid = topology_logical_package_id(cpu);
 	info.split.cid = topology_logical_package_id(cpu);
 	*per_cpu_ptr(uncore->info, cpu) = info;
-- 
2.54.0

