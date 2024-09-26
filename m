Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95592152165
	for <x86-cpuid@lists.linux.dev>; Thu, 26 Sep 2024 15:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727364799; cv=none; b=OvR1ILy8QYcg3w2GH2TqjG/PfwWpprEBlGyEzyG9ZT6oFIpIbh8tVtKcDuxjhXeFW8LY1uZT65gDUgaP+U/Em+A7n3GYo6gOf0XstY5lEncb9tlY+PC6f6/cZmIMSTB/B/wD4SPG0oNLDHkGIUqFNxwgqO2g3lj6PwaROHwGiZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727364799; c=relaxed/simple;
	bh=QSJPWQLpIGFME2qSW1Zl+219CGs0eKuTtUfURmkjueY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sO18mcWmepWD1w0ywhjimoFJ9jffS+BBgn1ytUPa5oJUn3ovhbbjM4pwaSddF1iyIHuV8PBnKCDWvwKaygC+P3evYx0ZtsWbj81kAYnG31JaWDgyFN8AswjD3T7iQK1mTMFuTA2Ru+36TOuDzPRd5u0q9Tb/Pxgf8nbMrrsUo3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=iB57svaP; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="iB57svaP"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a8d24f98215so156279766b.1
        for <x86-cpuid@lists.linux.dev>; Thu, 26 Sep 2024 08:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727364796; x=1727969596; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EO50ob7tLiwElEDXafM3WJPuaubec59/LZcA0gKtXM4=;
        b=iB57svaPIQGgbLhIIUkwlrPMm9SUqeJ/6nnMj9IxTEE1OM33XR5J+SZViu4hCdOTRL
         9GcHPsjI3lZ5PGCgZZhaDMst6Q4wnT8OL+ilPwQ/vYCO6Y5jjcNJb6lRqywwpaKAxY80
         Vtok/Re5XK7X7WaYAD0uhcGsDfagePikL+ysc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727364796; x=1727969596;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EO50ob7tLiwElEDXafM3WJPuaubec59/LZcA0gKtXM4=;
        b=E16J/xCz8L5tBgwEp/gPItMufUgfKtNbYwlJ7YQvuv2B2E1uiiaFYOY3mCr/L8Kmft
         zcmX+yIpVNnVwxviyoLdBitDsy/kvlEhrM4jKUWmyUjfqXL4EFlCyw6lS1HuVgjDE3Jp
         7wkOxSckqMPnuxCBVH4/S/mL5Um4hlOYDuEaV73jDDzIY44rWjNkBEOqEgYtcBY2v/Df
         t6BXLbS1w2OMm21pkEFdGoWaVZCOsMsVtBFBiFcxSznW98pCLD5S0dXkFfCaFfRKyt/C
         aDkFLSCUjpVOFPr0fEz60FH0YPCJpM50bNP9LeZMBzuY18b8WDXLULoqbv61PsPhcqhV
         n/RQ==
X-Gm-Message-State: AOJu0YzgkiSeVbgbovXhMo2VlPb7l658NymRyoqMweXf4k6ePT5kXTbk
	TKCNAtqu9CMcTN0oCiRlmMsBtCcE3AKI8lEpIN4uZyOrkircML5TcoU6zXQBgNo=
X-Google-Smtp-Source: AGHT+IEo7K9+583hMoHkeDCm54o+aJzszXXTi4ZULGBD7estdo0kq5QW00UfvMz209NyXmt8MjTcBQ==
X-Received: by 2002:a17:907:78e:b0:a8d:1303:2283 with SMTP id a640c23a62f3a-a93a03f3be4mr563725166b.30.1727364795908;
        Thu, 26 Sep 2024 08:33:15 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2997f50sm9413966b.198.2024.09.26.08.33.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Sep 2024 08:33:14 -0700 (PDT)
Message-ID: <27d8c0ed-62ae-4956-93d4-f68e554fedab@citrix.com>
Date: Thu, 26 Sep 2024 16:33:12 +0100
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] db: Add Intel NMI-source reporting feature flag
To: "Ahmed S. Darwish" <darwi@linutronix.de>,
 Sohil Mehta <sohil.mehta@intel.com>
Cc: x86-cpuid@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>,
 Xin Li <xin@zytor.com>, "H . Peter Anvin" <hpa@zytor.com>
References: <20240923223213.852758-1-sohil.mehta@intel.com>
 <70cf05c3-0ba6-4a5e-a7ab-21cadad3c255@intel.com> <ZvVdzJIIqaC_javn@lx-t490>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 xsFNBFLhNn8BEADVhE+Hb8i0GV6mihnnr/uiQQdPF8kUoFzCOPXkf7jQ5sLYeJa0cQi6Penp
 VtiFYznTairnVsN5J+ujSTIb+OlMSJUWV4opS7WVNnxHbFTPYZVQ3erv7NKc2iVizCRZ2Kxn
 srM1oPXWRic8BIAdYOKOloF2300SL/bIpeD+x7h3w9B/qez7nOin5NzkxgFoaUeIal12pXSR
 Q354FKFoy6Vh96gc4VRqte3jw8mPuJQpfws+Pb+swvSf/i1q1+1I4jsRQQh2m6OTADHIqg2E
 ofTYAEh7R5HfPx0EXoEDMdRjOeKn8+vvkAwhviWXTHlG3R1QkbE5M/oywnZ83udJmi+lxjJ5
 YhQ5IzomvJ16H0Bq+TLyVLO/VRksp1VR9HxCzItLNCS8PdpYYz5TC204ViycobYU65WMpzWe
 LFAGn8jSS25XIpqv0Y9k87dLbctKKA14Ifw2kq5OIVu2FuX+3i446JOa2vpCI9GcjCzi3oHV
 e00bzYiHMIl0FICrNJU0Kjho8pdo0m2uxkn6SYEpogAy9pnatUlO+erL4LqFUO7GXSdBRbw5
 gNt25XTLdSFuZtMxkY3tq8MFss5QnjhehCVPEpE6y9ZjI4XB8ad1G4oBHVGK5LMsvg22PfMJ
 ISWFSHoF/B5+lHkCKWkFxZ0gZn33ju5n6/FOdEx4B8cMJt+cWwARAQABzSlBbmRyZXcgQ29v
 cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPsLBegQTAQgAJAIbAwULCQgHAwUVCgkI
 CwUWAgMBAAIeAQIXgAUCWKD95wIZAQAKCRBlw/kGpdefoHbdD/9AIoR3k6fKl+RFiFpyAhvO
 59ttDFI7nIAnlYngev2XUR3acFElJATHSDO0ju+hqWqAb8kVijXLops0gOfqt3VPZq9cuHlh
 IMDquatGLzAadfFx2eQYIYT+FYuMoPZy/aTUazmJIDVxP7L383grjIkn+7tAv+qeDfE+txL4
 SAm1UHNvmdfgL2/lcmL3xRh7sub3nJilM93RWX1Pe5LBSDXO45uzCGEdst6uSlzYR/MEr+5Z
 JQQ32JV64zwvf/aKaagSQSQMYNX9JFgfZ3TKWC1KJQbX5ssoX/5hNLqxMcZV3TN7kU8I3kjK
 mPec9+1nECOjjJSO/h4P0sBZyIUGfguwzhEeGf4sMCuSEM4xjCnwiBwftR17sr0spYcOpqET
 ZGcAmyYcNjy6CYadNCnfR40vhhWuCfNCBzWnUW0lFoo12wb0YnzoOLjvfD6OL3JjIUJNOmJy
 RCsJ5IA/Iz33RhSVRmROu+TztwuThClw63g7+hoyewv7BemKyuU6FTVhjjW+XUWmS/FzknSi
 dAG+insr0746cTPpSkGl3KAXeWDGJzve7/SBBfyznWCMGaf8E2P1oOdIZRxHgWj0zNr1+ooF
 /PzgLPiCI4OMUttTlEKChgbUTQ+5o0P080JojqfXwbPAyumbaYcQNiH1/xYbJdOFSiBv9rpt
 TQTBLzDKXok86M7BTQRS4TZ/ARAAkgqudHsp+hd82UVkvgnlqZjzz2vyrYfz7bkPtXaGb9H4
 Rfo7mQsEQavEBdWWjbga6eMnDqtu+FC+qeTGYebToxEyp2lKDSoAsvt8w82tIlP/EbmRbDVn
 7bhjBlfRcFjVYw8uVDPptT0TV47vpoCVkTwcyb6OltJrvg/QzV9f07DJswuda1JH3/qvYu0p
 vjPnYvCq4NsqY2XSdAJ02HrdYPFtNyPEntu1n1KK+gJrstjtw7KsZ4ygXYrsm/oCBiVW/OgU
 g/XIlGErkrxe4vQvJyVwg6YH653YTX5hLLUEL1NS4TCo47RP+wi6y+TnuAL36UtK/uFyEuPy
 wwrDVcC4cIFhYSfsO0BumEI65yu7a8aHbGfq2lW251UcoU48Z27ZUUZd2Dr6O/n8poQHbaTd
 6bJJSjzGGHZVbRP9UQ3lkmkmc0+XCHmj5WhwNNYjgbbmML7y0fsJT5RgvefAIFfHBg7fTY/i
 kBEimoUsTEQz+N4hbKwo1hULfVxDJStE4sbPhjbsPCrlXf6W9CxSyQ0qmZ2bXsLQYRj2xqd1
 bpA+1o1j2N4/au1R/uSiUFjewJdT/LX1EklKDcQwpk06Af/N7VZtSfEJeRV04unbsKVXWZAk
 uAJyDDKN99ziC0Wz5kcPyVD1HNf8bgaqGDzrv3TfYjwqayRFcMf7xJaL9xXedMcAEQEAAcLB
 XwQYAQgACQUCUuE2fwIbDAAKCRBlw/kGpdefoG4XEACD1Qf/er8EA7g23HMxYWd3FXHThrVQ
 HgiGdk5Yh632vjOm9L4sd/GCEACVQKjsu98e8o3ysitFlznEns5EAAXEbITrgKWXDDUWGYxd
 pnjj2u+GkVdsOAGk0kxczX6s+VRBhpbBI2PWnOsRJgU2n10PZ3mZD4Xu9kU2IXYmuW+e5KCA
 vTArRUdCrAtIa1k01sPipPPw6dfxx2e5asy21YOytzxuWFfJTGnVxZZSCyLUO83sh6OZhJkk
 b9rxL9wPmpN/t2IPaEKoAc0FTQZS36wAMOXkBh24PQ9gaLJvfPKpNzGD8XWR5HHF0NLIJhgg
 4ZlEXQ2fVp3XrtocHqhu4UZR4koCijgB8sB7Tb0GCpwK+C4UePdFLfhKyRdSXuvY3AHJd4CP
 4JzW0Bzq/WXY3XMOzUTYApGQpnUpdOmuQSfpV9MQO+/jo7r6yPbxT7CwRS5dcQPzUiuHLK9i
 nvjREdh84qycnx0/6dDroYhp0DFv4udxuAvt1h4wGwTPRQZerSm4xaYegEFusyhbZrI0U9tJ
 B8WrhBLXDiYlyJT6zOV2yZFuW47VrLsjYnHwn27hmxTC/7tvG3euCklmkn9Sl9IAKFu29RSo
 d5bD8kMSCYsTqtTfT6W4A3qHGvIDta3ptLYpIAOD2sY3GYq2nf3Bbzx81wZK14JdDDHUX2Rs
 6+ahAA==
In-Reply-To: <ZvVdzJIIqaC_javn@lx-t490>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/09/2024 2:12 pm, Ahmed S. Darwish wrote:
> Hi Sohil,
>
> On Mon, 23 Sep 2024, Sohil Mehta wrote:
>>>  <bit21 len="1"  id="amx_fp16"   desc="AMX-FP16: FP16 tile operations">
>>>    <linux        feature="true"  proc="false" />
>> I couldn't find much documentation for the <linux> tag. When is it
>> expected to be included?
>>
>> Also, are the following linux hint attributes documented somewhere? I
>> couldn't decipher them from their name itself.
>>
>>>   <xs:complexType name="linuxType">
>>>     <xs:attribute type="xs:boolean" name="feature" use="required" />
>>>     <xs:attribute type="xs:boolean" name="proc"    use="required" />
>>>     <xs:attribute type="xs:string"  name="altid"   use="optional" />
>>>     <xs:attribute type="xs:string"  name="procid"  use="optional" />
>>>   </xs:complexType>
>>>
> Yeah, I should've documented the schema more, either in-place or in a
> separate file.
>
> The <linux> tag means that this bit is also represented inside the Linux
> Kernel x86 tree in various means.
>
> Here are two nice examples from leaf_01.xml:
>
>   <bit2  len="1" id="dtes64"    desc="64-bit DS save area">
>     <vendors>
>       <vendor>Intel</vendor>
>     </vendors>
>     <linux	 feature="true"  proc="true" />
>     <xen         feature="true"  attrs="" />
>   </bit2>
>   ...
>   <bit0  len="1" id="sse3"      desc="Streaming SIMD Extensions 3 (SSE3)">
>     <vendors>
>       <vendor>Intel</vendor>
>       <vendor>AMD</vendor>
>     </vendors>
>     <linux       feature="true"	proc="true" altid="xmm3" procid="pni" />
>     <xen         feature="true"	attrs="A" />
>   </bit0>
>
> <linux> "feature=true" attribute means that the feature bit is also an
> X86_FEATURE_* flag.  So, in the "dtes64" case, there's indeed an
> X86_FEATURE_DTES64 defined flag in the Linux kernel x86 tree.
>
> <linux> "feature=true altid=NAME" means there's an X86_FEATURE_* flag,
> but the name is slightly different from the database attribute id name
> (for various reasons).  Thus, in the SSE3 feature flag case, the Linux
> feature flag is actually called X86_FEATURE_XMM3 (altid="xmm3".)
>
> <linux> "proc=true" means that the feature bit is also displayed at
> Linux's /proc/cpuinfo if available on the CPU.  So, in the "dtes64"
> case, you'll indeed see dtes64 flag at /proc/cpuinfo on most Intel CPUs.
>
> <linux> "proc=true procid=PROCNAME' means that the feature bit is
> displayed at /proc/cpuinfo, but the flag name there is different from
> the database attribute id name (for various reasons.)  Thus, in the
> "sse3" case, "procid=pni" because that's how Linux displays SSE3 feature
> flag at /proc/cpuinfo.
>
> So far, that <linux> tag is not used by any of the XSLT transformers.
> But, we plan to use this information as we go deeper into the Linux x86
> tree refactoring(s).  For now, the goal was to cover all known names for
> the cpuid feature bits, especially when they differ; i.e. canonical name
> vs. Linux X86_FEATURE name vs. Linux /proc/cpuinfo name.
>
> Thanks for the question! I'll indeed need to document that part of the
> schema before the v2.0 release.

I guess I need to start getting back to this...

The Xen 'attrs' need stripping. More specifically, they need to live in
Xen itself, because they are different by release, and are used in the
derivation of what is safe to offer to guests.

But the same is true for 'feature' too.  It's one think to know what the
bit means, but it's something else to be making a statement about what
is supported in an external project.

When this is used in earnest, regenerating the headers will be needed in
each stable tree to get e.g. the new speculation (anti)features, and
doing so needs to not change the other features="true" for bits only
supported in newer branches.

~Andrew
