Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04A4338586
	for <x86-cpuid@lists.linux.dev>; Mon, 26 Jan 2026 13:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769433258; cv=none; b=AIE6jxr2uKHzCGAJ7wS9iE1f3FrKB4LiTGshF2qINrQz2PdgZj0g2dT5ZPcZ6QT5f07S/5EMu0fOEbI3E6LUl/WRHduK4ac7FhlupebE4Z5xGGouXou3G2NBe4j6YmVKNF2JYr5eSCET+W74dgtVIdBNBSedRAt52zwUVZM2KLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769433258; c=relaxed/simple;
	bh=bdUAafXY3PHvlpajqBI4SdJYaC5G/mVLPRKPG0g6c4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qAKg2GOZN7CesiT+QlpDQ5l/n6jcnXWJ+PpMJHafJizhI2vruN96Fv/sjF996//X9ySBWeDCDfzz3i28wGnBlw5hEmEYYAeBw9QxjuRzUDqErBUqGYJ3rNYnLQZRWSaAr3kPgHekXv1yPrOdHn1hvT78bhnaggz+fU/xL2i5eX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=oeTP+8xK; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=h0RVX9HF; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="oeTP+8xK";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="h0RVX9HF"
Date: Mon, 26 Jan 2026 14:14:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1769433256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bcXxhJ5BEIGFwGCIzfTOX/Mm0FyU8IfiGEn5b0S4XuY=;
	b=oeTP+8xKj4KNrH6zaGXWG1o/Wnoi4BvQ2LzOBAYXmz1sIc/xaMIQVRqDsJIEhFTsSXbihU
	kMg0SenLV2Aj8IAbXIrNg96J+MtkKR/JDT2GtDWX1OpedKB2WL7URauF55A4rftDr+nKju
	TOdiiMMDYKbdUm/6RfjHWi6lmWmuFnSzA8FDwLeVxfjqhQ4kVLV+VtBF5BssPC6egSlJdS
	DUB3sFMiFdzAiq3E4Jr3R6DCKDQ5mEfAFwu/rUGj6OTC3OXgnl3orCw32mVxuZkJdhlw09
	/U/91tUDM0KJmoVmeppgVlgsAA05gs/9f5QUymMjrmDH9qTOZKhAsbAxMLzdyQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1769433256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bcXxhJ5BEIGFwGCIzfTOX/Mm0FyU8IfiGEn5b0S4XuY=;
	b=h0RVX9HF4VD7xIMl/KpnMUAW8sVe8lkfVFcA5ifEeTw5D7rcJz0gzj2dCA59dso/0KVaK/
	4VZajWWbYXJmaEAw==
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
Subject: Re: [PATCH v5 08/35] x86/cpuid: Introduce a centralized CPUID parser
Message-ID: <aXdopscvpd1_wnEx@lx-t490>
References: <20250905121515.192792-1-darwi@linutronix.de>
 <20250905121515.192792-9-darwi@linutronix.de>
 <20260121214559.GEaXFJF-EXVBvyMCtm@fat_crate.local>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121214559.GEaXFJF-EXVBvyMCtm@fat_crate.local>

On Wed, 21 Jan 2026, Borislav Petkov wrote:
>
> On Fri, Sep 05, 2025 at 02:14:48PM +0200, Ahmed S. Darwish wrote:
> > diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
> > index 34a054181c4d..43582d7e167d 100644
> > --- a/arch/x86/kernel/cpu/common.c
> > +++ b/arch/x86/kernel/cpu/common.c
> > @@ -1729,6 +1729,7 @@ static void __init early_identify_cpu(struct cpuinfo_x86 *c)
> >
> >  	/* cyrix could have cpuid enabled via c_identify()*/
> >  	if (cpuid_feature()) {
> > +		cpuid_parser_scan_cpu(c);
>
> Or simply
>
> cpu_parse_cpuid()
>
> :-)
>
> Plain and simple.

Haha, ACK.

I'll just shuffle that to cpuid_parse_cpu(), to keep the now-standardized
cpuid prefix for all CPUID APIs:

  https://lore.kernel.org/lkml/20250508150240.172915-1-darwi@linutronix.de
  https://lore.kernel.org/lkml/20250515202143.34448-1-darwi@linutronix.de

Thanks!
Ahmed
