Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067223B893B
	for <x86-cpuid@lists.linux.dev>; Mon, 30 Mar 2026 23:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774912143; cv=none; b=hNFWxX5Jk1E+8QHoyb0B+2UAmR5FNseWIxbWPUXb6HALVi2OceBJHE7sWZnjA78CVopw9P9X0ElUk4y96MzdcXTNmUU4HGxSxhJbrdL9UvNKD942zKjI0lqd1MJcpD7UZ/JSZzTApshn8EksINMeCzVqUnQG4gYrg4tkLWUHIZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774912143; c=relaxed/simple;
	bh=sFYOtuad1VVTxX74ZlIcI4qNRWgsF9DRE8wGpEj3IGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tpriEUWubDAu3GOK3L74UbYwvnucP37GSu6N82RBRyB12P6q2pV6FIPINoOURu1Tn3TOcRhgWLBwRamP2NSN/GT0JW5IUnNSsxBP43lF1m0dH1q1eT3C1Mjdlz1Q+Uecpn4raQGJjd+h+3j+wV/4ljBjshaGQB3e/BNvlsXt2oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=fail (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=LMTrp0c5 reason="signature verification failed"; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="LMTrp0c5"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 6AF4940E015B;
	Mon, 30 Mar 2026 23:08:55 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id m9Si9mqNDTzq; Mon, 30 Mar 2026 23:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1774912132; bh=LNLyhlbmqu0/V6D08kBVZ8JPwV4pIbVhyHjsWHUO2EU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LMTrp0c5MAlkQ8+T/NXBhqvaRxYRVTMpA2FjLZNeZrKmQGeeaDm2B3dP5X/RNpfRL
	 Xx2hcHqmP6Mh6XJJ9kchquYGsdv3i2bRSMRhMZbyPGvZl6xJLqkcian6bw2tMMloce
	 5GlhvpxXilZezJA3XMtXTYd8bvTPfm+Hg80IcrtJ9cV68UGI9mL/hoBcwQ3mmbAITL
	 WDjJkkQF5ZZYv4li6DjTQ+k2DwNG8R6l5kNxEFLcmTsDwwAtd0cLoCihwj7pXOD8zq
	 PP/9RquE7zWePOuvZQh/lCH2EDkhBr8Pzuw7oqfdjR1PHt4qpXijKlrFfDBi0MB0KS
	 Hgo+fPNJtpcVayu4MLBrozbEnAIWdL16qpBf0DU1rKhThc7HwTraW4M5n33DWkWtcy
	 63gtL6qI9xBj21tf9TgQENoyPsq2+dxc3yfL8Koen2kgagxYsJJo9JplkmPfKz2Cm6
	 SSBqlk0sRT+f5nbZlgmzUZeNREHpQUdaNIbb+o9ojJsBYqIbZpKMwObMKpHPVWGlSG
	 YQoxUtCYGDDrZhMzxu2CkVDXrGUfcf1l/9U4ygW8dPYQfcu4wq6IWVl1nq7idL7QuC
	 3FvytLR4jvlL8rV9dMZSnTsfjdlZswOqQX57/8DYBnpMqZ69kvxb+UeCzLntSu1BLY
	 jVjF+k/JcPKebmBdfNYE8fd8=
Received: from zn.tnic (p5de8e020.dip0.t-ipconnect.de [93.232.224.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id E884740E0299;
	Mon, 30 Mar 2026 23:08:36 +0000 (UTC)
Date: Tue, 31 Mar 2026 01:08:36 +0200
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
Message-ID: <20260330230836.GLacsCdDkVu0H3XU4l@fat_crate.local>
References: <20260327021645.555257-1-darwi@linutronix.de>
 <20260327152354.GBacahCioljpw5QqUc@fat_crate.local>
 <acrBBFyU_vi4zFOx@lx-t490>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <acrBBFyU_vi4zFOx@lx-t490>
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 08:29:24PM +0200, Ahmed S. Darwish wrote:
> There is an important difference with this series though: all hardware
> backed X86_FEATURE words do not consume extra space.  They are redirect=
ed,
> at compile-time, to their respective entries in the CPUID tables.
>=20
> It is the synthetic X86_FEATURE words which now consume extra space, as=
 a
> unique 4-byte entry in the CPUID tables is required for them.

Well, since the goal is to have *all* CPUID leaves available to the kerne=
l,
then we *technically* don't need the synthetic ones anymore with the exce=
ption
of a handful ones which we defined for ourselves, like X86_FEATURE_ALWAYS=
, for
example.

But *all* synthetic bits which have correspondence to real CPUID leaves -=
 and
they're synthetic because we wanted to save space... i.e., all those bits=
 in
arch/x86/kernel/cpu/scattered.c, they don't need synthetic flags anymore
because the corresponding full leafs (damn spelling of Bl=C3=A4tter eh!) =
are there.

Then, I'm thinking, we can reorder all the remaining really-synthetic one=
s
into the unique 4-byte entries and then not even expose them in any db an=
d not
make them available in anything because we will have to cast them in ston=
e
then.

But we don't have to - they're kernel-only and no one needs to know which=
 bits
they occupy.

Something to that effect I'd say...

But we'll get to it eventually.

Thx.

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
