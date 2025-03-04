Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593C520A5C2
	for <x86-cpuid@lists.linux.dev>; Tue,  4 Mar 2025 16:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741105790; cv=none; b=rQxNEPd2VCRisi+fO/cGwCBhRHVoPKassBmg3N4DRHr6wK5/8CNgqWjRqFaEvpggDnojLAPCW7MWIBBdlQ7HTHNSOR3ldlDhMHo6OOQ5kGoe8DGr0VLaTYEniI9tw+48R6QcjRugsT9Qr7/dM0w1ywxYUK959EqvPsNKWahTHak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741105790; c=relaxed/simple;
	bh=PBlZNYWFFwlMjEBOJMYqTlwlDreKKqJ4cgOQ42G27F0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZqJGTJdJcFBuqF71++FHukQ9i7GNP0NrHD4z4xmB+tIkIVKYy88JuQ1o30Xnj1JW/1lfR3AFwlsR50ejSlxtfze4NV2YNTOwRnGVbd4idttGy3hiKJpG5h9tpm1sINhS+aUQw3DkPA7jUplEucqZAUn3fslkZy+f6+kTvtAg0pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Nghquj+k; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=WxfhqjGM; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Nghquj+k";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="WxfhqjGM"
Date: Tue, 4 Mar 2025 17:29:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741105787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MLxECmkspKQDfntXqD3QTUlzc9UVx4okiqWDfhtEQ24=;
	b=Nghquj+kOj//xwKcjMDRZjHqqnKWjROsq/gAyOQaheSPShwZC93GbmKgQwAd4Bc+UFka20
	FMKEs5a2AXYQ+gH8xMalGUADf3GaQN3xmFcU6Gmux76++0nRfgtGQ9qatFADm3tlsLrSn3
	BAlZp2To6mOXt1fkYawN8xrn3ZOd8ovmhP9SIntoVGke1McnwBpZezYlVS++HTC/EFdCEw
	pu005afxzONd1FxnrrbfCg92bNIT2xDEtk08moqQeKLXqin2rrJEK+BZRp/nVHuo5tWCbq
	7Mtn3nd40c/d8UNPubCIraVs9j11vTWffMpCQo1X2R7gAXXf8Ra2SApLF4NDOQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741105787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MLxECmkspKQDfntXqD3QTUlzc9UVx4okiqWDfhtEQ24=;
	b=WxfhqjGMlJVGwwDJKs8ExXZINr9Q0JZKkestaSqZOLK8K2SCSL6/OeNThz+oabkFhfeb36
	Fm6Om8b+WYtNa4DA==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: x86-cpuid@lists.linux.dev
Subject: Re: [PATCH] db/leaf_1d: Correct XCR0_CET_{U,S} information
Message-ID: <Z8cqeSTtB8m--zFl@lx-t490>
References: <20241008135208.2567502-1-andrew.cooper3@citrix.com>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008135208.2567502-1-andrew.cooper3@citrix.com>

Hi Andrew,

First, I apologize.  For some reason, the x86-cpuid list didn't forward
/any/ emails to me, and I've just discovered all the pending ML emails
through a random check of the lore archive :(

On Tue, 08 Oct 2024, Andrew Cooper wrote:
>
> The description text itself mixed user and supervisor state.
>
> Furthermore, CET is not an AMD-exclusive feature, nor even AMD's feature; it's
> Intel's feature, which AMD implement a subset of.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: x86-cpuid@lists.linux.dev
>

Thanks!  Now merged to tip:

    https://gitlab.com/x86-cpuid.org/x86-cpuid-db/-/commit/cc6d4e32259b

>
> I have to admit that I'm very confused as to why we have the <vendors> block.
> Any vendor can implement a feature, so this block feels like it can only ever
> be stale.
>

The rationale was to add this for any future HTML rendering of the XML
database + user-space tools that might need it; e.g. Linux's
tools/arch/x86/kcpuid/.

But, yes, so far, the <vendor> tag is not used by any of the project's
XSLT transformers.

All the best,

--
Ahmed S. Darwish
Linutronix GmbH
