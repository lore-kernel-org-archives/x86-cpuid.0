Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740423403E8
	for <x86-cpuid@lists.linux.dev>; Mon,  1 Jun 2026 22:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780352598; cv=none; b=bBRegeZH3gkZ76/AxxM72j3zQLVxZ63E3Tpm32l0R+QvdMK9dozy/pUW9/ZZTsC1XwEwqggrW2OG54pEh3r/mdu99P5T9CptG9vJVpkswrGVv7KP8cA7K//EIkdBoUzE25ZGP2wocW86o1fyPC4FS20fdGoW8TD4yXk4q6RIIbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780352598; c=relaxed/simple;
	bh=pKDrDbwRhHuUEPEA71vXaN7sPNVTH4wl/PaGkQSlWoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XYOPErUgGSkuSFI93xUI9VfWCDf71NEDBmTo/oit4hY79rZgboHhvhXym6HrMhgy3d2gerJJtzU5aoXC12ga0k9akNj3LEsmpcPmlR3pStXxQV5dBi/alAEzX+d8/rmIypHTHm3G9ttwg787a7/SEAmsd+RU3tn/mUim3Hu29AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=N6dVGcl2; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="N6dVGcl2"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 23F5F40E00BA;
	Mon,  1 Jun 2026 22:23:14 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 14REXZLBVOuy; Mon,  1 Jun 2026 22:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1780352583; bh=CQ3j6W1znJz22wyd9MAALmFBN7T1UiQE7WP7mpnxuzY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N6dVGcl2x1p/eC5zOR3G3cimOXmM2kL1roTRHgxBqUeYoXbzWpjr8pApojD3tryLi
	 VGquB0q3ZR7+AMHaTWmp8jE32dKZR//JvHXqsHo6dEtkl+k9Hhx1v0zzmPQoeo/DdQ
	 KP3PBPGnjUhtr19qsAbKvKClVOrBJjlnHZ0eqFyqJ3IhgKO5Agygcu0l4sZYvDdmFU
	 DM5Xx7UrULLt0qQmeaEfnrNkKIaGYjDHyFdRzDXxYmc2z6+u+P8OpTBo9iBZByDkTQ
	 GIK2kVhiFJAL2BkgdEEH53eVJ2ol0mOYA9y7WgaIF+U7tb4o5oSeEv9mlC3/YpwkRf
	 6qlvgJiHB6el8E6Cf9gxNuGsw/TlgGx2mRxpwox4s1siOE68WBTdNw7PA/Wkro2lAD
	 8Nl9S60jMR8fiO0s47gdeIxwEUaYt/CIJC0U8xe0PlYWL70Pvoeg1xSNILqHFyzQIS
	 6FdlF/uxssX98bx584EbUHuYyDvD8CZ0oBWl7OKaxaQLfAC2VQnGSUjGXjljQiJNtz
	 ieVd73qmCsapcoJEaE/BHocY9D1Y53CWB/3FSFTigpOBSC/CkBwJm7f+Ar3livBLp1
	 NlABIXQBTmqaLI91f08hQqdo53RYN0+4tXaN0yuTasC/N1mq6p9LmJO4YbSvnUjBG0
	 QwqUV3FsEsCtJeGJ1BIlTiYA=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 65C7940E0032;
	Mon,  1 Jun 2026 22:22:49 +0000 (UTC)
Date: Mon, 1 Jun 2026 15:22:39 -0700
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
Subject: Re: [PATCH v7 012/120] x86/cpuid: Parse CPUID(0x80000000)
Message-ID: <20260601222239.GBah4GL777WIRuj-Wk@fat_crate.local>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-13-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260528153923.403473-13-darwi@linutronix.de>

On Thu, May 28, 2026 at 05:37:34PM +0200, Ahmed S. Darwish wrote:
> Add CPUID parser logic for CPUID(0x80000000).
> 
> Verify the CPUID output since legacy Intel machines without an extended
> range will repeat the highest standard CPUID leaf output instead.
> 
> This verification is similar to what is done at arch/x86/kernel/head_32.S
> and arch/x86/kernel/cpu/common.c.
> 
> References: 8a50e5135af0 ("x86-32: Use symbolic constants, safer CPUID when enabling EFER.NX")
> References: 67ad24e6d39c ("- pre5:    - Rasmus Andersen: add proper...")  # Historical git

Why are those here?

insert_tag: WARNING: Unknown tag: [References: 67ad24e6d39c ("- pre5:    - Rasmus Andersen: add proper...")  # Historical git], ignoring it... 
insert_tag: WARNING: Unknown tag: [References: 8a50e5135af0 ("x86-32: Use symbolic constants, safer CPUID when enabling EFER.NX")], ignoring it... 

> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Link: https://lore.kernel.org/r/d4fcfd91-cc92-4b3c-9dd2-56ecd754cecc@citrix.com
> ---
>  arch/x86/include/asm/cpuid/types.h |  4 ++++
>  arch/x86/kernel/cpu/cpuid_parser.c | 21 +++++++++++++++++++++
>  arch/x86/kernel/cpu/cpuid_parser.h |  1 +
>  3 files changed, 26 insertions(+)
> 
> diff --git a/arch/x86/include/asm/cpuid/types.h b/arch/x86/include/asm/cpuid/types.h
> index 3d0e611c97ba..c020fb8fed59 100644
> --- a/arch/x86/include/asm/cpuid/types.h
> +++ b/arch/x86/include/asm/cpuid/types.h
> @@ -36,7 +36,10 @@ enum cpuid_regs_idx {
>  #define CPUID_RANGE_MAX(idx)	(CPUID_RANGE(idx) + 0xffff)
>  
>  #define CPUID_BASE_START	0x00000000
> +#define CPUID_EXT_START		0x80000000
> +
>  #define CPUID_BASE_END		CPUID_RANGE_MAX(CPUID_BASE_START)
> +#define CPUID_EXT_END		CPUID_RANGE_MAX(CPUID_EXT_START)
>  
>  /*
>   * Types for CPUID(0x2) parsing:
> @@ -203,6 +206,7 @@ struct cpuid_leaves {
>  	/*		Leaf		Subleaf number (or max number of subleaves) */
>  	CPUID_LEAF   (	0x0,		0  );
>  	CPUID_LEAF   (	0x1,		0  );
> +	CPUID_LEAF   (  0x80000000,	0  );
>  };
>  
>  /*
> diff --git a/arch/x86/kernel/cpu/cpuid_parser.c b/arch/x86/kernel/cpu/cpuid_parser.c
> index 898b0c441431..2cebe15f75d4 100644
> --- a/arch/x86/kernel/cpu/cpuid_parser.c
> +++ b/arch/x86/kernel/cpu/cpuid_parser.c
> @@ -38,6 +38,24 @@ cpuid_read_generic(const struct cpuid_parse_entry *e, const struct cpuid_read_ou
>  		cpuid_read_subleaf(e->leaf, e->subleaf + i, regs);
>  }
>  
> +static void
> +cpuid_read_0x80000000(const struct cpuid_parse_entry *e, const struct cpuid_read_output *output)

For your whole patchset - remove all those linebreaks pls.

> +{
> +	struct leaf_0x80000000_0 *el0 = (struct leaf_0x80000000_0 *)output->regs;
> +
> +	cpuid_read_subleaf(e->leaf, e->subleaf, el0);
> +
> +	/*
> +	 * Protect against Intel 32-bit CPUs lacking an extended CPUID range.  A
> +	 * CPUID(0x80000000) query on such machines will repeat the output of the
> +	 * highest standard CPUID leaf instead.
> +	 */
> +	if (CPUID_RANGE(el0->max_ext_leaf) != CPUID_EXT_START)
> +		return;
> +
> +	output->info->nr_entries = 1;
> +}
> +
>  /*
>   * CPUID parser table:
>   */
> @@ -53,9 +71,11 @@ static const struct cpuid_parse_entry cpuid_parse_entries[] = {
>  static unsigned int cpuid_range_max_leaf(const struct cpuid_table *t, unsigned int range)
>  {
>  	const struct leaf_0x0_0 *l0 = __cpuid_table_subleaf(t, 0x0, 0);
> +	const struct leaf_0x80000000_0 *el0 = __cpuid_table_subleaf(t, 0x80000000, 0);

The tip-tree preferred ordering of variable declarations at the
beginning of a function is reverse fir tree order::

	struct long_struct_name *descriptive_name;
	unsigned long foo, bar;
	unsigned int tmp;
	int ret;

The above is faster to parse than the reverse ordering::

	int ret;
	unsigned int tmp;
	unsigned long foo, bar;
	struct long_struct_name *descriptive_name;

And even more so than random ordering::

	unsigned long foo, bar;
	int ret;
	struct long_struct_name *descriptive_name;
	unsigned int tmp;

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
