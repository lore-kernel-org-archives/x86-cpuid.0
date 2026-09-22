Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD2B55820E
	for <x86-cpuid@lists.linux.dev>; Tue, 22 Sep 2026 15:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790090676; cv=none; b=BqgDSlxd8l7r5g7JmOSYSf62MVZKEf8z1jer4KaKzNYaihDjFfBDG5WdCtfyO3MfF/Z9h6W8q/MozC4erPLpP5tsH+xbVYQ3lLYlB7vN/SbsLsDQDJ91xv7UNv4sd83kuoaMKw5hL6bydUmeyoq5cphyOnr6CEyj2by7G8bXb5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790090676; c=relaxed/simple;
	bh=OyXaGjZqn8qSmBy1AD4h/wsptjeLeNc8R7vTGyPvGpU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PY4dablxA3HrIpw7N/8r/CHHi+zGGwb/rhfm8ZR8aRUnusvsA7egzwH56QEeTi7GldEELo7yQW5snEfbmX6EWjEMgFr1shLa1a1dIFu9eV3cjSpY5qRhR2KzsWD2KQ7j/lapZZ4+ZGbfp1hCXY1+tQGnimqEZEnKz9XuB0lGcks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z1un93Y+; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z1un93Y+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790090674; x=1821626674;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=OyXaGjZqn8qSmBy1AD4h/wsptjeLeNc8R7vTGyPvGpU=;
  b=Z1un93Y+tm3ZTvGLqK3ed0Lg6Bn4+1s58dRys1xDf6LOzrEqVAfuYEFs
   S02bMyke4zfyfGz6U20JMQtnPrrNfI61j0mNSAZwr8vGx1JEv71G6/tzq
   +/navUgX4fYDxEJxFtcGb5NP9e2UKjbKZHbAM9NO3pqGUcrJdZ+j0hLPP
   XlqtXsA32qj+9v3OCgPJUre5DRRt6S6NoldDnu9ggFOraqPMSoKRqYLgq
   oZYHzsP2186ppy9HF4MBZR0yMwzG+b+adIFQEysW2UW/brEiA5y+QeHbb
   d8pjN7kA0KlhvBlNlfvdH/Gy46Sd1bQ510Kh/oSGFI0v47ssR92tIqX5X
   w==;
X-CSE-ConnectionGUID: PHuHG4R/Qf2WJD8PyvbHuQ==
X-CSE-MsgGUID: WrrFc3zZR8Cnr3MtyyeSkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="102056946"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="102056946"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 08:24:33 -0700
X-CSE-ConnectionGUID: 1WLGIF3dSNqKR0r1GeSRmw==
X-CSE-MsgGUID: xqZe3QZgSMiLZ14WZOpybQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="299436280"
Received: from sghuge-mobl2.amr.corp.intel.com (HELO [10.125.110.31]) ([10.125.110.31])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 08:24:32 -0700
Message-ID: <01a1d68b-a4e2-40e3-b3b8-c1046faa6c77@intel.com>
Date: Tue, 22 Sep 2026 08:24:32 -0700
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: x86 CPUID mutable return values
To: ludloff@gmail.com
Cc: Borislav Petkov <bp@alien8.de>, "Ahmed S. Darwish" <darwi@linutronix.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andrew Cooper <andrew.cooper3@citrix.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Sean Christopherson <seanjc@google.com>,
 David Woodhouse <dwmw2@infradead.org>, Peter Zijlstra
 <peterz@infradead.org>, Sohil Mehta <sohil.mehta@intel.com>,
 John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
 x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
References: <CAKSQd8V28WjMcsfh05P5SNfXXvtafBH6fyiyqMzQ9GtU8fQGSA@mail.gmail.com>
 <f133c35f-b013-4395-ad1f-53765114d4b9@intel.com>
 <CAKSQd8WqQdNDoEqM+PZNHg-yr_4VJTGYdV=bCbYfRDyR7kUjbg@mail.gmail.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <CAKSQd8WqQdNDoEqM+PZNHg-yr_4VJTGYdV=bCbYfRDyR7kUjbg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/22/26 01:43, Christian Ludloff wrote:
> On Mon, Sep 21, 2026 at 11:32 PM Dave Hansen <dave.hansen@intel.com> wrote:
>>
>> On 9/21/26 11:36, Christian Ludloff wrote:
>>> Q for Intel: is MSR FEATURE_CONFIG 0x13C bit 1 expected
>>> to affect CPUID 1.ECX.25 and 7.0.ECX.9 and 19.EBX.0/2, or
>>> just just a subset of them? Also, what about PCLMUL?
>>
>> Are you looking to document architecture or implementation here?
> 
> Just the reality of mutable CPUID return values.
> 
> Because it matters. When trying to cache them.

Of course.

I'm all for documenting this stuff. I wish it was more open. But I do
worry a bit that someone will read that, for example, "KL is immutable".
$CUSTOMER starts depending on it. Then, $CPU_VENDOR decides that was a
mistake and fixes it in a future implementation.

> Based on some experiments, I think that VAES
> does follow AES (i.e. is mutable as well), while
> KL and PCLMUL do not (i.e. are immutable) –
> so that's what I am seeking confirmation for.

Are you OK with just checking a recent implementation or do you need a
wider search of older implementations?

>> Honestly, FEATURE_CONFIG looks more like something that should have been in the BIOS writers' guide rather than the SDM.
> 
> I for one appreciate that the SDM attempts to
> provide a list of mutable CPUID return values
> and that it has the FEATURE_CONFIG MSR.
> 
> After all... the most recent public Intel BWG is
> more than 30 years old by now [aka P6 days],
> and https://en.wikipedia.org/wiki/Appendix_H
> was a thing that also happened back then.  :)
> 
> PS: Should Linux boot check/fix that LOCK?
I don't really feel a strong need to do it. I honestly don't know why
the lock bit is even there. I'd randomly _guess_ that Intel's
implementation was not certified for $THINGS and they got nervous and
asked to have a chicken bit exposed for it just so it couldn't
accidentally get used.

But, for Linux, the kernel doesn't currently munging the disable or lock
bits. If someone munges it with wrmsr(1), they get to keep the pieces
just like any old wrmsr(1) user. I'm struggling to think of a scenario
where being able to twiddle either of the bits could be useful to an
attacker.

So I'm not sure it's worth prodding, even if we think it's got a funny
value.
