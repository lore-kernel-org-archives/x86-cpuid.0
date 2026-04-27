Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB9E34EEF3
	for <x86-cpuid@lists.linux.dev>; Mon, 27 Apr 2026 19:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777318933; cv=none; b=chxjBBQ0bsiDJMIVOmFAhpenPxTNePLQq9lL2yZTJ6340hlxKprmGe0A4/Zb1VHA6oXAA8g6CIujSBPTcseZ4M/cWNB3YZftMbjzVf1/bNVtfg4r6gM689YljMLOCoXayt6hnd3TPWjdKoN1/chrothzeV4t0jYJiS9YPb0QCJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777318933; c=relaxed/simple;
	bh=p54wd5rrWX7Zm52sbsClKt9bYQPs97UdNMAMPxCX8CA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KFhw2bqIKw34u8uPYDceyqJ/IdedyTtWYbu0DddqfYgC5BDD0i97uUSphf9BT4SUxcQ8egn/dHyrukzrlXS5KAo1+5dOhlI+4JaiDVvgNQoXHZnn3itonvDk3c3eQTlgeNMiHOsAqXGq45VuBfp5Gk7qKqc/TIGrFafkrqXZaUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4ecB0+VB; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0SetCBsY; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4ecB0+VB";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0SetCBsY"
Date: Mon, 27 Apr 2026 21:42:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1777318930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lrZRpY/0lW6kDvEZwcksMutzk8H2IroKXLLMQ0ObS7E=;
	b=4ecB0+VBoLbUjThhkdrwXroUxWDsZ8i63d47G5PnN/MwtQmhMqkAqJ/K6DH8ZZUgfkBrMs
	lS89lH+fr3vkaAHMioU7PJKx1vb0lItHIp5zFgG1ON/nisEN/XR5sFYIOWSuJg3NSjuK6k
	o45NXvrXKSav8sYoEPyFY/CgIpwK022XWW+qGtnGXbDeEP9QEP48knA+1U3qjDdnp8cUFg
	5lR2/8A8OFGS1wyQeQfUx0Z3rZiVZVNtVqk3Mv3ZcE84q9nOkExf8a9GiV8i5fhVJwdHD7
	AoA3wGk/nK3/ATZPdzl8qbGEvEIGWtmrHWYhI167jiUp+wtJCD2Alrej0LIMmQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1777318930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lrZRpY/0lW6kDvEZwcksMutzk8H2IroKXLLMQ0ObS7E=;
	b=0SetCBsYIvo79/lut2jV8Xt3vZcIDSo+Z41VTbaVUtjxo32CVu30k3Fc1vrghIQBkkxqW3
	jpKafWeS+jMRK0Cg==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
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
Subject: Re: [PATCH v6 09/90] x86/cpuid: Introduce a centralized CPUID parser
Message-ID: <ae-8EOo1KScF1Qp8@lx-t490>
References: <20260327021645.555257-1-darwi@linutronix.de>
 <20260327021645.555257-10-darwi@linutronix.de>
 <ad8qK8M0IIJRnVOa@wieczorr-mobl1.localdomain>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad8qK8M0IIJRnVOa@wieczorr-mobl1.localdomain>

On Wed, 15 Apr 2026, Maciej Wieczor-Retman wrote:
>
> Also should cpuid_parser.c/.h be attached to some subsystem in
> MAINTAINERS? Not sure if it should or shouldn't but I noticed you added
> leaf_types.h before and was curious if not adding new files is
> intentional here.
>

IMHO, it should be maintained just like any other code within the x86 tree.

leaf_types.h is added to MAINTAINERS x86 CPUID database entry at the
previous patch so that I can catch anyone modifying it outside of
x86-cpuid-db.

>
> >
> ...
> >diff --git a/arch/x86/kernel/cpu/cpuid_parser.c b/arch/x86/kernel/cpu/cpuid_parser.c
> >new file mode 100644
> >index 000000000000..898b0c441431
> >--- /dev/null
> >+++ b/arch/x86/kernel/cpu/cpuid_parser.c
> ...
> >+static unsigned int cpuid_range_max_leaf(const struct cpuid_table *t, unsigned int range)
> >+{
> >+	const struct leaf_0x0_0 *l0 = __cpuid_table_subleaf(t, 0x0, 0);
> >+
> >+	switch (range) {
> >+	case CPUID_BASE_START:	return l0  ?  l0->max_std_leaf : 0;
> >+	default:		return 0;
> >+	}
> >+}
>
> Trailing statements should go on the next line, right?
>

By the end of this patch queue, this aligns well as a table:

	switch (range) {
	case CPUID_BASE_START:	return l0  ?  l0->max_std_leaf  : 0;
	case CPUID_EXT_START:	return el0 ? el0->max_ext_leaf  : 0;
	case CPUID_TMX_START:	return tl0 ? tl0->max_tra_leaf  : 0;
	case CPUID_CTR_START:	return cl0 ? cl0->max_cntr_leaf : 0;
	case CPUID_LNX_START:	return CPUID_LNX_END;
	default:		return 0;
	}

Thanks,
Ahmed
