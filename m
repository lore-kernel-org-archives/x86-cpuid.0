Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE0C3F58EA
	for <x86-cpuid@lists.linux.dev>; Tue,  2 Jun 2026 17:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780420397; cv=none; b=GZ3N4A+nPFBGEmiNECpIzH0Cw9TRZZljyWxf5jifVaCBfzk5v+p4OeXU3iNRRBSsikB3ATA+1YgPz7RsQS8T5cojVI9ve5ffKRkvYaZrxI4AHgG2ofTdR9KcN5k+TVjhNTO/Tk4CE339AFWBwrCl5dW5TQ+xBsmP/7Gpdk2Re2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780420397; c=relaxed/simple;
	bh=S5VCnpZOHjkiktE/4aLbhVKdN9jFmYmW7FIpY8NQ+lE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jPVNO71SaoxWvAtT2Pxb9nkWvez0lMFYwBHD5iNcc5IzgNdmMQ72JWDa0TRrxvYmZT5qsp0X6IG5HEUaZInY4F3IEclQBheRuYhzmKrbpzJxLMNrfuOJQTnx4EPhbC2aukjGqW3vMCf0s/Nvb6wXW7Y5JT597se914usNgl0RZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=gH8FzGKd; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="gH8FzGKd"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 143F340E00BA;
	Tue,  2 Jun 2026 17:13:14 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Ivlf5j_-6uP3; Tue,  2 Jun 2026 17:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1780420384; bh=nM4WWVffb5Y/8SzN2XfwUxbKKHJYY6RkzyAenUGfzfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gH8FzGKdFFazh9uq/ayZZcMpA5bMEOlKX3y6GZ+hvwPT7M98WmTgTDMQFk1sK3zWE
	 xN2SglWjujPWpRHBoy1qtFzYHfXJ1lH5zfJjwPJklNyrK8kyBX9+dzaEzxHj5M5D18
	 G0J0m36gVk/ktOPziSW+9X9TMuQORZlr84J45Eb5q4UCOYCg0M+Vxjd4rn8MFwXrno
	 udbMGo9RNXCSxca5lEAI3qZ2DK86zqG/XfuLs0N7fySVRs4dBOQSneMQ1ivRyMWaAy
	 HCrDljK3QZjaVWeiINyhv87+HKoIJZItKiOieQa/u9Wku8qjgGLAluAMI7+H2K8KFd
	 HNSwH0aodm9u5w0ynB7NfFmckxwF3g4Nm8WgkxWth176m0MuhX836T532vR9Y76rYQ
	 IHLdMYypoRVM/TulTu1Rx/UH29GWdO0Z+FoAl13Fhs6KoG/Zl8vAvufeYqK2TJ4jQ7
	 Ris9AHinfCDU56qjNHhbyu3xzQjt86/duv32k/O0e9Ugc5d1S//HAI8JnCHND075QD
	 iMjb/t/R+xJC50JySsWE3+kYpUep9+fGAkPb6Il7wVV0S+EwV0CDDG77yoZspRUw/u
	 bB1qFa4P38mJY9jCdvHjBK/dMS/vDXXUGL84Wwn19Sc6olRov9nxw6TI+XZMfs4+ke
	 7VynDUQKBbBLH3djY3kHNuDg=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 6C32F40E0140;
	Tue,  2 Jun 2026 17:12:50 +0000 (UTC)
Date: Tue, 2 Jun 2026 10:12:47 -0700
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
Subject: Re: [PATCH v7 012/120] x86/cpuid: Parse CPUID(0x80000000)
Message-ID: <20260602171247.GIah8PD66whqK3VbsM@fat_crate.local>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-13-darwi@linutronix.de>
 <20260601222239.GBah4GL777WIRuj-Wk@fat_crate.local>
 <ah7dUQnB-MpbW5IA@lx-t490>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ah7dUQnB-MpbW5IA@lx-t490>

On Tue, Jun 02, 2026 at 03:40:33PM +0200, Ahmed S. Darwish wrote:
> > Why are those here?
> >
> > insert_tag: WARNING: Unknown tag: [References: 67ad24e6d39c ("- pre5:    - Rasmus Andersen: add proper...")  # Historical git], ignoring it...
> > insert_tag: WARNING: Unknown tag: [References: 8a50e5135af0 ("x86-32: Use symbolic constants, safer CPUID when enabling EFER.NX")], ignoring it...
> >
> 
> I thought "References:" is one of the official tags; will remove it.

It ain't here:

Documentation/process/maintainer-tip.rst

But if you think there's relevant information in those tags, simply write it
out in normal text and explain it. The tagging infrastructure triggers a lot
of functionality downstream and in stable so better not to use it if we simply
want to point to a commit.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
