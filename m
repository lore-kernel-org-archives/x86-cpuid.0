Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9AC2E1C7B
	for <x86-cpuid@lists.linux.dev>; Fri, 15 Aug 2025 07:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755241543; cv=none; b=TxACMH6S1bam5wbFBBAgc+lAEa9r78U9NFr6UvYdu6UxmauwcUO8q7f14Ao1Vr2F0R8GR9GfcAV1WAkZ6qGOkQJyt/cLHJ8oIt9VZH01J8VeG9M1uPQwriqRYWHAcEdF+vXHZg6Pmok6Q7wwxVaVjXZWL66//GR7Xihsol1iaqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755241543; c=relaxed/simple;
	bh=+vVBraN4iyBq3O3zercHCT7qDeyXhzXuKKfitkLPY7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZdKvyKyUSUAwjSnxUCg+wIWbkZqbQFmdPorb356VeDqxxjCRgZBwmoUWenSP86Z+REa1be9fgd/McY7mB8zJQIR89iybQ82GZzi4KOPal7W+myQ+W8MlUC8MiTdnw/NebnsCIkv5Efmzqmi0CpPp/E5bLdbiwkoz/NNDEoQqLPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nNdCNjro; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GCudznR8; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nNdCNjro";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GCudznR8"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1755241538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RUTnqyEApieND9csbmEnB5DPZyvG6vYjpOqhiqML+ZQ=;
	b=nNdCNjroWClUbf7kQeJmSCf+dA87LbXDYlPTwEYeWZJ3anxmwHpGv8aSepag6SjlcGBtJr
	JgxbZEcmM6//PwrDgUK0Su65hruK1TGeMPmFVSBRBUFaBEnfRtUI8/RwKBaJd6oUsmDoAE
	7pnoq52r1KS9rW90dC99R0j1Au28KXEDK4tOuFbjXqHYIPXDHSVpTrEYJ4V8S/SNc4bEcf
	rZhHWWVVVIdV7dq+eHCXDKt81PGETUFhBAdg6tMhdUdVr34WQuudO048Vc9wSAehlUYNSH
	LrMWYOYdWGhD/26hAHhsZPHcikAE0Xdu20CIWlgyLP/nFsvUirwDdmH0a1N8zg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1755241538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RUTnqyEApieND9csbmEnB5DPZyvG6vYjpOqhiqML+ZQ=;
	b=GCudznR88LPVhex/urx0rPjC9JlpV/yVHea9mQWQEDhf3do3APfpA2i2fCG0BMhViXXysq
	Vq0Ygf2vxf5VaWAQ==
To: Borislav Petkov <bp@alien8.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Sean Christopherson <seanjc@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>,
	x86@kernel.org,
	x86-cpuid@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	"Ahmed S. Darwish" <darwi@linutronix.de>
Subject: [PATCH v4 11/34] x86/cpu: Use parsed CPUID(0x1)
Date: Fri, 15 Aug 2025 09:02:04 +0200
Message-ID: <20250815070227.19981-12-darwi@linutronix.de>
In-Reply-To: <20250815070227.19981-1-darwi@linutronix.de>
References: <20250815070227.19981-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use parsed CPUID(0x1) access, instead of a direct CPUID query, at early
boot CPU detection code.

Beside the centralization benefits of the new CPUID model APIs, this
allows using the auto-generated <cpuid/leaf_types.h> leaf data types and
their full C99 bitfields instead of performing ugly bitwise operations on
CPUID register output.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/common.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index e081f92ddfe9..f989c8099490 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -897,6 +897,7 @@ void get_cpu_vendor(struct cpuinfo_x86 *c)
 void cpu_detect(struct cpuinfo_x86 *c)
 {
 	const struct leaf_0x0_0 *l0 = cpuid_leaf(c, 0x0);
+	const struct leaf_0x1_0 *l1 = cpuid_leaf(c, 0x1);
 
 	c->cpuid_level = l0->max_std_leaf;
 	*(u32 *)&c->x86_vendor_id[0] = l0->cpu_vendorid_0;
@@ -904,17 +905,14 @@ void cpu_detect(struct cpuinfo_x86 *c)
 	*(u32 *)&c->x86_vendor_id[8] = l0->cpu_vendorid_2;
 
 	c->x86 = 4;
-	/* Intel-defined flags: level 0x00000001 */
-	if (c->cpuid_level >= 0x00000001) {
-		u32 junk, tfms, cap0, misc;
 
-		cpuid(0x00000001, &tfms, &misc, &junk, &cap0);
-		c->x86		= x86_family(tfms);
-		c->x86_model	= x86_model(tfms);
-		c->x86_stepping	= x86_stepping(tfms);
+	if (l1) {
+		c->x86		= cpuid_family(l1);
+		c->x86_model	= cpuid_model(l1);
+		c->x86_stepping	= l1->stepping;
 
-		if (cap0 & (1<<19)) {
-			c->x86_clflush_size = ((misc >> 8) & 0xff) * 8;
+		if (l1->clflush) {
+			c->x86_clflush_size = l1->clflush_size * 8;
 			c->x86_cache_alignment = c->x86_clflush_size;
 		}
 	}
-- 
2.50.1

