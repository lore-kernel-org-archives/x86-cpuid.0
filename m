Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78855268690
	for <x86-cpuid@lists.linux.dev>; Sun,  5 Jul 2026 20:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783281819; cv=none; b=XIRQmw4KlkfH4GVK7WabVmnFK0lBB46/ajA9wArL1XFhdvDXKRUcHRUALptLBAl/F12fq502jGxQAex6nLxoOoO/wli+tJWI0JmmiYusn7cZDRlDeSYKGWdd7qaIBQwIfHYE+UE3bJWa/xn/81P01KwT/U+P7dIJRJnZCwtdHeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783281819; c=relaxed/simple;
	bh=+JaeIoAGPwRHUvj9aEmDhiyywEfrkr4JFQ+910V1qW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QhS3uC3ws0hKuhOMvgRwWEvZC2XnxOyzkfKMNI36k4VzxOCG1TwFmFMAweIdzK347RYjHRvt9gKM8UPacs90+FiJ80eDlAH+NlK9Xcq4h/+ZFwwcORPW6vJDzK06Pey/nBowRMEC/iUFlfinZiyA8Qqec2RvxPYkevM/dhKWqHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=e53qsxNI; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="e53qsxNI"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id D384F40E014C;
	Sun,  5 Jul 2026 20:03:28 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id EIK0propgg2V; Sun,  5 Jul 2026 20:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1783281797; bh=1W1jIrktJMr2Cm0ggdxh4ejHd7g5gBdND0RzV8X9FYw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e53qsxNIAhcZohzB02lpJa96Qz7frqOLRA8xROnZ+KcrLfrcxmPQrAFW9NMsbCnP3
	 Wcbti7xGtgAzdv+f0IraRfxxzhyqXi4KGHRq6oAF1kUC3YLIoxujmoHBlUzAi+sM7X
	 Iz2PJKSQMUwWX1auSu2d4uyS41v3vRLRWH+MwtsCOhtUodKPiYM0IC46erU5QNZ6Hp
	 ODsKYZJ9PzCkLln6s3y87rMS9VsNvf+PLR3sqGneHnzS+Wfd68eLVwuVxy7KWEq8Ph
	 jihWhyvN5LzAYSbZ9X3rvq12L0iBsi0wT78Po2TMyfNeA4DrSNiTjlcXIEd07CjbJm
	 Elw/KoKIpivkAVlU0hcj9TyCJFXzLfBzxulQa/+WkeHaG4LSdg7ucQoUVSNtENlUQS
	 Gg9JZD546S1K4usk5lCNOgoMUETIepzWHmB5uDn0ThCmXobCpZ+drB9xJbitcr1NnF
	 14te4euTqUNn2hYYwNULsWIq/m04JuyDWDFqiRIU9I5sxiiupBGKkMgJ0tFbeTo0b2
	 7O2pSOnw4NC/Z8nQAXHCvlAMxcVef2aX45HGzev5HzNXO/UWxaYkBmOZvlFlKvQCCr
	 GpIeb+8ajb3TI0aHt+pNfUKUoN6EZrEJuvEpKvOIT/Km3QTDn9KwwCIj69mASHS6iK
	 8YGpK1EeTWZ4p0sbS6RxK7Uo=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 30FE240E0163;
	Sun,  5 Jul 2026 20:03:04 +0000 (UTC)
Date: Sun, 5 Jul 2026 13:03:00 -0700
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
Subject: Re: [PATCH v7 024/120] x86/cpu/zhaoxin: Use parsed CPUID(0xc0000001)
Message-ID: <20260705200300.GHakq4dDB9ewifSnSy@fat_crate.local>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-25-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260528153923.403473-25-darwi@linutronix.de>

On Thu, May 28, 2026 at 05:37:46PM +0200, Ahmed S. Darwish wrote:
> Use parsed CPUID(0xc0000001).
> 
> Beside the CPUID parser centralization benefits, this allows using the
> auto-generated x86-cpuid-db data types, and their full C99 bitfields,
> instead of doing ugly bitwise operations on the CPUID output.
> 
> Keep the x86_capability[] CPUID(0xc0000001).EDX assignment.  It will be
> removed once X86_FEATURE translation is integrated into the CPUID model.
> 
> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
> ---
>  arch/x86/kernel/cpu/zhaoxin.c | 19 +++++--------------
>  1 file changed, 5 insertions(+), 14 deletions(-)

Same review notes as about the previous patch.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
