Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10733351C37
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774578020; cv=none; b=uQvWumVwr6GVWCQVCZ9rJLPGnL1q9m+jD7RRDWpB2IlCacvy9OMYPShNNy9RLoQ8q+SIQAU3K81xy9J5/LZip6vDDTt6HK7IgNJlECW80JN07rpmZMss8/36/hKBhVxDmoYzG8IR61Ex0s61cFtVaWXMI4q0edO4ogMQsaU1BA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774578020; c=relaxed/simple;
	bh=H+R2ySs/TeQzqZ7gQrEkYaY8Hq+9Sz0DVaRsgl9tZCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mr5K8OxRzOxhbEiIYBvgBWD0bYGKyOfN22zKAKQp+PMpou25k3XQc8R1g2oGuzAiWbACjE82Ump/KNMMcfooOQCcQlGz2Ka2c3gXDUlID3pPzZ63NeT4wB+5ORhizr/WfmDLw4Vk9yP1K3TG6FnGam8jfyG0pNk1lzno+O2vyHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=G6NiLS0h; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=+gG9hqto; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="G6NiLS0h";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="+gG9hqto"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774578016;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HgrzqW4QpmSH8CxJtBsKbOfhYo0PtEXJs5Ip5zjfkJw=;
	b=G6NiLS0hqHd+Ran2DwC/q9GIncyeXYt1mGAqK8H0cV4/gfhRtRJHWX4GmWe8lQi+Ggorit
	GgzMRyXlCZ1d9iCJARhuwW9bZxb8b9YT14xm9r0JLd7jboJ9HUHYDejTIoYfC3F42TPnfb
	03jymB0LY5NyYU/75+beG/Y1SG4PH4ZJsqCHvBjIfoEVFWdUS5hdU4rsfuQsVO8Rwpg2n9
	omtpm8560YEwCOpBQwWSQLpnjk+dwRuCCj93FAOg/rzWxD8gLCIm25l79iO0LhtJic8DlP
	kPsGvLKZxYV7I5QLYWtUoUK/dKmIFFEuMAJiP2RUVlxdawtVzXPQXMmLQiRdQQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774578016;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HgrzqW4QpmSH8CxJtBsKbOfhYo0PtEXJs5Ip5zjfkJw=;
	b=+gG9hqtocrGYXMUWAazUvwRUwz2GurYjOuzQnN5hxIEQByNMmc9ZCZtb8u4dRUEs7uDb5K
	Y6lK4hlQDJYd35AA==
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
Subject: [PATCH v6 48/90] x86/cpu/hygon: Use parsed CPUID(0x80000005) and CPUID(0x80000006)
Date: Fri, 27 Mar 2026 03:16:02 +0100
Message-ID: <20260327021645.555257-49-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
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
2.53.0

