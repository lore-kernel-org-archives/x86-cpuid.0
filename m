Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE48D3ECBF9
	for <x86-cpuid@lists.linux.dev>; Wed, 13 May 2026 17:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778693956; cv=none; b=uujeV/mJr3LKKyQFmhHkPGf3mvgS5AAnakshAmE1DtvtpnEeN10PS72D5vj4lnHKcW8DXY4tbtYF/UdaYEmU6bHgZbrMc5l2Z9slhsNVkwAym62fRhZ1OIMEZW1MKrEWtPoGr5QOoi+TIbFXSiLlA1v2kO+qgGAywnKG+XBVhuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778693956; c=relaxed/simple;
	bh=6URQ7Ufe2dbTGOPS3QaVBZrDEkAp4Jt05D+0cJuI744=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bJrY8CK5o2B0fda9apnuS5DgTaH21Ygx+SRAbHwiXkCOG76c8sf8yuAYgd3jvouHzY3S0irLDWAsjiAiqyD4QBUUeYSzdezHX5nc8GUsOzUau1lvorxkhDp5RhrRSWiweHVy0ZVSc/MBa47YhZsxSxmPpc4EhFnbPbI8fNf6M7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=MC48tk0Y; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="MC48tk0Y"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 984CB40E01A1;
	Wed, 13 May 2026 17:39:13 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 8qN29dT2UXpR; Wed, 13 May 2026 17:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1778693943; bh=bwFLRs6xGxqy1dtfN2cTv6yTIyT6TRac6yLqZtyM6G4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MC48tk0YHry3u89Pk+eEoiK7Z3fvBkiXzhf7CDWBDqpHz5Md1IA8FTplAOq3BiyFI
	 36r8Pc6UxbHz0cQrjT+xWFHLAtxglNAKSuuS4hNYCVjr7h+YLr3VpFoGoEGSeBqhMH
	 6lV+id6Wew7/uvuR8hn/VOkH4NMNRFI4kwTLWUkWvQ9mXWKBiq/AJQ/mA5q8v7N3it
	 4RLnkiZ/3SbX84oKRMWqXNNFyDVkwrPo5qtu5T7uP1yK8u9AvgD97VdMzsUK1PINJI
	 J1dVY//jZhvXNGKF3hVv8CN9cppfy4iYETlqNaGQYqq4svnaQSeY5bHbKOBLgdg43U
	 hkXz1tCsmX2UpNeWRVSMhQ5x/Os8anz2ydVAYoFEkKsR40nnj0TEbAZ9VH5y8HCrxM
	 8kvnunnUWh+KLh/yZIRjrqr5mN0tpXOMeU4ACW2P5imcibpl1788iLWMAUZuTMEF0l
	 LagYhSF3hc+ysu58tu2CpkKy3zDStWaoaSZcE5Kby1+Qt4+IslQogNWv3bbXCYD50h
	 yUcmFFKHxIYfkdfUX2XAID2yqCiN88XwpNf0oFJLv5oEnezM4yiq03sZcSTv8Gd9yo
	 jjnkGV57UJdoDoaJkkHoKrOlNqKdiV2RCoO0+TGUBhsjzVNi6HWq0OLW3ApJkJ4GLW
	 pVZBP1dMk95kTKnZkExsWhmE=
Received: from zn.tnic (pd953014d.dip0.t-ipconnect.de [217.83.1.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 7C31A40E00BA;
	Wed, 13 May 2026 17:38:48 +0000 (UTC)
Date: Wed, 13 May 2026 19:38:42 +0200
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
Subject: Re: [PATCH v6 10/90] x86/cpu: Rescan CPUID table after disabling PSN
Message-ID: <20260513173842.GJagS3InAztdvoiPGl@fat_crate.local>
References: <20260327021645.555257-1-darwi@linutronix.de>
 <20260327021645.555257-11-darwi@linutronix.de>
 <20260511200032.GAagI1YMP51EzCo7dn@fat_crate.local>
 <agLS2Y7smYRHyiHf@lx-t490>
 <20260512143412.GDagM6ZLBpvt6X3jzq@fat_crate.local>
 <20260513152742.GDagSYbheCBWwNeVj-@fat_crate.local>
 <agShjbCo_HSs9YOf@lx-t490>
 <20260513165128.GFagSsEPFCogQu7n5t@fat_crate.local>
 <agS0A2pRhz_qCPce@lx-t490>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <agS0A2pRhz_qCPce@lx-t490>

On Wed, May 13, 2026 at 07:25:23PM +0200, Ahmed S. Darwish wrote:
> If we can track the clear_cpu_cap() bits above, then AFAIK a reliable
> solution would be to just re-initialize the whole CPUID table whole sale
> and then invoke apply_forced_caps().

Maybe... later...

Right now the *only* thing we wanna do *first* is the conversion. Which is
a huuge undertaking in itself.

So please no more unrelated changes and "it would be good to do this and
that." That can be done later.

If we find a bug while doing so then it is very likely an existing bug which
we'll fix immeditely and continue with the conversion.

Once everything has been converted and the dust settles, *then* w can do
improvements ontop.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
