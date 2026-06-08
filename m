Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B053AA4E7
	for <x86-cpuid@lists.linux.dev>; Mon,  8 Jun 2026 21:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780954237; cv=pass; b=dLpuAr02ppz6JMTKZZvSfEokulfR7KB+MTw/7p7gL7WRDwUfzl56JfK46PuYisktrDDghKnlOY0gHLEcANz0V6ATI8l+Jlt2/SVSnoTUU0J/UBtmqoscdGJJPO6+CI9enetHa5rGv06TU9LKTSh9QdUZmXAVFxZWd1YI/s3Eeq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780954237; c=relaxed/simple;
	bh=pGgamx0vc9Nt8kByLLQTtwPyCNg57l+MWExV3F+UB1A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MAHm9QGTjjRMiAiIXLzhaQ13e8PbaeV9ANlpLPMnMN1EXtHmaFEk2dxQlEiMPAHNBWgB8ZG0Dda5YQ7nlr42//t9WNJstXxrraNQH4sTinZsu2VaPY8MW3rW95wyZyxUycCWkh8NvBd9G3merwEhCs8mip8sbY2k7cDzpxgP0IE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gxs9HRQP; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gxs9HRQP"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-68bd9fce347so8593458a12.2
        for <x86-cpuid@lists.linux.dev>; Mon, 08 Jun 2026 14:30:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780954234; cv=none;
        d=google.com; s=arc-20240605;
        b=i1jD18q+kg/YUwExNIAK1SUDrWNCdTNBEEYb4DJ5snQQjuU8QW7/cWaCzE2ZoyLh9F
         urXVLs5BSqmov0Ahf7ckqntXJ5PW/aU38ePqAFY7eQfuLdvgMJ5egt8u9qbUPlAP3+JN
         rJkgbGE9aU8hBLJUPM7LyTHUfLmhphsyDh+prbi4hjDDK+GKPHL+6INBdPFaYitTTFQp
         r2WTeUR4wKmbetTs/jFvosf/8LsAyX0nvexXR9IMTCijYiucbU8iUWwmPFnvXek7jFjq
         LGFCpUtWb+AGL+ERT2Z5wq7bPfSoG1K9AMBq/qzMxGY2l0kw3wsO+cncDDPQZpERf4/L
         VAmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=pGgamx0vc9Nt8kByLLQTtwPyCNg57l+MWExV3F+UB1A=;
        fh=yfblrFFtaRoWyP3PFgcaozshRHlbhJFBJHzXDmT/DOE=;
        b=cSd0qsQGuV7QhG/z6CwdV0OFVDkymfyvzyBFkQ/fz4HNb4kjt0tqDcutp+wrIgRKU4
         o92JTsNAWy+kwbfIXpPLV3rSEk5SBsXcSszGH2Hziy0mK6VPf/UULLmLWWjhN69mMSpP
         0V2oEZP0oBUGXWMxXehNcQSAbubPGmAbCQ2XDgtIIj4Fyqb72HdJH2wsJRewROE+Jqlw
         DVB1J3/U8KQDLhV/K3dIbSSa+hthw4hsS9/knfftrwQkmnm7VNfxAHuEeLLBqDFsn/+H
         yQHJU/f/oHOpOGNOHfgtIo1kNHX/hXDITFbG9xYV4054XxpyE6Z1EVxzOYeQe9J7Kul/
         JT7Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780954234; x=1781559034; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pGgamx0vc9Nt8kByLLQTtwPyCNg57l+MWExV3F+UB1A=;
        b=gxs9HRQPkKFwCt6HwNxofwmC5ODU/XxlQiB2DrSWG7U9YOVty6/8Wzo1aCbWjnkq9Q
         2VKk8XUUww2k5fKuPfK1+3hnlnMjiNz42HZpFbOXFIp9r+xpiIlFKZWlvIpliuYStfD4
         21XZHMJkBfh7Gr6Hv30vIswUgJ5xSHCXsVNlAxyikky0srtJt1r5U/1dt0WlGkz/CiNG
         I8dccFNsNETZnFVc19AM652kS57gMlLTLc4b1aXCu/wvdjIFrarrQM8mTj+diDGhWDvr
         Kuy/Rg/xuYQg6TYyxU2Zlx1+bRHsoWGeAQiNW29huWgm4i2G7xt/UvSSic1nEGlzU1OY
         7lzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780954234; x=1781559034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pGgamx0vc9Nt8kByLLQTtwPyCNg57l+MWExV3F+UB1A=;
        b=PES207UIRNz6BQTyzBEgmjShTJMpk0OOQo+7gQRI10difI2SS6gf7uJa1rpv70kNkY
         P8Xl8k6vdr6d7kxNcYoMCAh+5i1pSnAZ4RT4fJicR1fm0fGDbCHbtiG8N9QiHrcvui8u
         sHQwqw/8hQ1Q6J8XymeDeXByBexBUtTwZhRHp64m9jdia9hIHnHKM1LN04CRH1Z0Y/dU
         juw1nP3CB05zo5weFXlqBGAtwEpAOcHpE17wf+gDIvpOHGIL4MpuEvjPRJgUMkgqZty6
         WdOcNu+oRY6FNn3qSOD7DeiS+r0c7KctccN9sDASTQ/x8xE/83OcY+yrjq0dvOW/wkFT
         JH3A==
X-Forwarded-Encrypted: i=1; AFNElJ8j71K2NEKcCpKPkGdmWmhy+0DIyRVPfIhxkm0IX39DlsvSruz3DM0PhuBFpBCRbPDcgJQ8EIttHeY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwA7107g3C40e89A86oGG9NMHdWIfe6ExQbJO6q/Nup4yHlrcbR
	j7ru010sB33CjqjECOcBxyTUFx034Y6T15NHtvWMZYV58c6ruOI2lHQExP1etkct0V450A56jZ/
	yN9PD1w24y92mLXsXfXv6KBh29c3bAVg=
X-Gm-Gg: Acq92OHuhBvDK7V0g9qIaMcyd4v1L5sgjwjHUN/Y7I3nry5zC9UaDBOeoFzNhyReRid
	bZwKMOOapb156OZHI24rwb3znhNluwXVVeKwdNmQnOCbw6mvoctF21fl+4Osclu3lkmsKVA2e6j
	wGzmpHwZCsXc5nO0wMLL6r48O2WCsY4a7GIc2UpF3pLqd35CyBrm12Z06VyeTxtIBvtXUJ/2FN1
	PE3N86vNt+1HrLiHNe9MIXgu9fqbq/3ti03NO0qWPQvDWR+QWBdCdDMeF9mj5QKpp9IZClUub3l
	JHZoPNjPQyVHHEpbeOcSw3FJzB0MwNsoIgIKJBjCUMxh91y6CzA=
X-Received: by 2002:a05:6402:ea2:b0:68d:92cf:52f4 with SMTP id
 4fb4d7f45d1cf-68fa4c0931dmr5570242a12.5.1780954234029; Mon, 08 Jun 2026
 14:30:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260601194150.GDah3gfjoIZIByCa3d@fat_crate.local>
 <ah3jPMYIxC1vsUUB@lx-t490> <20260601203452.GAah3s7FevsRDFT7rF@fat_crate.local>
 <ah34pi6j5HSMJdrL@lx-t490> <20260601225306.GDah4NUvJwaqQem4VQ@fat_crate.local>
 <ah7_wPJ8_FGLOwZd@wieczorr-mobl1.localdomain> <20260602174746.GJah8XQvEJo9UKru1l@fat_crate.local>
 <ah9H2hxkMPMeuF-o@lx-t490> <20260603003129.GCah914Tc9sEpO4Nxl@fat_crate.local>
 <aiZjpPCTsz4m-1O3@lx-t490> <20260608144920.GBaibWcLl3BUAPL8XW@fat_crate.local>
In-Reply-To: <20260608144920.GBaibWcLl3BUAPL8XW@fat_crate.local>
Reply-To: ludloff@gmail.com
From: Christian Ludloff <ludloff@gmail.com>
Date: Mon, 8 Jun 2026 14:30:22 -0700
X-Gm-Features: AVVi8CdaqxkQtFKWF5n6BsX5sRkjYdmemIHQQK8NL_n7t6vkJIw9nmBtQJJe330
Message-ID: <CAKSQd8W5060knJMy1eQeNCWzAo-A8V3bLqgdRZBgKc-QYT6E5A@mail.gmail.com>
Subject: Re: [PATCH v7 004/120] x86/cpuid: Introduce <asm/cpuid/leaf_types.h>
To: Borislav Petkov <bp@alien8.de>
Cc: "Ahmed S. Darwish" <darwi@linutronix.de>, 
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Sohil Mehta <sohil.mehta@intel.com>, John Ogness <john.ogness@linutronix.de>, x86@kernel.org, 
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 7:49=E2=80=AFAM Borislav Petkov <bp@alien8.de> wrote=
:
> What you're doing is a database of *all* CPUID leafs. How long until some=
one
> copies or exports the header to something? Or starts generating the heade=
r
> from your XML and using it in her/his project?
>
> And what happens if someone has already started using the headers, you fi=
x
> those spelling mistakes, release a new revision and someone updates the
> generated headers locally and code starts failing to build all of a sudde=
n?
>
> What do you do then?
>
> I think with issues like that which can cause nasty workarounds, we canno=
t be
> urgent enough in fixing them.

The database will never be perfect =E2=80=93 it is always in catch-up mode
in terms of leaves/fields/values that need to be fixed and/or added.

That much I can tell you with absolute certainty after more than 30
years of https://www.sandpile.org/x86/cpuid.htm maintenance, and
yes, being personally responsible for some of the CPUID madness.

Embrace that chase of completeness and correctness =E2=80=93 "perfect is
the enemy of good". Ahmed, can you enable gitlab issue tracking?

--
C.
