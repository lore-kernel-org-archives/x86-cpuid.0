Received: from mail-43101.protonmail.ch (mail-43101.protonmail.ch [185.70.43.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FD146AED3
	for <x86-cpuid@lists.linux.dev>; Wed,  3 Jun 2026 12:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780488161; cv=none; b=oLtywqdcwsm8b9OxPVfFJdtXjdM8ZlNAqSI+GtWlLb1/zIcp57gtAhtIDc1Zz/vFv7G/SmrNls4630g5Q7Q7CdNPnx97getMdHw6Vxhr7sdRIdyPtdSWZybGfACH0xWmp8xZ4f2PAFH6bVrK+VmTbQJfzzAF4Q5MXkaWsicKvX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780488161; c=relaxed/simple;
	bh=Z5Dgiv42bWJo207Od0SaYrLrfI3zWR8kQX4mo6wurk4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KDCDsHDav4/yZlTWT7viIwGOf3e+SMzSsmFZ3ORdbOnt/kFeXhBf+BWCswnPDMDDwebxDDleYaSTP1aicmzYy0esui13cPQGUG5/7JKu4/1p6SmiZzgMfGN3TENFphJQ6uaPLkIRYYkAw931MbHWdxsLZVJI1VqfUG8uVVM+p30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=bZNiebKi; arc=none smtp.client-ip=185.70.43.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="bZNiebKi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1780488149; x=1780747349;
	bh=uM8z9ouv5imJ3kpwf2Zu/l+ZMBzZnO7ZywGg/CRRJ/g=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=bZNiebKiiw67O8iENlBSiEyVBozrE01go5G0L10Fy2URPh+CEBRlqXDRLtYEYd4pg
	 uzmg+hNB8jliodUn2zBsgTbi2uO0swA3tPOb0s8+1LFgCUWR0Phi89UNvcrPF9E/gd
	 zGRcbbx2vJkJ6HH0s9yfhJX6V5SW6IPO8enZajQNpQ+bYTKe28nU44tJluZPw2qCH1
	 ADG3KGg7C4gUQV7S4/qvQ9+1F1YPTnqzdV3WSNzV2h1lXiUp9YPRgnYwx7G6sKC5Xa
	 w89/i8ULGjmrzaxu7T8COmMkeXhLBOWSjBzT8A9g1TXZ9qZ3ckyZRcjdSK/0hftcYe
	 AHjmoxQ0zkDLQ==
Date: Wed, 03 Jun 2026 12:02:25 +0000
To: mingo@redhat.com, dave.hansen@linux.intel.com, bp@alien8.de
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: hpa@zytor.com, darwi@linutronix.de, tglx@kernel.org, sohil.mehta@intel.com, andrew.cooper3@citrix.com, linux-kernel@vger.kernel.org, x86@kernel.org, m.wieczorretman@pm.me, john.ogness@linutronix.de, ludloff@gmail.com, maciej.wieczor-retman@intel.com, x86-cpuid@lists.linux.dev
Subject: [PATCH v1 2/2] x86/cpuid: Fix a few more typos
Message-ID: <237c2be340be63e67263c76f065b3aaa9fb1fbbe.1780487165.git.m.wieczorretman@pm.me>
In-Reply-To: <cover.1780487165.git.m.wieczorretman@pm.me>
References: <cover.1780487165.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 9a94f607e284432905be27c503639dd95454ff0b
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Ahmed S. Darwish <darwi@linutronix.de>

As identified by an LLM agent run over the generated C kernel header.

Note, for CPUID(0x6) thrd_director_nclasses, it was written this way
because the project does not support bitfields names with more letters.
Name it as hw_feedback_nclasses, which is what's in the Intel manuals.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
 arch/x86/include/asm/cpuid/leaf_types.h | 56 ++++++++++++-------------
 tools/arch/x86/kcpuid/cpuid.csv         | 48 ++++++++++-----------
 2 files changed, 52 insertions(+), 52 deletions(-)

diff --git a/arch/x86/include/asm/cpuid/leaf_types.h b/arch/x86/include/asm=
/cpuid/leaf_types.h
index b89435a3277d..222d2d2682c8 100644
--- a/arch/x86/include/asm/cpuid/leaf_types.h
+++ b/arch/x86/include/asm/cpuid/leaf_types.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: MIT */
-/* Generator: x86-cpuid-db v3.0 */
+/* Generator: x86-cpuid-db v3.1 */
=20
 /*
  * Auto-generated file.
@@ -246,7 +246,7 @@ struct leaf_0x6_0 {
 =09=09=09=09=09=09:  2, // Reserved
 =09=09energy_perf_bias=09=09:  1, // IA32_ENERGY_PERF_BIAS MSR
 =09=09=09=09=09=09:  4, // Reserved
-=09=09thrd_director_nclasses=09=09:  8, // Number of classes, Intel thread=
 director
+=09=09hw_feedback_nclasses=09=09:  8, // Number of Intel Thread Director c=
lasses
 =09=09=09=09=09=09: 16; // Reserved
 =09// edx
 =09u32=09perfcap_reporting=09=09:  1, // Performance capability reporting
@@ -332,11 +332,11 @@ struct leaf_0x7_0 {
 =09=09sgx_keys=09=09=09:  1, // Intel SGX attestation services
 =09=09avx512_4vnniw=09=09=09:  1, // AVX-512 neural network instructions
 =09=09avx512_4fmaps=09=09=09:  1, // AVX-512 multiply accumulation single =
precision
-=09=09fsrm=09=09=09=09:  1, // Fast short REP MOV
+=09=09fsrm=09=09=09=09:  1, // Fast short REP MOVSB
 =09=09uintr=09=09=09=09:  1, // User interrupts
 =09=09=09=09=09=09:  2, // Reserved
 =09=09avx512_vp2intersect=09=09:  1, // VP2INTERSECT{D,Q} instructions
-=09=09srdbs_ctrl=09=09=09:  1, // SRBDS mitigation MSR
+=09=09srbds_ctrl=09=09=09:  1, // SRBDS mitigation MSR
 =09=09md_clear=09=09=09:  1, // VERW MD_CLEAR microcode
 =09=09rtm_always_abort=09=09:  1, // XBEGIN (RTM transaction) always abort=
s
 =09=09=09=09=09=09:  1, // Reserved
@@ -379,7 +379,7 @@ struct leaf_0x7_1 {
 =09=09wrmsrns=09=09=09=09:  1, // WRMSRNS instruction (WRMSR-non-serializi=
ng)
 =09=09nmi_src=09=09=09=09:  1, // NMI-source reporting with FRED event dat=
a
 =09=09amx_fp16=09=09=09:  1, // AMX-FP16: FP16 tile operations
-=09=09hreset =09=09=09=09:  1, // HRESET (Thread director history reset)
+=09=09hreset=09=09=09=09:  1, // HRESET (Thread director history reset)
 =09=09avx_ifma=09=09=09:  1, // Integer fused multiply add
 =09=09=09=09=09=09:  2, // Reserved
 =09=09lam=09=09=09=09:  1, // Linear address masking
@@ -414,8 +414,8 @@ struct leaf_0x7_2 {
 =09u32=09intel_psfd=09=09=09:  1, // Intel predictive store forward disabl=
e
 =09=09ipred_ctrl=09=09=09:  1, // MSR bits IA32_SPEC_CTRL.IPRED_DIS_{U,S}
 =09=09rrsba_ctrl=09=09=09:  1, // MSR bits IA32_SPEC_CTRL.RRSBA_DIS_{U,S}
-=09=09ddp_ctrl=09=09=09:  1, // MSR bit  IA32_SPEC_CTRL.DDPD_U
-=09=09bhi_ctrl=09=09=09:  1, // MSR bit  IA32_SPEC_CTRL.BHI_DIS_S
+=09=09ddp_ctrl=09=09=09:  1, // MSR bit IA32_SPEC_CTRL.DDPD_U
+=09=09bhi_ctrl=09=09=09:  1, // MSR bit IA32_SPEC_CTRL.BHI_DIS_S
 =09=09mcdt_no=09=09=09=09:  1, // MCDT mitigation not needed
 =09=09uclock_disable=09=09=09:  1, // UC-lock disable
 =09=09=09=09=09=09: 25; // Reserved
@@ -547,7 +547,7 @@ struct leaf_0xd_1 {
 =09=09=09=09=09=09:  1, // Reserved
 =09=09xss_pasid=09=09=09:  1, // PASID state
 =09=09xss_cet_u=09=09=09:  1, // CET user state
-=09=09xss_cet_p=09=09=09:  1, // CET supervisor state
+=09=09xss_cet_s=09=09=09:  1, // CET supervisor state
 =09=09xss_hdc=09=09=09=09:  1, // HDC state
 =09=09xss_uintr=09=09=09:  1, // UINTR state
 =09=09xss_lbr=09=09=09=09:  1, // LBR state
@@ -780,7 +780,7 @@ struct leaf_0x14_0 {
=20
 struct leaf_0x14_1 {
 =09// eax
-=09u32=09num_address_ranges=09=09:  3, // Number of configurable Address R=
anges
+=09u32=09num_address_ranges=09=09:  3, // Number of configurable address r=
anges
 =09=09=09=09=09=09: 13, // Reserved
 =09=09mtc_periods_bmp=09=09=09: 16; // MTC period encodings bitmap
 =09// ebx
@@ -842,7 +842,7 @@ struct leaf_0x17_0 {
 =09// ecx
 =09u32=09soc_proj_id=09=09=09: 32; // SoC project ID, assigned by vendor
 =09// edx
-=09u32=09soc_stepping_id=09=09=09: 32; // Soc project stepping ID, assigne=
d by vendor
+=09u32=09soc_stepping_id=09=09=09: 32; // SoC project stepping ID, assigne=
d by vendor
 };
=20
 struct leaf_0x17_n {
@@ -883,7 +883,7 @@ struct leaf_0x18_n {
 =09=09tlb_cache_level=09=09=09:  3, // Translation cache level (1-based)
 =09=09is_fully_associative=09=09:  1, // Fully-associative
 =09=09=09=09=09=09:  5, // Reserved
-=09=09tlb_max_addressible_ids=09=09: 12, // Max number of addressable IDs =
- 1
+=09=09tlb_max_addressable_ids=09=09: 12, // Max number of addressable IDs =
- 1
 =09=09=09=09=09=09:  6; // Reserved
 };
=20
@@ -897,7 +897,7 @@ struct leaf_0x18_n {
=20
 struct leaf_0x19_0 {
 =09// eax
-=09u32=09kl_cpl0_only=09=09=09:  1, // CPL0-only key Locker restriction
+=09u32=09kl_cpl0_only=09=09=09:  1, // CPL0-only key locker restriction
 =09=09kl_no_encrypt=09=09=09:  1, // No-encrypt key locker restriction
 =09=09kl_no_decrypt=09=09=09:  1, // No-decrypt key locker restriction
 =09=09=09=09=09=09: 29; // Reserved
@@ -962,7 +962,7 @@ struct leaf_0x1c_0 {
 =09// eax
 =09u32=09lbr_depth_mask=09=09=09:  8, // Max LBR stack depth bitmask
 =09=09=09=09=09=09: 22, // Reserved
-=09=09lbr_deep_c_reset=09=09:  1, // LBRs maybe cleared on MWAIT C-state >=
 C1
+=09=09lbr_deep_c_reset=09=09:  1, // LBRs may be cleared on MWAIT C-state =
> C1
 =09=09lbr_ip_is_lip=09=09=09:  1; // LBR IP contain Last IP (otherwise eff=
ective IP)
 =09// ebx
 =09u32=09lbr_cpl=09=09=09=09:  1, // CPL filtering
@@ -1079,9 +1079,9 @@ struct leaf_0x21_0 {
 =09// ebx
 =09u32=09tdx_vendorid_0=09=09=09: 32; // TDX vendor ID string bytes 0 - 3
 =09// ecx
-=09u32=09tdx_vendorid_2=09=09=09: 32; // CPU vendor ID string bytes 8 - 11
+=09u32=09tdx_vendorid_2=09=09=09: 32; // TDX vendor ID string bytes 8 - 11
 =09// edx
-=09u32=09tdx_vendorid_1=09=09=09: 32; // CPU vendor ID string bytes 4 - 7
+=09u32=09tdx_vendorid_1=09=09=09: 32; // TDX vendor ID string bytes 4 - 7
 };
=20
 /*
@@ -1281,12 +1281,12 @@ struct leaf_0x4c780001_0 {
 =09=09flexpriority=09=09=09:  1, // Intel FlexPriority
 =09=09ept=09=09=09=09:  1, // Intel Extended Page Table
 =09=09vpid=09=09=09=09:  1, // Intel Virtual Processor ID
-=09=09coherency_sfw_no=09=09:  1, // SNP cache coherency software work aro=
und not needed
+=09=09coherency_sfw_no=09=09:  1, // SNP cache coherency software workarou=
nd not needed
 =09=09=09=09=09=09: 10, // Reserved
 =09=09vmmcall=09=09=09=09:  1, // Prefer VMMCALL to VMCALL
 =09=09xenpv=09=09=09=09:  1, // Xen paravirtual guest
 =09=09ept_ad=09=09=09=09:  1, // Intel Extended Page Table access-dirty bi=
t
-=09=09VMCALL=09=09=09=09:  1, // Hypervisor supports the VMCALL instructio=
n
+=09=09vmcall=09=09=09=09:  1, // Hypervisor supports the VMCALL instructio=
n
 =09=09vmw_vmmcall=09=09=09:  1, // VMware prefers the VMMCALL instruction
 =09=09pvunlock=09=09=09:  1, // PV unlock function
 =09=09vcpupreempt=09=09=09:  1, // PV vcpu_is_preempted function
@@ -1384,7 +1384,7 @@ struct leaf_0x4c780002_0 {
 =09=09spec_store_bypass=09=09:  1, // CPU affected by speculative store by=
pass attack
 =09=09l1tf=09=09=09=09:  1, // CPU affected by L1 Terminal Fault
 =09=09mds=09=09=09=09:  1, // CPU affected by Microarchitectural data samp=
ling
-=09=09msbds_only=09=09=09:  1, // Microarchitectural data sampling: CPU on=
ly affected by the MSDBS variant
+=09=09msbds_only=09=09=09:  1, // Microarchitectural data sampling: CPU on=
ly affected by the MSBDS variant
 =09=09swapgs=09=09=09=09:  1, // CPU affected by speculation through SWAPG=
S
 =09=09taa=09=09=09=09:  1, // CPU is affected by TSX Async Abort (TAA)
 =09=09itlb_multihit=09=09=09:  1, // CPU may incur MCE during certain page=
 attribute changes
@@ -1732,7 +1732,7 @@ struct leaf_0x8000000a_0 {
 =09=09lbr_virt=09=09=09:  1, // LBR virtualization
 =09=09svm_lock=09=09=09:  1, // SVM lock
 =09=09nrip_save=09=09=09:  1, // NRIP save support on #VMEXIT
-=09=09tsc_rate_msr=09=09=09:  1, // MSR based TSC rate control
+=09=09tsc_rate_msr=09=09=09:  1, // MSR-based TSC rate control
 =09=09vmcb_clean=09=09=09:  1, // VMCB clean bits support
 =09=09flush_by_asid=09=09=09:  1, // Flush by ASID + Extended VMCB TLB_Con=
trol
 =09=09decode_assists=09=09=09:  1, // Decode Assists support
@@ -1790,7 +1790,7 @@ struct leaf_0x8000001a_0 {
 =09// eax
 =09u32=09fp_128=09=09=09=09:  1, // Internal FP/SIMD exec data path is 128=
-bits wide
 =09=09movu_preferred=09=09=09:  1, // SSE: MOVU* better than MOVL*/MOVH*
-=09=09fp_256=09=09=09=09:  1, // internal FP/SSE exec data path is 256-bit=
s wide
+=09=09fp_256=09=09=09=09:  1, // Internal FP/SSE exec data path is 256-bit=
s wide
 =09=09=09=09=09=09: 29; // Reserved
 =09// ebx
 =09u32=09=09=09=09=09: 32; // Reserved
@@ -1836,7 +1836,7 @@ struct leaf_0x8000001b_0 {
 struct leaf_0x8000001c_0 {
 =09// eax
 =09u32=09os_lwp_avail=09=09=09:  1, // OS: LWP is available to application=
 programs
-=09=09os_lpwval=09=09=09:  1, // OS: LWPVAL instruction
+=09=09os_lwpval=09=09=09:  1, // OS: LWPVAL instruction
 =09=09os_lwp_ire=09=09=09:  1, // OS: Instructions Retired Event
 =09=09os_lwp_bre=09=09=09:  1, // OS: Branch Retired Event
 =09=09os_lwp_dme=09=09=09:  1, // OS: Dcache Miss Event
@@ -1856,7 +1856,7 @@ struct leaf_0x8000001c_0 {
 =09=09lwp_data_addr=09=09=09:  1, // Cache miss events report data cache a=
ddress
 =09=09lwp_latency_rnd=09=09=09:  3, // Cache latency rounding amount
 =09=09lwp_version=09=09=09:  7, // LWP version
-=09=09lwp_buf_min_sz=09=09=09:  8, // LWP event ring buffer min size, 32 e=
vent records units
+=09=09lwp_buf_min_sz=09=09=09:  8, // LWP event ring buffer min size, 32 e=
vent record units
 =09=09=09=09=09=09:  4, // Reserved
 =09=09lwp_branch_predict=09=09:  1, // Branches Retired events can be filt=
ered
 =09=09lwp_ip_filtering=09=09:  1, // IP filtering (IPI, IPF, BaseIP, and L=
imitIP @ LWPCP)
@@ -1864,7 +1864,7 @@ struct leaf_0x8000001c_0 {
 =09=09lwp_cache_latency=09=09:  1; // Cache-related events: filter by late=
ncy
 =09// edx
 =09u32=09hw_lwp_avail=09=09=09:  1, // HW: LWP available
-=09=09hw_lpwval=09=09=09:  1, // HW: LWPVAL available
+=09=09hw_lwpval=09=09=09:  1, // HW: LWPVAL available
 =09=09hw_lwp_ire=09=09=09:  1, // HW: Instructions Retired Event
 =09=09hw_lwp_bre=09=09=09:  1, // HW: Branch Retired Event
 =09=09hw_lwp_dme=09=09=09:  1, // HW: Dcache Miss Event
@@ -2051,8 +2051,8 @@ struct leaf_0x80000021_0 {
 =09=09upper_addr_ignore=09=09:  1, // EFER MSR Upper Address Ignore
 =09=09auto_ibrs=09=09=09:  1, // EFER MSR Automatic IBRS
 =09=09no_smm_ctl_msr=09=09=09:  1, // SMM_CTL MSR not available
-=09=09fsrs=09=09=09=09:  1, // Fast Short Rep STOSB
-=09=09fsrc=09=09=09=09:  1, // Fast Short Rep CMPSB
+=09=09fsrs=09=09=09=09:  1, // Fast Short REP STOSB
+=09=09fsrc=09=09=09=09:  1, // Fast Short REP CMPSB
 =09=09=09=09=09=09:  1, // Reserved
 =09=09prefetch_ctl_msr=09=09:  1, // Prefetch control MSR
 =09=09=09=09=09=09:  2, // Reserved
@@ -2157,11 +2157,11 @@ struct leaf_0x80860000_0 {
 =09// eax
 =09u32=09max_tra_leaf=09=09=09: 32; // Maximum Transmeta leaf
 =09// ebx
-=09u32=09cpu_vendorid_0=09=09=09: 32; // Transmeta Vendor ID string bytes =
0 - 3
+=09u32=09cpu_vendorid_0=09=09=09: 32; // Transmeta vendor ID string bytes =
0 - 3
 =09// ecx
-=09u32=09cpu_vendorid_2=09=09=09: 32; // Transmeta Vendor ID string bytes =
8 - 11
+=09u32=09cpu_vendorid_2=09=09=09: 32; // Transmeta vendor ID string bytes =
8 - 11
 =09// edx
-=09u32=09cpu_vendorid_1=09=09=09: 32; // Transmeta Vendor ID string bytes =
4 - 7
+=09u32=09cpu_vendorid_1=09=09=09: 32; // Transmeta vendor ID string bytes =
4 - 7
 };
=20
 /*
diff --git a/tools/arch/x86/kcpuid/cpuid.csv b/tools/arch/x86/kcpuid/cpuid.=
csv
index d25346733aac..45a876d3519f 100644
--- a/tools/arch/x86/kcpuid/cpuid.csv
+++ b/tools/arch/x86/kcpuid/cpuid.csv
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: CC0-1.0
-# Generator: x86-cpuid-db v3.0
+# Generator: x86-cpuid-db v3.1
=20
 #
 # Auto-generated file.
@@ -177,7 +177,7 @@
        0x6,         0,  ebx,     3:0,    n_therm_thresholds     , Digital =
thermometer thresholds
        0x6,         0,  ecx,       0,    aperfmperf             , MPERF/AP=
ERF MSRs (effective frequency interface)
        0x6,         0,  ecx,       3,    epb                    , IA32_ENE=
RGY_PERF_BIAS MSR
-       0x6,         0,  ecx,    15:8,    thrd_director_nclasses , Number o=
f classes, Intel thread director
+       0x6,         0,  ecx,    15:8,    hw_feedback_nclasses   , Number o=
f Intel Thread Director classes
        0x6,         0,  edx,       0,    perfcap_reporting      , Performa=
nce capability reporting
        0x6,         0,  edx,       1,    encap_reporting        , Energy e=
fficiency capability reporting
        0x6,         0,  edx,    11:8,    feedback_sz            , Feedback=
 interface structure size, in 4K pages
@@ -247,10 +247,10 @@
        0x7,         0,  edx,       1,    sgx_keys               , Intel SG=
X attestation services
        0x7,         0,  edx,       2,    avx512_4vnniw          , AVX-512 =
neural network instructions
        0x7,         0,  edx,       3,    avx512_4fmaps          , AVX-512 =
multiply accumulation single precision
-       0x7,         0,  edx,       4,    fsrm                   , Fast sho=
rt REP MOV
+       0x7,         0,  edx,       4,    fsrm                   , Fast sho=
rt REP MOVSB
        0x7,         0,  edx,       5,    uintr                  , User int=
errupts
        0x7,         0,  edx,       8,    avx512_vp2intersect    , VP2INTER=
SECT{D,Q} instructions
-       0x7,         0,  edx,       9,    srdbs_ctrl             , SRBDS mi=
tigation MSR
+       0x7,         0,  edx,       9,    srbds_ctrl             , SRBDS mi=
tigation MSR
        0x7,         0,  edx,      10,    md_clear               , VERW MD_=
CLEAR microcode
        0x7,         0,  edx,      11,    rtm_always_abort       , XBEGIN (=
RTM transaction) always aborts
        0x7,         0,  edx,      13,    tsx_force_abort        , MSR TSX_=
FORCE_ABORT, RTM_ABORT bit
@@ -296,8 +296,8 @@
        0x7,         2,  edx,       0,    intel_psfd             , Intel pr=
edictive store forward disable
        0x7,         2,  edx,       1,    ipred_ctrl             , MSR bits=
 IA32_SPEC_CTRL.IPRED_DIS_{U,S}
        0x7,         2,  edx,       2,    rrsba_ctrl             , MSR bits=
 IA32_SPEC_CTRL.RRSBA_DIS_{U,S}
-       0x7,         2,  edx,       3,    ddp_ctrl               , MSR bit =
 IA32_SPEC_CTRL.DDPD_U
-       0x7,         2,  edx,       4,    bhi_ctrl               , MSR bit =
 IA32_SPEC_CTRL.BHI_DIS_S
+       0x7,         2,  edx,       3,    ddp_ctrl               , MSR bit =
IA32_SPEC_CTRL.DDPD_U
+       0x7,         2,  edx,       4,    bhi_ctrl               , MSR bit =
IA32_SPEC_CTRL.BHI_DIS_S
        0x7,         2,  edx,       5,    mcdt_no                , MCDT mit=
igation not needed
        0x7,         2,  edx,       6,    uclock_disable         , UC-lock =
disable
=20
@@ -368,7 +368,7 @@
        0xd,         1,  ecx,       8,    xss_pt                 , PT state
        0xd,         1,  ecx,      10,    xss_pasid              , PASID st=
ate
        0xd,         1,  ecx,      11,    xss_cet_u              , CET user=
 state
-       0xd,         1,  ecx,      12,    xss_cet_p              , CET supe=
rvisor state
+       0xd,         1,  ecx,      12,    xss_cet_s              , CET supe=
rvisor state
        0xd,         1,  ecx,      13,    xss_hdc                , HDC stat=
e
        0xd,         1,  ecx,      14,    xss_uintr              , UINTR st=
ate
        0xd,         1,  ecx,      15,    xss_lbr                , LBR stat=
e
@@ -468,7 +468,7 @@
       0x14,         0,  ecx,       2,    single_range_output    , Single-r=
ange output
       0x14,         0,  ecx,       3,    trace_transport_output , Trace Tr=
ansport subsystem output
       0x14,         0,  ecx,      31,    ip_payloads_lip        , IP paylo=
ads have LIP values (CS base included)
-      0x14,         1,  eax,     2:0,    num_address_ranges     , Number o=
f configurable Address Ranges
+      0x14,         1,  eax,     2:0,    num_address_ranges     , Number o=
f configurable address ranges
       0x14,         1,  eax,   31:16,    mtc_periods_bmp        , MTC peri=
od encodings bitmap
       0x14,         1,  ebx,    15:0,    cycle_thresholds_bmp   , Cycle Th=
reshold encodings bitmap
       0x14,         1,  ebx,   31:16,    psb_periods_bmp        , Configur=
able PSB frequency encodings bitmap
@@ -494,7 +494,7 @@
       0x17,         0,  ebx,    15:0,    soc_vendor_id          , SoC vend=
or ID
       0x17,         0,  ebx,      16,    is_vendor_scheme       , Assigned=
 by industry enumeration scheme (not Intel)
       0x17,         0,  ecx,    31:0,    soc_proj_id            , SoC proj=
ect ID, assigned by vendor
-      0x17,         0,  edx,    31:0,    soc_stepping_id        , Soc proj=
ect stepping ID, assigned by vendor
+      0x17,         0,  edx,    31:0,    soc_stepping_id        , SoC proj=
ect stepping ID, assigned by vendor
       0x17,       3:1,  eax,    31:0,    vendor_brand_a         , Vendor B=
rand ID string, bytes subleaf_nr * (0 -> 3)
       0x17,       3:1,  ebx,    31:0,    vendor_brand_b         , Vendor B=
rand ID string, bytes subleaf_nr * (4 -> 7)
       0x17,       3:1,  ecx,    31:0,    vendor_brand_c         , Vendor B=
rand ID string, bytes subleaf_nr * (8 -> 11)
@@ -514,12 +514,12 @@
       0x18,      31:0,  edx,     4:0,    tlb_type               , Translat=
ion cache type (TLB type)
       0x18,      31:0,  edx,     7:5,    tlb_cache_level        , Translat=
ion cache level (1-based)
       0x18,      31:0,  edx,       8,    is_fully_associative   , Fully-as=
sociative
-      0x18,      31:0,  edx,   25:14,    tlb_max_addressible_ids, Max numb=
er of addressable IDs - 1
+      0x18,      31:0,  edx,   25:14,    tlb_max_addressable_ids, Max numb=
er of addressable IDs - 1
=20
 # Leaf 19H
 # Intel key locker
=20
-      0x19,         0,  eax,       0,    kl_cpl0_only           , CPL0-onl=
y key Locker restriction
+      0x19,         0,  eax,       0,    kl_cpl0_only           , CPL0-onl=
y key locker restriction
       0x19,         0,  eax,       1,    kl_no_encrypt          , No-encry=
pt key locker restriction
       0x19,         0,  eax,       2,    kl_no_decrypt          , No-decry=
pt key locker restriction
       0x19,         0,  ebx,       0,    aes_keylocker          , AES key =
locker instructions
@@ -546,7 +546,7 @@
 # Intel LBR (Last Branch Record)
=20
       0x1c,         0,  eax,     7:0,    lbr_depth_mask         , Max LBR =
stack depth bitmask
-      0x1c,         0,  eax,      30,    lbr_deep_c_reset       , LBRs may=
be cleared on MWAIT C-state > C1
+      0x1c,         0,  eax,      30,    lbr_deep_c_reset       , LBRs may=
 be cleared on MWAIT C-state > C1
       0x1c,         0,  eax,      31,    lbr_ip_is_lip          , LBR IP c=
ontain Last IP (otherwise effective IP)
       0x1c,         0,  ebx,       0,    lbr_cpl                , CPL filt=
ering
       0x1c,         0,  ebx,       1,    lbr_branch_filter      , Branch f=
iltering
@@ -591,8 +591,8 @@
 # Intel TD (Trust Domain)
=20
       0x21,         0,  ebx,    31:0,    tdx_vendorid_0         , TDX vend=
or ID string bytes 0 - 3
-      0x21,         0,  ecx,    31:0,    tdx_vendorid_2         , CPU vend=
or ID string bytes 8 - 11
-      0x21,         0,  edx,    31:0,    tdx_vendorid_1         , CPU vend=
or ID string bytes 4 - 7
+      0x21,         0,  ecx,    31:0,    tdx_vendorid_2         , TDX vend=
or ID string bytes 8 - 11
+      0x21,         0,  edx,    31:0,    tdx_vendorid_1         , TDX vend=
or ID string bytes 4 - 7
=20
 # Leaf 23H
 # Intel Architectural Performance Monitoring Extended (ArchPerfmonExt)
@@ -857,7 +857,7 @@
 0x8000000a,         0,  edx,       1,    lbrv                   , LBR virt=
ualization
 0x8000000a,         0,  edx,       2,    svm_lock               , SVM lock
 0x8000000a,         0,  edx,       3,    nrip_save              , NRIP sav=
e support on #VMEXIT
-0x8000000a,         0,  edx,       4,    tsc_scale              , MSR base=
d TSC rate control
+0x8000000a,         0,  edx,       4,    tsc_scale              , MSR-base=
d TSC rate control
 0x8000000a,         0,  edx,       5,    vmcb_clean             , VMCB cle=
an bits support
 0x8000000a,         0,  edx,       6,    flushbyasid            , Flush by=
 ASID + Extended VMCB TLB_Control
 0x8000000a,         0,  edx,       7,    decodeassists          , Decode A=
ssists support
@@ -895,7 +895,7 @@
=20
 0x8000001a,         0,  eax,       0,    fp_128                 , Internal=
 FP/SIMD exec data path is 128-bits wide
 0x8000001a,         0,  eax,       1,    movu_preferred         , SSE: MOV=
U* better than MOVL*/MOVH*
-0x8000001a,         0,  eax,       2,    fp_256                 , internal=
 FP/SSE exec data path is 256-bits wide
+0x8000001a,         0,  eax,       2,    fp_256                 , Internal=
 FP/SSE exec data path is 256-bits wide
=20
 # Leaf 8000001BH
 # AMD IBS (Instruction-Based Sampling)
@@ -917,7 +917,7 @@
 # AMD LWP (Lightweight Profiling)
=20
 0x8000001c,         0,  eax,       0,    os_lwp_avail           , OS: LWP =
is available to application programs
-0x8000001c,         0,  eax,       1,    os_lpwval              , OS: LWPV=
AL instruction
+0x8000001c,         0,  eax,       1,    os_lwpval              , OS: LWPV=
AL instruction
 0x8000001c,         0,  eax,       2,    os_lwp_ire             , OS: Inst=
ructions Retired Event
 0x8000001c,         0,  eax,       3,    os_lwp_bre             , OS: Bran=
ch Retired Event
 0x8000001c,         0,  eax,       4,    os_lwp_dme             , OS: Dcac=
he Miss Event
@@ -934,13 +934,13 @@
 0x8000001c,         0,  ecx,       5,    lwp_data_addr          , Cache mi=
ss events report data cache address
 0x8000001c,         0,  ecx,     8:6,    lwp_latency_rnd        , Cache la=
tency rounding amount
 0x8000001c,         0,  ecx,    15:9,    lwp_version            , LWP vers=
ion
-0x8000001c,         0,  ecx,   23:16,    lwp_buf_min_sz         , LWP even=
t ring buffer min size, 32 event records units
+0x8000001c,         0,  ecx,   23:16,    lwp_buf_min_sz         , LWP even=
t ring buffer min size, 32 event record units
 0x8000001c,         0,  ecx,      28,    lwp_branch_predict     , Branches=
 Retired events can be filtered
 0x8000001c,         0,  ecx,      29,    lwp_ip_filtering       , IP filte=
ring (IPI, IPF, BaseIP, and LimitIP @ LWPCP)
 0x8000001c,         0,  ecx,      30,    lwp_cache_levels       , Cache-re=
lated events: filter by cache level
 0x8000001c,         0,  ecx,      31,    lwp_cache_latency      , Cache-re=
lated events: filter by latency
 0x8000001c,         0,  edx,       0,    hw_lwp_avail           , HW: LWP =
available
-0x8000001c,         0,  edx,       1,    hw_lpwval              , HW: LWPV=
AL available
+0x8000001c,         0,  edx,       1,    hw_lwpval              , HW: LWPV=
AL available
 0x8000001c,         0,  edx,       2,    hw_lwp_ire             , HW: Inst=
ructions Retired Event
 0x8000001c,         0,  edx,       3,    hw_lwp_bre             , HW: Bran=
ch Retired Event
 0x8000001c,         0,  edx,       4,    hw_lwp_dme             , HW: Dcac=
he Miss Event
@@ -1040,8 +1040,8 @@
 0x80000021,         0,  eax,       7,    upper_addr_ignore      , EFER MSR=
 Upper Address Ignore
 0x80000021,         0,  eax,       8,    autoibrs               , EFER MSR=
 Automatic IBRS
 0x80000021,         0,  eax,       9,    no_smm_ctl_msr         , SMM_CTL =
MSR not available
-0x80000021,         0,  eax,      10,    fsrs                   , Fast Sho=
rt Rep STOSB
-0x80000021,         0,  eax,      11,    fsrc                   , Fast Sho=
rt Rep CMPSB
+0x80000021,         0,  eax,      10,    fsrs                   , Fast Sho=
rt REP STOSB
+0x80000021,         0,  eax,      11,    fsrc                   , Fast Sho=
rt REP CMPSB
 0x80000021,         0,  eax,      13,    prefetch_ctl_msr       , Prefetch=
 control MSR
 0x80000021,         0,  eax,      16,    opcode_reclaim         , Reserves=
 opcode space
 0x80000021,         0,  eax,      17,    user_cpuid_disable     , #GP when=
 executing CPUID at CPL > 0
@@ -1093,9 +1093,9 @@
 # Maximum Transmeta leaf + CPU vendor string
=20
 0x80860000,         0,  eax,    31:0,    max_tra_leaf           , Maximum =
Transmeta leaf
-0x80860000,         0,  ebx,    31:0,    cpu_vendorid_0         , Transmet=
a Vendor ID string bytes 0 - 3
-0x80860000,         0,  ecx,    31:0,    cpu_vendorid_2         , Transmet=
a Vendor ID string bytes 8 - 11
-0x80860000,         0,  edx,    31:0,    cpu_vendorid_1         , Transmet=
a Vendor ID string bytes 4 - 7
+0x80860000,         0,  ebx,    31:0,    cpu_vendorid_0         , Transmet=
a vendor ID string bytes 0 - 3
+0x80860000,         0,  ecx,    31:0,    cpu_vendorid_2         , Transmet=
a vendor ID string bytes 8 - 11
+0x80860000,         0,  edx,    31:0,    cpu_vendorid_1         , Transmet=
a vendor ID string bytes 4 - 7
=20
 # Leaf 80860001H
 # Transmeta extended CPU features
--=20
2.54.0


