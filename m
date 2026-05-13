Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EB538C402
	for <x86-cpuid@lists.linux.dev>; Wed, 13 May 2026 15:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778687838; cv=none; b=ARFNh9HKn4llcNyUCdw6w0qx+5OPHeyfLdwcNU3q/pRl/PLL7L2WruiB1hgBHLa4d0MNhtnJNean06BsNqOC7STZ8LxUW50tz4/UieSvR06VUc3hiZNLLCJavD3wgiR/1XphfZ5WZr0bxdMe7b4HEUwvxiP76aEmMTIpRc6IC6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778687838; c=relaxed/simple;
	bh=XOZg0sL5WkvZJENJML/9hNddigE+4kQvRoo7TondOfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G5FR8eft+HYtwJSEhImv1qMBWG7/GiaWIU3cjOod7HraiYgj8A4sDPNcTHS4tz+V0CdVnlGeQJBJ1GXnJ/GUBgnotouaVqll1Ob+kASa05eKQezJ1tW+HD9RdhXj84D38gvgZZYovRbwUnHDtZJKjnCtDkMU5Znr5d8xAUlQBGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ra/gRrb7; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=R4IrsEpu; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ra/gRrb7";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="R4IrsEpu"
Date: Wed, 13 May 2026 17:57:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1778687835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/mf9QVjnqnN0dqc8rQZ7VkO320qAzu9IOZ2SB6/GJAo=;
	b=ra/gRrb7ZhUtUzlO3kdrDhrfCNpHWSLSowNxjxQtRzA3X9SkT+cXWv6zXrLNG6+hunFJRi
	EPz18DB2OKG433p/V27081cyu6t1QE8ie/jcDJ6h/rFaf2SETPtbVSMl5k0J/VbnlAbf+C
	aucMMvb66PQSjG+MBW+9w78TJEp61mu8DqyHaEEe/4Yb6ZLbjv3oGsM7WmMuL3SXMGe47d
	5Jka8fQswqneNBpFGSu8N5AH8yNA1ekpXRxcSQdf7StwiO0lssKnWM1GmyJ7l7EKo+ftdu
	zmrucxuej9sfVr78ramWmAhFajFvaXPVN2IkKpP1hHjNiWOEAuGtgCIh8HldSw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1778687835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/mf9QVjnqnN0dqc8rQZ7VkO320qAzu9IOZ2SB6/GJAo=;
	b=R4IrsEpusvaLA+jvgKy/CnGmWNrdHfBNYdgEBJOSIJ1q+ySppHpVwHESjOPZJwu6YzG0ol
	K68eGB9f+4KZ8PBA==
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
Subject: Re: [PATCH v6 10/90] x86/cpu: Rescan CPUID table after disabling PSN
Message-ID: <agSfWTxs9pRPHJxl@lx-t490>
References: <20260327021645.555257-1-darwi@linutronix.de>
 <20260327021645.555257-11-darwi@linutronix.de>
 <20260511200032.GAagI1YMP51EzCo7dn@fat_crate.local>
 <agLS2Y7smYRHyiHf@lx-t490>
 <20260512143412.GDagM6ZLBpvt6X3jzq@fat_crate.local>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512143412.GDagM6ZLBpvt6X3jzq@fat_crate.local>

On Tue, 12 May 2026, Borislav Petkov wrote:
>
> On Tue, May 12, 2026 at 09:12:25AM +0200, Ahmed S. Darwish wrote:
> > So the min_t()'s intent is just to be defensive against hardware surprises.
>
> But when you read l0->max_std_leaf, you always get the current, highest base
> level. So there's nothing to protect against.
>
> Or am I missing something?
>

So, let's imagine the following cases of cached CPUID tables.  The changes
to the new max CPUID are due to MSR writes.

* First case:

           leaf 0x0
	   leaf 0x1
	   leaf 0x2     <- Old max CPUID
	   leaf 0x3
	   leaf 0x4
	   leaf 0x5
	   leaf 0x6
	   leaf 0x7
	   leaf 0x9     <- *New* max CPUID

=> Here, the parser code needs to leave CPUID(0x0) and CPUID(0x1) untouched.

That's especially true since CPUID(0x1) holds the backing for some
X86_FEATURE words, other flags might be force set or unset, etc.  So we
don't need to touch that not to corrupt the state of force-enabled or
disabled X86_FEATURE bits.

(Then, it needs to fill the table entries for CPUID(0x3) to CPUID(0x9), but
that's obvious.)

This is accomplished the logic:

	rescan_from = min_t(int, l0->max_std_leaf, c->cpuid_level) + 1;
	cpuid_refresh_range(c, rescan_from, CPUID_BASE_END);

Since it will only begin filling things from CPUID(0x3).

* Second case:

           leaf 0x0
	   leaf 0x1
	   leaf 0x2     <- *New* max CPUID
	   leaf 0x3
	   leaf 0x4	<- Old max CPUID

=> Here, the parser will need to zero CPUID(0x3) and CPUID(0x4) entries.

This is because the CPUID API query macros at <asm/cpuid/api.h> know the
validity of each entry through its nr_entries flag:

struct leaf_parse_info {
	unsigned int		nr_entries;
};

And without the zeroing of entries, the CPUID API will return invalid and
stale values for CPUID(0x3) and CPUID(0x4), instead of returning the right
value: NULL.

This is accomplished the logic:

	rescan_from = min_t(int, l0->max_std_leaf, c->cpuid_level) + 1;
	cpuid_refresh_range(c, rescan_from, CPUID_BASE_END);

Since it will zero CPUID(0x3) and CPUID(0x4), as it is part of the
cpuid_refresh_range() logic.

And that's what I meant that the min_t() logic handles hardware surprises:
it continues to work, regardless if the new max CPUID is higher or lower
after the MSR write.

I guess I should've put this min_t() logic in its own cpuid_parser.c
function, with proper comments about this.  There were only two cases for
it, this patch and patch 13/90, but two call sites are enough for a parser
API function.

Thanks,
Ahmed
