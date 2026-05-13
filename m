Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E94D49551B
	for <x86-cpuid@lists.linux.dev>; Wed, 13 May 2026 17:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778693129; cv=none; b=Y6RN12ytReAkNwHsjXmB5ihydOCZn0gpiblOyBglfDZwGIhSF9qL9rTjnIn+q0lrfMceuqcZGrSQ3fmuS9oVycz09DS12qmMwYd25rf/iC2q/V5HwmebyRdI/A3oUbYh3duhpr8wDN0pUlk7pUCNHyHEBd5ARtBhyy7KfY6/ktk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778693129; c=relaxed/simple;
	bh=ZUDrRVCUDxyZdJv9kOkV9i+CwocEPVMRZrSbjbhpzWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dJwSRsGnRyi/w2Ci5jvN76NMh3nd2HHQ4pG6AQTkQWH7jtc+LajQ4cEWiLdCnwaa7uOfsezI2zOUBIXwjY4bPIh8FrmM8kNo6XgEAwFYeZuggtkIRP67FPTfR0lxsL0fFylgaywG2xAEUCIkV+KFNd6TW6+/Tw42l9Vr4ZsW5/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=aYZmBFCZ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bJUBZpWe; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="aYZmBFCZ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bJUBZpWe"
Date: Wed, 13 May 2026 19:25:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1778693125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HKtYwdVefZxNBQXiLs0Aqn8qUteSeGr/CL5KNeOCjo0=;
	b=aYZmBFCZzoQKcarxcBiHaOrNwOESz1tpR/+YjqbxTv3yCbz9Tap9KoWTOvnLINWC2/r60U
	F+RQ74/MfILdQqnVActLuMiQBhlJFJ/4t+ph4m19gucZ8U0H9bnOL2V/OX8aQvH3r12Z8U
	1e0fO3SVidnU5VjNAprt7YcemgxHN1PpudrzofThsVi91rq6M3kSj+ENX8uRgGKfuhlhKq
	uS9g/uXvOCiYG8YY2s6JneosXFH8dBXms7lRVyxuxl0W8V9EuedzQOQ9hjQYuF/03geMlU
	68jzogZyJ0MyKtkECiu2SBOE+4afFFYl2hDbLqAICHM8kGvG9O+v8jrI6W2vGA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1778693125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HKtYwdVefZxNBQXiLs0Aqn8qUteSeGr/CL5KNeOCjo0=;
	b=bJUBZpWeaN+cxH0AWZyhEbp1vMIy4PosgJIcareED41EpC0u5qtRg+I9SvB9AY0/vgjHyr
	KjA2llHPnK2DGbAw==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Sean Christopherson <seanjc@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Christian Ludloff <ludloff@gmail.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 10/90] x86/cpu: Rescan CPUID table after disabling PSN
Message-ID: <agS0A2pRhz_qCPce@lx-t490>
References: <20260327021645.555257-1-darwi@linutronix.de>
 <20260327021645.555257-11-darwi@linutronix.de>
 <20260511200032.GAagI1YMP51EzCo7dn@fat_crate.local>
 <agLS2Y7smYRHyiHf@lx-t490>
 <20260512143412.GDagM6ZLBpvt6X3jzq@fat_crate.local>
 <20260513152742.GDagSYbheCBWwNeVj-@fat_crate.local>
 <agShjbCo_HSs9YOf@lx-t490>
 <20260513165128.GFagSsEPFCogQu7n5t@fat_crate.local>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513165128.GFagSsEPFCogQu7n5t@fat_crate.local>

On Wed, 13 May 2026, Borislav Petkov wrote:
>
> I think you mean whatever has done clear_cpu_cap() which doesn't use the
> cpu_caps_cleared/set arrays.
>

Exactly.

There are almost a 100 call sites which directly do a set_cpu_cap():

    git grep 'set_cpu_cap(c, X86' arch/x86/

And none of those goes through the cpu_caps_set[] array, and thus into the
apply_forced_caps() thing.  The bit is just directly set through bitops.

So, resetting the CPUID table whole sale will drastically alter the x86
subystem behavior here.

> > I'm sending another patch queue iteration shortly that have a new API
> > function abstracting this min_t() logic in its own parser function, along
> > with better documentation:
> >
> >     https://lkml.kernel.org/agSfWTxs9pRPHJxl@lx-t490/
>
> And I don't want to pay attention to which ranges I've parsed and which I
> haven't. That's too fragile. I want to simply rescan the whole thing and
> be up-to-date.

Yes, but AFAIK this changes kernel behavior to (what is at least to me) a
now-unknown behavior.

>
> Also, what guarantees that this thing:
>
> 	rescan_from = min_t(int, l0->max_std_leaf, c->cpuid_level) + 1;
> 	cpuid_refresh_range(c, rescan_from, CPUID_BASE_END);
>
> doesn't overwrite some unrelated ranges?
>
> Also, in your example:
>
> * First case:
>
>          leaf 0x0
> 	   leaf 0x1
> 	   leaf 0x2     <- Old max CPUID
> 	   leaf 0x3
> 	   leaf 0x4
> 	   leaf 0x5
> 	   leaf 0x6
> 	   leaf 0x7
> 	   leaf 0x9     <- *New* max CPUID
>
> when you rescan and overwrite [2-9], what guarantees that you don't overwrite
> an already set or cleared bit in those new leafs, say in leaf 5?
>
> Neither set_cpu_cap() nor clear_cpu_cap() pay attention to the max base leaf
> value?

Hmmm, that's a valid point.

So, clear_cpu_cap() logs the cleared bits to cpu_caps_cleared[].

Is there a reason why set_cpu_cap(), supposedly its parallel function,
totally ommits cpu_caps_set[]?

If we can track the clear_cpu_cap() bits above, then AFAIK a reliable
solution would be to just re-initialize the whole CPUID table whole sale
and then invoke apply_forced_caps().

Thanks,
Ahmed
