Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F010316F27F
	for <x86-cpuid@lists.linux.dev>; Wed, 24 Jun 2026 23:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782343899; cv=none; b=Q1/a0G5Kz77GnHdPMKi1T9UWl3Xcq3/fFsKs1ilG8f1U7DVijx0hEd3bRH8mMf5NkJRFOdw1gdoIJnGRR+HltSH8+yPgPd7QXqTxSDsQ96AYLre82fqXALdNcp0fEu8GodroNDmJJw0QJj36764UfbA2RGuwWykMC2R2u/T75po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782343899; c=relaxed/simple;
	bh=jiOrXdon5g/rU7rbF+5Ggr/kLA1aPofe4bdnsgd4zTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N8aUPLuBQwMql9KU6xAh3FCg5LwEdVHUzvBjjRZ1NYTISXpiSpFSvC00brVMunJQhh+aBR2gviS9RmwxHpqGeY0iTnwSVI/+H+Dx3jC3r41J0UPhRe/M26luvhiv73jShko9D2n9PK8SgwEo+OlKESGuX29zmBLZXbrjNX3Kmqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Fo8teRTR; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Fo8teRTR"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id CA02440E01B4;
	Wed, 24 Jun 2026 23:31:34 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 3qS_fRzdgpKF; Wed, 24 Jun 2026 23:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1782343884; bh=m4fj/pi4s46T+SXRo/OZMuIN3lfYP9I/9GSF2pFU1oo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fo8teRTRLxmZprhhaKsbYrVrB4K/9T2g9YYa4BDFg9GJOIml7rzAoCpcc8XW0NUQ1
	 w5ixGR2FsS4IqeNlIblAjS6PHZOs9JnXMsto8FPRJiAfaqEI0uQ6thpl06Sb8i16rY
	 M8UaU+ov/ZagMSdGG9Xhte1U90r7vaWTLomKqIm9GYflWRe0TQ87RlvhBauQkTdLn4
	 NhcNt7No7lRUWRHfV10HhFgDybtoxT+hbS5B+jMUaW7RDLuyTKbruJ1lke0GVFGJH/
	 EgBI90pIuzv+pK/afQVeb2gzJ5ajUHkH1oQKJNwQE05PzrJxV7uDy6IK2Ge/bk2SVj
	 vMkUFZUL4xOsdO6In3oqVi+p91DxGZDFy29EMDujXANdmixgBqw3wZI4tG0wGu6PCE
	 0sK+IwvVV5Fo7h+wWGhZ23JzpyvI2vFzB4MS6hMidDqy44hSD2qSKQbNgfikNSmH2r
	 abCbwv9TkclUyjtPOgHxWoeciygS3/wjhJo021ux2KUYXyTKtCdAjhA4byhNhWjF7h
	 vzFUTcljcz0l51Uyo18CddPvx3Fj9cAPVMWK2E+X1+ypioorXM3KvIpLKI14umFR/N
	 1U2Dpq7ASUQx9+5lIBE3ZeHzlKV7YIrgL9xueDNkq7EDREU6zymYN7zYQrLGzRXtfV
	 xQ2amZzCcGFn89CmYdTmfkg0=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 5832A40E0140;
	Wed, 24 Jun 2026 23:31:10 +0000 (UTC)
Date: Wed, 24 Jun 2026 16:31:06 -0700
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
Subject: Re: [PATCH v7 020/120] x86/cpuid: Parse Transmeta and Centaur
 extended ranges
Message-ID: <20260624233106.GBajxoupFGt0f8Mtxb@fat_crate.local>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-21-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260528153923.403473-21-darwi@linutronix.de>

On Thu, May 28, 2026 at 05:37:42PM +0200, Ahmed S. Darwish wrote:
> Parse the Transmeta extended CPUID(0x80860000)->CPUID(0x80860006) range.
> 
> Reuse the CPUID(0x80000000) read function and its safety guards against
> CPUs repeating the output of the highest standard CPUID leaf.  Transmeta's
> code at early_init_transmeta() already carries a similar guard.
> 
> Parse Centaur/Zhaoxin extended CPUID(0xc0000000) and CPUID(0xc0000001).
> 
> Add x86 vendor tags for the Transmeta and Centaur/Zhaoxin CPUID leaves so
> that they are not parsed on other vendors.
> 
> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
> ---
>  arch/x86/include/asm/cpuid/types.h | 13 ++++++++
>  arch/x86/kernel/cpu/cpuid_parser.c | 48 +++++++++++++++++++-----------
>  arch/x86/kernel/cpu/cpuid_parser.h | 18 +++++++++++
>  3 files changed, 61 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/x86/include/asm/cpuid/types.h b/arch/x86/include/asm/cpuid/types.h
> index 2939ad095f6c..8cc9f81e9526 100644
> --- a/arch/x86/include/asm/cpuid/types.h
> +++ b/arch/x86/include/asm/cpuid/types.h
> @@ -37,9 +37,13 @@ enum cpuid_regs_idx {
>  
>  #define CPUID_BASE_START	0x00000000
>  #define CPUID_EXT_START		0x80000000
> +#define CPUID_TMX_START		0x80860000
> +#define CPUID_CTR_START		0xc0000000

Those are weird abbreviations. What's wrong with

CPUID_TRANSMETA_START and CPUID_CENTAUR_START

?
>  
>  #define CPUID_BASE_END		CPUID_RANGE_MAX(CPUID_BASE_START)
>  #define CPUID_EXT_END		CPUID_RANGE_MAX(CPUID_EXT_START)
> +#define CPUID_TMX_END		CPUID_RANGE_MAX(CPUID_TMX_START)
> +#define CPUID_CTR_END		CPUID_RANGE_MAX(CPUID_CTR_START)
>  
>  /*
>   * Types for CPUID(0x2) parsing:
> @@ -211,6 +215,15 @@ struct cpuid_leaves {
>  	CPUID_LEAF   (  0x80000002,	0  );
>  	CPUID_LEAF   (  0x80000003,	0  );
>  	CPUID_LEAF   (  0x80000004,	0  );
> +	CPUID_LEAF   (  0x80860000,	0  );
> +	CPUID_LEAF   (  0x80860001,	0  );
> +	CPUID_LEAF   (  0x80860002,	0  );
> +	CPUID_LEAF   (  0x80860003,	0  );
> +	CPUID_LEAF   (  0x80860004,	0  );
> +	CPUID_LEAF   (  0x80860005,	0  );
> +	CPUID_LEAF   (  0x80860006,	0  );
> +	CPUID_LEAF   (  0xc0000000,	0  );
> +	CPUID_LEAF   (  0xc0000001,	0  );

This parser thing has so many macros but here we need to specify each leaf
one-by-one explicitly? Not by doing

	CPUID_LEAFS_RANGE(0x80860000, 0x80860006);

for example?

>  };
>  
>  /*
> diff --git a/arch/x86/kernel/cpu/cpuid_parser.c b/arch/x86/kernel/cpu/cpuid_parser.c
> index ab736f03051e..a7e6692f767b 100644
> --- a/arch/x86/kernel/cpu/cpuid_parser.c
> +++ b/arch/x86/kernel/cpu/cpuid_parser.c
> @@ -42,24 +42,30 @@ cpuid_read_generic(const struct cpuid_parse_entry *e, const struct cpuid_read_ou
>  		cpuid_read_subleaf(e->leaf, e->subleaf + i, regs);
>  }
>  
> -static void
> -cpuid_read_0x80000000(const struct cpuid_parse_entry *e, const struct cpuid_read_output *output)

This function should not even be added in an earlier patch to be removed here
but...

> -{
> -	struct leaf_0x80000000_0 *el0 = (struct leaf_0x80000000_0 *)output->regs;
> -
> -	cpuid_read_subleaf(e->leaf, e->subleaf, el0);
> -
> -	/*
> -	 * Protect against Intel 32-bit CPUs lacking an extended CPUID range.  A
> -	 * CPUID(0x80000000) query on such machines will repeat the output of the
> -	 * highest standard CPUID leaf instead.
> -	 */
> -	if (CPUID_RANGE(el0->max_ext_leaf) != CPUID_EXT_START)
> -		return;
> -
> -	output->info->nr_entries = 1;
> +/*
> + * Define an extended range CPUID read function
> + *
> + * Guard against CPUs lacking the passed range leaf; e.g. Intel 32-bit CPUs lacking
> + * CPUID(0x80000000).  A query on such machines will just repeat the output of the
> + * highest standard CPUID leaf.
> + */
> +#define define_cpuid_range_read_function(_range, _name)					\
> +static void											\
> +cpuid_read_##_range(const struct cpuid_parse_entry *e, const struct cpuid_read_output *output)	\
> +{												\
> +	struct leaf_##_range##_0 *l = (struct leaf_##_range##_0 *)output->regs;			\
> +												\
> +	cpuid_read_subleaf(e->leaf, e->subleaf, l);						\
> +	if (CPUID_RANGE(l->max_##_name##_leaf) != _range)					\
> +		return;										\
> +												\
> +	output->info->nr_entries = 1;								\
>  }
>  
> +define_cpuid_range_read_function(0x80000000, ext);

... using this from the get-go.

> +define_cpuid_range_read_function(0x80860000, tra);
> +define_cpuid_range_read_function(0xc0000000, cntr);

Please use proper full names - not this abbreviated stuff.

> +
>  /*
>   * CPUID parser tables:
>   *
> @@ -115,10 +121,14 @@ static unsigned int cpuid_range_max_leaf(const struct cpuid_table *t, unsigned i
>  {
>  	const struct leaf_0x0_0 *l0 = __cpuid_table_subleaf(t, 0x0, 0);
>  	const struct leaf_0x80000000_0 *el0 = __cpuid_table_subleaf(t, 0x80000000, 0);
> +	const struct leaf_0x80860000_0 *tl0 = __cpuid_table_subleaf(t, 0x80860000, 0);
> +	const struct leaf_0xc0000000_0 *cl0 = __cpuid_table_subleaf(t, 0xc0000000, 0);
>  
>  	switch (range) {
> -	case CPUID_BASE_START:	return l0  ?  l0->max_std_leaf : 0;
> -	case CPUID_EXT_START:	return el0 ? el0->max_ext_leaf : 0;
> +	case CPUID_BASE_START:	return l0  ?  l0->max_std_leaf  : 0;
> +	case CPUID_EXT_START:	return el0 ? el0->max_ext_leaf  : 0;
> +	case CPUID_TMX_START:	return tl0 ? tl0->max_tra_leaf  : 0;
> +	case CPUID_CTR_START:	return cl0 ? cl0->max_cntr_leaf : 0;
>  	default:		return 0;
>  	}
>  }
> @@ -180,6 +190,8 @@ cpuid_fill_table(struct cpuid_table *t, const struct cpuid_parse_entry entries[]
>  	} ranges[] = {
>  		{ CPUID_BASE_START, CPUID_BASE_END },
>  		{ CPUID_EXT_START,  CPUID_EXT_END  },
> +		{ CPUID_TMX_START,  CPUID_TMX_END  },
> +		{ CPUID_CTR_START,  CPUID_CTR_END  },
>  	};
>  
>  	for (unsigned int i = 0; i < ARRAY_SIZE(ranges); i++)
> diff --git a/arch/x86/kernel/cpu/cpuid_parser.h b/arch/x86/kernel/cpu/cpuid_parser.h
> index ee1958f3d369..76a87a71b430 100644
> --- a/arch/x86/kernel/cpu/cpuid_parser.h
> +++ b/arch/x86/kernel/cpu/cpuid_parser.h
> @@ -149,6 +149,15 @@ struct cpuid_parse_entry {
>  	CPUID_PARSE_ENTRY   (	0x80000002,	0,		generic			),	\
>  	CPUID_PARSE_ENTRY   (	0x80000003,	0,		generic			),	\
>  	CPUID_PARSE_ENTRY   (	0x80000004,	0,		generic			),	\
> +	CPUID_PARSE_ENTRY   (	0x80860000,	0,		0x80860000		),	\
> +	CPUID_PARSE_ENTRY   (	0x80860001,	0,		generic			),	\
> +	CPUID_PARSE_ENTRY   (	0x80860002,	0,		generic			),	\
> +	CPUID_PARSE_ENTRY   (	0x80860003,	0,		generic			),	\
> +	CPUID_PARSE_ENTRY   (	0x80860004,	0,		generic			),	\
> +	CPUID_PARSE_ENTRY   (	0x80860005,	0,		generic			),	\
> +	CPUID_PARSE_ENTRY   (	0x80860006,	0,		generic			),	\
> +	CPUID_PARSE_ENTRY   (	0xc0000000,	0,		0xc0000000		),	\
> +	CPUID_PARSE_ENTRY   (	0xc0000001,	0,		generic			),	\

A range macro here too pls.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
