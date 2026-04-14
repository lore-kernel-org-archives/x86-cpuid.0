Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48FE3E9591
	for <x86-cpuid@lists.linux.dev>; Tue, 14 Apr 2026 15:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776179468; cv=none; b=cyiGO7SzmnW4Aiv75uTIjMnKZCC8sSFaA/Z/0dsYxDPSuCso5KnFNv/xpkJyORloq+M4QW3306p5Tui9wK2zqB20mZNE5JlDH/Jwpxd+oxYtZ7JbnILxYQHBnQPwmSc8c4iC26+HI8gg6len0Q/hp9Iufe5amKniZ1xZ5RhnjAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776179468; c=relaxed/simple;
	bh=IaHleSnS5M9SdbH1inXlCvKfva7foKcaVlHcHXjeCOI=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fjDuj7/QiA+p/kuiBQZ4tPY2jNm8jBzWnr5hschtPewL7RjvT78WRG/wWvQZ2RF/3bTp7qvqqps4Ke32G4RLmbYmqjevHzEMEVhJIvEscv2qtL55H3UoBgxOmO0fSdLR26qQTBs9nKAbVpnxWQImcWCpwaYiRIvfNpcNzWQykMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=SKbKR+jw; arc=none smtp.client-ip=79.135.106.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="SKbKR+jw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776179458; x=1776438658;
	bh=IaHleSnS5M9SdbH1inXlCvKfva7foKcaVlHcHXjeCOI=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=SKbKR+jwbLfKxt4yixvko7OntaoRnGF4Egp5/gROm+jZ5AJMi6ND7rGrXHtZzrzLX
	 Z/ky0yvvtbKnwCDsQaWIxKVL+kEBkLx2Cn3GQaVzLG5YYKZkh1wvy0LIJj3XoTx/5Z
	 mikqC6HH38Zpw596NDNOz1WhXHvYu9frDhZFs6C4sthSPPosuab6Mcr4ZI1W4OFgUl
	 E5wpaJdtH96EAI3GjBM1D5+E0k1sabnJ42yVk27yH6d11MirXzzVufZpNMpRMIKm/A
	 KLE8vzkOgTTLfRARaRtwHkm8bc5TPGQtHoeTIKjXdC7M12ZVg5//klnCmwH4F2RHu5
	 zVtfUxKiimRiw==
Date: Tue, 14 Apr 2026 15:10:52 +0000
To: "Ahmed S. Darwish" <darwi@linutronix.de>
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Cooper <andrew.cooper3@citrix.com>, "H. Peter Anvin" <hpa@zytor.com>, Sean Christopherson <seanjc@google.com>, David Woodhouse <dwmw2@infradead.org>, Peter Zijlstra <peterz@infradead.org>, Christian Ludloff <ludloff@gmail.com>, Sohil Mehta <sohil.mehta@intel.com>, John Ogness <john.ogness@linutronix.de>, x86@kernel.org, x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 00/90] x86: Introduce a centralized CPUID data model
Message-ID: <ad5VAT5fModtt6w3@wieczorr-mobl1.localdomain>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 3200ebe5dd2001832166655dcb5aa1521144a234
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 2026-04-13 at 16:38:31 +0200, Ahmed S. Darwish wrote:
>Hi Maciej,
>
>On Tue, 07 Apr 2026, Maciej Wieczor-Retman wrote:
>>
>> Hi, very cool rework! So far I didn't notice any problems while testing.
>>
>
>Thanks a lot for testing!
>
>I will appreciate then adding a Tested-by tag on v7, where the interesting
>bits will hopefully start to get merged.

Sure, I'll rememeber to retest once v7 is out :)

>>
>> Buy anyway I wanted to ask if you thought about including the cpuid_deps=
[] or
>> cpuid_dependent_features[] into the new cpuid API ecosystem?
>>
>> Or if not (since this patchset is quite long already :b ), then do you h=
ave any
>> idea where best it could fit in? During discussion on [1] you mentioned =
the
>> feature depenedency should be encoded in x86-cpuid-db. I assume you mean=
t it
>> would need to be first patched into there, then parsed by Kconfig?
>>
>> [1] https://lore.kernel.org/all/acruJf-pyld-fTh1@lx-t490/
>>
>
>Sorry, I'm just back from Easter vacations; that's why I didn't answer you=
r
>question in that other thread.
>
>x86-cpuid-db will encode all the feature dependencies in its XML database.
>Then it can generate all the necessary dependency structures, in a way tha=
t
>is easy to parse for all kernel phases; including the kconfig build phase.
>
>Then, what you want to do can be cleanly added on top.
>
>P.S. I'm already removing <asm/cpufeatures.h> in the next iteration, along
>with its ugly "/proc/cpuinfo names inside multi-line C comments" hack.

Cool, thanks for letting me know!

>
>Kind regards,
>Ahmed

--=20
Kind regards
Maciej Wiecz=C3=B3r-Retman

