Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AB1367F45
	for <x86-cpuid@lists.linux.dev>; Mon,  1 Jun 2026 19:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780343618; cv=none; b=OehdcW3s5THQd8zeBSMCZaW1M2YIqKWxiES/oyrKY13WJ9d6Gwi8TDH8a3EA6DNzYegeRbUSt8oKiWUt2lYUwER9AWIM+x7/7pb0yaC8FGY5PdUwnyawl7AVdW17nvMISR4ur68QC6NhOVCRJMHNVeidauD+UZuy5c4bZ0e1xrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780343618; c=relaxed/simple;
	bh=qtg1WgdbEKI88Br/K6kzqN+j9KQOj5rHDlqT3xGrrpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AD5M0KrTinhvwIcm1XWaykXmWG+xH6vKWS/HtWhj5ZZov0ZQIyQLT4bTjBEoWPLyWeCH5qlzDdVzWOkPoC6vGgN9FFN2mHBzOSMI4Cug6u4mMdWX7N3wGJUg8wwJ6DG5LhQ4Uchzy6jA8mgL6T9f7QAAuzIdPCBKNumm7qMCfZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=XMe6Q6th; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OenWLYzb; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="XMe6Q6th";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OenWLYzb"
Date: Mon, 1 Jun 2026 21:53:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780343615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ISQzEqQWr1TO+dfHFKEVYYfS0w5fy6OydY94m+L+wPs=;
	b=XMe6Q6thnAB2FHYGR6pba85rohMzmQEzPElq+PZiT2GuAPFaNkiHCfncat3PPYSKfM9YcX
	N8qewzccQ60wXAFavYqYY4rb7Ff5cNCLD7+yh3G1YgPuYaVPS2GjwTGudze2zYLe7yvZFh
	3VSoPV5TpcsJztPFdq91T2S25myCaGmkaItMinftgI4PgnK4lAd8e/UCvwVSg9HGD6+OoL
	gOiz0/+B34leO2UZxkJEVp1aBm3Jtut4+XqiizAxvsPOqpNibaUJ4tnz6S6dyJr4fjHODO
	1D79kbKJ7qZxXvYaAF2evitVEs16dAOTk7wnI7pHSX0RE6l+16tihbaLF2XyKA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780343615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ISQzEqQWr1TO+dfHFKEVYYfS0w5fy6OydY94m+L+wPs=;
	b=OenWLYzb7DVKQYFGKR61H0NiD6pidim4ZIF6kWM+zfqPxUoGPXUJizVXC6oBHSRzDDezox
	xgasM9ecnuI3ZCBA==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Borislav Petkov <bp@alien8.de>
Cc: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Christian Ludloff <ludloff@gmail.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 004/120] x86/cpuid: Introduce <asm/cpuid/leaf_types.h>
Message-ID: <ah3jPMYIxC1vsUUB@lx-t490>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-5-darwi@linutronix.de>
 <ah2WBnBkz8KQrph0@wieczorr-mobl1.localdomain>
 <20260601194150.GDah3gfjoIZIByCa3d@fat_crate.local>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601194150.GDah3gfjoIZIByCa3d@fat_crate.local>

On Mon, 01 Jun 2026, Borislav Petkov wrote:
>
> On Mon, Jun 01, 2026 at 04:30:01PM +0200, Maciej Wieczor-Retman wrote:
> > >
> > > +struct leaf_0x4c780002_0 {
> > > +	// eax
> > > +	u32	f00f				:  1, // Intel F00F
> > > +		fdiv				:  1, // FPU FDIV
> > > +		coma				:  1, // Cyrix 6x86 coma
> > > +		amd_tlb_mmatch			:  1, // AMD Erratum 383
> > > +		amd_apic_c1e			:  1, // AMD Erratum 400
> > > +		bug_11ap			:  1, // Bad local APIC aka 11AP
> > > +		fxsave_leak			:  1, // FXSAVE leaks FOP/FIP/FOP
> > > +		clflush_monitor			:  1, // AAI65, CLFLUSH required before MONITOR
> > > +		sysret_ss_attrs			:  1, // SYSRET does not fix up SS attributes
> > > +		espfix				:  1, // IRET to 16-bit SS corrupts ESP/RSP high bits (x86-32)
> > > +		null_seg			:  1, // Setting a selector to NULL preserves the base
> > > +		swapgs_fence			:  1, // SWAPGS without input dep on GS
> > > +		monitor				:  1, // IPI required to wake up remote CPU
> > > +		amd_e400			:  1, // CPU is among the affected by Erratum 400
> > > +		cpu_meltdown			:  1, // CPU affected by meltdown; needs kernel page table isolation
> > > +		spectre_v1			:  1, // CPU affected by Spectre variant 1 with conditional branches
> > > +		specture_v2			:  1, // CPU affected by Spectre variant 2 with indirect branches
> >
> > (line 1383, 'specture_v2' should be 'spectre_v2'?)
>
> Send a patch ontop please. We better fix this ASAP before it goes to Linus.
>

I'm doing another iteration of this PQ this week, along with a minor
x86-cpuid-db release to fix those couple of fields.

Thanks,
Ahmed
