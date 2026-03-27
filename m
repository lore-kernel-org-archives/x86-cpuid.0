Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB23330648
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 15:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774625064; cv=none; b=mAtK5nQjqm83qlzsSHx50N+htuxfC6AbJR2z4Cs6fCxsBLTuPcWZBCuiidI2d/6qUqSlO4bvABfalEv3o9p2JstORX5a6m552Rr/lwyYTCUldKT2T9YsnO869bfTImL5K3objLfiQ2G3L727jgYm0UJJ9vhzgkCujM1a9dPOGZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774625064; c=relaxed/simple;
	bh=gQvGS7Emz8t9UjGod38gEmSdIqVAY8rFzyDOmkZwN7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dz6GnTrgEEflxttg+oYiwG+Ml1MGz4i4Zvfet3eps1NqPy/65NkLg6B8FevJWnx3hYAOGCjQguk2Ct3hq1XJKkQe0VZR8AfXkDt5vVhyADBR5zRpSZkavie2jU2xUwNBgQntEnPfzTas7jOGGUuAmHIsee3Orsx6Qjhqd2udqDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=DUkmnhQJ; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="DUkmnhQJ"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 1E19140E015C;
	Fri, 27 Mar 2026 15:24:19 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id iN9-TM-yWxa8; Fri, 27 Mar 2026 15:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1774625055; bh=27rjkGuMfvAkfWQr9bRbkYfQCNtKqnppxvqq+HMVVrk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DUkmnhQJjONGtl7KE5OcBqmT+fFQU3pO3KIUnT2zyeK7h/9SGYnlmG0dk5Rk96eYZ
	 V8Loq1n8dhq2qEb+knWau3GImfyeExp2piA2sahMkKqLZWy7RQEwRklvuqykxFP07x
	 rIdrXO0zM7IZSp04kTp8b7TcXEq+1qumcyUhxFJo/HF3bCqrey0Tt6x3y02SkXofZi
	 9/qiGfO/t+9vI530m0LwTQxiWRtz8n2nx7UlRfX4R78DakCIyiO81Ym4S6w2ywXCWf
	 FPQ5zIZDUY52RgZiSdatLfqJsNetNPtLU/6MdDrnRZDpbuJ6uEv88DBPDE+02l0Vnh
	 pUUrdgtbVeE9A0Y4WnNvhOS3jfwhqWEM9annHcXyE7epTJqf4PNiYQB59alboC6PEw
	 rFtQskPs7638v6omN0EsKGeVmHLYmXFTsyOMwCepvZsJHq9uBk+nwhuAFX3vG50a1F
	 ox7AV9L2U27jBSQi0waasHwOea/LxirrU5yj/UxbUxRyU+gxmxbL3leU70r2+XAIH3
	 sFlAjOvADqRZA23nvuRGwL/KxTk/C1/8CosBKl3EVA5RNaUQKUcFt1aT+CkcwhsL+O
	 FnQJAFhtObVEbLPc1rlRC3D0NKESb+dUnqNDXgfw4YDGTJqMv43bdoYqMR34ZMh/wp
	 VTP/tQZaOnD6C24ul1WpLWAY=
Received: from zn.tnic (p5de8e020.dip0.t-ipconnect.de [93.232.224.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 9472240E00DE;
	Fri, 27 Mar 2026 15:24:00 +0000 (UTC)
Date: Fri, 27 Mar 2026 16:23:54 +0100
From: Borislav Petkov <bp@alien8.de>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Sean Christopherson <seanjc@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Christian Ludloff <ludloff@gmail.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 00/90] x86: Introduce a centralized CPUID data model
Message-ID: <20260327152354.GBacahCioljpw5QqUc@fat_crate.local>
References: <20260327021645.555257-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>

On Fri, Mar 27, 2026 at 03:15:14AM +0100, Ahmed S. Darwish wrote:
> For the Linux-synthetic feature words, only x86_capability[] defines them
> as they have no hardware backing.  Unify their handling by defining them in
> x86-cpuid-db as a synthetic CPUID leaf:
> 
> <leaf id="0x4c780001">
>   <desc>Linux-defined synthetic feature flags</desc>

Hmm, this makes me wonder: we have cases where we take a x86_capability
element which mirrors a real CPUID reg and then turn it into a synthetic word
because we end up using only a handful of the real bits and there's no need to
have almost unused word.

Example:

ddde4abaa0ec ("x86/cpufeatures: Make X86_FEATURE leaf 17 Linux-specific")

I guess I'll see what happens when I reach the end of the patchset - I'm just
pointing this out now, before I forget so that we don't shoot ourselves in the
foot ABI-wise and for no good reason.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
