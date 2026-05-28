Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E7132C302
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 22:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780008782; cv=pass; b=C7RxwlgYUMzhE25vQdrDQXoesdbJh/9Dvrf28DoImM1ZwswJu2CpzpivJNxAqBlgE9IHSmKdj4q0TnMjumqBBYdZM5Ee1qdc75j0hxuBtokfeLcSdhJIB7YsqBEtTpUVEnXT841ojWG9NNBQppVY85Ikf9o9qI17Uka8jRKhd2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780008782; c=relaxed/simple;
	bh=i84XHZZYkByLq8R6ShwmpPbYbjZdxTU1SSt2NS1pKxg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A2HN7dk+/HOiJbOuR2PK4gZ9p1prfDyoSQmuebmQHFwGjxGdvzi+BA2XG8+1JVAOGpUi5foi14wa54/Xs7WO9L3mWy07xlSSvhsiUx3b+ZURxv29ir53r0RGvjzmOD6DqSRKHb4GLu0m8k0FRrENv9DQpp+09T/M3oZtVr0IHd0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L6zX/tpw; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L6zX/tpw"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-bce386d5b85so1992639266b.1
        for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:53:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780008780; cv=none;
        d=google.com; s=arc-20240605;
        b=Px2KuLHucJS1Pg+8am7KcU4VaCdUq5C3/Aj6batu5YQEfTQLyxDfYJwyVjBuMz+9UP
         2EfXK+K2SyRxYPpiZnEnldgh9shP3UghT0Y2ZZDEUfA6tJnDSwC7lG5RqRsFH3eukqEQ
         EZhA4Z+Q05d/hbbHbjWfhW2uwlCYfmt1EutCL9gfkdr2e05vyk1o/X8F1W+OpUOdrW7b
         sItsKwP96m5jUP0H/BQRerwrHOpYgVh+WjUEfcCrLpM9Do8Jjm0mv5b4L/fK6zWgMdkm
         mJzIuI4Ci2LEKdmJ8oarDZqIw+waFpFnYcSmWmtpNwibpA/rjqSOeEKQf0NgptR+g/9X
         OMQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=FCd40FcmE98PqKxMGcFYFidiAqYvw23BptXhORkEgtw=;
        fh=nKm1Hvnl51cD9A4DnM1HgvK2Dhta/LDOoEQvfrKWqvI=;
        b=J5j8PyhaKTnf8VEKpeRPO0OiIpdygbvqQBdDvFcdY70ap5lBSk4nyQUtXW9P/m9bg8
         5ujDUB1b0M/trEPMYluKcuH4Xm9ETaa7pcTXaVXMyxtttPgDZi4GAfc8MblVd9uJmcgz
         El1uEHi+sUqA1M/+tbYUppQtUwbMh2HGSLGNNqHE/NQAO5KHe8io5EgFl+qTsE4yfgWu
         o/NU+JuiZo43url9nAlvENdGPRry/yOWDYQfV84ovWi33KwzFV/4vtV0ZatJkNawVhd2
         d6T8Qt/fIz97GhH+kdtIm5+MsjgtXeRpJJGxVQ0+b20fILvdQ7rTFV4p0pM6ZzqdjYzO
         rezQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780008780; x=1780613580; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FCd40FcmE98PqKxMGcFYFidiAqYvw23BptXhORkEgtw=;
        b=L6zX/tpwWTebux4F6AWBVZcRPt/pypos9Cp8rm37FUNHSWEIWjVybsY1cjvH6TCJG8
         2QhI/IADPctD1TZ96E+Izpmnvrf++NcCq+kDr2atxSUHiYJ4b72dqAuQtGjXUZKJBXkF
         UlC/BQxnKQgrStdIzMkf2qj5LEOd5ftP4zEHDUUMKQjis/LTC+k0r23yrkO3sbLD7qM/
         dwxtqieIW/jOypX8euD+7aA2J4uI0cgfqR7I+3Narm/2p1pqjcWmuvF/DT18lbA49Kp8
         BeEzDSqMS2cqsgWsUH5I753gakS9PDOd73xuxXif3odfc2+CHfnpRuntMt4b1D8oneWj
         sGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780008780; x=1780613580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FCd40FcmE98PqKxMGcFYFidiAqYvw23BptXhORkEgtw=;
        b=iK4UA5hDc5ZoZhE0PScnCFi+TjZ0FpckMjlHNwA9Escszd08puALo5/pbOff0inVhi
         QX703IaUZj2U4/lHOAm3Mja6L8vJpGWNfwfmgh2CRFTKujYKuEm6WqLvaGZRMC1cAUir
         8C0Kz31vxnwsW7qKebMcaNaFa4gXVA3Bs8AXk4VLp6YdPjC4oKkhZyfPH+R6ukybWiyu
         6sUZb+IZFRPHjUzP0A1L3dln4d1Od6jS10NeqMy69o0LEWHquzCRDsEBaeLpLZDs+j8y
         tgkchomcsZ3H0qTu/1YaGXy1Q3RSNCfWPsyx2/zVfOBlP1oi8tlI8WNkOUCyoRjT7uk2
         j3fQ==
X-Forwarded-Encrypted: i=1; AFNElJ8gPsksPAho3GFyxcySgNZGV6wbaThCrwIpVNuNvJ79qAve7xWgJq2Q8NQN8AgkoNCUHZzjMJE9UB4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1BXVDUoK/aAvZdsuVgHVh1hswIDa+cLnL6V6FoSHkLvZosST0
	rKHYk9YE9JM61uemmg91LcDPPOvpuNMurXibwqQVhoc/EMf/pequz5w4x08ydpPpBsRDaOWkmN7
	tmx0BCicB1yFXxP9iJE02Y9L8/RyNkb4=
X-Gm-Gg: Acq92OFD3HSuR+Mwx1XPFqrOb1z6uWpVB4oMDZJiOtfnIWJucD5ot6TkaIQvOzrupPA
	skCGteiEvdAdkAPH1zWp0Q3oHgvbeYyvNdkL3Q+WGgPNyDC6f2kaR6YBzM7aG0COIMAkReWOtYw
	aZaJ1zxuQeqwHEN1i4l2/zjuFVSmDS1jJ8wD1rwQ2XFFeqDvmS/17IlL6SrDlGEkhmTf2WVmOzi
	y0etYd+xxBgVh0pwbWdRf954cKL3iaIzah2GT5fe/roXE4ozEA0S1qqGdBxV7db5UoEShZxSJOX
	+HwBpsoDkBTgg5ESmSfhAYV/NvNdpFKZMkWmrOnNSdXZk9Tdw80=
X-Received: by 2002:a17:907:869f:b0:bde:a3cf:d268 with SMTP id
 a640c23a62f3a-be9cd461041mr1713666b.13.1780008779451; Thu, 28 May 2026
 15:52:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260528153923.403473-1-darwi@linutronix.de> <20260528153923.403473-103-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-103-darwi@linutronix.de>
Reply-To: ludloff@gmail.com
From: Christian Ludloff <ludloff@gmail.com>
Date: Thu, 28 May 2026 15:52:47 -0700
X-Gm-Features: AVHnY4LFY4fFkbiLZVsBSzG3q8pSj91dhmUDEaQsuDgi6hueFwWB4-F4plIOLIw
Message-ID: <CAKSQd8U0OH-5zP6S9uW=n=VkDSTv2MjtLAaL9napViD4kGPdbg@mail.gmail.com>
Subject: Re: [PATCH v7 102/120] x86/cpu: Use parsed CPUID(0x80000007)
To: "Ahmed S. Darwish" <darwi@linutronix.de>
Cc: Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, Sohil Mehta <sohil.mehta@intel.com>, 
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org, x86-cpuid@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 8:45=E2=80=AFAM Ahmed S. Darwish <darwi@linutronix.=
de> wrote:
>
> For Intel, Centar, and Zhaoxin early init, use parsed CPUID(0x80000007)
> instead of doing ugly bitwise operations on cpuinfo_x86::x86_power.
> [...]

Centaur with 'u'

an absolutely minor typo that... but hey... I did read it  :)

--
C.
