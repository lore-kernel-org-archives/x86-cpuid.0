Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CCE428465
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982934; cv=none; b=gTgcFPiB8wjP0fKLwsr+hgGeJpLDbH32IY8dXWom+YcMrGZ8f/jXefNTsLq4jEXE4hHXXskwvC133EkfHJCn6MDVEB8OLbwfErnaNkUdBIkRP6x0IsiC8OpCix7Keu9dVq48xgMAeYZZH/XyePI28QIje6icl4IGPmqHt1YdPSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982934; c=relaxed/simple;
	bh=o7nCI0supCtVW4W+1kVJUIuf25pCI3qhaeHkIcNn/fo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AEF4qu0RLn/XmKrEYskO1PANgquEciFggnwDiv8BmIOETW3usC+zZ7sgJrcbBXCLA7Aaz1WH2SUmOW5EMT+rQtVS+aW/4Yth1/hjz7ZkFYL8B4KKoYcagZEKrORPuZSd4BfRFqUcDXs8cxI0aYDhLBpRw7mhi6ciBO8gSNGmd74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=101K6kzf; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Qtl8LuGo; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="101K6kzf";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Qtl8LuGo"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W/fIK0E8z0Ml5W1Krli7k2nqmXNcjvGhQsxgYl+RdTE=;
	b=101K6kzfimDOsRXhNcaBqyzDlxdRLH3niFlWKwFQI4Z6uuSRWfaYNm0I0lWXTw7OHvYAYy
	TBx6RMLPguMsD0q0pc6zP+qFNBINO3cBqrGYDUACAVB/OMPFHBBSnTvXbDov6UE7bgezbR
	RO8pZhNoA8tMxsww7Vq1Iwj/r7DhBPtcs9u8qHku+v+D1zrfst8NyPg50mGMQZX4V5A1rP
	tQxw/VyNAmV8dYBHxh/AmCZ5qzLVDxWzV5497LCprdNyv2Isc3CdtwPzNP38d1BAZW1MNy
	tY1Ok1a1oDZeDWPHyN4ZminGDzvwIUdMed3RZlNdmaGiRg2kd/XARxTdtx/6yA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W/fIK0E8z0Ml5W1Krli7k2nqmXNcjvGhQsxgYl+RdTE=;
	b=Qtl8LuGo6gMLTbkvvW7RCViBbuYq5TuuQ2TqNQ+s2UhVtR0scZWU8FCt5rm4BD9CrBOCw7
	LaVafU6KSAfHT9BA==
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
Subject: [PATCH v7 043/120] x86/cpu/hygon: Use parsed CPUID(0x80000005) and CPUID(0x80000006)
Date: Thu, 28 May 2026 17:38:05 +0200
Message-ID: <20260528153923.403473-44-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For Hygon init, use parsed CPUID(0x80000005) and CPUID(0x80000006) instead
of direct CPUID queries and ugly bitwise operations.

Consolidate all comments; the code has now clear logic and bitfield names.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/hygon.c | 35 ++++++++++++++++-------------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/arch/x86/kernel/cpu/hygon.c b/arch/x86/kernel/cpu/hygon.c
index 3e8891a9caf2..4a63538c2b3f 100644
--- a/arch/x86/kernel/cpu/hygon.c
+++ b/arch/x86/kernel/cpu/hygon.c
@@ -229,35 +229,32 @@ static void init_hygon(struct cpuinfo_x86 *c)
 	clear_cpu_cap(c, X86_FEATURE_APIC_MSRS_FENCE);
 }
 
+/*
+ * For DTLB/ITLB 2M-4M detection, fall back to L1 if L2 is disabled
+ */
 static void cpu_detect_tlb_hygon(struct cpuinfo_x86 *c)
 {
-	u32 ebx, eax, ecx, edx;
-	u16 mask = 0xfff;
+	const struct leaf_0x80000005_0 *el5 = cpuid_leaf(c, 0x80000005);
+	const struct leaf_0x80000006_0 *el6 = cpuid_leaf(c, 0x80000006);
 
-	if (c->extended_cpuid_level < 0x80000006)
+	if (!el5 || !el6)
 		return;
 
-	cpuid(0x80000006, &eax, &ebx, &ecx, &edx);
+	tlb_lld_4k = el6->l2_dtlb_4k_nentries;
+	tlb_lli_4k = el6->l2_itlb_4k_nentries;
 
-	tlb_lld_4k = (ebx >> 16) & mask;
-	tlb_lli_4k = ebx & mask;
+	if (el6->l2_dtlb_2m_4m_nentries)
+		tlb_lld_2m = el6->l2_dtlb_2m_4m_nentries;
+	else
+		tlb_lld_2m = el5->l1_dtlb_2m_4m_nentries;
 
-	/* Handle DTLB 2M and 4M sizes, fall back to L1 if L2 is disabled */
-	if (!((eax >> 16) & mask))
-		tlb_lld_2m = (cpuid_eax(0x80000005) >> 16) & 0xff;
+	if (el6->l2_itlb_2m_4m_nentries)
+		tlb_lli_2m = el6->l2_itlb_2m_4m_nentries;
 	else
-		tlb_lld_2m = (eax >> 16) & mask;
+		tlb_lli_2m = el5->l1_itlb_2m_4m_nentries;
 
-	/* a 4M entry uses two 2M entries */
+	/* A 4M TLB entry uses two 2M entries */
 	tlb_lld_4m = tlb_lld_2m >> 1;
-
-	/* Handle ITLB 2M and 4M sizes, fall back to L1 if L2 is disabled */
-	if (!(eax & mask)) {
-		cpuid(0x80000005, &eax, &ebx, &ecx, &edx);
-		tlb_lli_2m = eax & 0xff;
-	} else
-		tlb_lli_2m = eax & mask;
-
 	tlb_lli_4m = tlb_lli_2m >> 1;
 }
 
-- 
2.54.0

