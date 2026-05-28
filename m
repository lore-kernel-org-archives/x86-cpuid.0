Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF645425CEF
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982925; cv=none; b=oBsVqqua3+5IB/ezgPTjEPpqkpK7zOqsVIySJWLWc020O0pC2aczLXSrMzzoNXHPkCfvKPc0c62kcb/Ti5O2l9KcMx4//UgtpWfqWGGajbV79BXUQVxwRKT6WAjdbnB59ox+Viah4LSLN6HmHtGWBkyX6x8LwcTwl84mFCHB8kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982925; c=relaxed/simple;
	bh=ls52o/+0n/oyBy5+3dcjZ3Jn6o3kFQh2nb/7fu/2Hwo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uQQwwFu8gBRDMyTcSS4fjXxlqSveVFeE5CJT/SsE4klPTybz53dtBDpZBu3tQ2P5dwlVMuYdybz77pSNsAAY/471hxFI5FI83A04k8+WsGgN5mpjsg4y9phyDw5wAMTZL/j6mSdXGai/XM/EyzyBC76c3y/DqwFED8DFTC3ZKEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=WrPXlghP; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=oSRvCf45; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="WrPXlghP";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="oSRvCf45"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kuibS2UE6uskMT++84iYFg6jbKd27L4S+aSTBgNRgLE=;
	b=WrPXlghPgdNrqA92ZgCGcYgYxrJt2NA2K3FUJw+o7+eiUmYFt5GdFhAakwmCxXsu2U8w6E
	//IerS9UhHy/DWckZMF1qg86TN9Y/I4tTXjEvGAv5SivEW0NeJ334DHsQZgKcnDsvcimsg
	P030DXUDxcjZ/27yaZ9cwvYXKib9874VQZktE86lPV+of92YIm1xo7A3LqDmF8MZweWWeS
	wJ01YA14AUPg5wALWX6PFWg6ZSzwp8Qs4Yr8TB8ONmryoDnD5+jBlZBIaMZ2r2jhz2I+ii
	IBJoWbgSvagDQQFoOKLeqFEvC4Z9bzTxOuhXat/8KFlEO6i27/WTJ8+uPi87hw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kuibS2UE6uskMT++84iYFg6jbKd27L4S+aSTBgNRgLE=;
	b=oSRvCf45KFYqOxXD+62eqNnwgxrinm+56FKtQvr2G9YoHHV8/GqOTN2QZ+7HqYa2tAAPb5
	7SqQvMxfsMy/vcDw==
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
Subject: [PATCH v7 041/120] x86/cpu/amd: Refactor TLB detection code
Date: Thu, 28 May 2026 17:38:03 +0200
Message-ID: <20260528153923.403473-42-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
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
index 4fa16f2fd402..36276a21b840 100644
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -1186,50 +1186,40 @@ static unsigned int amd_size_cache(struct cpuinfo_x86 *c, unsigned int size)
 
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
2.54.0

