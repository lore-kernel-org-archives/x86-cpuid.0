Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4173421B191
	for <x86-cpuid@lists.linux.dev>; Tue,  2 Jun 2026 13:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780407639; cv=none; b=WDmP+RTyROXMFIRVxHwT+kjjCWZpNW6eQ1szExXIbzHWGgJoyxcafjdHHJd56dI5kQrjw/L1K3rfBdXyFx9V6HNBi3FQLt0IZagcQzo+vZ7oJ+Vf677NkwR2OXI6EE15qjCXZTfIbayJCa53rwnHzrQ0FTvpoLyxnV8gw9AYjhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780407639; c=relaxed/simple;
	bh=eQxyyxyEEEylLuPnFbPqDWaFKEyz26TH3HyP5qD7GqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fM8QIPVWKJf6mxV+5e4051poztERls+AjUplu7xAQcbhH3E/dFSA8vzjOQUez62X+F4D0WpJRGskryV4ReRSp1cn2iKLP2wmFI42WDB69+Wid09TBPxVmGY2jm03ECD3DHh7mqLb1irL5e71fovNDT/RG/yRrdXLkmYRF3IYXgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nCbjoS7E; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=XrM6y0xs; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nCbjoS7E";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="XrM6y0xs"
Date: Tue, 2 Jun 2026 15:40:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780407635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XJdAB2MVyIjZKSv2gk7t4ZiX8V4kAc/AIxNlS0qxeAI=;
	b=nCbjoS7EyREB6HXiN6saqjeEY9/Pfg0tFWUUqTDls4vKROd5gWb01zd/LOhFKE9frdVBPb
	QtdOf/7EeivkwXarUYEjMgEONqJop2mPft8FKrMbDXk94JlxhlkcsUP0rxPaSdBS7Lv143
	0YagzSE7RKTq/SPV3LqRTNo4x0FV5pRoLWVMylP2KcYqoexIhooGSDXQZz9Socsh25uNtW
	QK6ZuJOnas5cLbFTs2cVkwSzEPJKt12Qk8psZjJ5Q60V5rRzODlOAc3xNJjDw6uz7iIELA
	mQzgFe0keP3SUZDbpGmJsk7qy0wTouyBkoUk5gWENV6Y79Slt47flR1m02YJDA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780407635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XJdAB2MVyIjZKSv2gk7t4ZiX8V4kAc/AIxNlS0qxeAI=;
	b=XrM6y0xsbVjag0P+mlApLO7fMlufz+ZVurW2g32VhF8KaLroQAY/Ek2IM/gt9tODgXJ8RH
	92/Bz2EtLcJjqvBw==
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
Subject: Re: [PATCH v7 012/120] x86/cpuid: Parse CPUID(0x80000000)
Message-ID: <ah7dUQnB-MpbW5IA@lx-t490>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-13-darwi@linutronix.de>
 <20260601222239.GBah4GL777WIRuj-Wk@fat_crate.local>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601222239.GBah4GL777WIRuj-Wk@fat_crate.local>

On Mon, 01 Jun 2026, Borislav Petkov wrote:
>
> Why are those here?
>
> insert_tag: WARNING: Unknown tag: [References: 67ad24e6d39c ("- pre5:    - Rasmus Andersen: add proper...")  # Historical git], ignoring it...
> insert_tag: WARNING: Unknown tag: [References: 8a50e5135af0 ("x86-32: Use symbolic constants, safer CPUID when enabling EFER.NX")], ignoring it...
>

I thought "References:" is one of the official tags; will remove it.

> >
> > +static void
> > +cpuid_read_0x80000000(const struct cpuid_parse_entry *e, const struct cpuid_read_output *output)
>
> For your whole patchset - remove all those linebreaks pls.
>

ACK.

> >  /*
> >   * CPUID parser table:
> >   */
> > @@ -53,9 +71,11 @@ static const struct cpuid_parse_entry cpuid_parse_entries[] = {
> >  static unsigned int cpuid_range_max_leaf(const struct cpuid_table *t, unsigned int range)
> >  {
> >  	const struct leaf_0x0_0 *l0 = __cpuid_table_subleaf(t, 0x0, 0);
> > +	const struct leaf_0x80000000_0 *el0 = __cpuid_table_subleaf(t, 0x80000000, 0);
>
> The tip-tree preferred ordering of variable declarations at the
> beginning of a function is reverse fir tree order::
>

Just botched this one; will fix.

Thanks,
Ahmed
