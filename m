Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D23F37B01A
	for <x86-cpuid@lists.linux.dev>; Wed, 10 Jun 2026 19:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781121437; cv=none; b=JuyKscOGcE0ntIbXIGn5PGtOUE2OpQB3dvNXqNsZVeC4KZHUoPO/D2JKYPaY1aoqfamErICLNXgoi0TL86HWP1r3msegIGA/Dnz/XfxE8nfSEyWdnylhDOXpz4xKgZnFlN2UtzTv4a8vx/Lr685Y8HicgKGOA1h7o/NkAm9wJjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781121437; c=relaxed/simple;
	bh=e6rol5tW24Rty5OFyJ4hH/5TN3B9oOiy28HuOLnN9kA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MkAl2qmTOeLSDwJZTfdvuEhtw7Bg0o1eucrhlighhPQxWO164r06jBvd6u77S5/TpehQRVRueQMdFt/TPBw0Dv48F0i/pGPIhgsGpTAw3wK81aDh1w4WEND1Fu/4K34KUDLmMUfIjg/8gF/fj5OdaF0nNJzt+xMCS9UCd4UJbq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=faP+DIaE; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="faP+DIaE"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id D5DFC40E0215;
	Wed, 10 Jun 2026 19:57:12 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id hrRMKsI-YYB2; Wed, 10 Jun 2026 19:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1781121421; bh=UbYVgvwYq9mqQpEIlbviRcvdHiRPDQuMjCbeu0l3+ws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=faP+DIaEFKKgoizs78GqvVTQMKfJdF5RKHEWic8kTiXqDBdF6x+n6c4SPnAAHas8F
	 ucWtt3fzZfZG7NZGJJELJzCwqCqILpVmKL7Tsa0s26dRUmvIrrMjier3MbjhkfguNV
	 70/ER45yKAHkEn7LcEXBUfKJ1mrkI4S/SpCrL1KE6IhMdFvgamwulRLxiJ8SROpR5t
	 iNKeAHja90NURUX39N7VVxMjKAuBtZf0+0vP/U3LclgxK3Mbey8wxbIBgD0m11ehAz
	 uQa+2wC40TtoXROH4KA/lQXaikD/TCQe9vX86dvQreFb1cHQ59l68QwzrWqDnyk+Uz
	 MIFWmtnefXwyjsKtg6yk5dOXBJF3mwnL4hedywbG+BReCCAy4mInxqVevQeDJeH0k9
	 77Z8qS7HsyuoAbXrPC4JJszUCqWX5iIWFnEqzEld2phiz+mFVI/5zwmKhtEjRhvOPO
	 H39imMlkiqiKVjBw5CoIUo2O0k71R3D4QZlOrhIEwWPJQoqJDoibERxyqfqKJBoXxu
	 WydbRpg2TRCjhD44A+kS2zQJGTClL01zO/X4+ow4aaFULyMfBGEWjzDjLq7EVz5mLI
	 l02QSwyKHDKOZtPISnWJU+3kgSKiY0NXC1yZXXnVfvtxx70+f4wTM7rHyq5GMujKuC
	 ZiR+sT/X0Z6CfpBZe93OeziM=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 3EB6E40E01B5;
	Wed, 10 Jun 2026 19:56:48 +0000 (UTC)
Date: Wed, 10 Jun 2026 12:56:45 -0700
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
Subject: Re: [PATCH v7 015/120] x86/cpu: Use parsed CPUID(0x80000002) to
 CPUID(0x80000004)
Message-ID: <20260610195645.GCainBfRA0gqiR7mhs@fat_crate.local>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-16-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260528153923.403473-16-darwi@linutronix.de>

On Thu, May 28, 2026 at 05:37:37PM +0200, Ahmed S. Darwish wrote:
> For CPU brand string enumeration, use parsed CPUID(0x80000002) to
> CPUID(0x80000004) instead of invoking direct CPUID queries.
> 
> This centralizes CPUID invocation to the system's CPUID parser.
> 
> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
> ---
>  arch/x86/kernel/cpu/common.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
> index 9b05a747161f..3d5b5df544d1 100644
> --- a/arch/x86/kernel/cpu/common.c
> +++ b/arch/x86/kernel/cpu/common.c
> @@ -826,16 +826,18 @@ static const struct cpu_dev *cpu_devs[X86_VENDOR_NUM] = {};
>  
>  static void get_model_name(struct cpuinfo_x86 *c)
>  {
> -	unsigned int *v;
> +	const struct leaf_0x80000002_0 *l2 = cpuid_leaf(c, 0x80000002);
> +	const struct leaf_0x80000003_0 *l3 = cpuid_leaf(c, 0x80000003);
> +	const struct leaf_0x80000004_0 *l4 = cpuid_leaf(c, 0x80000004);
>  	char *p, *q, *s;
>  
> -	if (c->extended_cpuid_level < 0x80000004)
> +	if (!l2 || !l3 || !l4)
>  		return;
>  
> -	v = (unsigned int *)c->x86_model_id;
> -	cpuid(0x80000002, &v[0], &v[1], &v[2], &v[3]);
> -	cpuid(0x80000003, &v[4], &v[5], &v[6], &v[7]);
> -	cpuid(0x80000004, &v[8], &v[9], &v[10], &v[11]);
> +	*(struct leaf_0x80000002_0 *)&c->x86_model_id[0]  = *l2;
> +	*(struct leaf_0x80000003_0 *)&c->x86_model_id[16] = *l3;
> +	*(struct leaf_0x80000004_0 *)&c->x86_model_id[32] = *l4;
> +
>  	c->x86_model_id[48] = 0;
>  
>  	/* Trim whitespace */
> -- 

Please merge this one with the previous patch.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
