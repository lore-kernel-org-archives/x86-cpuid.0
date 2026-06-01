Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402213672A1
	for <x86-cpuid@lists.linux.dev>; Mon,  1 Jun 2026 19:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780343669; cv=none; b=tz8OslSdVxBCNXsMFvT03Bpw/LCPe4HG2eonV1gCJlPVV1nCbVvFASsKZfnLq9v0wPXpolJkC9iYgCOtrO15NxVaSMCBPVpXPF6GrIQowTJno0QoMxALpzMF7VOTt5eteSyymdxRM6qsUXOUF7zH7yJQHKYF69xfamH3ul9hgLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780343669; c=relaxed/simple;
	bh=OlRjGBhCkHnaa3bOuPZMcrrukOQF5mlAqjNeRaUuu7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nVmVg6j9/hBOJn+TwyHADZ3hH4YBtLjI79qHsyL1jKoRyIT1CQcpTXPQdyjJPQDfpfdFOV0pGOSoU/GMwLTnrt6Ppzo813jq33kuKUwdaqMRby6dNKTFHpPUdvLTSxzKvcRVkdbWlOPHMs7BpR4xIZshlCgoG3gULYETTNep4mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Yh0f3n0R; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TmrFcdzU; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Yh0f3n0R";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TmrFcdzU"
Date: Mon, 1 Jun 2026 21:54:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780343665;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZHZ75L968vwmHXWQR/3+oATzt4bqOz5YEAB866cLkxw=;
	b=Yh0f3n0RCXiakpbuCZwx4qaFXVOja7/LsdQJG51k9c49GVyHxH1zQyQLOUEiW0fpOaTFvc
	fZixI5zX0DHvxfDKekqt3+/3R3TDm8xtpInuB8q8bK9P4h1mQvQxrDPj9QRV0VnEV35I8J
	TsMgFFIuP/pbduMmzXaPShFfF0EPUlQ8dMkujZ8gNvufU78BX/8fjeUC6xQXvdMe+AT0P5
	WrS7mu2GshsOvhjCIkwYbKKAYaDoXzBRWfLA+98xRwO2GwSx1YM++BfsurIwSfBicFhYXb
	MwM0oCAlll+E5IkKY4+RUrHaZNDGgvm8tIsTPK1yg+UcDBpnScrKEIrJdQwJCg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780343665;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZHZ75L968vwmHXWQR/3+oATzt4bqOz5YEAB866cLkxw=;
	b=TmrFcdzUD4/upaEcPwAx8bdhFwBO2EquYTg/rTjF5N4POx+ewLmYr8wiJe6EftozXM/6DQ
	oCblnaBn7rS4JgDw==
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
Subject: Re: [PATCH v7 009/120] x86/cpu: Use parsed CPUID(0x0)
Message-ID: <ah3jbw-_Yhol2y1P@lx-t490>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-10-darwi@linutronix.de>
 <20260530022945.GAahpLmX47wsYUs4QH@fat_crate.local>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260530022945.GAahpLmX47wsYUs4QH@fat_crate.local>

On Fri, 29 May 2026, Borislav Petkov wrote:
>
> On Thu, May 28, 2026 at 05:37:31PM +0200, Ahmed S. Darwish wrote:
> >
> > diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
> > index 5cae6c48dd25..281dc591ea79 100644
> > --- a/arch/x86/kernel/cpu/common.c
> > +++ b/arch/x86/kernel/cpu/common.c
> > @@ -942,11 +942,15 @@ void get_cpu_vendor(struct cpuinfo_x86 *c)
> >
> >  void cpu_detect(struct cpuinfo_x86 *c)
> >  {
> > -	/* Get vendor name */
> > -	cpuid(0x00000000, (unsigned int *)&c->cpuid_level,
> > -	      (unsigned int *)&c->x86_vendor_id[0],
> > -	      (unsigned int *)&c->x86_vendor_id[8],
> > -	      (unsigned int *)&c->x86_vendor_id[4]);
> > +	const struct leaf_0x0_0 *l0 = cpuid_leaf(c, 0x0);
> > +
> > +	if (!l0)
> > +		return;
>
> What for?
>

I'll remove it.
