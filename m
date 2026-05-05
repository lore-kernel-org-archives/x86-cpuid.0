Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95C926E6F2
	for <x86-cpuid@lists.linux.dev>; Tue,  5 May 2026 15:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777993992; cv=none; b=khn+upUEzSq37o3xItxN9dUtl0B6f6CvCsbFYHQzpTDbwXhJhBjYqIPtCWqKN3maPlBQB0hI30ADVqalfO6On0L+Kv/MWIkQfB10QDUmKnnyHny7TGLROC2nVH9KEpcnTYsC+Rh1eGVLcR1Q5c+HThBJSKUJFwsbvN8sNjoB6wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777993992; c=relaxed/simple;
	bh=4TaONl6Rx3cUOxj8bxQWioNCcYS+SIxKaQ8lT2yEbcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bi6y/iw5vcViLQJ/uRfgUXBFPH1ooUCfJ0WyRX3UHUITzgWp7TPUR4W8xutMoS8lbwBhv8OidZDrV4RDqEWLdb2U9yGUC9LGjh9tQHp5EccAggUIzR4nKksIOLX3vuzEsWWKUHqKkrFEZs1AaYLyCHHgI6VnkLPhJmsgkEdPk5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=gXSb96lD; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="gXSb96lD"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id AE4A340E00BF;
	Tue,  5 May 2026 15:13:08 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id LrOWhERD2W5Z; Tue,  5 May 2026 15:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1777993978; bh=2g+XGgsF8ZTi5c+o/bOXBfBl05OA0y3vKgXTYBTbjEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gXSb96lD9657h5+rXfwx+XHOGKxwRx9XnBOwnoEk7zbWFPSOHaOURyrgJ99c2EDrY
	 /fDWGsNzDmZbbnUWuId17g0RD3tkym37ESUHdNq12njZssXuPmNOOkGtES9/7zICye
	 ro/c/AdZbljATDMxICZv8Y64ACCUvXxHG8PHJKH3jo+epxJ6TlikwioB2Q/aHJ2E0X
	 kkxXcQQF3A43BYJt9c8eaqpiCn04+/k6pLF8/Wkb4nVcXL308hJc9g5nIq2C/YTY+v
	 6Ssqwo/uxGOj89jp6HRu1sb2AuF1GCgVhkmoz400YZ3Xmd7ClhRX6FIMCCL1hP2fqP
	 NjheSnOcBJUodcCnt600Pc7Azyk8brSnh5wx/QU1oowX9/5q7+l0yKUY42iY2kUcJ9
	 Ue+pL8vn2iT0/Um/oySVAuuIuZNzeu1Q7DfN5rHsAxvHUhBDWMypV9cEA1+WKqws2g
	 jg0HrSn8RzW/tQivNcSugnlv9iqsNquKl4q9xrJ+1ZxbkmeEuTPCJOFvEbouOJE1+A
	 wCD7++98+xtCf3tRrEzUvyjgrl/Q3eeyWshoZwl77K/bk1C9lle52atbLjhQpScfe1
	 yPHVXAirFaxv3AFN0fGjqubbrk3qykygFvxDyVXdbTDLjNrAUIwGde0Yha1Rwb7Id8
	 tVQclbFYaGUgBJX13FN6RXps=
Received: from zn.tnic (pd953014d.dip0.t-ipconnect.de [217.83.1.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 0340540E0032;
	Tue,  5 May 2026 15:12:42 +0000 (UTC)
Date: Tue, 5 May 2026 17:12:42 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
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
Subject: Re: [PATCH v6 00/90] x86: Introduce a centralized CPUID data model
Message-ID: <20260505151242.GDafoI6oOOs9hknrrK@fat_crate.local>
References: <20260327021645.555257-1-darwi@linutronix.de>
 <20260327152354.GBacahCioljpw5QqUc@fat_crate.local>
 <acrBBFyU_vi4zFOx@lx-t490>
 <20260330230836.GLacsCdDkVu0H3XU4l@fat_crate.local>
 <adz3z_MaWJr_GOtc@lx-t490>
 <ae-uw9836AJScRsq@lx-t490>
 <20260505133350.GAafnxvtgFxJHth8WB@fat_crate.local>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260505133350.GAafnxvtgFxJHth8WB@fat_crate.local>

On Tue, May 05, 2026 at 03:33:50PM +0200, Borislav Petkov wrote:
> On Mon, Apr 27, 2026 at 08:45:23PM +0200, Ahmed S. Darwish wrote:
> > * Keep the current synthetic CPUID(0x4c780001) and CPUID(0x4c780002)
> >   bitfield listings, with their hardware-backed scattered bits, as is.
> >   Mark them as "v1" instead of setting them in stone.
> 
> Except that they're already cast in stone:
> 
> https://gitlab.com/x86-cpuid.org/x86-cpuid-db/-/blob/tip/db/xml/leaf_4c780001.xml
> 
> and that 02 one.
> 
> I don't want any of that to be in any database - this is Linux-internal only
> and needs to go from there and nothing should depend on it.
> 
> So, instead of taking this and then converting stuff ontop, the proper thing
> to do would be:
> 
> - rip out the linux-specific leafs from the cpuid db
> - keep both facilities in the kernel for querying and convert the hardware
>   leafs to the new method but use the old method for querying the synthetic
>   leafs. I'm sure we can multiplex between the two in cpu_feature_enabled()
> 
> - then start converting the synthetic ones to hidden, Linux-specific ones
> 
> Ok?

Ok, talked it over with tglx - he brought up the argument that actually
having those flags documented is good for other tools like crash, etc, where
you want to consult a single db for *all* X86_FEATURE flags in the kernel - no
matter how they're defined.

So, what we will do is, we'll leave those leafs as is and not touch them.

If we need to add new, solely synthetic bits, we'll add them where there's
room, document them in the db and that's it. Synthetic bits will be add-only
and the cpuid-db will collect them.

This way you have a single source for all CPUID info.

The scattered.c thing goes away because we have full CPUID leaf
representation now.

We only get purely synthetic new additions to the db and we can use the Lx
namespace for that. I guess that's plenty of room for the foreseeable future.

Makes sense?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
