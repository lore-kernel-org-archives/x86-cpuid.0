Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F148266B72
	for <x86-cpuid@lists.linux.dev>; Mon, 18 Aug 2025 18:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755542648; cv=none; b=W490y8AWi3szmt7ZsIp6UTWkyWHjjR3wahkI9FVpzjwQQN9MtvH2+iGkV06xuYEB5DYg7hOr2uPpeDNsAydBfkTBxZNcTPJ6s+ij/2v+g9rdOQj4hBDIz1YB9Pb+ExqRa3JTRBGnWFmAXs8fHvxpnR7NWGB0TkvSHviluO2outY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755542648; c=relaxed/simple;
	bh=r2XxQ52lHCyHEOLTg4w2owfYJdEu3Z61WuKp6V4myxY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=T/4/BXqETgldM1shFOoUOdHV/4aMgxVAefXsC6OCIpgiwiDA++HzSr+RDHmDixfuNQGxrr66ebTnB7PwPiZTG/N31R4ScGueW5C4QvU7j48EIEjGWBgf9S2GML5ZYB/Rosmlkki/ro6O+p9x+B+jgjcBKv3IWZZFPz0hOf/Mxi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OuqwVNkJ; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OuqwVNkJ"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-323266dcf3bso3972024a91.0
        for <x86-cpuid@lists.linux.dev>; Mon, 18 Aug 2025 11:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755542646; x=1756147446; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=O7VFs4hq2gNspXwqVl6VRBHdFDdDcXCC8KhRWDTZiRw=;
        b=OuqwVNkJVvVVN4o6Rf3nIH7qqi4cEkM4VxcVRGaodhfPyAB62fYRxpnGopMz2xldPC
         TxS/WoBiqm4LP2r6ZPd9vcs+XeVbTcxOeyxPMg3ce8IdJ1/X70INBRTVghwaw86kJ6o5
         nrIzrrH6E0u9EKKL/WXtyK4yjHYnbB0si2KvOO5bAlXughqjhHy3SqLDA92oYh/6Wgq5
         xQAG9gNdV/J87dLDjIseyCdQeSN+I0C5/yzPubGRE5XyYiTVGZFQZXms5TfUT49Rm1qY
         KB1pxHlyMXWtlB1JTM+RFA8OqZWWHPxRnyoIoKbFWctO4dBYDzALa82fgMeERQKQuif3
         VYFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755542646; x=1756147446;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O7VFs4hq2gNspXwqVl6VRBHdFDdDcXCC8KhRWDTZiRw=;
        b=jLtP4AzRHVhk7sAwauyatVMSbenNH6pdpym6dgO5397n5tSTDlPPwIUKVysHCZb/WG
         jIBGIt04YcfcAt3p7U0ZNsikDAHNXoAWf7Q11Zg9H/sSdEqeNDRvJeoeAKMxUM7FcEZ/
         CrcXZTJHNoEFAEYq8hAcEuE9yPFawp8JXAcWHYm3unUpvUwHBLiQHFjxz2K1qAmXYg2x
         ZxqdlUaN7lmuv8jVkdkLX5GVuMdae2+QtZskb4RaP0UwjI5RlqTU0kNiue69+rl+f2Du
         BRr3dwTW3FCapMNQt5NfoWajgzdCslDtMedcAfMpGci0xyDXA2/iQn42Yv6KaXd/OtAR
         le+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXzdax049BNmfVWhk6yi9kkrPuW3adMqxYExudYN2EWcEsuU8zyQvz8tjr4zsud9Q2iDld9497BfLk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxRfkKEOR8yLuDqcoMt/wkTgunH48B86Fhu0YtX9vD8nRHrhEgj
	0O+5wmmO6FHPf2UmPTYWVKjYuvHCG9Hkyq8SiKWIAYSDOStAq/n7vkFMnvxXsMux00LIyDJehLH
	J7UJmgA==
X-Google-Smtp-Source: AGHT+IFbv6MSiYoyRwcd/L+br4Cu17Db/XUTz80bmXGN7MeXNKUOMQuWXjPjvJM0zzLKaUedGZrb9HX2C8M=
X-Received: from pjbqi14.prod.google.com ([2002:a17:90b:274e:b0:321:c36d:1b8a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1350:b0:31f:253e:d34f
 with SMTP id 98e67ed59e1d1-3237f5b035emr409973a91.19.1755542646569; Mon, 18
 Aug 2025 11:44:06 -0700 (PDT)
Date: Mon, 18 Aug 2025 11:44:05 -0700
In-Reply-To: <aKMvTrrKYgJNWX8L@lx-t490>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250815070227.19981-1-darwi@linutronix.de> <20250815070227.19981-8-darwi@linutronix.de>
 <aJ9TbaNMgaplKSbH@google.com> <aKMvTrrKYgJNWX8L@lx-t490>
Message-ID: <aKN0debsio7ocitW@google.com>
Subject: Re: [PATCH v4 07/34] x86/cpuid: Introduce a centralized CPUID data model
From: Sean Christopherson <seanjc@google.com>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
Cc: Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	David Woodhouse <dwmw2@infradead.org>, Peter Zijlstra <peterz@infradead.org>, 
	Sohil Mehta <sohil.mehta@intel.com>, John Ogness <john.ogness@linutronix.de>, x86@kernel.org, 
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Mon, Aug 18, 2025, Ahmed S. Darwish wrote:
> > Rather than define the structures names using an explicit starting subleaf, what
> > if the structures and APIs explicitly reference 'n' as the subleaf?  That would
> > communicate that the struct represents a repeated subleaf, explicitly tie the API
> > to that structure, and would provide macro/function names that don't make the
> > reader tease out the subtle usage of "index".
> >
> > And then instead of just the array size, capture the start:end of the repeated
> > subleaf so that the caller doesn't need to manually do the math.
> >
> > E.g.
> >
> > 	const struct leaf_0x4_n *regs = cpuid_subleaf_n(c, 0x4, index);
> >
> > 	struct cpuid_0xd_n *c = cpuid_subleaf_n(..., 0xD, i);
> Hard case: Subleaves start repeating from subleaf > 0
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> This would be the CPUID leaves:
> 
>     x86-cpuid-db/db/xml (tip)> git grep 'id="[1-9][0-9]*" array='
> 
>     leaf_0d.xml:    <subleaf id="2" array="62">
>     leaf_10.xml:    <subleaf id="1" array="2">
>     leaf_12.xml:    <subleaf id="2" array="30">
>     leaf_17.xml:    <subleaf id="1" array="3">
> 
> For something like CPUID(0xd), I cannot just blindly define a 'struct
> cpuid_0xd_n' data type.

Why not?  Like C structs, there can only be one variable sized array, i.e. there
can't be multiple "n" subleafs.  If the concern is calling __cpuid_subleaf_n()
with i < start, then I don't see how embedding start in the structure name helps
in any way, since 'i' isn't a compile-time constant and so needs to be checked at
runtime no matter what.

> We already have:
> 
>     struct leaf_0xd_0 { ... };
>     struct leaf_0xd_1 { ... };
>     struct leaf_0xd_2 { ... };
> 
> and they all have different bitfields.  A similar case exist for
> CPUID(0x10), CPUID(0x12), and CPUID(0x17).
> 
> But, we can still have:
> 
>     struct leaf_0xd_0	{ ... };
>     struct leaf_0xd_1	{ ... };
>     struct leaf_0xd_2_n	{ ... };
> 

...

> And the aforementioned KVM snippet would be:
> 
>     const struct leaf_0xd_2_n *l;
> 
>     for (int i = 0; i < ARRAY_SIZE(xstate_sizes) - XFEATURE_YMM; i++) {
>         l = __cpuid_subleaf_n(c, 0xd, 2, i);

IMO, this is still ugly and confusing.
