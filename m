Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8791F366DD5
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774578015; cv=none; b=Qvck4bhKDnf3zopqTI0dnevXEzWWRLdF3OkKlb9VB3O53isk6uWf9E505zZQROwNckRoM6pc4wnVEBcFLHZCgM6qVPN3Xa1JKflT3epQgAnYPeNBDc1+lAMICPYr57HgiSp7xCSrxDefbSB1UpiT9jjtIw5CKzkCnpLlbr7Jgw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774578015; c=relaxed/simple;
	bh=jwHw3hWLyrrLQ379KF5w8+hprxJhcEgL3MIQ1cUzsmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nkGkctn4iPPOflyNUMxCv6aZOTImhVe1GYCtn/O9QQnLRf4+YN2cuTUWqvh+oeo+MDHkD/Wer1OWFaUzM+gd3ey55wDkqZI9kVj2vTYrL3v11TXrdf2ShsRvQCLXMYOXCirmbPU77ZWOxXdWTP/+GVnwWvtm16+uWtdnSaCdH/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0SHjHK4h; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2wnAJa89; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0SHjHK4h";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2wnAJa89"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774578013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U8F0u/WXF8S/XLVv/5yTthWXj7U6MiAN+lRM5UC9Oz0=;
	b=0SHjHK4hhlmouWHTfiq2F1InV2qldkEM3hBCXSKS7gdIG71yX0HAZEqrfw3QC0SSE+nFDn
	H9GJohpARIyEEFyyG/kIvGIrG7p3W1MOP9ZPR/w6SU7fHxrA0fW+9uHuo6vO7ttYaMXR+3
	sq52BBqEEknFSjM89uLsuD4kJP1gID8QAcpxeEUhnY9lnHdljiH/99AaYcwHdkUfbvtf73
	pdLftawHpKZNNVFbLZJb4O9nqjHcEXL54VdTptBHeDmCRsfk8yKeF4OvBG4H5zYkqQyPA7
	lzH4MCVAZTrCSFKQBx7pahU5AUnfemCjsrh6Nf8ITbFKZYZy0VJhXErYmZZZDw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774578013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U8F0u/WXF8S/XLVv/5yTthWXj7U6MiAN+lRM5UC9Oz0=;
	b=2wnAJa89PtAzdXVPZRnvL4157l5z4UJ14Q3JJC4WQ0Ox0nPd6n9/OjYTek3K7GmYjiO7q7
	8NimTqKNpfuynFDw==
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
Subject: [PATCH v6 47/90] x86/cpu/amd: Use parsed CPUID(CPUID(0x80000005) and CPUID(0x80000006)
Date: Fri, 27 Mar 2026 03:16:01 +0100
Message-ID: <20260327021645.555257-48-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
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
index e13f5d05d7cf..5fd7f34fa284 100644
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -1179,18 +1179,14 @@ static unsigned int amd_size_cache(struct cpuinfo_x86 *c, unsigned int size)
 
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
@@ -1198,17 +1194,17 @@ static void cpu_detect_tlb_amd(struct cpuinfo_x86 *c)
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
2.53.0

