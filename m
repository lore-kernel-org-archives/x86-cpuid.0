Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42011421EF4
	for <x86-cpuid@lists.linux.dev>; Wed,  6 May 2026 18:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778091222; cv=pass; b=RsvIDlVDF5q/2ve+d8QGPHXw7OxXl28AlXGpwjvf6xA5LgpGDFtVC/YKSrgqTJvkbaOAi6gALe6x9/Twtxl50NotKHzYl39GCRUDf58hi5L3NnUvb9063bJRiu8aeKBSi93THMV8RaMBV5rZ3I763emd6Eknm0zfStzfke+u8EM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778091222; c=relaxed/simple;
	bh=STNjUqazgvzdYoPa+oJ0H/0VADcuiz2g8arI3Iby+ag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mSLTHH67v5Z/cD9nKN6hnS1FLMEwRrwEg+K3q4Wc0kZqt6If7AKqjzlGobwlT3q9aBZ1cuGbcueu3t72hQEk00lpmAEAFnjgEoWWWHe9jo9jucg48YrN/Z4kIyMPT/ZYLrSnpStBVU/uOS8ipxBt6XEcLm3VI8z27gJZjkqhE+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dvhanij4; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dvhanij4"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b9382e59c0eso1067788466b.0
        for <x86-cpuid@lists.linux.dev>; Wed, 06 May 2026 11:13:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778091220; cv=none;
        d=google.com; s=arc-20240605;
        b=R4U2YVvBaDgoXG8T6535RLCcxjEi8OOh1PGs4FmbkPViGD/TJydbiwxTYyMSUa1tks
         UClL2X/MgLBF6Qm4pqejD2b1QgeQRyFZw5QscKipgrhfmxD5qMu5sTdGpnaqaPO6/dGg
         5cw9edwpSB/W5XgVhLQgs7mJW4pnsYtOFZ/5LSgtvU7dmrdu4FdbFjh7IkesIeNiH95m
         4PD8WZ8V4aOIPWp013nCcxd2b1qfMTXSWhZGVz0SscnT+JBTwfKUCLsqvYsFjmKN+s4P
         nzVJtQhXtbnUSl0xn9lrtRNeObX8qvt/8Es2dVil5tpmyYZMW/wXEdX1DEA1HRGyRSEF
         IUbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=LLnxSKONadsvoFtCzfG7ZUOpgFEzbr9BCazipPDvPM0=;
        fh=ZYOc2O7p9pxl0QzCYQRPq70W3wt/i5lI38YbwIwASjM=;
        b=ShxTNYu1UM3tA9Svu1licUS6zksLEGrMaHirAnFSgUcEzsaIJ23m6o32Lcg5Ak/+L+
         vIpot7jRBxXjM+rYYnuMdHdWaeuZr2lkYYxOL4jNRlgb8uoSfXk7Sidq/EoIrAZSIZee
         JtKxXRm2OQcnMzYENcQT97yrcPSy6W0YWzHT2VNGybGdB/y9UGMt4KyxNbUvVwB62cnl
         BGR955eHhfWkfLOOTjwPmOPt8q7j+h/7c7h+JHBDmX7UafPcaa62r2Ox0SZN2QGLVWHI
         FgWcXqAN6ytJ+we72GOazukOGjIpu9GjyI+p7dImvAKV59y9Mc3y13QaDis/yze8P/S7
         hFNw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778091220; x=1778696020; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LLnxSKONadsvoFtCzfG7ZUOpgFEzbr9BCazipPDvPM0=;
        b=Dvhanij4YYh7JFdOvYXF54+E3w+h7zOep5NsnEX0OQLV/iiNTFb6k0TRQq4yWrZlGK
         zqoQ0AecFNIXXkTrfQOy6RhWqG4g+vv+4tJC/Hz2wjumtDbQ0m0RvCaRllN1CrEVness
         cWldSVpxTeC9Yw9oWHiQ6+Ksc9q1P+DTXFhHg1KUncoMylHv5IkgRlsVK6DDsxD55+Jv
         AaDM1QRuwQCSWInSKFHEdF3W2cA/+7sZRgEHrcVeQhZgrJ4wyfT3aaL4Lu+5KXusYSdf
         t79l1na5nfH0s02yfi+vChj9vb8WQOy5jOIsjH+r9sUyT4d5cx1vV/3X0oFhF1SE0f66
         4WIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778091220; x=1778696020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LLnxSKONadsvoFtCzfG7ZUOpgFEzbr9BCazipPDvPM0=;
        b=N34X4nxCDRtqiUIR26jHq/bzin03hVEA2Fgt5XGATXjWN3Kf+sUlfT7hsbDyWWhTt4
         2evaEji6rpInJA4JIZE7Mn5vjZTwC3z4o8knG9ZH7EgG2TkHNCNJj2yUSdTjKBBEdakD
         NK78eUTNNA2CUQqMNiottX/wQm7IRtiocopM+RpG2FwoZre1r/3DwPXp5lbOSlbiMuqJ
         uFXGtpmnRj71eHImhUg09nYF6rzDhqKMt75ok/QHmikUoSqSb7NQbDb0htxEBgcmndTg
         kCGqwVlj4xcSvCGAP1cXu0sGjmCwBU0BSYdpSlQ8L6LQyQ/VoN3jFDLzSNrFDkZ//k9e
         026w==
X-Forwarded-Encrypted: i=1; AFNElJ86tjKivWpim9hFdxKttbf7/lwWpCNw/gSA4ygwuvh8zKZrnZ6UjqAaERlRsMLb8PY8dhG+fHL1qZI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyHuwpO7EUpqNmR4jr7cBBn9+Y0qL1aV7OHka4rTEqk5brlw5pQ
	jiDqZQpByuKad32z1ZIzhM9uafEvrmsXXb0AtV1twiPLX90uIeGS+GNyZ7K7MMC2Zy4sjogFUw6
	871ZPqFhnkZ+KHX4D26IApwQ5NaCXNc4=
X-Gm-Gg: AeBDieuRrkrLbSxTJ4UayaMMJHJluCgn+rZ/nfPi0iOEFeN2SHWeo0rv5D9jUewmfiK
	wO+kLLC/gTeMdHAShUWKNrKmKUYydNJf+l0E/m6QfhiVoKJ8UGtRquBMK0ALz147v7IUNKnTjUY
	nt3td3ighc5ZoIphqu+AiaNa0bunlePD8cj1n9+cDFWoH0a0DFDHJNEWq5t64muw3Mnym9KCXR/
	yXRVyN+qwtn3P2yrhJ2Ay1VOXsSXo4t7kq08rKQH6n9DKC5muRxvcgY6txfWD2/EiVxW5L5cSQe
	Zb5+9QwxOGtZ/o2wQSw58M2+C97COnJyL6Fmgg3Ue6DON37PpUTKSEZkTC6Yng==
X-Received: by 2002:a17:907:a07:b0:ba4:f501:cb8b with SMTP id
 a640c23a62f3a-bc56b83947fmr268089966b.16.1778091219350; Wed, 06 May 2026
 11:13:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260327021645.555257-1-darwi@linutronix.de> <20260327152354.GBacahCioljpw5QqUc@fat_crate.local>
 <acrBBFyU_vi4zFOx@lx-t490> <20260330230836.GLacsCdDkVu0H3XU4l@fat_crate.local>
 <adz3z_MaWJr_GOtc@lx-t490> <ae-uw9836AJScRsq@lx-t490> <20260505133350.GAafnxvtgFxJHth8WB@fat_crate.local>
 <20260505151242.GDafoI6oOOs9hknrrK@fat_crate.local> <CAKSQd8UvY2iLew9gFYEs0MCgPa9R8RiQLP+kJUb6Cw8BYo=yBA@mail.gmail.com>
 <20260506085049.GAafsA6dyeWjCr4wOE@fat_crate.local>
In-Reply-To: <20260506085049.GAafsA6dyeWjCr4wOE@fat_crate.local>
Reply-To: ludloff@gmail.com
From: Christian Ludloff <ludloff@gmail.com>
Date: Wed, 6 May 2026 11:13:27 -0700
X-Gm-Features: AVHnY4JV3SqALhuFj11KjmKricUA1Y8ZBdxrs_6eeKjpz7kTte27ZtAUzGT6sOw
Message-ID: <CAKSQd8Uq14GgQ=ttUtwWonaG6-X7mZ3mJHBRCqoEpvA3eRbSmg@mail.gmail.com>
Subject: Re: [PATCH v6 00/90] x86: Introduce a centralized CPUID data model
To: Borislav Petkov <bp@alien8.de>
Cc: "Ahmed S. Darwish" <darwi@linutronix.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Sean Christopherson <seanjc@google.com>, David Woodhouse <dwmw2@infradead.org>, 
	Peter Zijlstra <peterz@infradead.org>, Sohil Mehta <sohil.mehta@intel.com>, 
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org, x86-cpuid@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 6, 2026 at 1:51=E2=80=AFAM Borislav Petkov <bp@alien8.de> wrote=
:
> On Tue, May 05, 2026 at 12:11:50PM -0700, Christian Ludloff wrote:
> > First, 4C78_0000 EAX should report the max 4C78 leaf, in
> > case there is future expansion. (CPUID does always grow.)
>
> Makes sense to me. That'll tell people up to where we have those defined.

Right.

> > Second, the number of words reported in 0001h and 0002h
> > should be enumerated, in case the list grows, and so that a
> > program can tell between all-zero and not-present. (ECX>0
> > sub leaves, basically.)
>
> That's good point. So we have now:
>
> words 3, 7, 8, 11, 17, 21
>
> which are Linux-defined. You've mapped them to E[ABCD]X regs. Sure.

I merely grabbed what Ahmed defined.

> We could define subleafs and keep the main function number 4C78_0001 same=
.
> Sure.
>
> And 0002 is for Linux bug flags then.
>
> That keeps the feature flags where they belong: word 1 is for Linux synth=
etic
> feature bits and word 2 is for Linux bug flags.  Makes sense.
>
> > Since 0001h has already used up all four registers, it can't
> > report a max sub leaf in EAX =E2=80=93 so maybe e.g. 0000h EBX
> > has to do the job instead: it could do e.g. two byte fields, to
> > report the number of words instead, i.e. 0000h BL =3D> 0001h
> > words, and 0001h BH =3D> 0002h words. (Or wider fields... if
> > you expect more future growth for words.)
>
> Do we care?

Yes.

To tell "reserved =E2=80=93 no word here" and "word has all bits 0".

> Those leafs are purely for documentation and no CPUID execution would eve=
r
> return them... (famous last words :)).

Humans love to enumerate.
Humans love to CPUID.
Humans love to printf().

> > That said, it would be good to get the initial set of commits
> > done so that db updates can start to flow in, to catch up...
>
> Yah, that's why we're talking about them now, before stuff is cast in sto=
ne.
>
> I didn't even know you've documented them on sandpile.org before yesterda=
y and
> was under the assumption that no one cares about those leafs outside of t=
he
> kernel. As it should be.
>
> Goes to show once again how we should be very very careful what we're
> exporting outside of the kernel.

The Linux-defined bits are useful, for both, flag bits and bug bits.

Because sometimes hardware CPUID failed to allocate any bits.

And because humans love to know if their Linux fixed bug X Y Z.

--
C.
