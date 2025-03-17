Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448161ACEDE
	for <x86-cpuid@lists.linux.dev>; Mon, 17 Mar 2025 18:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742235033; cv=none; b=aRvfC7a63QTmZfl9XJdAqG9XhR23jOIbfdqV8lfFLYsiwjagV1dp3o7Aj+H7O6eHeZBaGTdQVrFzFBFtBuXpGlqFCvL7H0f+iXs5P+dE3VlBOq3tfqq68Ak9GHSs7+xpI3PwoVfEpUVUHLROqOzewSimou4wDAqU0PwV1G8KMfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742235033; c=relaxed/simple;
	bh=CVJOCHJfJzP/mZXBMgiM3WiL0WksiGocnoVR/Q7XAzg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KfY8nuDxDKuLJSOPVJNL7Bv90yJVk1AFt3T1QchfhsGHjYiol8jP8PSc7wHbp6fxGLwQeLb5lR/KIAFoodmnTGLNCYA+ezmqru4QE3bGDcRcaCgaZ3SodG0zBF4HxKc9QucdRPNL9qpX36iKANyp4gm0ziJuOwoC4Gddq5pamiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=l3ppMvj2; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="l3ppMvj2"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso17648055e9.1
        for <x86-cpuid@lists.linux.dev>; Mon, 17 Mar 2025 11:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742235029; x=1742839829; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7PG+DSUNNqrDtOfspeMATb4wbiF406ODvqeweE5sJnY=;
        b=l3ppMvj2ngkZ3os+tR31zWZb2snKUat5hWkzYofUZXGOb7j5kxQoaR+/fMeVu8cho1
         EIGhGoeJWxSO+v40PLG27cvtTUrCw2jfLd/NahL0PpqWU66cuohWjI+eHXNtVJbQM9Kw
         XBHZVsPvj81+M1pLqV2s+wrRx5gMNWWVKdxGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742235029; x=1742839829;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7PG+DSUNNqrDtOfspeMATb4wbiF406ODvqeweE5sJnY=;
        b=pYnevNwOUvw9dn488jyj9JQ1xV5CHzA71vn5UEBwoxIboRn9Q8eTiw3ahLS4OzCoMa
         XQAV2w83BBTjBS/n4IOTXLoAWxjN65UIMmqNa11yrMHZh75137wO2GcRrSUh4qFkC3WH
         ZC5Dtw71Swjxc05OVOTsDB4VoMMZhJsy5sIG9B3AjCXViEtytydYDnUsWbtF6yyx8ZZl
         HncpbsHx8jOUah63grH3L9RJ/fvNgPKrxZfsx2SAmRsOt8n8bQXYxetP4/N3y+ypk4Og
         JOJsjasIAVFMAIM/2lZptbcA8pnOrwLql1RJ9DmQVy8Lv6IVNvsC1ni0F1i2i/JgYsfa
         zr1g==
X-Forwarded-Encrypted: i=1; AJvYcCVIZBWFiott7tOK5xDohixUIBq65rX1pcJCIfdhN+Kbl2hm4fcZ6D2/Y0J5pHSKOqJk8cK2phlS/Xw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8VDQoOj/7fsZPjptUnsLQC5bY4ZZldhfG1o5bU6t0jjy6gA7x
	wQOG/uqhi0I8VOklPiglZ2eSQk3KAit1cHVEKoIx1JoaMmMYu+hTlZ6NJnPQggM=
X-Gm-Gg: ASbGncvRqnEax5E/YFnmO/OZm3FL42VYXuw4+7lDyapsjZk9lOryF6o6QDT7QvaoBAT
	OOxeztxIiwvXkgaKKTrUJgqIiBz3iCOzTSmcWWgjxG9fCphw5c3B11ePPiUzCj28ufWHmHupRf/
	T6IzhjjNmnkPtm8kXjjC0zrBO9rqnM20ROGL8h8Owvp1wZG5ViXsU9Hx+A3Q1UZFR4t7X0DHt+d
	PAyEUpFDbW3hLFBl7KGnhTT4Z+yteTtVdhaWDFIbpp82dtmJ2OmSojNz5Kg1PKgO4/UsldB7xO5
	BgjZ68bM0YfW+4d481mVgS15s9ROx+sBQXKUuH9l8eRYTAq+ya/CPZcOW+4S2ve4bbSrOc/fYJi
	7T0zwCtxq
X-Google-Smtp-Source: AGHT+IF0jpwwb7NnROn6rGqUzAtjNtG/HbHxw9ICAsr83jAN0VJNxhgmSiCFYIZ21rQH3TKyi5am9w==
X-Received: by 2002:a05:600c:154c:b0:43c:fd27:a216 with SMTP id 5b1f17b1804b1-43d1ecff43amr120475995e9.23.1742235029500;
        Mon, 17 Mar 2025 11:10:29 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fe658d4sm111134425e9.33.2025.03.17.11.10.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 11:10:28 -0700 (PDT)
Message-ID: <ccf47e0f-cd5e-4669-b75a-bbba9e56243f@citrix.com>
Date: Mon, 17 Mar 2025 18:10:27 +0000
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/29] x86: treewide: Introduce
 x86_vendor_amd_or_hygon()
To: Peter Zijlstra <peterz@infradead.org>, Borislav Petkov <bp@alien8.de>
Cc: "Ahmed S. Darwish" <darwi@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>,
 John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
 x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
References: <20250317164745.4754-1-darwi@linutronix.de>
 <20250317164745.4754-2-darwi@linutronix.de>
 <20250317173216.GGZ9hcoDICYl1fBtBG@fat_crate.local>
 <20250317174848.GJ6888@noisy.programming.kicks-ass.net>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250317174848.GJ6888@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/03/2025 5:48 pm, Peter Zijlstra wrote:
> On Mon, Mar 17, 2025 at 06:32:16PM +0100, Borislav Petkov wrote:
>> On Mon, Mar 17, 2025 at 05:47:17PM +0100, Ahmed S. Darwish wrote:
>>> The pattern to check if an x86 vendor is AMD or HYGON (or not both) is
>>> pretty common.  Introduce x86_vendor_amd_or_hygon() at <asm/processor.h>
>> So if we need to check "intel too", we do
>>
>> x86_vendor_amd_or_hygon_or_intel?
>>
>> Nah, this is silly.
> Would it make more sense to have a Zen1 feature and check that instead?
>
> Because, IIRC Hygon is simply a Zen1 copy.

AMD and Hygon the most often compared together, because the Hygon CPUs
are so close to Zen1/2.

One trick you can do to make this easier is to define vendors IDs as (1U
<< $N).  This leaves all existing code with equality checks working, but
also lets you check "vendor & (AMD | HYGON)" rather more efficiently.

~Andrew
