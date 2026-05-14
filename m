Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA022F8E81
	for <x86-cpuid@lists.linux.dev>; Thu, 14 May 2026 04:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778734081; cv=pass; b=XPmthcVWYyhFYU8upznhizbIEvlH7dr9mJ3G2fDitgC3msHF/Qpgo+QaNvUOup6WDal8bZQpbqmhrS+dBetEPOWJxnhHY8xSxnzPRDZHiY78i5aw5Hopb9geX4Ivdn5bi3hkLoPaSX/9oOmBv5mwvcETX/kQwA/mQ/5Hd+FmAPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778734081; c=relaxed/simple;
	bh=3sy7VcnpJEtsk6RzmSyuP9jP9vfgfCYvJvLEzbvWY6s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZorRDSDm43Dg5Aht/z/sLot807iMC13BM80dmeWCBCiWc3LrCItCbcQtedlcMMQdtIYn9UN07blkYxQbjF4xiFJWhDEYBZeOm4c/B1CxV71PYl6mMCgFgpqwNGxSFts0Wwv0E8Po0mC8H/15mHrwR2qQqu9fwhFHz8INUeVtqZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ti1hcYPk; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ti1hcYPk"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-67cd93d8affso9119035a12.2
        for <x86-cpuid@lists.linux.dev>; Wed, 13 May 2026 21:47:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778734078; cv=none;
        d=google.com; s=arc-20240605;
        b=kyRI85NOIzcRhuSn9qieTUk3fv8OmphukfzelZ8NcD/rOroXC1PzZacRCUBiOFFKxa
         +gLvrqx1uHGYBm0rTVbAJd8a2bm0ECYCGxnHUFOXulrJMN7iV6ixUTrJvjzChVt5bt6Q
         qanhC8L5YJzxB2bSOa92BouTaLf1SNbJ540Uhkfbzmdo9y9rGmClSubY87S9uFW6YJU0
         JFRkld+KJPwGoc3dKgkGA7IMQF8brhdCRLlwoVD3H+QzDU7XBD7qEhAO64lfJFn83C4a
         aTd8ipkkAORYTbZnTbMkePUXB02QJhSZIMb6UXCoyaUHg3XlAcDSeFyqFLkA1Diq4Vud
         mbMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=3sy7VcnpJEtsk6RzmSyuP9jP9vfgfCYvJvLEzbvWY6s=;
        fh=c9SIVtEbiM0R08MAyEbuh76WZXpdWWvxoBGkpeCZGOY=;
        b=ZSbsIuSrPXf0TQC+GB6XBqlpgKwWoY+2ypABR+iwFHAFtsReXibDS6VeRoQbWfCQoz
         GCLWSJVYHVK/rv9jVLUlvv8VuLW1mmoyGchwFhCs1G7Bqm2kN/mjJSZ0jswbOOjI+AXL
         Qhy8T1Ka0cIBgRAqlpaWweLrgpCu7MV4Q8yqPIp4GPvpd6VpycVUEiL0FcRlwtbXFzrJ
         sC29WiRLXmFWFTYfHwZhu6ujEr9h2WnEcFdB6o65/Yt4ImUyaUiBiX96tpwK7DBjk1EO
         0+gRIABjPGth6+78sICUBwjkyab76yi9Oa5D3lwPjIfXJnFU1g5p6c6jWMUWRILfkkuG
         daow==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778734078; x=1779338878; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3sy7VcnpJEtsk6RzmSyuP9jP9vfgfCYvJvLEzbvWY6s=;
        b=Ti1hcYPklJpUGGz0ejJZIAef9dy6RKe9H/prgMwHwdMD3V5sQ+CHfGcIWw1IaUOKoZ
         5qOqUHxIE6kIeBSe5HPeQZd0Xw+ejhRzgLRwQT4TulCgRz2JNdd2dDDlIsGZ5gXqJpf1
         3urEfWASQ7g9g/ct3NebgGv0VxplfBT9uiam8QcVqU8HGf21I4Bo6kfVcWK/nGcO46gz
         GKVbxqHsrHA13U0EWahTcLv6mc1XBqlEqD8K+poLlPFhaOfqAq1AgSOmRU8Rdn/CSN/a
         jtONqQPjrcISwliifUMjpvuioZOu7RWYL8OSuqyd1QXbdhAnnkrsEWWKUYgGqbEEe2Fr
         LkUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778734078; x=1779338878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3sy7VcnpJEtsk6RzmSyuP9jP9vfgfCYvJvLEzbvWY6s=;
        b=HA6P13iLHrzcf1FqXJ8RxWWydctGZ3CNf/CN85V7VuPJaol8dxs3SGGvMfZLRd1e3Q
         aUIf6i9S4TsjQ49wn4n+wNCX2iUNKOg3LqE8rIO8wwZgsvvRVYGMuGXvueC8FF03+j4b
         15yfNgmFbDGe3Oz82pVw5tX+f1JtwxHV0uH06nGb3Lf1kKc6EQvpOwGGmJv02T2NMZ/3
         lIndTrgoXF/gSXKMufH2//woiHgG+pAaOFfRa9sCrjc/JGeSMdIUy7Tpuw9TDXh/IYuY
         H7huGGiWj/4BYjU/EEuKIqVZHUnEeriJzTJmYK15sEAdoKJlevnVMnY5QLzawyv17H6a
         aoWA==
X-Forwarded-Encrypted: i=1; AFNElJ8LkHKYZjDcXRxAph6EddHeB90UZTfsyYTn7KgKpNSrB66BZbnU6pou9KbTPoMUurK08q7gRp7ACK0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9powPzp3vTb+209bz/GnKZ47/fb8GMQVIBBxj/TNXQdqEulke
	51LIH/3bk54fWU0uTg4WeqoVQGNCru4bwUO+vOUQsENVIVSnZkbNk4utm8PGDZ9reBmjhhyk4PB
	J8pRVG8MHK+RTNmaif089dtFT0AG8rDE=
X-Gm-Gg: Acq92OGRCxfCKth5K6Simnij2Mx8SKJkQbZgWj3/FPEg2dctTT4Qn346GFXmDAfVPDB
	XTTbOMdsQfaFJgGq41O0UC3HCEWxGvqtJAmbUF9JDg5fAi6fwIO9ky/pwPU6tivJU89L3B+QifU
	3Uf3+H9UbU715DbkePbmySG0C0MK3dml9gZWTSxElcG3z00q0A8ximjvOLz/S7oiN7nAa3/WVHr
	1twKSKCvouTTidaFThcs2i8w+4E1/HAm2J9QNubm5Wb/SgkQKt9zmAn6BD2AqTlx/myscrmzpiE
	N9pIxJFXep4A6BLpsqBHckPU8MZ3G3LrKIp+p5FQ
X-Received: by 2002:a17:906:f59a:b0:bd4:e5bf:1ed1 with SMTP id
 a640c23a62f3a-bd4e5bf1ee4mr197447966b.15.1778734077966; Wed, 13 May 2026
 21:47:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260327021645.555257-1-darwi@linutronix.de> <20260327021645.555257-11-darwi@linutronix.de>
 <20260511200032.GAagI1YMP51EzCo7dn@fat_crate.local> <agLS2Y7smYRHyiHf@lx-t490>
 <20260512143412.GDagM6ZLBpvt6X3jzq@fat_crate.local> <20260513152742.GDagSYbheCBWwNeVj-@fat_crate.local>
 <agShjbCo_HSs9YOf@lx-t490> <20260513165128.GFagSsEPFCogQu7n5t@fat_crate.local>
 <agS0A2pRhz_qCPce@lx-t490> <20260513173842.GJagS3InAztdvoiPGl@fat_crate.local>
In-Reply-To: <20260513173842.GJagS3InAztdvoiPGl@fat_crate.local>
Reply-To: ludloff@gmail.com
From: Christian Ludloff <ludloff@gmail.com>
Date: Wed, 13 May 2026 21:47:46 -0700
X-Gm-Features: AVHnY4I0ox11LIHBzjmBXz1ZuoJmh9bmKxmoJIbuW9iMOYtEpQoZT_Vn2hCzhFk
Message-ID: <CAKSQd8XM6p7TTVih9fg9fmUAkzNchPCT7B-6qzVuja=3hg_u+A@mail.gmail.com>
Subject: Re: [PATCH v6 10/90] x86/cpu: Rescan CPUID table after disabling PSN
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

On Wed, May 13, 2026 at 10:39=E2=80=AFAM Borislav Petkov <bp@alien8.de> wro=
te:
> Maybe... later...
>
> Right now the *only* thing we wanna do *first* is the conversion. Which i=
s
> a huuge undertaking in itself.
>
> So please no more unrelated changes and "it would be good to do this and
> that." That can be done later.
>
> If we find a bug while doing so then it is very likely an existing bug wh=
ich
> we'll fix immeditely and continue with the conversion.
>
> Once everything has been converted and the dust settles, *then* w can do
> improvements ontop.

When deciding what the code shall do for mutable CPUID bits,
you really want to have an exhaustive list of events that trigger
changes =E2=80=93 think Intel SDM vol1 21.1.5 as a starting point; then
made exhaustive for all events, for Intel and the other vendors.

(Besides on/off bits spread all over the place, microcode loads
at runtime come to mind as... uhm... interesting...)

--
C.
