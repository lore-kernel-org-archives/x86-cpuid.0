Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA41533ADB0
	for <x86-cpuid@lists.linux.dev>; Thu, 18 Jun 2026 19:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781809914; cv=none; b=Sl1EK8w7YfA0WZ5h+wV839h1drEBvv3DZVrdYTDVxHBK4PCICre/+jhMTx2uxjUEKYficHsaiPcIcE3R9uTPHUq2LwkKWex2ISgb23krO2k8SrCsABWuGchniPJHo59X3hvMXBrhRYsQIXixW5c5faMfCxaHHC7FJROOQqAGUhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781809914; c=relaxed/simple;
	bh=8FE7BpsS3zlZwfySKDpraM93EfU9bcm3YfzGr1qFzdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k+gmu+NCkyRpLNlI0o3/4KTSmWu1YNycEForEHLIVhCg1uXl24w8vovwHJBchOdMPVQSP3Sa8nJYimclQxAIpss9fh6zFrz96ZMcekg1YAz+C60isTCoRj0iJcqDZ+ecQxUzukCJkyM/2e6xwtBJ0l3CgSuY83QEW2nknyRqpKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=phuMupQr; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BxK0npX+; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="phuMupQr";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BxK0npX+"
Date: Thu, 18 Jun 2026 21:11:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781809910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gO4jFfM3m/R5wT6CCczefvs0Ls71Gi/SIsQoOVcsW/Q=;
	b=phuMupQrt2U3Ohl8tJevd5mFF6zJKSTq91oQa2LM+XMTwIOKpGyrL8qok6HZqAp8Phyvno
	stfMJegkblQDJ5TvZnLzQ0Uoztq3JVi1jor7vEZBwrEHcWyiIwWrAw8bB5QFr6Lhf9Tvy/
	eSuItgD/UcKb63MbyBMyKOhfjbl4Tf6hVo2cBBqh3BFZJ6FvYnkdEk6iasy4EN60pIQlF4
	8JnlxUxbDdTtU3vWi+fY9PHrnEIihdn+OOmD0Jyd/773RNtVX9K4WA8a5ZmitlIftjPiWd
	bX4QZt3MLsT6GdUt9RDf3jCQXBINbytNHlxhrGFiNwxKoy7Juu8mEEQzBjYL8g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781809910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gO4jFfM3m/R5wT6CCczefvs0Ls71Gi/SIsQoOVcsW/Q=;
	b=BxK0npX+QFfWHY+t2iavdO4xtkxwjlxzribbbwkYM6p6D/Demc4AqaKaleELeuOlAz7mC6
	i+9hJyh7bmL8/JCQ==
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
Subject: Re: [PATCH v7 017/120] x86/cpuid: Introduce a parser debugfs
 interface
Message-ID: <ajRC9NqMyEtxSj2X@lx-t490>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-18-darwi@linutronix.de>
 <20260617044123.GBajIlc_E_bvkArzS4@fat_crate.local>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617044123.GBajIlc_E_bvkArzS4@fat_crate.local>

On Tue, 16 Jun 2026, Borislav Petkov wrote:
>
> Except that debugfs *can* become an ABI if something ends up using it,
> despite all of my WTFs recently.
>
> So I think this patch belongs out-of-tree, to be applied only when we
> want to dump stuff but not have it in-tree casually...
>

This shall help with tricky future bug reports to ensure that all the
tables are in a sane state.  This is especially true for cases where the
tables need a refresh but they were not refreshed for one reason or
another.  Maciej just reported a case like that at the late part of the
patch queue thanks to this.

Can we at least keep this under a kconfig option that defaults to N?

If still no, what would be a good place to keep this patch?

--
Thanks,
Ahmed
