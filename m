Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704473FBB47
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982938; cv=none; b=tfj8zZKv+cl4GEaRoLUGutwdiAKqqYfnnALLZ0sRcqTrsiMWRBgdx/HyzyN2/5Pp+PnKy9NTfSsGX/VzqRaVegGC/P82RzWsRtPtzU1ch2ZuxoerrOTT8sfj/kvVDr0KU9ah2Z4VvBB4GqveAHrKHGN5T2N1T19MBvXx8bFWGPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982938; c=relaxed/simple;
	bh=F9nXpe25/9NhA1dhT8lwC4lrSqRwHg/IDSwUoluZTpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r6LU1wCkqyqzg9XfvJ37ZoUnLpd4NindFt1JNOkvhpPo6cRPvozAFMVm2B0AABhusYoIz4bQb8PPjJpEuuk42JHu3JhyTaxrQB8Mk8wwUdJtnLn4RCq/v2a9G/HhkJN2xh+wuPoUfviB+gCo7/PLvcgugktVcb4TUJeMqLslqKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4oN+/W0X; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=6y02XxQT; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4oN+/W0X";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="6y02XxQT"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KjQE8S6M58khNUKdSRbVbD9yQ5dHzjnErXIrgDoGlec=;
	b=4oN+/W0X/qA9J/mp6x+XyNpEAw2D/5iquVVy7umwGXByra1eM/JnwoQ0MhrNloL0kC/lej
	dZKymJlGhjw9Z5j9WMsK0AVTSB12nx912XUMsYIJ5bSSNcKGrbn/AyiFdYtgb9AffsOK/h
	L+6QzcTGNiNIF7pUSv1j7i6s9QgOhCzfqgqQpfijEa21kB35Q76QgWJkmyFLfbATz5+O6S
	mT+URg3JmIlN1tjrmnbxR5EtKSMe6Qq1XVWAtgChkmebqQfR4GLxS0wIhs69hpkaJByQ1C
	byeNwDbjlKo6YiMmECLYO/556G9KMWYH8/Ggdh7FKY+Lo8VjLecv7U/xI1PGsg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KjQE8S6M58khNUKdSRbVbD9yQ5dHzjnErXIrgDoGlec=;
	b=6y02XxQTdHgvoe0fwLwIJZK/r9gyf/DBDoQy4fDFmhgSSRgkPNkdZO/eGHWy+ld9Nw3BpL
	kY0pmxx+lgfMABCQ==
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
Subject: [PATCH v7 044/120] x86/cpu/centaur: Use parsed CPUID(0x80000005)
Date: Thu, 28 May 2026 17:38:06 +0200
Message-ID: <20260528153923.403473-45-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
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
2.54.0

