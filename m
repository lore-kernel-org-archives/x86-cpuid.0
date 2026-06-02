Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F933126DA
	for <x86-cpuid@lists.linux.dev>; Tue,  2 Jun 2026 13:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780408709; cv=none; b=FfdXKwY3hkgcoDnV2bhZ1gBLOLSqHUwLVQMcxbSk35e1y4HupeUl43HWmAI0x6JmVkEvE3zPOsqTg5lR0VLCQQh7iggtIP2b9k3gDJOAsseBHLyoslfLGtdGxzNzaU055Hwa9x+93bw1NcvzD7B9D5H6X//9+bp+kbnITqCvmqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780408709; c=relaxed/simple;
	bh=SFC8drE4D1nT9bFGSsdiHFjXQu2FtD8FgygsPUnh3oU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DSdLFIHc2I0ovv6s2znv0YNEuvpfIQroqg2PK/4mfwBQIZzAsCNr2JBl7p7jDKJFFMuYUlEcOCdVzbLYG4N9WOiJmACtcHj23TnBkUhn8clxPKXhfjJc14Ln+aDENf7h+quM3wK+7Nemyz1OLynAA6F4oYMYDmpNNp5D7rVDrD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dSboXvcS; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=grm0MKuj; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dSboXvcS";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="grm0MKuj"
Date: Tue, 2 Jun 2026 15:58:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780408706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W4UeM7dWhEr3sgIDLcgLIVLUV/rWFz+kgKKjqi/DgzY=;
	b=dSboXvcS6sDBmunCa96KwWfwbn1sjTIpOe2qnWaeIvxFZ+iClFh+eRwTS+wOAWterLLAgI
	BvJRnRpzuje4hHYjNsT9OKhnvN+MpOf2V+cUTgvGqoYwhbypeykK7mQIRFsA7Ld1751g9O
	RDM1Ic2dKABW6kB2KIGLZ8wzkdpapaiNT9DMc47HqcShAJEb9dmKLgG0Ijnwo7pa2rNozJ
	du5R3jr4gbSzIGTfg6e+bR4P/uvxNWF1mJJ9r6Ww3uVgA/2P3xXTAMk/ohV2EwchS1Qyis
	SQZAqbVGQBETopiZlh1DM77JWdlPBiyy2VOpvQ4tKPjHeSeLNFt4Om0iNPsgwg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780408706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W4UeM7dWhEr3sgIDLcgLIVLUV/rWFz+kgKKjqi/DgzY=;
	b=grm0MKujWdDKjH7e14fjsP1QnbvEd8O3CSYuVqIou2FPyVTSxF566+G0ruJZkOFqf2IwXc
	yL50WKGYqwQna2CQ==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Christian Ludloff <ludloff@gmail.com>
Cc: Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 047/120] x86/cpu/amd: Refactor CPUID(0x1) level
 calculation
Message-ID: <ah7hgPQlETAtm7j3@lx-t490>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-48-darwi@linutronix.de>
 <CAKSQd8WKPQoDNUp-ykJ2j0mqg2Fn7m98ipC+d2Gz7MfHKUW5WQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKSQd8WKPQoDNUp-ykJ2j0mqg2Fn7m98ipC+d2Gz7MfHKUW5WQ@mail.gmail.com>

On Thu, 28 May 2026, Christian Ludloff wrote:
>
> On Thu, May 28, 2026 at 8:42 AM Ahmed S. Darwish <darwi@linutronix.de> wrote:
> >
> > AMD K8 init code has the cryptic CPUID(0x1).EAX level check:
> >
> >     (level >= 0x0f48 && level < 0x0f50) || level >= 0x0f58
> >
> > Given that:
> >
> >     EAX[0:3] is the CPU stepping
> >     EAX[4:7] is the CPU base model
> >     EAX[8:11] is the base family ID, with 0xf as the largest
> >     EAX[16:19] is the CPU extended model
> >
> > [...]
>
> For K8 the 8-bit model field actually contained 3 distinct pieces
> of information: bits 7...4 encoded process tech and K8 revision,
> bits 3...2 encoded core type, core count, as well as cache size,
> and bits 1...0 encoded socket type.
>
> https://www.sandpile.org/x86/cpuid.htm#leaf_0000_0001h_Kn
> right below the K7 section.
>
> The rest of the AMD models were sane.

Good catch, thanks!  I'll adapt the changelog accordingly.

BR,
Ahmed
