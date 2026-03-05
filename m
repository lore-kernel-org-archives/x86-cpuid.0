Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28273374735
	for <x86-cpuid@lists.linux.dev>; Thu,  5 Mar 2026 08:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772699069; cv=none; b=Y0nH0CV/k7PhPsUHx93s7eB1b0jmJa6aO6Y9X8WjHhkpJs9YWomuKnwfb48kzqhs1xXsYNj5qZdkvrIIJdTjrZW89UQq/qXkuI7tTYrxV9HDdwuhuhvPj9nBOD4bhpruUka0zgsUmLYj49chnJ95qmEgCrwQl7ZaHNvXtnmrYSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772699069; c=relaxed/simple;
	bh=XcAehjnelJxoXK/GotHkFxE2nWco86lPeeS/g5lnbJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u3Nauv6iPtAlxGHnFJ2BsJtJIrcMZyM4USMpw5EWXrFHcx1mb9L3OFIRHYbvpBF835dIepti3wdizICzU/lz+M0ItMObECBZ3tv/1DXFL6dEIoZc0OTHRL2HeXZthMxby9Ko0KbPqhShQKB7rqPklhsyXBO3A7aGniMRbPmIF6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OQM3cix9; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=E3pIFJl7; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OQM3cix9";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="E3pIFJl7"
Date: Thu, 5 Mar 2026 09:24:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772699064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tAuXzFT+D1HZg5b5bCys6Fk7PoAHMINo2CyzHHCYM/s=;
	b=OQM3cix9dzzHhjsEOeO9YEfZbGCWKWh8GQqk0iC5AssSyyRJX6buPoE5CVRfTUStl0J/K+
	VFwarUp6YiXfwaYqbQg+voG6I8aJsp6bPokB/bSANrvp4fDXox11fAjc9V9meNU8U5ONMR
	uHgu7P7gwfueUGRpztevUQeJ0ZeC6GO9/Ap3/A8zpYvzkoosxDdLHcrsao3hXwGs7s+fSI
	TLvk7WHkvN9ACRYT4czqkReA/YuYqeU8IQv3PPI79Mos52Ci3J0zlknJa24sgAWPbOQJ1o
	SaCpWJQ+ccB5NP+dfJsY/tzyWlEojeHVGSmgNgYNZKvgEDuMxRGVP2tDxWQkyQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772699064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tAuXzFT+D1HZg5b5bCys6Fk7PoAHMINo2CyzHHCYM/s=;
	b=E3pIFJl7eAzaUh8EfJOZ/Q8UYJ4OHkRFvHAjN77B8tHo9Op8aWemM7Wfc03Tv+arA6W1gA
	Re/FG8EUntdHRmBw==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Borislav Petkov <bp@alien8.de>
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
Subject: Re: [PATCH v5 10/35] x86/lib: Add CPUID(0x1) CPU family and model
 calculation
Message-ID: <aak9tndGp-4m433p@lx-t490>
References: <20250905121515.192792-1-darwi@linutronix.de>
 <20250905121515.192792-11-darwi@linutronix.de>
 <20260304194334.GEaaiLZqPuGUuBDWzi@fat_crate.local>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304194334.GEaaiLZqPuGUuBDWzi@fat_crate.local>

On Wed, 04 Mar 2026, Borislav Petkov wrote:
>
> On Fri, Sep 05, 2025 at 02:14:50PM +0200, Ahmed S. Darwish wrote:
> > The x86 library code provides x86_family() and x86_model().  They take
> > raw CPUID(0x1) register output, extract the necessary fields with bitwise
> > operations, then calculate the CPU family and model out of that.
> >
> > In follow-up work, the x86 subystem will use parsed CPUID access, along
>
> Unknown word [subystem] in commit message.
> Suggestions: ['subsystem'...
>
> Please introduce a spellchecker into your patch creation workflow.
>

will do for the whole PQ.

>
> Please keep the old simpler code:
>
> ...
>
> This is way easier to parse than a ternary expression oneliner.
>
> Ditto below.
>

ACK.

Thanks,
Ahmed
