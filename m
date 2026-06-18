Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A122DC76C
	for <x86-cpuid@lists.linux.dev>; Thu, 18 Jun 2026 19:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781810490; cv=none; b=KQmwCCVGkqanuiRDYkRS1IKN2MCVPUagVL3ek+IbTunG+G4+BnwXkY7WISg3iPAYPnyObVD/8P8nzRYsuDrghPj5VHCaCLqRXxlNa1jQNqLjtgAqsv9RfefVqGKR9peVTmu8mTuuFEIq+OHksszJMmKlwR22Pp6NheagobCg5Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781810490; c=relaxed/simple;
	bh=3EJPwKBvtF5SNbrB2AFl1VTdQRQ9QeSKJr1Ew39aw0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=efgxINFiSVgmxoZn+Cv3ou++CAd/qa80hjBx8O/67IMdF9Kf7SHx1T8SMWfPOZbd+Xjeuc/Z0u3/tBEBucff4JhNZ0S+Nun0G9LCQa6cqSFTJtFPm5Bj56xh6Nfoiq//73x9/nALieYRuwAslgORUPE7NRBMuNZOeSArF9mT03Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=MQdQF25y; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="MQdQF25y"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 4189240E02A3;
	Thu, 18 Jun 2026 19:21:27 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id JG1JUieoz38i; Thu, 18 Jun 2026 19:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1781810475; bh=8kqdJrsW10ZrXJmI0ISOlnOgj/Xj1piECDx8qhjYUoA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MQdQF25y6ZmcVrP2hUlCXd8mYxhUCIL0sFJ4mf2iiEPpUpL+sminH0zo43UfBHSv0
	 TK0ySbnd1uQmHorccw+YupVNsaXUHFSMdOUh68jOY4boccF4ynzkwnnVfhprpkt7j3
	 YL+PfHmAAwlMTQqg+hkCZJCSYc40SfuEt3aF38x3op7H8elhk0Di6Cjn9ovH3YkPI8
	 5X0M8C+OyiIR9vAxq3RnDLWQ5ePZU2o8lu16Qx3Bt/uGgSQZKjTqQR0uRmiZKtcVhh
	 XSy08YJSmzV6KHyMuzXqcX/dQMS2H5YoLuLzPQexWPOcTtj9IJwNm/5hBO4k6c4rEJ
	 NAfpbkBtPaqYbtt/lv8Lo1iOUyltIq76iHzyuAbOaPZIhDLKZfHJt8ElkKpNYoFAP8
	 +z0pQ5Ayclcu27jCwdnmMKlu6sUEFS3qipN94i76wLjC1s8IfeyFosPGGBOTyFq2us
	 p16mgSXRKPJJxxabsfpYgsrX29gE6Eef7LF3Gimc5JH1C8Dcw4EN0sjlQiEnNoVeZG
	 oj+jBnokjLLxUXdpTJhSIH/Ba+uSDs75ntewHztfBZUxW+QbeP4Oh6dd/djH8p7ph0
	 4HU7tzEUzNVVHfPLiXaye4IYZIwoNcaFymfycGqAwTdZMBuEVt5dNsNRZ4z+Y/SA0Y
	 VnhldvHJO0eBFbx1O7H7ZIWE=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id B048740E01D8;
	Thu, 18 Jun 2026 19:21:01 +0000 (UTC)
Date: Thu, 18 Jun 2026 12:20:58 -0700
From: Borislav Petkov <bp@alien8.de>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
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
Subject: Re: [PATCH v7 017/120] x86/cpuid: Introduce a parser debugfs
 interface
Message-ID: <20260618192058.GEajRFGlay3L0PDwBF@fat_crate.local>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-18-darwi@linutronix.de>
 <20260617044123.GBajIlc_E_bvkArzS4@fat_crate.local>
 <ajRC9NqMyEtxSj2X@lx-t490>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ajRC9NqMyEtxSj2X@lx-t490>

On Thu, Jun 18, 2026 at 09:11:48PM +0200, Ahmed S. Darwish wrote:
> On Tue, 16 Jun 2026, Borislav Petkov wrote:
> >
> > Except that debugfs *can* become an ABI if something ends up using it,
> > despite all of my WTFs recently.
> >
> > So I think this patch belongs out-of-tree, to be applied only when we
> > want to dump stuff but not have it in-tree casually...
> >
> 
> This shall help with tricky future bug reports to ensure that all the
> tables are in a sane state.  This is especially true for cases where the
> tables need a refresh but they were not refreshed for one reason or
> another.  Maciej just reported a case like that at the late part of the
> patch queue thanks to this.
> 
> Can we at least keep this under a kconfig option that defaults to N?

You tell me:

https://lwn.net/Articles/309298/

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
