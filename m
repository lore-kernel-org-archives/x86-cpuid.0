Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD07730E0CC
	for <x86-cpuid@lists.linux.dev>; Wed, 29 Apr 2026 10:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777457360; cv=none; b=jcOt6/h+ZuM192FqPXRAIqb45i0qYlSyyQBF2eEolIaycVWwCdKMeQJArjIDXLASXXbvKZr6LL5h9sw6vi1cnaxKUtbA3wcvNaOUyoZmMkTOJOrCdf5XteibXYze9L91aQxnVK35SRA8I4o/K2hYFrpz33PUZCMApFancd+ozt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777457360; c=relaxed/simple;
	bh=jWwwXdwY7SKPrJVqtovp+ft34717z7wOSVIERf+x+u0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d8g5rkfbdTk+IKEj/ZN/G4I+0oDY3Licw9IdJbvnPSF9ZZwCt7SuDcOD9g03XVt1vJBZ6ttx3E9M8iJlgKjPT/w3gx0EwM2FyyDQEbxj3A5v9o/W0jazHs3fkJ/z3GNYF5d2XMXC2suQvUBqJTH2ve6A99qeM5e0xqmmI9++JPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Ie2XFEiv; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=68deSn8H; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Ie2XFEiv";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="68deSn8H"
Date: Wed, 29 Apr 2026 12:09:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1777457357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jWwwXdwY7SKPrJVqtovp+ft34717z7wOSVIERf+x+u0=;
	b=Ie2XFEivhaZKVgFlV3ITbeM5+eiKa/MCB57iApTVz648FmPF7Fre+ZpVAFA943/wMyQc1t
	XavPBPksGe5zoJ4wcCI9aYFBrG9oWtNRLuzxXlnYFBES6RzzSqqXAxlNQbOT+tzbu6AVlC
	KgKXX3bTLXS9d1Kqz1lnObgnNj9yCUKnMiKJG3WWMe1NI8cScbJPjKVZCzsu7X+N7+FXBU
	b92QOmBBCAicKz/xwxLZ4ZUu646/Ro6ZgJe1CS7DM31ZWsHFNKpui/xl/CfhJJF9dWBYlf
	yX8uH2vaKHIhd4LDfKbgVvXHvl+QsVPyVkKiGgCzNX/olwoiPhAwwdgmPNjwyA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1777457357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jWwwXdwY7SKPrJVqtovp+ft34717z7wOSVIERf+x+u0=;
	b=68deSn8H8xnwZ1nGIrSUCE1NuJz2ErdMBIk0X0ozqSubgW9nHSZZA9vQJSjkj9CG+AjcR2
	7ZXDp4IbEHnuf1CQ==
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
Message-ID: <afHYy7oN-412CmKt@lx-t490>
References: <20260327021645.555257-1-darwi@linutronix.de>
 <aeeu5hUusoPXN-vc@wieczorr-mobl1.localdomain>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeeu5hUusoPXN-vc@wieczorr-mobl1.localdomain>

On Tue, 21 Apr 2026, Maciej Wieczor-Retman wrote:
>
> I've now read through every patch and cross checked most things with the
> docs so I think everything plugs in where it should (aside from that
> transmeta.c thing that the kernel bot reported).
>

Thanks a lot!

>
> Only left comments on some code formatting stuff, typoes etc.
>

I'm in-progress rebasing the patch queue over -rc1 and have included all
your points.

Kind regards,
Ahmed
