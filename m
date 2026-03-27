Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B460A37474E
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774578061; cv=none; b=hCr6MW27eC7BxgNPa4cg/TIMFmpRTIKYVIpikME1uEL7CFC9iP1mT0CRV7JMqAYEWhqg+9JxXJ7sCZTiImYdm9t8hDgPwKshW3aR99U9vKyRohHTix+VQqNS2spiduZfIE7uIiRDFXgH+syq/tc+/8vf898/r4Sq/O5kYBaAszI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774578061; c=relaxed/simple;
	bh=3EwSVXzKb38A0kXx3OdyT4KXgnLusic6Pcj2rho7Nrc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B6HjaqxaRo9qbAeYV0THx7la2Qx6Gyezot3WramYQtWzMcA+px2tmbpWiSQlVAMqKTvJwflh4AQMRrE/IBpGW+ByvCyqXhB39Zspm8/umJNQDp9vpu21P70rAzJ5Xo9l072BKt7ZKYLAhe+EBGsHdtH9pBQEV3QSVbyDD31CV0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=gjc4v5XP; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3Vs7OAVx; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gjc4v5XP";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3Vs7OAVx"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774578058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RRSX54I0iJeSrYG1pJupkqNr+r3Vka+Wq09nGaVn1Sg=;
	b=gjc4v5XP6a+fJlAj5JOeZf3OqlGpbc6eE7X6UE9XwZB86siXFfAyb/aNyj7gCrAgDiTkG+
	l3bbOkqXDDsKqdz5Kjdlay1+NS1MUuXt7VTgn8ZW7zKHQ7CaVtdbPb+bKqdplRodKPvk6o
	86F4AzzXyfoHIF31YzF5xd69p30c98l0doc3BKjfGHqFxtODigITpWivytpsMaRiWJWz0z
	FFQwUqYlBhixWmOk4vdCpxvpZ1Ya7BCquImhenPmtO7D53O1owgl1dXjhE5WjtFsX0kKr9
	xubuHN5VIy9PBCC5Lr0yr8dnq7AXZ/wo2MLlElJDGQuZMw/r2W/eFw+CTmwW3w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774578058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RRSX54I0iJeSrYG1pJupkqNr+r3Vka+Wq09nGaVn1Sg=;
	b=3Vs7OAVxiNn+RgHe9I/qcRVk3kqvV8Blj9W/EXBitKkHP11n85dxywX95w3GiFV7N11qc3
	lpCJAkUUm6NA3nCA==
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
Subject: [PATCH v6 59/90] KVM: x86/pmu: Use standard CPUID(0xa) types
Date: Fri, 27 Mar 2026 03:16:13 +0100
Message-ID: <20260327021645.555257-60-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For KVM PMU refresh, use the auto-generated CPUID(0xa) types from
x86-cpuid-db instead of relying on the custom perf types.

The latter types are in process of getting removed from the kernel.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kvm/vmx/pmu_intel.c | 31 +++++++++++++------------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/arch/x86/kvm/vmx/pmu_intel.c b/arch/x86/kvm/vmx/pmu_intel.c
index 74e0b01185b8..e0aeb1bc04ca 100644
--- a/arch/x86/kvm/vmx/pmu_intel.c
+++ b/arch/x86/kvm/vmx/pmu_intel.c
@@ -493,8 +493,8 @@ static void intel_pmu_refresh(struct kvm_vcpu *vcpu)
 	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
 	struct lbr_desc *lbr_desc = vcpu_to_lbr_desc(vcpu);
 	struct kvm_cpuid_entry2 *entry;
-	union cpuid10_eax eax;
-	union cpuid10_edx edx;
+	struct leaf_0xa_0 l = { };
+	struct cpuid_regs *regs = (struct cpuid_regs *)&l;
 	u64 perf_capabilities;
 	u64 counter_rsvd;
 
@@ -515,21 +515,18 @@ static void intel_pmu_refresh(struct kvm_vcpu *vcpu)
 	if (!entry)
 		return;
 
-	eax.full = entry->eax;
-	edx.full = entry->edx;
+	regs->eax = entry->eax;
+	regs->edx = entry->edx;
 
-	pmu->version = eax.split.version_id;
+	pmu->version = l.pmu_version;
 	if (!pmu->version)
 		return;
 
-	pmu->nr_arch_gp_counters = min_t(int, eax.split.num_counters,
-					 kvm_pmu_cap.num_counters_gp);
-	eax.split.bit_width = min_t(int, eax.split.bit_width,
-				    kvm_pmu_cap.bit_width_gp);
-	pmu->counter_bitmask[KVM_PMC_GP] = BIT_ULL(eax.split.bit_width) - 1;
-	eax.split.mask_length = min_t(int, eax.split.mask_length,
-				      kvm_pmu_cap.events_mask_len);
-	pmu->available_event_types = ~entry->ebx & (BIT_ULL(eax.split.mask_length) - 1);
+	pmu->nr_arch_gp_counters	= min_t(int, l.num_counters_gp, kvm_pmu_cap.num_counters_gp);
+	l.bit_width_gp			= min_t(int, l.bit_width_gp, kvm_pmu_cap.bit_width_gp);
+	pmu->counter_bitmask[KVM_PMC_GP]= BIT_ULL(l.bit_width_gp) - 1;
+	l.events_mask_len		= min_t(int, l.events_mask_len, kvm_pmu_cap.events_mask_len);
+	pmu->available_event_types	= ~entry->ebx & (BIT_ULL(l.events_mask_len) - 1);
 
 	entry = kvm_find_cpuid_entry_index(vcpu, 7, 0);
 	if (entry &&
@@ -552,11 +549,9 @@ static void intel_pmu_refresh(struct kvm_vcpu *vcpu)
 	if (pmu->version == 1)
 		return;
 
-	pmu->nr_arch_fixed_counters = min_t(int, edx.split.num_counters_fixed,
-					    kvm_pmu_cap.num_counters_fixed);
-	edx.split.bit_width_fixed = min_t(int, edx.split.bit_width_fixed,
-					  kvm_pmu_cap.bit_width_fixed);
-	pmu->counter_bitmask[KVM_PMC_FIXED] = BIT_ULL(edx.split.bit_width_fixed) - 1;
+	pmu->nr_arch_fixed_counters = min_t(int, l.num_counters_fixed, kvm_pmu_cap.num_counters_fixed);
+	l.bitwidth_fixed	    = min_t(int, l.bitwidth_fixed, kvm_pmu_cap.bit_width_fixed);
+	pmu->counter_bitmask[KVM_PMC_FIXED] = BIT_ULL(l.bitwidth_fixed) - 1;
 
 	intel_pmu_enable_fixed_counter_bits(pmu, INTEL_FIXED_0_KERNEL |
 						 INTEL_FIXED_0_USER |
-- 
2.53.0

