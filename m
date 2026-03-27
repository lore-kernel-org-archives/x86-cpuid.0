Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE06C371063
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774578054; cv=none; b=KHJRbqeYCvk8e3buEGsyePxqiCZrfK2re8wSlgS/LzxDV0piNCezp3eN9hFhhGWmDIQ4Bm2qG0TuvNUtAGRunlk3bmaM56UlVO/oK33Yv3bV5PXwagvpYPVuA8g3GKETacTZPLucpCNHYXsUX9CACjMbyIMNOFybTkuva3syw+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774578054; c=relaxed/simple;
	bh=PpQZQwVsIHVzCnYbAsCkY08mFzSN1Fxi90+5jsTuZ6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XB+iSLATI/S0jG3NXYXccDcLLXloQVgDtjzbOa2+KPhbAEqwpqr8UUAkf6TwHYzxK9wrdsN8tQJYL5bJ251QElwu4koGGV0yCLlSmHshdxtusL57r3+fosUlwJSbQuYU94eTSZBJ2qZANUE6R7nDEKmFb0dMJBZ3OpZe/ru1SEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2gfDN5xR; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=uArAP1KB; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2gfDN5xR";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="uArAP1KB"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774578052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bEq7gi5eXMZbKroKGqL036TDtP/MpkEQj5l9MEuMfhQ=;
	b=2gfDN5xRRNDO3Tqyi+ZURhA9fRvSymuvZbhbmuFfG3iJNSQkJMRK2D3ZPQCc9yUMqxXfEx
	xGjQYnulSossYLaxOMZKHflFq+FodKEQJXUnupJ73aufxvQIrGIof2jb8H+dVMbzqnFMgq
	X+ZDnAiSIdYcyc4fXkqOZ+OCuydwYSq2bB59foGOCGQ6TEGu0JSPzTRGL9uwDsesftKcgU
	5Tz0fa/oq7Kj73+yfjCpLh7EVpdBvcjlHoMKcIaSSzYM+TFa1nlB0f/XKS/F7drNV8iLeA
	r56x8Tr6gzfbFiCS6C+KMZk2Xi7Yt2hlsY/R4R/Lrxd2tWlXs2l5axJKU27XTg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774578052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bEq7gi5eXMZbKroKGqL036TDtP/MpkEQj5l9MEuMfhQ=;
	b=uArAP1KBugkTSr7gxmNjY0jGgZyrZHiN+rotgeD6g91Z/HI/OFHJ2Z7TeevKMJoZW6tfdt
	wz39wDIXnYdAyABQ==
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
Subject: [PATCH v6 57/90] x86/xen: Use parsed CPUID(0xa)
Date: Fri, 27 Mar 2026 03:16:11 +0100
Message-ID: <20260327021645.555257-58-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
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
2.53.0

