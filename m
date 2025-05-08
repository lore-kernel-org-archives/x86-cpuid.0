Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F05C20ADD6
	for <x86-cpuid@lists.linux.dev>; Thu,  8 May 2025 20:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746737897; cv=none; b=VvB1DyGkUkOGWdgCawl+8Dq1h23vGg8yH0dtrZ/18e3bIwfR2H9UbFQS3HaqVxIVBgktmsqDk4qUpd5cXw1K9wGcVLcsD9rQFu26EjfSegi8YbWTXq0TyZdzvisxiWsoO2yxuIVWMK/9CYL62hjo+ExbpK3d37FCsGASawMErzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746737897; c=relaxed/simple;
	bh=W7chHJfhxi85WL2IT+EHOGtMWhzPMskyIZBUlGXn84Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l3uT5BMJm3xisZf48BJBO4kw1+XuA1LOchsBAeVPMWLknQqW+q9urFLdwTjxxSeRoIsL2glAjp3hdGBI3PDHrCtj6rRrTUXROLR1qTh9EWpIhdo1rZMhIfguX5RHq6KsSeWB2aNJYBtaIaYFikZrz0Bxt+8UBucgWf/2/4l0F60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=eLpTlJzB; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="eLpTlJzB"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so11068095e9.0
        for <x86-cpuid@lists.linux.dev>; Thu, 08 May 2025 13:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746737894; x=1747342694; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BOSzqopIu9zZ+c+nTbeQaCp66lLTtB4jYkY+8dqA/X8=;
        b=eLpTlJzBQh6Lpv+sR8RPlXFPd5gy2MWngjQ3IgrujpDIgF5ubV0HKtqwEPj510A8Jl
         s2cZ+a39HHbbZrPAJo7KyA/I7gVRPHgNgyPvAb5o8UbTmy9QPiUcM8OyzvXlOfxmq1oZ
         JLMgupiAdv0aA4awrj8+KCmaCj+gHrEI/C02o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746737894; x=1747342694;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BOSzqopIu9zZ+c+nTbeQaCp66lLTtB4jYkY+8dqA/X8=;
        b=edMHT06IiuPeRDC5ll8ddihhYgp6nqxz0rETQ8H6pMwZ7I8AYGUixFHX9Jt4RJg5sg
         F/tRxOYinKwkig/t4TOOYIx+w8ic279bRZ+S23Dw/7UggkJXzt5/qkGyxnWAq+r50D/H
         BXvdq67QyMjeNRZkMDuVFnBNK87q6OKP+XBUXhbZd0VvBxHodD0ovom3qHu0EC3npyLy
         B+AMaHbUOcofqrgDWfd+evIIh0yGs5TO4JoxQHOdyDjwMZJ5tq/bxZXzPA8CKUDxFHIj
         /eF5UQTw7YnqFDUDwinyCJXcwAvoDwzwLmD7HSpAVJ6uTUXQy+25DQXLIGdd6V6m5CjS
         eVxA==
X-Forwarded-Encrypted: i=1; AJvYcCX2dufwlC7cuR9m3sn9sLMxtJqj4La23QOXt7ceCx8jwLdJLg2R0HD1fsM+Bokp47beHbGvtwKfm5U=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywb5EFQ1nnDCp2zIEVGbDBug/fpCHROx6+8XhtdF3whnWepVp+5
	rsemvGt8ZuhmxqIhBf+clTfRenn55utqX+wxdHPQc0ARnrrtqpAl3AZjI0hypz0=
X-Gm-Gg: ASbGncucAi0hPehltfIjiKSy3RqUGKgcQLPdtOTBI3E9ayxECDDKN528Q5lpLh0A+S0
	khklP2Bo12ZKdco4b+UZIGiZ/HtGDUdaokqRtCdD3wnyNH1W9OV96W9/tqbJfBKkEJwTPb2V+xL
	XqXNPeifF8f33HKtPjOWOF0OXHnq5zUTvcyczT4sjlSDKT3keU7bvC4FOMiss7q42RBOCV0TD+D
	sT7BUM56Nb5PDcBMGFED+Tqdlxf34TG8LIPmuBaOtIW+TIy1fVAmzspOSIcVgSInvlpNpP6wOTI
	6HeDqba4bU7yUPl4maAq8EVI597AutW8nyYVXSK5fgEbLPTpJ0XclcIfIh/kHP91AqZRFe+j3cU
	HCU/UIg==
X-Google-Smtp-Source: AGHT+IG6zo0xvPubnxJo2iuk8gjRa9iSWj7f9AGFYoHGK9lEyDmENrlQHsiViy87Inv+LW0zbxmrJQ==
X-Received: by 2002:a05:600c:8716:b0:43d:26e3:f2f6 with SMTP id 5b1f17b1804b1-442d6d19050mr6575485e9.5.1746737893799;
        Thu, 08 May 2025 13:58:13 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67d5c35sm6898535e9.5.2025.05.08.13.58.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 13:58:12 -0700 (PDT)
Message-ID: <3af01720-6bd1-40cd-9292-2c35ae22296c@citrix.com>
Date: Thu, 8 May 2025 21:58:11 +0100
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/26] x86/cpu: Sanitize CPUID(0x80000000) output
To: "H. Peter Anvin" <hpa@zytor.com>, "Ahmed S. Darwish"
 <darwi@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
 John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
 x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
References: <20250506050437.10264-1-darwi@linutronix.de>
 <20250506050437.10264-3-darwi@linutronix.de>
 <6b0c87e0-d98d-4394-85bd-8abf556ebf0f@citrix.com>
 <797B7A87-AAFB-4302-96E6-3FD956D614C2@zytor.com>
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
In-Reply-To: <797B7A87-AAFB-4302-96E6-3FD956D614C2@zytor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/05/2025 9:40 pm, H. Peter Anvin wrote:
> On May 7, 2025 1:50:48 AM PDT, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>> On 06/05/2025 6:04 am, Ahmed S. Darwish wrote:
>>> CPUID(0x80000000).EAX returns the max extended CPUID leaf available.  On
>>> x86-32 machines
>> How certain are you that it's all 32bit CPUs?  AIUI, it's an Intel
>> specific behaviour, not shared by other x86 vendors of the same era.
>>
>> ~Andrew
> All 64-bit machines require CPUID leaf 0x80000000.

Yes, but why's that relevant?

What I'm querying is the claim that all 32-bit machines behaved as Intel
did, and returned rubble for out-of-range leaves.

~Andrew
