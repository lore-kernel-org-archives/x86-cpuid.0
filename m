Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A2A16F27F
	for <x86-cpuid@lists.linux.dev>; Wed, 24 Jun 2026 23:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782343987; cv=none; b=KZSBAG8w2jlagwB+ibvKt1hhbUFnwLeOINNyHSUu2yG8B4M/8QxVE0tyiq5EO5N06LKHRY/+0kNMn0KO6a8Ph6VZQvKXIRgOpPyxfutG6LgaQHRwm2Lt9P/lkuJR6bLUwfdm/GL5kvRWENgbZ5/LGhRAcWzSeHkDuOq/v8WJxTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782343987; c=relaxed/simple;
	bh=OhaCODGBvcnl5OokoxDXN0NIPbbympfuJXfAfZgND5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KciA+irieniETojq30tHZBXGcklI4wijh9jVPLL0+qK87HIKNwWPWSTrqoSpkeKNsT2KPAd4+OhkHjmHOoC4DfYtCvTlmwUbuOqPxuHriWeGxcClIl4WbAXvnBl4Ycborg5eKnCfdOSCd/F4QM44EAfiAauQR9Lq5hxCwza2hHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=YFh1uqwY; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="YFh1uqwY"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 8943E40E00BF;
	Wed, 24 Jun 2026 23:33:04 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id W6ihbIJrdwfN; Wed, 24 Jun 2026 23:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1782343974; bh=LuYNM+8XF+jsNzumDmqYKP5AM2XPri0rL+xbQK1UTPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YFh1uqwYfmsh/XlowfilELhcKfBQOiwqv9dfp33QW5ItQjhuDmB10DO8GDrjYr0C3
	 DKVzYfFJ3mctqiPd3vWH5zBBVj4MR4IEKTKbOwoZLT2S4n+Kiu8eRR6gRbeh/Be2+H
	 Wbh+6vXPx9I6AJgMvHZEEEDJheiXcHbnoxhaXIP3nYW9d4iZ3IjxQ4KmHD1iGD82AF
	 qZiEvdBia04EJoFp5BfLiGvi621AfDNwv01VAtV6c/3FI8AH3vEFo984LuSGPC9hzc
	 bmNIenBLt6wrUYO0afhquoLzQiGxI9dDK01oFCZm3DYJVO8xx72SjjG2989XN9xFkp
	 CtO7pcNumzWKuwgLK04VmwC5OSBSoDqmfGszKqHKEDkwzmSHaR3X2H9FIzAV5YGufV
	 trDKr9915MhDgI3RIQ6ecbTd93dtTKawjcsHmPVyB//J5I9ypfuvqfjacVAOIWxUX8
	 dCz5exHroSNIXhr/+IBB4t1cQE3ClUWLCUo2i5FzfzSvYqF6zexppKaS+68O1tPTuN
	 rpYqNtAleAxwsQqxq7TeteC/Zg4rSN0IeD8turEJrXTvOGKBq/ybK+nfWWmvQBAbe0
	 s4beysTw7bmg1kTkni4TI6HeaVLCkAJeb8UpZA1pmgiYW3+mXJS+mBW7ktCeX8ljqi
	 QzJJqbq/edMGEzMVeUCfCpy0=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 354B640E0031;
	Wed, 24 Jun 2026 23:32:41 +0000 (UTC)
Date: Wed, 24 Jun 2026 16:32:38 -0700
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
Subject: Re: [PATCH v7 022/120] x86/cpu/transmeta: Refactor CPU information
 printing
Message-ID: <20260624233238.GCajxpFilFVCmwsfFT@fat_crate.local>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-23-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260528153923.403473-23-darwi@linutronix.de>

On Thu, May 28, 2026 at 05:37:44PM +0200, Ahmed S. Darwish wrote:
> Now that the Transmeta init code has been converted to the CPUID API,
> refactor it into two separate functions for readability.

I don't think this is the right order - first you refactor, then you convert
it.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
