Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BD93128BE
	for <x86-cpuid@lists.linux.dev>; Wed, 17 Jun 2026 04:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781671314; cv=none; b=P57qocP8LsQ167mOV2at5U8TlIL+YcdR1G/MBd0K3fqb9jtXkjvNtDxB6NPtz4VzDLR5inUIEAFvIxo4Bx4hvD+cPuYyapMbADbxiAgs9oatPj85w85tCy63+byrEqZMiYRGUag/48Li1kfvxOUe0lgtdejCtLvEYQsRl+c5o/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781671314; c=relaxed/simple;
	bh=9DpktzrpCpbWyPjEhyaitIbQlGO0hTzOcK2e0GeLGlU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QFpKikeIGTiDpumv/0xOwhkLjPUR6y3pHYbRqQIVINqDNXB0f8vMFcv7G8Ol1M8HCluGhxG9ut20bn+DhX53DzG9XoBCF1eOQwPR9vICgskOoy2VtWqrXcSKF0L3O4w/e8c46NgezW4w+qB9MT6Pp2Hw8ECxI7DgbkyMybPB024=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=ZKrgAHMP; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="ZKrgAHMP"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id E492640E00BF;
	Wed, 17 Jun 2026 04:41:49 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id DbbXDZ0xG5f7; Wed, 17 Jun 2026 04:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1781671299; bh=Dtq+F/gPs1dMECh2r7xvrBDbvyx79cOnR2K8d8ZgSwY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZKrgAHMPpuvihP8RO63iOopqvWsCQKFBhfX9qnE/i4DT9S5PAlk+3mHr8t5GVZS88
	 1ahrbn+mU38dAzDMnv3/UkSPAyFNGpCb3u3K5OgZnkcRbaCAm1Wf8J64f/D9Bzsvkf
	 le2xb3ekDZipYa20fjKbJekGQybCX+MXi8LslyPa+fzVyvEIUT4QmO02LHX5xwWllq
	 r5s/GSNIU8jyq7ywOtLaTAfbiREotMooAQ+DDCmBivSYteTgbnZNOkf0MgzOuk1PgY
	 LlaGEtJBzg2WUQ1eBnXTGkC00EozD/biCdPTDxGgaC2t0mcIdvpaxjhDz2Upate/k+
	 8wrZkzdPbdljORZre1E09HXzxRXlQJDind1IGcbI8Zm0Gfw2DEa+6JP+le/dGJfLuT
	 oQVxp2xIEUcrmVFYhX4Mr4Cm1ObodK6lgvuSBqlIO041bPMYqaxDKY5p0G/0IKPGty
	 JYp6nTtEM8eBSdQj2W0CQDSwR4BqSBgbwv6Jm7EmyYvOl2/luIbma9v51/6NAK746W
	 8P1ir0DaBC+SWWcKRXGJdKhM4pUo+LjNGLGYwJJyu9YuXyvBZaUYhggJa/aMlLYz6W
	 HdKCICPzSIW3jmND5cUVnmfvy9fl4AyPpd/s9DZMz0j9Gszp19hrINF6oB5hBMrgsg
	 BR5zl8zT3+ApjB3HH/WyYzKU=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 4594A40E0140;
	Wed, 17 Jun 2026 04:41:26 +0000 (UTC)
Date: Tue, 16 Jun 2026 21:41:23 -0700
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
Subject: Re: [PATCH v7 017/120] x86/cpuid: Introduce a parser debugfs
 interface
Message-ID: <20260617044123.GBajIlc_E_bvkArzS4@fat_crate.local>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-18-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260528153923.403473-18-darwi@linutronix.de>

On Thu, May 28, 2026 at 05:37:39PM +0200, Ahmed S. Darwish wrote:
> Introduce the debugfs files "x86/cpuid/[0-ncpus]" to dump each CPU's cached
> CPUID table.

Except that debugfs *can* become an ABI if something ends up using it, despite
all of my WTFs recently. So I think this patch belongs out-of-tree, to be
applied only when we want to dump stuff but not have it in-tree casually...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
