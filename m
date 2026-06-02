Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127C734EF1F
	for <x86-cpuid@lists.linux.dev>; Tue,  2 Jun 2026 19:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780429874; cv=none; b=dJ+jxlNloPhL+17wZ28vhPd9H8wlH6IiK3/HvcaC6RGL8BOvNqZmDpn7SV9rF4Wqkg2ogqD78z5kV6OE4EJ3K0hSB93TAIOch+M4XM+JSuJWjniEu94hZQN2Y/Im4SRp2iMUCyh3rjRwEmtzbSpEoXdnm1+LtH0YrjEOfiHxblE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780429874; c=relaxed/simple;
	bh=7Tjz3hvasAStochDsnX9hn7Qs6zrK5ecOIqwFeRrumM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZlpVEzf4pzcqOl3yOgmlfuY6GRYEFQAWds98zOx85bhXIPxgs87w3F61FZEfUiJWCWCJsYxDC2IO50cj3SouaHDSg3Uu/yhKQYkE/2pyyoy93wh+wYAxwa+iEX8ch03Iy3IENtTBRlnt85SO91NKg9nw/9PfY8f03x1933+SSVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=CIbDTsQT; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="CIbDTsQT"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id F2CFE40E0140;
	Tue,  2 Jun 2026 19:51:08 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id UF2baxTwULEY; Tue,  2 Jun 2026 19:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1780429858; bh=B2wxudaupwxYhXc2zhM7w/amYIgzHR6CSU5gSiPKUZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CIbDTsQTXj7PoBr2oKK11BHVkGvVlEIGVeemP1ClgIYx6y1VlfTO2Um9Ves6UOzN5
	 SR8GnAHOhzzLIbd79+SSJSFIBxXtZTPpm9BzWcaMCYX/ea3B18jT/sdrcA1DKCEOcn
	 4B9kD/Akyh1KdR7UKy/sqyZ4BxLG6V1DtRhPw3EYKbJRMKFx3N0pF4zvkqlANkPmvu
	 cPsfkUtv/PTo7WYNYyEG2PatdmC0ZkGWzfgfjmzdpz3JeA3++MUNkVcjykp2fPlknJ
	 AwW9rXyBTALFN9Pku8jh0rwQW0CHmiRpzcihEIRzykDbDrgK0fqDuUiPgihHQSJ3Cj
	 IjfCAyKNuT3gAnthVVxYUEKZvdHpQtEwJZqv+ZVss7J+8Sct7jgtGqqOHhxDkddPEm
	 gQeNTj7eDJEmpWIeLkSRA9uSxyBe5oh/bddaJ3EJcpuaVuyML58hOYqTiGXECsLMef
	 xKAERTr4ftPwFF/LkALNrLbZxvRUIeaU4Tre3bPd5H7jJGFE3Jkuw1525coX1u8986
	 sD5ghKuPr+qLO8FRPXinfm5zaQkeQ9DgWwdojA6L3wyHsxsnu3Nckam+mpFVrlHtlx
	 ZCqKUKKfLsrJQ6U4zuugkshFfKf9fRjHPTrScHN8KjhC3BLbe3g3gyBDpAGn2aZfbV
	 BsyosjojIbKaEGQh1bdcTy3w=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 5171E40E015D;
	Tue,  2 Jun 2026 19:50:52 +0000 (UTC)
Date: Tue, 2 Jun 2026 12:50:49 -0700
From: Borislav Petkov <bp@alien8.de>
To: rafad900 <rafad900@gmail.com>
Cc: tglx@kernel.org, skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org, x86-cpuid@lists.linux.dev,
	rafad900 <19312533+rafad900@users.noreply.github.com>
Subject: Re: [PATCH] tools/x86/kcpuid: bound CSV field copies to avoid
 overflow
Message-ID: <20260602195049.GBah80GbzJxHvLpgk7@fat_crate.local>
References: <20260502221030.1081829-1-19312533+rafad900@users.noreply.github.com>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260502221030.1081829-1-19312533+rafad900@users.noreply.github.com>

On Sat, May 02, 2026 at 03:10:30PM -0700, rafad900 wrote:
> I added bounded copies of the bit descriptions to avoid possible
> overflows. I tested by compiling the tool and scp into qemu along with
> the .csv file. Then ran the tool and saw no errors
> 
> Signed-off-by: rafad900 <19312533+rafad900@users.noreply.github.com>

Please read this here to know how to prepare x86 kernel patches and their format:

https://docs.kernel.org/process/maintainer-tip.html

Also:

https://docs.kernel.org/process/index.html

for a general idea.

> ---
>  tools/arch/x86/kcpuid/kcpuid.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/arch/x86/kcpuid/kcpuid.c b/tools/arch/x86/kcpuid/kcpuid.c
> index 7dc6b9235d02..c17dbcf453eb 100644
> --- a/tools/arch/x86/kcpuid/kcpuid.c
> +++ b/tools/arch/x86/kcpuid/kcpuid.c
> @@ -415,8 +415,8 @@ static void parse_line(char *line)
>  
>  		bdesc->end = bit_end;
>  		bdesc->start = bit_start;
> -		strcpy(bdesc->simp, strtok(tokens[4], " \t"));
> -		strcpy(bdesc->detail, tokens[5]);
> +		strncpy(bdesc->simp, strtok(tokens[4], " \t"), sizeof(bdesc->simp) - 1);
> +		strncpy(bdesc->detail, tokens[5], sizeof(bdesc->detail) - 1);

That's better but your bdesc buffers still contain stack garbage and nothing
NUL-terminates those strings.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
