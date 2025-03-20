Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61841E5B7E
	for <x86-cpuid@lists.linux.dev>; Thu, 20 Mar 2025 19:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742499755; cv=none; b=N00+mi6wNvcJ18eiDSGFhuP+sHdvZW4OYOKhSOmTDVSXWipTjx8EZrVS4B7DZbdetFJTbDUQIiamXaooww+TR2IIYd7MRCXrc2ByRS6VgpQ8POiRhm0+ZDKBKjgv9vfIePYuVwFpViZeS7REcO/942ekKEErIx4V/5JQ9xJ2CHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742499755; c=relaxed/simple;
	bh=Tw7srVavTpepXJ5E4HqSISIYWw1eDvOWEZ7yq3/TDOA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TMW29oyfUis4w8ueRtlcoJ/qt6TnGyf2/z/I4JwwoKgdWkZa1+322LDDYUuAbFFnKQWGW8iGgQM/H38YkKG40wPeEUUBz3fSxoFD4fIuwpZ8jo/KYrJWZLBjweek50n6dJWsUYzoQnoQ1KE1SzCcWH/MM8j6IEi+w9Eb7jTmN10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=omxnP/6F; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="omxnP/6F"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43690d4605dso8716015e9.0
        for <x86-cpuid@lists.linux.dev>; Thu, 20 Mar 2025 12:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742499750; x=1743104550; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KVzjHDBGRoClsphc/cxXIEyZMPWjslmvcnc0gvOOPR0=;
        b=omxnP/6FtSaPAqnzI5/WhgRQpH66msbl4cL++QzHIGqq9tfx9QEcPLOYQUyesuoOYo
         8xeXypHirTqeZopzl3avPakJEPGr4S84W4kObNLGMrytRE+Zv7xe3eHfhqbX0EQVbKfI
         1mwCgircDuVL7/dS/7StMfOpcURO1DEIOElOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742499750; x=1743104550;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KVzjHDBGRoClsphc/cxXIEyZMPWjslmvcnc0gvOOPR0=;
        b=mzg2CaSvP/X0BXKOX8AoPSx+vfuWtFWcOe05vFLXZjMevpf4r86ag0u1uQCm3uF2xp
         UVhhJmEnIwRFGRX3c5xF2mdu29tKCcFn4I3EbOEQQinCv7DCmtNlfQdtMaE0zSCdS3LV
         HjogKwzKBDJDjdHW/Y5UIJwH8nEeipQx6PRGxdL9xeN9vx/7GIGQ5YT6cvqblEtSOQsE
         vVpQDUeawtRX+gbrd3ZDIb4D2HYrX+qnntD+HM7M9pfLkZRdLYLup2eg1nPkwYZW8G1m
         HlBPaXLnKFvK+8pdPXwzavLd3w3OuHfk6fCBs0NkXgIJ0divNQTYidoGep7YpFPpaI5X
         wzqA==
X-Forwarded-Encrypted: i=1; AJvYcCVqbuU/q0yO10GUzmw5SvR5kZYu/6mPREmA3xMrQdAC7zvrwREGHwHh84oRDwMrfp3sMx7RyTfOHSM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyPSx+rhJRcDYEpifqHhIBMn34SNNvi7mAqNptpSZ+CIRYd3laA
	gpFP3kReH/ZeT5zvRk63zkCwOnsuW5l9K/9FNx8jQ7i1kEXfByggHaR8KrQ7LT0=
X-Gm-Gg: ASbGncsoXGTJF85qPWAYxrVxdt3o85uGjjsrp5VrqWnczYDv6SK+SaW4CCE+9tfq0le
	aWlFBi3jbc+gZh7OlHCuD6CZYfy0nq3fC6PLJTTtnRxECqLPAFfl2wabuf++te3ADiFtYhBXoRG
	liTN1wIx/EiO+Tz+xjDkm1A+wEygNyNqoSDgIOh8DMWvLGf23pg7DeijyKV9S6rzzwac40cTQcb
	O1PDcqnvPqx5U5Qdve6fFTRlIqPyRHdwuxz/NjP03mM8MP9DVIiMGyFaX4hvzZpwm/OK6D5nVeg
	aMLLSpCiOO30ISnOwFuFvOqdl1qMYnvVcY8u9osi3vPlRZNqivZSb6d4i9LUGhvLRcgc+7m6E8M
	ENXCtbAbR+A==
X-Google-Smtp-Source: AGHT+IFtDHo2OHhyRuXz1Q0Bo9spFzYc/7qHyDdV24oTtwTcqf8HSrFKdRlEsE2s450QRc4nWKjsjw==
X-Received: by 2002:a05:600c:c16:b0:43c:fd27:a216 with SMTP id 5b1f17b1804b1-43d50a218f8mr3715655e9.23.1742499749785;
        Thu, 20 Mar 2025 12:42:29 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f995423sm416810f8f.20.2025.03.20.12.42.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 12:42:29 -0700 (PDT)
Message-ID: <d4fcfd91-cc92-4b3c-9dd2-56ecd754cecc@citrix.com>
Date: Thu, 20 Mar 2025 19:42:28 +0000
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [x86/cpuid] Question regarding historic leaf 0x80000000 code
To: "Ahmed S. Darwish" <darwi@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
 x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
References: <Z9xtfC5pL-g4LYvK@lx-t490>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Z9xtfC5pL-g4LYvK@lx-t490>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/03/2025 7:33 pm, Ahmed S. Darwish wrote:
> Hi hpa,
>
> As you probably know by now, we're working on a centralized "CPUID table"
> data model, on top of the cleanups at:
>
>     https://lore.kernel.org/x86-cpuid/20250304085152.51092-1-darwi@linutronix.de
>     https://lore.kernel.org/x86-cpuid/20250319122137.4004-1-darwi@linutronix.de
>     https://lore.kernel.org/x86-cpuid/20250312143738.458507-1-darwi@linutronix.de
>
> The idea is to remove all the direct CPUID queries from the x86 code, and
> access a pre-filled table instead (with caveats outside the scope of this
> question.)
>
> While changing the CPUID queries one by one, I've stumbled with:
>
>     => arch/x86/kernel/cpu/common.c
>     void get_cpu_cap(struct cpuinfo_x86 *c)
>     {
> 	...
> 	/* AMD-defined flags: level 0x80000001 */
> 	eax = cpuid_eax(0x80000000);
> 	c->extended_cpuid_level = eax;
>
> 	if ((eax & 0xffff0000) == 0x80000000) {
> 		if (eax >= 0x80000001) {
> 			cpuid(0x80000001, &eax, &ebx, &ecx, &edx);
>
> 			c->x86_capability[CPUID_8000_0001_ECX] = ecx;
> 			c->x86_capability[CPUID_8000_0001_EDX] = edx;
> 		}
> 	}
> 	...
>     }
>
> You've contributed that snippet here:
>
>     https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/commit/?h=2.4.0-test11pre5&id=67ad24e6d39c3
>
> Do you remember what was the rationale for the "if (eax & 0xffff0000) ==
> 0x80000000" check?
>
> You've also contriubted a similar check to head_32.S:
>
>     https://lore.kernel.org/r/1258154897-6770-2-git-send-email-hpa@zytor.com
>
>     /* Check if extended functions are implemented */
>     movl $0x80000000, %eax
>     cpuid
>     /* Value must be in the range 0x80000001 to 0x8000ffff */
>     subl $0x80000001, %eax
>     cmpl $(0x8000ffff-0x80000001), %eax
>     ja .Lenable_paging
>
> So I would assume, it would be safe to have a similar check in our
> centralized "system CPUID table" scanner.
>
> In all cases, if you know more details, it would be great to know, so
> that I add it in the centralized CPUID table patch queue changelog (in a
> separate patch.)

The problem is that for an out-of-range leaf, Intel returns the data
from the maximum in-range leaf, rather than zeroes.

On pre-AMD64-capable Intel CPUs, you'll get what amounts to junk in a
query for leaf 0x80000000, where it's probably leaf 5 or so.

Checking for the upper half of the output matching the input is a way of
distinguishing Intel behaviour from all the other vendors.

~Andrew
