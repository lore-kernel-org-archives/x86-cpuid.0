Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC323403FD
	for <x86-cpuid@lists.linux.dev>; Mon,  8 Jun 2026 23:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780959924; cv=none; b=UXxmbb/AT9C6PaY2QkuwxD1O2w1N9P9iQNjnWWN5TTPctQUXEB9olPkOeJe2HAissdu6JZHe/GJsUlG1fi/bDKgZtCpYcG+3TKNDOUCEOEB4l9f5I+xg89m/TebRPmeBh+nGQrd4+15Uo6EfRHlBxBKP9dAGhCT6ybYe5SCfN1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780959924; c=relaxed/simple;
	bh=GhornehyKCe+ST+dczZSebNd1Hq8FHLaW6L936onfEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BxyjQNAnF6pff1HgBePhq8Ea6X75p6LascUKmxnS9LMnLbBwA7Pc860TIwarc2PY5X05XaTVJC3gqBAeEMe2ypHXUj504ooCiwxfyFh8LJq82Ml2q7BOWHrYxXKhGwZb+UGGiH/qgRzOEpLCgM8ay8HehVGYNUMDCyurUQWcGZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=fail (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=e5VswHbT reason="signature verification failed"; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="e5VswHbT"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id D355A40E015B;
	Mon,  8 Jun 2026 23:05:19 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id f7tadakHsK10; Mon,  8 Jun 2026 23:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1780959909; bh=h3bG+5lwBw5yD3JqeTjFEPFaJltMsCwaDLu4Be+hx4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e5VswHbT5/F8DJDzVugwbmRVwc7KZ+XhItmgJOxqfbfuYn8X4vPYyXAov3n7xwCdB
	 /W9t15QTKixGIKovEEdsp4vMVVz+gy1MnUdmovyatauEqhEUSmp4gZv56Sy5gGzspM
	 XtnNhDGukprj/P8/7XuHQvxjU7fGNBLtGwt9YsO8J/QPigJ4bjNhtKp+ukpVKGNTcS
	 LvTHRL500rBSK9B+yWvhNynEV073qj6OFUhCqWS2savj4rDrG4lmGRumbg2zFUkOWv
	 cu32ZTsV4IQu4oFLe2j0MY8bqsOQFBigNtVkmRXVjBGNw06PIf51Xp2pI3Nux1yL2x
	 u8S68f1DMOI2IlUqjJEYt9hz8SrRzOS5vwwhMOqv7BcDgMp0wT5QpSighIn1wpTvwE
	 r1n07KcBPi+f/Rbi5kiEgwjICw4QXc8eC5lZE29E7aneULO137S/JGwL+i9GX924Uk
	 N0aEuJYqrptPeFaEz9OhAjLUvKvw5n5IBVrHGmtqCBvcAhGDSx1NVawQoA9pBhAX7G
	 X3efdgyixIJq7ayQ3fWu1RgXvRtuRcsbX1B8+Tx+ouxQlMyoVWLlXEUEcK/IuUikoo
	 Tp0iAgjpMhYhgNLlxR1ZeQ8wyq6XScvY7p77YOtiwdEH4pA6Ho0QK5XtAQ9fobrwqf
	 rfP8pcLbq2i1s2FBpm1CJXa8=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 3540440E01A8;
	Mon,  8 Jun 2026 23:04:56 +0000 (UTC)
Date: Mon, 8 Jun 2026 16:04:53 -0700
From: Borislav Petkov <bp@alien8.de>
To: Christian Ludloff <ludloff@gmail.com>
Cc: "Ahmed S. Darwish" <darwi@linutronix.de>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 004/120] x86/cpuid: Introduce <asm/cpuid/leaf_types.h>
Message-ID: <20260608230453.GFaidKlWGicZCGjSmN@fat_crate.local>
References: <20260601203452.GAah3s7FevsRDFT7rF@fat_crate.local>
 <ah34pi6j5HSMJdrL@lx-t490>
 <20260601225306.GDah4NUvJwaqQem4VQ@fat_crate.local>
 <ah7_wPJ8_FGLOwZd@wieczorr-mobl1.localdomain>
 <20260602174746.GJah8XQvEJo9UKru1l@fat_crate.local>
 <ah9H2hxkMPMeuF-o@lx-t490>
 <20260603003129.GCah914Tc9sEpO4Nxl@fat_crate.local>
 <aiZjpPCTsz4m-1O3@lx-t490>
 <20260608144920.GBaibWcLl3BUAPL8XW@fat_crate.local>
 <CAKSQd8W5060knJMy1eQeNCWzAo-A8V3bLqgdRZBgKc-QYT6E5A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKSQd8W5060knJMy1eQeNCWzAo-A8V3bLqgdRZBgKc-QYT6E5A@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 08, 2026 at 02:30:22PM -0700, Christian Ludloff wrote:
> Embrace that chase of completeness and correctness =E2=80=93 "perfect i=
s
> the enemy of good".

Oh sure. I'm far from chasing perfect. Except if it is ussues we know abo=
ut,
we should expedite them ASAP so that they're addressed quickly.

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
