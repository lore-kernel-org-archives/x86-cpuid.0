Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393F53EFFBD
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 16:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779987022; cv=none; b=nA7WKdoWa8spzmMJe7IhY2uOLKipnVFZt2i2k6iGPfh3dLQUFVCRE0zY5uDEBDxX3KSKSzxtPg/mk9S816Zkg/bvLMIB34nBWQfhXphe+aiJfrsiEw4dR2L0t83WWcwYdEVfd4S0Z51MSAGwoRWwW8eaPwzmoXuVbJub1ZNST5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779987022; c=relaxed/simple;
	bh=8bxcDtd0pTlefunMhX4V3bn+aXTItb98Wu+6jm6PNL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gKmj8R3A74e4xOhoEI7mi6588bU///lKdys95I4kxiGYwfxDpL8OtUnDO0HM0jfl5ZswZ0InEQPw666bQQIFa8pS0qKZ/55aULJ8RyVdIrsZdtoadKRTwT24pgdhnHOtJNaRstrn/4mCyVBtrqR68qc26RndOSpslmQDspeoZK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=gXTmWqlZ; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="gXTmWqlZ"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 1C7E240E016D;
	Thu, 28 May 2026 16:50:18 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id xDzvqiF1yJl9; Thu, 28 May 2026 16:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1779987008; bh=36jBsJjSuTgZX4ZDzdXGr+k5R7+P7uIUHSnz066H/x0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gXTmWqlZZRjfOkgXKeEJWuJDtewxJSZLW9uubNmasaM17w6ycrWi9X/kahcKZojj6
	 y1dIYCeEjJU9nFyxbrAP/x9Gy3ZhCwhmg+KmzzEgBV7zoPrl02YzeJ2LzESklepO+1
	 wP/kH4G+j3zUuQh5JIYXO/Yqmw0Z1VcfxunVjMRlnNOWHX4ctGKV9iyPHMelPf2z7u
	 3d2wBWfaRql+xZFbcOfQTHqs/rEHIAac56uKnZQaHqpXEUy8/vCMto71tCJyx1Yx0C
	 bwhy0/P5TcGGFQvDxjMyacu+xxbC/jAZbwUPF9hI7jre/oAOLcZTpgaebyul4zcIYG
	 KiINHM2+yIOHuvyMc9J138ynU48D2E01yPAeLG31OjGUpVLD1ejuJQCNi8hjfIQYXH
	 ON8CQq0FvDKnKwNLlYLvH4KsQR0o2OZkssjdAPC97kAOlhdmhtFOezNFigGeswLuDn
	 PL/BFOKAZjIW8+1bBRNSnkDU0FwG/mrORO0LQ+7qfVkz8yz5ZmowouoknR4ihC4EnI
	 92p+3/sKJcaYWwumSNRem/5QsRtdmgjZniYbav1gwShk47hkEp8FNQ4OyDysyKkHGU
	 k0zRVHmy0F++/vW8H/xXb4CB+TwtTzWqMVOhzvbnd7IUkXW6EZzrw4kVYraj0wFBVi
	 kWLylYhFhDxtFkfJ0H7nu0OA=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00:b8a3:f58e:8829:9ca6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 8F2CC40E0031;
	Thu, 28 May 2026 16:49:54 +0000 (UTC)
Date: Thu, 28 May 2026 09:49:45 -0700
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
Message-ID: <20260528164945.GCahhyKYNsDo3upTKT@fat_crate.local>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-8-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260528153923.403473-8-darwi@linutronix.de>

On Thu, May 28, 2026 at 05:37:29PM +0200, Ahmed S. Darwish wrote:
> Force-enabling Centaur/Zhaoxin CPU features through MSR writes leads to the
> CPUID(0xc0000001) EDX feature flags getting changed.
> 
> Rescan CPUID(0xc0000001) in that case.

Where is the new pass - cpuid_scan_cpu() or so - scan that leaf so that you
need to rescan it here?

AFAICT, the old code scans it here for the first time.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
