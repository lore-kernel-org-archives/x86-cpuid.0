Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F39A282F25
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 17:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779989613; cv=none; b=AAWOKefLn9NuHGbv2iGAxTM/4XooY5Hz0OjIk9O3Jpv5mQoyxzT8lZdbH7LunUigXCug5r06PoPXCfBNNyQF+EhCJI0866SQWX64R7KLnFOCew7ugSZm2hmptJDSFGRYXrLRiO6UfgHSlK80toJ7pM0COq4GVVa4XtWGNuF+SWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779989613; c=relaxed/simple;
	bh=tE0aOBXWw/7Q5cTW3JRKkZMNi0hw3S9G+yHYuNnR8RE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GMikFHOOVunmgGM/lifdjJyKBGRn+d7mKMFaQzr3crbEU0iyf1q/uaRuL+d0u4Hkxq9vJs8Amk3vINf4j9lyAVmMD/E6CCGJzCNipueyS1r1xY6+iacptFdreUbqX8x3p2AskHdb8NOMzlMQ0gWYbidntS4HE9JWMDJNd4uslzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RrYjriWr; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0sw8e5Oy; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="RrYjriWr";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0sw8e5Oy"
Date: Thu, 28 May 2026 19:33:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779989610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Omn+PrUcsCrWvW7zOVaMVoDOdm0Ff+BAqbQpB+B9NI8=;
	b=RrYjriWrEjHp/PFbxTQDorJDzY3hxklB+mgUFBXP7y0iBjgjNVLIWOUKmPL2y82Dp7yjIm
	/RWqO/5QO9mHireLBLPvyaA1kyPtHC4dQ1L0BQ4TNbxwuPteyr+D+x5KzdhCVx042Uc0ib
	mdnRePbd+Fr0IgJuWjhVU4ZGTbwjgldQ7MdHG2KVa2+YeNcUZQMUag9XFCjr3gTjjVGarb
	jevM6Z3e8aRLvexMujE8ubjxK3TUYffoFT8VBfFTpcVgBvilws9eiDXcpdGq03GRMiKc3I
	gMPAWYSU5G2PhF6/865G83MvMkiY0YycPOM+cxmY691oYvcBKloU/AfFKTNTyQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779989610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Omn+PrUcsCrWvW7zOVaMVoDOdm0Ff+BAqbQpB+B9NI8=;
	b=0sw8e5Oy5uAv+m8vhvZ4rc6OJOBincOOxjkk14zbaYGo+rZQYvMrmXH5mHRKJtcH5E7CuO
	FbGaKVP+QUFYRaBg==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Christian Ludloff <ludloff@gmail.com>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 007/120] x86/cpu: centaur/zhaoxin: Rescan
 CPUID(0xc0000001) after MSR writes
Message-ID: <ahh8aBYqA2i0PFv8@lx-t490>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-8-darwi@linutronix.de>
 <20260528164945.GCahhyKYNsDo3upTKT@fat_crate.local>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528164945.GCahhyKYNsDo3upTKT@fat_crate.local>

On Thu, 28 May 2026, Borislav Petkov wrote:
>
> On Thu, May 28, 2026 at 05:37:29PM +0200, Ahmed S. Darwish wrote:
> > Force-enabling Centaur/Zhaoxin CPU features through MSR writes leads to
> > the CPUID(0xc0000001) EDX feature flags getting changed.
> >
> > Rescan CPUID(0xc0000001) in that case.
>
> Where is the new pass - cpuid_scan_cpu() or so - scan that leaf so that
> you need to rescan it here?
>

Hmmm, at centar.c there is:

  init_centaur() || early_init_centaur()
    init_c3()
      CPUID(0xc0000001) refresh

And inside common.c early_identify_cpu(), the CPUID parser is initialized
before both the ->c_early_init() and the ->c_init() hooks are called.

I agree that it is a bit confusing to have this before the code which
parses CPUID(0xc0000001).

The idea was to have these refresh hooks in place so that by the time
CPUID(0xc0000001) is parsed, everything is correct without an invalid
intermediate state.

I guess I could've merged it with:

    20	x86/cpuid: Parse Transmeta and Centaur extended ranges

But that one was already too big for that.

This is your concern, right?  If so, I can move the refresh there.

Thanks,
Ahmed
