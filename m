Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68851AF0AE
	for <x86-cpuid@lists.linux.dev>; Mon, 14 Apr 2025 19:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744658311; cv=none; b=GQVje5rlLzPkScaxP24jo5TydA7EhLilaCh9OOFA6sbcA1tDvLbeObl/2WxyIgb+APXBEfmZA3uFsBR+DVfiG9D1KT6gAovBSoRPpEssPHut09k5kisN686EYg8UkVW4kw89zMK6xTkqlCXipetxYrZNUosXUZzhuWSA5A/ERnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744658311; c=relaxed/simple;
	bh=dqKdkTABciNhW3yvbh0oiFYJfXmwI7YcwWQ1NG1iQJw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ued6Su6IAr3D965lW12WXkKXsr343dJY9CbzzMPnfpkxoaRJkSovwL2SYC3NosynN/2u0JMxGf41HOX+zkt7J1dlFmLhZJgwx5e7wqYapBVj2VN4qHlgCesH0ydxx9NkRSb2Lr1JehcvLlBo1A/of2fBLVuvwwCfIL/ou4FZeZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X5XrBqhY; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X5XrBqhY"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e5dce099f4so6158881a12.1
        for <x86-cpuid@lists.linux.dev>; Mon, 14 Apr 2025 12:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744658308; x=1745263108; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zkwNGLQjAi5dq/rfvJeUTnRF0UCBvbpt8nVJfOUF5PA=;
        b=X5XrBqhYeP/Rydcj/WEDiWaInTCp5kav3CO2IEIvU/1M36Ak6zD5yoBbh5Zyo/cy7W
         j93R1rcwUXBmXsj7ldTKmrd0MkS6LbAyiGQ7j9yyXHBX6ycpdLu2E571h57zi1pepkaA
         ZG3fP7ReD9zoUNoKUoF8Y/cwVNWBlezD/tNhNcxmWvBjKaHmbTJAJ42lR6ORIvwTvi+9
         vRfdoqTCupYOr+fvtJEzdIogLIcM0PcQOeWQ1/vZrHRm/KnOFXxIpnRmZODsi3zGWoZ3
         dSE1aQbGQlcw6bcyvTwBTHsdfmgjodjoru7faHmp89wZvIq41kwMMb36IirxMX81Jbve
         fG9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744658308; x=1745263108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zkwNGLQjAi5dq/rfvJeUTnRF0UCBvbpt8nVJfOUF5PA=;
        b=JsD/4m/siyAjQNwqJHZkkCdYLEVItvfdLVuNGcl2SJ2YOJg0NxOE1jscPJ2hoOvkXl
         MjBsbwtJKbXtluYu/bMbyUxKw8CUsem5EotC8jQon25GwG4bvNJWWgBu/8cS2ufsNKaW
         jmbaCmQSNswKgKF/GDJtRWD+RsQECVnQQfZMSjY4g4wxaMdQz/ARTfBjlaFRhCmnaimw
         n9nhc6azf3hZt45AxLExpclAbFybaA/RYKGED6d3p2ItzcgW6M6QVGOmVp1okRtE/7Wi
         vwYoz8IOj1FPqXPpJsDcbRrn5Rb4kM7xPaI0cDZxePHSh7xs5bAYYDxZnuRufWaSlTjE
         3sjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqx2KgBse6FuQQKX9CLCa/r2A7gLp5G5dbjUZBA8BY1hxQMF/liTWW3+xeZoYEkKbMD7Kn5LI/rH0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyyQPDmBsQWBq2ahX298yAhQiDWjaPIf7dY+o2UzjKPGjT9aAqU
	c0PejONl4HLMzZJoLMLKOJUWRnelKj+X2oCFoBly0pbrCYLypX8dCTQIpfwNMZR89mvRl4CnIjY
	rmbdP1nR05vE6f4LU7U6fkAQDljzEoYMJ7iQ=
X-Gm-Gg: ASbGncuIQEWW134DQXTkORA1jclNJnagmb2E0jh2gBpig5pr9k2e750ql439Fq3d4EW
	Ysdr9WhwNyn+qHRnTjV1IEFlF5N32KqtvAcx/oEsEl6liqQii6Env2u7LTAN+mMYZNL1QnjgV9A
	YH7Z09wXb4zaloQ0o+GUCPew==
X-Google-Smtp-Source: AGHT+IHB3AJOLyRSnuC59KKfRy6KmAWnfPnlKtlr14R9euaoSJrWL6uS7XxftiV2oLp9SfzLug3QNA9u6RHBz6k3MTQ=
X-Received: by 2002:a17:907:2ce2:b0:abf:4708:8644 with SMTP id
 a640c23a62f3a-acad3595004mr1304319766b.43.1744658307614; Mon, 14 Apr 2025
 12:18:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKSQd8Ug3Vk3A7eE6nB8UbhmOBBzVpfAqDYLf35Ym444MeQRdA@mail.gmail.com>
 <Z_0oWnbcjsekHXJd@gmail.com> <DS7PR11MB60779A14A91C73D04CC60494FCB32@DS7PR11MB6077.namprd11.prod.outlook.com>
In-Reply-To: <DS7PR11MB60779A14A91C73D04CC60494FCB32@DS7PR11MB6077.namprd11.prod.outlook.com>
Reply-To: ludloff@gmail.com
From: Christian Ludloff <ludloff@gmail.com>
Date: Mon, 14 Apr 2025 21:18:18 +0200
X-Gm-Features: ATxdqUHfUduhc6qAB_wjctrMudxwDHTZUCIZwRj48eWBDA_LfgJSd5DyPkLhPPU
Message-ID: <CAKSQd8WsKnTk35PUCD_kM+Ox7yhBY23nMoE1R0Y3=U1OUrSRbQ@mail.gmail.com>
Subject: Re: [PATCH -v2] x86/cpu: Add CPU model number for Bartlett Lake CPUs
 with Raptor Cove cores
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Pi, Xiange" <xiange.pi@intel.com>, 
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	John Ogness <john.ogness@linutronix.de>, "Ahmed S. Darwish" <darwi@linutronix.de>, 
	"x86-cpuid@lists.linux.dev" <x86-cpuid@lists.linux.dev>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 6:21=E2=80=AFPM Luck, Tony <tony.luck@intel.com> wr=
ote:
> > > The macros refer to products.
> > > The comments refer to cores.
> >
> > > Consistency, please.
> > > Sanity, please.
> >
> > Amen!
>
> PeterZ has been very vocal that he wants the "sane" way to be making the =
"#define"
> name be based on the core rather than the product.  That way multiple pro=
ducts using
> the same core show up together in switch statements for model specific fe=
atures like
> power and performance counters.
>
> This does mean we have a transition between legacy names that were using =
the
> SoC product codename and modern ones that use the core codename.
>
> Can the X86 maintainers please get in a huddle and define a naming
> policy. This discussion keeps happening.

Consider a two-level abstraction.

One which gets "looked up" from FMS =E2=80=93 fundamentally
that is what the existing file is trying to achieve, right?

Another which gets "looked up" from core (e.g. RPC) or
product (e.g. RPL,BTL) or whatever-else-is-used-often.

--
Christian
