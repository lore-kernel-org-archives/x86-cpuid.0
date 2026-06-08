Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D7832B11D
	for <x86-cpuid@lists.linux.dev>; Mon,  8 Jun 2026 06:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780900776; cv=none; b=ExvPTWdhC4PDMfhMUsEVhnILO+C7NsoO3t307NoKMRmHY2IyQlxK1rJG2RhOQDS26Nen+gWOt98JLRtCGJW5eD4INOwnKOaiRBy/V3jRu7sXvGgQEIG6mBbW+noX9hhPKh7j19H0smHeAnqCEdnz6u+1NRwOOTADAmY7dLEWaqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780900776; c=relaxed/simple;
	bh=Glbienq7OB1yv1tWm9EG78YSwwzuPbUiIwxXEUvGvWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UuJu2hGfO44998aP27RrllWW1WoXBrUh2o/3W/6zicfCzDJaQ5/hoCEslYpmnPjh2HQlD+soi2T8uSp3mJVU+8WlZ1WoYnNc93k/EJ7Vj/Mn4Y0tCbk2G/FljIUEAwiGEwyjK9XkM0qX9rtJClaxGjBqKIC3ZsIFWhUGK9NOMBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ANLhgeOr; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Y/vjgTbb; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ANLhgeOr";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Y/vjgTbb"
Date: Mon, 8 Jun 2026 08:39:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780900774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Glbienq7OB1yv1tWm9EG78YSwwzuPbUiIwxXEUvGvWI=;
	b=ANLhgeOrMuNZ6IZA2i4/itSMDwblxu1Xigpy8I4SA2jA5Nk5fI58+3GYi4l+GLTy5syJ+e
	OqDVWmI2IozwPBJh6Iu6Fmf764yi2R5lR+1/DoZsE1rlAVnkD5jPaYIqp8qb+a9sOipoIi
	fRP1JdDWxzVQZ7iQwF73p/jLBOA7A5GfYQbiHjGHucb0iveDEzhy9DvuSZxhODyw1nWG/6
	Ul5C33gvU6CA4vtxjyIPzAo+sjbj9DuHKYJt28Ou9uZwu1/INtfZWlp2LjBmkdZiMo+J05
	XE/EaZkwaOH0/j1XlPIsjcPCo+07Xg95xpDURsYXXm0Ymx0UW7oLcLIw1Sh90w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780900774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Glbienq7OB1yv1tWm9EG78YSwwzuPbUiIwxXEUvGvWI=;
	b=Y/vjgTbbn67A9R417hPVhMCX7vUE30TbKdSiHNsWIPc4s8lKU2s9cFGeLhGI2/H69VXLam
	LyVY0ddTw/ASO4Bw==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Borislav Petkov <bp@alien8.de>
Cc: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Christian Ludloff <ludloff@gmail.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 004/120] x86/cpuid: Introduce <asm/cpuid/leaf_types.h>
Message-ID: <aiZjpPCTsz4m-1O3@lx-t490>
References: <ah2WBnBkz8KQrph0@wieczorr-mobl1.localdomain>
 <20260601194150.GDah3gfjoIZIByCa3d@fat_crate.local>
 <ah3jPMYIxC1vsUUB@lx-t490>
 <20260601203452.GAah3s7FevsRDFT7rF@fat_crate.local>
 <ah34pi6j5HSMJdrL@lx-t490>
 <20260601225306.GDah4NUvJwaqQem4VQ@fat_crate.local>
 <ah7_wPJ8_FGLOwZd@wieczorr-mobl1.localdomain>
 <20260602174746.GJah8XQvEJo9UKru1l@fat_crate.local>
 <ah9H2hxkMPMeuF-o@lx-t490>
 <20260603003129.GCah914Tc9sEpO4Nxl@fat_crate.local>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603003129.GCah914Tc9sEpO4Nxl@fat_crate.local>

On Tue, 02 Jun 2026, Borislav Petkov wrote:
>
> My only goal is to have an official release with all known issues addressed

I guess that's everyone's goal :)

> and not release something which is clearly wrong and luserspace starts
> depending on it and then we'll have to support it forever.

You mentioned that several times.

How can userspace depend on an internal x86 kernel header?

Thanks,
Ahmed
