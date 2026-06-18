Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FD7175A89
	for <x86-cpuid@lists.linux.dev>; Thu, 18 Jun 2026 17:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781804750; cv=none; b=hoWdIfZ1BIYLxvJuvThhmqTjjRGgPT0r0eRbgwalqlehhjtYz76SrG7mS34kvD7QLLCZhJmXyiG8jskNZNg+pZj8Dgr7nlnegBEDQmKLp1ReHMA3WyPPtJdvZOnyATTSWwQHFE17QstKXxZ0X4/UbLB50L3CE+6I1jqtHpM6bGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781804750; c=relaxed/simple;
	bh=SXLoYdiyPjL3ARGrSLnA1mpo0HLy+04HsSPLiNyac1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KFzvCHow0X3kNu57+/0BK2T6cohwDyX0rDlyIsRK4VmZz80vzkjgk+RceSagRxKiyUS9aKpJgrJ8QJfsO/QMMgkzh8K1pSQA8ORE+53Dh20iXHLcex3qXTQB3KfneITsrOZ8n0b+o+dviFOhPzO6LwU2xDmAcNbG+Gz0FvYr2k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yuBiwqoE; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BEtXM7ku; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yuBiwqoE";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BEtXM7ku"
Date: Thu, 18 Jun 2026 19:45:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781804747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SXLoYdiyPjL3ARGrSLnA1mpo0HLy+04HsSPLiNyac1Q=;
	b=yuBiwqoEn5zXlIZY6CZt2PsL+qShdmKYrndE0v9XfIbuEoGv1ysstI0i/0ngnXo4QIxXjv
	HKcrr5gPzt6UwfV3uA7BndxdrLuc7xQd6LD5QT5yzYaEe4Km3t5wN0yLJOXin3nuKITNa7
	Hv53opwWBE9ivWq0ZA3FW62b2f17eBCwpD19uuJj51uIZmoEYhq5K/u+gn2TkMGqwa2mTp
	gv9Ifj2AJy/UGqv8A9dA1Vj0rXZy9GqdFhVTu+LyyC4rUdPcdQWRYSGsLSNZ2H1A5HEREb
	W3Bh59MbMCQIZpmVhXIRUfj3KRFBdZh9m1/tNdAa7B/g8yFbwbI0vi8cWNTrlg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781804747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SXLoYdiyPjL3ARGrSLnA1mpo0HLy+04HsSPLiNyac1Q=;
	b=BEtXM7kuVuXN5aI4lFOsnq3ZOzINnPzf68S24hRyW/dgP+KpYcmBvPDRIkBh5uemuBvS9W
	WXBu8mLu4kx53RAA==
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
Subject: Re: [PATCH v7 016/120] x86/cpuid: Split parser tables and add
 vendor-qualified parsing
Message-ID: <ajQuyXOaUlM9aBu-@lx-t490>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-17-darwi@linutronix.de>
 <20260617010808.GAajHzeOsoMYzO3XF4@fat_crate.local>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617010808.GAajHzeOsoMYzO3XF4@fat_crate.local>

On Tue, 16 Jun 2026, Borislav Petkov wrote:
>
> This patch is doing two things:
>
> 1. split parser
> 2. add vendor stuff
>
> I think it should be split.
>

will do.

> > +static bool cpuid_leaf_matches_vendor(unsigned int leaf, u8 cpu_vendor)
>
> This function needs documentation.
>

ACK.

--
Thanks,
Ahmed
