Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A19332ECF
	for <x86-cpuid@lists.linux.dev>; Mon, 26 Jan 2026 13:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769432697; cv=none; b=q5lqgj1W3bOKA4IsffOaNMAb1N7Pz+MQVLKiKtcgyOT/fSbHDbXoAXZab+yqiDLMBf1Xxo/Dv+KnS3hA8dDygfVqNeKzfVVUYkaYZ5R6yIqykYJJB8Y/DgFlA3wj7SZal59fK4bzMBhknbF0jyvRPhGzeTkz8xdoNtCVJSyJ4Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769432697; c=relaxed/simple;
	bh=FIohAIWbJoi+po/LYA4O3trTwCFTJH+gqpzLIi2G1E4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ukP9GvwJ9Odi0Pq0PvBwUOFj9fwZ7oT0jaCe9Tkv2CchK0e17Ol4O/IAVcA39HhgwP+ha4l49cg02mg4yT/pcDG6gIqSOkpkfhc1qIU43PNp/Ub/m4AgJ2tJUwNJ2o+TVCTjLdY97UB8LBvaLYfjzmMEOFTUzZG2aTRetUqe0YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=abekFbCS; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=LdqZRO24; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="abekFbCS";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LdqZRO24"
Date: Mon, 26 Jan 2026 14:04:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1769432694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XjfZVf8/cR6lQ2qWTY3ygE7xzL2RWv2cAyNdDuwb9Zc=;
	b=abekFbCSQp+afFAAbgwHBVyoZQHRrbPcluxpVghaxSEhFYg9WVVCgNnexGu0DBqtkHHtG8
	BsnUWW9aROJsDV/g97rELpVGJ9O+sJZHtD7z57glB5CCjnll/qp/FHaZUdCUnLvmwDlTEf
	PdTNWusGSLJ73WMYAbROw83qrkFcVjIXOmL3lKeyOiZX0Hb7rAd9kgVh9HWcg95fZ4R1AU
	BOpZEuaPqQYNRI2NKqriyUzW82dFXL/3ku9KyoNnMWmCgcIbv8cidoL7XwxOds7neHAvgS
	qNhzpJDrKAVgdqItg14eK9/WPnhWQhedSbEcmMkhiLHCYFcma1mkvBKu/3X/Fg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1769432694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XjfZVf8/cR6lQ2qWTY3ygE7xzL2RWv2cAyNdDuwb9Zc=;
	b=LdqZRO24Tqz65TV9beDWrqD8/+IvHLc+tJh4027NoZtoD/2Vkyfz/Jclte+tbuh+nef8Gk
	N7G39ZX9gimtQiCw==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Borislav Petkov <bp@alien8.de>
Cc: Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Sean Christopherson <seanjc@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 07/35] x86: Introduce a centralized CPUID data model
Message-ID: <aXdmc6F5wLthVDEU@lx-t490>
References: <20250905121515.192792-1-darwi@linutronix.de>
 <20250905121515.192792-8-darwi@linutronix.de>
 <20260116203117.GAaWqgFYTv1bHLxKV_@fat_crate.local>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260116203117.GAaWqgFYTv1bHLxKV_@fat_crate.local>

Hi Boris,

On Fri, 16 Jan 2026, Borislav Petkov wrote:
>
> Btw, why are we calling them dynamic?
>
> This is confusing. Those leafs simply have multiple subleafs specified
> in ECX.
>
> Let's please not invent our own things here but simply stick to the
> nomenclature in the vendor docs.
>
> This is a very simple explanation IMO:
>
> "The information is accessed by (1) selecting the CPUID function setting
> EAX and optionally ECX for some functions,"
>
>
> and there's no talk about dynamic and whatnot.
>
...
>
> This is where the problem lies: you're calling static leaves those which
> have one subleaf and dynamic those which have multiple.
>
> But if one "static" leaf starts adding subleafs, the "static" one
> becomes "dynamic". And that's confusing. Nothing dynamic about it. You
> simply have CPUID leafs with 1 or more subleafs. And that should be the
> nomenclature we use.
>

Due to the differing leaf/subleaf output formats, at
arch/x86/include/asm/cpuid/leaf_types.h we have the storage types:

    struct leaf_0x4_n	{ ... };	// CPUID(0x4),  subleaves 0 -> n

    struct leaf_0xd_0	{ ... };	// CPUID(0xd),  subleaf 0
    struct leaf_0xd_1	{ ... };	// CPUID(0xd),  subleaf 1
    struct leaf_0xd_n	{ ... };	// CPUID(0xd),  subleaves 2 -> n

    struct leaf_0x10_0	{ ... };	// CPUID(0x10), subleaf 0
    struct leaf_0x10_n	{ ... };	// CPUID(0x10), subleaves 1 -> n

where "n" is known at runtime.

Then, for CPUID(0xd) subleaf 0 and 1 call sites we have:

    /*
     * "Static" access
     */

    const struct leaf_0xd_0 *ld_0;
    const struct leaf_0xd_1 *ld_1;

    ld_0 = cpuid_subleaf(c, 0xd, 0);
//                       |   |   └────────┐
//                       |   └─────────┐  |
//                       *             *  *
//  ld_0 =              &c.cpuid.leaf_0xd_0[0];

    ld_1 = cpuid_subleaf(c, 0xd, 1);
//                       |   |   └────────┐
//                       |   └─────────┐  |
//                       *             *  *
//  ld_1 =              &c.cpuid.leaf_0xd_1[0];

And for CPUID(0xd) subleaves 2 to n, we have:

    /*
     * "Dynamic" access
     */

    const struct leaf_0xd_n *ld;
    for (int i = XFEATURE_SSE; i < XFEATURE_MAX; i++) {
	ld = cpuid_subleaf_n(c, 0xd, i);
//                           |   |   └──────────┐
//                           |   └─────────┐    |
//                           *             *    *
//      ld =                &c.cpuid.leaf_0xd_n[i];
    }

Similarly, for CPUID(0x4) call sites we have:

    /*
     * "Dynamic" CPUID(0x4) subleaf access, 0 -> n
     */

    const struct leaf_0x4_n *l4;
    for (int i = 0; i < cpuid_subleaf_count(c, 0x4); i++) {

	l4 = cpuid_subleaf_n(c, 0x4, i);
//                           |   |   └──────────┐
//                           |   └─────────┐    |
//                           *             *    *
//      l4 =                &c.cpuid.leaf_0xd_n[i];
    }

So the root-cause of all these "static" vs. "dynamic" distinctions was to
catch call sites, at compile-time, when using the wrong CPUID storage
output type relative to the requested leaf/subleaf.

I'll get rid of this static/dynamic terminology and think of something
better.

(and an ACK for all the other snipped remarks.)

Thanks!

--
Ahmed S. Darwish
Linutronix GmbH
