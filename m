Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF03933A9D6
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774578006; cv=none; b=FuP6h3/PgdVFzBZXOC9QS5kcY1riVgsNqk7XZ1KZS58pSis7DsD1dcUcJMih2HjywRrZpDQ+oN88r/TSwRISEuUFZ4bEe4VmCXMaa2w4Frzw4YpK8640ec08DrAUzroL8SLi/14Rnk99FgG0aJacdgbXOj1H9Hw+WCOqduPFwRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774578006; c=relaxed/simple;
	bh=2FKqaDXQDLLvlw9eq3jKYIWj3nIdnlUlczEncP/7Kz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qbeFu5kIgWDWgbnJ4tJd3u0FEHDWtr1Cmep7M1RE4sh9fCvNk09h5YvC30CTj6VYRgDB6r7Kl+qFqXFwHsCXhYGp0j9+3QIUHSiXNfiN5H7WMevm8Kyty8/e5xjhbqkBNrzKYDlmYa/ES0WXCgTJZT3Y22TWJ/VfK02q6Ol3JmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HieBFBjY; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Yw0ehc1y; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HieBFBjY";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Yw0ehc1y"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774578002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HFP83YWrjEVTjjg6IOQ79qfq8QvCeTy80hUMbnk+FwM=;
	b=HieBFBjYtBuPEvM3vj+LV0/BnXq9PdoKDIFmAinncWPgOaZ0i6iQJdEAMKkDKnb5CeYOe8
	zX2wZm8UnE0H//YqS+9ROtmDFPUl1fRgzpM//Gx26P9xhHK7VjXxjuTZpq6Ntu/dW9o1pN
	gj9V+Jh6NvCTrADflCgTjrNJU8U6OVfF1BRYbbo3w/Z+NVN4T4+vt9a2sPnbM5gsfCwmGm
	ld3WL/toCViHSX7XL2bl5Oxt6d46bwHgkqKARRE0sDoAyeX0XLzq9rzRxj+yhHTJcCUdt+
	FhGkYZYxDnA1bxronJYr+Gg6o6Zzm8q1HdOezPUtWXbJ7HM8m7j+pPUQd6uGsw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774578002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HFP83YWrjEVTjjg6IOQ79qfq8QvCeTy80hUMbnk+FwM=;
	b=Yw0ehc1y7JwcgET0pQ18PqWaIeFaGGhq/hRoo6rkbgpcsRJ6Sz3ni80LG971ZSY6uwdzR/
	73K8R2JpmdVz2zBw==
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
Subject: [PATCH v6 44/90] x86/cpu: Use parsed CPUID(0x80000005) and CPUID(0x80000006)
Date: Fri, 27 Mar 2026 03:15:58 +0100
Message-ID: <20260327021645.555257-45-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use parsed CPUID(0x80000005) and CPUID(0x80000006) instead of issuing CPUID
queries and doing ugly bitwise operations.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/common.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index f7372833dd50..5fa5463686ac 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -857,27 +857,26 @@ static void get_model_name(struct cpuinfo_x86 *c)
 
 void cpu_detect_cache_sizes(struct cpuinfo_x86 *c)
 {
-	unsigned int n, dummy, ebx, ecx, edx, l2size;
+	const struct leaf_0x80000005_0 *el5 = cpuid_leaf(c, 0x80000005);
+	const struct leaf_0x80000006_0 *el6 = cpuid_leaf(c, 0x80000006);
+	unsigned int l2size;
 
-	n = c->extended_cpuid_level;
-
-	if (n >= 0x80000005) {
-		cpuid(0x80000005, &dummy, &ebx, &ecx, &edx);
-		c->x86_cache_size = (ecx>>24) + (edx>>24);
+	if (el5) {
+		c->x86_cache_size = el5->l1_dcache_size_kb + el5->l1_icache_size_kb;
 #ifdef CONFIG_X86_64
 		/* On K8 L1 TLB is inclusive, so don't count it */
 		c->x86_tlbsize = 0;
 #endif
 	}
 
-	if (n < 0x80000006)	/* Some chips just has a large L1. */
+	/* Some chips only have a large L1 */
+	if (!el6)
 		return;
 
-	cpuid(0x80000006, &dummy, &ebx, &ecx, &edx);
-	l2size = ecx >> 16;
+	l2size = el6->l2_size_kb;
 
 #ifdef CONFIG_X86_64
-	c->x86_tlbsize += ((ebx >> 16) & 0xfff) + (ebx & 0xfff);
+	c->x86_tlbsize += el6->l2_dtlb_4k_nentries + el6->l2_itlb_4k_nentries;
 #else
 	/* do processor-specific cache resizing */
 	if (this_cpu->legacy_cache_size)
@@ -887,8 +886,9 @@ void cpu_detect_cache_sizes(struct cpuinfo_x86 *c)
 	if (cachesize_override != -1)
 		l2size = cachesize_override;
 
+	/* Again, no L2 cache is possible */
 	if (l2size == 0)
-		return;		/* Again, no L2 cache is possible */
+		return;
 #endif
 
 	c->x86_cache_size = l2size;
-- 
2.53.0

