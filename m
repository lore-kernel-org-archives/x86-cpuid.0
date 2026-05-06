Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17173317142
	for <x86-cpuid@lists.linux.dev>; Wed,  6 May 2026 22:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778105939; cv=none; b=h02Hf8qj3TX5bFP58OjdGdMz150MUs3MvIOYdUdgxxKi6tbashG/DFs/WALcQE4hMOAoyQtkIXsBrl3A3NUTNoIiOEEg/fsiEMkdnn/6Y6V5OUhD0Ur44s8oKv6S5VVUOpf6OMzpkhxCmotVjpHHBlV7bl64oZ9wzu1b3BVmbAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778105939; c=relaxed/simple;
	bh=QiM48CFfmwmoWguOTmIVULwr7N9OwL6oCqgGvrPhm0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bc23L5eeLR6EaBee/U6vy0Qouhy+OxuEMELoSCqvgQVbwATYGsqUu0IPS+Qk4FnIpk/oFefU2fpVGFg1hW7SscEhX9hoJKuDfLhvArqlmXsVSbLGowXBE+ArWi6MCOzPIVfVmJd1dYUgKQRfG9grbm6XR9gF4P9+mkrKOhRosc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=fail (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=B5UsaIuZ reason="signature verification failed"; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="B5UsaIuZ"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id F0E6140E01A9;
	Wed,  6 May 2026 22:18:54 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 3Q9vigw4Lt9V; Wed,  6 May 2026 22:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1778105924; bh=gjPgOwHuP5QZs8c7imrvN6BoEKmRxRRNS4DzDrlCruU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B5UsaIuZ850+/zcW3f1255NA3VRQYFqhdh6QdTTTOdLzCxryTVGxx90CbZb62GF1N
	 FpjU5Z83YYjaQk5AvADKH0L3Zn7sCcxhEkmNt+eekGU/PG+euLm3a0/HIU1RWDa/i/
	 FagPy9dTFj8bQhAFw1TUJIZhJZBk2U/kkbgmmbEigfr4SXRN/sUk8QQVtdr4Clo5tY
	 X0W3Jb3l06As+KJWv1/ioEgwzeBSJKMCH66pgrEDuhqZtNNEXOZl7/ipeRZe2/4Olt
	 au6ZFnoi5F0auJSfAOigPmysUQcViCBb+fns/Rl8r/ZP2h3PyL7G6TURQPaKPnjctW
	 i9X91/tTuPKe53kdePkd75skNr6cV7SHxm0oNGhMzd/QuEKCUAoAvB9aVR8/wllcOW
	 i4NFlHMBuDHBt/637PFkZiToKS70UpW53Ac1klJbvwfeD7WdLQ6PLt0xGkOJxYbJuu
	 9bTWwqmL3rd6LwbmsB1WQbcqoTE28PtygEm4QIB5kdM8kibyZayq4dfmWwMPui9l3/
	 l72pZDjUcGJQAL6EBKY7gJkyIHmSmxEmi9U1mG/acc5PbZIKjhOdC4WbBaWnJ/GsnV
	 Db2KsPO0Dm6xBMC8cgdbDTPjeSsSB8fWEI1EIR6fsZ9Z8dc7oSECXUbHBv8qP7K6vi
	 I0ag7ZVpkTTcPT6xiGrcEixs=
Received: from zn.tnic (pd953014d.dip0.t-ipconnect.de [217.83.1.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 9142340E01A1;
	Wed,  6 May 2026 22:18:29 +0000 (UTC)
Date: Thu, 7 May 2026 00:18:22 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
Cc: Christian Ludloff <ludloff@gmail.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Sean Christopherson <seanjc@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 00/90] x86: Introduce a centralized CPUID data model
Message-ID: <20260506221822.GGafu-Lnfw9I8PxOKQ@fat_crate.local>
References: <20260327021645.555257-1-darwi@linutronix.de>
 <20260327152354.GBacahCioljpw5QqUc@fat_crate.local>
 <acrBBFyU_vi4zFOx@lx-t490>
 <20260330230836.GLacsCdDkVu0H3XU4l@fat_crate.local>
 <adz3z_MaWJr_GOtc@lx-t490>
 <ae-uw9836AJScRsq@lx-t490>
 <20260505133350.GAafnxvtgFxJHth8WB@fat_crate.local>
 <20260505151242.GDafoI6oOOs9hknrrK@fat_crate.local>
 <CAKSQd8UvY2iLew9gFYEs0MCgPa9R8RiQLP+kJUb6Cw8BYo=yBA@mail.gmail.com>
 <afu5QIInX1POppSl@lx-t490>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <afu5QIInX1POppSl@lx-t490>
Content-Transfer-Encoding: quoted-printable

On Wed, May 06, 2026 at 11:57:20PM +0200, Ahmed S. Darwish wrote:
> > Second, the number of words reported in 0001h and 0002h
> > should be enumerated, in case the list grows, and so that a
> > program can tell between all-zero and not-present. (ECX>0
> > sub leaves, basically.)
> >
> > Since 0001h has already used up all four registers, it can't
> > report a max sub leaf in EAX =E2=80=93 so maybe e.g. 0000h EBX
> > has to do the job instead: it could do e.g. two byte fields, to
> > report the number of words instead, i.e. 0000h BL =3D> 0001h
> > words, and 0001h BH =3D> 0002h words. (Or wider fields... if
> > you expect more future growth for words.)
> >
>=20
> For both CPUID(0x4c780001) and CPUID(0x4c780002), I can still reserve
> their EAX for that.  Something like:
>=20
> <leaf id=3D"0x4c780001">
>   <subleaf id=3D"0">

Can we slow down here please?

If we're going to deal with maxleaves, then I'd say that ship has already
sailed looong time ago.

Because up until now there's no maxleaf for those Linux-defined words. So=
 you
*still* have to know which kernel you're looking at to know which words a=
re
defined, and which words are reserved zeros.

The only thing you have is the database we're building here.

And since it'll be append-only for the Linux leaves, if it is not in the
database, it does not exist.

If you want to use it and decypher feature words, you still need to know =
which
kernel we're talking about. Because cpufeatures.h has the number of
Linux-specific words which this particular kernel knows about.

And if we're going to differentiate between defined and reserved, then we=
 need
to save the kernel version from which onwards those bits actually have
a meaning.

And that would be ugly.

So if you see word X, bit Y set, then that is a synthetic word bit and it=
 is
enabled. If it is not set, it is not present or not enabled but again, wi=
thout
kernel version you don't know anyway.

Thx.

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
