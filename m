Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84C5426EA9
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982930; cv=none; b=L1NMypYAoQItWY22ajEm6tfVlzK0T8t6JN9HKLK9y1ypBOohy8y5GGdIXz7p9hcJRSl+OrtWPNrdAv/YjT9Fpjo2D5M8b5p7CmJhv4pIWPkZ/p+4lW1hFCRyNovMIgvnafIITsPCWL4WyXAb5YiL0C5+Ih7Zff9HW6iVilVjcTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982930; c=relaxed/simple;
	bh=jaR3cKV9wO0opnz5SEB9YrjqoO+iFvaaL0OOr0qBijM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cJW20bDlXCfGJ9vXaRVpxQruDEN674IuN4ATJ9c1s4vLCiALJVyUghlFJSsjaxtVCC4HQ3g2jXL49WnFFE/lPDTZX2YwRQpYU0OrXTmFEM6HlcmS2EfDVMq9evFrrIiIfEo2KFBjKNz0SsQpHK9hHwCarIZbznaBxJWJwoFXqqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Zz56L23L; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=6Q6osTmE; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Zz56L23L";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="6Q6osTmE"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982922;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WDpd4Vd4cRA9btC/46nogzrNmedlT9Ey6oVyVY5keuI=;
	b=Zz56L23Lf0uQj6rmKtdAtY3WN+BQYj9CFkstD5T84rKrrckoc/US1ZTRgYv88fhbGCewYe
	I+CXq8wIN72bQDI8PPozqaN9i5qGVO8Dcb69ZBa3KpZREHLvdSxhT0h1PSlUCxCc9bMlW+
	hX9xqfCDkEQPCOo56dm+T+gXVlQ8ftIxKS+XFTP7+bhRtJpPL+gMKdyKoeFPtSDefFBKKQ
	DXVC1RZkwJ2hC0/JL9sEiRN5PxMibwKialVKoH9kgBqTpfSaPjSKS9v6GnSpOOtxO0Un/q
	1tALxg+ImFeCik9DWlkGzPJV91cy0muwNd9e+o22xg3a8V6UCK6P9B7Fsl58oA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982922;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WDpd4Vd4cRA9btC/46nogzrNmedlT9Ey6oVyVY5keuI=;
	b=6Q6osTmEGXWW0UtBVsL34RcdMPBI0NUhWWKo2XjrBtlBA2iwk2PeOKXuo6HwgM1KIUbKDu
	SmC9x41VbIPvbOCQ==
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
Subject: [PATCH v7 042/120] x86/cpu/amd: Use parsed CPUID(0x80000005) and CPUID(0x80000006)
Date: Thu, 28 May 2026 17:38:04 +0200
Message-ID: <20260528153923.403473-43-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For AMD TLB detection, use parsed CPUID(0x80000005) and CPUID(0x80000006)
instead of direct CPUID queries and ugly bitwise operations.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/amd.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
index 36276a21b840..50bbf9f33501 100644
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -1186,18 +1186,14 @@ static unsigned int amd_size_cache(struct cpuinfo_x86 *c, unsigned int size)
 
 static void cpu_detect_tlb_amd(struct cpuinfo_x86 *c)
 {
-	u32 l2_tlb_eax, l2_tlb_ebx, l1_tlb_eax;
-	u16 l2_mask = 0xfff, l1_mask = 0xff;
+	const struct leaf_0x80000005_0 *el5 = cpuid_leaf(c, 0x80000005);
+	const struct leaf_0x80000006_0 *el6 = cpuid_leaf(c, 0x80000006);
 
-	if (c->x86 < 0xf || c->extended_cpuid_level < 0x80000006)
+	if (c->x86 < 0xf || !el5 || !el6)
 		return;
 
-	l2_tlb_eax = cpuid_eax(0x80000006);
-	l2_tlb_ebx = cpuid_ebx(0x80000006);
-	l1_tlb_eax = cpuid_eax(0x80000005);
-
-	tlb_lld_4k = (l2_tlb_ebx >> 16) & l2_mask;
-	tlb_lli_4k = l2_tlb_ebx & l2_mask;
+	tlb_lld_4k = el6->l2_dtlb_4k_nentries;
+	tlb_lli_4k = el6->l2_itlb_4k_nentries;
 
 	/*
 	 * K8 does not report 2M/4M entries in the L2 TLB, so always use
@@ -1205,17 +1201,17 @@ static void cpu_detect_tlb_amd(struct cpuinfo_x86 *c)
 	 * when the L2 entry count is zero.
 	 */
 
-	tlb_lld_2m = (l2_tlb_eax >> 16) & l2_mask;
+	tlb_lld_2m = el6->l2_dtlb_2m_4m_nentries;
 	if (c->x86 == 0xf || !tlb_lld_2m)
-		tlb_lld_2m = (l1_tlb_eax >> 16) & l1_mask;
+		tlb_lld_2m = el5->l1_dtlb_2m_4m_nentries;
 
-	tlb_lli_2m = l2_tlb_eax & l2_mask;
+	tlb_lli_2m = el6->l2_itlb_2m_4m_nentries;
 	if (c->x86 == 0xf || !tlb_lli_2m) {
 		/* Erratum 658 */
 		if (c->x86 == 0x15 && c->x86_model <= 0x1f)
 			tlb_lli_2m = 1024;
 		else
-			tlb_lli_2m = l1_tlb_eax & l1_mask;
+			tlb_lli_2m = el5->l1_itlb_2m_4m_nentries;
 	}
 
 	/* A 4M entry uses two 2M entries */
-- 
2.54.0

