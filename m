Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD70255244
	for <x86-cpuid@lists.linux.dev>; Tue,  4 Mar 2025 16:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741106382; cv=none; b=gqRxdNCQViTCZzLTqoAeCuqbkuboVLo4htCKf21Q/vbCcledKDeoRIn4IJWxqU/261uJ+2we/pYUqKxAzv2UTRgq7I7gYfyDJf7aRGSgvuLLGtxd7yomV0CjcGFMWMZ6BcdjGMpCuINHBsIkRdSKium9vYrVoxVlbfRdYJVnnh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741106382; c=relaxed/simple;
	bh=vrpakeUapR1kXotjM05oiiEq4cohCZCpT8b3gVrQSTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I00yWDgtaJtKr1voPDP4Haizg+ALpRPCAyzEIYBwcY4swpD3tC2JSjFTnqSY+b9TgypPh+Ss9d0g3tIE9PC14JuDKRfOYKwOAfcYej6p8bTRQc3wA0zuyHWrAuehXqc4gOKPNdcnhy30HIgsxUUJvkfBMkDFq77r8wZc4gewxLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=ibHJylj7; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="ibHJylj7"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38a8b17d7a7so3477464f8f.2
        for <x86-cpuid@lists.linux.dev>; Tue, 04 Mar 2025 08:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741106378; x=1741711178; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mdB7FuR5CK0zV14hlhn4UvE0InDPFjRxNP/NjFXpYSA=;
        b=ibHJylj7T4IdZDf5iEBg+LC/aRosme16h8nvxPZaUJgKm/h78HDe6qGHj/eIiaFUQj
         BaJezaoNYhLoV7OQw+P5lY7QcPJUDduFLEN6rP8ZXE9OBqtaul40eRBz/QRo7FIiwaMI
         ueO0DNieJYKVLbnMaULxGCcgPvRIj2Wc4dYAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741106378; x=1741711178;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mdB7FuR5CK0zV14hlhn4UvE0InDPFjRxNP/NjFXpYSA=;
        b=HmycK2Brj0JMY2Ok8PO0Oe1wrLr2tgqcDRElbG6ILsEHcvNyekXa1qkKHyUd2VUCH4
         T4CnwHyiy+XS2qGc2sBMIw822JtZAzh3oqqqj3VOG9WHlP4+hK/mmpxeMuLbY2bHMA+s
         4fHg9lyVPKPBA0t2OrDpHl4zfccO8iZNZjdrrOnrf9LC41mHGqaT6RAX3PjX20Kv+h1b
         cg5fibtJFIGe8szYTVwik4A1hgE4nQkPBtbr50mWBS2DBl1SGMl0xH4bCE55q1zKmKWZ
         kEqnBWu3lJ4RktjKTIY0Vpif4yJOGJ66fl4hF7uLGhnox2v5q2+ypSkDTMTBltnM5LIo
         Bp4w==
X-Gm-Message-State: AOJu0YxfNgzXCIAMChgtRI6/NUDO/TqDn5Z+RlcEpLCnoYZxQ8o1U/CC
	m7v3FqN3EgczcSeLGbvgSBHGDo8fppys7bgYB0q5MXlAeQsbWXy83Low/pzOgKs=
X-Gm-Gg: ASbGncstSRuJh3hqD9H8EAfneearHEXuBJiiMUdC7/bcmy6y5c3Th+/lzXgmyMXmXbu
	qN11BbUcGLKAjqA5AAJ17U6n+MBs3mh8bchoIha8W0v/knpL3ovkXUcDvjGWaVybIpn3/cK42HO
	ZKj7YsNwPzxKGPlnjfbpd7BX7DnJPqIUmsG2r1V5axTGP4JUI8YNolQFiYGI0HTwVtyn6xn8E6t
	/ltHmz3sZxVZ1Mh6Ii/lFtqClWEMZVBq2LTQyj5SJpweQmFeolX4dvS1VM3dOVCz1qtNe8+jcV7
	kbEzx08bqU2yGu4AVplVaUxy8YJFlq+XGQpibENfDRbZ7haiyF1s6heArL/IMLrOLh2JN9QPmkg
	dnn+o0Gpc
X-Google-Smtp-Source: AGHT+IFloopzW4ELOCnMliO9JRSxA1+nnR8fQBkcmE/WJI6ceXtOr09qQzc3h5np3Xwhha/7PvTb4A==
X-Received: by 2002:a5d:59a7:0:b0:390:f88c:a6a2 with SMTP id ffacd0b85a97d-390f88cacb6mr13619397f8f.39.1741106378086;
        Tue, 04 Mar 2025 08:39:38 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796600sm18012834f8f.20.2025.03.04.08.39.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 08:39:37 -0800 (PST)
Message-ID: <75f69ad1-a6e9-4cc6-8eab-98baadb09385@citrix.com>
Date: Tue, 4 Mar 2025 16:39:36 +0000
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] db/leaf_1d: Correct XCR0_CET_{U,S} information
To: "Ahmed S. Darwish" <darwi@linutronix.de>
Cc: x86-cpuid@lists.linux.dev
References: <20241008135208.2567502-1-andrew.cooper3@citrix.com>
 <Z8cqeSTtB8m--zFl@lx-t490>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Z8cqeSTtB8m--zFl@lx-t490>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/03/2025 4:29 pm, Ahmed S. Darwish wrote:
> Hi Andrew,
>
> First, I apologize.  For some reason, the x86-cpuid list didn't forward
> /any/ emails to me, and I've just discovered all the pending ML emails
> through a random check of the lore archive :(

No problem.  Honestly, I'd forgotten about it too.

>
> On Tue, 08 Oct 2024, Andrew Cooper wrote:
>> The description text itself mixed user and supervisor state.
>>
>> Furthermore, CET is not an AMD-exclusive feature, nor even AMD's feature; it's
>> Intel's feature, which AMD implement a subset of.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: x86-cpuid@lists.linux.dev
>>
> Thanks!  Now merged to tip:
>
>     https://gitlab.com/x86-cpuid.org/x86-cpuid-db/-/commit/cc6d4e32259b

Thanks.  I guess I should follow up with some of more fixes.  (Mostly
about how guest kernels must, or must not, interpret certain bits.)

~Andrew
