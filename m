Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D3D346A07
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774577907; cv=none; b=HA5fmVJj2941TxUUzd9mXn1G7Ge1UL5NIp7fow81GAZ4hyDmbFby539C3EflVB+1/44bKRW5ftic74wqekgHjc7EC9y0HkRP85ceO3hWsgsM253BP93MI3PUHxTDnwDYNepAfcqV4/ooVEU+Uqis9ecp7ipavBKNC2blufKjVV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774577907; c=relaxed/simple;
	bh=2M0077shx+cp5E/0UitoS25jemq15VlJuQh2C/Iu43A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fqr6Css4m56655TUkOSLwpCH38Y/HqFnTwkSiadO/7VDGVPrKH8VITWxKpm4EhS7jG1Z4aMITBHfpKYXr1SRUQYbeXi/paQvZSPBptlwpqfTF31Sy03yvBpS6295LIZsKmg4xRxWoLth10S1jqbg1mdVQiKgNC/15IcXoHcfZEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=F4uQx+XK; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ATFG84Jf; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="F4uQx+XK";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ATFG84Jf"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774577904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ySK0vbw5fQQ1k3iTzALbXciUAXQFVLXE+FR8sQuweNg=;
	b=F4uQx+XKLCCY7oRL3+Zn7m7BNw6lpIo2cmYfhnUWqjfWIizsy5ILbsrwHKgIfjavd3WoMd
	VI/8HcybDifI6bfSFzthj5CPOLnI6DJB+aCDKIIHG4RD/F8YM2PjYJvwXRNFGXLKrBM1bk
	hgYo8uuIdiWrI8p6nYO10STGRvupd8B5czwbr3jR13LLa+2x1N07U50m1YWULXlsSb2NAf
	nk9aLSnApt1mkfDly3fzInaMemOwCenoLf/nPLwZP9uvtdeh8sUlXcE3+mvgpETQ9Eh+pG
	XVMpQigj2IfB3I5lMLqYeNddGzUQbn/Yw5bwV33Fh9ZHmPEy4KkC+pK9nm2X0Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774577904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ySK0vbw5fQQ1k3iTzALbXciUAXQFVLXE+FR8sQuweNg=;
	b=ATFG84Jf4/5hYS1q/bjLm2kqTx20p15lQxDC5sc2tASPccXO48qLXTN1EPBiJ//LrnU5/I
	S+3Ot5v9AccmAsCQ==
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
Subject: [PATCH v6 18/90] x86/cpu: Use parsed CPUID(0x80000000)
Date: Fri, 27 Mar 2026 03:15:32 +0100
Message-ID: <20260327021645.555257-19-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

At early boot code, use parsed CPUID(0x80000000) instead of invoking a
direct CPUID query.

The original code has the check:

    extended_cpuid_level = ((eax & 0xffff0000) == 0x80000000) ? eax : 0;

to protect against Intel 32-bit machines without an extended range, where a
CPUID(0x80000000) query will repeat the output of the max-valid standard
CPUID leaf output.

A similar check is already done at the CPUID parser's own CPUID(0x80000000)
read function:

    if (CPUID_RANGE(el0->max_ext_leaf) != CPUID_EXT_START) {
        // Handle error
    }

Thus, for the call-site, the parsed CPUID NULL check below:

    el0 = cpuid_leaf(c, 0x80000000);
    extended_cpuid_level = el0 ? el0->max_ext_leaf : 0;

is sufficient.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/common.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index f31746c216c9..204c1f65f265 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -1017,6 +1017,7 @@ static void init_speculation_control(struct cpuinfo_x86 *c)
 
 void get_cpu_cap(struct cpuinfo_x86 *c)
 {
+	const struct leaf_0x80000000_0 *el0 = cpuid_leaf(c, 0x80000000);
 	u32 eax, ebx, ecx, edx;
 
 	/* Intel-defined flags: level 0x00000001 */
@@ -1052,12 +1053,7 @@ void get_cpu_cap(struct cpuinfo_x86 *c)
 		c->x86_capability[CPUID_D_1_EAX] = eax;
 	}
 
-	/*
-	 * Check if extended CPUID leaves are implemented: Max extended
-	 * CPUID leaf must be in the 0x80000001-0x8000ffff range.
-	 */
-	eax = cpuid_eax(0x80000000);
-	c->extended_cpuid_level = ((eax & 0xffff0000) == 0x80000000) ? eax : 0;
+	c->extended_cpuid_level = el0 ? el0->max_ext_leaf : 0;
 
 	if (c->extended_cpuid_level >= 0x80000001) {
 		cpuid(0x80000001, &eax, &ebx, &ecx, &edx);
-- 
2.53.0

