Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8000225B66B
	for <x86-cpuid@lists.linux.dev>; Wed,  9 Apr 2025 12:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744202391; cv=none; b=BtbO1jIJrI2X7DCDd40rxhCVelBkU1Z9KzfCnqhq6BBWzVZV97XIsTGkt4w7sCkd+Bffs8iI9gaS3WyN50BMgjXHUVXitij2RNOUmdtAJvu0yyswIQOQ54mRufibdDYP16gpH2RESyoAhK7ioQvyAOGbKqNUHBasUwdDt1RDwtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744202391; c=relaxed/simple;
	bh=g5YNTJkago1EF9sUwH+Mayc/+8cAKOZF7dSEG9SG4xI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bvrc20EDqFqgOhsqTDQg2hju8Gn89Xw5/YVnhbrOL3VsRcyj9BHE2f2rH0IcKkrsMfw8yxvseqmbIUBEC0tNekp+Fx6UKwlwQ/3SdnBHGub099NNIbFjb59S8gYqkdVp9EpJASlD5oNKKOmDTTBCo8dIgkN2gvKSjf8sXnlKLzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4A15JzWX; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kgBRHWPF; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4A15JzWX";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kgBRHWPF"
Date: Wed, 9 Apr 2025 14:39:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744202387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sCYHSUGJklgXrtP6h3a1hbdpWIMspW9ejYB0X3HTPOQ=;
	b=4A15JzWXvpOLnUnTx+hCw3RkXS8C8TCG8KlsRCXVi4AjXaM59/SgqBtJ/HZ8ZHQB3S7Oyg
	88EmnMUwOesKgHO1Z9UErE95Z9M2QcMPjXLCg/hqDibhVtmhPe6BGAA1ksD64fnvA+Afn0
	MmG/m6y9Ssiv9ptsg6YHpHwyxmlAGXLFzGToHDEh+u4w7NFjCJLrXXes65eoCjjnx+KVib
	y7VER0XhmkmLDtHVSRWvmVv/B1+QU1n3q0+JHa376TEadhZAtNp1N4+bTmBm/omwiqQSpa
	s3O452+UOrX2lWFQsBLRrBscWKEWsVqMsjPU/mc3aMHa5rQw9rMSgeb+VlHiYA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744202387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sCYHSUGJklgXrtP6h3a1hbdpWIMspW9ejYB0X3HTPOQ=;
	b=kgBRHWPFBQWpbZdeug97Zeq0WKe/tmIjQIn2Tia6m+ZQNIXCFwIxlsePq9y1TIIRN+W0T9
	3YnF76CzZMAu56Cg==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Ingo Molnar <mingo@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 0/2] x86/cacheinfo: Fixes for CPUID(0x80000005) and
 CPUID(0x80000006)
Message-ID: <Z_Zqkpma-vWgpW3o@lx-t490>
References: <20250409105429.1048199-1-darwi@linutronix.de>
 <Z_ZdZpJqgeZ16Fwj@gmail.com>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z_ZdZpJqgeZ16Fwj@gmail.com>

Hi,

On Wed, 09 Apr 2025, Ingo Molnar wrote:
>
> * Ahmed S. Darwish <darwi@linutronix.de> wrote:
>
> > While working on the x86-cpuid-db CPUID model on top of the CPUID(2) and
> > CPUID(4) cleanups at tip/x86/cpu,[*] I've discovered some L1/2/3 cache
> > associativity parsing issues for the AMD CPUID(4) emulation logic .
> >
> > Here are the fixes on top of -rc1.
>
> Could you please send these against tip:master?
>
> tip:x86/cpu already has your previous series, and I don't see the need
> to create a version skew between v6.15 and the x86 tree for v6.16.
>

Sure, I've just sent v2 over tip:master here:

   https://lore.kernel.org/lkml/20250409122233.1058601-1-darwi@linutronix.de

Ironically, this PQ was originally on top of tip:x86/cpu, but I was not
sure if the tip:x86/cpu CPUID refactorings will be sent to Linus at this
merge window or the next — so I thought I'd make everyone's life "easier"
by just basing on -rc1 instead.

(The -stable trees will have trouble merging this v2 -- but at least v1
 shows the same PQ before the CPUID refactorings at tip:x86/cpu.)

Thanks a lot,

--
Ahmed S. Darwish
Linutronix GmbH
