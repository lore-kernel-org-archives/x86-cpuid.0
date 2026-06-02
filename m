Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D8438F621
	for <x86-cpuid@lists.linux.dev>; Tue,  2 Jun 2026 18:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780424695; cv=none; b=uMeOT7hVZsKJTJzXHyMJ+jHWaQvQCv60TUEVUE5M3sWOHlrPQrb5YN0DGKvcdeDYIL1Z+GQmoYCjBBWUcpaqT4DwZR9TAFHT7OaiF7DlG9kfw2bqsDDEihTyR+bBsDFr9NKiZ1IR+3odGkvkUcunXf71zoZ+YiQGlv+cUcUtXPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780424695; c=relaxed/simple;
	bh=m6Z1p/uD6TrFd0/WUZ1X5bua02kDKgBcxwaMtBh9ufo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C4XEZ3VDOPo0uO+lFMLRwYAV/JBgnNdl0r6wMPGRxcYbneo3QP9QvxFqPJZG7aq2K+eNkpO58rsyDV/dYYlmERnvMb2sNtBp8M79FSGA6/XsnmJ7H88GNmTOY+WRqQKyXoCS80iSzMYqcFuClnNXkDSIEIx5YTM+MjhmCrvlJ/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=s4ByXxNK; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=YWVWmH79; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="s4ByXxNK";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YWVWmH79"
Date: Tue, 2 Jun 2026 20:24:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780424692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9Fof44QQtcfZ8fl8+lVpZ5b1Ew8epWDT93XHVMAB15E=;
	b=s4ByXxNK+9v40MWvCU45nATwCg8lvOyGPpxTSB74Oe4YDAP1elputUu3pLz2flbtUi/a20
	osm0vJr2Ro+c8qz7eFsW0x7H15caYe0U5IIsadj4Ed8mTMv1lFiwW3y9POjafBH09DvT2N
	vH/+JYqhjxRx8z1dejyBovZFpkslFfhh+QFrzzvJhsv5B/9/o6Y/tCC3o2zLosNQsC1Im1
	NbImep1r2BgCO9FNrm/ZAupSUCY0LcOrpvjJqcTan6KgcBjep2+YIRtRm59dS5eDUt9ePc
	9eXrLGquKqdegAnoRg2yDEbkaWDXfjjqS39M93LgzN0yoRuKH+1PXmjLE3aP5A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780424692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9Fof44QQtcfZ8fl8+lVpZ5b1Ew8epWDT93XHVMAB15E=;
	b=YWVWmH79tXSmQZbQXyvq67fbb/fhU4gqfKN8qLafuTqzCdkHShUt0qkigu3GKTp5rkmCHP
	wvoj0xQEZntbMeAg==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: x86-cpuid@lists.linux.dev, Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH] db: Fix typos found during kernel review
Message-ID: <ah8f8iym2dakAeqe@lx-t490>
References: <20260602163843.671293-1-maciej.wieczor-retman@intel.com>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602163843.671293-1-maciej.wieczor-retman@intel.com>

Hi,

On Tue, 02 Jun 2026, Maciej Wieczor-Retman wrote:
>
> Fix a few typos that were found during kernel review of moving CPUID
> data model to use cpuid-db [1].
>
> [1] https://lore.kernel.org/all/ah2WBnBkz8KQrph0@wieczorr-mobl1.localdomain/
>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> ---

Thanks, merged:

    https://gitlab.com/x86-cpuid.org/x86-cpuid-db/-/commit/a7af01507814

I've asked an LLM agent to take a look at the generated kernel C header for
similar mistakes and it indeed identified a few other fields as well.  I'll
fix them now and push an x86-cpuid-db release shortly.

You can submit a kernel patch using the output of that upcoming release.

BR,
Ahmed
