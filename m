Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF50D207A03
	for <x86-cpuid@lists.linux.dev>; Thu,  6 Mar 2025 21:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741295273; cv=none; b=R0w5sQJuKOvLfxbv1zeu+MZpEkLLkGIdvRDEiyKqzF0ebCYGh8vqaodfMUecXYUk5RNXpzhB+akqOmFQWlS0+m2/u1pQzfOiSg8XnYSsOLI1y3zO3b6uiups3RMz1h02wz/JVQCSbXy9AESTM2g+rPx/UXs9pSVbnneK0AleJYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741295273; c=relaxed/simple;
	bh=Vlo0AiwzGRy66OHyDYS0KriNF7fYNWF2EEn2K+6ZGkM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sSYsoRgBvl5SEiBTo6LHNNH/VPPBMAtMlJlp2l9w2Tg4febvnTI0FgKxQh3UD1tuGOi6yvku3A5WxzLJO9hZSaw77DQoAzjpGRp1sdKtaV/TtNnb3afblU0QD/es5iB8jLh6hytL5Q/6wButODjUuxHw09Bjy6Mt/4xD84U+GlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=BTUSa9ww; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="BTUSa9ww"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-390e6ac844fso1005212f8f.3
        for <x86-cpuid@lists.linux.dev>; Thu, 06 Mar 2025 13:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741295270; x=1741900070; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=c2kNo1245tP1bETmArOySHs5HV6f6m4/M5qZ39i0p8Y=;
        b=BTUSa9ww0tq2UJrAzN4k9n4DFYBVMfNBV8m0D5Pqact4H+TfshPPDVd0GFyQkqw2jB
         vWajaTAOqwoo1uGIqUSAcr4BOzQp6l4aTLPZgLuAmx11qdW4/QlYKvAYpIOJnkiE9PMO
         kGl4ywEnHKe8Dry5nWmSMFy5SQ4fuIBmwM1jU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741295270; x=1741900070;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c2kNo1245tP1bETmArOySHs5HV6f6m4/M5qZ39i0p8Y=;
        b=UoX+iEtTkPEmLpkZld0yjidytMZA1Nu/DmBhrISk+0Bfo4s3wzYX35/js5WHhKLWae
         b7d50EHHUQbB5+0Y+69gyBv43pCoxWgQ5OvnTQDkvihZBWKHAmeZ5Iov6RM0p5vBYTP8
         tN801HiYZdjIm2Xb6E2doeeY9cXPbWnBrUGn61zM4LIlsoruYYneXM4RT8xX022r+z4k
         54qQ/w4S7n3hP9pecyEqCMb/z5BqePv4iR8gdacQgcv9xga7Q8spZtT/Jsrtnl9NvVRA
         W+Z0YlS4U1hOHwztDnEQCaMubZ4gbeS524+aFmTxFGnOvb3xlRGHWHkY0bsmRUXDKt3S
         vJjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzRADvYPoBNqqwdIOTeW+ZEFEgBjJnAerHRWqbZwVDHX0+iWi3gyzm+5gNm29PjsV09EJvF/wrcAU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyQzGlv8Ji0HUix0kjMoDLqr5UtjN4azBn+Yz9i9NUSdUBOQpXe
	rjzHu+Nw+CAr6rjQY45E1ke69AbSDtIvokrRA+zBBklA7+FR693Bq9OGn2ecsYY=
X-Gm-Gg: ASbGncsNQ1MdB1lakcc8qRV0gPEB45b6GzIwoKvbC+if/edRA68sfCbaGmUdzKc4tPE
	3w2x7Fr50gQY+dkv8JABfbCcwKphdepIfshMSxlym7I95OD0CXby7q8NIm8KV2eUCQwt5YsXHvW
	i9P8tiboTbnT/8PGZX6VbtXLZhGLcMx48SQT6LixRK9YHoWy3et4QsRlLR8nPUNEA8j1Ew4DACd
	85A6XKjyix0tx2etytPslEhX1jPEdUbgPHXdRlpRJyorq8DiYu5QUYg6wuHD+h7oiP4K08tjQ4L
	YRCGZm/p3DSazNIhQnaewFoKezyrjvVMGrXyaUZN9ukNQwrPNo2sAffVpjQSRAh9sQFKbYn+IEf
	V3/fNzAHx
X-Google-Smtp-Source: AGHT+IF/KwqCUWrwwOkk1hrlYGnd0QVj1q31c1PeWodBjakcgGYj3qpqhStA5n9FqEUIUxVMbzT3Ag==
X-Received: by 2002:a5d:5f93:0:b0:38a:88ac:f115 with SMTP id ffacd0b85a97d-39132d98703mr395285f8f.34.1741295270025;
        Thu, 06 Mar 2025 13:07:50 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd8daadbsm30459385e9.21.2025.03.06.13.07.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 13:07:49 -0800 (PST)
Message-ID: <01a2a955-98a5-47f6-aeb2-275ba840a9fa@citrix.com>
Date: Thu, 6 Mar 2025 21:07:48 +0000
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/12] tools/x86/kcpuid: Add rudimentary CPU vendor
 detection
To: "Ahmed S. Darwish" <darwi@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>,
 x86@kernel.org, John Ogness <john.ogness@linutronix.de>,
 x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
References: <20250306205000.227399-1-darwi@linutronix.de>
 <20250306205000.227399-8-darwi@linutronix.de>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250306205000.227399-8-darwi@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/03/2025 8:49 pm, Ahmed S. Darwish wrote:
> @@ -145,6 +166,40 @@ static inline bool has_subleafs(u32 f)
>  	return false;
>  }
>  
> +/*
> + * Leaf 0x0 EDX output, CPU vendor ID string bytes 4 - 7.
> + */
> +enum {
> +	EDX_INTEL	= fourcc('i', 'n', 'e', 'I'),	/* Genu_ineI_ntel */
> +	EDX_AMD		= fourcc('e', 'n', 't', 'i'),	/* Auth_enti_cAMD */
> +	EDX_HYGON	= fourcc('n', 'G', 'e', 'n'),	/* Hygo_nGen_uine */
> +	EDX_TRANSMETA	= fourcc('i', 'n', 'e', 'T'),	/* Genu_ineT_Mx86 */
> +	EDX_CENTAUR	= fourcc('a', 'u', 'r', 'H'),	/* Cent_aurH_auls */
> +	EDX_ZHAOXIN	= fourcc('a', 'n', 'g', 'h'),	/*   Sh_angh_ai	  */
> +};
> +
> +static enum cpu_vendor identify_cpu_vendor(void)
> +{
> +	u32 eax = 0, ebx, ecx = 0, edx;
> +
> +	cpuid(&eax, &ebx, &ecx, &edx);
> +
> +	switch (edx) {
> +	case EDX_INTEL:
> +		return VENDOR_INTEL;
> +	case EDX_AMD:
> +	case EDX_HYGON:
> +		return VENDOR_AMD;
> +	case EDX_TRANSMETA:
> +		return VENDOR_TRANSMETA;
> +	case EDX_CENTAUR:
> +	case EDX_ZHAOXIN:
> +		return VENDOR_CENTAUR;
> +	default:
> +		return VENDOR_UNKNOWN;
> +	}

Many CPUs have ways of overriding the vendor string, thanks to
GenuineIntel being hardcoded in too many pieces of software.

I suggest you check all registers, lest you find yourself on a CPU
claiming EBX=0x68747541, ECX=0x6C65746E, EDX=0x6E65476E

~Andrew
