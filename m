Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20F7386556
	for <x86-cpuid@lists.linux.dev>; Wed, 13 May 2026 16:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778689540; cv=none; b=GKi4ykj21nIBhZF0iZplRQLrLgyjNv1QxMQ7qfCBPJbFPSflOlW68f5p/LEUPS9wXf54OcIh6ugKne8ZWQeGgngY0k67suu08oAjfbWTJakiRLKW9fgRgEwBkUPLqOAkPoBvqqmwFr92UTg+Go1+XAyQUMsauku3DWSmgOhi77I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778689540; c=relaxed/simple;
	bh=SEbe5Il1E6o0VbMbj3vCmobMcBxn9VhtPyLETZ+3gr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RjG5P8rpQkLi7gm5CVtvKkldcMEqPyTNMQXJtx1GcODxVke01r980rrWpDLZ8ceLmXBfnfpynlNC1Qbzi++YhbszWI1QfKRQZtZRA6uLWRiJLI6sAiMpuhjAb347IMbRTRLQBWzkb2Krl05SqxZOSJqPSxEE1bXMOADUCb8DnE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=q+028GTC; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=eNryF54P; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="q+028GTC";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="eNryF54P"
Date: Wed, 13 May 2026 18:25:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1778689538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RXd/6RcUxriT9T6brJSpW0Seajugdu6IKsNv1f9yLRA=;
	b=q+028GTChlA449NTt+UkVWLbqYGJo7TIp29EJ1pP/zyHi7t8Ca+obkrNXoHmRLzU3cco7G
	0nMpwl7AXZ7mHQ8YiDnuRuGfMt4RhG2MhZVe18p/UgcEtWc2GnbiNFoITZx2QyTheDH3t1
	pyBWVRwKsfDMv8+P33pISxiULsPuMQUrmcFsObV6dWZutHO4xj3R1GvuV5En3K7ATRA2QM
	PgZicQtWS7WTbsSrnl40HVmpBz6BIRcZQhVji7xbkjxn1vhdWfuaEmfyIPd2LLDuyT5xo0
	A2Pvet6LdgMpnnZYw0eNIUtNyWFmlrqoZLu9CLjkV+Bzfl8zBZ7u/OzHPAOycQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1778689538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RXd/6RcUxriT9T6brJSpW0Seajugdu6IKsNv1f9yLRA=;
	b=eNryF54PankOZo74PeSYUkpj5BzL3eOA5b6hz9N4cPDYI318XCb8tPOG/pw+7hc9RaqxQU
	d7xWrXbP12xXaBAQ==
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
Message-ID: <agSmABP0Ljk0t8Vv@lx-t490>
References: <20260327021645.555257-1-darwi@linutronix.de>
 <20260327021645.555257-11-darwi@linutronix.de>
 <20260511200032.GAagI1YMP51EzCo7dn@fat_crate.local>
 <agLS2Y7smYRHyiHf@lx-t490>
 <20260512143412.GDagM6ZLBpvt6X3jzq@fat_crate.local>
 <agSfWTxs9pRPHJxl@lx-t490>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agSfWTxs9pRPHJxl@lx-t490>

For completeness:

On Wed, 13 May 2026, Ahmed S. Darwish wrote:
>
> * First case:
>
>          leaf 0x0
> 	   leaf 0x1
> 	   leaf 0x2     <- Old max CPUID
> 	   leaf 0x3
> 	   leaf 0x4
> 	   leaf 0x5
> 	   leaf 0x6
> 	   leaf 0x7
> 	   leaf 0x9     <- *New* max CPUID
>
> => Here, the parser code needs to leave CPUID(0x0) and CPUID(0x1) untouched.
>
> That's especially true since CPUID(0x1) holds the backing for some
> X86_FEATURE words, other flags might be force set or unset, etc.  So we
> don't need to touch that not to corrupt the state of force-enabled or
> disabled X86_FEATURE bits.
>
> (Then, it needs to fill the table entries for CPUID(0x3) to CPUID(0x9), but
> that's obvious.)
>
...
>
> * Second case:
>
>          leaf 0x0
> 	   leaf 0x1
> 	   leaf 0x2     <- *New* max CPUID
> 	   leaf 0x3
> 	   leaf 0x4	<- Old max CPUID
>
> => Here, the parser will need to zero CPUID(0x3) and CPUID(0x4) entries.
>
> This is because the CPUID API query macros at <asm/cpuid/api.h> know the
> validity of each entry through its nr_entries flag:
>
> struct leaf_parse_info {
> 	unsigned int		nr_entries;
> };
>
> And without the zeroing of entries, the CPUID API will return invalid and
> stale values for CPUID(0x3) and CPUID(0x4), instead of returning the right
> value: NULL.
>

And similar to the first case, it will also need to keep the previously
cached CPUID(0x1) values intact, not to corrupt any previously force-set or
force-unset bits.

Thanks,
Ahmed
