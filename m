Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE72C36F8E6
	for <x86-cpuid@lists.linux.dev>; Mon,  1 Jun 2026 19:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780343964; cv=none; b=fqPNNGUFHa/0U1cX19mwWqzcWnmYBx37AEkhn2dDqWB4539Ox+X9tOoNsm2oM0vmNZhTnd97WMTnMh0e5PyU9zQLcPzFPRBemmWK0Dk+gHWi3FCG6+XRzDJ44UC3Mmv1zwZDgZuFkIRAuE5n0kNGU+KcyBHFVcOa65vpDgolmqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780343964; c=relaxed/simple;
	bh=+dIWc/nGB+pM4oBk3B7+6mthnkGb2oiKUD5MtFrZMDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=npIiUEGi7LJfS29+Mq8qGlWd4Lf4/B1EBH+F4Y1F8KC8A1Ta3Osm4+SfPmu+i8FOCC8PGo8bEy/02FLkEwfqeTX+J7x7GKkb2LZfkrRifhIxhnwKmEnIcRoYzMB6LTxCtCPcA7O/WruE73/JgnjMcLKTjlLR5JUJKMie8Nk19UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3BIlRRJJ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=47mumqLy; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3BIlRRJJ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="47mumqLy"
Date: Mon, 1 Jun 2026 21:59:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780343961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eP6gCB1aNJfGO9NU+KXXsfy+4pDoKjjix6tUuziqk0Q=;
	b=3BIlRRJJYq4i2rp0Bx5M/Ia4Wu4xNptVN2T2dJ6zI2SL4FP9h2QlKL3TaKY4OwfIAvaZrH
	9dopbuu+I8K7USoBIwnRyNupVIwSMv3CffM6TovX6z9m6tCy5AyVPwp6CQay4SLydIYLRL
	9LkxHqH6HfVfH4nz0SIZDF6c14/R3q/xtZKjWxdOdPYX7Zs3Waaxqe0AHL8cQeC5vlwVXa
	if0qmyGqu7Ztt0esjvFtXQrcYokiIZ1y8/4OD9ENyEqm4K0baMb/7cdwPuxKKAvY72k0gn
	4KyIV34Y0pZoft/bBa0rmTnzAQSxrPgFy5e0BwmqKJ0eM1x+7y6h3rjZ6lkoTg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780343961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eP6gCB1aNJfGO9NU+KXXsfy+4pDoKjjix6tUuziqk0Q=;
	b=47mumqLyX+4cu5B29Jw3/aiCJ0k02lpoMFkbRTDVTzHy37n7caXxW+VLBCb9592WR99n1p
	cPZMjWS8syjaKDAw==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Christian Ludloff <ludloff@gmail.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 034/120] x86/cacheinfo: Use parsed CPUID(0x8000001d)
Message-ID: <ah3kl0nX8Xx_IhkT@lx-t490>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-35-darwi@linutronix.de>
 <ah2Luj0Qk7WSpl04@wieczorr-mobl1.localdomain>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah2Luj0Qk7WSpl04@wieczorr-mobl1.localdomain>

On Mon, 01 Jun 2026, Maciej Wieczor-Retman wrote:
>
> On 2026-05-28 at 17:37:56 +0200, Ahmed S. Darwish wrote:
> >
> > -static int amd_fill_cpuid4_info(int index, struct _cpuid4_info *id4)
> > +static int amd_fill_cpuid4_info(struct cpuinfo_x86 *c, int index, struct _cpuid4_info *id4)
> >  {
> >  	union _cpuid4_leaf_eax eax;
> >  	union _cpuid4_leaf_ebx ebx;
> >  	union _cpuid4_leaf_ecx ecx;
> > -	u32 ignored;
> >
> > -	if (boot_cpu_has(X86_FEATURE_TOPOEXT) || boot_cpu_data.x86_vendor == X86_VENDOR_HYGON)
> > -		cpuid_count(0x8000001d, index, &eax.full, &ebx.full, &ecx.full, &ignored);
> > -	else
> > +	if (boot_cpu_has(X86_FEATURE_TOPOEXT) || boot_cpu_data.x86_vendor == X86_VENDOR_HYGON) {
> > +		const struct cpuid_regs *regs = cpuid_subleaf_n_raw(c, 0x8000001d, index);
> > +
> > +		if (!regs)
> > +			return -EIO;
> > +
> > +		eax.full = regs->eax;
> > +		ebx.full = regs->ebx;
> > +		ecx.full = regs->ecx;
> > +	} else
> > 		legacy_amd_cpuid4(index, &eax, &ebx, &ecx);
>
> This 'else' branch still needs the curly brackets per formatting standards.
>

ACK on this and all your other emails with stylistic remarks.
