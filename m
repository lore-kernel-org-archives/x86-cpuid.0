Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEC448C413
	for <x86-cpuid@lists.linux.dev>; Wed, 13 May 2026 16:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778688402; cv=none; b=HbWPNtBu0RzXSd31umaag8CF7DtjPq24y2BOO3G8qHr5T7pJ6l1UOc6WHurT+f8J7ViRo00jsFlk3BeWUoZBgwdrSWExjTwgry8kESJu3SKgQ7SBP5895hprUugcrBqnDb9TJPWPPnTHeefD9YY3UJRUMCJaGPBVepciMbuVy/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778688402; c=relaxed/simple;
	bh=GQau8fZn962+7Zt3kK1o7ugqe0g8feNHf4io0bCCQi8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PQK7v1+JXkhhR/F9A2h1NH19kVf7oKFUZk5T+pfvG7Q/FoiDkx8f4L5kctZFskha2Sbk8J2RGe1kx2ODwugnRVql7yHg/JT4IhBofr/u4cBz6pPHd2+laemp0oYDXznEzmcov1bgGSapLv5W5PtrgGYmWX5F5Kfm4+uQGejybUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VjhY0Xso; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PY0TEOO9; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VjhY0Xso";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PY0TEOO9"
Date: Wed, 13 May 2026 18:06:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1778688399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fzU/dTj/PpuEgUN/iv3WYPAWoMk1YDHC51lH82ZvdB0=;
	b=VjhY0Xsoeg/ghzAIzPY2wVN4glngvZQdAhmE9PEVg3J337pjk0PkbLYiABI5nKwI6BEAsG
	MJ0ng9RdqA0lWzUnmg//oYmS64YrHs55BT4qi0Yx8PHCgXct5JH+hlnZMbOCQXHe4Clzj6
	iwu2B7MkCeXbBpajbXKsUQWps8DdlabuE10MDcCUg2aKpOUqBN3aJsRmYU45WtMtNc8hZz
	q7zMLTFBHo38M+S6kwP/1vzx2MbSTWFw73L+7pGcVSlQ5TDwMKCFGRfpRDkJd6ujGjk2fX
	AS8GKzWDzyhl69Hmue3Jre1tz68npm2IP9vW6rYX0JrsCmP7TyWu10YWgmjBGQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1778688399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fzU/dTj/PpuEgUN/iv3WYPAWoMk1YDHC51lH82ZvdB0=;
	b=PY0TEOO9+U4kNWS9o4MFljPz6ZxZBkccrv8CjQ7P6gfcPflR2jmLJ1auPbcMp+5PxDK/RP
	Tukq5jqF602LZRCQ==
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
Message-ID: <agShjbCo_HSs9YOf@lx-t490>
References: <20260327021645.555257-1-darwi@linutronix.de>
 <20260327021645.555257-11-darwi@linutronix.de>
 <20260511200032.GAagI1YMP51EzCo7dn@fat_crate.local>
 <agLS2Y7smYRHyiHf@lx-t490>
 <20260512143412.GDagM6ZLBpvt6X3jzq@fat_crate.local>
 <20260513152742.GDagSYbheCBWwNeVj-@fat_crate.local>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513152742.GDagSYbheCBWwNeVj-@fat_crate.local>

On Wed, 13 May 2026, Borislav Petkov wrote:
>
> index 01b64d04eb3b..c51cdcad7875 100644
> --- a/arch/x86/kernel/cpu/common.c
> +++ b/arch/x86/kernel/cpu/common.c
...
>  	clear_cpu_cap(c, X86_FEATURE_PN);
...
>
> -	rescan_from = min_t(int, l0->max_std_leaf, c->cpuid_level) + 1;
> -	cpuid_refresh_range(c, rescan_from, CPUID_BASE_END);
>  	c->cpuid_level = l0->max_std_leaf;
> +
> +	/* Rescan from the whole range. */
> +	cpuid_refresh_range(c, 0, CPUID_BASE_END);
>  }
>

That will break the clear_cpu_cap() just some few lines above it.  That is,
it will reset all feature flags force set or unset by the kernel.

I'm sending another patch queue iteration shortly that have a new API
function abstracting this min_t() logic in its own parser function, along
with better documentation:

    https://lkml.kernel.org/agSfWTxs9pRPHJxl@lx-t490/

The few CPUID patches now merged at tip:x86/cpu will also be in that patch
queue so that everything applies cleanly over -rc3.

Sounds good?

Thanks!
Ahmed
