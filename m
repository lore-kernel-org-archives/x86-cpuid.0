Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2474627FD45
	for <x86-cpuid@lists.linux.dev>; Fri, 16 Jan 2026 20:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768595520; cv=none; b=PPS72elaE89m5c9vwmUeND91vOyQorXB4RaUWZ3BPNXwHs00BrKnUKvOjMwc6x8LxtutdRWAYKvwYolKKQ6v5BSKEGJpaa1GfhfUNpyy1bZy1ZcENXWgUqJW+WJmyKo45TqMMVcj2hGaS7vMwxcuqjGIev0fd0bFJjXLWPLQD2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768595520; c=relaxed/simple;
	bh=tlqJY4NeXWN1jTLerJ24MOLLQXdPw0h7wqDSZzHHrVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r9wFVMaBqUtc9yQ+V1T49g5Wjv9FbK8yTlPEa5MhBuvQdvX+T0klJE4YAX/jiMVMQ3VoszNWhfkaChzFvbJct7tTSEJP00WYhTjU1VRFNqphFS73ICS44SOQ+vqfy1c5P5XbXCOYOG8nf9TfH87rNr5Z3XS9ComGWjbKsP1B37c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=fail (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Tw82nvk+ reason="signature verification failed"; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Tw82nvk+"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id E72C840E00DE;
	Fri, 16 Jan 2026 20:31:46 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id oDX5TJuRDCCK; Fri, 16 Jan 2026 20:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1768595499; bh=4Yc7aAAXK4RHmuf98orDYCTmtNR4QqCqHDi/YDZjAhM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tw82nvk+DpjEr6Iv7QvdnUEW2J05VTKB5BRRtg3Y6Fd0IqEQS1Dnm+Cl747mt/k1l
	 TX2Z3Akx6vnBWyQLnHYMNeuS3pKc6KuTalCW4kKo5HnIkbbNbxhCUKlXbOyiHY7CTk
	 p9b1qAK4x0jlV8MOGGugDYM/OHqYAHyT9teK+Cta3kqlKiQ9a7jfDbgUt39TOSJ5K3
	 UnS5KbtT7iqJQKjT4e4Xt+E4iVqBRWVNjKJa48UdwRb/Ry8KURbJVl0Lxkx+8K8xa5
	 bfZee+osL2djKCEuC978xf83S8h0SviwCjZ8jZQgoHxo8e97YrU8qSP0mlHQI3E/wJ
	 vou/mav4KWyiz9k7b/CcsYPLhy3CVA1CC1WpVfWscT1aiRtGfAGdgkK4C1j8TMWuq8
	 lXBmGHiDnlhNT6IOqcq3sOrT7vtB9m2hD8j8tNLEvZ1M+IaE4l+AWIsLOaOas8ZAEU
	 4QzB/Ts6+FjuQfxDQNX8Zsq3Q7fonixaxeeupUMRzBMkf68ZhZ2zrWS5RL3uVfcMYZ
	 HIkgSy0LYH8D36BY2LZDuCyKpqUcMKh3jAlWK4tQZZYutkkC7By1s+pTixblpDC90T
	 B9JCI+IABhqpk84guWjU0/EqPkHDf7T4g475RNlo2Xm61g9fsYxL0xhBdP59yYmkXZ
	 5zGNXVSF2rbrMISlezpe9AVY=
Received: from zn.tnic (pd953023b.dip0.t-ipconnect.de [217.83.2.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 0DD5640E0252;
	Fri, 16 Jan 2026 20:31:25 +0000 (UTC)
Date: Fri, 16 Jan 2026 21:31:17 +0100
From: Borislav Petkov <bp@alien8.de>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Sean Christopherson <seanjc@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 07/35] x86: Introduce a centralized CPUID data model
Message-ID: <20260116203117.GAaWqgFYTv1bHLxKV_@fat_crate.local>
References: <20250905121515.192792-1-darwi@linutronix.de>
 <20250905121515.192792-8-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250905121515.192792-8-darwi@linutronix.de>
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 05, 2025 at 02:14:47PM +0200, Ahmed S. Darwish wrote:
>     const struct leaf_0x4_n *l4_0, *l4_1, l4_2;
>=20
>     l4_0 =3D cpuid_subleaf_n(c, 0x4, 0);
>                            |   |   =E2=94=94=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
>                            |   =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90    |
>                            *             *    v
>                           &c.cpuid.leaf_0x4_n[0]
>=20
>     l4_1 =3D cpuid_subleaf_n(c, 0x4, 1);
>                            |   |   =E2=94=94=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
>                            |   =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90    |
>                            *             *    v
>                           &c.cpuid.leaf_0x4_n[1]
>=20
>     l4_2 =3D cpuid_subleaf_n(c, 0x4, 2);
>                            |   |   =E2=94=94=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
>                            |   =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90    |
>                            *             *    v
>                           &c.cpuid.leaf_0x4_n[2]
>=20
> where dynamic leaf types are marked by their "_n" suffix and the indice=
s

Why isn't the suffix "_dyn" for dynamic leaf types? Then it'll be right t=
here
in the name what it is...

Btw, why are we calling them dynamic?

This is confusing. Those leafs simply have multiple subleafs specified in=
 ECX.
Let's please not invent our own things here but simply stick to the
nomenclature in the vendor docs.

This is a very simple explanation IMO:

"The information is accessed by (1) selecting the CPUID function setting =
EAX
and optionally ECX for some functions,"

and there's no talk about dynamic and whatnot.

> 0, 1, 2 above can be passed dynamically.  This is by design: hierarchic=
al
> CPUID enumeration usually passes the CPUID subleaf dynamically; e.g.,
> within a for loop.
>=20
> For each of the CPUID leaf/subleaf output storage entries, attach a
> 'struct leaf_query_info' instance.  It is to be set by the CPUID parser
> while filling the CPUID tables.  For now, this info structure has one
> element: the number of filled slots at the respective output storage
> array.
>=20
> ** Call-site APIs
>=20
> Introduce below APIs for CPUID leaves with static subleaves:
>=20
>     cpuid_leaf(_cpuinfo, _leaf)
>     cpuid_leaf_raw(_cpuinfo, _leaf)
>     cpuid_subleaf(_cpuinfo, _leaf, _subleaf)
>=20
> and below APIs for CPUID leaves with dynamic subleaves:
>=20
>     cpuid_subleaf_n(_cpuinfo, _leaf, _idx)
>     cpuid_subleaf_n_raw(_cpuinfo, _leaf, _idx)
>     cpuid_subleaf_count(_cpuinfo, _leaf)
>
> At <asm/cpuid/api.h>, add a clear rationale for why call sites should u=
se
> the above APIs instead of directly invoking CPUID queries.

I appreciate the long and detailed explanation but pls refrain from expla=
ining
the patch. Explaining the "why" is perfectly fine.

> ** Next steps
>=20
> For now, define entries for CPUID(0x0) and CPUID(0x1) in the CPUID tabl=
e.
>=20
> Generic CPUID parser logic to fill the CPUID tables, along with more
> CPUID leaves support, will be added next.
>=20
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>	# CPUID data model
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>	# x86-cpuid-db =
schema
> Suggested-by: Borislav Petkov <bp@alien8.de>		# Early CPUID centralizat=
ion drafts
> Suggested-by: Ingo Molnar <mingo@kernel.org>		# CPUID APIs restructurin=
g
> Suggested-by: Sean Christopherson <seanjc@google.com>	# Dynamic leaves =
CPUID API
> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
> Link: https://lore.kernel.org/lkml/874ixernra.ffs@tglx
> Link: https://gitlab.com/x86-cpuid.org/x86-cpuid-db
> Link: https://lore.kernel.org/lkml/aBnSgu_JyEi8fvog@gmail.com
> Link: https://lore.kernel.org/lkml/aJ9TbaNMgaplKSbH@google.com
> ---
>  arch/x86/include/asm/cpuid/api.h   | 273 +++++++++++++++++++++++++++++
>  arch/x86/include/asm/cpuid/types.h | 125 +++++++++++++
>  arch/x86/include/asm/processor.h   |   2 +
>  3 files changed, 400 insertions(+)
>=20
> diff --git a/arch/x86/include/asm/cpuid/api.h b/arch/x86/include/asm/cp=
uid/api.h
> index 2b9750cc8a75..dbe94c8c4900 100644
> --- a/arch/x86/include/asm/cpuid/api.h
> +++ b/arch/x86/include/asm/cpuid/api.h
> @@ -289,4 +289,277 @@ static inline bool cpuid_amd_hygon_has_l3_cache(v=
oid)
>  	return cpuid_edx(0x80000006);
>  }
> =20
> +/*
> + * 'struct cpuid_leaves' accessors (without sanity checks):
> + *
> + * For internal use by the CPUID parser.
> + */
> +
> +/*
> + * Return constified pointers for all call-site APIs
> + */
> +#define __const_ptr(_ptr)							\
> +	((const __typeof__(*(_ptr)) *)(_ptr))
> +
> +/*
> + * __cpuid_leaves_subleaf() - Get parsed CPUID output (without sanity =
checks)

Above says already "without sanity checks".

> + * @_leaves:	&struct cpuid_leaves instance
> + * @_leaf:	CPUID leaf, in compile-time 0xN format
> + * @_subleaf:	CPUID subleaf, in compile-time decimal format
> + */
> +#define __cpuid_leaves_subleaf(_leaves, _leaf, _subleaf)			\
> +	__const_ptr(&((_leaves)->leaf_ ## _leaf ## _ ## _subleaf)[0])
> +
> +/*
> + * __cpuid_leaves_subleaf_n() - Get parsed CPUID output for dynamic su=
bleaf (without checks)

Ditto.

> + * @_leaves:	&struct cpuid_leaves instance
> + * @_leaf:	CPUID leaf, in compile-time 0xN format
> + * @_index:	Index within the dynamic subleaf storage array
> + */
> +#define __cpuid_leaves_subleaf_n(_leaves, _leaf, _index)			\
> +	__const_ptr(&((_leaves)->leaf_ ## _leaf ## _ ## n)[_index])
> +
> +/*
> + * __cpuid_leaves_subleaf_info() - Get CPUID query info for @_leaf/@_s=
ubleaf
> + * @_leaves:	&struct cpuid_leaves instance
> + * @_leaf:	CPUID leaf, in compile-time 0xN format
> + * @_subleaf:	CPUID subleaf, in compile-time decimal format, or just '=
n' for
> + *		leaves with a dynamic subleaf range.
> + */
> +#define __cpuid_leaves_subleaf_info(_leaves, _leaf, _subleaf)			\
> +	__const_ptr(&((_leaves)->leaf_ ## _leaf ## _ ## _subleaf ## _ ## info=
))
> +
> +/*
> + * 'struct cpuid_table' accessors (with sanity checks):
> + *
> + * For internal use by the CPUID parser.
> + */
> +
> +#define __cpuid_table_nr_filled_subleaves(_table, _leaf, _subleaf)				=
\
> +	__cpuid_leaves_subleaf_info(&((_table)->leaves), _leaf, _subleaf)->nr=
_entries
> +
> +#define __cpuid_table_dynamic_subleaf_storage(_table, _leaf)					\

That "storage" thing reads weird. We usually call those "size".

> +	ARRAY_SIZE((_table)->leaves.leaf_ ## _leaf ## _n)
> +
> +#define __cpuid_table_invalid_dynamic_subleaf(_table, _leaf, _subleaf)=
				\
> +	(((_subleaf) < (__cpuid_leaf_first_dynamic_subleaf(_leaf))) ||				\
> +	 ((_subleaf) > (__cpuid_leaf_first_dynamic_subleaf(_leaf) +				\
> +			__cpuid_table_dynamic_subleaf_storage(_table, _leaf) - 1)))

...

> +/**
> + * cpuid_subleaf() - Access parsed CPUID
> + * @_cpuinfo:	CPU capability structure reference ('struct cpuinfo_x86'=
)
> + * @_leaf:	CPUID leaf, in compile-time 0xN format; e.g. 0x7, 0xf
> + * @_subleaf:	CPUID subleaf, in compile-time decimal format; e.g. 0, 1=
, 3

"compile-time" ... format?

> + *
> + * Returns a pointer to parsed CPUID output, from the CPUID table insi=
de
> + * @_cpuinfo, as a <cpuid/leaf_types.h> data type: 'struct leaf_0xM_N'=
, where
> + * 0xM is the token provided at @_leaf, and N is the token provided at
> + * @_subleaf; e.g. struct leaf_0x7_0.
> + *
> + * Returns NULL if the requested CPUID @_leaf/@_subleaf query output i=
s not
> + * present at the parsed CPUID table inside @_cpuinfo.  This can happe=
n if:
> + *
> + * - The CPUID table inside @_cpuinfo has not yet been populated.
> + * - The CPUID table inside @_cpuinfo was populated, but the CPU does =
not
> + *   implement the requested CPUID @_leaf/@_subleaf combination.
> + * - The CPUID table inside @_cpuinfo was populated, but the kernel's =
CPUID
> + *   parser has predetermined that the requested CPUID @_leaf/@_sublea=
f

"determined" is just fine.

> + *   hardware output is invalid or unsupported.
> + *
> + * Example usage::
> + *
> + *	const struct leaf_0x7_0 *l7_0 =3D cpuid_subleaf(c, 0x7, 0);
> + *	if (!l7_0) {
> + *		// Handle error
> + *	}
> + *
> + *	const struct leaf_0x7_1 *l7_1 =3D cpuid_subleaf(c, 0x7, 1);
> + *	if (!l7_1) {
> + *		// Handle error
> + *	}

Good.

> + */
> +#define cpuid_subleaf(_cpuinfo, _leaf, _subleaf)				\
> +	__cpuid_table_subleaf(&(_cpuinfo)->cpuid, _leaf, _subleaf)		\
> +

...

> +/*
> + * Types for centralized CPUID tables:
> + *
> + * For internal use by the CPUID parser.
> + */
> +
> +/**
> + * struct leaf_query_info - Parse info for a CPUID leaf/subleaf query

Why not simply "leaf_info"? "query" is superfluous here.

> + * @nr_entries:	Number of valid output storage entries filled by the C=
PUID parser
> + *
> + * In a CPUID table (struct cpuid_leaves), each CPUID leaf/subleaf que=
ry output
> + * storage entry from <cpuid/leaf_types.h> is paired with a unique ins=
tance of

Oh boy, a "CPUID leaf query output storage entry".

Or simply a CPUID leaf. No?

Let's tone down on the unnecessary words in that whole area pls. Let's ke=
ep it
simple first and then we'll make it more complicated when needed.

> + * this type.
> + */
> +struct leaf_query_info {
> +	unsigned int		nr_entries;
> +};
> +
> +/**
> + * __CPUID_LEAF() - Define a CPUID output storage and query info entry
> + * @_name:	Struct type name of the CPUID leaf/subleaf (e.g. 'leaf_0x7_=
0'). Such
> + *		types are defined at <cpuid/leaf_types.h> and follow the leaf_0xM_=
N
> + *		format, where 0xM is the leaf and N is the subleaf.  If N is 'n' i=
nstead
> + *		of a decimal literal, then this storage entry is for a "dynamic" l=
eaf.
> + * @_count:	Number of storage entries to allocate for this leaf/sublea=
f.  Static
> + *		leaves need only one entry, while dynamic leaves require more.

This is where the problem lies: you're calling static leaves those which =
have
one subleaf and dynamic those which have multiple.

But if one "static" leaf starts adding subleafs, the "static" one becomes
"dynamic". And that's confusing. Nothing dynamic about it. You simply hav=
e
CPUID leafs with 1 or more subleafs. And that should be the nomenclature =
we
use.

Thx.

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
