Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7E21C5F2C
	for <x86-cpuid@lists.linux.dev>; Wed,  5 Mar 2025 17:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741196193; cv=none; b=Z0Opa/s82aIge2fto/ssby5g9JLS9AhJKwOplQhuYG4DDDcJryKlhoR6ip96ffHwgPQKJjR08qX4wOepht4TZLGc1Q7+GZMY1EBN1QGMe/YLZgO0JLp537UgV+sagU3C/138YE27IHNS8atoYXWA5B5PJ8ZVn8meylbCD2glMpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741196193; c=relaxed/simple;
	bh=EZqmZdceRXNCcS/xtiI2XoCZjhpdVCBclmGW+qcXd6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M4duvcNkZjJoOLulHGjmibbH0VimXPX8e94tDmPJLeqY5sMcIfjTRucbgTogszHiDYVbomHHFBbO/0qRjhCcHcWiqwN2cesogKR/Rg8738MRbGuiR3kOy1QvDdrX0CESwgQFabKsBwwqVrzOA5WVaFV8Jn6tSlP9r5lUoYq/QN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=G2l5tr0L; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=iauRug0V; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="G2l5tr0L";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="iauRug0V"
Date: Wed, 5 Mar 2025 18:36:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741196189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JbnYqXODu2X4yu6gDwtzEeDtKgMZxzZkJt/AYo1/ABA=;
	b=G2l5tr0L97aNvXBXKGIih5L8E/oShhh6K2PFiSUEu6+QiT3qkXD1r1Kq/TYNgkq67wtol5
	KtaojTCxWoo7B1Gykbwjs4P1CsnhegmK9A1jj6ZSP6dEYhuNRlUmoxIM2HqkDXKOT3B6FO
	x1tR49kbC+KuWibUxr7Edd3TFDA7kpuEBu7K4PkP793e2GLcsAZXwvBbHWR0eaFg9IvMAO
	19BhffDC4VgJRvQJ8jJ44aBsDv2j0av9WZjAiuiwf5PpsTj++uqhKGttjL4QmespqFhDnV
	HNxh3h9qtG2HmO2G5fVhmOgWw70kFHi8fyfVhs7sAaE25av86Anluhmx81DGkA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741196189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JbnYqXODu2X4yu6gDwtzEeDtKgMZxzZkJt/AYo1/ABA=;
	b=iauRug0V/f2VswUW4CYmEKoC0WiIJVeqhoCX0cmtLhSD0+JPQbKUQL/rm0JloE6V38cmbe
	DMSwyHve3LftuaAw==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	John Ogness <john.ogness@linutronix.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 00/40] x86: Leaf 0x2 and leaf 0x4 refactorings
Message-ID: <Z8iLm6NOgbn7Ir2E@lx-t490>
References: <20250304085152.51092-1-darwi@linutronix.de>
 <Z8bFnGSxmNSFQDSQ@gmail.com>
 <Z8bKEaEWAbE4F1gk@gmail.com>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8bKEaEWAbE4F1gk@gmail.com>

On Tue, 04 Mar 2025, Ingo Molnar wrote:
> >
> > I've applied these three to tip:x86/urgent. I added Cc: stable to all 3
> > commits, because while these are old bugs, the first one had Cc: stable
> > and if we do it for one it's justified for all of them AFAICS. Arguably
> > our cacheinfo output in procps was inaccurate at times, and possibly
> > these bugs were part of the problem.
> >
...
> >
> > I've applied patches 4 to 9 to tip:x86/cpu (with x86/urgent merged in
> > due to dependencies and to give a singular topical base branch in the
> > x86 tree), they look good and obvious. (I added the build fix to 05/40)
> >
> > I've left 10 to 40 for further review by others too.
>
> While going through the rest I also picked up these patches as easy
> preparatory commits in tip:x86/cpu, there was no reason to have them
> later in the series:
>
>   29517791c478 x86/cacheinfo: Remove the P4 trace leftovers for real
>   d61b5118f719 x86/cacheinfo: Remove unnecessary headers and reorder the rest
>   0d22030c49bf <linux/sizes.h>: Cover all possible x86 CPU cache sizes
>

ACK on all the notes.

Thanks a lot for the amazing turnaround time :)
