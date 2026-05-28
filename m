Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428662F7F19
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 21:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780003508; cv=none; b=DdXRxb0L0W+fePECSrMX8jlfHB6bIT1c1YtkYdhOfFkB/O66ncrEV1pdzoKIrfwoA7p5LN5NK/53eMa7K+plQfUhIs6JkH+4eeqNVu/6yYNiKjhNcJhtPA6XQuyvvEqtJjFXaJ8uVuwihLwJffncbZhadRkaDcECQD1VOTQflkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780003508; c=relaxed/simple;
	bh=A1Y+gVcrnnBR2j7LGnmkDeSXS4+wYv/zCq0bAXwE5lo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t7/UmOQQKAokFgIe2lxW3ngZDIbZ1gcAZ6KmAzBo+gbxRNTJ7qThy80v5xq5ZW1NbZTQjUNZE3QthkN9gs5QvmDqiseuUJ7bjhScZe7nHK3+UleAAJqsb2FL++6FDzMEJYNnEfT7lXhRBBadlXXf9YlHruBpiOzer5TQ1BM4v+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=UJsA5GO3; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="UJsA5GO3"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 2963D40E0031;
	Thu, 28 May 2026 21:24:58 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id NF9KQBMIGBxr; Thu, 28 May 2026 21:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1780003488; bh=22ZjzXdHn1TB9USBjsRxPNHs/4yJVa88/+pGaTBhTeE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UJsA5GO3ADd6NlDYCSzbOiVmMU4EnujGVLpRalHo/DyWs/4jczFhpNroHcv9uqG4y
	 YXrb+Md2sGPd4KsNHqZ4v4fvHjoe3L8CoYkTbN0rtAv2Gw98KoeE8o7hpo8yZdnBpu
	 kUkVO0q4+2dDrHdRN8vtqDBLiWBckUx4wL1MVsCDCIYUrHUohkHOOWP68fXblrNeKV
	 ssUMu/Dp8/cFs+mxr9fU5COhl3LbcR1ccvOB/vqbzneGXnyxw5L53ptfvI5T08wHsK
	 JDh6JFK/TiK0yI/yH5NcCx1IREPGkOD81t2kgcQo8LCvog/fZ0axWODeWG3EFkoDWl
	 gnUTxg6vmrqTdr6RVXQPXVbB/tYLhz7KfbHZpfJZ10TRHJorWFyHqMx/HkxtPb+cMr
	 43ykCNV760d4Il1zppWRVJOa1lD2cFxpv1qqjecOjMgDugZMz+BhAKqoCUBabOpr+b
	 +pGjEh5NIlwH0/n7DBpJQOK36hzq5rjvKVHqnI3TSAR3DDJ+AeYsJUupvyYRaNX7tQ
	 4BUb1SqELxr8BqrMHVDdk0nwW76hZP2Fuu99h1uLN+1aObDyLPrdq06uW9/UoL2bhY
	 MEQQj6SSjGAn0bE2IGesaeJ9j0EYyB7vEnjTvvqPgWFbA3hnIMAedkMDnU18NhNw3M
	 vC44nx/UIMwojkd9fl0mRrL4=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00:b8a3:f58e:8829:9ca6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id A364240E0140;
	Thu, 28 May 2026 21:24:34 +0000 (UTC)
Date: Thu, 28 May 2026 14:24:25 -0700
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
Subject: Re: [PATCH v7 007/120] x86/cpu: centaur/zhaoxin: Rescan
 CPUID(0xc0000001) after MSR writes
Message-ID: <20260528212425.GDahiyiX84F85kpbhW@fat_crate.local>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-8-darwi@linutronix.de>
 <20260528164945.GCahhyKYNsDo3upTKT@fat_crate.local>
 <ahh8aBYqA2i0PFv8@lx-t490>
 <ahiDW3-ZYZ9rIbUP@lx-t490>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ahiDW3-ZYZ9rIbUP@lx-t490>

On Thu, May 28, 2026 at 08:03:07PM +0200, Ahmed S. Darwish wrote:
> On Thu, 28 May 2026, Ahmed S. Darwish wrote:
> >
> > The idea was to have these refresh hooks in place so that by the time
> > CPUID(0xc0000001) is parsed, everything is correct without an invalid
> > intermediate state.
> >
> > I guess I could've merged it with:
> >
> >     20	x86/cpuid: Parse Transmeta and Centaur extended ranges
> >
> > But that one was already too big for that.
> >
> 
> Duh, I spoke too fast..  There is no risk of invalid intermediate states
> as long as CPUID(0xc0000001) is not yet accessed through the parser API.
> 
> I'll just move this refresh patch directly after patch 20.

Yap.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
