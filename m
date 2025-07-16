Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD5F2798EA
	for <x86-cpuid@lists.linux.dev>; Wed, 16 Jul 2025 17:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752686291; cv=none; b=SteI50HqCA3anaRmK1239NFqxj8tItz8wL09fA6JWJxPPWm/kSajWYxpxZNKEV4xG7jDA9wQ6NafScioYK6cTcZ/zQLdwzZK/h401YN9Ejkx0M6L3V9ACian/OiJCMYa+6s/Pi2oyq0gyWylgvZgVpqKF+v5K+/Z34eTYOPVtCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752686291; c=relaxed/simple;
	bh=cAoVPxkt/dinsa6nJwl+96VpyIGHPL7qFsPziq3Z1r8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hTJFR3XuNM5gt21NEjBsW1YsKx6XeyfwpDLg4r4XYbBTXYqKNha4Jz9wI8zL0nZ92mg5MGbymqteoKefrWb1PAE973cJy5MyxN5kAVoAHAQFL+13T1cTzkima6Bq5dSew1og47cmjDPz78j9rqWEwr9aCowVL1sML7+9bt+Qkcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=KWp0HYhC; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fonCkGI1; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KWp0HYhC";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fonCkGI1"
Date: Wed, 16 Jul 2025 19:17:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1752686273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PFNvBmuWcrSDG+7MTp9BSMX1nNEj1yPghZI+Kgwr7fA=;
	b=KWp0HYhCCmSRIhzS/mgd4Hb433TYSiUd6hjruBiZsfBNH3O3ldqZr77YBWJP5hAv/sQzmL
	ovTa9Edy9+4EbPkne0Gbr8fy6hGbL1EtUHuxw7VI/I0DO8hukJ7jWC7EivCBwACs3svwS4
	ecYtf+Nc0XmRPVzk58bpSpu48TS4fB0dHwxyUgS8w6CWychMXieomcJzhT8QjOY53jowZj
	Nkrr6UjO31SsdiT4ILEGb9CWVWDrTqaNx5c4XZo8EFBDzbk+fSZ+q+p5b9Ck9FKac4/tSM
	fl6Pyy/nSIYEqUT3cnOJBCA8tDx4Zgz2/sPot3ztPteE7JTf7k6r8QhwDis6hA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1752686273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PFNvBmuWcrSDG+7MTp9BSMX1nNEj1yPghZI+Kgwr7fA=;
	b=fonCkGI1Tk1whOZH+s5kMMPnYyht+a62wgXi4OeuKLujHGLgy5giIr7DgOA8HvPfYzse1J
	SR9QOeTWDObeCVCA==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Cc: John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 6/6] x86/cpu: <asm/processor.h>: Do not include CPUID
 API header
Message-ID: <aHfevkaADwRv0Fzb@lx-t490>
References: <20250709203033.90125-7-darwi@linutronix.de>
 <202507150403.hKKg9xjJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202507150403.hKKg9xjJ-lkp@intel.com>

Hi!

On Tue, 15 Jul 2025, kernel test robot wrote:
>
> All errors:
>
>    drivers/char/agp/efficeon-agp.c: ...
>

Sorry, my "i386 compilation testing" was to do an allyesconfig, disable
CONFIG_64BIT, then compile…

This — now I embarrasingly discover — does not enable the kconfig options
that depend on X86_32=y; e.g., the CONFIG_AGP_EFFICEON case above.

It seems that, kinda like cross compilation, an "ARCH=i386" environment
variable should do the job well with allyesconfig and the rest.

I'll make sure that all future CPUID work passes that step before sending
it mainline.

Thanks a lot,

--
Ahmed S. Darwish
Linutronix GmbH
