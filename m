Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E874136E28
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Sep 2024 18:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727461769; cv=none; b=gTpzd6tK3YDv5VIbM1os+JU9vQ3ExbyCPQqkrec6cVOhdC+2OeUYvML4DRA7OgRhIwXHxrOxjx3dwUN5I2uwspgrB1AvdkQAOgC9wKgkAx4v6ujjy2/Y69r2EGB68SzidksmN99g+hjGu2H3WKrszMspsEXB81K+G7qD/eLJDhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727461769; c=relaxed/simple;
	bh=W8bi/YMnq96+a28Qy5kThdY4yJxO43sqbhMGNvksf7A=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=kKHJxmexE6e4bKThgY6RD7nB+6+YbTFnBPCixmHinWRDcFC/6oAvJArX6AQBAL/dU3A9XYhK37fIB4957xRhHbMXFxxzHkD3pQctPf6ZrYinG5ctf4uLjYLy07XIYZupS9/1KL0WWVbc3B+/j4Zca7y3CNX6GKJUtRB1mzPBreE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=qqfG6kVY; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="qqfG6kVY"
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 48RITKYM1800467
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Fri, 27 Sep 2024 11:29:21 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 48RITKYM1800467
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2024091601; t=1727461762;
	bh=W8bi/YMnq96+a28Qy5kThdY4yJxO43sqbhMGNvksf7A=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=qqfG6kVYV0fPAXGBePfmvQTWYhCoz7CSYlUG2L27Cyt3n0dtUI9FOtoj0Im6yafrk
	 exNhPHdhXUI5fax8g7HbZFmPVkzXx6HR1haoYChyW4HQf0MLZbypeAiFyWkKqrzdqM
	 lgGtuRNj8+jjdESBdUU0Ecle+gO7qVVXnck5nqgopHXGM3FaHFO1PRFs/EKyUBpfAM
	 E5YCiNe085YKIbvWdHp5LdPNmXUuzuNRueEqCECz0kuUkYO1DIlebE/3/bg6obFxwK
	 e/nBr6m8ZBlxLWYujRdFxb6H3+DO8k/5oycKYisv0X1abHwN1aCekYgeymsBRcrmvI
	 IDr1tZa0UBQSw==
Date: Fri, 27 Sep 2024 11:29:20 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Sohil Mehta <sohil.mehta@intel.com>,
        "Ahmed S. Darwish" <darwi@linutronix.de>
CC: x86-cpuid@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>,
        Xin Li <xin@zytor.com>
Subject: Re: [PATCH] db: Add Intel NMI-source reporting feature flag
User-Agent: K-9 Mail for Android
In-Reply-To: <a8fc6ca4-79e3-41f5-b195-e91d4d515f8b@intel.com>
References: <20240923223213.852758-1-sohil.mehta@intel.com> <70cf05c3-0ba6-4a5e-a7ab-21cadad3c255@intel.com> <ZvVdzJIIqaC_javn@lx-t490> <a8fc6ca4-79e3-41f5-b195-e91d4d515f8b@intel.com>
Message-ID: <6CFCC415-2F08-465D-B61B-E465A44DDD67@zytor.com>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On September 27, 2024 10:47:56 AM PDT, Sohil Mehta <sohil=2Emehta@intel=2Ec=
om> wrote:
>On 9/26/2024 6:12 AM, Ahmed S=2E Darwish wrote:
>
>>=20
>> The <linux> tag means that this bit is also represented inside the Linu=
x
>> Kernel x86 tree in various means=2E
>>=20
>
>Got it=2E But this would mean that the entry needs to be submitted after
>the linux usage is established=2E
>
>> For now, the goal was to cover all known names for
>> the cpuid feature bits, especially when they differ; i=2Ee=2E canonical=
 name
>> vs=2E Linux X86_FEATURE name vs=2E Linux /proc/cpuinfo name=2E
>>=20
>
>Also, the various cpuid bit usages in the kernel might happen in stages=
=2E
>
>Are you planning to have scripts that automatically pull this data from
>the kernel as and when these usages get merged? I believe asking
>developers to submit multiple edits to the cpuid-db might be
>inconvenient and error prone=2E
>
>> Thanks for the question! I'll indeed need to document that part of the
>> schema before the v2=2E0 release=2E
>>=20
>
>Thanks! That would be very useful as more folks start contributing to
>the project=2E
>
>-Sohil
>
>

Should we include a copy of this database in the kernel sources?
