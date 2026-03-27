Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E971B392835
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774578154; cv=none; b=Hr14q7pUB2VMBel7RYm501gWaOplnP1qJH4reVNaY+oZ6WO0Dwi0vulb08okHrVIxMC7R3u8PfPSP2lf5V1njAPhJRAvNKXcLf1hE2k3lGUqJqvi7WOvzVgwKRU1prORwnQgJf/MBGlGBFRFFF2lDSzPPaenPYXvy1xgpNtjq3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774578154; c=relaxed/simple;
	bh=ynA/HPkCCdgnDJSl9aU9Tk56ktM4xINS/RyRhV4OtQk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i8TIQN7wkT7ajMQP6cJIhjnaPTdfZXKHZwnZav2lyaZVXET9ADry3fSh1UAWFbN1OL1tBib7c2N5+TcgMPcS6SDhkRYhWwhY+bTgps4w0h2l51yytaxm/0nniBLa6pCoBGhVaBKcxOW666kqHT1drNVCgIR4fqId8W3iHMREWPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=iYygi1+7; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2JlxhDWd; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="iYygi1+7";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2JlxhDWd"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774578150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lRnJLFYUKewqy8Wxd9RkA3zX/wU9Hzrsxeiv+vKeuvU=;
	b=iYygi1+76Cl9CpPn86hvIeJP8jGkwCXeRia25T70nCH+ynQ/dJOK2zXVNsURqOFfHpnLsk
	gqJyQr6HP9WC3nFMSqfQ2g6AkRAi6GkO6TZgjALn401hp5VPcuf75uLI5OignF76bfyDa+
	V/RmMVheks9iUSVEa/betp3klbAE3TBsjIdi0QIOgz8TyplkZd/ZxnlGFWS5MdifCIQ6pE
	HpHHHEthAqDYdaVn+7Xz7fB4VlL414lh/NHGTjCD/ETms0kyYRpGlb9Um2ykQTYXQGltBP
	gT/G38zDpTmAwPU+LblkF3KZVUl8RiG2yf9qf+o0XV+z5guWueJEjm2xkcLVbQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774578150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lRnJLFYUKewqy8Wxd9RkA3zX/wU9Hzrsxeiv+vKeuvU=;
	b=2JlxhDWdaQkuYmUl044xveuHVTGHUAAroptKjfgiCGT25jEalH9MUxnLt6BevxZaiRSmIp
	uD6bM7gVqCmmcQBQ==
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
Subject: [PATCH v6 86/90] x86/cpu/transmeta: Remove x86_capability[] CPUID initialization
Date: Fri, 27 Mar 2026 03:16:40 +0100
Message-ID: <20260327021645.555257-87-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
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
 arch/x86/kernel/cpu/transmeta.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/x86/kernel/cpu/transmeta.c b/arch/x86/kernel/cpu/transmeta.c
index 991e11d5c28a..47964f43a740 100644
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
@@ -85,7 +77,6 @@ static void init_transmeta(struct cpuinfo_x86 *c)
 	rdmsr(0x80860004, cap_mask, uk);
 	wrmsr(0x80860004, ~0, uk);
 	cpuid_refresh_leaf(c, 0x1);
-	c->x86_capability[CPUID_1_EDX] = cpuid_edx(0x00000001);
 	wrmsr(0x80860004, cap_mask, uk);
 
 	/* All Transmeta CPUs have a constant TSC */
@@ -103,7 +94,6 @@ static void init_transmeta(struct cpuinfo_x86 *c)
 static const struct cpu_dev transmeta_cpu_dev = {
 	.c_vendor	= "Transmeta",
 	.c_ident	= { "GenuineTMx86", "TransmetaCPU" },
-	.c_early_init	= early_init_transmeta,
 	.c_init		= init_transmeta,
 	.c_x86_vendor	= X86_VENDOR_TRANSMETA,
 };
-- 
2.53.0

