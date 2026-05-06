Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650263E63B8
	for <x86-cpuid@lists.linux.dev>; Wed,  6 May 2026 08:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778057492; cv=none; b=fR1ezSzXZDzRJHQLtBEqZcK1BJwrcOtMv02w5AOUR7xFJeE5RpsDz09ZWSFRvUWiojWgHoYr2dyQNxm7/v902cjqORM87MqG6sqVJvoAMJE5XdV7p33PgQWVezzX5d2ggkMCXW/ZNXVFlMSa8wn7iczUKRhaP2uqH9zFjpc1D/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778057492; c=relaxed/simple;
	bh=34NL9+WYknx6SPiZB4b1D+bpktKWSHzsf2VKnhExbJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YSc4S6BjcW9DCnmxXCP2EmuTHAFWEimTjga86vUwoFvcxXUJyPBmvLbk8CHDdUb0xiAE3HOES1DRIWdxntwAlapSyJx9JsarF6L4eRT6XBaZ0ulr3AQxUF0Q2lSAm2DfYh9QzFKjxAz8ybasghxFDil9ZczDgv+IWptzq+05y3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=fail (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=YOj/YukK reason="signature verification failed"; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="YOj/YukK"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id C8E0240E019B;
	Wed,  6 May 2026 08:51:22 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id enHJam_bhpxH; Wed,  6 May 2026 08:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1778057471; bh=TODc5+S1vVZhdQjWwsZaLBQl8ibQKUUlOlPMvHgdrNg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YOj/YukKVEzGgBJJUUKwo1eg+To1WPdjLTVoyXuf5UaSwOW2RSt2/y8jX6xhNFxMH
	 9skF3hw2oS2mTEMCmXVZAuJmcYC6F6fqS+c4hP1QtNnBVs8RpwXsbSACuvhI3DAw5k
	 XjjY95n1cAkEzdsCJyAgQ0mpRbn4r5Rfz/+BgGJM3IfdGv8/0PrD4blHDD63aGd7TY
	 4eexEVlPh45F5Hj3XXQ3meHcZSqPvAzVfpat6imP6IMee54p/xKoqJ0x15ovMtvjrG
	 vfauYAsXiDcHT4OtC593QLlvGUUWksJcWvFX8ixatURlUI8QH+akZPWJakG9cs4nF5
	 HNrQpUE7fmLF8RqbCChl9Pwgoz9ZcDB2M3a6YU78OwMryIbTkQ58qrUw9aisz0Qn96
	 7q5sRpgQsGD8xRvIx+OUzw7TYVoqbV0VXgrmxDHXhF6qmQK9nFZ9aKw2w/QDt8jmt3
	 kvEQIGyRYKXWkzuoer55LLNxKXFmLy5ZfolZeMMMfKtJpkGVua1JQG8yYnJ2kZgqZO
	 YE337T9n19//1ekwiyKIwsvcMa7r3/xbiSafK9C1TO71oBc95kLtdmhJCAyRY5lsZh
	 IMdyFbT8pGtLwpGHeNtswjWHRFLwOv/ak0goJnpfdv5mSl1+y5m0l6rVd7LMwpuabg
	 +fKMyTwCspFQ0SiBdmq593oI=
Received: from zn.tnic (pd953014d.dip0.t-ipconnect.de [217.83.1.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 8AF0040E0140;
	Wed,  6 May 2026 08:50:56 +0000 (UTC)
Date: Wed, 6 May 2026 10:50:49 +0200
From: Borislav Petkov <bp@alien8.de>
To: Christian Ludloff <ludloff@gmail.com>
Cc: "Ahmed S. Darwish" <darwi@linutronix.de>,
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
Message-ID: <20260506085049.GAafsA6dyeWjCr4wOE@fat_crate.local>
References: <20260327021645.555257-1-darwi@linutronix.de>
 <20260327152354.GBacahCioljpw5QqUc@fat_crate.local>
 <acrBBFyU_vi4zFOx@lx-t490>
 <20260330230836.GLacsCdDkVu0H3XU4l@fat_crate.local>
 <adz3z_MaWJr_GOtc@lx-t490>
 <ae-uw9836AJScRsq@lx-t490>
 <20260505133350.GAafnxvtgFxJHth8WB@fat_crate.local>
 <20260505151242.GDafoI6oOOs9hknrrK@fat_crate.local>
 <CAKSQd8UvY2iLew9gFYEs0MCgPa9R8RiQLP+kJUb6Cw8BYo=yBA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKSQd8UvY2iLew9gFYEs0MCgPa9R8RiQLP+kJUb6Cw8BYo=yBA@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable

On Tue, May 05, 2026 at 12:11:50PM -0700, Christian Ludloff wrote:
> First, 4C78_0000 EAX should report the max 4C78 leaf, in
> case there is future expansion. (CPUID does always grow.)

Makes sense to me. That'll tell people up to where we have those defined.

> Second, the number of words reported in 0001h and 0002h
> should be enumerated, in case the list grows, and so that a
> program can tell between all-zero and not-present. (ECX>0
> sub leaves, basically.)

That's good point. So we have now:

words 3, 7, 8, 11, 17, 21

which are Linux-defined. You've mapped them to E[ABCD]X regs. Sure.

We could define subleafs and keep the main function number 4C78_0001 same=
.
Sure.

And 0002 is for Linux bug flags then.

That keeps the feature flags where they belong: word 1 is for Linux synth=
etic
feature bits and word 2 is for Linux bug flags.  Makes sense.

> Since 0001h has already used up all four registers, it can't
> report a max sub leaf in EAX =E2=80=93 so maybe e.g. 0000h EBX
> has to do the job instead: it could do e.g. two byte fields, to
> report the number of words instead, i.e. 0000h BL =3D> 0001h
> words, and 0001h BH =3D> 0002h words. (Or wider fields... if
> you expect more future growth for words.)

Do we care?

Those leafs are purely for documentation and no CPUID execution would eve=
r
return them... (famous last words :)).

> That said, it would be good to get the initial set of commits
> done so that db updates can start to flow in, to catch up...

Yah, that's why we're talking about them now, before stuff is cast in sto=
ne.

I didn't even know you've documented them on sandpile.org before yesterda=
y and
was under the assumption that no one cares about those leafs outside of t=
he
kernel. As it should be.

Goes to show once again how we should be very very careful what we're
exporting outside of the kernel.

Thx.

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
