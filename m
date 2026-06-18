Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B730B3DE450
	for <x86-cpuid@lists.linux.dev>; Thu, 18 Jun 2026 18:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781808782; cv=none; b=avSOGTWjYGLBP/jr7XEXl/UeK7pbjYnvaUgBmrWwP9jh06RySncZbQNdJmyTIyKRAnGtTbcjiRciVh5mtm5vLUQRuZFuTDvXLMnP5lBpEIzX2c+D9Nxzd4+qJ/PMHOEtXSagWfVsyKx5/uhczV29FcOw1m8twnxTTuNXzghDAPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781808782; c=relaxed/simple;
	bh=yHGIGX2qhgkxF0EGRjs3yjadradQlFo3/ZW3H51/o1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qPRS0a4PaUf3jVmnBtl424IiQOez1ChTIRAT1q0XQaFE3TXocd5K13oOazIKGsvU/hpTJqqhYyDRGXiRwz3VE8nuv8j6DyTtX4mDWbDC3dEC3Ft1ue/t+JcDxdcR5P2QocDeU/3xt0uN7tiVap/RhbzWEsjEVuwk73Eu744DCQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=fwXBeHsT; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="fwXBeHsT"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 9981B40E02A3;
	Thu, 18 Jun 2026 18:52:58 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id fLuj7HCVgr4y; Thu, 18 Jun 2026 18:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1781808768; bh=+t+L+ycgoTKmtpgFSi1iEymzTtbnDK5F5EtRBYBOh7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fwXBeHsTDuSF9y0nQnlj4RQs8coJUtl0WhTLTzG8SdZCWTXqrf9p0/5H9RfgdwT5j
	 3SBzo6n2YDNoiCUKKUzGMJdHK6DCZDebqivF7YhkZQD3qNsf0ytUcQXWfYdl4oytYD
	 w6hryqvnIXaM/pzs7Knt1I8m7bUATGoglDKfUkpUGfibTSmn8eSPS9of3sC9w5EWNs
	 Kd1hSp7HayJIFFXR8J/2XyLqOzyLVj6I9b3fI2JFdgMZ7zdyg4kCOLQBaI+jeNTVw2
	 W2qkhnYiOTbEklODglAhzDe5uImeRKRvPe6bkROSUM0nKPWK7fZqUWZpFjnchi4pyU
	 wHr2J3iF7bvcUGz+ULOw3WX4jhORZ3FkZptTTYGFr5jvq+ChW5bcdBw3zoUn1fyFt5
	 FsPvhmTJL7lF8Eg7utScqz8Bev67o9tncOdYqEPCgc2geguBpEkMfg0spCHMTYucFO
	 YC6Tq9fqOi2dYljJ2gZgDgtDQ7jmWzn88H+JssbLTKOas1sCXK8V4e7Od3hoTFLNtL
	 NIMbYusmwkfdp+PXvDRLnY0eFoaTCEVAJ+0ib077oAbEMPHYHmuJb6Byln/Z3mu7NS
	 8wcRYpN7GFOPppElyLS04U9I/yoh0BZtGjIUIpRwtsfcceBWesX1UZIk/shIop+l1d
	 hagLEntXBFwoOxEDXIclajWw=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 074A640E01D2;
	Thu, 18 Jun 2026 18:52:34 +0000 (UTC)
Date: Thu, 18 Jun 2026 11:52:31 -0700
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
Subject: Re: [PATCH v7 018/120] x86/cpuid: Parse CPUID(0x16)
Message-ID: <20260618185231.GCajQ-b8VSy19-y6xZ@fat_crate.local>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-19-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260528153923.403473-19-darwi@linutronix.de>

On Thu, May 28, 2026 at 05:37:40PM +0200, Ahmed S. Darwish wrote:
> diff --git a/arch/x86/kernel/cpu/cpuid_parser.h b/arch/x86/kernel/cpu/cpuid_parser.h
> index 8b0d44b745c5..ee1958f3d369 100644
> --- a/arch/x86/kernel/cpu/cpuid_parser.h
> +++ b/arch/x86/kernel/cpu/cpuid_parser.h
> @@ -144,6 +144,7 @@ struct cpuid_parse_entry {
>   */
>  #define CPUID_COMMON_ENTRIES									\
>  	/*			Leaf		Subleaf		Reader function */		\
> +	CPUID_PARSE_ENTRY   (	0x16,		0,		generic			),	\
>  	CPUID_PARSE_ENTRY   (	0x80000000,	0,		0x80000000		),	\
>  	CPUID_PARSE_ENTRY   (	0x80000002,	0,		generic			),	\
>  	CPUID_PARSE_ENTRY   (	0x80000003,	0,		generic			),	\
> @@ -180,5 +181,6 @@ struct cpuid_vendor_entry {
>  
>  #define CPUID_VENDOR_ENTRIES								\
>  	/*		   Leaf		Vendor list		    */			\
> +	CPUID_VENDOR_ENTRY(0x16,	X86_VENDOR_INTEL),				\
>

If this leaf is Intel-specific, why is it being added to the common entries
too?

 * For vendor-specific leaves, a matching entry must be added to the CPUID leaf
 * vendor table later defined.  Leaves which are here, but without a matching
 * vendor entry, are treated by the CPUID parser as valid for all x86 vendors.

Why?

I guess it has to do with that vendor parsing in 016 but parsing things twice
better have a very good justification.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
