Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266583A4F5E
	for <x86-cpuid@lists.linux.dev>; Tue,  2 Jun 2026 21:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780434911; cv=none; b=bQfQZ+CCHnxVUf7BjC5WEmGRMseXQ7sjfqF2E9ZA9a3n5sRfsbWnBenj04Qo0SOYEKZS31HXSfLPcPIBIQMlLiIlOkYLQtxzBDd5sN9vRp26o/gtIziYy/J17XoUppTq2+oweQNbW/P3j7yvRJ9+ubJEpNJVl44it41VabPgrTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780434911; c=relaxed/simple;
	bh=oREw9lSMN+aM31CNSJQ6alDPTVZxkDVS/WCuQ2tZZww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DVb3Crsx5WyZEhPm2x8N70TXwfqWqdSO3SDv8rzmR0SypJJH9yLJsYH17G43YeNV3Rb+qpE8UgMkLvIkyaHel4+YLsA2EicatIHJTYOK1ZFWjlLwNCOUjOaWqumRwgq2nM7ePRUYzxaQKqgSTh71Ogv9YGvwQvg2kHDCaka6muQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0amPntOw; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=/XRBRTIf; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0amPntOw";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="/XRBRTIf"
Date: Tue, 2 Jun 2026 23:15:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780434907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LxMaBZow2gqnGn2mNw4mw6UoKoWdH3ee6SZcj5+WOX4=;
	b=0amPntOwcHWUJQZyuYwKRUOCqPYlT/8xnKZ9rkYMjMIqJspfLxO2S3lbkrs2cJbzDddO9p
	QhvkUuBpeLWovK9XAhkFA3UH2G0CjB1timVaEz2x9BcDP3C1fSexHEqW5VOPptvLCW2+F1
	gvB04DwmrxwlZstadAHv59EkW84c9whGZ9epgqfWzQcuvWaF6ThfCgZnsp2ypSLsWYuyaE
	4TNkJMgWVrPlKIgLQbCdaQmny4FmIfeTxWLg/pErMA3WY1+gyKJTi3bHEekFgHvFpBXiHZ
	As9xUQAk2p4Lw2366AkHos2RvK+pTRCRBTKLlQ5Zb3G1s1WCRf2S5Wqpgb8jJw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780434907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LxMaBZow2gqnGn2mNw4mw6UoKoWdH3ee6SZcj5+WOX4=;
	b=/XRBRTIf4fv7Llzc/96ehL1YHw/3xBGwYoVQkAFUBcKf6CZmhEvTqDfVjg5RRTC+Tu9Bb3
	1wFyP/1T3s5KCZCA==
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
Message-ID: <ah9H2hxkMPMeuF-o@lx-t490>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-5-darwi@linutronix.de>
 <ah2WBnBkz8KQrph0@wieczorr-mobl1.localdomain>
 <20260601194150.GDah3gfjoIZIByCa3d@fat_crate.local>
 <ah3jPMYIxC1vsUUB@lx-t490>
 <20260601203452.GAah3s7FevsRDFT7rF@fat_crate.local>
 <ah34pi6j5HSMJdrL@lx-t490>
 <20260601225306.GDah4NUvJwaqQem4VQ@fat_crate.local>
 <ah7_wPJ8_FGLOwZd@wieczorr-mobl1.localdomain>
 <20260602174746.GJah8XQvEJo9UKru1l@fat_crate.local>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602174746.GJah8XQvEJo9UKru1l@fat_crate.local>

On Tue, 02 Jun 2026, Borislav Petkov wrote:
>
> Well, I think it would be best if in such cases we do both: send it against
> x86-cpuid-db and then generate the kernel patch from it. So that we don't lose
> time.
>
> I wouldn't want for 7.2 to release with those typos in a user-visible header.
> I mean, there's time until 7.2 releases but it would be good to send a fixed
> and complete pull request to Linus already in 2-3 weeks time.

I've pushed an x86-cpuid-db release about an hour after receiving Maciej's
patch.  And that was mostly because of adding more fixes in the same spirit
as Maciej's findings.

So I would suggest a "wait and see" approach.  I don't think that the
frequency of adding new bits or fixes to the database will be that high.

There is also a git-describe tag on top of leaf_types.h and kcpuid.csv.
The idea was to encourage people that submitted kernel patches touching
these files are either from a pushed x86-cpuid-db release or at least from
its tip branch.

I'm definitely biased here, but I'm optimistic that this can smoothly work
out.  In the end, the x86 maintainers still hold all the keys here, in the
sense that there is no risk of slowing down anything, especially in
emergency cases (say a new HW vulnerability.)

Thanks!
Ahmed
