Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18544028EE
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982860; cv=none; b=W5wUrdo3CeFYpTFT2e+3Hp7qktboXSjJh2gvi+5XWnN24v/6GxNj2YIoz6BZJguo2ijfu4FRXR1ktIrDQ3pM/zedUllU6aBwm4zFT9cA1aC3B3ta/AG6U3/T0PEF9DF3ohkIi3cFBCw+wakP/B/4pLFYxKxY8JX6l0iFYGbkObg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982860; c=relaxed/simple;
	bh=6nYGK6cTkFvIvqLpGyHcil1tmHLs1GZfE2XIBAE079M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PQUgIjl1CfPi+kVOUQWGSFFqe5+jOTJ3s0YLp1za178CGA7mkPkyG9/6y8QOWWxO83nQKCCEiwPS+FXDVu9wb1eJfzEEV17m6DLIy2zP71U8hkJwdQ3VBZLHuao+lu8wuwWD9+hJRXv9zfONzjTrjA7MjBdQto8e2+lyLKsPa8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xRyrhV2Z; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=egeQ0H3x; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xRyrhV2Z";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="egeQ0H3x"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982857;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=puHuIwGOVqYUhkXtksvKr6uZsnRiiikagIfNnV38R68=;
	b=xRyrhV2ZfTwp6KYFRO+tpdvf+9ENriZT8VJXe52JgJ0aXRvk5peEiDdnx6CstItSyjQZ0a
	OwKwLFndL/kv/jgvgAVMTOkEaZUC6QuISGtUrqAGZrW4JLCzU5vN+V7Q36ceAkgHJNep1q
	no8f+9cmNPIT3VRTMu41QJNio802DRVTN6mj2iVpfJqAaaf1uZCaGj/LQD0h6/qU+KgNmS
	Lm48vhTRDCvmFNjX0n29H6TF7zmB1ZndqqnbNe3H7492/qLJ/d/H7ksa5HHZOO9Aj8CBIB
	MdjFHYBTpzBtPsIXvLMD/Sb/y72clFBpx0Xk6OMmz+kc1iOZs7dU5B4VfITxJg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982857;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=puHuIwGOVqYUhkXtksvKr6uZsnRiiikagIfNnV38R68=;
	b=egeQ0H3xAnTVa5WHo6HkZ1I6EjYy7CCAjq+gQSrlm1BaAd6NJs4WrDsx8osBuSadlwQWCj
	gYQhMOPL+CY9TmBg==
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
Subject: [PATCH v7 022/120] x86/cpu/transmeta: Refactor CPU information printing
Date: Thu, 28 May 2026 17:37:44 +0200
Message-ID: <20260528153923.403473-23-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that the Transmeta init code has been converted to the CPUID API,
refactor it into two separate functions for readability.

No functional change.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/transmeta.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/arch/x86/kernel/cpu/transmeta.c b/arch/x86/kernel/cpu/transmeta.c
index 4b77dc1a7d9e..991e11d5c28a 100644
--- a/arch/x86/kernel/cpu/transmeta.c
+++ b/arch/x86/kernel/cpu/transmeta.c
@@ -27,19 +27,10 @@ static bool is_legacy_revision(const struct leaf_0x80860001_0 *l1)
 		 l1->cpu_rev_mask_major == 0 && l1->cpu_rev_mask_minor == 0);
 }
 
-static void init_transmeta(struct cpuinfo_x86 *c)
+static void print_cpu_revision(struct cpuinfo_x86 *c)
 {
 	const struct leaf_0x80860001_0 *l1 = cpuid_leaf(c, 0x80860001);
 	const struct leaf_0x80860002_0 *l2 = cpuid_leaf(c, 0x80860002);
-	const struct leaf_0x80860003_0 *l3 = cpuid_leaf(c, 0x80860003);
-	const struct leaf_0x80860004_0 *l4 = cpuid_leaf(c, 0x80860004);
-	const struct leaf_0x80860005_0 *l5 = cpuid_leaf(c, 0x80860005);
-	const struct leaf_0x80860006_0 *l6 = cpuid_leaf(c, 0x80860006);
-	unsigned int cap_mask, uk;
-
-	early_init_transmeta(c);
-
-	cpu_detect_cache_sizes(c);
 
 	if (l1 && is_legacy_revision(l1)) {
 		pr_info("CPU: Processor revision %u.%u.%u.%u, %u MHz\n",
@@ -59,6 +50,14 @@ static void init_transmeta(struct cpuinfo_x86 *c)
 			l2->cms_rev_mask_1, l2->cms_rev_mask_2,
 			l2->cms_rev_mask_3);
 	}
+}
+
+static void print_cpu_info_string(struct cpuinfo_x86 *c)
+{
+	const struct leaf_0x80860003_0 *l3 = cpuid_leaf(c, 0x80860003);
+	const struct leaf_0x80860004_0 *l4 = cpuid_leaf(c, 0x80860004);
+	const struct leaf_0x80860005_0 *l5 = cpuid_leaf(c, 0x80860005);
+	const struct leaf_0x80860006_0 *l6 = cpuid_leaf(c, 0x80860006);
 
 	if (l3 && l4 && l5 && l6) {
 		u32 info[] = {
@@ -70,6 +69,17 @@ static void init_transmeta(struct cpuinfo_x86 *c)
 		};
 		pr_info("CPU: %s\n", (char *)info);
 	}
+}
+
+static void init_transmeta(struct cpuinfo_x86 *c)
+{
+	unsigned int cap_mask, uk;
+
+	early_init_transmeta(c);
+	cpu_detect_cache_sizes(c);
+
+	print_cpu_revision(c);
+	print_cpu_info_string(c);
 
 	/* Unhide possibly hidden capability flags */
 	rdmsr(0x80860004, cap_mask, uk);
-- 
2.54.0

