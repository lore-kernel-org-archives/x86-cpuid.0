Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5923D18BC3B
	for <x86-cpuid@lists.linux.dev>; Mon, 14 Apr 2025 19:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744657968; cv=none; b=X3IxGxLxZQe3vFebw4cm+qgGQ+J+pivHeHJxTRZDmUwd/3BLdXixhUiADv9DLVfHL6D7IzVwtMo4cfaXVb8+wrXQT25+kBlGyBgYXk9N8bxLGkNACjcM2chIBiNEde6dFQ56NMYz49Z48kGZfsgSuxShRCE9TzvPZm/2ClcxM1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744657968; c=relaxed/simple;
	bh=IhRuZepcsCK+qXWZ2V/TC2+eiOz/oDuk2WL53L5B6yQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ir8uIhehe4QYXHRgz2fA12eFtb0MelN9F022bHJqY6vXK0Ta3BNcR/1VcdMjyVSLMst2l0gQDCZ0x0o08cpxNFXwFzJg8X6+iOQYK3/mXoySk3QG8jlaAT9LE6oqDAfqL/Trb0jReoheEZ2ydKgKXeRqXdCwSJRKn9tUgYL/SFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EgHrH728; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EgHrH728"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e5dce099f4so6151477a12.1
        for <x86-cpuid@lists.linux.dev>; Mon, 14 Apr 2025 12:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744657962; x=1745262762; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IhRuZepcsCK+qXWZ2V/TC2+eiOz/oDuk2WL53L5B6yQ=;
        b=EgHrH728zaaALnIK19i8kwI1NPg2wMuDQEq/WotHn77Bgm8f25Rjz4rifG6/yxxcno
         u3dvmJYwqw1bC1DmBJX+wPv4yXKQNhLATXIgvTe8kfePJia8RNGwggCjtT6biAf4HvRl
         aUX5TUin/GEeEMAQj8YWnzAwzN7mVVcTq17wzvGWow9LK9O4NWbk+Ym/QzDf+9/BvpE2
         lz9lrqMWos+2/xiKF48G6JQT139+YBzuDIRV54bDg+nh03ZzoE9FetMgptD+pHkFCtIG
         4p9vsSwNdgLgWftGTsJlTBrGyAchYtdEgaoH+rtdN2M9+fWj4K4tDRKG81WY0YGVfMBs
         Ddnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744657962; x=1745262762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IhRuZepcsCK+qXWZ2V/TC2+eiOz/oDuk2WL53L5B6yQ=;
        b=oMyV/Q8C8cWdfNyeqatZacIJMn7xOVP5FfZu9brC5EV/xPAWyof/AY3dS7pnwQw+9V
         Z5UwpD8chiLw3szWRyCe4zOih7NH3KAc7usx0vldHV02wZxV7do26b7ifgk0Dotb08Te
         aZH6uRaPLkANFZIKi1V5DGF17L5JkEz5W5NcSgvihfGZ7JiHTZoCCKNnvydrjatlHuPZ
         0tOsDw41vyUxrpuzSCcYIDSG5TbZf8VWY1ht5XGW9dgJkiRvYvj0qvS6r5DBZHpmzw9S
         YUGxbiiQl5krlEAVl8AK0RE+tFosdpQW3IaWDOp58OZ0HuHouX62Ef8y44ob8jLru9LV
         rhyA==
X-Forwarded-Encrypted: i=1; AJvYcCUqdZmyiDJyw9XWrS7hyZECzgfTi/LVNvBtTU6nt7J99zcHcURIjpSsSClDSzaLLUXG5/VDTYJe6l0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3DTOw2vBJzokkjN9jBMOsiaHO9SGuze4YeBnss2s7Q/9L6AsW
	sWnd6gfzuQF4mCDTe65bZsdmqAEVT838XVRDarYBtWNkEsic9oxYMKAxvIHIVgc66SyzWMNiOjj
	JQpX0vhshITH1dXgCrr3iq8bK8Fs=
X-Gm-Gg: ASbGncv83IL0t910Ng1cf8yKz38dOX/nmaXBDq6cbg4Raj7I1PI1DJK4l5NBobPA/T1
	uZBZRpSotPcg70r1xiYVtumanVFuFwT5KPC3E7L07lF5zAZkL36xJkj4O0R0GMruHU7P1YDnLdM
	Zphm+dgiyNadFIT55Emp76Zw==
X-Google-Smtp-Source: AGHT+IFxF/KeOC1drCOZxzAXvht1UzKdbif9N42GIKSFCTyDDMAkuOVstF1j0XKVOdLkYakfDJDgT9bVW1rm1LQtqB0=
X-Received: by 2002:a05:6402:4313:b0:5ed:1444:7914 with SMTP id
 4fb4d7f45d1cf-5f36ff07bd3mr12628106a12.28.1744657961414; Mon, 14 Apr 2025
 12:12:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKSQd8Ug3Vk3A7eE6nB8UbhmOBBzVpfAqDYLf35Ym444MeQRdA@mail.gmail.com>
 <Z_0oWnbcjsekHXJd@gmail.com>
In-Reply-To: <Z_0oWnbcjsekHXJd@gmail.com>
Reply-To: ludloff@gmail.com
From: Christian Ludloff <ludloff@gmail.com>
Date: Mon, 14 Apr 2025 21:12:31 +0200
X-Gm-Features: ATxdqUGOyTIOkL9eowq55FR8vghkoYqcCwXMFoEutNgWRmJ6JQHp0mXG2SacIts
Message-ID: <CAKSQd8V4xBQgx3x+SpRBq7pEdEr6zUw_NmajL=X-k=-APDUz2Q@mail.gmail.com>
Subject: Re: [PATCH -v2] x86/cpu: Add CPU model number for Bartlett Lake CPUs
 with Raptor Cove cores
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Pi Xiange <xiange.pi@intel.com>, 
	Peter Zijlstra <peterz@infradead.org>, Tony Luck <tony.luck@intel.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	John Ogness <john.ogness@linutronix.de>, "Ahmed S. Darwish" <darwi@linutronix.de>, 
	x86-cpuid@lists.linux.dev, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 5:23=E2=80=AFPM Ingo Molnar <mingo@kernel.org> wrot=
e:
> * Christian Ludloff <ludloff@gmail.com> wrote:
> > > +#define INTEL_RAPTORCOVE IFM(6, 0xD7) /* Bartlett Lake */
> >
> > Please fix this. It has the core and the product reversed. That is, it
> > should be INTEL_BARTLETTLAKE and /* Raptor Cove */ to match
> > the bulk of that file.
>
> I switched it around for this commit - see the updated patch below.

Thanks.

> > And yes, you also want to fix this for INTEL_PANTHERCOVE_X
> > and /* Diamond Rapids */ entry.
>
> Please send a patch if you have the time.

Peter had proposed...

https://lore.kernel.org/lkml/20250214130205.GK14028@noisy.programming.kicks=
-ass.net/

--
Christian
