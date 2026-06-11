Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774AC3BCD07
	for <x86-cpuid@lists.linux.dev>; Thu, 11 Jun 2026 09:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781170654; cv=none; b=p0XqaOQNEp/PZurV3nk1d6vh4DqV47i6BtURZeQbMdOX5RBHluXgp3Yg8hgdvRonWmpAWOJjBwuTnooSEbcRaeucWvqb0CpA033qgSjnVINELFlSZRp1AFv99lyNNX9Oal93P49KeCIStHbGcZ5Mj5C3w5fMtuEXninwmo2BbzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781170654; c=relaxed/simple;
	bh=qNDCZ3s2+BeRVYDQwhkS7VHfE7GSVj/YTmjyxLwGJHo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dfdjvMrUBkParKMIaE5oPYm7hzhq+Rr3FEBQU+gBSCkz6h3aElJSRjKPDWWXN/o68qFuc9EbBL473wJ8S25ZPsHuxCRlzm+BQ4C9pTfNlaBUiLflJjUIkEJOKprZJ7af073rzW/QUVvpDkyI3QMvdE0JDGfabKttcDCGwsmfytc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=og6pU8tB; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="og6pU8tB"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45ef779c1c2so5345284f8f.1
        for <x86-cpuid@lists.linux.dev>; Thu, 11 Jun 2026 02:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781170652; x=1781775452; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZL5FenLXXncXQuI1FqBjdO6QXMmgEWyCnYxNBYcyD7s=;
        b=og6pU8tBQvWFGSZIHimKsa7Pt5mMpCCb7t5u7IzxdcjUcqUOWQ9KBdS/+UqCJAap7C
         mQIiNoevfnlrZcvHabRFrFdo+qC3jzd6Rv6OCod+eOyVFsPMQw0UOBmCiWDdrsnUZ1Ih
         OvOFQMD1onu2qOYKqxOY4QUDsNuGc8DV89ksTJ3ExOU1aO5SslJelKwNh+G8eyKMU6wN
         C+4suVrXONadyzwWs3NdCT/73v3CZtLSNzngOOxWbBnb2/TOsY+HxjooOKo0FlBHq4bV
         yWR4ub1kKaM+BWHc6YgHMJ03R9TANr6cn74Hc7vzd1YJ7Vu7uXzaad0qSX4y6m939lOA
         hOzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781170652; x=1781775452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZL5FenLXXncXQuI1FqBjdO6QXMmgEWyCnYxNBYcyD7s=;
        b=pwChTDuS/krbo/EUxiqvH3j7QV6SRoDa5Nw3x+4AoSCPcLXZ7N3co70NOdn3+DJAAy
         UVgqK4WepKnFmCjP+jf9OvmfnqcDAYVTXkMM6A/uJf/wlytkHVGCNfba1Z2NhvmXGXkN
         FBaEiK3dnYSQLQaTU5QA6IuDkpPLUBCJdaBSokZhEVUc0GdEWkJEANjX/k3Y6l0Ek+2/
         WU49SZ4sTjKZOL6lSMIwdTFAz7JnRk9gXQdqo7o72kw1mw4Eksr4nfvAny+rrKYyFSvH
         /v7uO6MpluGYO9yTX0kv9A41coVlzBEcocABt9XKJXY55tAEn8UY9hURa+53OtPGIhEp
         UorA==
X-Forwarded-Encrypted: i=1; AFNElJ/HgFmKp8FHLwmcqtJLxlMOkFjKwpU+XvbYUV5XobHofoOPR8jXmadYL3w4oruzrX8GVQhYJsvzsnQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxUnX1t2WXeYJnc+OZlFJQlu2wlxTzlT/+Q22zetl+BPp5G3Zp8
	4S5kwSDF+kCDCNvEACW4h2MhqiOMXaEFOI3mqXPzRrjCSIv0wbYh6Vnr
X-Gm-Gg: Acq92OGMwjnlDKcOex5Mm01IBmHYE9ga76l6x4Rz4lBrqQJFgehocPXxlWugf2R3jyt
	W5qHdPsWoXRdboCdNMlzIWIKV4cTKhzs0ssyvdyk64dEAx+6j0l6USWvys/J7gX6A9/dt//gC4l
	jpPoayBFlL4cHIx/HalQ2aJhMtSo+EwWLIE3W1Egm3KKrgYjCtOGhY/M3378zM+jM3Tyw28ZOfI
	MZ7VCU37Ndg7bb8sgKs/6r6DOJCGrQoKIdS0DQSxeLs+1GBAHZ8dbpYchjqIBDjKntsn4vqb1np
	61fuTk9D4r7lZ/NUDYJaA3ycg7qE2PdGtIkR2nCZPygM0ZnVXrumV2e4SlafSHyLDJMkdXTt8h4
	+8KstWmjX6NRb0m+iFkURXF59QvtgyUqZuERB9s4/uwOLMWxKRdnQQeXjN9cEHu8N3g363kXhlu
	2htRkN66Dy26j2Y4RyqZyYuKg/61Ow7+bqeMQNGkJvMgHH8Hd3xGTnJBR8kVhU3y2+FrllrAo=
X-Received: by 2002:a05:6000:4013:b0:45e:fa7b:a7cf with SMTP id ffacd0b85a97d-4606747756fmr2716997f8f.2.1781170651827;
        Thu, 11 Jun 2026 02:37:31 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46028a6dcbdsm66962567f8f.7.2026.06.11.02.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 02:37:31 -0700 (PDT)
Date: Thu, 11 Jun 2026 10:37:27 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
Cc: Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Thomas
 Gleixner <tglx@linutronix.de>, Andrew Cooper <andrew.cooper3@citrix.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Christian Ludloff <ludloff@gmail.com>,
 Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, Sohil Mehta
 <sohil.mehta@intel.com>, John Ogness <john.ogness@linutronix.de>,
 x86@kernel.org, x86-cpuid@lists.linux.dev, LKML
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 015/120] x86/cpu: Use parsed CPUID(0x80000002) to
 CPUID(0x80000004)
Message-ID: <20260611103727.04329c2a@pumpkin>
In-Reply-To: <20260528153923.403473-16-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
	<20260528153923.403473-16-darwi@linutronix.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 28 May 2026 17:37:37 +0200
"Ahmed S. Darwish" <darwi@linutronix.de> wrote:

> For CPU brand string enumeration, use parsed CPUID(0x80000002) to
> CPUID(0x80000004) instead of invoking direct CPUID queries.
> 
> This centralizes CPUID invocation to the system's CPUID parser.
> 
> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
> ---
>  arch/x86/kernel/cpu/common.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
> index 9b05a747161f..3d5b5df544d1 100644
> --- a/arch/x86/kernel/cpu/common.c
> +++ b/arch/x86/kernel/cpu/common.c
> @@ -826,16 +826,18 @@ static const struct cpu_dev *cpu_devs[X86_VENDOR_NUM] = {};
>  
>  static void get_model_name(struct cpuinfo_x86 *c)
>  {
> -	unsigned int *v;
> +	const struct leaf_0x80000002_0 *l2 = cpuid_leaf(c, 0x80000002);
> +	const struct leaf_0x80000003_0 *l3 = cpuid_leaf(c, 0x80000003);
> +	const struct leaf_0x80000004_0 *l4 = cpuid_leaf(c, 0x80000004);
>  	char *p, *q, *s;
>  
> -	if (c->extended_cpuid_level < 0x80000004)
> +	if (!l2 || !l3 || !l4)
>  		return;
>  
> -	v = (unsigned int *)c->x86_model_id;
> -	cpuid(0x80000002, &v[0], &v[1], &v[2], &v[3]);
> -	cpuid(0x80000003, &v[4], &v[5], &v[6], &v[7]);
> -	cpuid(0x80000004, &v[8], &v[9], &v[10], &v[11]);
> +	*(struct leaf_0x80000002_0 *)&c->x86_model_id[0]  = *l2;
> +	*(struct leaf_0x80000003_0 *)&c->x86_model_id[16] = *l3;
> +	*(struct leaf_0x80000004_0 *)&c->x86_model_id[32] = *l4;

Those assignment are nasty.
You could probably use an anon union to do:
	c->x86_model_id_leaf_2 = *l2;

-- David


> +
>  	c->x86_model_id[48] = 0;
>  
>  	/* Trim whitespace */

