Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27526344DBD
	for <x86-cpuid@lists.linux.dev>; Mon,  1 Jun 2026 22:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780354416; cv=none; b=kB72YYvhdof1UGmcyR/mS4VCpi/EcC0JeXEmMHgmCa4rzdZ1qMvDO/Uu7+1gWzwkH+Al0So9UitR8naR8sifL1/rJChySx+zVxz0VYVQOJbPLaeZqwSsWRi4A2SWxgc2P/ua0aV+OqP23N6q4+TXpuCY+CbN68QEeduUZ9dmyM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780354416; c=relaxed/simple;
	bh=p80AE89tOSAQR12mEuPF504FJegVzBCsoh30IAM9qNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=edKK9940XcLS1H5etu0K1RvynBbho0/7WMTHOshWG3CEzGosJfQrZfX5Jytyu8iDKUL8+bydMVaXCLbKveLqXpzXZmWfj7TKuxU50DZ88ORwpeWNQr3Z0q1/nNCinbZhUSJhj1DdUk+aie5nzfM98qkjg/B4Z41tYytQ3Rk+9mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=fail (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=UTnvIgt6 reason="signature verification failed"; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="UTnvIgt6"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id E1E3440E0200;
	Mon,  1 Jun 2026 22:53:32 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id bu_oHMJPTZRe; Mon,  1 Jun 2026 22:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1780354402; bh=s54v71eBI/7EDWxLpqFgVgqmpl04tMAj95Yn4fWEuDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UTnvIgt6+tHVvdgNhrIgsbymqujJwZKzHttQ4YBpvrJTERCbin2F1Kq+TSoyShZXK
	 4TEzxD60kE+w5VQhlmMXBSI1UF1dxIVS2oQ2x4SfUWLPAwiw/LrQwqSxjYl9ZkOSdg
	 9lVQcztZDe0eNmEtwKsGre5hibYwsf7EwT3Oh19vgL/hIgopvCIYfMTwamU4vJ4Lyz
	 WL2ACI+rCu8gYDLocvXtjbOSWh+0ZCtg1F5F6k+HQ/45t8nn60Aqx4aR8d5y0ooQnQ
	 QanWAdV6yYKWAIApkmcVTFQIYZLkmj8zLTAbs1znJ22YEOpDvmCQkGqvFFqETD9VYN
	 cu2P0n447TbL6MOayIOL/QmBSaQJqiTSsqr6ZOzw1aWJcxUFA5Eo3xXSircKCZRCjW
	 xu9nT1h/SOr0BTOBAEn76lElOMYl7nZuxE2B6r83Q8cD6OU9LRVyCvwO76bCr3DJrC
	 dbgz/fn1h7sy2PNjkxsaKa5jGRM9MdDnSti5qhHHYh+YeSW2iw6Accyq+FKv2viQVu
	 1kvK87nB8UHbT0fZbmN6x9tvHeZxPRVOQnt928ohPCkh0/7YD7Oh2pFS0G4Em5o0Gh
	 huo03dMva2Q64j3Kc8HAXDwDu6NPZ6KUf/j01aHobaUfwXzPuoYfNmZ5czvrAEDJq5
	 9XfVWWJrKGdmTxVn2RVTgPwQ=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 1428840E0140;
	Mon,  1 Jun 2026 22:53:08 +0000 (UTC)
Date: Mon, 1 Jun 2026 15:53:06 -0700
From: Borislav Petkov <bp@alien8.de>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
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
Subject: Re: [PATCH v7 004/120] x86/cpuid: Introduce <asm/cpuid/leaf_types.h>
Message-ID: <20260601225306.GDah4NUvJwaqQem4VQ@fat_crate.local>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-5-darwi@linutronix.de>
 <ah2WBnBkz8KQrph0@wieczorr-mobl1.localdomain>
 <20260601194150.GDah3gfjoIZIByCa3d@fat_crate.local>
 <ah3jPMYIxC1vsUUB@lx-t490>
 <20260601203452.GAah3s7FevsRDFT7rF@fat_crate.local>
 <ah34pi6j5HSMJdrL@lx-t490>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ah34pi6j5HSMJdrL@lx-t490>
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 01, 2026 at 11:24:54PM +0200, Ahmed S. Darwish wrote:
> Maciej should first send a patch to x86-cpuid-db.=C2=B9 Then the header
> generated by the tool can be submitted on top of tip:x86/cpu.
>=20
> This is for example how it was done in the merged commits:
>=20
>   49394b5af45c tools/x86/kcpuid: Update bitfields to x86-cpuid-db v2.4
>   300ba891418a tools/x86/kcpuid: Update bitfields to x86-cpuid-db v2.3
>   5e0c3c5e95f0 tools/x86/kcpuid: Update bitfields to x86-cpuid-db v2.2
>   ...
>=20
> One component of this work is that you and the other x86 maintainers wi=
ll
> enforce that "auto generated header" rule; unless something really urge=
nt
> pops up and common sense applies.
>=20
> But a single, yet unused, bitfield spelling mistak is not that urgent t=
o
> warrant breaking the rule from the get go.

I see two spelling mistakes and one in the comment.

Agreed with the rest in principle. Also, I'm fine with the patches going =
in
parallel to cpuid db and the kernel so that we don't have to unnecessaril=
y
sync there and either can be picked up independently.

And yes, the process is already documented at the top of leaf_types.h and
I need to make a mental note to myself that that is the flow with this he=
ader
now.

Thx.

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
