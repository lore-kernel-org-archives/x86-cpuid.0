Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC62340293
	for <x86-cpuid@lists.linux.dev>; Fri, 12 Jun 2026 20:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781295009; cv=none; b=NUHA1EqCZQXszZzReyoLtWIpbZNVsJWR6yk3c7U3xDegznhmqDYo4bbvd/plsWcPpFa7rv99T64P8JEXtVPIx6TCU02RAKQZCsR2DeA2twz0Zffhw0rQwdXaZSY72uKGKnWbdRw2IgbA7JK0Jbibzx7lLXpODbZ4RmtgnYx+eHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781295009; c=relaxed/simple;
	bh=JtQnotaPGrZwrmt+D3eKi+Jn8qhXZiblAq6n3foiVW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LjOXRtTkP9iLoKt9Q+DHVxcUFC8WIsGoa47VHGr0iH32c9AtV4u39v2M6z+ukxWjCtFGjNXPZlwRK904hWHx0Dz39bgza1OlIlGPldljyv5yQXErli3Xw0SDtzPYlCiAdLTDI4SjTLLTd6NwctWakfCV/QRltxmp256jnOnBo5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pclUs9D/; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=rJoBCL9Q; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pclUs9D/";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rJoBCL9Q"
Date: Fri, 12 Jun 2026 22:10:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781295006;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lGog9KAoeWioIZSuVg5eYTxLAIf+8N7BA1kkjvaCY1M=;
	b=pclUs9D/Ms52mfNNZEHnWbJalQE+jndyCvrVlmVafMS7jB0tKAU1pA9o53UOezI708MhmK
	FEaT3RkJdU9yjL5aL5m99Gr9ykRe1Wfvpj4tyqEyYe3qqAYgDddj/W4CHDsDaBC0S2tSPj
	VzHUXOzy3Ersz6z00XLdmq1Pe5TbrVN98rvpx9mDaINYNPekYE45yJasJfjH0PT1gBh+oT
	46kh4tvM9gCb1OvUxIAOPm/Z1uykUk107iVX7+1OTarvJMj2fuDEqwvHp/J3oGBQ1s77C4
	dPLgbQpqjzGC6t3Z5LIXgoWmzKYs7sNAfN20pT2vSUwj/67SlUhsqMNDjjt72Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781295006;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lGog9KAoeWioIZSuVg5eYTxLAIf+8N7BA1kkjvaCY1M=;
	b=rJoBCL9QvYMNA4UFf1RJ/bjub3pnvFIdC4VepgLMZWbGqlN0/CUR7g8gTUy9XsAKye54lD
	NeOBdVJeK5bIaqBw==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: David Laight <david.laight.linux@gmail.com>
Cc: Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Christian Ludloff <ludloff@gmail.com>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 015/120] x86/cpu: Use parsed CPUID(0x80000002) to
 CPUID(0x80000004)
Message-ID: <aixnnLmThoPqkbyb@lx-t490>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-16-darwi@linutronix.de>
 <20260611103727.04329c2a@pumpkin>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611103727.04329c2a@pumpkin>

On Thu, 11 Jun 2026, David Laight wrote:
>
> "Ahmed S. Darwish" <darwi@linutronix.de> wrote:
> >
> > -	v = (unsigned int *)c->x86_model_id;
> > -	cpuid(0x80000002, &v[0], &v[1], &v[2], &v[3]);
> > -	cpuid(0x80000003, &v[4], &v[5], &v[6], &v[7]);
> > -	cpuid(0x80000004, &v[8], &v[9], &v[10], &v[11]);
> > +	*(struct leaf_0x80000002_0 *)&c->x86_model_id[0]  = *l2;
> > +	*(struct leaf_0x80000003_0 *)&c->x86_model_id[16] = *l3;
> > +	*(struct leaf_0x80000004_0 *)&c->x86_model_id[32] = *l4;
>
> Those assignment are nasty.
> You could probably use an anon union to do:
> 	c->x86_model_id_leaf_2 = *l2;
>

I appreciate the feedback, but I'm not gonna modify a central data
structure like 'cpuinfo_x86' for the sake of this single call site.

A memcpy() can make things look nicer, but IMHO there are more important
things to do at this stage.

All the best,
Ahmed
