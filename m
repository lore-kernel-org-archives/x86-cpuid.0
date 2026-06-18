Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D63244667
	for <x86-cpuid@lists.linux.dev>; Thu, 18 Jun 2026 19:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781811513; cv=none; b=K4LSv1ItIaSswN3OK2azuqP3yjOPFQmROOt0hnjsAzZcI+2ocjWWVNdHzSqTP99fFGoWhZC7Lnk7tAHyU36JsYeMMAp3hPE8RlBdIqoOAvyFtRKprE22YBol31iY8eFEmDfQiyjz9XDI1PdObx1MbBVla9J1mlmqLRXrK/5mVcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781811513; c=relaxed/simple;
	bh=T2GrImygsCwGcmU3eEeq0uGX3Twiq0kJ2F8luYYmjfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bll+0vhPREavf/E4cy8fmBFJl7hFnYClnz+aY/frndzGhbWZ7myq4sFZ+bMqpGIOJzIOjTvkgx05RkOGQmmTVT/c+HNKSYHvsp43PxJSVgRxHFawQuQMQNuklTRvi67a0H7HkmQ6BH19eWkYPSoSeMk9LzUJdTHxvOdrcVeyphw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=AUG8FtBh; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cLSzyWep; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="AUG8FtBh";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cLSzyWep"
Date: Thu, 18 Jun 2026 21:38:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781811511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DlydCbhltfwfsa330lHUd+KjXMsVVdjxH4/MWnXAm0Q=;
	b=AUG8FtBhUGy+FjaP6Du7YOG6G0mBCeJhqxvrqQ3PqXSR2wzpsg+zNc5Kjp7hYOkPmd+4yY
	8OlIIpQw2M3BDMEOnQEmHfoIPGRTZZw/ePK3+RkluBQzktfH0PntGMMeOW56/lZJjXPMws
	5MOeUZSYOCq2hFict3O0Fknh4I4Kf4LekW97GFQktvPIzVoS86Fn+5IgTyZIv1/9rRUZUD
	2EWG14DTmde1T+u50zXeMkj829y8/GAlRBMUOMwvFUCBzDgrgqjpdLRtWPC6+qhSNi0K/T
	YTxj+/26uUPEIJba1R+H1OtALURdYOt08PybQzLBAtxboNMs3ib3pYgOj9KlSg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781811511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DlydCbhltfwfsa330lHUd+KjXMsVVdjxH4/MWnXAm0Q=;
	b=cLSzyWepoJhNdaXK/U5iPQZoevEwFBvmx7AYCHOmRYgosewyoWulG3FBpp9O8iLLfcacpW
	hVWYnUExwxrHfqAA==
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
Subject: Re: [PATCH v7 018/120] x86/cpuid: Parse CPUID(0x16)
Message-ID: <ajRJNVsP1cvQVimm@lx-t490>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-19-darwi@linutronix.de>
 <20260618185231.GCajQ-b8VSy19-y6xZ@fat_crate.local>
 <ajRI0lYAA9_rf51l@lx-t490>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajRI0lYAA9_rf51l@lx-t490>

On Thu, 18 Jun 2026, Ahmed S. Darwish wrote:
>
> There's no parsing things twice here.  Sorry, I guess it just that way
> because of the CPUID_VENDOR_ENTRIES name misnormer.
>
                                                               ^ looks
