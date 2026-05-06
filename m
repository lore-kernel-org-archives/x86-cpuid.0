Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A41309EE6
	for <x86-cpuid@lists.linux.dev>; Wed,  6 May 2026 20:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778100727; cv=none; b=lUH6R3ILvmucIOIIDYetSvzRWToemblRiuaV+NeC24Orvc0KREUPmrTH8iviempWMmzA+Nznpuwwd5/bXKPofI6GqYhP/Yh00svRz7VPeaMeQLGXlzUD2eVNt41j0BRX/P9eJinfeN1p+QIGmP7bo9Wujuf+T6OPo/EUdR3lvm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778100727; c=relaxed/simple;
	bh=hym5Wlgd+2XJMfUqaK9zDl9CsHFGVaEHtVnX6zZXPwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oCSUSF8IXEIbebjtQBCYg6OL3EHKUwSYuyKUYclkD/LorBCzrGBVJKBGlUpUlygQBiQjYXsqzSp+E/istTrOU51hR6M/hS0lG73quyxqj1SpocKf9ascTAMBTwqX8CRs5DtfyUeNRE8mJV/NPf/+92aiBDjM3em5NBwnQ+f0SOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=h+YZtQ51; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=K39hMgxH; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="h+YZtQ51";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="K39hMgxH"
Date: Wed, 6 May 2026 22:52:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1778100724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rKT0rW15oMoToxZWk463U5+8MdMTeGUUungeTu7bKtA=;
	b=h+YZtQ51TuBUVlsMew2yK/e4da6KLyXtw+Rc1Cl9MUQXA8IjZiqyFTggbHe/fIv049w3lL
	iQhkw6PpytWaPMBku5xmdlpPeSrKzzBs4HXxyIXZC5ZT7E6aJKLqSxVXqf80M90uJa+Pmp
	3YgOWhqn+RqVCBOaIEwc0UcwSON/N1hH7u8MdK6l2Y3GdzpgibZODDdnMAGgqhDAfevoUL
	1JVoTs7Q9ysfcXuryyj4lotx2vR+ThaGooP+eW8CeapdFuZbIo36/QyQnTCEPWhsxW9H+3
	k+hO2+03KfL/EiJtQuRd3zpy8NnQCSo9UJUEYeVOQ5Uj1StdV49FpKZtobOTHQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1778100724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rKT0rW15oMoToxZWk463U5+8MdMTeGUUungeTu7bKtA=;
	b=K39hMgxHbYtyLyHd9S3jEFoVBls/xpy6awHN03ZYCzkB8dxYNJ4HUSzS42rsSs/tZJPUT2
	pfw+3Om4CcP4qfAQ==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Sean Christopherson <seanjc@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Christian Ludloff <ludloff@gmail.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 00/90] x86: Introduce a centralized CPUID data model
Message-ID: <afup8Zf9cmmACdoh@lx-t490>
References: <20260327021645.555257-1-darwi@linutronix.de>
 <20260327152354.GBacahCioljpw5QqUc@fat_crate.local>
 <acrBBFyU_vi4zFOx@lx-t490>
 <20260330230836.GLacsCdDkVu0H3XU4l@fat_crate.local>
 <adz3z_MaWJr_GOtc@lx-t490>
 <ae-uw9836AJScRsq@lx-t490>
 <20260505133350.GAafnxvtgFxJHth8WB@fat_crate.local>
 <20260505151242.GDafoI6oOOs9hknrrK@fat_crate.local>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505151242.GDafoI6oOOs9hknrrK@fat_crate.local>

Hi Boris,

On Tue, 05 May 2026, Borislav Petkov wrote:
>
> Ok, talked it over with tglx - he brought up the argument that actually
> having those flags documented is good for other tools like crash, etc,
> where you want to consult a single db for *all* X86_FEATURE flags in the
> kernel - no matter how they're defined.
>
> So, what we will do is, we'll leave those leafs as is and not touch them.
>
> If we need to add new, solely synthetic bits, we'll add them where
> there's room, document them in the db and that's it. Synthetic bits will
> be add-only and the cpuid-db will collect them.
>
> This way you have a single source for all CPUID info.
>
> The scattered.c thing goes away because we have full CPUID leaf
> representation now.
>
> We only get purely synthetic new additions to the db and we can use the
> Lx namespace for that. I guess that's plenty of room for the foreseeable
> future.
>
> Makes sense?
>

Yes, I think so.

"scattered.c thing goes away" in the sense that:

    No new hardware-backed X86_FEATURE synthetic bit will ever be added to
    the kernel.  Now that a full CPUID table exists, the standard CPUID
    APIs should be used for such cases instead.

Thus, "We only get purely synthetic new additions to the db."

For the /current/ scattered feature bits, the array which maps them to
their hardware backing:

    static const struct cpuid_bit cpuid_bits[] = {
	{ X86_FEATURE_APERFMPERF,	CPUID_ECX,  0, 0x00000006, 0 },
	{ X86_FEATURE_EPB,		CPUID_ECX,  3, 0x00000006, 0 },
	{ ... },
    }

is needed.  The direct CPUID calls at scattered.c will just need to be
converted to their equivalent CPUID APIs though.

(I guess that's what you already meant, but I wanted to be sure.)

Thanks,
Ahmed
