Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D00397682
	for <x86-cpuid@lists.linux.dev>; Fri, 12 Jun 2026 20:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781296196; cv=none; b=L93C/tAkdPOYaHo1CQaLF4fVXkDpyl+anihHBcq/kEzSWdWlfeCWurftNeJRLgP00XVAqV2geQ3psjjPG3v8mErYyYeNM3mnkmL7dqzZF/Q9W2SEFjQmqYfSHd2f7MYcC3vERlS4I0QVE4A4lyN/cfbpaZzSPzS1XdCfqHAGrUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781296196; c=relaxed/simple;
	bh=BycU0RBtpk8VKl77/K41yrPXDbWPO4U4phAHWKKHwGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u1J7lUonAWIr8xZPu00yLNa1E7lp2GE9ELCeN6wVO/y/XVR7IRMQFUzqNJBNFIJHdVv0GTvyzvCVDMgcoj++efSQCnV3YOw3mdRUHnaJg45rRFI3MD2+z/9Bp/wMuqXDjDUc7MqrH39XEopjZiINw/AfGeadJ95N6HwDChZixpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=uWXikNWE; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NB1FSwCS; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="uWXikNWE";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NB1FSwCS"
Date: Fri, 12 Jun 2026 22:29:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781296194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8vwoz0igJWR54pTd381ZhwkNQzpYMtxCI2YrZQmxwNg=;
	b=uWXikNWEMeRvSsjfMNu891+W7zdRZGSKMyoQdbnaJUkJz39zPTbybdX7oq+dDsbQlNBC++
	ub0WE3t2xtxtImNhmfQ83jAla0lNkCirsG9sA6kJlnHGLdBjJbyDhE12TAaLTyVrazXrji
	P0W4ECeSqHzSsPsogPeNLMhu5T9JhupJTLitnkHzBcZ1WA5kfsIGOHASscAITxhu19b2Jy
	XxWZz7owCG6APVZIEzFCkX21HSkduBUqyhgk4AsYM27uOHPAxy9Qm1ZfFM18DWFGkKj9MN
	DyvGxmTkx1TB3V5pICq+YkfKm/b3squ146garaMCKoeJxEbcxbJneNYFtFkmww==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781296194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8vwoz0igJWR54pTd381ZhwkNQzpYMtxCI2YrZQmxwNg=;
	b=NB1FSwCSHRV66X4e8w6mQqURJoDkJLbbrf7uxAuH2ZMpoHm8KCcAKrz0SNDXBXaXWbPjUj
	gRnIixz01u/BlLAQ==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Christian Ludloff <ludloff@gmail.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 111/120] x86/percpu: Add offset argument to
 x86_this_cpu_test_bit()
Message-ID: <aixsQMqwRJ925zBi@lx-t490>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-112-darwi@linutronix.de>
 <ah3KEQIGMlJrWiVX@wieczorr-mobl1.localdomain>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah3KEQIGMlJrWiVX@wieczorr-mobl1.localdomain>

On Mon, 01 Jun 2026, Maciej Wieczor-Retman wrote:
>
> On 2026-05-28 at 17:39:13 +0200, Ahmed S. Darwish wrote:
> >
> > diff --git a/arch/x86/include/asm/cpufeature.h b/arch/x86/include/asm/cpufeature.h
> > index 520949560138..b12bde4986b5 100644
> > --- a/arch/x86/include/asm/cpufeature.h
> > +++ b/arch/x86/include/asm/cpufeature.h
> > @@ -56,7 +56,7 @@ extern const char * const x86_bug_flags[NBUGINTS*32];
> >
> >  #define this_cpu_has(bit)						\
> >  	(__builtin_constant_p(bit) && REQUIRED_MASK_BIT_SET(bit) ? 1 :	\
> > -	 x86_this_cpu_test_bit(bit, cpu_info.x86_capability))
> > +	 x86_this_cpu_test_bit(bit, cpu_info.x86_capability, 0))
>
> I think the same change needs to be applied in the same arch/um directory since
> it has a matching this_cpu_has() implementation and it uses x86's percpu.h.

arch/um/ has its own x86_capability[] implementation.

There are much higher priorities for this series than this.

Thanks!
Ahmed
