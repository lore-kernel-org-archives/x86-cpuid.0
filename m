Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36928403146
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982863; cv=none; b=nc7ybkpe/B2bRahMGYtDLXupeMigmlNGgjTpYr5nEJZZEepvHVpTJwkpJujJVSeTix/OvpVS7lJqLt7TDv2Xs3J2UiJZng0Awdvd9/N26h7oTnd/kyC2pdv/gK6dnab2iLwBGuK03O734MnoHABDtkH3dyzRUaE8MCepcdusliY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982863; c=relaxed/simple;
	bh=2MYmYEoTe4gDRhW+YTtVBmmOU/3wWbo/afTJgYsDN6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d1VDURh6R212V8coC1JiRPHstVGVMbOBBKQnuZG2F7MYUDHsyEFLXoDLbHDctOy/4V74SMtL4fTBY26WEmcWVnbq1DXqscbsAppZImyi7HdxxcQBht/Q5LoMIYxQf7SngshrdM8aMZWwi6D2+OXRCYvbIRY4DLnIjwyvjX9BM28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JJsJv6pw; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=iI7xIylX; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JJsJv6pw";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="iI7xIylX"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+03p+dvS4on0GGtOvXY/3IirK9+SFchKNpf1GDWcpfc=;
	b=JJsJv6pw01vTtkBHRptnQlB8s8555WZeKU4jyCri8IGwBqyfViJd5lUfkj70jw4PLXbtNs
	yCanOepTBHKRvZyzBU6rf5TLoqDhzj7LSaFB+pklg18caloOhWLrMDXFjun1sK1lLBXbCt
	OVrXQYlhx3qLVZkqhaxki9YZ6zXn6wERz/+sQeL3odBCCOWkraKVx5j48wJQCz3pVJxQMf
	c1uCRd0Bp5bBTTSPXBDEecytORrLhxnTLk//g39gKgaSx/2L+GTy1VBJMglGAPgWcQTtQk
	z7bq4vy1HgmsuCONvZgnlEqPT0y5AFvz4iwir8zgGFHZsyKJXCRk13PtInfqyA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+03p+dvS4on0GGtOvXY/3IirK9+SFchKNpf1GDWcpfc=;
	b=iI7xIylX2IXqI3gjZegtjFXxzJfyzwWyo9NIT2sxeUTMVPFZWSwidflTSiprg+5MG731RM
	LPTtHera3kIdDjCg==
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
Subject: [PATCH v7 023/120] x86/cpu/centaur: Use parsed CPUID(0xc0000001)
Date: Thu, 28 May 2026 17:37:45 +0200
Message-ID: <20260528153923.403473-24-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use parsed CPUID(0xc0000001).

Beside the CPUID parser centralization benefits, this allows using the
auto-generated x86-cpuid-db data types, and their full C99 bitfields,
instead of doing ugly bitwise operations on the CPUID output.

Keep the x86_capability[] CPUID(0xc0000001).EDX assignment.  It will be
removed once X86_FEATURE translation is integrated into the CPUID model.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/centaur.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/arch/x86/kernel/cpu/centaur.c b/arch/x86/kernel/cpu/centaur.c
index a97e38fa6a9f..5f09bce3aaa7 100644
--- a/arch/x86/kernel/cpu/centaur.c
+++ b/arch/x86/kernel/cpu/centaur.c
@@ -12,34 +12,27 @@
 
 #include "cpu.h"
 
-#define ACE_PRESENT	(1 << 6)
-#define ACE_ENABLED	(1 << 7)
 #define ACE_FCR		(1 << 28)	/* MSR_VIA_FCR */
-
-#define RNG_PRESENT	(1 << 2)
-#define RNG_ENABLED	(1 << 3)
 #define RNG_ENABLE	(1 << 6)	/* MSR_VIA_RNG */
 
 static void init_c3(struct cpuinfo_x86 *c)
 {
-	u32  lo, hi;
-
-	/* Test for Centaur Extended Feature Flags presence */
-	if (cpuid_eax(0xC0000000) >= 0xC0000001) {
-		u32 tmp = cpuid_edx(0xC0000001);
+	const struct leaf_0xc0000001_0 *l1 = cpuid_leaf(c, 0xc0000001);
+	u32 lo, hi;
 
-		/* enable ACE unit, if present and disabled */
-		if ((tmp & (ACE_PRESENT | ACE_ENABLED)) == ACE_PRESENT) {
+	if (l1) {
+		/* Enable ACE unit, if present and disabled */
+		if (l1->ace && !l1->ace_en) {
 			rdmsr(MSR_VIA_FCR, lo, hi);
-			lo |= ACE_FCR;		/* enable ACE unit */
+			lo |= ACE_FCR;
 			wrmsr(MSR_VIA_FCR, lo, hi);
 			pr_info("CPU: Enabled ACE h/w crypto\n");
 		}
 
-		/* enable RNG unit, if present and disabled */
-		if ((tmp & (RNG_PRESENT | RNG_ENABLED)) == RNG_PRESENT) {
+		/* Enable RNG unit, if present and disabled */
+		if (l1->rng && !l1->rng_en) {
 			rdmsr(MSR_VIA_RNG, lo, hi);
-			lo |= RNG_ENABLE;	/* enable RNG unit */
+			lo |= RNG_ENABLE;
 			wrmsr(MSR_VIA_RNG, lo, hi);
 			pr_info("CPU: Enabled h/w RNG\n");
 		}
-- 
2.54.0

