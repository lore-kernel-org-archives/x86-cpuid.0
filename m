Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE943E1221
	for <x86-cpuid@lists.linux.dev>; Tue,  2 Jun 2026 13:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780406923; cv=none; b=na2+CKLm4Shu5pe1V7TFFUvW2eKntyYUdDj8S09LcTcUIeTRh3kdVAqdkmZPawHO6QEpjAFleHrvT/DOXn6CKCd62mNMscitLBlpiOl6Wr9ZQ74o718zGf+QItrd3xIZKZPK5d87WwZyk3AXklhfOPT/xGvbplFfDWomzUeyQsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780406923; c=relaxed/simple;
	bh=0LlKij6mxNpsoxHvpWRGTZihoCy9Psev8htzIhtlOjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SOZA/BQWrbxZaQzq8xPAv/TJss0ELI3+dMf9p0/dtc7E9JpwuLiS6icMj+Kjrm4iA4rYoOqRd+Dm7g5cQreETZAVzi7Ay5rtrtvBcykPnWVqHR7mpLrOp4FcBwxqHyUl3q6Q0Gr8AJt3Lr84eJhUSTQe6iHi4MYKLVyHzXH9EK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=IWwhU3vS; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=+O8zh2Bs; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IWwhU3vS";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="+O8zh2Bs"
Date: Tue, 2 Jun 2026 15:28:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780406920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P08tVjnmst/pZjrQTwo0mQV2IfEKvS1wnFfV0CD4Fl8=;
	b=IWwhU3vS3pfJU78MLZ2hhK3a/9ozkSp4w424MX3l5kdfzozqllOzgJ4qVMMtV2XKxd/WxM
	eMDK87g/Kid/I303LhzYy7cQKN0I6aWJSL2f0O3zPBEX7qFBy70xUMmvW3FHZv/8/HQwtH
	m2c8Xk4nHVSljH81XRRMt+wWzlbZU2+H6ppR8MHxYSH99LVVPCZ4whHSSsrmhSVBGktBed
	WUH9Nuhrqjdjh0tMeZfhf2tnCQZDLVHclIGpKi1rHgepgxFdudoBxs7EOrd//FaHaYEid4
	gjZAIJrIdkGGF8pD6oAuw/O+NGTtCjMgafh3u10+HUq/PFN6AsViOA/2DGbq1g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780406920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P08tVjnmst/pZjrQTwo0mQV2IfEKvS1wnFfV0CD4Fl8=;
	b=+O8zh2BsRk67GUtfUU5tc30YOLuv9Z/3ezDEQMs5mZBzLpy5yM07OFq24wIHVB+AKxzphX
	/LnyxgtEwwgbBTDw==
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
Subject: Re: [PATCH v7 013/120] x86/cpu: Use parsed CPUID(0x80000000)
Message-ID: <ah7ahOrmPfhX_7bT@lx-t490>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-14-darwi@linutronix.de>
 <ah2-WUDXHFfrDLaB@wieczorr-mobl1.localdomain>
 <20260602012205.GEah4wPes4qegK9T9K@fat_crate.local>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602012205.GEah4wPes4qegK9T9K@fat_crate.local>

On Mon, 01 Jun 2026, Borislav Petkov wrote:
>
> On Mon, Jun 01, 2026 at 07:34:03PM +0200, Maciej Wieczor-Retman wrote:
> > I think at this point in the series 'c' is not initialized if you follow:
> >
> > microcode_check()
> > 	-> store_cpu_caps()
> > 		-> get_cpu_cap()
>
> How do you mean?
>
> the el0 in get_cpu_cap() uses the already parsed during early boot leaf while
> microcode_check() is the late microcode loading path which happens when the
> admin sets it in motion.
>
> Or what am I missing?
>

He is correct.

    microcode_check(struct cpuinfo_x86 *prev_info) {
	struct cpuinfo_x86 curr_info;

	...
	store_cpu_caps(&curr_info);
    }

    store_cpu_caps(struct cpuinfo_x86 *curr_info) {
	// Unlike x86_capability[], the CPUID table contents are not copied
	memcpy(&curr_info->x86_capability, &boot_cpu_data.x86_capability, ...);

	get_cpu_cap(curr_info);
    }

    get_cpu_cap(struct cpuinfo_x86 *c) {
	...

	// Output extraction from an un-initialized stack space
	el0 = cpuid_leaf(c, 0x80000000);
    }

I'll fix it.

Thanks,
Ahmed
