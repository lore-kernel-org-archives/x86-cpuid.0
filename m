Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4284136DA19
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774578051; cv=none; b=LxCZlFdUcrVRKYl3lqNnIhlBruTtjtgEi9y/iSJ3eoK0XgQQijrsEGx1hm9zfxvzqvJ5NbpfLf2vms1cJCX6C90CPIsRv1tho475/D2EklQvSoPNYDMFbFE0Z+Haa6dfChKYvYAEABQSYGPe1+l+m4YZuxqnDdbScVo8u9rqGk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774578051; c=relaxed/simple;
	bh=q4XRw5IKQQDoq98IzMZ8P2qo7cYwPQIQt5LVJHxb3/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vy99OMOIK8czO9fDLbiwOGdyGBV7jbz8dOSOQ1IilxThCpGH5hRqS0i5l6L6BbwgEpuQbnYnHQW3EIwzWH6cKj327ZjAwkkKS4kJ4r41d31vPCgtPR2oEzDhlTGV2VC+6D4mNGaH78daOVsp6+yn4GDgljh3hKEaNXl8vpMLTHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nOkw2NT4; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kskMCNX1; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nOkw2NT4";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kskMCNX1"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774578048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7aG1OpuRlN20w2rpYB8QhIsEiDC7JO2EyjE6nNtmyh4=;
	b=nOkw2NT4IX+RQtakvuc9M5qJVT/E5C3BzOhRdg5FHmVTkYv6bN8aZqwBUkAuJ07Ib0nk4k
	NVcp3Oe08d8sf5ATiSEo1jrVbWfJVHE4EF4uLTb+Z39AuVVp6or18l4YTFNYAOiuhXd5G3
	XfaCu1AOB1A08pyp+hKEXlPMf3hZDUpJX/aN+tFLtdHOwpg86Iv/6jkJ1pcgVgQGBzipjJ
	uOgH5IdhLMaVkab6vB0G7cQMJNEuL5In8ALol6G/X9Habd/r7rB+GRtT1mzlv90rVg4Hk9
	ChXvO0JMRBJZqc5lJ6v12yXIByYsJaddgLXGEk+U3szES4j7DGcFWzcoZextOw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774578048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7aG1OpuRlN20w2rpYB8QhIsEiDC7JO2EyjE6nNtmyh4=;
	b=kskMCNX1kz/IDOFJcEvH6L7V6Yoj5n9dpaVsiRKKCJq/8K4egRXf0cjOCdIBRc2Q/faZgG
	FZJEIE7bBmaDUtDg==
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
Subject: [PATCH v6 56/90] perf/x86/zhaoxin: Use parsed CPUID(0xa)
Date: Fri, 27 Mar 2026 03:16:10 +0100
Message-ID: <20260327021645.555257-57-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
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
2.53.0

