Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7B135B646
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774578067; cv=none; b=eHeiJbFjqHQPXejF7G18oMZAtbD8hn/Ti/zp5uZDH6nWGucJIWoHK8IwUvbAOvDdsqOSAM616QKNzMVT9nMoBglqIrIUKGeZy6FySNHCd/6cOJC2ykFAldTmIMGZYN2tGZitzR5lE4DD/STWgj9kkE67GsL+MbbUOTyIG7kFQNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774578067; c=relaxed/simple;
	bh=CJIqPe48oi83NtLflCwO7pRjDo23buF+R/95EVAg8Fc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i5R8xQgnskeXzNjmjZ3nabl9AxYXp/p5p8sMh3jkuMYbDdKYCM4ju7EwRKXaNtaLBcXRscTkubRMtJOGcFkunpvv7SERkWu7xZZnNbxfvN1+ZLQk5uEuvAC+zhgIBrThTU8bhCi3Qt/VfhEaZ/2lSiwDlEt0KplNtLdzFr59fS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4vt1yFai; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=+AyGi/Az; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4vt1yFai";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="+AyGi/Az"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774578064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hcl3gDDxvBw76pQpHh0N5lzLkbf3ZnbbNEuPzu4azcY=;
	b=4vt1yFaiU/s7xV6FS+UNVjKIUS8di3FFlF/aBNYZqxjVwtN2tQeoFIdjScKoP8VE9QIuoR
	ROc1raxDvYlssOeFLxhKxrB3XQeO16HsNUmVqvJJCVrIb/Kr+z5vm9W3l+IVcfQXBACqyN
	SbDz2Wm9m53pZyK0z6v3bcbOEWxQuYc6masvcHIj6JjfFaR96PRKPi1XdCgKLeyHfwKcBB
	1zroaAGtV85QDSK/zGSd3q0gFKXw8Szzd1dqrrgkYsRkvedID+pLHtWIsiTVKVfEc3T5Or
	oHAtwHVoPyFq9XVApOn5yrbZePpAnlu/ZzAjahHvAvju/rWVl/YhxRdKhyuvTg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774578064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hcl3gDDxvBw76pQpHh0N5lzLkbf3ZnbbNEuPzu4azcY=;
	b=+AyGi/AzlDxJiNhKOYr0UjiPx0PpVTf8joGQndBpP+rWTjM+K2aAX956d5aHsxY2QVmZrS
	d5bLFvRqwuBUi+CQ==
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
Subject: [PATCH v6 61/90] perf/x86/lbr: Use parsed CPUID(0x1c)
Date: Fri, 27 Mar 2026 03:16:15 +0100
Message-ID: <20260327021645.555257-62-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
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
2.53.0

