Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39633CE4A9
	for <x86-cpuid@lists.linux.dev>; Mon, 13 Apr 2026 14:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776091116; cv=none; b=O1Ao9KDhAURT8z2fQOUVTgtPghbDysm/QiQUCOwz9Qj09LzXroKZ+IJEmj3ohy8AfZiLxfbq34pvLnObY13WD94lU/7P7hlgjeU0fsiWRONRwvjQY6E0F79iJySQ3+In7ivSt8+UBA0xBwh/WNFwwtMb5H1hSEQYkwyWGIgeLMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776091116; c=relaxed/simple;
	bh=eA81z93bj04vsEWs+MvN6yFwndktGFxlLgusCmAzjas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z9DA/wYCClg2JcVfy5zwU2dyez+H2tpfAd9z6uhQLKL72BJW5oNxaTZcQuTC042cvWMtvk+mN9bb6tyzsd18fomjNuJzrD02GaX57hk/slLTCizATnbHpsX0M0uUdZ8AxrJdVFJn1eL6NiBbuBF9sgeXFEI4CYGYKQ1rsKpSP8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zX3FufTH; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qrr9vnOe; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zX3FufTH";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qrr9vnOe"
Date: Mon, 13 Apr 2026 16:38:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1776091113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eA81z93bj04vsEWs+MvN6yFwndktGFxlLgusCmAzjas=;
	b=zX3FufTHQBiJlNRTWGwgkzbVUfxWpcU9nWsHOq1G5pl3lSaQqpSS1XCcsYfJef4nmYhQMA
	EnYVygmx94x9t4yHCZ0DUgy/eK3TVO8WqCLib5TkKa/GyxqGjZeRnI13aNm8Yxj44gx1ZW
	V91NdqZfdwnWuEKp2mdLaY7WmTE33ZX+eVd7fo6D+JIm5Gt018/Gc+zR77nhvYd3LuvALa
	f3imY6zS2WBzYbdt0v7O+QyFb0Dm+BIZnHnLhjJjujTUHw5wt8nE/s7mGce5sAJMn3U7TG
	ganb9lDFJQ88FPNGBP6vNEtmxfyOdYm/TCGpMQRtrC1sUwp1jKIbFAGJII/QCQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1776091113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eA81z93bj04vsEWs+MvN6yFwndktGFxlLgusCmAzjas=;
	b=qrr9vnOev782+Ou7BCA+ZiupbmGKyindZSLPu5iqsv9Hy24PV6brjJu2IGVP3jqS6E/G7B
	l+VgvCD6La23PTDw==
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
Subject: Re: [PATCH v6 00/90] x86: Introduce a centralized CPUID data model
Message-ID: <adz_584vlKivaECq@lx-t490>
References: <20260327021645.555257-1-darwi@linutronix.de>
 <adTWx9JxGt2hUpC-@wieczorr-mobl1.localdomain>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adTWx9JxGt2hUpC-@wieczorr-mobl1.localdomain>

Hi Maciej,

On Tue, 07 Apr 2026, Maciej Wieczor-Retman wrote:
>
> Hi, very cool rework! So far I didn't notice any problems while testing.
>

Thanks a lot for testing!

I will appreciate then adding a Tested-by tag on v7, where the interesting
bits will hopefully start to get merged.

>
> Buy anyway I wanted to ask if you thought about including the cpuid_deps[] or
> cpuid_dependent_features[] into the new cpuid API ecosystem?
>
> Or if not (since this patchset is quite long already :b ), then do you have any
> idea where best it could fit in? During discussion on [1] you mentioned the
> feature depenedency should be encoded in x86-cpuid-db. I assume you meant it
> would need to be first patched into there, then parsed by Kconfig?
>
> [1] https://lore.kernel.org/all/acruJf-pyld-fTh1@lx-t490/
>

Sorry, I'm just back from Easter vacations; that's why I didn't answer your
question in that other thread.

x86-cpuid-db will encode all the feature dependencies in its XML database.
Then it can generate all the necessary dependency structures, in a way that
is easy to parse for all kernel phases; including the kconfig build phase.

Then, what you want to do can be cleanly added on top.

P.S. I'm already removing <asm/cpufeatures.h> in the next iteration, along
with its ugly "/proc/cpuinfo names inside multi-line C comments" hack.

Kind regards,
Ahmed
