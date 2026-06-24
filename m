Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AA53E5578
	for <x86-cpuid@lists.linux.dev>; Wed, 24 Jun 2026 21:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782335062; cv=none; b=jE2wgkcpUCrdS3edSbxRkMh7Z4q1R/lkI6hcZBbJ3IWKIpWGNtD4jhNv0pUnLhl8KbhmCDA4SNyspu3YREU6RPTPT4gF6uQOqzZlt+sKPWBTDCw7o+QuERZQRawGfuiiXy6+fa8Iqhw8hdYBEAuo3cCddAfR+vO/5MwDmI7bkgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782335062; c=relaxed/simple;
	bh=BJYapou6Cm42fC0P/8gksKo93ZSzRFKuuynhBa/JA7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aVY2kNaYGperEKjeSZ9fta1EjUo3PZa1egDPfjBr1xQYLkqHUTxFTbeBPZaO43OwKjl2uYsKBX17X4HMzLqy8mbFHtwJTmjc5Q9MEuKq3myKAHBWSfYlmkKdgWgmVTvr8L+4xyde0m4YHYE/TH8xVS/8ScYwwAByxR1QygrtmdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=P/J5zxKe; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="P/J5zxKe"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 3E80040E0031;
	Wed, 24 Jun 2026 21:04:16 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id EepG-sW4FMPy; Wed, 24 Jun 2026 21:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1782335046; bh=tHqShpliqNMUN36u3T9KE+80EurkGfAAkSPwTihJ05U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P/J5zxKe70xdTwHm52lAipdH30AUw1mSPLVYJBHGoq5VlkdC05u8EyZHDuGsFtjOL
	 2KsQVWFCbXgGdMHnswOpGONyM2Dp8v4jAP85Jr+3vjNOIA2sg0ia872dZa/Yd5AJL7
	 S1Go/4MEKmfqSCQQHv6k/r2bAyaibRQ4zOjAc1lglTb6jNBu+1dUrXD2wkTFX9fm5r
	 U1KlzA1iQhn2DP5WK4rI1ekw/Sd58AQ3l+y5PzfZCS0Y18/C521qlWzeCzuFd9QFYb
	 St/eMEuKgcSz0kzQn6nNQygdAbdzU5XuC1kQrkKFE/v6fl88NqOzOjFhjJpbSI/RZJ
	 QqLvdOZxD4EsJa1YmsqDtiJeyVBlWv2CRnHqpk9FJdHo+NiTde9Tf2Nxg1EI/rlePN
	 gPHwnFQDPslUXNiqvPe5yRJA1gqX/ntH41gMCLvgF/XeVhFaKPsm1PlLY76IcFcWXf
	 9Y1f4a7kYdEn+oMTSsFLELmhCntVI8Fl/Xtuf0wCKlWv0FmeNaNA7lCsksdxdzVNMT
	 DoGdhD0zHCKSF+6K8l+h94PA+oTIifSYxmfwHN3nLuKHIiYXJ70vp/w7mHOamNj7fS
	 DX8cz1LpLrPF+CFDPjQU8EcYPsiVXyfxfyZFmWSOcGHczh4UMV2PGZuroAqyJKazyX
	 hMpxxa0SfGYn0+4YhILQmjSc=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 8F5ED40E00BF;
	Wed, 24 Jun 2026 21:03:52 +0000 (UTC)
Date: Wed, 24 Jun 2026 14:03:49 -0700
From: Borislav Petkov <bp@alien8.de>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Christian Ludloff <ludloff@gmail.com>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 019/120] x86/tsc: Use parsed CPUID(0x16)
Message-ID: <20260624210349.GAajxGNdznHttMxHme@fat_crate.local>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-20-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260528153923.403473-20-darwi@linutronix.de>

On Thu, May 28, 2026 at 05:37:41PM +0200, Ahmed S. Darwish wrote:
> @@ -738,19 +734,9 @@ unsigned long native_calibrate_tsc(void)
>  
>  static unsigned long cpu_khz_from_cpuid(void)
>  {
> -	unsigned int eax_base_mhz, ebx_max_mhz, ecx_bus_mhz, edx;
> -
> -	if (boot_cpu_data.x86_vendor != X86_VENDOR_INTEL)
> -		return 0;
> -
> -	if (boot_cpu_data.cpuid_level < CPUID_LEAF_FREQ)
> -		return 0;
> -
> -	eax_base_mhz = ebx_max_mhz = ecx_bus_mhz = edx = 0;
> -
> -	cpuid(CPUID_LEAF_FREQ, &eax_base_mhz, &ebx_max_mhz, &ecx_bus_mhz, &edx);
> +	const struct leaf_0x16_0 *l16 = cpuid_leaf(&boot_cpu_data, 0x16);
>  
> -	return eax_base_mhz * 1000;
> +	return l16 ? (l16->cpu_base_mhz * 1000) : 0;

Ok, this looks like a vendor check which you're replacing with the *l16 leaf
pointer check.

So, instead of doing those vendor-specific thing and then having to update the
parser everytime a vendor implements a leaf, what you can do is check whether
the leaf is supported. If so, you can return NULL in cpuid_leaf() and thus
denote that the current vendor the kernel is running on, doesn't implement the
leaf.

And you can detect which leafs the vendor implements by looking at max
supported leaf.

And then you don't need any special vendor handling.

Btw, pls merge this patch with the previous one.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
