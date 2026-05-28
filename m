Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA66407CCB
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 18:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779991392; cv=none; b=TE3LO7RZyYTzO1j9u/U0KwLbfAVlFjMigRSZskFGlL/YINa8eCQ/d96eYtjr2tjJx2wnaf4mBaH07gqMPdtwycaxYi55RMFwN4JfW93J/Zpy7gSjT+GpwLMNcBzye94xTJyI5Tla2HmRMRsVpMKOUI5FGKY3uaqrIp9kBTqfvmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779991392; c=relaxed/simple;
	bh=DuqsX+8pDENWUkvb/dIdnSxH52br8K12JHLM+O3uXRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U8+BNqsvkwM7LXgnwv4hTEhcejuKk6TlUAcIycp8Wq/NMCQW0ULmMn7/LYijJrNK8SKqofU04y//gUOrs/X76jM31KaUIJcl4vJOOU/TPXUNVRrNV04dCw5TfHdehB2UahxfsDBEUa+u5xdyrR/mgAfCl53pIyWfLsBC3ULtYB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PdIB9v/W; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=KZGh+/Gq; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PdIB9v/W";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KZGh+/Gq"
Date: Thu, 28 May 2026 20:03:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779991389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vlj6Vp9zTnMRBOhgV4xJ3+1H4A8l4fzM0zW8lGthw2A=;
	b=PdIB9v/W2n7QJu5HI5gKcEJ4VsXJhaq3yOGIUSgFAapBMw9n1eaLWdyQxzdEPOxpIwvJtL
	+0sXILaTqMNdWJapND2dzpkAamU+pFK6ABjxLXF0kULawzg7NqeSRcmeZphtRh5Ep/hJC+
	Uh9UERMQwicnW8Y0xxeMPP3cc4eOt5cldd++RqVzxWNAbwRNjoOAKZqeQCFzgnNR+BAiP7
	8bFcZtAyv73YiDTyAOI98rBsw2+1WPDi8m+nQqHqMzU2xgoIKbduxiBHukNn6h0kqxa2Eo
	DyyZ43oIz/kJWYPPZnYMkb5x+pkbWSoJ6nuwgVDdUxvdgImvYimNVMSHatd7Bg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779991389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vlj6Vp9zTnMRBOhgV4xJ3+1H4A8l4fzM0zW8lGthw2A=;
	b=KZGh+/GqAUKlV+aEwD+ZnxEgSBAvASSn20kB5ndyByu/XdPhsX2lMW9BmJoXGiWg8N/+q6
	SItb9XuJJSGVImAg==
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
Subject: Re: [PATCH v7 007/120] x86/cpu: centaur/zhaoxin: Rescan
 CPUID(0xc0000001) after MSR writes
Message-ID: <ahiDW3-ZYZ9rIbUP@lx-t490>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-8-darwi@linutronix.de>
 <20260528164945.GCahhyKYNsDo3upTKT@fat_crate.local>
 <ahh8aBYqA2i0PFv8@lx-t490>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahh8aBYqA2i0PFv8@lx-t490>

On Thu, 28 May 2026, Ahmed S. Darwish wrote:
>
> The idea was to have these refresh hooks in place so that by the time
> CPUID(0xc0000001) is parsed, everything is correct without an invalid
> intermediate state.
>
> I guess I could've merged it with:
>
>     20	x86/cpuid: Parse Transmeta and Centaur extended ranges
>
> But that one was already too big for that.
>

Duh, I spoke too fast..  There is no risk of invalid intermediate states
as long as CPUID(0xc0000001) is not yet accessed through the parser API.

I'll just move this refresh patch directly after patch 20.
