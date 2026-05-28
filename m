Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB7E3FE36D
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982825; cv=none; b=VRuw7DiT6rGLTQ01qYiv8jHJ4SVnFtAslXSacKJp05NyRCKpbUaWoRvvCTdHS6H/t2uEt/yFy+yGHR8lPBEu7xpu/wEjuOfeSzZuUqdCAC8Zmeb86d88y983e9ROyROhiGSZKmb6+WElx7vyhdr6JIbXqdZ3QWsa5cv3GqC2nl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982825; c=relaxed/simple;
	bh=sl6C0wJhIFidfHLcpnMa5hAhYTKn2SOK2ff5l5LU10A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oXCGrhm1nq4SmqDdGNttbjpMkSZBdHthpoPROytm6+AQ1qwuBcx9e83dNerUZr0H4mczRENh+SU496iPfm/gPhTW/QQ+4fh8PoKQbhjkMg27D6NQajmpQ0bS5JoGKAAhoWdGoHgi/XPvKa6bhG9hk/luLLU2H9e4SVAMvWjD2Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bB0YzQFt; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=R/3HlCOm; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bB0YzQFt";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="R/3HlCOm"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zTVNWRQPCqzGBrFVhtMiodywZ6GPWl7y/Gu9wWG7slI=;
	b=bB0YzQFtoxGXwmw7S5Sxhwbr6otQ55bYW6p3myNVhhhfiqn++aKmonL7/MGnBZagT7Ncvi
	nsL1RGLP5ec/1a3yb4IDFHiAEFEu6121sgCkp3hZUmDIfTNBHZ7MA+daTgZmjUEEi3Jtr2
	JjCXiTT04b5PuNKDi/ZA+5D8YZ8ImmPzjm6EAQ4zV3JM/QmKxyLE3T6rhILsxapjsEW+S7
	+r7LP2+GbHsK6ZpLw3YwjaqfkjYZPUQQNjpiDEu9r+sS83RFHjr2nyJZkT3MigkxXQ8zbZ
	RubxARf87QV5zBK3OBv6DEeer0xKXgMz5r4fMmLxcryj2l8jShfR3cUAim9ONw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zTVNWRQPCqzGBrFVhtMiodywZ6GPWl7y/Gu9wWG7slI=;
	b=R/3HlCOmL9Gi/Ul3Jx1Ykp1LyyBQ+5kRWnnVtSGH8EG6X/7ZC7OgAm21HBkSkBg27d9gkm
	J1sZl5DJL7QMPkAg==
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
Subject: [PATCH v7 013/120] x86/cpu: Use parsed CPUID(0x80000000)
Date: Thu, 28 May 2026 17:37:35 +0200
Message-ID: <20260528153923.403473-14-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
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
index 257808609ef5..9b05a747161f 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -1019,6 +1019,7 @@ static void init_speculation_control(struct cpuinfo_x86 *c)
 
 void get_cpu_cap(struct cpuinfo_x86 *c)
 {
+	const struct leaf_0x80000000_0 *el0 = cpuid_leaf(c, 0x80000000);
 	u32 eax, ebx, ecx, edx;
 
 	/* Intel-defined flags: level 0x00000001 */
@@ -1054,12 +1055,7 @@ void get_cpu_cap(struct cpuinfo_x86 *c)
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
2.54.0

