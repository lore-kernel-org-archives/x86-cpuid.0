Received: from mail-ed2-f36.google.com (mail-ed2-f36.google.com [74.125.228.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB33947F2FA
	for <x86-cpuid@lists.linux.dev>; Tue, 22 Sep 2026 18:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790101739; cv=pass; b=VvIwjGN2HNUrXIh6IBmgfzxSTXKDi4N8vZ2Z+4DeLnR+opkjFEVdhuM/A1CBjnjM7R5BfMeCsER1FPgLerIrz14TNBRbE9b4n0RAoZXIUMat+7bMtHpYXxiRBoTZyof+DyXKpAx/XFjx0Uix86yalCrGlTUkC6drlOUPrcjpE+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790101739; c=relaxed/simple;
	bh=C8X3rEi3yYXQtA/Wr780nU/kG57I9jcWzCAz3MJajWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uiVvlHWttLp7prUfXWoMTUdTZ8jFxYxc/9Left9pA7As1aXmjLU/vEwa3HIVhBwSHmbVnG/Q/i1HrhXAj8PoQ0ef2hzbTF3qQA6VFr4mCgK0xhuEUf/5tlRnjcJQqLCbFO0LqhRRXZTznjIKI/wHx9VobZM+8WO8GYVn55GvXaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jy5lcYLR; arc=pass smtp.client-ip=74.125.228.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jy5lcYLR"
Received: by mail-ed2-f36.google.com with SMTP id 4fb4d7f45d1cf-6a6056be4d1so139921a12.0
        for <x86-cpuid@lists.linux.dev>; Tue, 22 Sep 2026 11:28:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790101736; cv=none;
        d=google.com; s=arc-20260327;
        b=gDqjOSuEcVkKl6M/SCZ1X9qbrfKWZvxrtloWX8ZMeOEXW6IaHvNwx4L4oEUe/oRfRL
         4495o9EAtuvmAXntbr84det4apvSLxNFvpKOFv1HzdnlKp2oYsl077LGpYxnt+xgKc5z
         FGDumna+2XJE1SPMk+pvl4k4FcLb/pRbs9GohoxQ3C42KGraDRcm1lqT1utgntvQR2i5
         8A9iYdgWkHBfAQLaWKu0DcaNEoFH4MTV69QBsXRHXEvPYde8guCw/jVHrF6l+yBA6rLd
         oVUJc84PHrlj30PXhgv/d/LBsJ7w1IRhXNaytFOURdDoi/NpPZ29DdePNPbMlVUtN7OO
         uWtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=C8X3rEi3yYXQtA/Wr780nU/kG57I9jcWzCAz3MJajWM=;
        fh=wrxvfUkvNtoL3u57AD6UnVjatXFYqNkRYNwg1UeiIUg=;
        b=HVgyawHldMIPJqj9hI2Y4c/g1JarjpY+FZ5egMNQtGvkr0Q9uSBf/4mPnx9PZlWiBA
         uzQY6gR29bTeli/V3jvO7fgHd8fTMQ9JdpfevkEE7OnQtDKEj7H/xoYpY81n/IR1wnGN
         zBIHFFp1F7Dx7l0a4TbGD4LRyonMtNR4/Dp8Yu+XHmoDfv7c/C8xZ6sDLn/sXVDe2H3q
         ERVBMeOIwlxTzSwhTu2nHfBOTQM3YFU5AWCfBQxOpo+xg/n+Z/gyZVisCCXFxpu5KgFu
         4hrtsJMxXqfIRE0jbkD5Z1cZbd6RYdr3fvsGBJD3D/K10YWxYWihjxhZ205oa+rKSN8D
         hHPg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790101736; x=1790706536; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=C8X3rEi3yYXQtA/Wr780nU/kG57I9jcWzCAz3MJajWM=;
        b=jy5lcYLRNqBY2zUbtOmhiZj2zarbbDDkVJKUorIAX53006ReWFiNJXtFhzptun84ZZ
         j6V5x6rPmUbVU45wjqCHBsO7hwZRNgOEmizIDO+o9de2OlnJ7dWZnV8h8IY+NFIzgYpf
         dau2HpfDIpc4XgyrdPMKHeH2NhAS2hAlKD1ZK/6XFxviAlWZlwgmIXduY1jj9Y9GmPsP
         v0VJ5U7w00W2Iv1HEbOk+MjUUf8hSJeMgogPLWAFrNRxl5VqbqaC5GGVu/J9gm5Tpp8q
         4v668NsLMcepEcbFPQBmCXHzOBhyh6DboB4c0DX0pG+NmIknjvc9tPrK4NCaEcFVTH28
         dZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790101736; x=1790706536;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C8X3rEi3yYXQtA/Wr780nU/kG57I9jcWzCAz3MJajWM=;
        b=Mq6yFaigXwja2igM7H+7/yNkDoMHYKbZsqwdJ7nIS/zbtU89swi5rt2dqNOG0/lrau
         bIfIQjrj+dtZ0itGfgv+AE9Z24wopPu5tp5781yASCY3cr+TvJgGjbC6N1pcW2YW+L1n
         et/IPMaZGXXZdAhpgJvgZOl7hs+Ox1c7GBtgUAma+xTam2Ef2l/JlG/4w5MVVNUJq4zv
         CAb1VnrYGLNqXyPeesP/nznyMWqlYgtDPgm6j9rlvUxSj1pHBHnHAqIZT5DC3l8kU9JA
         oOqmvdEdzCfnD5ggTwt0t/oM+yjDvSRVilC2fu1BZEjSKiwqfWHPWKAHnRdT88kyqSgX
         n0tg==
X-Forwarded-Encrypted: i=1; AKwUvByxYLAE1PEc97s4PJgqUFonFrY+G9DIAlt70siJl3RvTdNeJtLwQ3F+C+HiC2NBHfvemvRt2vG0iiU=@lists.linux.dev
X-Gm-Message-State: AFuF++kSeTmt7lIoXMxdeZPSV2L4e8+G3ispvczTjPrzNxS/+5fDyqwW
	6rfixpcGp1YIAiGQI8XguvpVad5MU2R5k/zdBgxUzXrXOXShZ4P9rzrrS1h8Wb/JtcvkqU5Wfm0
	Ytiz8yzDEvk2US+iYhFRiVwUY90Uem5A=
X-Gm-Gg: AYBFou1gpj8phMhHNP+VMJLgu+p4HZum/g8gzfbV8phxWncD1A5cYiNnDQmCBn4zxi5
	QyBzvXmvKfb4N1jXqZfU5+vbM38vj8SlaaoVXGL76P2KpvilqWPNjxGv5WpYlL2j68v6v4zQdTg
	59vXQnwMOPeSfwrifwXlTwXRaXmkslQztrVDpJJ9U7RblsdSncxLojjQzHf+0hUx7OmRr11msaQ
	UNoSOIqP3csTlrJPnOYGToLylP//NEomy+780YFDmejKX7fs/bEIflknBHt+xEX2i9PDqJy70qV
	YeZ2jcKIVU7J5Y9/RzjISUdwy5Mm5gu8YGPzr0giAvIKxYy5w72LX/7/gMINoF7UCY92/9y7LHU
	MHOmCQRlAoa6sJly9Klym4A==
X-Received: by 2002:a05:6402:4518:b0:6aa:12f0:166e with SMTP id
 4fb4d7f45d1cf-6aab38a8641mr368480a12.16.1790101735486; Tue, 22 Sep 2026
 11:28:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKSQd8V28WjMcsfh05P5SNfXXvtafBH6fyiyqMzQ9GtU8fQGSA@mail.gmail.com>
 <f133c35f-b013-4395-ad1f-53765114d4b9@intel.com> <CAKSQd8WqQdNDoEqM+PZNHg-yr_4VJTGYdV=bCbYfRDyR7kUjbg@mail.gmail.com>
 <01a1d68b-a4e2-40e3-b3b8-c1046faa6c77@intel.com>
In-Reply-To: <01a1d68b-a4e2-40e3-b3b8-c1046faa6c77@intel.com>
Reply-To: ludloff@gmail.com
From: Christian Ludloff <ludloff@gmail.com>
Date: Tue, 22 Sep 2026 20:28:44 +0200
X-Gm-Features: AcwNN1VsibCEVXUWfVOgXZYccRZ_iWDBoTKrTPQuJ56JBNJx_0IdVjmNLexMxas
Message-ID: <CAKSQd8X0bWYbG2VcU8T5vdFsXGrTy69f_xqBUs6Ox3oNHPfbrA@mail.gmail.com>
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

On Tue, Sep 22, 2026 at 5:24=E2=80=AFPM Dave Hansen <dave.hansen@intel.com>=
 wrote:
> I'm all for documenting this stuff. I wish it was more open.

Alastair is working on it.

https://github.com/intel/SDM/issues/16

> But I do worry a bit that someone will read that, for example, "KL is imm=
utable".
> $CUSTOMER starts depending on it. Then, $CPU_VENDOR decides that was a
> mistake and fixes it in a future implementation.

Most of the mutable values tend to remain stable.

HLE and RTM were needlessly complex outliers.

> > Based on some experiments, I think that VAES
> > does follow AES (i.e. is mutable as well), while
> > KL and PCLMUL do not (i.e. are immutable) =E2=80=93
> > so that's what I am seeking confirmation for.
>
> Are you OK with just checking a recent implementation or do you need a
> wider search of older implementations?

TGL would be interesting =E2=80=93 KL did arrive back then.

NVL would be interesting =E2=80=93 for the latest P+E =E2=80=93 but
we probably have to settle for PTL for now.

> > PS: Should Linux boot check/fix that LOCK?
>
> I don't really feel a strong need to do it. I honestly don't know why
> the lock bit is even there. I'd randomly _guess_ that Intel's
> implementation was not certified for $THINGS and they got nervous and
> asked to have a chicken bit exposed for it just so it couldn't
> accidentally get used.

AES DISABLE+LOCK were originally added due to
import rules in some countries.

> But, for Linux, the kernel doesn't currently munging the disable or lock
> bits. If someone munges it with wrmsr(1), they get to keep the pieces
> just like any old wrmsr(1) user. I'm struggling to think of a scenario
> where being able to twiddle either of the bits could be useful to an
> attacker.

If LOCK=3D0 leads to someone setting DISABLE=3D1,
then things will get slow, or do who knows what in
software. But then... armed with WRMSR to begin
with, someone can do a lot more damage anyway.

> So I'm not sure it's worth prodding, even if we think it's got a funny va=
lue.

Yay. We gave it thought, and got us a record of it.

--
C.
