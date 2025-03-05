Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302E919C542
	for <x86-cpuid@lists.linux.dev>; Wed,  5 Mar 2025 18:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741200161; cv=none; b=XKe2F8awyjLd4l7Puvl9UmKKSQV/GZvg8d/yfsH3/1dcEm7U17eD1VCkrycShYFfQmYxgLLdyVLgWpnGYM/KSs1bzanJYxa8J3BSg42eegl60427+vrwiHg14Iwd92+yBsnGJ5nbDTB32gP3H4oqaWahvzUozIKQTuo+8/7tA7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741200161; c=relaxed/simple;
	bh=C3OFfJZmcjoi5VkDHSmacnWyhu3vxFu+FcNtSp8imTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EFdBiQ6GoYPiyaD2ky1TWhnZzIrsyjOD/oda80Mw3LU2ylykQx54dz1ChC2XZIyIhu5cZImqbMEgt9X1C0B4kquDlHquau13kyGvlepV3CxaSAHSQT8m0um8t9HO3HMYU+ldUHf5yjuLgXKK7gCD7CuQMU57OVMwrgMdUc7HSMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=TQSsVntm; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="TQSsVntm"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso1042893066b.1
        for <x86-cpuid@lists.linux.dev>; Wed, 05 Mar 2025 10:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741200157; x=1741804957; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IVUFVvCVdIl/aQ7JSL2VcbMfl65AWHm3sfvYPRJX9q0=;
        b=TQSsVntmXScHu3D0lD+5/cry3ZzUtyP14NgJjDKYqRXWl2vwKJCmNSfMgV0R3Kk2pw
         HO2MaFrbEv4RgkGYETxzNF9GpGnGKSVIzQrCa99mTWpskCkBbEBDwoVgR8ae6ljRqdwH
         yKw/VtuOq4ItLfYwHrwr3dDRRj7Kfh8dmgDmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741200157; x=1741804957;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IVUFVvCVdIl/aQ7JSL2VcbMfl65AWHm3sfvYPRJX9q0=;
        b=RrBD/+VGU+DfN7XqNSKahozBK6ib1Z0d+JMWQ4iplMtEDZOK8AVwnEgVHEElvDzsWK
         9SwANL1m4geyMNSlEqZrInm5CEGz851Pef0m9MjaV1ivXLdqQm7ekTsjIhY6TJed3XsU
         Y+JMseDkWkeiJHmVNZ2mEQ+BdW6tEcFFZx4ie5wqfdJOx7my+hCN8rhcE6Q93UJ9BVuD
         jlSCrcG05nv//GuHozbNgjcQu4TxjjmVEi2a2U2vXw7qB/33GkfMwMqXzQ26wWUPfPaZ
         dpvA9sAQ67f0t4SiIU2CJPYOPnlh3SWHk/LbLfOl8TERRxoo0gdc6FJ9iMVodaiAsDjJ
         I75w==
X-Forwarded-Encrypted: i=1; AJvYcCX9SNPTxEnprez/ASumMT/afhkICFaraDdiaSxTG+jvILUIVWKnY6/bGsgSjl38OBHIBtL2Yis6JtY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyVrkP+rwbwiNIUT1QzFNuCI1LebO9dQmTr6nSMOM8GGvZnywDl
	orvW5UdMj+mVU3yR+JvhbtyxvMkadl3wyTOtGv4ACIB+9dPa0Bfj3UXqedk6jzA=
X-Gm-Gg: ASbGncvJvHh6uLqZ6kA1ImHNWbQSfs5QhaZhRa+DNCFSS6ZBKiOEE1mNOdVPhdHWF2t
	tMkAEhCnKGaKcLVMrubzShPNLzbF5FMlptbwXSyIDRRr/mcBPaQfvVsGWd1ftGJrC3uSqafhplK
	AJi++qGthwneC1ccqDkgGiXMLqoaBbpQoXPfhq+dLGfv1GJ9o8G5Js8dSo+x74CHCwI7+miO4VO
	GWOK5jXL0++YOwQDA19wScYCNm6cxgqHX8b/g/+nZRZs5ChI9qXZuJLUfe7gm4wJ1VUei4/BE1N
	fHw28879xBpDmAYEZbweHazd+FrrpQKlAyBVt99cz8UmnZhqM+Rj2bXTh5BzJEG7HoxL2g1KA61
	70gjwGKeT
X-Google-Smtp-Source: AGHT+IEZpgDR+wmpmO+wAvktLUsZOtdTQR7f1UCkOp9WGn+PBTvrfUQA/8nArTd60ZcaRcp0uYX5JA==
X-Received: by 2002:a17:907:c283:b0:abf:67de:2f21 with SMTP id a640c23a62f3a-ac20d9f39bamr383948566b.22.1741200157342;
        Wed, 05 Mar 2025 10:42:37 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf75c6d4f3sm590789766b.184.2025.03.05.10.42.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 10:42:36 -0800 (PST)
Message-ID: <6ba638d3-b3a3-410b-9761-0b3658e3215a@citrix.com>
Date: Wed, 5 Mar 2025 18:42:36 +0000
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 37/40] x86/cacheinfo: Extract out cache self-snoop
 checks
To: "Ahmed S. Darwish" <darwi@linutronix.de>
Cc: Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, John Ogness
 <john.ogness@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>,
 x86@kernel.org, x86-cpuid@lists.linux.dev,
 LKML <linux-kernel@vger.kernel.org>
References: <20250304085152.51092-1-darwi@linutronix.de>
 <20250304085152.51092-38-darwi@linutronix.de>
 <01367a6b-8eeb-417e-9a66-e7a64d518319@citrix.com> <Z8iahUTYuq0gVXmP@lx-t490>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Z8iahUTYuq0gVXmP@lx-t490>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/03/2025 6:40 pm, Ahmed S. Darwish wrote:
> Hi Andrew,
>
> On Tue, 04 Mar 2025, Andrew Cooper wrote:
>> On 04/03/2025 8:51 am, Ahmed S. Darwish wrote:
>>> The logic of not doing a cache flush if the CPU declares cache self
>>> snooping support is repeated across the x86/cacheinfo code.  Extract it
>>> into its own function.
>>>
>>> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
>> I know you're just refactoring code, but the SDM has basically reverted
>> this statement about it being safe to skip WBINVD based on SELFSNOOP.
>>
> Still, thanks a lot for sharing :)
>
>> It turns out not to be safe in cases where the underlying physical
>> memory changes from cacheable to unchangeable.  By skipping the WBINVD
>> as part of changing the memory type, you end up with spurious writebacks
>> at a later point when the memory is expected to be UC.  Apparently this
>> is a problem for CLX devices, hence the change in the SDM.
> While writing that refactoring patch, I indeed noticed that there is an
> errata list of CPUs where X86_FEATURE_SELFSNOOP is force disabled, thus
> ensuring WBINVD is never skipped:
>
>     static void check_memory_type_self_snoop_errata(...)
>     {
>      	switch (c->x86_vfm) {
>      	case INTEL_CORE_YONAH:
>      	case INTEL_CORE2_MEROM:
>      	case INTEL_CORE2_MEROM_L:
>      	case INTEL_CORE2_PENRYN:
>      	case INTEL_CORE2_DUNNINGTON:
>      	case INTEL_NEHALEM:
>      	case INTEL_NEHALEM_G:
>      	case INTEL_NEHALEM_EP:
>      	case INTEL_NEHALEM_EX:
>      	case INTEL_WESTMERE:
>      	case INTEL_WESTMERE_EP:
>      	case INTEL_SANDYBRIDGE:
>      		setup_clear_cpu_cap(X86_FEATURE_SELFSNOOP);
>      	}
>     }
>
> That's why I added "CPUs without known erratas" in the comments:
>
>     /*
>      * Cache flushing is the most time-consuming step when programming
>      * the MTRRs.  On many Intel CPUs without known erratas, it can be
>      * skipped if the CPU declares cache self-snooping support.
>      */
>     static void maybe_flush_caches(void)
>     {
>            if (!static_cpu_has(X86_FEATURE_SELFSNOOP))
>                    wbinvd();
>     }
>
> But, interestingly, CLX devices (intel-family.h CASCADELAKE_X /
> SKYLAKE_X) are not part of the kernel's Self Snoop errata list above.

CLX (Cascade Lake) != CXL (Compute eXpress Link).

CXL is the new PCIe.  (So say the CXL consortium at least.)

~Andrew
