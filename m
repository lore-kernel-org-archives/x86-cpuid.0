Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71A0478851
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983079; cv=none; b=fLbVy8UZPn9ma/KpUhf/+a5kIexDAzFIT109qh4TgyfZxiYB4xEe177l8w1Y65UZpO5OWdJ52lWnpoes7yOoTopINZyPQIdB7Wv0vpxxwmPzt+ZF0Rbmcsn0KY8Rl3jqbZXmwFpjRFkoHznPQXEy8y6GihqxBLVUfjWbGMtu9Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983079; c=relaxed/simple;
	bh=OxBGYtK8SVSdlUybsVJ2yt3KgRlue5jlBwm9ItNRWbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XbFzLunBtEjOxICgLbu/TLe1cKUTBEC/WF6HkPTjwAEs6uy3k63783Y/C4yA2CWp4pH1xdxJLUaZKji2GZSROU7pyCCbsfHW5gRVpPQAIFNPvatcdIe0TKLCk/fR5elIEWXmgFK2AMdVxKMQC5kOZcc+CnT4n4TUZb5fx4okxUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pfeyMlNk; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=/+8ssEvb; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pfeyMlNk";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="/+8ssEvb"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XAoJLp9hUgxb0OpTSFds5r+hHb5dZuQVfxSIcQLvDOU=;
	b=pfeyMlNk3na7m98GhJiqv5DGKNSIQsGQu3iLjmFG0CTVYX7bAujRsyuYgVFpfYIonYv8+1
	hwoNEZX8Kix6xgD8nfnabcRhhmq7tJ3ygBcUZNRuD7jGIVZaQUwSSa8mciIPLGpz9Jh5xo
	sz7pm/TsDxq5JxWxOqdtqs0tT23g8v+zE+wKZnUrJjZb/6osDCJkpSV7iiDcTK8NMtnz+o
	q4x0dgv85YjmlnRSTELQBb4A+ejC3llkmqROyxbTe+pp9aIaTV+vvnHSAcHAiuterXeEtG
	Sz4LtV22D88MWlrDRsArza4L/LL7+zuW3zsAcYg69Mcxl//iKxvvfsJruH4DCw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XAoJLp9hUgxb0OpTSFds5r+hHb5dZuQVfxSIcQLvDOU=;
	b=/+8ssEvbkH74EKPrNAzrwbJmGebqPE6rAjvVUySbhl80ywIGatLwX9+7dnHZst8JWR8v8a
	oQIMflLBihODYpDg==
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
Subject: [PATCH v7 086/120] perf/x86/zhaoxin: Use parsed CPUID(0xa)
Date: Thu, 28 May 2026 17:38:48 +0200
Message-ID: <20260528153923.403473-87-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For Zhaoxin perfmon, use parsed CPUID(0xa) instead of issuing CPUID queries
and defining custom CPUID output data types.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/events/zhaoxin/core.c | 32 ++++++++++++++------------------
 1 file changed, 14 insertions(+), 18 deletions(-)

diff --git a/arch/x86/events/zhaoxin/core.c b/arch/x86/events/zhaoxin/core.c
index 6ed644fe89aa..1c487d09f65c 100644
--- a/arch/x86/events/zhaoxin/core.c
+++ b/arch/x86/events/zhaoxin/core.c
@@ -505,39 +505,36 @@ static __init void zhaoxin_arch_events_quirk(void)
 
 __init int zhaoxin_pmu_init(void)
 {
-	union cpuid10_edx edx;
-	union cpuid10_eax eax;
-	union cpuid10_ebx ebx;
+	const struct cpuid_regs *regs = cpuid_leaf_raw(&boot_cpu_data, 0xa);
+	const struct leaf_0xa_0 *leaf = cpuid_leaf(&boot_cpu_data, 0xa);
 	struct event_constraint *c;
-	unsigned int unused;
-	int version;
 
 	pr_info("Welcome to zhaoxin pmu!\n");
 
+	if (!leaf || !regs)
+		return -ENODEV;
+
 	/*
 	 * Check whether the Architectural PerfMon supports
 	 * hw_event or not.
 	 */
-	cpuid(10, &eax.full, &ebx.full, &unused, &edx.full);
-
-	if (eax.split.mask_length < ARCH_PERFMON_EVENTS_COUNT - 1)
+	if (leaf->events_mask_len < ARCH_PERFMON_EVENTS_COUNT - 1)
 		return -ENODEV;
 
-	version = eax.split.version_id;
-	if (version != 2)
+	if (leaf->pmu_version != 2)
 		return -ENODEV;
 
 	x86_pmu = zhaoxin_pmu;
 	pr_info("Version check pass!\n");
 
-	x86_pmu.version			= version;
-	x86_pmu.cntr_mask64		= GENMASK_ULL(eax.split.num_counters - 1, 0);
-	x86_pmu.cntval_bits		= eax.split.bit_width;
-	x86_pmu.cntval_mask		= (1ULL << eax.split.bit_width) - 1;
-	x86_pmu.events_maskl		= ebx.full;
-	x86_pmu.events_mask_len		= eax.split.mask_length;
+	x86_pmu.version			= leaf->pmu_version;
+	x86_pmu.cntr_mask64		= GENMASK_ULL(leaf->num_counters_gp - 1, 0);
+	x86_pmu.cntval_bits		= leaf->bit_width_gp;
+	x86_pmu.cntval_mask		= (1ULL << leaf->bit_width_gp) - 1;
+	x86_pmu.events_maskl		= regs->ebx;
+	x86_pmu.events_mask_len		= leaf->events_mask_len;
 
-	x86_pmu.fixed_cntr_mask64	= GENMASK_ULL(edx.split.num_counters_fixed - 1, 0);
+	x86_pmu.fixed_cntr_mask64	= GENMASK_ULL(leaf->num_counters_fixed - 1, 0);
 	x86_add_quirk(zhaoxin_arch_events_quirk);
 
 	switch (boot_cpu_data.x86) {
@@ -617,4 +614,3 @@ __init int zhaoxin_pmu_init(void)
 
 	return 0;
 }
-
-- 
2.54.0

