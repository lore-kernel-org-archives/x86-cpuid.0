Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1321D5174
	for <x86-cpuid@lists.linux.dev>; Wed,  3 Jun 2026 00:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780446721; cv=none; b=PZaAMFLwB2ivYjh+4WWzjAA6RM1gTlTfBs0xDl/T2iP4lenuVUyMR7U12ITJnK3s5t9M4sC72YxzT5ZOp7wRYJ8L9HFt3edL+bsoamCnY1IUNsRtk8PXJGaT64SRTWtZv/CRTu+HUwXq4sRyf46I+WuEjCRN0DznW2YA7XibFzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780446721; c=relaxed/simple;
	bh=p/FkUJ6b5FzMNKwdbkmGDQFIENWQvLzvmoB1gXulfuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EL0DIFec0YHGIi1ZYlX4KiZKWNpZnk7BERtMm6I6T4ST7Uv8EQvbnOhw2M0FhccHWQHNRjkjmUkArW12xa6UDx+Dg554mKgtDBkqGH+grukBXzC2Q8qnARsX7mPPdYtAxrLY8EvZ/IdyDmS6T2kl/IunXpOdLmqMCh0ATUY3+Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=GxnZTbKc; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="GxnZTbKc"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 2B0B740E01B5;
	Wed,  3 Jun 2026 00:31:57 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id xjMEEDxklCZV; Wed,  3 Jun 2026 00:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1780446706; bh=ddI9zIDSQR2gU2Hj0/mpA2UB69wsa4vxrW0sGl4Olps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GxnZTbKcJiSXJRs20HaWmqzE3LFWf7bPa8t5oTMoeGdopzvcTz3QG8oMOJBQdT7/7
	 2yuhSsxaRigiLuP06/En3p9r6Zjx9upjvjhq+4mMQIBzN469qdRjRPZIaIro5NauGt
	 BnJt5Vc8yRTPxesfXodb4sHhifbQAXfapV6kolXUWD8BPaMIT3Vf6NccetaWBsSuOw
	 rQE1vCTFQ1rOtyWo1PsBIM7G6u0sUuAZBzYaGqrqO3Sk5nNT/+7XDh4+5kGEN86/jF
	 HNNeA5lstGk/bwAK6mDEVKCuOwHXwpIYsWoB3tSoAWfn7TwLU05IIMBNo6nhSpdnMi
	 tP2A8iMz8/JW8n3dITMSk6ZClB98M22tq/NGcuqvlKotfbKRUJeJp7yq3xmcY0ZC2i
	 6J4TwXdlOn2wylqiuP1+Uab5Ofawuw2x3LaEogGhFyuVpqduZ9ilG78DFJ6DRvR94h
	 OsyuXJd7PdcIahUJEXJ7iKjafX9jm3gHajr6vN8PwWPmTWZxOmkeJRDY9HCQoLQmi0
	 4JVm9T5UDB0kN3c3P+lubEzIymOaxwKi32f+vyA8vzAXnfH1zXZtYtS0XztHQWSkcf
	 Cf8hQ/+raLPhi2sEyHmHgoZ9jdHLyEiJ8yaCx6rkbNZIYR9QSJgqCe7WUXMsUH5FnK
	 GEgJQOpUxmqrIseuIZKH7mqA=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 3CE6140E00B8;
	Wed,  3 Jun 2026 00:31:33 +0000 (UTC)
Date: Tue, 2 Jun 2026 17:31:29 -0700
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
Message-ID: <20260603003129.GCah914Tc9sEpO4Nxl@fat_crate.local>
References: <20260528153923.403473-5-darwi@linutronix.de>
 <ah2WBnBkz8KQrph0@wieczorr-mobl1.localdomain>
 <20260601194150.GDah3gfjoIZIByCa3d@fat_crate.local>
 <ah3jPMYIxC1vsUUB@lx-t490>
 <20260601203452.GAah3s7FevsRDFT7rF@fat_crate.local>
 <ah34pi6j5HSMJdrL@lx-t490>
 <20260601225306.GDah4NUvJwaqQem4VQ@fat_crate.local>
 <ah7_wPJ8_FGLOwZd@wieczorr-mobl1.localdomain>
 <20260602174746.GJah8XQvEJo9UKru1l@fat_crate.local>
 <ah9H2hxkMPMeuF-o@lx-t490>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ah9H2hxkMPMeuF-o@lx-t490>

On Tue, Jun 02, 2026 at 11:15:06PM +0200, Ahmed S. Darwish wrote:
> On Tue, 02 Jun 2026, Borislav Petkov wrote:
> >
> > Well, I think it would be best if in such cases we do both: send it against
> > x86-cpuid-db and then generate the kernel patch from it. So that we don't lose
> > time.
> >
> > I wouldn't want for 7.2 to release with those typos in a user-visible header.
> > I mean, there's time until 7.2 releases but it would be good to send a fixed
> > and complete pull request to Linus already in 2-3 weeks time.
> 
> I've pushed an x86-cpuid-db release about an hour after receiving Maciej's
> patch.  And that was mostly because of adding more fixes in the same spirit
> as Maciej's findings.
> 
> So I would suggest a "wait and see" approach.  I don't think that the
> frequency of adding new bits or fixes to the database will be that high.
> 
> There is also a git-describe tag on top of leaf_types.h and kcpuid.csv.
> The idea was to encourage people that submitted kernel patches touching
> these files are either from a pushed x86-cpuid-db release or at least from
> its tip branch.
> 
> I'm definitely biased here, but I'm optimistic that this can smoothly work
> out.  In the end, the x86 maintainers still hold all the keys here, in the
> sense that there is no risk of slowing down anything, especially in
> emergency cases (say a new HW vulnerability.)

My only goal is to have an official release with all known issues addressed
and not release something which is clearly wrong and luserspace starts
depending on it and then we'll have to support it forever.

And then we start sending fixes back'n'forth.

We can wait and see all we want but those headers in the kernel better be
fixed properly. How we update the database in the background is at our leisure
and there we can take our time.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
