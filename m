Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B600301471
	for <x86-cpuid@lists.linux.dev>; Mon, 11 May 2026 20:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778529677; cv=none; b=c6IJ2nQHeQbKGvSv7Yu+gBi87ydJ4S8aC6SLo17WCgu/oQQpiIfizVmR4m0v0vU0rtEpgRPWOrMeqjkow6UYDPE1O1LweOS/WqLuzxb+wejbW/x9mAqIFeeXZtF260/FcffAPIaCA2yOufWScdiiJJdGC/q9hJBNYXI0MmUZGDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778529677; c=relaxed/simple;
	bh=VciKCivqJPvGqVAtG9vGXprYTUlkMPM9z2tWWE+RuJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YTYH2VPTvufgUxaPG1JJ18tElkPi079LSxVavUToC8WpoMFTyhpRz/jjo5991zh4sJRFxQLdNOF7n4oLOm0bhFPnYIt0D9uMX2uQHXW+VJiAj373kR0VqCvrCfJ2xKnLTIPfIg3vLrO9uWk+8w4x6KxogXoPmYcPRtk3NFcORhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Z7iMntCz; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Z7iMntCz"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id BB74740E00BF;
	Mon, 11 May 2026 20:01:05 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 4vk0WVdlfdLb; Mon, 11 May 2026 20:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1778529655; bh=3bVkF++m9HRWpO0WGRA89OidPS1vI4yKqFPHOpnFV/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z7iMntCzX0bMjecTwbxZoEiwklh9YRRftPv600dM3MOEKACRhTMNZs2H0gLrwenPe
	 NBLRoCnEjuatNRt3+HdAurJG2k6lVVcOu4i/QMCYFqo9JAcFCPaOq6yAxRvn4CrPm3
	 gMh1eA5GrwXmRlwm7Hh3YW79hXE0OUH8hMgJtByLB0pl3qt2lIw6vN2JEyaHHOGkaz
	 WUVbMtJxm1mgbKmWQ8FuHl5ibHLGBSBAdvHGiFWimRml4eC3FO+CwM789DCWPAx3aE
	 YEQDmJ7FG4n9Ft5VceXDVer95zhtU5kKsnokLDHM8E7x5OhpmuwmFcEe1CJgBh1a9U
	 F58P00y7Rz2oyK+qExbQWhB166kkOW82SyD+pJWqEPQtzUfxBBlilTt1I8hEmAZlJp
	 4FcoWWABjIj7Q24PgiCa1V872d4zkJHYUiYWloQdoHsYw6OwpzVACFfHZYGlQgcx08
	 2p8ThlnaXwEarBY7SW1SNh3Z8xx5iTg1fUUbM6tuvNDtH34I9a2+eNLe8Hgm7Ps+8/
	 LaI5LbysGTjBr4I7xpeh52n+93/LWCjepFAgAzBqLkY1n4+7smlG3xHMe/2RvoPZF9
	 uO0m+VLi3m1nQwCZsGIUgG4ahfPSSInOmXBvp2o9IwppSM5NsyqhnZI6zZsWEmfv8G
	 CtKucZUXDVlQL1OAIqXTG8b0=
Received: from zn.tnic (pd953014d.dip0.t-ipconnect.de [217.83.1.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id CA75B40E0032;
	Mon, 11 May 2026 20:00:39 +0000 (UTC)
Date: Mon, 11 May 2026 22:00:32 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Sean Christopherson <seanjc@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Christian Ludloff <ludloff@gmail.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 10/90] x86/cpu: Rescan CPUID table after disabling PSN
Message-ID: <20260511200032.GAagI1YMP51EzCo7dn@fat_crate.local>
References: <20260327021645.555257-1-darwi@linutronix.de>
 <20260327021645.555257-11-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260327021645.555257-11-darwi@linutronix.de>

On Fri, Mar 27, 2026 at 03:15:24AM +0100, Ahmed S. Darwish wrote:
> On Pentium-III and Transmeta CPUs, disabling the CPUID(0x3) Processor
> Serial Number (PSN) can affect the maximum valid CPUID standard leaf.
> 
> Rescan the CPU's CPUID table in that case not to have stale cached data.
> Rescan only the changed CPUID leaves, not to override any of the kernel's
> previously force-set or unset cached CPUID bits.
> 
> Rename squash_the_stupid_serial_number() to disable_cpu_serial_number() and
> explain the rationale behind disabling the CPU's PSN.

Except that those changes do not belong in this set. So I zapped them, see
below.

Also, why are you doing this min_t thing?

+       rescan_from = min_t(int, l0->max_std_leaf, c->cpuid_level) + 1;
+       cpuid_refresh_range(c, rescan_from, CPUID_BASE_END);
+       c->cpuid_level = l0->max_std_leaf;

Wny not simply:

        /* Disabling CPUID(0x3) can change the maximum base CPUID level. */
        cpuid_refresh_leaf(c, 0x0);
        l0 = cpuid_leaf(c, 0x0);
        if (!l0)
                return;
 
        /* Rescan from the new maximum base CPUID level. */
        cpuid_refresh_range(c, l0->max_std_leaf + 1, CPUID_BASE_END);
        c->cpuid_level = l0->max_std_leaf;


commit 6ee288c96f9b701f71140e86d20cd16df778afba
Author: Ahmed S. Darwish <darwi@linutronix.de>
Date:   Fri Mar 27 03:15:24 2026 +0100

    x86/cpu: Rescan CPUID table after disabling PSN
    
    On Pentium-III and Transmeta CPUs, disabling the CPUID(0x3) Processor
    Serial Number (PSN) can affect the maximum valid CPUID standard leaf.
    
    Rescan the CPUID table in that case in order not to have stale cached data.
    Rescan only the changed CPUID leaves, not to override any of the kernel's
    previously force-set or unset cached CPUID bits.
    
      [ bp: Zap unrelated changes. ]
    
    Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
    Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
    Link: https://lore.kernel.org/all/20260327021645.555257-1-darwi@linutronix.de

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index a3df21d26460..01b64d04eb3b 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -339,13 +339,14 @@ bool cpuid_feature(void)
 
 static void squash_the_stupid_serial_number(struct cpuinfo_x86 *c)
 {
+	const struct leaf_0x0_0 *l0;
+	unsigned int rescan_from;
 	unsigned long lo, hi;
 
 	if (!cpu_has(c, X86_FEATURE_PN) || !disable_x86_serial_nr)
 		return;
 
 	/* Disable processor serial number: */
-
 	rdmsr(MSR_IA32_BBL_CR_CTL, lo, hi);
 	lo |= 0x200000;
 	wrmsr(MSR_IA32_BBL_CR_CTL, lo, hi);
@@ -353,8 +354,15 @@ static void squash_the_stupid_serial_number(struct cpuinfo_x86 *c)
 	pr_notice("CPU serial number disabled.\n");
 	clear_cpu_cap(c, X86_FEATURE_PN);
 
-	/* Disabling the serial number may affect the cpuid level */
-	c->cpuid_level = cpuid_eax(0);
+	/* Disabling CPUID(0x3) can change the maximum standard CPUID level. */
+	cpuid_refresh_leaf(c, 0x0);
+	l0 = cpuid_leaf(c, 0x0);
+	if (!l0)
+		return;
+
+	rescan_from = min_t(int, l0->max_std_leaf, c->cpuid_level) + 1;
+	cpuid_refresh_range(c, rescan_from, CPUID_BASE_END);
+	c->cpuid_level = l0->max_std_leaf;
 }
 
 static int __init x86_serial_nr_setup(char *s)

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
