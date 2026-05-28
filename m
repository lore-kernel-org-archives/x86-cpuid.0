Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C857478869
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983086; cv=none; b=GFyqi+ZpSmfe50+DzVfBW1EIuqwGiriZMlZKwsxFrRrVFjnW+IXzmMReTvcA8qOmlHk54vySTxGTX7xu0Ux3IlK3bPt1y7DG7M/TZNN6LE/Y97lmFLYkjZeyD37sy/0m3oI6Cnhth8w7PrNSAzjkWo45p0KlZQvU7eT8xeWWPpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983086; c=relaxed/simple;
	bh=/4fyUs/FN0eINi2/Sj5+6zpNvqPWactAT8RK7UF0XD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PqlVG0J/+mSvxf6vB0Uu5Pbp6P9UXgwPsZ8gLakSAHSDqZGmnxbdoZOxdcLxX/qmKK4tzo0hpF6dxTe+pf3aA6wAk7hnmL47+XlU1PsfAOIMjrjIgElvkooWd9wUm9K8lLWZ0vaVyPl7HoLTySD3HzySBdiVzEk3ha8YyWfW27Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qKQZznTL; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=m7GM+PRb; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qKQZznTL";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="m7GM+PRb"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lAlRHoXDgY0nwQIpO8zaRGhH8pU9gbDX1nbxv2MEQBA=;
	b=qKQZznTLbi4NmI0thuUxS77mVvmK+yaq0Y1lsT7p3UWBlKxIyDgMipDa8zGzxTC7us+bYQ
	NqNdUnTI13743+T54wYmekR8nBSWWGeywaeY90gNOJufaPbJlnD+k7NWPYuMYiZJ5lbSSp
	96K5w5Ye7+6IEgcAlqmqMDeR8yLBkKL3HG9yM6IeqliGb+pYdmS1qbCho4Jl0FL5hTHZ1b
	6m6UOeiBawWANuULmBgmk6NoZklJE0GjRghBe2HDRvuCzvNxSS9Xf/PKd7CYUb6HaryaWl
	EM+9AodqX3E/jphXr8Zop32dtc7avSBUvT8KKBvFOvmwl27/InjWgwfvu09twA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lAlRHoXDgY0nwQIpO8zaRGhH8pU9gbDX1nbxv2MEQBA=;
	b=m7GM+PRbqcXqSHQCUWvFBuXH0DfXwyPLRkxVuvFV76lZLhJeSD1bcPu/mpacSNo6kNn6ul
	6KlTDe/lXBsAzMCg==
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
Subject: [PATCH v7 089/120] KVM: x86/pmu: Use standard CPUID(0xa) types
Date: Thu, 28 May 2026 17:38:51 +0200
Message-ID: <20260528153923.403473-90-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
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
2.54.0

