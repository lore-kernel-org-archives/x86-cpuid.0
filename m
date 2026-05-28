Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CC747D956
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983120; cv=none; b=Y4Tghm5mVu7aR42DOJzVN3fsX3dDFdGvdYvZ/PHPi8dFXdWMD72kCa9xxE+DA2fFd5EO+3eUYHm4cYhURthrGs5bbK1rJ/xKGIoGbaPVPY5dYM8LSf+FZgiQCEzXfgrvwO6u6eb3GhlH8xcSSxEwypGljIH4FBBQ5aB4adMAuE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983120; c=relaxed/simple;
	bh=NNMPX8ZLNHD4/uhiUcRulAJd/QG2w1JQm6FskXl2GCg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N3kG2z7SQGYeX2GB/ITPnVBzi61eUV/diAq8T5zCUQgN9YYauLN9je533kzd/8ZqFRHXqtzOEmTDAc/7QxR2D/zgEGYGKz7UCWIMI7GGqgmRMhGSjKHH7xavZgDh87wBdR/dJTZNcE0W1blD4OOGH9UQmRDQOH25ndgu1nZ171k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=osbrFHps; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=/D7uHDhc; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="osbrFHps";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="/D7uHDhc"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oV8JuRV/XrK5lokYUmrPNY++3JPySR4ABGDAdCwCodw=;
	b=osbrFHpsmy5K4WL6Hh1BzArVCaq2QHgcHV1jmNLWqrPKPKEc8P3jdNIfHCKjCDcl8rSI79
	ItxORDhZa+I9LGaCTVqsEL9DENwMYKgjlvNFoy38jKc9ZeQnjbqm2zmwak60EfJnadjNwO
	hl0Etb1/AlFsYxw+Da5/bjpF9fFr5g4/B3ML1Rj9c85SuFdo6lysa5kT3eCftVSwJ/Agnd
	fPVayfnMMmIeloGy7WFnlZ6DpoLnGNYjck9JkTlz01FJvm35kSQNv021Z+f+mhLTR6BViY
	lPsL4I/AuLtDyNNm2/WtdL7JDUrsVZvrO7qeALmjVh13laxiF9syaATTpo6Qzg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oV8JuRV/XrK5lokYUmrPNY++3JPySR4ABGDAdCwCodw=;
	b=/D7uHDhc3OwCYUk0P5rdxQ3O8qvW/xXojAlJfVam0SFByrvJ7M1seaEnAYLJJHeGivsuV0
	jcN9uG0LoYlvfxAQ==
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
Subject: [PATCH v7 099/120] KVM: x86: Use standard CPUID(0x80000022) types
Date: Thu, 28 May 2026 17:39:01 +0200
Message-ID: <20260528153923.403473-100-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
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
index 706903ad6628..040e15ff87c5 100644
--- a/arch/x86/kvm/cpuid.c
+++ b/arch/x86/kvm/cpuid.c
@@ -1871,7 +1871,8 @@ static inline int __do_cpuid_func(struct kvm_cpuid_array *array, u32 function)
 		break;
 	/* AMD Extended Performance Monitoring and Debug */
 	case 0x80000022: {
-		union cpuid_0x80000022_ebx ebx = { };
+		struct leaf_0x80000022_0 leaf = { };
+		struct cpuid_regs *regs = (struct cpuid_regs *)&leaf;
 
 		entry->ecx = entry->edx = 0;
 		if (!enable_pmu || !kvm_cpu_cap_has(X86_FEATURE_PERFMON_V2)) {
@@ -1881,8 +1882,8 @@ static inline int __do_cpuid_func(struct kvm_cpuid_array *array, u32 function)
 
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
2.54.0

