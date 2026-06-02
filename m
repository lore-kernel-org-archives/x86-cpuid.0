Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528483DA5B9
	for <x86-cpuid@lists.linux.dev>; Tue,  2 Jun 2026 17:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780422499; cv=none; b=P4g/pNFTDqmkkTvJwaOiQoEDkY60j8YNpacuaMcuOx43ka2M3huBdSh36TZD1zCVDBh/DH087dcZna8Wh7l7tAloKIlazoimCXxWow67F4p4dUWpw++Nt4Zj6cSesGgtfWV2i57bzoB+R32oh4pUhHrtKKc5VrrxqP5Tbt2O65c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780422499; c=relaxed/simple;
	bh=jM7rlWiIUbz7DWvUnYpcoGz+G0Lrad6shoHrlq09hgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=smzxtCsTQt7aDjtGQOUYrUR0UUDnMPuMjURWpPT8V2eLgqRVw6YhWewJd0TYVWq8CJSsHtGAh/l/HYRwiz/VPAxm0nU5MMWXhoJKrcO14bjBgZGKZZLLJBcZ6Cch7nOJg4nwCQBWCSAiO8Dy3EPNnVTEKLnsyp2YsONvxjNGIvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=GG5Jr1gk; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="GG5Jr1gk"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 4075D40E0140;
	Tue,  2 Jun 2026 17:48:16 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id wHk0aMxAClds; Tue,  2 Jun 2026 17:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1780422489; bh=Z1QJoUZZ4okIkNA61rwqJq1CpQee87hGnYJFln7iNVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GG5Jr1gkmNkwV5P2LZqwqkKUkJ2FE7ooEDlb6RqiZVik9AfCIaUXuAFBNUd6bLvnH
	 dbYi/bQYowGX5x5hJyOEDrSP8IhCiWdx0f8PLNDKkd7OBgyhOq3r+SeroS7uVca2rT
	 Dh0i7i1NTPcAJg9jIvjuIIdOJRnLySTPKXrslurmp4eOtqEZyjdo21tQ9G9YUbOYZ/
	 gvaDHcDI5Lw+YItEIskrJ1GfZOwNa/Y7KWNxmjIrTq18rVgyYCcVtdjw2VEql8bUYg
	 XD6K52/Ne7Rx1Es3Wal0GW7mBd0OcaXMWqwODgCt+ogCA7xUL0wWYfJv8zpyoBFfLS
	 k55t4NgUcidCC5aSLARx1HMWZYEK/OdeEq2aLCRosuyDbOrGUfB6y6NOUFaG/k1csj
	 hIU5R+VQZxrcBHwOCEH/qVe4DbSNBh88WoN/SSLHup9/sa/dv853bBV+LLDyNRTo9/
	 90HW1eH2GcS1hxx1x5LUa4mvHz7HpxWLe25eYKassZ9xE498lQ9iqAtwCXRS0Vnh+w
	 XoXNIX7/EcwSvq9PudLuCae79fwTx+n35fCDWbXvUhSlEg4VBjmzpx1jrHBmO0Jaic
	 FvK7leY/RSZ3kYAZ4i+V8BlNUTRnTDpP6JFj6dea4Z3tNBWLagSuvbD/YLjQMwoM9j
	 ZivTs+tAI5H6ztc7gYMT/4ZQ=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E710740E00BA;
	Tue,  2 Jun 2026 17:47:55 +0000 (UTC)
Date: Tue, 2 Jun 2026 10:47:46 -0700
From: Borislav Petkov <bp@alien8.de>
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: "Ahmed S. Darwish" <darwi@linutronix.de>,
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
Message-ID: <20260602174746.GJah8XQvEJo9UKru1l@fat_crate.local>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-5-darwi@linutronix.de>
 <ah2WBnBkz8KQrph0@wieczorr-mobl1.localdomain>
 <20260601194150.GDah3gfjoIZIByCa3d@fat_crate.local>
 <ah3jPMYIxC1vsUUB@lx-t490>
 <20260601203452.GAah3s7FevsRDFT7rF@fat_crate.local>
 <ah34pi6j5HSMJdrL@lx-t490>
 <20260601225306.GDah4NUvJwaqQem4VQ@fat_crate.local>
 <ah7_wPJ8_FGLOwZd@wieczorr-mobl1.localdomain>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ah7_wPJ8_FGLOwZd@wieczorr-mobl1.localdomain>

On Tue, Jun 02, 2026 at 06:12:47PM +0200, Maciej Wieczor-Retman wrote:
> In that case I'll send the patch only to x86-cpuid-db.

Well, I think it would be best if in such cases we do both: send it against
x86-cpuid-db and then generate the kernel patch from it. So that we don't lose
time.

I wouldn't want for 7.2 to release with those typos in a user-visible header.
I mean, there's time until 7.2 releases but it would be good to send a fixed
and complete pull request to Linus already in 2-3 weeks time.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
