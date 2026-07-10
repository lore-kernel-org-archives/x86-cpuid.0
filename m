Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637C32641FC
	for <x86-cpuid@lists.linux.dev>; Fri, 10 Jul 2026 05:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783659714; cv=none; b=qMUGRael1fLp9JXZrAoODwqe/DA3IOLqlPnu7bqG9W16hd2cQVq4er02Yu/2cwCfraL/bI2LETqzWmA9GWupAsUh8bFmwkPyk79Rd8qNN5aKlCI+wMZig3w9kmD5ML1iCzNAYp+LqXQmkFTtZkT63vXPnVJiRaSk6sUIue7LX8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783659714; c=relaxed/simple;
	bh=VzQzKgw2OdV1x3SrK6PzLyUlRNsndUFdWAn5w6nQN6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uVJ5ZhAbANUuwy0DBVfM1rWfTwcZCB93ChvlKekHBCif7Db+I06BVnVS1y7f0UF8xu/AOrYVvuxwL2fQEZwRSD1qjlGUTUdBIYwjGmVJH5GQ7awQQHaRj7Ypr3+qPwkIp1MpQAFrRPIxejRJ16LfcVEem2TxNyxMBKmAu2hNSfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=G2GEIShO; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="G2GEIShO"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 3A0B940E00C0;
	Fri, 10 Jul 2026 05:01:50 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 3f7J3h--g9qi; Fri, 10 Jul 2026 05:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1783659686; bh=VCPIdlKMqhzcnqrbMe7zskldx8s5NBH6+OL32IlNz7I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G2GEIShOp7zB1KByZk0iuEpV2R8xKrHtQkIqi3GkEIHoFSd/5VbdXspbanwdRZJhr
	 3XqjLhcZEaxDP1IgRP9lw2v+3OGjYtpiEU1JAC1bMVNJkdQPvl2jlpHvggaj0Ztz8y
	 2Ca7nqv8wHhxP5kS4H3cMcv3ixJEOxxIZY3s8mMkhpX03t0RdUh1cYHQzj13YUywV5
	 Rjsv4QwtNVuHYfe9mFZ43PNOzAdS5qd7zOsrFvCsZaA/X4HKsYAA9gD7pbdQBF6IIg
	 r4kXdjVlCL3zdJp63iDRQ+as8YMagEeSExtKYxNnr+uJJq+z/UJtz1nd4A7FD9QsAf
	 +3b2DU9gvN2nHty5YsLmcyEeels40+R3EYeGEv4dwPb9kvj/G7W+Mr2xVigpE5aQVG
	 L6cy7l5dla9UcLICkcdk8rjE6HBLzFjGRyz+fKPbK11rl/tXvhI8VfCbDmq9+E49VA
	 5OEhv7qr4uwu3YCezopVZnASkW9V6ISW0lAwphZ9l8npAENd66y8BeSpnnO4tJm7F2
	 Cxi1DlRgX+JVd//0cERPxVc7sbntA0bhLqtBne4Yfs3lq0HULnN1L8yQRo7DnjBCqr
	 CqzWYNbErI1RjTF9HX8J/ALaY8L98DQrBSZLoTqYyPMtzybhZ7Qm7aq7RisU2ZYaTl
	 2Emw6zAfvZpjYcQFZOB/iNrs=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 1ADAD40E02B3;
	Fri, 10 Jul 2026 05:01:12 +0000 (UTC)
Date: Thu, 9 Jul 2026 22:01:09 -0700
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
Subject: Re: [PATCH v7 025/120] x86/cpuid: Parse CPUID(0x2)
Message-ID: <20260710050109.GBalB8lYXKUTBkef85@fat_crate.local>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-26-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260528153923.403473-26-darwi@linutronix.de>

On Thu, May 28, 2026 at 05:37:47PM +0200, Ahmed S. Darwish wrote:
> Parse CPUID(0x2).
> 
> Query it only for Intel, Centaur, and Zhaoxin, given that

"... because that information is only used in init_intel_cacheinfo() on those
vendors."

That's it. Short and human-readable.

> 
>     kernel/cpu/cacheinfo.c :: init_intel_cacheinfo()
> 
> is called by:
> 
>     kernel/cpu/intel.c		cpu_dev.c_x86_vendor = X86_VENDOR_INTEL
>     kernel/cpu/centaur.c	cpu_dev.c_x86_vendor = X86_VENDOR_CENTAUR
>     kernel/cpu/zhaoxin.c	cpu_dev.c_x86_vendor = X86_VENDOR_ZHAOXIN
> 
> At the CPUID tables, keep CPUID(0x2) marked as invalid if the whole leaf,
> or all of its output registers separately, were malformed.

Please, do not talk about *what* the patch is doing in the commit message
- that should be obvious from the diff itself. Rather, concentrate on the
*why* it needs to be done and why your patch exists.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
