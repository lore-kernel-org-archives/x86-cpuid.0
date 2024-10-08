Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE111D362B
	for <x86-cpuid@lists.linux.dev>; Tue,  8 Oct 2024 13:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728394703; cv=none; b=D7WX6+axUqERaqGR0XvjWE3ADHmay3TC1gxDX+iXRPtG7hvfdtI80ky5ApLLtuhOAQkC2mLglFK1Oc/etLrURFMKBaHQNdoOu0FxYshiOogPyPRyowSuCSSjM7cMthmTOAxaeTMnGw/eGv2Y7us8G7Pz79zlxuGhZUlQ68ebDr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728394703; c=relaxed/simple;
	bh=O/DJF8QaFTVt8ng7A9lDHnkL43TRC4kbjBua/S78vHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e9wGR7ztqkPJVErDuv3OU0gII2PeSsIDgnS7S9e7iyfYimRnFOf9mid9UdqBFPUIEFXdovpN+bCdofHqF2B+22cYUJRu+PWReGOe2eTnX/sjgjXE/8bNs90b+7j6teAJw1W41E01p7DmxKhhq1pJo7/mEeHCyLn2ra+kDf+pnKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=ess2ZBv6; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="ess2ZBv6"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5c5b9d2195eso8040308a12.1
        for <x86-cpuid@lists.linux.dev>; Tue, 08 Oct 2024 06:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728394700; x=1728999500; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hyIsEzvAC9kso3P/ACx6wqdWFmj5EAjywZd8U076dbA=;
        b=ess2ZBv6zjxgiqKseMEmafSv3bKaa12bOldDp0Q8PzJ3wSpMlhR4kCtTkq6k72pGnQ
         a5+MpTpKiarH6ZobXjTYq3PapIODk8QnACl+ok1ELRJLuqpjubfZt9j8OwYFiQ6r55T8
         OrUpbrsih4gvk7Y6tBGrr6jX/oMX1/TtAHaZw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728394700; x=1728999500;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hyIsEzvAC9kso3P/ACx6wqdWFmj5EAjywZd8U076dbA=;
        b=xTZNh54UYltSfM5PnYq3zG95vpmi3oZ2zM5VBzjN42HHzOGqUvf6uAE3a1M0zJ7rVv
         x81jn1SHcy4f6nAvJVnQSYHTtddddqbahh2D9e2IsCMLLYWZ7ak+kXxhdZU6bfx1+lHT
         tnUDYiOj+h+IdPFaLI3At0ohsy4bqxl9CBTud0jUaGGJUHd4pFAGfEPzFZbsNFSTyv54
         1Nb2swwmwA27veMujz/O/yOfJHl/B/OmiWB1dXMlvAQtNePwCmNFkuqy7YM6wK7XTn85
         KPOXBDejhvWudyLCN2htiwGTeLlpuHYxYoDmcbubIxzUG063QqUJHpGT7cDgI86VFfCC
         PUIw==
X-Forwarded-Encrypted: i=1; AJvYcCUqvwuVgZ3iyGcqXBTKozmDK+t0Z624vMfF3tbk/ZHEbhHBpo1UmvKQhbK2LDtOEjQIL4gjF95t2Uk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5ZV30v99Vw1rt9G+IHXm8nhBOlT5DkZb/5v8VZ74VszoOwcE4
	yXuKDdw7+SHbQWjzdZOykENXXfmPSw1hZ8OJY5ePqTL/UsH/MrTKpYkqqOfExuM=
X-Google-Smtp-Source: AGHT+IEockzVU6BUbof0Fs4SGjLra1/kt+jbE65dg0BuJS51grI0CQ1crqmv5zVGFbn3+RX8ka53mg==
X-Received: by 2002:a17:906:c10e:b0:a99:76a9:a9b3 with SMTP id a640c23a62f3a-a9976a9abb7mr213683666b.14.1728394699809;
        Tue, 08 Oct 2024 06:38:19 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a992e5d0a3dsm508027066b.24.2024.10.08.06.38.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 06:38:19 -0700 (PDT)
Message-ID: <55f755e9-2712-47d5-82d5-d6e685969461@citrix.com>
Date: Tue, 8 Oct 2024 14:38:17 +0100
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ANNOUNCE] x86-cpuid-db: Release v2.0
To: "Ahmed S. Darwish" <darwi@linutronix.de>, x86-cpuid@lists.linux.dev,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 x86@kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Sohil Mehta
 <sohil.mehta@intel.com>, John Ogness <john.ogness@linutronix.de>,
 linux-kernel@vger.kernel.org
References: <ZwU0HtmCTj2rF2T8@lx-t490>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZwU0HtmCTj2rF2T8@lx-t490>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/10/2024 2:31 pm, Ahmed S. Darwish wrote:
> to:
>
>     /*
>      * Leaf 0x0
>      * Maximum standard leaf number + CPU vendor string
>      */
>
>     struct leaf_0x0_0 {
>         ...;
>     };
>
>     /*
>      * Leaf 0x7
>      * Extended CPU features enumeration
>      */
>
>     struct leaf_0x7_0 {
>         ...;
>     };
>
>     struct leaf_0x7_1 {
>         ...;
>     };
>
> Overall, this removes ambiguity for IDs like 0x16, and improves kernel
> code greppability (x86 PQ pending).

So what does leaf 0xd with 62 subleaves look like.  Do we really have
one number in hex, and one in decimal?

~Andrew
