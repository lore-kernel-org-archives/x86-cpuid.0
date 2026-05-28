Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F7040245F
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983080; cv=none; b=OATc5dfufYUTUwSXbez9zshmmOC3FpVatp1wxp2fGZ/G9d7svquIpZp7WxaHbXcCfeLj9Q0ovd07oRknkO7FBlIjHVBnpJdOk4j/ELM2FoIT5pRbPqIoR4q/zW0dIex69DMp0Ugs9rm+NO51uUQCpY3mTLs8omoVzZvqXUqFWT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983080; c=relaxed/simple;
	bh=YVgTt8HIIwTAp+Pa5a6iVUPNemV47ySAcssRH68JK+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pHmvhhbVpmbgj1f0Dkroy65lz4M5GALR7xl7T/Xv0GcGVWtAy90x2GK+rC1o+JsoLry2fDeQW7ySjbqje1I1hAk5CbT5BwppxQFrcBJhxcOPWO/nC6GygjXzaHGPvJg9uYuMMyQrYs+1eyl+SjuL+d2hNfcU6RPzw6BsiuJbsrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=YrPvGbcq; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=EvsuuunP; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YrPvGbcq";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EvsuuunP"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/Ga/F62UWiylqt22ElnnYk+f5snfpub5VnpyZuFiaDI=;
	b=YrPvGbcq9xTPE4XI1NkSpTNBedkSD9VwbHuNgKLBb3Ymby2S1Ak8IOMvYG1EP7VNzu1GBW
	GauItKoCsuSTDB7coLdRiRUwugG+tlpDP/8mrSsOXPZfL6q9OV19gFOZclg4WyL9embB4B
	McE5v5RnL0u729nqS2M6XrGGmh5BrIlbYE66kEZIpgsGf92Hp5rqRw+vEysSVUEtaC1QeL
	wxPvGTnuFu46jez2jNby0b5i9n89lDUv6ftOh8PbEq52GEidjQ6mfahAHG9Kpi7DfmKghg
	InESFzfeCeUNS3FD3LUh8/1AO2kVse9WjNyYMYoHbIK8RQZPhJMnzHn3p7nWQQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/Ga/F62UWiylqt22ElnnYk+f5snfpub5VnpyZuFiaDI=;
	b=EvsuuunPCixGtuKYdY5GSfiGfoNQxOBaRRDvtUgxgmKRgrupk3P3NczUB5GBxyacRLhT82
	bW55UUZWm/JN1VDg==
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
Subject: [PATCH v7 087/120] x86/xen: Use parsed CPUID(0xa)
Date: Thu, 28 May 2026 17:38:49 +0200
Message-ID: <20260528153923.403473-88-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For Xen PMU, use parsed CPUID(0xa) instead of a direct CPUID query and ugly
bitwise operations.

Remove the PMU_{GENERAL,FIXED}_NR macros as they are no longer needed.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/xen/pmu.c | 26 +++++---------------------
 1 file changed, 5 insertions(+), 21 deletions(-)

diff --git a/arch/x86/xen/pmu.c b/arch/x86/xen/pmu.c
index 5f50a3ee08f5..b0ef35f2bad3 100644
--- a/arch/x86/xen/pmu.c
+++ b/arch/x86/xen/pmu.c
@@ -48,18 +48,6 @@ static __read_mostly int amd_num_counters;
 #define MSR_TYPE_ARCH_COUNTER       3
 #define MSR_TYPE_ARCH_CTRL          4
 
-/* Number of general pmu registers (CPUID.EAX[0xa].EAX[8..15]) */
-#define PMU_GENERAL_NR_SHIFT        8
-#define PMU_GENERAL_NR_BITS         8
-#define PMU_GENERAL_NR_MASK         (((1 << PMU_GENERAL_NR_BITS) - 1) \
-				     << PMU_GENERAL_NR_SHIFT)
-
-/* Number of fixed pmu registers (CPUID.EDX[0xa].EDX[0..4]) */
-#define PMU_FIXED_NR_SHIFT          0
-#define PMU_FIXED_NR_BITS           5
-#define PMU_FIXED_NR_MASK           (((1 << PMU_FIXED_NR_BITS) - 1) \
-				     << PMU_FIXED_NR_SHIFT)
-
 /* Alias registers (0x4c1) for full-width writes to PMCs */
 #define MSR_PMC_ALIAS_MASK          (~(MSR_IA32_PERFCTR0 ^ MSR_IA32_PMC0))
 
@@ -70,6 +58,8 @@ static __read_mostly int intel_num_arch_counters, intel_num_fixed_counters;
 
 static void xen_pmu_arch_init(void)
 {
+	const struct leaf_0xa_0 *leaf_a = cpuid_leaf(&boot_cpu_data, 0xa);
+
 	if (boot_cpu_data.x86_vendor == X86_VENDOR_AMD) {
 
 		switch (boot_cpu_data.x86) {
@@ -98,15 +88,9 @@ static void xen_pmu_arch_init(void)
 		amd_ctrls_base = MSR_K7_EVNTSEL0;
 		amd_msr_step = 1;
 		k7_counters_mirrored = 0;
-	} else {
-		uint32_t eax, ebx, ecx, edx;
-
-		cpuid(0xa, &eax, &ebx, &ecx, &edx);
-
-		intel_num_arch_counters = (eax & PMU_GENERAL_NR_MASK) >>
-			PMU_GENERAL_NR_SHIFT;
-		intel_num_fixed_counters = (edx & PMU_FIXED_NR_MASK) >>
-			PMU_FIXED_NR_SHIFT;
+	} else if (leaf_a) {
+		intel_num_arch_counters = leaf_a->num_counters_gp;
+		intel_num_fixed_counters = leaf_a->num_counters_fixed;
 	}
 }
 
-- 
2.54.0

