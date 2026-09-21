Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204664FC8EF
	for <x86-cpuid@lists.linux.dev>; Mon, 21 Sep 2026 18:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790015835; cv=pass; b=ks9lDZDTpvdFKQRlrZKdA7k4ygM0NF9DGLh9b7OArzwNe9l1950icrYfBn1zP5MscMrIsuo2/Op76tmzhLfba217xR7LeEY4CQFnxtVALjdn60xgKpg9BP0lw6N59UAfhzmSmuBhTd44XC3oAUG2Ss6XR+s+c9LMrij1BYdLfoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790015835; c=relaxed/simple;
	bh=/UwEhuRdNe3bBwEXnnITz3ioli/gSo/Xo8Gbi2dTHhM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ZkCcZONd+y4WRxAO/0W05UW2+PZZ7YFQS9mKhYlyabINRncQT+Ack10HYhhEKUIpYbI+f3U0FEcIE2ug7KUbI1pdPrZ37/35dWr3P9uDM5zkjyQW8SDQZbqo387DCoE1yYeY9hEqul2sXd29JZS86OQJTGn4336boBk3jKf8r5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XiAIudxt; arc=pass smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XiAIudxt"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6aa1d00daaaso5732376a12.1
        for <x86-cpuid@lists.linux.dev>; Mon, 21 Sep 2026 11:37:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790015831; cv=none;
        d=google.com; s=arc-20260327;
        b=kW2Tg5a1vfXTnaxCgrOWKw1hHUynjEqrsD6RAHfpl+xozkhGprSsYGtL/4ftkL/BvL
         Y9n9+DP2tSrFa5BkeP4om8C7Xp44sYjre77sMc+5u1eTlLVN7KZC/JJj4GN15CeUdeeV
         RT/SKhtPiVyZ5sKcqAmNxsut7oy3rtOpICmlNnmggDhG/DBtscpEUpipLregHPJKlPTY
         b1pVWshksFVFShoOXNdeBtVP9Bw3u4sqVxomefFs/LJPksx5yJeY63Sc+iwPwWumhq7K
         K10JobmGzRfsa2E/VYsVF1D6C5Jc2r16p9isvhxrgHPshFH3d390QsUSa+e9WyDvqLok
         4f+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:mime-version:dkim-signature;
        bh=/UwEhuRdNe3bBwEXnnITz3ioli/gSo/Xo8Gbi2dTHhM=;
        fh=PH6v89vsTo0txqGyqCGnK9BwbZObRa1QOan1GOIkNAQ=;
        b=kS6p2gd14iuIwkOkcnAOTzZ7p2foVP4Piw+TfZvmZCRwsfy+fu+ex/lJMhHbPLn4DE
         mVZXmVC5099cxxLTta+pe8ZKe0T8ntys+/VhT2uEaa44q+rYsZ/fdzS/gogZZ70jV4Bt
         xBPpC1J7PK8a2jp8Steyv2ryyTpRx0x571hJpHvnUFRlhOTh+nKJAy/YNkQ/w1V2omlu
         jbrYIM4QNEriRxNpZwMNzBGEcKsZYkk254eIrTUHkgmhEryw/REiX1OBJ+dI2m0w3v92
         7r9ggCUe4OfovmJULmzhMnNly9KZCH53Fz7e8JbdLmpbXMS4qupBRc6A7N1kClDCm9g9
         vgUQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790015831; x=1790620631; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/UwEhuRdNe3bBwEXnnITz3ioli/gSo/Xo8Gbi2dTHhM=;
        b=XiAIudxtZbby5n/k+SrrJeQow/zp5FwqbU0tA91dbxQNS9Zf/lp6tf5WWDITGO4+2n
         BhNGXT2aXS1UWlNLAbCT2IaKpQ+2cQWx68V4R2SxeQ7TXE71UCJI2Y66UDieR4P+RiTD
         iHRzV8w3MgbXgHPRTel+jaml6jzULgxh2WDYoxw/ttI7LUVOsf7Opx9GjKBK9N2WYHD+
         A9wgwhGQme0loDmFIYlH8lXL8QIoB0s8f8CezYE+RqSYtOKuQrmeWVKoi80QKs3HkU07
         Ui8DZw0bsyV4OAlBV84dXsniVnebMpslTiWma6LoGihRmEhFtNIT3fw6+x1YxyjS+3De
         9YOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790015831; x=1790620631;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/UwEhuRdNe3bBwEXnnITz3ioli/gSo/Xo8Gbi2dTHhM=;
        b=iMLE15Uy294MjfnfJR84h+EXLIDof0HZSLRGEveKpW/vVZI5ZvCxUJOAcdhOw8RrlP
         fnVm0eM60wp+Es+VsoBVSQGnSQI7mJkUT2idgW/VtlJ/O9wSQOygZ9oNH/Jv/Vlrj0Ym
         VOgNK3M6ZOnVfxcpwSylvU4w2oSUnXhi9MA0OKY7UoDwOWkLETjUaBYlzXgiQjfQH6IO
         IocseAH//0fhSMOYfEMHNQkSkr8yvR1h3M/MO+dAnItjcihWa+A+4L/pCqUrpaPINy13
         102KtWLTMe6dEJTBUpfwvhcvRdGng8s1k1gi613KM9O3JYXY3K0kzx6F5vcjQOVb+f+t
         H00Q==
X-Forwarded-Encrypted: i=1; AKwUvBzF9fkbL9tB84mQ4Y7m8nAxD8LSggjutIb9rMM7wB9qMtSAz6BPSt+PPdoMo0GLSjOyLCgsw/YZUtU=@lists.linux.dev
X-Gm-Message-State: AFuF++kdEmRQtL2J2T9MfR22/SnHXrVJg9X5uhv/ZyxzaJTjhZDkeCrY
	bQs/2Znq7h2UPz6w9QYFwwT91XynQDeMY6UatUTwFxEvjobbKbWUKBPtgbFIEH9KTv0zQmK87JX
	PnZNxP5nrpoadWxd31xVJFRoIuWSIz+A=
X-Gm-Gg: AYBFou3J9KdU4DeWpR8IJHptFYL7uPCUfF2PFmg2lsxck3NNjrqSsWDRypvtzn6iOY8
	u8239h0iv23oeda5ksfv+mcNu5v5eRZNkLc9oLevTtJX9BOcwlU3Oms/TFFqth3NgESkgtpmTrJ
	i6/l0rWEUh4B8j+n8AaGUixk06lEa5BVrSLDkR/y//Ny8jOlgVwhmPmMEaxZc9tkerdFU9AeiUB
	duKkv709UdbxwCgDtiCS/sxkwlgb5zfhlHOmaCvJfFq3AfxKZIuBn886tuEi6ZgWHnb+uxousSY
	QgGVZIVqjLTXi9cA/a4LUW7Es9s8hR2S5kh27IeOZcYWSRvwoCGX/eRMWzJSRWpcBVP1atpEqTM
	coPf0CZ96kw==
X-Received: by 2002:a05:6402:4009:b0:6aa:97b4:31d1 with SMTP id
 4fb4d7f45d1cf-6aa97b432e7mr1749490a12.38.1790015830530; Mon, 21 Sep 2026
 11:37:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Reply-To: ludloff@gmail.com
From: Christian Ludloff <ludloff@gmail.com>
Date: Mon, 21 Sep 2026 20:36:58 +0200
X-Gm-Features: AcwNN1XLVeCc91wnyYbvordEaS_e6fGgkAMPJk-LkXtdZ5AtBm2rTGn-YIM63Zo
Message-ID: <CAKSQd8V28WjMcsfh05P5SNfXXvtafBH6fyiyqMzQ9GtU8fQGSA@mail.gmail.com>
Subject: x86 CPUID mutable return values
To: Borislav Petkov <bp@alien8.de>, "Ahmed S. Darwish" <darwi@linutronix.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Sean Christopherson <seanjc@google.com>, David Woodhouse <dwmw2@infradead.org>, 
	Peter Zijlstra <peterz@infradead.org>, Sohil Mehta <sohil.mehta@intel.com>, 
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org, x86-cpuid@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Back in May I wrote...

> https://lore.kernel.org/lkml/CAKSQd8XM6p7TTVih9fg9fmUAkzNchPCT7B-6qzVuja=
=3D3hg_u+A@mail.gmail.com/
>
> When deciding what the code shall do for mutable CPUID bits,
> you really want to have an exhaustive list of events that trigger
> changes =E2=80=93 think Intel SDM vol1 21.1.5 as a starting point; then
> made exhaustive for all events, for Intel and the other vendors.

I annotated https://www.sandpile.org/x86/cpuid.htm =E2=80=93 you can
search for "mutable", to get a little over 70 hits.

I can mark AES and PCLMUL as well... pending confirmation:

Q for Intel: is MSR FEATURE_CONFIG 0x13C bit 1 expected
to affect CPUID 1.ECX.25 and 7.0.ECX.9 and 19.EBX.0/2, or
just just a subset of them? Also, what about PCLMUL?

Q for AMD: is MSR DE_CFG 0xC001_1029 bit 16 expected to
affect just CPUID 1.ECX.25/1 and 7.0.ECX.10/9?

If there are more mutable bits or fields, then please speak up.

Ahmed =E2=80=93 is there a proper way to reflect "mutable" in the db?

> (Besides on/off bits spread all over the place, microcode loads
> at runtime come to mind as... uhm... interesting...)

Presumably ucode loads should trigger a full CPUID re-read?

Last but not least, there was the case of the Rise mP6 config
leaves, i.e. CPUID, abused for applying config settings. Look
at https://www.sandpile.org/x86/cpuid.htm#leaf_6363_4523h
for basic information =E2=80=93 it's unclear what effect these had... for
all we know, it could have been CPUID... affecting... itself...?

Ahmed =E2=80=93 I don't know how you want to reflect that in the db?

--
C.
