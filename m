Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039381ABECE
	for <x86-cpuid@lists.linux.dev>; Tue, 24 Sep 2024 16:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727194164; cv=none; b=lyfN2aKKxmG91mznWUdKBgGKlXYB+6ncOO5hZC71u0on+m4DIvEbsnemB9UQi/clG1BVqfMNqv2o1TEmv7l8T6/Dt16TlOPwjdh2qzW0TnKHxTVJMYcSaJwr4BcyHSOEE8l3cpnGOaf1HQ5m5va01wQmBwnrz1TRMyk//CIseBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727194164; c=relaxed/simple;
	bh=l/k+twUWYDNH+bvDxeNfkg3AL6qbdZitrfjK4ZPTIIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=um8oEY7CVqWZCpr3k7FnCQBGWtInPanMCwS8h39twKqtJ7SJXj3MF3JucDkj+8zBWmXhQ/n4pzm1IYVs93xQL6B6a1LyzjSUBh8ShVJByn9S/TKK/B5dGxqIU0wRQ1yeyRDtljGF+8Fw9lDbbZQjK2swEHqNh+A8XTyusrpnVgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=IKlsbsrr; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=y1z00Ynr; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IKlsbsrr";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="y1z00Ynr"
Date: Tue, 24 Sep 2024 18:09:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1727194153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9MqLGv7PdI2/wcn8PMECNC5OaxaNXr5JR7Uj9E9EXFc=;
	b=IKlsbsrrdgrvwljoibRebau2IB6ZlUH2okCAefdMfILLUO0w1JIWgzxjBTmmAGGGXE34nJ
	FVtIuQxqDlgHPnEHI6wqzA/b0dJ82qt0I5JVnWGMFN2if/C5EBE6C6zFG3DOodKqA1ROJS
	xbfkvB5xEz6KvOgMYVy3eHYVKIbgR4PTn9xJMfyDTmU3cUA3S9FA/A+J26AHS+kLqCb7sc
	pSjiFSGU7XuEwUqFJlaxqO8WcpSUm1RN3I7THZQJqvZ8Yh5AUbwIo95KdxBIYlvqv5jetC
	RrTTD8wVwxdCffTMFAB8H+VbmOH0+0CzZc1IDRKfEFWPMH5Lpn76ZHlwyegwJg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1727194153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9MqLGv7PdI2/wcn8PMECNC5OaxaNXr5JR7Uj9E9EXFc=;
	b=y1z00YnroMSiEgFjJoSC2bxujG4Q7nw45GThW8u7yq8p7guX3nboEmfjmXd9vMiuRAnbzd
	4QDkFedguP5d6sBA==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Sohil Mehta <sohil.mehta@intel.com>
Cc: x86-cpuid@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>,
	Xin Li <xin@zytor.com>, "H . Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH] db: Add Intel NMI-source reporting feature flag
Message-ID: <ZvLkJRN3c91gD1ww@lx-t490>
References: <20240923223213.852758-1-sohil.mehta@intel.com>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923223213.852758-1-sohil.mehta@intel.com>

On Mon, 23 Sep 2024, Sohil Mehta wrote:
>
> NMI-source is documented starting with FRED specification v6. It is
> enumerated with the feature flag:
> CPUID.(EAX=7,ECX=1):EAX.NMI_SRC[bit20]
>
> Link: https://www.intel.com/content/www/us/en/content-details/819481/flexible-return-and-event-delivery-fred-specification.html
>
> Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>
> ---

Thanks! Now merged to tip:

    https://gitlab.com/x86-cpuid.org/x86-cpuid-db/-/commit/e35608e1f58e

All the best,
Ahmed
