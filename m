Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C7A2063C5
	for <x86-cpuid@lists.linux.dev>; Tue,  4 Mar 2025 10:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741084718; cv=none; b=XDp04u605n5n7A29vzKB8XqBBaJKonli4gLTnJCEfd5bM52wPI6QcH+YI5CBdVGxoZpXZQPtoKvpMDXtmrIRlsOmLTGMaC1UniGhkByLvJTDL7jXK8lUzqlaakeS0OuzltK0huF1NTtwhkn/MXzEYwF6EVejOz+rpmY8pFku8g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741084718; c=relaxed/simple;
	bh=+Bw7XirvpxT5oKw5f1yKqDDpyEZbMtAIUVlUkrhS4eg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JkKZncTwcuICwUs2cLhRcmHMj8ANHT6XpkOR05XafdaBoqiF6hZVLqBBrJV0iGtrIjMTvejFR40dadaUT3kUIZeA94B7Kgxw9Un/texxjvHblxbjbWbj7ZzpImqsq1XN82I6oS18+TVwPGv1tYw9OfNYkfxQFmXQzIDlH7NRx7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=ZKbL1UT6; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="ZKbL1UT6"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4399a1eada3so49639345e9.2
        for <x86-cpuid@lists.linux.dev>; Tue, 04 Mar 2025 02:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741084715; x=1741689515; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=W4qVVOExrtRW+entKLUaKt+MVkIEX24hGaFt2+MT4Vo=;
        b=ZKbL1UT61olcdeCL1dBBmGkS+DrH/Ha8s49OPVREpv9NG/UnExBE8GWdoEi/ZeCDJU
         bDVLbX7FdDNGpGDNghpFwv6b1RySo1OCUSmc6xX9GrOi0w22vXc4G2Vp9exyKM/5iVut
         hRNYcB6yVJ5RNtau7an9SM2Lj3So5kHjjn8g8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741084715; x=1741689515;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4qVVOExrtRW+entKLUaKt+MVkIEX24hGaFt2+MT4Vo=;
        b=KcFPN7xWMfrL1LIK6O0Q/WMhdGACr51gB+nLGqT7EGv7Y+W7kUotw6lv5qen8zULcR
         zzzUgroY6mLzZjBt2/llV12X9/2tJOMbxsa1va5SqsWYLl8hlz9sXrDI+rwfMVPxrdN0
         PMJe4DkSIyMZnVKeWhJs4rW9Ri+xosACXVCk8sS6UqzwoYmfpmyqJSHQUFcfQBYNZFTI
         cGv02oCpwS59MmT+VXKTtmKmZjYEf3XJM92VBZUR+W/nDosLLATpeKExRbcp2RW2Div5
         SWAbSppwoYJIrXbE0yz50eGaf6p72a61A1+vesgknsOjwdbb1M7ION1xfF1TjMkiKNKL
         a3ow==
X-Forwarded-Encrypted: i=1; AJvYcCXgy5MUyu/IToa0Hqpb8zStx3yomByXlcP9Uw7GowtR1qR7To4RwX49GAYSOXqWiO4+0H7qWCITXmY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/mBYWDB5nMFaHzM27rOtc9VofpxWsiGYDTDwE/JzdoAhbqiZg
	6PuMV78oSYibm5d+NN2tEVCRdLdlI2R/NC9avST7e8Tslb2ljEZOBAL0DYK0jOY=
X-Gm-Gg: ASbGncsI/35ATPhcBVvEghndC5MSKIvNNMVkeJZW2YM1TNbVFj67e5UZLr+sv0JbbJ7
	eIP5cXcdZM5HnWa0a9lBIOmaFVZNijHJv9zNCn3cEjMgrhyinrWzhcyznYei6DJ3pw0Q+XBaBuc
	KnbgzK1BvvgToRKd1rHxNAwqYJRp6jezHS13n6cnuX5QFTTNqttgOilwD6dN9MOOjxrvp4EpgVT
	gi24U+fRsOQM/C7Y3Oud37JRq6xAXTuezjB52czJShpFC8xPa06kr4jWfVBb4rzSYkptUVqfNMX
	4KOTH+BCL445rIFLgbwuQnL58FSlUM+L6/NRlvs9wt9juDWl5tSH6C2bb3/AV4cM6/8hqnbIb2I
	jWv6wBI/4
X-Google-Smtp-Source: AGHT+IGDzu80tz1rHJvOV0uZWSIgAnFYmFBxu/NV0NJKiiusnGA5MNIT3f8/IIJK2mMGb4yfc07nQA==
X-Received: by 2002:a05:600c:3ba8:b0:43a:9ef6:77ec with SMTP id 5b1f17b1804b1-43ba697ef79mr129556435e9.23.1741084715192;
        Tue, 04 Mar 2025 02:38:35 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b7a28b285sm194398265e9.33.2025.03.04.02.38.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 02:38:34 -0800 (PST)
Message-ID: <01367a6b-8eeb-417e-9a66-e7a64d518319@citrix.com>
Date: Tue, 4 Mar 2025 10:38:33 +0000
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 37/40] x86/cacheinfo: Extract out cache self-snoop
 checks
To: "Ahmed S. Darwish" <darwi@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
 John Ogness <john.ogness@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>,
 x86@kernel.org, x86-cpuid@lists.linux.dev,
 LKML <linux-kernel@vger.kernel.org>
References: <20250304085152.51092-1-darwi@linutronix.de>
 <20250304085152.51092-38-darwi@linutronix.de>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250304085152.51092-38-darwi@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/03/2025 8:51 am, Ahmed S. Darwish wrote:
> The logic of not doing a cache flush if the CPU declares cache self
> snooping support is repeated across the x86/cacheinfo code.  Extract it
> into its own function.
>
> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>

I know you're just refactoring code, but the SDM has basically reverted
this statement about it being safe to skip WBINVD based on SELFSNOOP.

It turns out not to be safe in cases where the underlying physical
memory changes from cacheable to unchangeable.  By skipping the WBINVD
as part of changing the memory type, you end up with spurious writebacks
at a later point when the memory is expected to be UC.  Apparently this
is a problem for CLX devices, hence the change in the SDM.

~Andrew
