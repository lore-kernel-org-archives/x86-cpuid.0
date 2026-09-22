Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC70F530DE3
	for <x86-cpuid@lists.linux.dev>; Tue, 22 Sep 2026 08:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066648; cv=pass; b=DeHMpu3Z8RgLHqbU6PryFbznINrdXw9203dd46ESfu05KfJzJwOipuxoQxDH1R1PSKF877mo3wGVyHgMg74B8YxNHeU699BwS19QKWZmhHpCZNYdgE+4vytq8cSFeVCI8hE/yE6r4vuoIe3mLsb42QkpJQEkjC9iYrHrKfv5LYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066648; c=relaxed/simple;
	bh=3eIftdr+HqakZAShd7ietE6WeuNrECUgzUYoSHnLGuI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gJ4jMb3cfBMkijT8yCtFyOeL3A3c9izmbyNtol3XvFhSOgxCgc5SfrJwL+WYV9nlboSRSFAesE3lQmPj+lZw8AVZumzkOmup/ubGsmbg6m9Ky1DS6uagdSNYlXgnWcQUhPVeETaPKb38DBN2tnU6Rh/GFslX7Y7WASStm0A0670=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GtOcL5ZJ; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GtOcL5ZJ"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a98604f6b4so5523748a12.2
        for <x86-cpuid@lists.linux.dev>; Tue, 22 Sep 2026 01:44:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790066645; cv=none;
        d=google.com; s=arc-20260327;
        b=fWYlN8Cur94/9Ot9S8FgS5m073LJwq5999sjwf/25TrGevnYE8A+5XlXwsTrBn5g4V
         AOz0eyJ1CsPMfXvpeJWZ0IrvqbtP5qICG22syOF4BTrLxt0baAgSHCBLVHb11gX9EfmC
         Ys88/+XE4xspD9J9DHB9yaDIFAkiDbWV3eyG9XDDT4gis767GArl+KRb/Q+XSWJZFL7X
         ONjORf1pOFs8Mv2hEu5gKkCCIGFJ/9f51aZv38+5zIHdrbufHuKr0vahJyVMVepTxNX3
         f7Z3Utw3HYpMf9OFFMzimNjNCZ/szMt+32i7Qf1jZwVmvfiTspQFZQmlX2vXWoIL8qat
         I1qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=65vILECszTrDkUEoa8AEJpfWp35NiurtkMpk0mo7UQ0=;
        fh=xlzteyk95dcL5hBzzb6sJUZVNakGPwLwyGolYfSIMR0=;
        b=Z3/99I6Fl8cYsMN+HsjC6Ls80GuyWf6YZRZyR5NeyxPrLvzs2r5t0MZ/cadiXHGb6K
         OsVG0CkwZXqZ8UXv2Auz64DnziMH0zETFY0UOlDw4g6zhHGq/h3618yx6wBdSGpuQzvq
         g0gmFtmJ987gdlT99zLdLQ4Wct13H2U1Kgx61HxkrSFyKOD5+4EAn41Pw28OfqYM68Lt
         lMUgwBcGrgEFRY7JPAHyCj6dMeAHEWadh/rmTcQkBrmxHZVqH16RkhEUO312a/G8zi0I
         aB1kzo++IJPGdBOwltjcm49Pxvb++BkIKNOni9fHoH+Eqo6TX1DcjZ9q7Keu2KnEy/jD
         M9/Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790066645; x=1790671445; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=65vILECszTrDkUEoa8AEJpfWp35NiurtkMpk0mo7UQ0=;
        b=GtOcL5ZJGGCWdzIotxhJcQXfz/DDlAYMO6mowRryeLF3fj9ogvAhbwl8+xaSoF4qFr
         UqCDv3sbBma/wIFoLNe3iwRdBUOtV2byy9do/LSJGhtemObUJR1Myw1s25DpQNNFrEmx
         KmKRUo6I0Yw4kWa9JhjY/aXCKjERZ/h/ubMED4+o0n6VAIMf8NfY5AdDi38M4ez0SEag
         Mp3vYt5neIKxi2+REP3KM/3XCgh9vS5v+lzB0TS7fFxZ+VJFG59Zvy1Y4ltNbR8t9u2q
         +TD/8o2aFQTEzsjPpcj9L2Ul/TYdN2rZxJpcU+w/k5T7nQfFLB4VicrypohystLZxRVW
         k4qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066645; x=1790671445;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=65vILECszTrDkUEoa8AEJpfWp35NiurtkMpk0mo7UQ0=;
        b=b8LXLNfNTeWoKr7wUtnilEqmwFO4kzlwhP1WCMfZjlnWDklMm1iFbmEaGTuVtSTb4F
         Q5zcH79mv3Qs1h7U3q9nD5SsfN+SoOeUDralxQxmVdQxMOBFQ06IKc7Cf+4jLcoc370g
         KtHg0sGmczL3N3Lib/Zqz7KGiDMMSRBzjf9UQHso9AV8dgBf8ewsQy50BGCAvQlh0QvK
         nAUJYbbH7YKUkDWjP6JHxRL5rE1V3ONiH8upBgj1tcwoHz+aFcg3ig8xGEO64oMDZmIl
         rHXrkA0CtLrUr56hsVB5IDKzfxlUf18vurYkajR11/Jxk79uRvjW1KHRG94sQARJNoFI
         VKGg==
X-Forwarded-Encrypted: i=1; AKwUvBxiR4uW0eSB3GVnd8w0zWj0IioOEaoPwZMbEuGOjc9NatuuXeuMHU8YC+Gikeh90eRraLnShNZm3tw=@lists.linux.dev
X-Gm-Message-State: AFuF++k0rQBPmqGaxSfJL1yESXkgtuvn9V4y/C8u3Fsl1QAzvqyx/dMb
	IJ2AAYmflAHxVLnoqPnNRM7h+a72NRHyW7w58VnCswPHJWzM54fZ99oVEJAgu6jjpkQmOLjg1rb
	ASDMqM5NhGE9Dm7aJ4ySAkwbTLBJuT6o=
X-Gm-Gg: AYBFou1098M5sHFDywQyOZ5Z2TZsZg2ExzC3IRpxGaoIQs/+E4xGU5+fDh8nzeNkDVD
	wXvj5HFvwEanVPrgAdzz0BgEfxmN84Djpgz+ALpJ51/8dUpHpLyt0AS4ddPnhmB7nVdWEhnVx3F
	hxtgv/KAWzLvF0Q7bM30p2W+92l0PC7k3PjxeKT8ocrQSLIh8k4YT2vX937B+2Re0uWwlxverre
	TFZdAMhts3z3hjGe8YvvJVD1GY/CDOJ0XUlv3FRT8CwjTVTC/L8gK99M6Prtd/vFO2KAQJ8xsc8
	fygpzDeU0xRhq7f/siJAp2/9lA1M1QhF9CKmMebwW56okcBpZCYjfHnIYlay6QKa7R3ldtcZPuw
	T9WyUOrjTcv4=
X-Received: by 2002:a05:6402:46da:b0:6aa:486d:96f8 with SMTP id
 4fb4d7f45d1cf-6aa5798f026mr9285732a12.38.1790066644884; Tue, 22 Sep 2026
 01:44:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKSQd8V28WjMcsfh05P5SNfXXvtafBH6fyiyqMzQ9GtU8fQGSA@mail.gmail.com>
 <f133c35f-b013-4395-ad1f-53765114d4b9@intel.com>
In-Reply-To: <f133c35f-b013-4395-ad1f-53765114d4b9@intel.com>
Reply-To: ludloff@gmail.com
From: Christian Ludloff <ludloff@gmail.com>
Date: Tue, 22 Sep 2026 10:43:52 +0200
X-Gm-Features: AcwNN1V1oXf_XeQyH785ByMW-QMuBoGsa9e5ET8qsJSEeIcT-lxdR1I3w5kq6xs
Message-ID: <CAKSQd8WqQdNDoEqM+PZNHg-yr_4VJTGYdV=bCbYfRDyR7kUjbg@mail.gmail.com>
Subject: Re: x86 CPUID mutable return values
To: Dave Hansen <dave.hansen@intel.com>
Cc: Borislav Petkov <bp@alien8.de>, "Ahmed S. Darwish" <darwi@linutronix.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Sean Christopherson <seanjc@google.com>, David Woodhouse <dwmw2@infradead.org>, 
	Peter Zijlstra <peterz@infradead.org>, Sohil Mehta <sohil.mehta@intel.com>, 
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org, x86-cpuid@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 11:32=E2=80=AFPM Dave Hansen <dave.hansen@intel.com=
> wrote:
>
> On 9/21/26 11:36, Christian Ludloff wrote:
> > Q for Intel: is MSR FEATURE_CONFIG 0x13C bit 1 expected
> > to affect CPUID 1.ECX.25 and 7.0.ECX.9 and 19.EBX.0/2, or
> > just just a subset of them? Also, what about PCLMUL?
>
> Are you looking to document architecture or implementation here?

Just the reality of mutable CPUID return values.

Because it matters. When trying to cache them.

> I poked around on a few pieces of hardware I have within reach and all
> of them have the MSR FEATURE_CONFIG lock bit set and the disable bit clea=
r.
>
> # rdmsr -a 0x13C
> 1
> 1
> 1
> 1
> ...
>
> In practice, I suspect the AESNI CPUID bits are immutable.

If the LOCK bit is set. Which is recommended.

But apparently not always done. No surprises.

> FEATURE_CONFIG's definitions also looks model specific in the spots I see=
 it in the SDM. They're also not identical, interestingly enough.

While the verbiage across documents mutated
a bit over time, the functionality of DISABLE as
well as LOCK seems to have been immutable
ever since WSM and GLM introduced them.

Based on some experiments, I think that VAES
does follow AES (i.e. is mutable as well), while
KL and PCLMUL do not (i.e. are immutable) =E2=80=93
so that's what I am seeking confirmation for.

> Honestly, FEATURE_CONFIG looks more like something that should have been =
in the BIOS writers' guide rather than the SDM.

I for one appreciate that the SDM attempts to
provide a list of mutable CPUID return values
and that it has the FEATURE_CONFIG MSR.

After all... the most recent public Intel BWG is
more than 30 years old by now [aka P6 days],
and https://en.wikipedia.org/wiki/Appendix_H
was a thing that also happened back then.  :)

PS: Should Linux boot check/fix that LOCK?

--
C.
