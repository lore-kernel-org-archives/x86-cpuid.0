Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F257330F927
	for <x86-cpuid@lists.linux.dev>; Wed,  6 May 2026 13:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778076000; cv=none; b=GqZQB3B6zNVKUlYGtLsaE6Rq792FclmfehdjkR6NEy/W7aC6I1tgqieXiyYEv3AFQhWU+8Yw+TNYMiY70Liqq5Ud5mnfh4r4JnvliUuNOD9sRCPkCvaK+DpuyhGN4vqg/JlBePlKoeOMDAD0NL0X/6N3xdaqS3YzpJC83z1u/2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778076000; c=relaxed/simple;
	bh=n310AmM0JUTtGA/lA+w+FGaVNeCSwETYmIoZPgel/1c=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=KZ0XKwH/biV4CczkMwS7QvFfT0dlVBpSugVJ4PEMEgqnDTjGlMfl3pzCy51InuA9VuZk881Rx6RR7YKHjDE/hr8MMFaBH9Rz/bjA02qPodhB88SHbHzxx4T0kE3Ga8RCTwTBHPTcyEqNK2E3II7Vc0Mas0sWVSNc/vnZloAEWI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=apvQeFy7; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="apvQeFy7"
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 646DxHxF2996412
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Wed, 6 May 2026 06:59:17 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 646DxHxF2996412
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026042601; t=1778075959;
	bh=Wh9XXnnFriJDo8lNKjbaj1Z0oPMrsI91BCPvakrye1U=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=apvQeFy7fZBYPclNWT8yjaOFdMK0U+N6M+hwb82MeqJbiDLw+tf9K8AMYSbhjkvJd
	 TvtWUIqxGxUDK+3LknMI+dWtT0Ulcn08qr/v4kjTh5ZmAXq9FvOATliAwRs6v4XzeD
	 MQS+jbmLkT0LPjq/Ri0Kl/b4A4auXBMPvPY6hUbP+gDgkv/odFWFgDT5FkINBxthcA
	 EXgrkOp9D9oCEhwIdvbiThcyVjcRCqJq0ARW2hM+IRmG2I8Go7Sb5YNKShvluzdOxB
	 Mf/tI5AzbDF9ZsR32jLDL6dPwausLpIenThLRNEkawUIFr7hxJx3vpSQT1pXTE/tht
	 vDpTTiIdxO7mQ==
Date: Wed, 06 May 2026 06:59:12 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Borislav Petkov <bp@alien8.de>, Christian Ludloff <ludloff@gmail.com>
CC: "Ahmed S. Darwish" <darwi@linutronix.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Sean Christopherson <seanjc@google.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Sohil Mehta <sohil.mehta@intel.com>,
        John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
        x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 00/90] x86: Introduce a centralized CPUID data model
User-Agent: K-9 Mail for Android
In-Reply-To: <20260506085049.GAafsA6dyeWjCr4wOE@fat_crate.local>
References: <20260327021645.555257-1-darwi@linutronix.de> <20260327152354.GBacahCioljpw5QqUc@fat_crate.local> <acrBBFyU_vi4zFOx@lx-t490> <20260330230836.GLacsCdDkVu0H3XU4l@fat_crate.local> <adz3z_MaWJr_GOtc@lx-t490> <ae-uw9836AJScRsq@lx-t490> <20260505133350.GAafnxvtgFxJHth8WB@fat_crate.local> <20260505151242.GDafoI6oOOs9hknrrK@fat_crate.local> <CAKSQd8UvY2iLew9gFYEs0MCgPa9R8RiQLP+kJUb6Cw8BYo=yBA@mail.gmail.com> <20260506085049.GAafsA6dyeWjCr4wOE@fat_crate.local>
Message-ID: <19B93CE3-37F4-42FE-97CC-200372C73462@zytor.com>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On May 6, 2026 1:50:49 AM PDT, Borislav Petkov <bp@alien8=2Ede> wrote:
>On Tue, May 05, 2026 at 12:11:50PM -0700, Christian Ludloff wrote:
>> First, 4C78_0000 EAX should report the max 4C78 leaf, in
>> case there is future expansion=2E (CPUID does always grow=2E)
>
>Makes sense to me=2E That'll tell people up to where we have those define=
d=2E
>
>> Second, the number of words reported in 0001h and 0002h
>> should be enumerated, in case the list grows, and so that a
>> program can tell between all-zero and not-present=2E (ECX>0
>> sub leaves, basically=2E)
>
>That's good point=2E So we have now:
>
>words 3, 7, 8, 11, 17, 21
>
>which are Linux-defined=2E You've mapped them to E[ABCD]X regs=2E Sure=2E
>
>We could define subleafs and keep the main function number 4C78_0001 same=
=2E
>Sure=2E
>
>And 0002 is for Linux bug flags then=2E
>
>That keeps the feature flags where they belong: word 1 is for Linux synth=
etic
>feature bits and word 2 is for Linux bug flags=2E  Makes sense=2E
>
>> Since 0001h has already used up all four registers, it can't
>> report a max sub leaf in EAX =E2=80=93 so maybe e=2Eg=2E 0000h EBX
>> has to do the job instead: it could do e=2Eg=2E two byte fields, to
>> report the number of words instead, i=2Ee=2E 0000h BL =3D> 0001h
>> words, and 0001h BH =3D> 0002h words=2E (Or wider fields=2E=2E=2E if
>> you expect more future growth for words=2E)
>
>Do we care?
>
>Those leafs are purely for documentation and no CPUID execution would eve=
r
>return them=2E=2E=2E (famous last words :))=2E
>
>> That said, it would be good to get the initial set of commits
>> done so that db updates can start to flow in, to catch up=2E=2E=2E
>
>Yah, that's why we're talking about them now, before stuff is cast in sto=
ne=2E
>
>I didn't even know you've documented them on sandpile=2Eorg before yester=
day and
>was under the assumption that no one cares about those leafs outside of t=
he
>kernel=2E As it should be=2E
>
>Goes to show once again how we should be very very careful what we're
>exporting outside of the kernel=2E
>
>Thx=2E
>

Sadly, not true; modutila at least does use these numbers due to the brain=
 damaged way that cpu feature modprobe strings was done=2E
