Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AEB33FE09
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774577894; cv=none; b=ZWYppSCPH+6P3AkkkB3bG8ELOpBsbecFxpm8qNT76XrxnW4YoSw7Rf4Ba49lUVzfyyWqTFYcG2+I+DLOtbz+Hp4oUwyWOx1EMk0RXxJQEWDVMYoRssWL75lDR0WUgmOiyZ/DplbgpPs85KAmkME3UuZaRgTJZBdd2SrbQiN6UgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774577894; c=relaxed/simple;
	bh=cvI/MiB5I4vaZ7Y5jMJUfTnoFoGb0fqpJmh5SJm+dY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CFE2JODtb8d3W2AMj1HCXFQ45Kxvz7UqMRh779uSz05+m/HhyoprbAYQvoW19iEURYXyM6UL9CpMH/vu6+e1J844avXEma/9BGjzzDELAQZnnfWpaUWOF6UyUVneWbRhcRvugvUYtU9PpeQdaok1eOjqxZvsf3V0YJt98SSDA+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Sv+bRiez; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=aoWbLnj3; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Sv+bRiez";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="aoWbLnj3"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774577891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zasYLAaFKS+By0nyxOXjlHUg5dfdQZlPvH4qmGNbh7Q=;
	b=Sv+bRiezArVqBDMLpYLi0nfwSvDjM146T2waK0IAFiLukgm6Pgk2DhmrSjklZxZFq5+IzL
	AqmhN+4QxH5d7Kmx+ubezZUh2ORJzUIla0VbCglMSRkkSPbo5GE3Ggtq4yharzkKPvtmiH
	ZBNqmdyMRFql4A9SpPiztwcDE3EEAg+BUK3yEKV9+5KgoclIFBCqsiLSbYSfyuHQbvmYv6
	wYO42+5yML0IYvZVLz/8+08aesoC2MlugdkONKPrtq0wPKv5cLbwkQUTAtH8REvKLJFIL2
	FKDyfMskbJsoLUpA/NTHj5P2K/KH4zjlCcRActnkJRFTYF06Hxn+OSFBciVLhg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774577891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zasYLAaFKS+By0nyxOXjlHUg5dfdQZlPvH4qmGNbh7Q=;
	b=aoWbLnj3IumoIljAUis77pBzXf8Sb4VDbnTCFGDr3qBTrG5YkoYMqq6FLg6bkz1tANOiJp
	bf4doaq5j5iM96Dg==
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
Subject: [PATCH v6 14/90] x86/cpu: Use parsed CPUID(0x0)
Date: Fri, 27 Mar 2026 03:15:28 +0100
Message-ID: <20260327021645.555257-15-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use parsed CPUID(0x0) instead of a direct CPUID query.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/common.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 8fd7d2f480bf..882754f10a4f 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -940,11 +940,15 @@ void get_cpu_vendor(struct cpuinfo_x86 *c)
 
 void cpu_detect(struct cpuinfo_x86 *c)
 {
-	/* Get vendor name */
-	cpuid(0x00000000, (unsigned int *)&c->cpuid_level,
-	      (unsigned int *)&c->x86_vendor_id[0],
-	      (unsigned int *)&c->x86_vendor_id[8],
-	      (unsigned int *)&c->x86_vendor_id[4]);
+	const struct leaf_0x0_0 *l0 = cpuid_leaf(c, 0x0);
+
+	if (!l0)
+		return;
+
+	c->cpuid_level = l0->max_std_leaf;
+	*(u32 *)&c->x86_vendor_id[0] = l0->cpu_vendorid_0;
+	*(u32 *)&c->x86_vendor_id[4] = l0->cpu_vendorid_1;
+	*(u32 *)&c->x86_vendor_id[8] = l0->cpu_vendorid_2;
 
 	c->x86 = 4;
 	/* Intel-defined flags: level 0x00000001 */
-- 
2.53.0

