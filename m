Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFCC264617
	for <x86-cpuid@lists.linux.dev>; Mon, 27 Apr 2026 20:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777320075; cv=none; b=phke/r9TRdjADYuylx0kSCsgJdq/Wmf4OrHq+Yiaoo7BJmx+Y7oLPbdpWqZd1eDJ/khqtkO56W1SXUM5ZqkJ3wv97SxztLpL4SMLllfihlonCzHMmPDlOGyZSgVKj5EWnY8byAAljSaB6MP2XCDz3IBH9P3QZQMxulGZZkmmqkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777320075; c=relaxed/simple;
	bh=NB5D3xMrAp9mrRAW+uEhZ1uGnPi6GHNRGKjFzRhjJ0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MZhPQMhYYP2heT5vbSDF4Xkii4L4xDRlWhDha+3+JkalY/zHBn6P457X8+KGl7EOorC2ZQn5I422hZAsEwi/+paIyM3gpqVnAMhx3IJBgZ6gU5SH1M9YHkVZ1q1W525kOnxCpT3lmoSp1ewYaxJXp0L+AS8fkDLtKwkUuo0RbhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=AyTJJ/EK; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=oLt4gT+0; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="AyTJJ/EK";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="oLt4gT+0"
Date: Mon, 27 Apr 2026 22:01:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1777320073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qIB42hJNZ+t4hOqY+advdolJjsRtHGMqHyuOLY9ids8=;
	b=AyTJJ/EKWvMin/NEVwx2LIbvwrdh+0vvE4pJULbpU+9v9M7nJ8B95w968Aep6QOLgodKKE
	0hb0NLKhqD1CkwL4uvZ31zO4I7NpDso+az5DSmu2zSn/pdbqys1c14eO4v2YA2FtF9RuMR
	4EHiB5PgcuQpdqORDh2ImnWVqlOYkNjUySVRKeUbmshJ6uhh+f+KW1QKm0J/vpODRm3i5l
	pVvVXD9IqOG5zC3YIubxLRPfNot5WdTPUsyEJ0YM9G/d0aOZGI/HJV3IRqSaQhdfoQzsjI
	uCxzYFXgkzE6UvuhbjDwKPSABNrj4v7fhTy6LykK6X6NXVMH7IYzgvs3FMypCQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1777320073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qIB42hJNZ+t4hOqY+advdolJjsRtHGMqHyuOLY9ids8=;
	b=oLt4gT+0x3acYmdOyiib4I4VnfyEJ7ZVsDxZTi5LU2Kr/G9EKErqJwheevI/mT7r5m+S1/
	qVMuuv/ED0d1CbDw==
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
Subject: Re: [PATCH v6 13/90] x86/cpu/intel: Rescan CPUID table after leaf
 unlock
Message-ID: <ae_Ahkvf5ErDUQM3@lx-t490>
References: <20260327021645.555257-1-darwi@linutronix.de>
 <20260327021645.555257-14-darwi@linutronix.de>
 <ad-CVzsotZC5mR4K@wieczorr-mobl1.localdomain>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad-CVzsotZC5mR4K@wieczorr-mobl1.localdomain>

On Wed, 15 Apr 2026, Maciej Wieczor-Retman wrote:
>
> On 2026-03-27 at 03:15:27 +0100, Ahmed S. Darwish wrote:
> >Intel CPUs have a "limit CPUID" MSR bit to limit CPUID enumeration only up
> >to CPUID(0x2).  This can be set by old BIOSen before booting Linux.
>
> BIOSen -> BIOSes?
>

It is actually the more Germanic plural form :)

will change it.
