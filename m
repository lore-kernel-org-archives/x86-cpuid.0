Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86111480DC0
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983171; cv=none; b=iuk9uiiPwnk+559HJQ7Pd9VBIC3IQw7JD2aKZrVJkpSUJ0CVWXdfRRBjw2K98piAt6k9DudzVuRJIPf2sdlI7bb3V4QP0gS8SQEmbqnLaY5BuLqs6DjR895iXlqsVHHlFshaLddu3Hq58kx3beyIwhzvbEWWzp0vMICFb2g2xx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983171; c=relaxed/simple;
	bh=GRArbWGCLUNF1IhY4Py7B4eTp8EiDj0kJjX+HC18f9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YLo9Gmo9m9SR3iu/znqGW6mSHIQJuLAxOmsqZqmBhwkizMjKsTKYTgTk0wdxQEY7wkREUYzLCNI7vV9Q1o3rW+k0UKvR4rxabn+C+ZFlU9MOOvylnTQyXxNb03+2L4qYpl6Ks/K0BREqzHN5hyqZWkf4beyZGI+DVByafrOOdZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qWImwcKJ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=okTD4S5o; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qWImwcKJ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="okTD4S5o"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N8do4H5kJox+y3INC4ESOvFMwsTpuxfXZFgUnVTKIOU=;
	b=qWImwcKJ0F7vzv8OXKjESlpzRqq7AotIwU5WRbCbhkwGQ0AHCqkoBR9/PxB5gWMcJBMs8r
	9+f55kFjz1gr3oTiFvQ2LjBebg2X19wt2EVZlSmBieBm2T1JjHn64yTurQDONCfWdaBJPS
	wCI5H9AfkQxLyaU1/fQwI6JLeOkHQi5BqD1TFWyhoD+6SXEuNVLgt2eA7x/4JZQayuokoI
	+qwb+HXp/B4hnSTZLOdUu/HZnPW419Hs6RJptkddTfKjUXrZ11YipaR/gI5Ujk1S+QtS/w
	ydmap8krZn/T+4cDjYHQtBEL5DXkh0XOvTxglDS7TaiQzAWh9nZi4zqB0XlfQg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N8do4H5kJox+y3INC4ESOvFMwsTpuxfXZFgUnVTKIOU=;
	b=okTD4S5onIJIlMd6kA84E+zlaO/Bola+X9QtlSDmycNWXF+ThTh2Amrpp47avvZU7ZgIpf
	Rz//2bGzhYOzEuBQ==
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
Subject: [PATCH v7 116/120] x86/cpu/transmeta: Remove x86_capability[] CPUID initialization
Date: Thu, 28 May 2026 17:39:18 +0200
Message-ID: <20260528153923.403473-117-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

X86_FEATURE queries are now routed to the CPUID tables instead of to
x86_capability[].

Remove all direct CPUID queries which populate x86_capability[].

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/transmeta.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/x86/kernel/cpu/transmeta.c b/arch/x86/kernel/cpu/transmeta.c
index 991e11d5c28a..5e848f4eb5f5 100644
--- a/arch/x86/kernel/cpu/transmeta.c
+++ b/arch/x86/kernel/cpu/transmeta.c
@@ -10,14 +10,6 @@
 
 #include "cpu.h"
 
-static void early_init_transmeta(struct cpuinfo_x86 *c)
-{
-	const struct leaf_0x80860000_0 *l = cpuid_leaf(c, 0x80860000);
-
-	if (l && l->max_tra_leaf >= 0x80860001)
-		c->x86_capability[CPUID_8086_0001_EDX] = cpuid_edx(0x80860001);
-}
-
 /*
  * If CPU revision is 0x02000000, then CPUID(0x80860002) should be used instead.
  */
@@ -75,7 +67,6 @@ static void init_transmeta(struct cpuinfo_x86 *c)
 {
 	unsigned int cap_mask, uk;
 
-	early_init_transmeta(c);
 	cpu_detect_cache_sizes(c);
 
 	print_cpu_revision(c);
@@ -85,7 +76,6 @@ static void init_transmeta(struct cpuinfo_x86 *c)
 	rdmsr(0x80860004, cap_mask, uk);
 	wrmsr(0x80860004, ~0, uk);
 	cpuid_refresh_leaf(c, 0x1);
-	c->x86_capability[CPUID_1_EDX] = cpuid_edx(0x00000001);
 	wrmsr(0x80860004, cap_mask, uk);
 
 	/* All Transmeta CPUs have a constant TSC */
@@ -103,7 +93,6 @@ static void init_transmeta(struct cpuinfo_x86 *c)
 static const struct cpu_dev transmeta_cpu_dev = {
 	.c_vendor	= "Transmeta",
 	.c_ident	= { "GenuineTMx86", "TransmetaCPU" },
-	.c_early_init	= early_init_transmeta,
 	.c_init		= init_transmeta,
 	.c_x86_vendor	= X86_VENDOR_TRANSMETA,
 };
-- 
2.54.0

