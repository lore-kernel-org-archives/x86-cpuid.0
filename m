Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0448E44BCB5
	for <x86-cpuid@lists.linux.dev>; Wed, 13 May 2026 16:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778691123; cv=none; b=tkfOlE3nv1ROpYpzPYVuS7Dk8t1rTsuo6KpKe4szCfygecVYaAc4272pZPC1z24SNsNkDxofqjeKOYB8Kf/c+SdE5TjQeJg9ax/XRl0UPPzU2OeqVmkuUT+9xKCg1N/mTKiMCZFEECDR12DpC6l4xvLEvlTCnOKFPzlANQ4z7nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778691123; c=relaxed/simple;
	bh=MbdehCAt5fjW/98NMM10PVvjGPliml6GnW5NBgmae8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QOh8Pml2Wg6WwBgq5JuAVwOk7y001c9fsXAQE+RlESL1L6oNCcTnFmWMcask8+odNMzFgzZaHW31JNRLWsbRz3+K4C0UkQ3GnuQ2UpxUI1Ifw7Tek2XQqfzGFAEuf0x5nGoPaErjhJcQa7YLKds9foGlm9O4CflIg4FDbtdwvUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=IiEgKjJa; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="IiEgKjJa"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id CEF8340E01A1;
	Wed, 13 May 2026 16:51:59 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id KubK15vNn5P2; Wed, 13 May 2026 16:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1778691110; bh=/ug995I/K+5TDNteRqjWNoLWyJjKHCDfKPz0lL+qs2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IiEgKjJabaiaGYTAd1XBaPvrGH/9Sp3nB4Z8hH/DmcDSa5qlvK4REPPm0BptWPK/j
	 9HKNE1mEb6MyAc4gGvam/3CHkeM9ge/aYSu/xe/UTam+kg+PHKoe/YYEkbS9+uty6Y
	 OxeY6LCeSBazBTJFEdrPjMAFd49x8XWki9fcLZvKX023scbzipPfbU2VdAeaI/jopJ
	 Cu7VNl8UYRtaQOPhQ9teySBQmjIqqV5fpht5l9YiFz4fLf24nluR86b8VjjSpwwLR0
	 RgZ+C5ugYmrHz9BA99NB99w7QBOtu2Fp0lAVz7LQK5A2I/MyA0a5VB+Q4CYT0a3Fuq
	 a6uYlu2+L7wxI4A8rrHgYM2yuKBRE37lNNoPHfnnukYRqT/GYg8FVx24fsFJ3YT4yd
	 ITk/TMMDrxyyC7HynHctd23RUP/qD+ki15vcI/+1DDhXQL4nB8brkEAQ484e72Tr9J
	 GoHmBqkzpAGgXuQl/ea+r/G1GEWR/Mon5lgMIY6wDgfzMwu7lX+SfVHLXjDsPFxyYC
	 qoS03S4UNCrERupp5C61aLUd+DbUPeWF/xr8btIJ//pjfCnyqoQd/sLWKsc6PblK/A
	 pyACHhOTyffYoajpEsNW2CzsDTNxsWJrPaqVvUVtUzVmeD6vEM+v0+s4UUkL7Yaoga
	 ru4d3LOTvprYS62xFwf89U/4=
Received: from zn.tnic (pd953014d.dip0.t-ipconnect.de [217.83.1.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id B899640E00C2;
	Wed, 13 May 2026 16:51:34 +0000 (UTC)
Date: Wed, 13 May 2026 18:51:28 +0200
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
Message-ID: <20260513165128.GFagSsEPFCogQu7n5t@fat_crate.local>
References: <20260327021645.555257-1-darwi@linutronix.de>
 <20260327021645.555257-11-darwi@linutronix.de>
 <20260511200032.GAagI1YMP51EzCo7dn@fat_crate.local>
 <agLS2Y7smYRHyiHf@lx-t490>
 <20260512143412.GDagM6ZLBpvt6X3jzq@fat_crate.local>
 <20260513152742.GDagSYbheCBWwNeVj-@fat_crate.local>
 <agShjbCo_HSs9YOf@lx-t490>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <agShjbCo_HSs9YOf@lx-t490>

On Wed, May 13, 2026 at 06:06:37PM +0200, Ahmed S. Darwish wrote:
> That will break the clear_cpu_cap() just some few lines above it.  That is,
> it will reset all feature flags force set or unset by the kernel.

We do
	apply_forced_caps(c);

later in identify_cpu().

I think you mean whatever has done clear_cpu_cap() which doesn't use the
cpu_caps_cleared/set arrays.

> I'm sending another patch queue iteration shortly that have a new API
> function abstracting this min_t() logic in its own parser function, along
> with better documentation:
> 
>     https://lkml.kernel.org/agSfWTxs9pRPHJxl@lx-t490/

And I don't want to pay attention to which ranges I've parsed and which
I haven't. That's too fragile. I want to simply rescan the whole thing and be
up-to-date.

Also, what guarantees that this thing:

	rescan_from = min_t(int, l0->max_std_leaf, c->cpuid_level) + 1;
	cpuid_refresh_range(c, rescan_from, CPUID_BASE_END);

doesn't overwrite some unrelated ranges?

Also, in your example:


* First case:

           leaf 0x0
	   leaf 0x1
	   leaf 0x2     <- Old max CPUID
	   leaf 0x3
	   leaf 0x4
	   leaf 0x5
	   leaf 0x6
	   leaf 0x7
	   leaf 0x9     <- *New* max CPUID

when you rescan and overwrite [2-9], what guarantees that you don't overwrite
an already set or cleared bit in those new leafs, say in leaf 5?

Neither set_cpu_cap() nor clear_cpu_cap() pay attention to the max base leaf
value?

IOW, I *think* we want to be on the safe side and reread *only* the leaf we
disabled.

I guess we need to know which leaf changes when a MSR bit is toggled and
rescan only that leaf alone.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
