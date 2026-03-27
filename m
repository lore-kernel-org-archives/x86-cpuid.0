Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B57366541
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774578012; cv=none; b=U7sDExRoDZ5Jep7E6Tj3uks9DjnK6B7Lf9HdABBqharGwDAms58ZUhthyHq8yYuUcQQI4MOVCGJ6s+Pxr+UqZ4Gx5pC+DwXPahyHNpSpids/k9XLD1aYDgWPcGx/ds/WA0CENKclufRzScNibZ2tdK+HUWEufP0QNXR4LPFpm3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774578012; c=relaxed/simple;
	bh=jkMO0hjjn8157XNG/+Xi7KSBrnxHXTnPq+E1cKLTB1c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d59x2yqed3ecesn5MXTgVU4Hi/aRlbymLNNv67yS+8/IL+Z3EnkhZlfPpAw0GoQRot9pq8b5ltTgUnSJt1Zw6LzAU69jBSyQ/32uepTpaB01sz0R8UGa/HyoRw3YBJijeRVyWVNilIjMeSCkKUfto05CSnewqEDVdposgkRrilc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Z4rYMFNp; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kjxi6tnL; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Z4rYMFNp";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kjxi6tnL"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774578009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ANb4/iSYsCeq6/Qhn0I60Iai+Bv+XF6XwjH/S1GPJ4A=;
	b=Z4rYMFNp9zYOR2268bUSrx29Bimr4ohKMn0UexXcQaFIXahd+mnhd13p4dKWLHjdRROx/Z
	ultzUPbvMHvCbJwOE8nMoANaspNS0ljNiEOsZeLty6+R7B8PKaTIvj0Ob2CPT1QQgOGywl
	/B19WPM/N9+8D/PTBzzKol9+ljiIn5iZezEKZPEpFX5nLktkgIjpUDZHcrra9LwnhRT5ZU
	lMTQGsu2HigMY1lRI60UpjpcUtL3cXHPxqWeIlRs9XK/XE9qWf4vEzptfwkGPgzOxlVJow
	ZRz1Lt/NvZY9o3d+qkhoxpKymBxd9ts7o8yfkhiD8CN8vmZbRZm6VpF2X1Mljg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774578009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ANb4/iSYsCeq6/Qhn0I60Iai+Bv+XF6XwjH/S1GPJ4A=;
	b=kjxi6tnL4gbO71o/vTyGWVD+OD8ddpuloIKe7wartlbCoA9YN/z1pCHtyp55+Ag8+nnJ3G
	ZiQq6w6i6b5Z28Cg==
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
Subject: [PATCH v6 46/90] x86/cpu/amd: Refactor TLB detection code
Date: Fri, 27 Mar 2026 03:16:00 +0100
Message-ID: <20260327021645.555257-47-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

AMD's TLB init code fills below global variables:

    - tlb_lld_4k, tlb_lli_4k
    - tlb_lld_2m, tlb_lli_2m
    - tlb_lld_4m, tlb_lli_4m

CPUID(0x80000006) reports these DTLB/ITLB numbers for L2, while
CPUID(0x80000005) reports such numbers for L1.

The code sets these variables with the L2 numbers by default.  If the
latter is not available, then the L1 numbers are used as a fallback.

Refactor the TLB init logic before converting it to the parsed CPUID API.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/amd.c | 54 ++++++++++++++++-----------------------
 1 file changed, 22 insertions(+), 32 deletions(-)

diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
index 67c983fd8d67..e13f5d05d7cf 100644
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -1179,50 +1179,40 @@ static unsigned int amd_size_cache(struct cpuinfo_x86 *c, unsigned int size)
 
 static void cpu_detect_tlb_amd(struct cpuinfo_x86 *c)
 {
-	u32 ebx, eax, ecx, edx;
-	u16 mask = 0xfff;
+	u32 l2_tlb_eax, l2_tlb_ebx, l1_tlb_eax;
+	u16 l2_mask = 0xfff, l1_mask = 0xff;
 
-	if (c->x86 < 0xf)
+	if (c->x86 < 0xf || c->extended_cpuid_level < 0x80000006)
 		return;
 
-	if (c->extended_cpuid_level < 0x80000006)
-		return;
-
-	cpuid(0x80000006, &eax, &ebx, &ecx, &edx);
+	l2_tlb_eax = cpuid_eax(0x80000006);
+	l2_tlb_ebx = cpuid_ebx(0x80000006);
+	l1_tlb_eax = cpuid_eax(0x80000005);
 
-	tlb_lld_4k = (ebx >> 16) & mask;
-	tlb_lli_4k = ebx & mask;
+	tlb_lld_4k = (l2_tlb_ebx >> 16) & l2_mask;
+	tlb_lli_4k = l2_tlb_ebx & l2_mask;
 
 	/*
-	 * K8 doesn't have 2M/4M entries in the L2 TLB so read out the L1 TLB
-	 * characteristics from the CPUID function 0x80000005 instead.
+	 * K8 does not report 2M/4M entries in the L2 TLB, so always use
+	 * the L1 TLB information there.  On later CPUs, fall back to L1
+	 * when the L2 entry count is zero.
 	 */
-	if (c->x86 == 0xf) {
-		cpuid(0x80000005, &eax, &ebx, &ecx, &edx);
-		mask = 0xff;
-	}
 
-	/* Handle DTLB 2M and 4M sizes, fall back to L1 if L2 is disabled */
-	if (!((eax >> 16) & mask))
-		tlb_lld_2m = (cpuid_eax(0x80000005) >> 16) & 0xff;
-	else
-		tlb_lld_2m = (eax >> 16) & mask;
-
-	/* a 4M entry uses two 2M entries */
-	tlb_lld_4m = tlb_lld_2m >> 1;
+	tlb_lld_2m = (l2_tlb_eax >> 16) & l2_mask;
+	if (c->x86 == 0xf || !tlb_lld_2m)
+		tlb_lld_2m = (l1_tlb_eax >> 16) & l1_mask;
 
-	/* Handle ITLB 2M and 4M sizes, fall back to L1 if L2 is disabled */
-	if (!(eax & mask)) {
+	tlb_lli_2m = l2_tlb_eax & l2_mask;
+	if (c->x86 == 0xf || !tlb_lli_2m) {
 		/* Erratum 658 */
-		if (c->x86 == 0x15 && c->x86_model <= 0x1f) {
+		if (c->x86 == 0x15 && c->x86_model <= 0x1f)
 			tlb_lli_2m = 1024;
-		} else {
-			cpuid(0x80000005, &eax, &ebx, &ecx, &edx);
-			tlb_lli_2m = eax & 0xff;
-		}
-	} else
-		tlb_lli_2m = eax & mask;
+		else
+			tlb_lli_2m = l1_tlb_eax & l1_mask;
+	}
 
+	/* A 4M entry uses two 2M entries */
+	tlb_lld_4m = tlb_lld_2m >> 1;
 	tlb_lli_4m = tlb_lli_2m >> 1;
 
 	/* Max number of pages INVLPGB can invalidate in one shot */
-- 
2.53.0

