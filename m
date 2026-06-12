Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C353793D0
	for <x86-cpuid@lists.linux.dev>; Fri, 12 Jun 2026 19:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781292121; cv=none; b=NxXMz4RnaO4G2q5Pfc7qalMn3Dtdwd+ghvUFU0iQDLRiQLLqAWnwakt9PHCIWsDdW0To+TCardB/2Mocyco9FkVhFnnYNvQ+PYv/BWGXW9WzMMGc/GyQu1F9GBSpOVf4m4/dz8tNmTsVPpGFA0+1oO3oNBX9UeGXJkHtmWqLNDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781292121; c=relaxed/simple;
	bh=PEYLIoTbP4eQaB/6oez341ShqzvcKknMPLUQfppPmuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lr97cLr4a4cRPG3qyntLuZMqwn5ilHmy1FY7XTfO2+f5RqN1M5L63GhAmZT4DyBID+oUSjc86RYtfqv6vJZhZx+BMrL8gx9GPfC1aule2dZf1kDFUMJZA5RQYk7CibaOPlp2ujEDStkRSTju2102io8K603MVIjyLqzXS2K/2yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ziigzf0/; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=9RtRaENj; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ziigzf0/";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="9RtRaENj"
Date: Fri, 12 Jun 2026 21:21:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781292118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PEYLIoTbP4eQaB/6oez341ShqzvcKknMPLUQfppPmuE=;
	b=ziigzf0/e91+5bffGZTXwYAn5iH2sySSoQUGD/Msp3ueVPZb9uMBJCMbYEdNfx8cEpSdeE
	TVDqfW/BV7Fg3OxWhf7i0lk+Dbe3VN4rZ4eut689jVuF5OAmMmmfcVFflPkbEQRZWmsmOR
	lGvrIHojeRGwEyOa48/kz/XoYQ4KtJyFtVMHpI/fIdUKkRnS6ob7qMuIkMzTjQ4odLOd29
	/8zddNpXxr4TeECIAoQyDHTWCQBNcYDtU/bX5xKErx3ytL39uD4Wr19B+eaGea8VYuTNdd
	YFd/RnZ2wyb5O5gAHSZaX6ZZhvD5VdreComjMuKSPwjiaGFaKQEb+er6/4smeQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781292118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PEYLIoTbP4eQaB/6oez341ShqzvcKknMPLUQfppPmuE=;
	b=9RtRaENjKq3wIW+Hrm8dDpI7H/5/3R/hPjiYO4A6oJg+CzQRZ3lZS+qw9kKhEE/gJHtmGd
	6ETfJmhPMuCBIdBg==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Christian Ludloff <ludloff@gmail.com>
Cc: Borislav Petkov <bp@alien8.de>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 004/120] x86/cpuid: Introduce <asm/cpuid/leaf_types.h>
Message-ID: <aixcVIHNGx-0OAc8@lx-t490>
References: <20260601203452.GAah3s7FevsRDFT7rF@fat_crate.local>
 <ah34pi6j5HSMJdrL@lx-t490>
 <20260601225306.GDah4NUvJwaqQem4VQ@fat_crate.local>
 <ah7_wPJ8_FGLOwZd@wieczorr-mobl1.localdomain>
 <20260602174746.GJah8XQvEJo9UKru1l@fat_crate.local>
 <ah9H2hxkMPMeuF-o@lx-t490>
 <20260603003129.GCah914Tc9sEpO4Nxl@fat_crate.local>
 <aiZjpPCTsz4m-1O3@lx-t490>
 <20260608144920.GBaibWcLl3BUAPL8XW@fat_crate.local>
 <CAKSQd8W5060knJMy1eQeNCWzAo-A8V3bLqgdRZBgKc-QYT6E5A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKSQd8W5060knJMy1eQeNCWzAo-A8V3bLqgdRZBgKc-QYT6E5A@mail.gmail.com>

On Mon, 08 Jun 2026, Christian Ludloff wrote:
>
> On Mon, Jun 8, 2026, Borislav Petkov wrote:
> >
> > I think with issues like that which can cause nasty workarounds, we
> > cannot be urgent enough in fixing them.
> >
>
> The database will never be perfect – it is always in catch-up mode
> in terms of leaves/fields/values that need to be fixed and/or added.
>
> That much I can tell you with absolute certainty after more than 30
> years of https://www.sandpile.org/x86/cpuid.htm maintenance, and
> yes, being personally responsible for some of the CPUID madness.
>
> Embrace that chase of completeness and correctness – "perfect is
> the enemy of good".

Amen to that :)

> Ahmed, can you enable gitlab issue tracking?

Yup, I've enabled it now.

Thanks,
Ahmed
