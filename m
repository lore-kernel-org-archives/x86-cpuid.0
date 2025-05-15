Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF8D25D917
	for <x86-cpuid@lists.linux.dev>; Thu, 15 May 2025 18:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747333757; cv=none; b=MeX8gssrYO5j1e14GtcBmZ4DOZGX+P38sjx4aXpfy8ANqsY44Vow9dWIUQi/s+2ZF0tAIW5Nb40YrAaQIGAb6wFPk3wTHIvqXHtSvF7U9K1dWRVdsHtCyF5KwaBCAa66fsVP8+yHafXnhI6AAwsX4J0WuGw0+6S4X3vpWnsV63U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747333757; c=relaxed/simple;
	bh=005V1DnsI9qlRExZs5lNJ+THFIVv++44qnw0+WY3jis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t+kK/9s5vbOvS29yStECEGEw25QEcjwr6kbCMMhgZGDc09E4O4fXz31B/EEIqqiHtLGZ8wkW6ADQCPgjd3VV2EjYvtX9whg4X13IDEv5E0WxiDyPvjB5irUvSlf1tVN+iG33aOJva8MRs8m5/tzBnLJiJe72DkhJ9/WM5nswKOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=s0bgzWeA; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zyNoS4PZ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="s0bgzWeA";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zyNoS4PZ"
Date: Thu, 15 May 2025 20:29:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747333752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=005V1DnsI9qlRExZs5lNJ+THFIVv++44qnw0+WY3jis=;
	b=s0bgzWeAkttlp+ZFUWnbW+XzonbeYCB2sR0OuAmpICl9IiklKI3lEy/M800poV6p+SK67u
	9CFRQPITTNCt5PBM3f5lNiSM/Q9tOUBtwlbPOPxdVPYVhB62pqmD1FAXweNgzCdUOqy8qr
	MoaNOXlIAZhnsYMgCzDSjY/5zmsiNzWYK+oQ24/il8pig7mwIAA4niupaA4XIiPEWJrKdP
	UCaWNxtLDoSCR7HLMVTX4Q8Ww0v7zrJ+YJIsYKHePvFmaKjWxRw1QKbO+Gs91r9JwqnmaG
	STA3KsduHhmNHDQGbuqz8qFcfjvTcWn13obxPQiuIA1KmW5c9yLHmXRDQvqMRQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747333752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=005V1DnsI9qlRExZs5lNJ+THFIVv++44qnw0+WY3jis=;
	b=zyNoS4PZfJSg9w5EVwVBgCogDgBXqg7CnXTOuRc9TuTM6i6yOIYAwCI+1HV1vo3V6Y9Vqm
	2UTNrOZLmlVOCrDg==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Ingo Molnar <mingo@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 2/9] x86/cpuid: Set <asm/cpuid/api.h> as the main
 CPUID header
Message-ID: <aCYyd1ss7c67Ms1P@lx-t490>
References: <20250508150240.172915-1-darwi@linutronix.de>
 <20250508150240.172915-3-darwi@linutronix.de>
 <aCYVlLgDNE4fs3yU@gmail.com>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCYVlLgDNE4fs3yU@gmail.com>

On Thu, 15 May 2025, Ingo Molnar wrote:
>
> Note that in the tip:x86/core commit I've applied today I've delayed
> this removal of <asm/cpuid.h>, in case there's something in -next that
> started using it. I've adjusted the changelog accordingly.
>
> We can remove it later on, shortly after -rc1 or so.
>

Yup, thanks a lot.
