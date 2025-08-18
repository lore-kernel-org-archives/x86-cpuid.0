Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8681FDA9E
	for <x86-cpuid@lists.linux.dev>; Mon, 18 Aug 2025 09:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755508548; cv=none; b=KAKbKl4w/kgQ9erZ1cL7C53DhtyT2N6i8FwP7a8I2AAk6DinjaniS5WC2yHot1Ulru5ErcNvq9IeGgEfUxuGO9U7lubm+9VAG0KHRHir5kAVcUVZwX3Bjh3pX8aAyd9w736JUEIoritti6fWqLVnIIoUiamMQnBeWK4p3cUqymM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755508548; c=relaxed/simple;
	bh=pyDpOmrqzheI9rM703nv4FAmYKFLllAVuP6HqNRUpL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mvUvm4DJ57k2dmfTk5XtbYOuVvrWuoDjpJbIpMOIQKIp5Lk/BEsVJTHqioP7D71apOeQ1ONWCr5XCLSo/CjuLNrqW0mUqihGAfI5HAp/MmFZKfyowwuwQNFpAR3e030MHBWsnE0yab3RkZeOwKS7URCpnegZYfpH7nSvDJ+mrSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PwRGt4Kw; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VvRE7fO4; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PwRGt4Kw";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VvRE7fO4"
Date: Mon, 18 Aug 2025 11:15:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1755508543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WZii8ZYkT0VDD/8L06JrzJJSntk5WaYVWOcmvKA8LQo=;
	b=PwRGt4Kw2oqrkW5UsgwBLP3uz9iMJ1qMMsqTSIwr7ymrEsyFFnA0qGTFGtGPRT9BDaWxlK
	+ldqU2tdt1ZwPGGwR1+AKDe0+bLFu7eN+3N6Mg5k6sT9zVwVxIXjEpKIY5Hns1UsFhl9Ld
	4MA7TzLaXjJBP3b/NJaurT/XzxZyxvRHv/EE1UydLMxYy5cAiFo0ApVxCDolf5Oc5cBAbO
	KYpxR1e7Ii2ZrULkQcNuOLms5HHpNsgYA0kPqsql+K2+0rhx6lLzTnFZYh4gDYO9cke11X
	ZhNFFiIBxD3fJ2Icjzhxo+8+ZDanE1nB39dIXx60uBUlgBxchN1AOn/7OvE0Dw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1755508543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WZii8ZYkT0VDD/8L06JrzJJSntk5WaYVWOcmvKA8LQo=;
	b=VvRE7fO4IkC/43nA/lyfzN1gfr8yAcTkbcsbAOwP7lnlGF2WcH1Sz7WEcN9vi6vZ78Ksp+
	EsKUlYWFpc9ITyCw==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: "Nikunj A. Dadhania" <nikunj@amd.com>
Cc: x86-cpuid@lists.linux.dev, bp@alien8.de, thomas.lendacky@amd.com,
	santosh.shukla@amd.com
Subject: Re: [PATCH] db/leaf_8000000a: Add Page modification logging
Message-ID: <aKLvPI3zK-2m0jUA@lx-t490>
References: <20250811125236.2606331-1-nikunj@amd.com>
 <aJ7erI-UKNIBehjP@lx-t490>
 <78f2fe53-2e53-4cfa-b96e-ef82da444f6a@amd.com>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78f2fe53-2e53-4cfa-b96e-ef82da444f6a@amd.com>

On Mon, 18 Aug 2025, Nikunj A. Dadhania wrote:
>
> I will be sending a patch on LKML adding X86_FEATURE_PML.
>

Perfect; I've merged the patch to tip:

    https://gitlab.com/x86-cpuid.org/x86-cpuid-db/-/commit/af088a2d1b32

Thanks!

--
Ahmed S. Darwish
Linutronix GmbH
