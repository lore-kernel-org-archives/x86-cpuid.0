Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D22F221D89
	for <x86-cpuid@lists.linux.dev>; Sat, 30 May 2026 02:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780108235; cv=none; b=KFdPlTN54EztMHmDVL2GUKWlTdN8dCZNwNUMCz5jKL8W/vEKyIV68+ypivjPRc1GlZkdDawq+YFgKgKXe8EafuEYru7tnw6aDKyISC01K1BaBJb+7Nlj4eXRpBnxPlDCmzeSBqMuKCIRPzuBmgV7M8CIC50cXPrJghYXYAsTsd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780108235; c=relaxed/simple;
	bh=cv11ahWX+cEuQPmQP45jDMiB1y1EZHBmGckjWVUJ3Nw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o3+/Zm+alWXlSEM2EEPiGd1Mmr0rOoRyK82F9HZUOu9hpjd4BTvNg5yvAGGqGEjVmxtC5nA0APUjXQ50/ZMke6SoaucHa84dl8U7plH7dvCJZEisW54nVsN9AMEyzbC7CL48SsXPikeSWBCHRzHbNSPytksd1G34t6NkFmxKV84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=hZplnR2t; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="hZplnR2t"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 7370D40E01F9;
	Sat, 30 May 2026 02:30:23 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id R23rSwVxZAxJ; Sat, 30 May 2026 02:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1780108212; bh=hBzlr38vrWZ7rIm+9b1UUh/oW3k2kAOQRrm8bMzRmJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hZplnR2tlTkV+i6jbQxPQYYOnrQkopQnamJlaSIJeUuKMSb78MQMy80dgXgq3UNVk
	 NMZYrJ2YTmvpJWJTKNIw4+52BzKi9pYaD8rNtNBwLWDk3HgfZ7FbljcupNgmp8iaJu
	 kvJbkkH+iXTsykw2bVe+vbz8bZOvapXQc3LWZ1ucQRXGelHZh2JO/wq0/LPR+dorlW
	 X1DE0HtKE+x77OFqft+8Wm96DGdvyv41W6Ly+nn0Qi9Hmo1qU7TdEnLgTVlUTz3U3D
	 q2Zq2+0vGIkBzyyxCyomUbu6QEzm4XZtQI71G2u/UOAdYFOEw/Pll5rHNy4SCUgjpZ
	 u1p3chhMuqmY5eJBGRO2U5+9WfXAMWZNfbOywoDet593e9GvlWS2s0AHqVukJ4zuqg
	 hkNaTobzuY7uxl+t0EGDsyCO+X6oRwSBPgOebepcqSdCbAYMSvPBy2ZtpI7i7birSo
	 8mG67qshe0rcln2WSkuMEF/miHyQ70vijDw/6kwuaXQflgaeGQ+2RUehBK0nkBlHD7
	 YRM+oXj81z7Lk2UtHh7h3fg41fSk78att/RzYcQxy6R1lbOo2LJvh6JkI/G5Qf6W0a
	 uE6V1rdxe+ICJpa2qZFJYqgCqZxAlRwuO4H4Z0mUU45KM6uhpAtQ83DBNX7u1Mj+2e
	 pMH3gK9bAh0o9OIu+LAWA93Q=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00:b8a3:f58e:8829:9ca6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 1165040E015A;
	Sat, 30 May 2026 02:29:58 +0000 (UTC)
Date: Fri, 29 May 2026 19:29:45 -0700
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
Subject: Re: [PATCH v7 009/120] x86/cpu: Use parsed CPUID(0x0)
Message-ID: <20260530022945.GAahpLmX47wsYUs4QH@fat_crate.local>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-10-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260528153923.403473-10-darwi@linutronix.de>

On Thu, May 28, 2026 at 05:37:31PM +0200, Ahmed S. Darwish wrote:
> Use parsed CPUID(0x0) instead of a direct CPUID query.
> 
> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
> ---
>  arch/x86/kernel/cpu/common.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
> index 5cae6c48dd25..281dc591ea79 100644
> --- a/arch/x86/kernel/cpu/common.c
> +++ b/arch/x86/kernel/cpu/common.c
> @@ -942,11 +942,15 @@ void get_cpu_vendor(struct cpuinfo_x86 *c)
>  
>  void cpu_detect(struct cpuinfo_x86 *c)
>  {
> -	/* Get vendor name */
> -	cpuid(0x00000000, (unsigned int *)&c->cpuid_level,
> -	      (unsigned int *)&c->x86_vendor_id[0],
> -	      (unsigned int *)&c->x86_vendor_id[8],
> -	      (unsigned int *)&c->x86_vendor_id[4]);
> +	const struct leaf_0x0_0 *l0 = cpuid_leaf(c, 0x0);
> +
> +	if (!l0)
> +		return;

What for?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
