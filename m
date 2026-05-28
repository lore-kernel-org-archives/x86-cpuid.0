Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0E136729C
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 22:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780008151; cv=pass; b=P8sx+RAiiLyYa+Nm0OpcQ6kypiWgXX7Uz4S+Nq39rjCfmaMh5pg4fJtswcqGKuXXAix5phkYr6AjqW0C6+NwLPf5NZ0XD8zFCRYrAf79+LljHJ/KSHRgkxWSWrYyHLFNA5Pbz/GdbVbMFXALm5yDMDtN9/QmJRhj+/BZCj1n6so=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780008151; c=relaxed/simple;
	bh=GHzxnqZUDEGJG1LcH1BrK3Mi05u/+KKllKCbNlkbyHk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z3qPXtgnygFYBhWjPL5dV/VxhrMniG5Qo5Wv+0aU4yNfZMofzRmy5xcX6mF7fwMh8zKeluYM1YXkvQD1hyIIJa7IP7RwS6nU3HWx/4V/EipufQIGYV8kJPBd6NgCTsFLD357iWrM6gZpnJ0EiHX0XxgwpVD/SRtVPfLdbpC5QiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TBt9FNz/; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TBt9FNz/"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-670ab084a39so602504a12.3
        for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:42:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780008149; cv=none;
        d=google.com; s=arc-20240605;
        b=Vftd12VMo1o84e7DLoBgoZnbpAeWTDLHhCbY1faHuVjDrry4/eySoUvb2dmfEqUkLL
         CDhs59XMvpQ/CWQrmYZQ3fQD6cKsWX7I5XcSekZTy1/u0+nZH7R1K9pRb057SBgyT1Ot
         H9WKWtFF9x1vBTvA5X0awrC1WEsBiqgZd6CExiWJ1mhIZPrR2ZTW3LVQRGsofwjKhlU0
         SS7ACezDOj2sJo1SVGCqubHweRT0q3OoLrM4W5MPU8w8VQPOYIl60bbh1jihczc+tck6
         COhV0DYG7OIg0B+FKnM8wGiS/SBruX227JEFcTmWP2Z4cnoACXbCpPa2YDjgl72YDjT9
         UP8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=+GzBEWcYsEnQTLXwpMLnlSfYbd+pfXk8KWHEjWJ63uE=;
        fh=MoCVX+BafdRw3nauIBLuvCaaVz8/dBYYjkESMDLevaM=;
        b=TyJBuhGWXtS/NgaTQZ3FOGkLpzAQ2HBeKq1AWJrnXxGGD5HZuHxd6ANOu67KAgL/Gs
         B1/qzBvKqJ2eCVp/WqbmSAeMaM0bE9jaFN+S5NFRiM/lEGzY0dOVC06q5Jc7TjB+YtVb
         WyJ7PH+Si9mLzkg77Ive5icvB0Tjjo21ip0iAPuX6wXVM5KT14WcQri8fpINNvdtAKAF
         bu0o2ZI4IHN4g7V4ArPH9Ck5V0A858jOz1S5dJ1NZ6o6DpJK4qZ/XukS8qfgeM+F5KlS
         2hVDd6ZPBdqV3UqSV2Bb6Q+0HgOeRqKfqry3n0Tcgd3UgapslWZ/lO/O4lA8abP6tFzN
         DiKQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780008149; x=1780612949; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+GzBEWcYsEnQTLXwpMLnlSfYbd+pfXk8KWHEjWJ63uE=;
        b=TBt9FNz/cKpoHhC6DxSA8o+yPRXyRLyZG6SSrc2Pkg2acBmGFnEBj0VZMr0vMuGkNm
         KX5EkLVigBtcpFcU1QuqEXKCbosY5psMNyV9vMRdHCd+tW9zm75nqENuo7h7sRVXGltn
         CBEL2UTturl54Ed5B2qWCOv0z7bbrR4lRIwoKQv+t6/4RZIE9tkCxb+d2ZuVtWeJ/Qjv
         e8TC9kJzY1shrWEquPFDTOH6VjLD1QkvkqSvNC7LX5nvDwUNxrKXXPZNB19O0McphnZG
         fHexg96LkDOQqdFxc1f/5QiACVYsn13DwZOJhCpUaL4Oz8i9Gtd+Jq+ohkjjhzpDGiM/
         QYIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780008149; x=1780612949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+GzBEWcYsEnQTLXwpMLnlSfYbd+pfXk8KWHEjWJ63uE=;
        b=imo0ne35qkFXkAhD3sSxJBLq5fsfR66nuuTarTRoSYe6FAJkb8DNPsKjBNrY2kMnAG
         owqCFmt9ZOxpUNCV9g7c//jbeUhwBdPQ7GQ6mNkrNwu62hEVevQyOhI9Trte5gQUVkjd
         jbtU5fhVViVg8+FJKstXb+boQEpdDTYmsMehZRpktJxUEi7C+GJAos2KTBAX8n19urvV
         //75pY3/mzA3YCoIkDFLzkvHakmusJtoHvCdRKo2znsurhQA4KCgrGw06fqX8vci80nW
         bfpnB/9w/XGFyaSOhvAkW3sFhffLNxixjiWV1YQ5gMvmwesgFqGN65cda7dpVUNZqp9X
         DyiA==
X-Forwarded-Encrypted: i=1; AFNElJ9O/5HOlcmUIIwuLnIFKh9U1/R0uHghFe/v4OzWLxv+pSAYpQJoW1wkg2Cvv0ONvcbXL8Tzj0vxlnw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy27sb+axSto3mXxLW6lnep1+FIXfNpW5JvZgcr1KCAUjn5iA3b
	iW4OmQjqcFG2vVAyh/7iCxyoy5L9o9GyDWVRW6u668HXdqEq5x8o2aEXYLi+VgCwkKndEba5ZmQ
	nHhdBpcp805k8a4LZtD3W6adtN1Oz9qc=
X-Gm-Gg: Acq92OEnmrQH1CkicZZy+gXpdzIcPLec3uck/kvgV5EKxfTcFNeSAskyfGSiBNazjK3
	5GfvtP7FieHV+MOlYq4T4QES/dkc8rE6AoLI/ISBeapBR1g1878kVv1Nkf/3NuZ2zSKuKX3N1dr
	4AGRtdFrZh6j1ank0VWoTkCGFwKaz+XwqUkzL45gS6YV8+CzLDB4aWxpgLR8FM7uhqB+0zWIpuA
	LdVbkXC9rW1iatRao6PAKXMurB9v6oI12PalRcLnCJHANA8UqP65cY43I7r4RXyAU19Q5mOQySl
	Kg1kODkRFndoz+mHBsuNrR5gE5apbFcHdF/PtVf3XaRIAlsfcYnDHC/le3YkRw==
X-Received: by 2002:a17:906:9c50:b0:bc6:7238:bd4e with SMTP id
 a640c23a62f3a-be9c8e6303bmr1944866b.5.1780008148628; Thu, 28 May 2026
 15:42:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260528153923.403473-1-darwi@linutronix.de> <20260528153923.403473-48-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-48-darwi@linutronix.de>
Reply-To: ludloff@gmail.com
From: Christian Ludloff <ludloff@gmail.com>
Date: Thu, 28 May 2026 15:42:17 -0700
X-Gm-Features: AVHnY4KcZO9Kzz_AI4avsozbzAAsAHs3r74UdvavQ55Latre7LSIxFNuFV1NzMQ
Message-ID: <CAKSQd8WKPQoDNUp-ykJ2j0mqg2Fn7m98ipC+d2Gz7MfHKUW5WQ@mail.gmail.com>
Subject: Re: [PATCH v7 047/120] x86/cpu/amd: Refactor CPUID(0x1) level calculation
To: "Ahmed S. Darwish" <darwi@linutronix.de>
Cc: Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, Sohil Mehta <sohil.mehta@intel.com>, 
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org, x86-cpuid@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 8:42=E2=80=AFAM Ahmed S. Darwish <darwi@linutronix.=
de> wrote:
>
> AMD K8 init code has the cryptic CPUID(0x1).EAX level check:
>
>     (level >=3D 0x0f48 && level < 0x0f50) || level >=3D 0x0f58
>
> Given that:
>
>     EAX[0:3] is the CPU stepping
>     EAX[4:7] is the CPU base model
>     EAX[8:11] is the base family ID, with 0xf as the largest
>     EAX[16:19] is the CPU extended model
>
> [...]

For K8 the 8-bit model field actually contained 3 distinct pieces
of information: bits 7...4 encoded process tech and K8 revision,
bits 3...2 encoded core type, core count, as well as cache size,
and bits 1...0 encoded socket type.

https://www.sandpile.org/x86/cpuid.htm#leaf_0000_0001h_Kn
right below the K7 section.

The rest of the AMD models were sane.

--
C.
