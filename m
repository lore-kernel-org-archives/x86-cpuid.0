Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A514D3BCD20
	for <x86-cpuid@lists.linux.dev>; Wed,  5 Aug 2026 15:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785942167; cv=none; b=IaPah5MABx84vaVGvppqfI9AvpKMVrgoDkyhAfddwgcaldO0qwupOLqNvsc6cp3gCSLV6w5CDKDcIQDviph+VHZLxxHViMHGpgF1sJRo21oBuHIIcf8B5wt7bWR1i6hmXTCbvaRk3F/rGBM+AwIpeRczAltTJpNa3Fj4KfNUtaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785942167; c=relaxed/simple;
	bh=CJy4uZSFHbmSqgn3FuQYLpmuSE6ZTDq3aWwoWXLtxPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QcLOPO7/koDvcIhftjxsivVl2taP4OoDjolv+CCR+GlZjNBLZxPJ1oE9yHdYobcHQCF3t2pXz0DxGOQCzULkN0z/gWGX9Gf1MBQ2ENj6OePdQr+0i24V9IkcR7CBkBpe48ft/Kj4rzMuunuo6K3ZuU3TtTjTLWka69qsXBuinJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=BGn0M3zb; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="BGn0M3zb"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id CE65840E014A;
	Wed,  5 Aug 2026 15:02:40 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id A2pRcgreUoGy; Wed,  5 Aug 2026 15:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1785942150; bh=WCdhLxqH+b3GfNYrZpHbEYRSerboSgYwmKK3ADlB7/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BGn0M3zbz+/EhNyD3sLbGvHhDYO/AvzytnD3Sh9ChqhVzaUFyRf6BlumK8It01H+l
	 9DKmo5ey4gvEBRqrB5w6pBJcWKRaKnHlJ+3+DgtHk8cfvaPTBBmFErxHSHPM8P+zuM
	 qUQJPqZQbYFjtfwa03RxQC/Qt23ENkR8JrD1LD1Hrpx6Ieg7oB8EFh8Ucib12ourVP
	 QSyn/i9jhCk8dh2zSFy5vnsxjzkqB5W6hrfusLdrBuAWxnboyxo9JjdYSS/1dwZZJP
	 lPAO4CrRKsl4v/9LMt8L1cwjWL242ShFnQXl+EJHNh5xGzFWDFm3YHcgo0HBkG2fOo
	 P/cwAMl5rdfXCof8/l8g4kIWWHWK53OzpOX2iMstNq4TeboryUsgw8Oht5iFDZ3axA
	 jKOkg1ced8YPY94ZeG1j+0HHHt7d4ycD4efeM2k98p5LHsqMkgmS0Xanh2E5ZfNHUg
	 TqED6M+VyoDKcPUG5njSByk/e0Ci297xLV1HRZeKrU62MZXqOnQP63QV9zR4WF9/k3
	 E/vLJ19bZP1HG5tj2oNnT1uY0wWU5LVw4hhG/RF/Jg84390ioBahESn5j3hU1Frtv8
	 LI6Ul6ejGR6zDUPS1e6ZW0wvLbP9sMIBRFEFBwIQTmt022yIpWe9ns4g1cse9BBeKP
	 ZsLYACPTB+0Q3M7eg7gYG/sM=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 40EE440E016E;
	Wed,  5 Aug 2026 15:02:17 +0000 (UTC)
Date: Wed, 5 Aug 2026 08:02:14 -0700
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
Message-ID: <20260805150214.GAanNQdl7kNjKX-n9D@fat_crate.local>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-13-darwi@linutronix.de>
 <20260805025323.GCanKlox0DF7Gwhpf1@fat_crate.local>
 <anLukFZerFLqFEmd@lx-t490>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <anLukFZerFLqFEmd@lx-t490>

On Wed, Aug 05, 2026 at 10:04:32AM +0200, Ahmed S. Darwish wrote:
> Yup.

Ok, pushed out. I'll stop adding more patches for this round unless you want
me to. :)

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
