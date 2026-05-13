Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6247043E9CB
	for <x86-cpuid@lists.linux.dev>; Wed, 13 May 2026 15:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778686099; cv=none; b=mNYO9xLoimglsc2xzMzFcaBaF9NQMqlISYcfXXiSVzFO3oi+iFbGVd0c8yUY3+DaAQIIGOiPkNVS9T31AjuirJE1y1ADpMegUNqEoL+5qTSjVeNjq8I5Rf852w/nuKUqew4K9QRtBuboQDukm+VDysGRQi8z30AYgGSf8AGMU/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778686099; c=relaxed/simple;
	bh=Zt3y35o6HZiQI7r+F0CFPBkcmuxpHvsR6wZHXXODoZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tEcqHoM9t6Qiv/Ptg/p8JQTO8ltXam9pEaGpcgdGJc6pW5y30G7R71Lkc1ORYkkkUo0PKuDic1ufmZAWLoiRvjPfgRFnvGPWlSxTL60DZGQHNYEa89gCyj5wJLNDcnnhMjj8imLGyUK/BcB1sFG4NxSwBGZn8jwgTXOIS5C7zfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=OSJ2971V; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="OSJ2971V"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 100F240E01A1;
	Wed, 13 May 2026 15:28:13 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id AvAT1pA8ZFzc; Wed, 13 May 2026 15:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1778686083; bh=xgtDCot1zNsu/+8i77MoVKRqUiu4XQxX/yzrEcGdGPQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OSJ2971VjIAiDfNlgID678FP/3s6wCa/CM9zH53oAxqKDcjcWwuqC55WEX0Ucdcr1
	 1yg2f7CLjUBqGlQltnrgWPMcjkvu8R2BNGVR7GnFVNxPImJ5gIOB7bxXArAAbsgswY
	 2dqBpPAFLAClODBivGam9MHgL4vQLqJOOzatDd5Eu0Ypy97mnUdsT0fol8TF8/KfcS
	 US917xSVUYZrJ7E1piuM5DQC9S+WQv7kvv/1wJcCgvLRa/4RW3wVGQQ4J2hj0gcJ7B
	 77Gx8c0Bcq+8GzaxK/G+skW0+37uCgNgwqAsd3QTU6R0G1st7AdWWWqR1C3hDEu4Jq
	 uzHZVQafYTANqHNHnw0Cxwk0LBbcQ+O91AJ6j36JTJ89waDW5zshTMbgMVrV/5UlKK
	 Fy8JIsgiVCtOgdlNI9Uex53e4Gm7eKUwezM00uIdcfBqOSPYjyv1UR3M4eOlVb0DO2
	 lyupdI3k4yrrbwW2cfDLrAJ/m8KT0f0gbfj8lCj/PXewLrSpnYnigzVpzukuBOzDsG
	 bW1hTgMJnn8Qt4exVvNVvCfcTM5rymNtdkRbb6zvm2C0IWL2MB3jt7C/x2oPziHDm3
	 q5fo4ul63NdPuSSjnIO9pZDBd47YpkqeeKpEFmtB5mFQVX31Im6Fvvt8q77fHCJiGw
	 z/AuHMhq+K5quWFQlMLiE7+Y=
Received: from zn.tnic (pd953014d.dip0.t-ipconnect.de [217.83.1.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id E2D5740E00BA;
	Wed, 13 May 2026 15:27:47 +0000 (UTC)
Date: Wed, 13 May 2026 17:27:42 +0200
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
Message-ID: <20260513152742.GDagSYbheCBWwNeVj-@fat_crate.local>
References: <20260327021645.555257-1-darwi@linutronix.de>
 <20260327021645.555257-11-darwi@linutronix.de>
 <20260511200032.GAagI1YMP51EzCo7dn@fat_crate.local>
 <agLS2Y7smYRHyiHf@lx-t490>
 <20260512143412.GDagM6ZLBpvt6X3jzq@fat_crate.local>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260512143412.GDagM6ZLBpvt6X3jzq@fat_crate.local>

On Tue, May 12, 2026 at 04:34:12PM +0200, Borislav Petkov wrote:
> On Tue, May 12, 2026 at 09:12:25AM +0200, Ahmed S. Darwish wrote:
> > So the min_t()'s intent is just to be defensive against hardware surprises.
> 
> But when you read l0->max_std_leaf, you always get the current, highest base
> level. So there's nothing to protect against.
> 
> Or am I missing something?

Yeah, I am... might skip some leafs depending on how the max leaf changes.

So, just to be on the safe side, let's simply rescan the whole range again.

Diff ontop.

---
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 01b64d04eb3b..c51cdcad7875 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -340,7 +340,6 @@ bool cpuid_feature(void)
 static void squash_the_stupid_serial_number(struct cpuinfo_x86 *c)
 {
 	const struct leaf_0x0_0 *l0;
-	unsigned int rescan_from;
 	unsigned long lo, hi;
 
 	if (!cpu_has(c, X86_FEATURE_PN) || !disable_x86_serial_nr)
@@ -354,15 +353,16 @@ static void squash_the_stupid_serial_number(struct cpuinfo_x86 *c)
 	pr_notice("CPU serial number disabled.\n");
 	clear_cpu_cap(c, X86_FEATURE_PN);
 
-	/* Disabling CPUID(0x3) can change the maximum standard CPUID level. */
+	/* Disabling CPUID(0x3) can change the maximum base CPUID level. */
 	cpuid_refresh_leaf(c, 0x0);
 	l0 = cpuid_leaf(c, 0x0);
 	if (!l0)
 		return;
 
-	rescan_from = min_t(int, l0->max_std_leaf, c->cpuid_level) + 1;
-	cpuid_refresh_range(c, rescan_from, CPUID_BASE_END);
 	c->cpuid_level = l0->max_std_leaf;
+
+	/* Rescan from the whole range. */
+	cpuid_refresh_range(c, 0, CPUID_BASE_END);
 }
 
 static int __init x86_serial_nr_setup(char *s)

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
