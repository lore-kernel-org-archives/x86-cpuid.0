Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09605346E74
	for <x86-cpuid@lists.linux.dev>; Mon,  1 Jun 2026 19:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780343688; cv=none; b=Xzc+JGihVZ0zNKcyV8MGvN+y+VXs1Cy9Wj/lM2xN5ma+acAsJ0DV6p1YsfCl/bPoacFgJGokpxyUWOAo2QK/V2NQu1m5YBB97Z6c4K0FCeswk52Yv7OLaVTMABcWKxZyTSmXWv//bbcIycHr2Uj/cc5lQq80XfBzXE/dDxFvJNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780343688; c=relaxed/simple;
	bh=sPL7uex1T+NL+W8SaAsQjuxgPR6cruzxjrq8+R9sfp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dOo94L6qA504ekU+Tw03P6kd+YKW1koaT1hChllHk79z+FQfrsaUuKQyHGxdIgVymwljfz7zekzaGfzhJMzJ03ap/j/9JA4941cqLRedVqotGFkf+Zvpjgi7WpcR61nDmAzNMH2UO7C7o6H3SUbVw/e9YcL88JLPMU0iZWYsagY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Hy6mr/51; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qpWGgzQo; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Hy6mr/51";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qpWGgzQo"
Date: Mon, 1 Jun 2026 21:54:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780343683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sPL7uex1T+NL+W8SaAsQjuxgPR6cruzxjrq8+R9sfp4=;
	b=Hy6mr/51z9BnbHsMPTZ4p2bP0B6RrRAJwfspbWV+DWWwMipefitU2jloslXMYJ/QzC8RhY
	bj1HJOckg55Hrcnm5s6Gpx2z54sWTafC4rQC4LG1LgnhSIBQxFVSeGqsqSo0TskFY0Z1sT
	NAZkeGI0wmUa+5JXuDqUC9z9ChjWAjSx0A4gojaPMRdOjX9w0Ihgv1sPux/UkalyHFtFD0
	fZPYKYM+DX6XywuyUjzTiLIKRLXxw8s1Fv0bpUXRIAkKUknw5UKpYv07p8eGLhKUxRhtgz
	bJYfNH2ZqBOdO7qwGLJ+gSPAMgIcMvWhNarBYKFxp86oHms1tqOfn1+b4NaVqA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780343683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sPL7uex1T+NL+W8SaAsQjuxgPR6cruzxjrq8+R9sfp4=;
	b=qpWGgzQoYYPPn9LDHOG/nwEHwYPrRZTUtMMZL+4xdREXPPxBQM983GVC1KKqHUJ+i0X++4
	NC1ShK/Tma2BKSDw==
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
Subject: Re: [PATCH v7 010/120] x86/lib: Add CPUID(0x1) family and model
 calculation
Message-ID: <ah3jgt2TcUxcAmL-@lx-t490>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-11-darwi@linutronix.de>
 <20260530214351.GAahtaF5T7fXjmoox4@fat_crate.local>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260530214351.GAahtaF5T7fXjmoox4@fat_crate.local>

On Sat, 30 May 2026, Borislav Petkov wrote:
>
> On Thu, May 28, 2026 at 05:37:32PM +0200, Ahmed S. Darwish wrote:
> > +static unsigned int
> > +__x86_model(unsigned int family, unsigned int base_model, unsigned int ext_model)
>
> No need for that ugly linebreak.
>

ACK.
