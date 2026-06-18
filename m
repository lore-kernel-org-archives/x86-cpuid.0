Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30D42D0603
	for <x86-cpuid@lists.linux.dev>; Thu, 18 Jun 2026 19:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781811415; cv=none; b=KYxTbHGoKF53t5e510H+/4uokqGXgakIDLEW+Eb5D3dLBhaB6b9y3qL0jkjKXdDgBNwOshqYo33gnqCvgkf+inh5PJcy4EJEuVPlv3AhHUJ8AKoi9E2fT0kPDnMr/c03vEXyF6Nbuo3wYSsXzyW2Sqbb1Rn1JEYxXwTNR2IEiqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781811415; c=relaxed/simple;
	bh=DaoTBCdVRq918MvCuv5bf9Sx8atwY0SQJ+Ml+0ZUGfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rko0jCkOWCCddsBp46Mi2mzg5MJfTskh8wMIt2kGWJAiC1Rsj/vdHC214D/c+3Th+bdExG7/BIlb//PHgLhra1jWODDvGQMejPt1K7bMJm8UzJ9mS6rTM/1enmmsUEDbu7nVBFfK+jZXdXgjSitpJFKkOiK99TzeoXJ+uMbhaEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3k4u4E9m; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=37F2AjWz; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3k4u4E9m";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="37F2AjWz"
Date: Thu, 18 Jun 2026 21:36:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781811412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w9nJaLXTvv6/oXz4LA/Um/N7sL7vROso3LZSFmPkPEU=;
	b=3k4u4E9m31pCgk36Czv++8QysHqfe6ETpwOn8REQGl5taL3DO++RgGqnox6/dM+DUrmB2E
	F/z5GsV0qGZ6eSpaunSOP39W8tu+E09aqaNNEYzVxTBMIqo1gSMWyIf5ZsQ4F4u/O4vSGO
	+92UnT0JJxqf15heQgzQ2wfBbVl3oCJAi+g2/yF+LNPv/8xJeLqXHmurP4ILrDCMbh7MEf
	l9jBAhRQqGnO9BuSaEkeiAvuyyXl+6oivGW5UchJk3gcGhIWCrYqpaMtDSqbjalOCeZhka
	SK32OstIO2Zzy8ACIZ9SEBOLG6pa2h9MGQwAIg79RW4KUQa2TAtlQAt85B0hPw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781811412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w9nJaLXTvv6/oXz4LA/Um/N7sL7vROso3LZSFmPkPEU=;
	b=37F2AjWz46hoThyWi0iJnBZZTROY6zJo+tz/buM6fDfi6iL3xW+TsWxEnZWGuf6SIG7BBI
	sU6c0zKKMHrojJBQ==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Borislav Petkov <bp@alien8.de>
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
Message-ID: <ajRI0lYAA9_rf51l@lx-t490>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-19-darwi@linutronix.de>
 <20260618185231.GCajQ-b8VSy19-y6xZ@fat_crate.local>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618185231.GCajQ-b8VSy19-y6xZ@fat_crate.local>

On Thu, 18 Jun 2026, Borislav Petkov wrote:
>
> On Thu, May 28, 2026 at 05:37:40PM +0200, Ahmed S. Darwish wrote:
> > diff --git a/arch/x86/kernel/cpu/cpuid_parser.h b/arch/x86/kernel/cpu/cpuid_parser.h
> > index 8b0d44b745c5..ee1958f3d369 100644
> > --- a/arch/x86/kernel/cpu/cpuid_parser.h
> > +++ b/arch/x86/kernel/cpu/cpuid_parser.h
> > @@ -144,6 +144,7 @@ struct cpuid_parse_entry {
> >   */
> >  #define CPUID_COMMON_ENTRIES									\
> >  	/*			Leaf		Subleaf		Reader function */		\
> > +	CPUID_PARSE_ENTRY   (	0x16,		0,		generic			),	\
> >  	CPUID_PARSE_ENTRY   (	0x80000000,	0,		0x80000000		),	\
> >  	CPUID_PARSE_ENTRY   (	0x80000002,	0,		generic			),	\
> >  	CPUID_PARSE_ENTRY   (	0x80000003,	0,		generic			),	\
> > @@ -180,5 +181,6 @@ struct cpuid_vendor_entry {
> >
> >  #define CPUID_VENDOR_ENTRIES								\
> >  	/*		   Leaf		Vendor list		    */			\
> > +	CPUID_VENDOR_ENTRY(0x16,	X86_VENDOR_INTEL),				\
> >
>
> If this leaf is Intel-specific, why is it being added to the common entries
> too?

CPUID leaf parsing entries are split into:

  CPUID_EARLY_ENTRIES
  CPUID_COMMON_ENTRIES

CPUID_VENDOR_ENTRIES is not a parser entries table.  It just attaches
vendor tags to a leaf if/when a leaf needs it.

The confusion stems from naming the vendor tags table with an _ENTRIES
suffix, just like EARLY and COMMON.

I'll find a better name for it.  I guess CPUID_VENDOR_TAGS should work.

>
>  * For vendor-specific leaves, a matching entry must be added to the CPUID leaf
>  * vendor table later defined.  Leaves which are here, but without a matching
>  * vendor entry, are treated by the CPUID parser as valid for all x86 vendors.
>
> Why?
>
>
> I guess it has to do with that vendor parsing in 016 but parsing things twice
> better have a very good justification.
>

If a CPUID leaf parser entry has no vendor tag, then it's parsed for all
x86 vendors.

There's no parsing things twice here.  Sorry, I guess it just that way
because of the CPUID_VENDOR_ENTRIES name misnormer.

Thanks!
Ahmed
