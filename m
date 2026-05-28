Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13D8421F1B
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982914; cv=none; b=ohLFaD0bbhWzYoIaKdEQ5GN2+tVPtrB+/sEXlEY1L5rH24pzf6tQ4oBDrsnM8zzhuPKa8AOj1T32Q7c/99MdDN982N8I6yRnGS02NyO/86s3jnfCNIrM+xMPFkv1UOQp4vSc6hL+9N7eldBBlH1/cV+EupFwNmGCbExLOTW9Bgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982914; c=relaxed/simple;
	bh=K9Hd9KRBXXzaoWZRUxkIIh8zCbwff5DN1ZoYoC3OR/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uZGRn8GDjQnhXfEoyu6NWeyYzUHW0R3D1ZB7E52gzS1YnvzAIQPNh4ZqDjumqw2j+m40iHc38wfP3oNPhc7uV0SKbnLYWxUL1lr8muCjhlIDAGm/W4aUICl6vSX0Xo/BM2EkGUR0aGtKjNaxG9RU0odw4LhHx0v0L+OXDynIk9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=u6pNDoU3; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=B897kNhf; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="u6pNDoU3";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="B897kNhf"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DX68GFCCdUlwvGFnyuuOptO176Td4/bZkuAoc6lLyhU=;
	b=u6pNDoU3uikxShoZofcI490aiZw9RNG8jz/yRacXJmjJCCsW93AiFsig6XOahqsCcqJ2PH
	FhstGJcQRQbrCSO98cqgu8JG3xpRN2mDMgqgj63yp01GO9KD9bABnOMxWaJdqIyirnAC+A
	APFg7QMhN3sCv8x5kof95Oo3IwV4wXIuAIKlGpsJsJGeCwBeTxM6GwD5G9AJJHgE/0FaB9
	BZi1VDu8Pil/V1ujIiWj37wVoCUWtRG2cDgiZB/6Agabat4rySaSIrohe5U5pSlRyrSdpd
	gbI1J1SkssCeSRASgY8OLC8rPMkQ25uVwz7Mxfv3Jq7l3213hQTl9+5FxOALbQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DX68GFCCdUlwvGFnyuuOptO176Td4/bZkuAoc6lLyhU=;
	b=B897kNhfeYivZF+3g1Ra/KYaoNV7JWm7NKKovkVisTyiUKLp1iNW0E/MXUr+4YO4NIOcZb
	vej6NhJa04vwOPBQ==
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
Subject: [PATCH v7 039/120] x86/cpu: Use parsed CPUID(0x80000005) and CPUID(0x80000006)
Date: Thu, 28 May 2026 17:38:01 +0200
Message-ID: <20260528153923.403473-40-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
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
index 67dd2c5b9680..d8e46eb0f5c5 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -859,27 +859,26 @@ static void get_model_name(struct cpuinfo_x86 *c)
 
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
@@ -889,8 +888,9 @@ void cpu_detect_cache_sizes(struct cpuinfo_x86 *c)
 	if (cachesize_override != -1)
 		l2size = cachesize_override;
 
+	/* Again, no L2 cache is possible */
 	if (l2size == 0)
-		return;		/* Again, no L2 cache is possible */
+		return;
 #endif
 
 	c->x86_cache_size = l2size;
-- 
2.54.0

