Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E723B9DA5
	for <x86-cpuid@lists.linux.dev>; Mon,  8 Jun 2026 09:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780912553; cv=none; b=LDXH3fed0hkqH29EGoMA6UNIIES6h+j3kgxBMzEsTTlTEiUpxL6QIgyCo1HGZgAbI8XxpZc0D/fdaeYunk+9ac6gViwpihmtNv7HUA21Fnee46BVB2Srg4F2CRjUjVuVQZI8hrowSsxtosOXu4dx/KC3d3+Dx9Cyz3IH7bSF5pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780912553; c=relaxed/simple;
	bh=InX7GkwRnipOBKSw5EFpPLFFT4P7br9pAUHEoJR1gpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NWJr7OT5/GXwOqYafGeSzq3b+R0EezERPBquigIKT/oV0ojXMKn72yT7DVQHftAaG6mJ7qT+2C9vMJjHD9qfjqj7zdvwM9w7n9ZEKXJ0PIC2Hbw22HBjhG2zHw8+9dz7MI1UOLmmJYd/AyV3xTvPHTQpShXwSo42Fz74WuXxEv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=COtmprzD; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=452kTf8v; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="COtmprzD";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="452kTf8v"
Date: Mon, 8 Jun 2026 11:55:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780912542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=InX7GkwRnipOBKSw5EFpPLFFT4P7br9pAUHEoJR1gpc=;
	b=COtmprzDlGly3YxBCBq70mEtTv+a/KxwMsds4WdOi7JLTAzlRiGPX8lQ4D7w8HZa20B5Hm
	e5ZfRt+0oITOKebKoo9K+fXPgrgJ6JTu3gE29ddKgCNPq0N1CeajqcqQphZjwxJ76S61zs
	tEo2XHwh1KG7xgDoi3OQtIVbRx7F3Hw0tcB+0s3KaQGTVz9ytlelyyW5eBapDzJo2W8w9S
	8EEvLxWOHObFr11EIq+42fJxJBNJjTwlW6AjIAZEp0I5JPsKRFx3AcDxxKbIaeO91FrIIl
	gEb/WT4F5Fiao/9fWiasCPSLOXsLeM5a8ebW3+MBesSaB/VRW5yc/hCkaF+dOA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780912542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=InX7GkwRnipOBKSw5EFpPLFFT4P7br9pAUHEoJR1gpc=;
	b=452kTf8vG4xDVUAzz0+zxIdl8KLvEsCjk3nezxdVNwzTM2xTIz/VxdknXkkZAGKmlx+5nM
	loNehD8s+JtgNsBQ==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: Ingo Molnar <mingo@kernel.org>,
	Maciej Wieczor-Retman <m.wieczorretman@pm.me>, mingo@redhat.com,
	dave.hansen@linux.intel.com, bp@alien8.de, hpa@zytor.com,
	tglx@kernel.org, sohil.mehta@intel.com, andrew.cooper3@citrix.com,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	john.ogness@linutronix.de, ludloff@gmail.com,
	x86-cpuid@lists.linux.dev
Subject: Re: [PATCH v2 2/2] x86/cpuid: Update bitfields to x86-cpuid-db v3.1
Message-ID: <aiaRm2CWtOANhAR-@lx-t490>
References: <cover.1780506200.git.m.wieczorretman@pm.me>
 <9653d8690ec7093c8190b12d1fa8c689c4da50fe.1780506200.git.m.wieczorretman@pm.me>
 <aiEsJPkuEaRPcwdN@gmail.com>
 <jEFsDXcGVUCv1Q5UgHp5Wg0Y1rfflX2uZIB4JGPOU6BajyoaQGcVikWOO-o8MXRXNbh0f09hkL3VH4dlEjJvzw==@protonmail.internalid>
 <aiZifD6RY4eTUimw@lx-t490>
 <aiaGHc8V4tLK-Rn4@wieczorr-mobl1.localdomain>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiaGHc8V4tLK-Rn4@wieczorr-mobl1.localdomain>

On Mon, 08 Jun 2026, Maciej Wieczor-Retman wrote:
>
> I see the patches were already merged to tip but perhaps in the next release we
> could put the character limit information in a comment somewhere in the
> tools/arch/x86/kcpuid?
>

Nah, please, it's not worthwhile.

That's the first time we hit the limit, and that's with a CPUID database of
64 leaves and 1104 bitfields.

Thanks,
Ahmed
