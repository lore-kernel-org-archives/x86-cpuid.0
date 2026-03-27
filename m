Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8123537CA
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774578024; cv=none; b=QeJIR9ZQDNOnupJ7nD784fAV4MlmkFW1WDbkk5SBqhjw/OxxHJ2PmDjz9s3UCLi1l4r+WQc9loghpRDSIhZByEHmB68HruH8SXVslCD3JxqC7WmMbKlOpupCrP+yPrUSLb93pYn/ztWGbhFjVhcl0xfs1R5G0QAjlCYX/wS/e4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774578024; c=relaxed/simple;
	bh=K5QV4Csrx/OJgyOr6M7gAmcH7YP/aauAzE3ym9oi7oc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Iw65iIR35eNF2kV+6Toe+YMewzmL70Z3qrkmcBFDwDTnbhB6OjiGU1BOFNW0BDhjRgiPDZLQYfojRkun6iUxQC4XWNxdjpgHBl39OVH+NR9tUrAaIB/PQGzc6bZfQyPI4Hv23imBpAx92HOWZr2qjciZTd1YaKmPDX3niOMxRrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=iQLT82Nj; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=EcACkX58; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="iQLT82Nj";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EcACkX58"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774578020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X49npTsIRUaGG3MII35rGUtLXF7646imzEvEVZkLaaU=;
	b=iQLT82NjPOdLoyJJoAbdxKPzoyjBhAu4rQhXpVdDYwhtNHVM076HJeXgb2AZX5v1EDFaL2
	eSJGR/uE8jJaPZssYaKSKerNjMQVDE3Ib6xxSCKLVFV/VB/oggvZ6gT3gNDymkBVuCQf8/
	73AY5SFKNfvTihHjjk5GxLlAZisnm1hAIZ08wVL1MYIyvpHqtcZVVzW8aUl9esa/MLBtLB
	jUgQHGeofxJHPsGW9JqVORSqzFQFPoGQDhN23R1IKsGt2uEVm+wQ6SKPh57Pi0QC4XyFTt
	bKI+3tL+7Ncj1jg6gmFTKSfBbUyi9FF7+voKiFRiyOerqUbtLxLBAMiK+lrlsQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774578020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X49npTsIRUaGG3MII35rGUtLXF7646imzEvEVZkLaaU=;
	b=EcACkX58oWlxHR7oQ7vQniZDsLlXVRmvgzcd5gdciDs94Lxlqim9xPTW/Co2a9v+LAcKeq
	XYKKJBc2+2sCv3Aw==
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
Subject: [PATCH v6 49/90] x86/cpu/centaur: Use parsed CPUID(0x80000005)
Date: Fri, 27 Mar 2026 03:16:03 +0100
Message-ID: <20260327021645.555257-50-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use parsed CPUID(0x80000005) instead of issuing a CPUID query and doing
ugly bitwise operations.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/centaur.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/arch/x86/kernel/cpu/centaur.c b/arch/x86/kernel/cpu/centaur.c
index 5f09bce3aaa7..895cf00919d3 100644
--- a/arch/x86/kernel/cpu/centaur.c
+++ b/arch/x86/kernel/cpu/centaur.c
@@ -107,11 +107,11 @@ static void early_init_centaur(struct cpuinfo_x86 *c)
 static void init_centaur(struct cpuinfo_x86 *c)
 {
 #ifdef CONFIG_X86_32
-	char *name;
+	const struct leaf_0x80000005_0 *el5 = cpuid_leaf(c, 0x80000005);
+	u32  lo, hi, newlo;
 	u32  fcr_set = 0;
 	u32  fcr_clr = 0;
-	u32  lo, hi, newlo;
-	u32  aa, bb, cc, dd;
+	char *name;
 #endif
 	early_init_centaur(c);
 	init_intel_cacheinfo(c);
@@ -181,13 +181,8 @@ static void init_centaur(struct cpuinfo_x86 *c)
 		/* Set 3DNow! on Winchip 2 and above. */
 		if (c->x86_model >= 8)
 			set_cpu_cap(c, X86_FEATURE_3DNOW);
-		/* See if we can find out some more. */
-		if (cpuid_eax(0x80000000) >= 0x80000005) {
-			/* Yes, we can. */
-			cpuid(0x80000005, &aa, &bb, &cc, &dd);
-			/* Add L1 data and code cache sizes. */
-			c->x86_cache_size = (cc>>24)+(dd>>24);
-		}
+		if (el5)
+			c->x86_cache_size = el5->l1_dcache_size_kb + el5->l1_icache_size_kb;
 		sprintf(c->x86_model_id, "WinChip %s", name);
 	}
 #endif
-- 
2.53.0

