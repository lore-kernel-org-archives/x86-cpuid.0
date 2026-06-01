Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A66136607C
	for <x86-cpuid@lists.linux.dev>; Mon,  1 Jun 2026 21:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780349099; cv=none; b=erML5MH9Y9Mjy0Ki3eLVRQgpkPXzKjAi7g4GIey1hknm/pitLY56D5cjjO/D0rI0Ok7IeVgNHVFEcVJTsZa/UJgTZz1gcKN67RWJ2tY7KUqfAhN3bFcm4O/Ad4iFIsDLZd/A0DpdGBvWbe/ERNy/YI4Pw4zwFS4B6iZgQNh4KLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780349099; c=relaxed/simple;
	bh=igvdkKpDFvMUBn8o21/DOJfBj/nAcBR91vp+rYp8ew0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CB/ABlwUmJ8oLC5Abwp7UDqZatP+CNLJe2XOJrRWlxkCOQ7GbiObm/YR9v7sUAmBvDofFvb85tRqcpqr1nmF+m0ntCaciI5/jIx1lf+jUipeqY9zo8RV1N6jsaIJaFDBsLRSwqQ7jwYmn/epUpYXUBi/IRu9PphNYIsMEwKAZcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=YbAKiCmz; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cz3g1Gty; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YbAKiCmz";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cz3g1Gty"
Date: Mon, 1 Jun 2026 23:24:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780349096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nfjfA9mtHJQA56wSPl6uwvQid8QXNIVOMT4kBU2Lkf8=;
	b=YbAKiCmzLslyjyA6wQCEi6lh0gz2FjY3/C7aHk6bYRulm/VNqfmaSKA3rfoM85vgmM4db8
	2CGOf/CZE14iD6+ovTCwBfEXFCXDXfQELMYqSfCcJ0mz/m4/VJNEOnr9sOP9qCqwSb8Qff
	V/AzeWk9PdxwTWkgYaE6K1kYWyI0rnObQW9D7fBZnENw+3aSgvA3E3fE5Zwx4Gqtb+Pbl7
	vp1vtsxI5LyAyN3V5H9gTcGFDCv55tEkpGGADJxaVxrLij9nEoy5DFSc83CzFrHmQP4cAb
	lOQCO06YY3e5QHVjiVwJgpA0K1K7x18bplMx+3L23yke5PmFaqFfDq1vLEicTw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780349096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nfjfA9mtHJQA56wSPl6uwvQid8QXNIVOMT4kBU2Lkf8=;
	b=cz3g1GtybMFGWegMIgx1aouN1mRLC7SLAGdaDlvdbYm9JFKoP8Zkuz24J0ug2FQQ2hnWGR
	ZJN6CFi5vlo8eyAg==
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
Message-ID: <ah34pi6j5HSMJdrL@lx-t490>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-5-darwi@linutronix.de>
 <ah2WBnBkz8KQrph0@wieczorr-mobl1.localdomain>
 <20260601194150.GDah3gfjoIZIByCa3d@fat_crate.local>
 <ah3jPMYIxC1vsUUB@lx-t490>
 <20260601203452.GAah3s7FevsRDFT7rF@fat_crate.local>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260601203452.GAah3s7FevsRDFT7rF@fat_crate.local>

On Mon, 01 Jun 2026, Borislav Petkov wrote:
>
> On Mon, Jun 01, 2026 at 09:53:32PM +0200, Ahmed S. Darwish wrote:
> > I'm doing another iteration of this PQ this week, along with a minor
> > x86-cpuid-db release to fix those couple of fields.
>
> Maciej found it and I'd like to give him the credit for it. So Maciej please
> do a patch ontop of current tip:x86/cpu so that I can pick it up.
>

Maciej should first send a patch to x86-cpuid-db.¹ Then the header
generated by the tool can be submitted on top of tip:x86/cpu.

This is for example how it was done in the merged commits:

  49394b5af45c tools/x86/kcpuid: Update bitfields to x86-cpuid-db v2.4
  300ba891418a tools/x86/kcpuid: Update bitfields to x86-cpuid-db v2.3
  5e0c3c5e95f0 tools/x86/kcpuid: Update bitfields to x86-cpuid-db v2.2
  ...

One component of this work is that you and the other x86 maintainers will
enforce that "auto generated header" rule; unless something really urgent
pops up and common sense applies.

But a single, yet unused, bitfield spelling mistak is not that urgent to
warrant breaking the rule from the get go.

¹ https://gitlab.com/x86-cpuid.org/x86-cpuid-db/-/blob/tip/CONTRIBUTING.rst

Thanks,
Ahmed
