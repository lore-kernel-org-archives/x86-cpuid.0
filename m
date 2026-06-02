Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA39431F9A3
	for <x86-cpuid@lists.linux.dev>; Tue,  2 Jun 2026 01:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780363431; cv=none; b=K8KrNDpu5jJsEIZkiNC23ubRt8yxSQMLaO9fmEWPbaW1JH7kt4fRdHBUBUTgBMCoTteMMIltNsSk4AbHVE9knrsladhp/INPlO3S0UpPql/7t5uBS23OrfFvXbT3dOvflyAxaIw5EMjxNVuzENqjtHircZb9ON5er4bs+s1uwuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780363431; c=relaxed/simple;
	bh=yeKErG54ZBRkorlpSUb+6vtowkaFdjR5XfnHwnzdmlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BI0l+l8t3abZcrIM7u1cI6PE2dhf9KqCdcxjsGwYCqDjRFdRClRSeT3ILqgroxN6nViNVt0uKCOckWbaK8JvKhYaHyiolttyn4Ah3xQECmX08oUw/33FFFGePgs3PRD75TpanIwiH7AZ86a1gMSREdI3ma29lHD9Ez05txwBkgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=R43Dh3av; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="R43Dh3av"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id E120C40E0140;
	Tue,  2 Jun 2026 01:23:47 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id pYSGBdimTW_8; Tue,  2 Jun 2026 01:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1780363418; bh=/XiQmZLLl5JoJPkn/2baV2NJ9qay9tBFlpFtNlasbz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R43Dh3av91Qt4spTk3WS3Y00PQw+MQHHx5eSODbjVLxT8j8QK/92P9JBoWZVS51TY
	 NexBTMzXoW690u6p3q34Gv6MWQnh7zXuJPz1hyb04vp2uaQzZBQES9Hj+xmrestKX1
	 WEkTZdQI0BYkcntTaK3jqagkF8RjDr1MzmRRMGJy0Yz18VpfX3qfOJcQV5NHmUKT34
	 7bE/gTdr7c/SwwqEMRp/RLWz/8/7UTZrIzr8597JV2IMcA5++4nTwkBz0uNCh9cOtt
	 gdx3i+xSDerNUu5r8Ifvk91pMKA3Acbxgvg4LLYD5RQnLpyJNBMuwqTOlRhkIGQAE4
	 kJTsDg9/vIiZB4ZTIIOA9IU8AARrjjlACXx5FSM5FkdT21k0sYPVpEtul0Ernu+lMJ
	 QYQL5k1LGdNBNP33PnTEat3xcKmkvl6VIdZUYinyRY5AkHjs/L5FXc06JR0dBRdEt+
	 FMdQ3d8etqZlsbXc/fGjSe1SXWUeZ2LjqDWT80RBSE1B75pFTJxvzO1gu69AvxRQT8
	 NnhLPJUK1BzhYxGpodoea4DumI2f4Ty0iixE0iE1sHSwxxzMZlh3Ks378NtV2CjKPb
	 ns0RwhO1ciEh7Pm3ZBucjJxzwE96XGyJf1zrhqFXqWd376tUydB5MEWT4b6r17eYAi
	 CsYIXuJbnsAGyG3+ePU9a1FY=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 7460E40E00BA;
	Tue,  2 Jun 2026 01:23:24 +0000 (UTC)
Date: Mon, 1 Jun 2026 18:23:21 -0700
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
Subject: Re: [PATCH v7 013/120] x86/cpu: Use parsed CPUID(0x80000000)
Message-ID: <20260602012321.GFah4wid2xSkjbicDJ@fat_crate.local>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-14-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260528153923.403473-14-darwi@linutronix.de>

On Thu, May 28, 2026 at 05:37:35PM +0200, Ahmed S. Darwish wrote:
> At early boot code, use parsed CPUID(0x80000000) instead of invoking a
> direct CPUID query.
> 
> The original code has the check:
> 
>     extended_cpuid_level = ((eax & 0xffff0000) == 0x80000000) ? eax : 0;
> 
> to protect against Intel 32-bit machines without an extended range, where a
> CPUID(0x80000000) query will repeat the output of the max-valid standard
> CPUID leaf output.
> 
> A similar check is already done at the CPUID parser's own CPUID(0x80000000)
> read function:
> 
>     if (CPUID_RANGE(el0->max_ext_leaf) != CPUID_EXT_START) {
>         // Handle error
>     }
> 
> Thus, for the call-site, the parsed CPUID NULL check below:
> 
>     el0 = cpuid_leaf(c, 0x80000000);
>     extended_cpuid_level = el0 ? el0->max_ext_leaf : 0;
> 
> is sufficient.

I don't think this needs the code examples - just explain that the check is
done by the parser now.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
