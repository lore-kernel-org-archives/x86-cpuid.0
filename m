Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B59A15687D
	for <x86-cpuid@lists.linux.dev>; Sat, 30 May 2026 21:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780177477; cv=none; b=T54NPAQRSi45Jez7qShVmJ3LRRk+duTJghJen1JzcSpKNDCeEChpxYWJjlse1L2KECq7kyduASYIN0nVR6NFVQJUnr7m+X+9MkQRlQ21P10mvhz+p4Fmfx2haMtfQ2MhmeC0vCso6+1KyBZLErBAnexriIHa2n1XK7aGz2bjcIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780177477; c=relaxed/simple;
	bh=DBC8SW48EaxROKvcCNDyGu3QvRdWAF7i1NnEH36S7aI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MqTX38QYN56KRcK/hjbuSokhLZ4KwSlmuaE0AM+DiTutXnUMD7N2hY7Bxj3sX5Rx4nrfl9NbphH91o2OFhFZ4D7ljIInXqtCr/0Qz0TbTuvtFf7eg4DEvqpcam1QfUwiTzSu7yNfaGpdRZkWypNGQLQLrEoT3/cZaSXltZTeOVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Xy8JgboS; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Xy8JgboS"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 6358840E01F9;
	Sat, 30 May 2026 21:44:31 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id uCtrU45WLYEc; Sat, 30 May 2026 21:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1780177461; bh=msw4wkZJliTaOjQ0cb34JE1jiv+vdn+xaVNLFfQVLeQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xy8JgboS6QkLKe2HaAQdZk0drAnPS/sQjN/eO18eTszeDShEQawsjYbhF7p3g49Eb
	 /R2D/wXaQ+PIp2lw2J84xkaXK+2KT+rpu0UcQfrjsvQLWVwg9iOhkKF8n/wS2riMvW
	 ufVoW+hHI/O/uLuxnExPAI7Q/ZjtQtut9oOnCdWV17bVS8jWwBwIMKIfO+z8n8uvhn
	 va/zXQ/5kRnQZM7Z3ptGtxPHdrL09uXtR8rSK8/i3W0P3Iq4QT0hGJQQyuI3LUdCsz
	 Nqk0gHRFnnvmbD2IyKLm+ORPm10emx9KGItD0mM2fLyD1vhUsi4CX0TKZdxbJJiDGT
	 uNMlgnNS22PdMY5ZDY2/BdzEMYnHqTFiJzt9LGhyzK8u4BpbaBNGh9aCvkMLmCkqpB
	 ECV+K4MFWE8IOv7bU0CKVP8I7JQXqeBV4aOWstDg5/Ogfrun/3roaVC0CW5M0N7lHR
	 bk663Ka4nHDEPjvHJ0GpeyGsc7YnJJhEadtrKY2C+tgKGqTrIVucjkBHRFDUuO5VT3
	 ryEGN3YIwo9340aizbkSNuQk0PBEv4Gl6Rf7fRLRSf/1LuViIa0uaV23C4tflmZiZ3
	 3FCqGwuKkZUxwftynihJuqV403IITCiuqlKMfSrJ/ns23xH8riEUO4xKOWAj4oxcVv
	 0U7IYWYcjOin1scUjUA/HgqI=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00:b8a3:f58e:8829:9ca6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9EAB240E016D;
	Sat, 30 May 2026 21:44:07 +0000 (UTC)
Date: Sat, 30 May 2026 14:43:51 -0700
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
Subject: Re: [PATCH v7 010/120] x86/lib: Add CPUID(0x1) family and model
 calculation
Message-ID: <20260530214351.GAahtaF5T7fXjmoox4@fat_crate.local>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-11-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260528153923.403473-11-darwi@linutronix.de>

On Thu, May 28, 2026 at 05:37:32PM +0200, Ahmed S. Darwish wrote:
> +static unsigned int
> +__x86_model(unsigned int family, unsigned int base_model, unsigned int ext_model)

No need for that ugly linebreak.

> +{
> +	if (family >= 0x6)
> +		base_model |= ext_model << 4;
>  
> -	return x86;
> +	return base_model;
> +}

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
