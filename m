Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92924477999
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983069; cv=none; b=EOpKOVEIw8Tz+jVedYw+grU/s6S972wDpdV3yCBSHzjPik8wFfSa0fgxc8Rqjw+3knC6oUfM32BWaR0k0WP8LKhGYby1dA4Tkf1DKUimPBV0vT26Q+JihWefUsMPdjMu6EnthkFrKFrlnjRHzMxyDLgFl7418krgSpZCtXlIJDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983069; c=relaxed/simple;
	bh=ZwVJ6pp+lyRC77pJoa3ltQw2exv/jl+UBJqpTaFCBjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eJ2sTRiexj8tf5phhgh7ItB+deEqVJdygBu0D6azidilcUhXI1epfncocYzX2Rb9J84Bpd9+2hbuJ52SyqLcrmWXgHj/mAmOYFXzBfCc/KKDal62DI+JY3LTZsvpCz35ncSVhWJal8md3CwO/K/uQeTkALTL6oU3ZTEoZT7yAoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=u7IgP+QT; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vG/w7Q/p; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="u7IgP+QT";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vG/w7Q/p"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=omxTm3xXvQxj0iNQGH6ByRIK7ce+ms9b+rbAsmHGgh8=;
	b=u7IgP+QTu8IPTjDGoymH+dwmQWAnZBUggE4wc6CHKs4fevyduQuCLWbl4/1kl4r3t2pmjD
	PSSc83oahCVSjpdU7vGKhodJmnoq10qsJ4TwnnnxS+cPWc5m7v298Eux7vTQWSFkBTdA4L
	6ro5cwQR9sOQ19A0n7Vlai4oH14UlBoGaLn/2YB6Bw4KP736grnUWVzp/VktRoFymt9V7U
	aV/A93lYavnOZ/vcGX0KKT2DW/5zb/OBH9Rp3WDJ6kc5Q9rookIXduWXRf74YJFlH/gQT0
	jnKUQkWw4FTRUzp+vYq2Rksj/oOco9/5XlwNv6UYYUTmL5ynxCbefgBblUf86w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=omxTm3xXvQxj0iNQGH6ByRIK7ce+ms9b+rbAsmHGgh8=;
	b=vG/w7Q/p2MwZfrUk1czSmkw/udHanFcoLM0/yWlr7tzwLAMtEgTwpFD3oS0ArUyiChtlT2
	GYBg9joXH/3apMAA==
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
Subject: [PATCH v7 084/120] x86/cpu/zhaoxin: Use parsed CPUID(0xa)
Date: Thu, 28 May 2026 17:38:46 +0200
Message-ID: <20260528153923.403473-85-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For Zhaoxin's PMU enumeration, use parsed CPUID(0xa) instead of a direct
CPUID query and ugly bitwise operations.

Remove comments; the generated bitfield names already make everything clear.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/zhaoxin.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kernel/cpu/zhaoxin.c b/arch/x86/kernel/cpu/zhaoxin.c
index ea76e9594453..b068922efed9 100644
--- a/arch/x86/kernel/cpu/zhaoxin.c
+++ b/arch/x86/kernel/cpu/zhaoxin.c
@@ -61,20 +61,13 @@ static void early_init_zhaoxin(struct cpuinfo_x86 *c)
 
 static void init_zhaoxin(struct cpuinfo_x86 *c)
 {
+	const struct leaf_0xa_0 *la = cpuid_leaf(c, 0xa);
+
 	early_init_zhaoxin(c);
 	init_intel_cacheinfo(c);
 
-	if (c->cpuid_level > 9) {
-		unsigned int eax = cpuid_eax(10);
-
-		/*
-		 * Check for version and the number of counters
-		 * Version(eax[7:0]) can't be 0;
-		 * Counters(eax[15:8]) should be greater than 1;
-		 */
-		if ((eax & 0xff) && (((eax >> 8) & 0xff) > 1))
-			set_cpu_cap(c, X86_FEATURE_ARCH_PERFMON);
-	}
+	if (la && la->pmu_version && la->num_counters_gp > 1)
+		set_cpu_cap(c, X86_FEATURE_ARCH_PERFMON);
 
 	if (c->x86 >= 0x6)
 		init_zhaoxin_cap(c);
-- 
2.54.0

