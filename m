Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D1D327BF8
	for <x86-cpuid@lists.linux.dev>; Tue,  2 Jun 2026 01:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780363362; cv=none; b=tJivY+di/pvpBLZpNxKNgFhuYbcBKqX0XpmjDdCrMx3VEe5K8dUOaxuO9ed8UDIXmpocVxz8IvhjzwqggMOw9SJ10Uijw64NSi4WKsikbFb260INtcDvnfkh6XpiCuFw96W5T9qsFTWmaZiOtAooJSfpx/z4ZwpgqwEJjjCU54M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780363362; c=relaxed/simple;
	bh=NwxHVworxmDdN/TmWVDOqU/eY7UO8ja5GxwFls8xAEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K8swjuT6nHCZk0PJoy8Jj4vjZHjYSlL8Hnn78tA4HFL+OUctJ98xPXWZTSWAlM48LPODrcFYgznOvwlGSRtNAJwC4ys6bkYZZWQhyePy7ijPMKb7BMItBMkJQpZhUDKTAL9Kwh/aYQniUJ7FXJDxM2AW1juoQ9cG0RcknzcGZLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=cvL88meR; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="cvL88meR"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id BCF4140E01F9;
	Tue,  2 Jun 2026 01:22:38 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id yxUOj0uTfIJt; Tue,  2 Jun 2026 01:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1780363348; bh=GzCMhRmHsBbDXEu5PVhr+LaZo1SYXmke/UY33zax3Wg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cvL88meRGInkzDuftwGu+5Nolc0ou4VauEFLCZuRSIEgPa10clhs8ANbpz0Lk7ESW
	 3PSVmo3oWMm+PmFbFu4qCt6jFKDRVRpG2YLzP432xlVv1RBW7+lRf7tNKZLN98OLj0
	 WdhTrvcmvlzvhsKtZiPl1SlEXlKPznRkBCluQ1bktdtjLafwfaIXmq+o8f0IRp8SBE
	 TCbf0GqMt7uGZzs9n4cBF5bGoPCHuNokaaCbiNoao555xc5UcnI5HjQIJu2bRIrVrq
	 c/KL/bR5ALHzttV2iideCdAQCaRXS3noewFhzZOt28bQ+anVAM45mhh92An0m/tUvX
	 tEIs09e7WxDo++n3xQnLM2Fq+hMtr1ZQGwMy/S3EDRN7JDvAEoZI9s3HoPt1R55EuW
	 sJ6A+hBcj9UngWgv9C8G3/OBJ4Yl/okYpaVUmWMYqPNRzrazqIk9xtJoVVaccOljyO
	 IoN06FLCzEIcS9zs9jLfx1mZJ204YEV/qiIl3SSX4lhvAghCmUgHqOC3Fximj6UyTo
	 caG6jIYDnkNXSiVw8/Xm0B17LlJAzuEXLRYiH+MALLVbcoHRZQh7BUQRh4O61pjc+c
	 amX4hJ/GZPlZfn0QtXcuzXul6ZEpc1Y8x8LMiaiDFcz3BAd9jiy2EEQv6HXderMEdq
	 wwdKwBcUdMPU8NLGl8FpkvOk=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 2476E40E00BA;
	Tue,  2 Jun 2026 01:22:15 +0000 (UTC)
Date: Mon, 1 Jun 2026 18:22:05 -0700
From: Borislav Petkov <bp@alien8.de>
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: "Ahmed S. Darwish" <darwi@linutronix.de>,
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
Message-ID: <20260602012205.GEah4wPes4qegK9T9K@fat_crate.local>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-14-darwi@linutronix.de>
 <ah2-WUDXHFfrDLaB@wieczorr-mobl1.localdomain>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ah2-WUDXHFfrDLaB@wieczorr-mobl1.localdomain>

On Mon, Jun 01, 2026 at 07:34:03PM +0200, Maciej Wieczor-Retman wrote:
> I think at this point in the series 'c' is not initialized if you follow:
> 
> microcode_check()
> 	-> store_cpu_caps()
> 		-> get_cpu_cap()

How do you mean?

the el0 in get_cpu_cap() uses the already parsed during early boot leaf while
microcode_check() is the late microcode loading path which happens when the
admin sets it in motion.

Or what am I missing?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
