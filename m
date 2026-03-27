Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCA535CB7C
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774578095; cv=none; b=XtECEWLErMfBLLf1Pumu3HzcbA0QbP4l/Kedme1kTqATn/U7Cis7XhTwDKopjsoFxAtxDnoc5x01XFnVfILYIkGdfIfet1VjKhsvMbW/kYrOShE9BqTb0gjZt8ouxKh9CNFK3XvMbpHpVAx9JhyM8WmO8m71gu8jkZ3PWGyYDbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774578095; c=relaxed/simple;
	bh=yd7Vtdy4gL9sEsI9HoJVRuxTf7GKCX3j1SSz8BTYcKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tvGhLP6KuypnlPovRuP9hxZcIzlLe7YV7WBY5vrlNg3PXh8i4ecHKie6lhAti0rFtNJfANpkvMqUcFuMHP0KJ1jjivD2DyDEvnhVE3ZumgO9NpqycXsjDs+6r14rNsYxC0vOg7xrwid9bhFS5A7p2iH6+mBiTzCu8zL8S5oDVv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Nsn11No0; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jW8zc4q6; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Nsn11No0";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jW8zc4q6"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774578092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T4y3r2qIMfh5P36zdKzdnROesQmFS5DUOtqzJp2p6ws=;
	b=Nsn11No0/60unGv49T9iBXDJ3zTyjaJ0fxSW6D9yEhE95eU7LN95jSStiLZKJ3dqCvAbuZ
	zI7f7ZM1gRAsxOee1It7E3pOJ9pnfsWCgPABiklzCMyARh9srDCKFAXPTSkRRZP5cBb3ot
	SIwEQDXEwcp22f1BJsPCfn02+yrg6/LRLkciO5OftLLSOGlYk5tIS3voc8q00BBDz6k8W1
	XJowt+2EWgGJVthqLph9Eh1EYYdEVLzZjGR2TUnGAUY+odjKYYZdOGLMQkDrOGwgdsvOhA
	WQksgBk4DVzEoeQAEy7kRx/qcAoNFi9uZ7kLOlaL/CBOXAwJUb0ESQMEKBAh+Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774578092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T4y3r2qIMfh5P36zdKzdnROesQmFS5DUOtqzJp2p6ws=;
	b=jW8zc4q6ntHBxEtz9meI7F+r14F4m1cL6kQtiYrDs/Na4fvQdyqc7rc62Gb/rXFFPM7bQQ
	kEZ1bGShHGX20vBw==
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
Subject: [PATCH v6 69/90] KVM: x86: Use standard CPUID(0x80000022) types
Date: Fri, 27 Mar 2026 03:16:23 +0100
Message-ID: <20260327021645.555257-70-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use standard CPUID(0x80000022) types from x86-cpuid-db instead of relying
on custom perf types.

The latter are in process of getting removed from the kernel.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kvm/cpuid.c   | 7 ++++---
 arch/x86/kvm/svm/pmu.c | 7 ++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
index 16ed4c001c79..ca769e390e62 100644
--- a/arch/x86/kvm/cpuid.c
+++ b/arch/x86/kvm/cpuid.c
@@ -1870,7 +1870,8 @@ static inline int __do_cpuid_func(struct kvm_cpuid_array *array, u32 function)
 		break;
 	/* AMD Extended Performance Monitoring and Debug */
 	case 0x80000022: {
-		union cpuid_0x80000022_ebx ebx = { };
+		struct leaf_0x80000022_0 leaf = { };
+		struct cpuid_regs *regs = (struct cpuid_regs *)&leaf;
 
 		entry->ecx = entry->edx = 0;
 		if (!enable_pmu || !kvm_cpu_cap_has(X86_FEATURE_PERFMON_V2)) {
@@ -1880,8 +1881,8 @@ static inline int __do_cpuid_func(struct kvm_cpuid_array *array, u32 function)
 
 		cpuid_entry_override(entry, CPUID_8000_0022_EAX);
 
-		ebx.split.num_core_pmc = kvm_pmu_cap.num_counters_gp;
-		entry->ebx = ebx.full;
+		leaf.n_pmc_core = kvm_pmu_cap.num_counters_gp;
+		entry->ebx = regs->ebx;
 		break;
 	}
 	/*Add support for Centaur's CPUID instruction*/
diff --git a/arch/x86/kvm/svm/pmu.c b/arch/x86/kvm/svm/pmu.c
index 7aa298eeb072..7c89b330fb73 100644
--- a/arch/x86/kvm/svm/pmu.c
+++ b/arch/x86/kvm/svm/pmu.c
@@ -179,7 +179,8 @@ static int amd_pmu_set_msr(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 static void amd_pmu_refresh(struct kvm_vcpu *vcpu)
 {
 	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
-	union cpuid_0x80000022_ebx ebx;
+	struct leaf_0x80000022_0 leaf = { };
+	struct cpuid_regs *regs = (struct cpuid_regs *)&leaf;
 
 	pmu->version = 1;
 	if (guest_cpu_cap_has(vcpu, X86_FEATURE_PERFMON_V2)) {
@@ -190,8 +191,8 @@ static void amd_pmu_refresh(struct kvm_vcpu *vcpu)
 		 */
 		BUILD_BUG_ON(x86_feature_cpuid(X86_FEATURE_PERFMON_V2).function != 0x80000022 ||
 			     x86_feature_cpuid(X86_FEATURE_PERFMON_V2).index);
-		ebx.full = kvm_find_cpuid_entry_index(vcpu, 0x80000022, 0)->ebx;
-		pmu->nr_arch_gp_counters = ebx.split.num_core_pmc;
+		regs->ebx = kvm_find_cpuid_entry_index(vcpu, 0x80000022, 0)->ebx;
+		pmu->nr_arch_gp_counters = leaf.n_pmc_core;
 	} else if (guest_cpu_cap_has(vcpu, X86_FEATURE_PERFCTR_CORE)) {
 		pmu->nr_arch_gp_counters = AMD64_NUM_COUNTERS_CORE;
 	} else {
-- 
2.53.0

