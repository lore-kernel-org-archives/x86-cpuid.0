Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513793B4430
	for <x86-cpuid@lists.linux.dev>; Tue, 12 May 2026 14:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778596490; cv=none; b=UgmEf/Cnk1KIEC2UT3lvjNYVya/MCmK2NtoiWcRpuaaBKCXTZupivuqv/Vli39WG0if2ht9tLd6vU2M8nxORqvlCs/53wEd9MhOvv86LRkI13iaaIucUSi05VajEfgBKhnXy9whzmqY2egGcPDYh9KBa+nJi49o+UPIVoaKYZo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778596490; c=relaxed/simple;
	bh=I9ULqb7kJSIVDGxlfRDkXKpz7yuzGiPgkcEZ7xFYfAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hjx2Jlg5QhEzzL4fqAqr0whUSLBy+639wHBJDyMIji22AN0xnULWstt8WE1/r87FHlaXFPAcOyXyHD3+y281Yw/K/lnXSCus+8pC8tiPMFR2T6/KdKmW+aQrqkR/C8jGlwnebvk/HtgIpSUhqcy78OGI7aFquxK+e0awVbptSuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=j4kBApMU; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="j4kBApMU"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id BE1E640E0032;
	Tue, 12 May 2026 14:34:44 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id pSfJqWvWthQF; Tue, 12 May 2026 14:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1778596474; bh=WWAPNd7GyTq/KvTCitoiAaL8sN1bLFU3SrvbpSmEoTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j4kBApMUaHqP2emMcoRN/RTuPY7UcXwKg3WoHhTRHHFxSNAvSSWJb+0OKqe8CvXwy
	 2i89DxSva6U7iv26MStspyhtUokEpM+rzI/+BqaYyJaLl52hWfDJA77geWLr6f1S4D
	 AhtXnurhPGvYw4pzvsN5gLeXXAv6CJX3QIblJ3EX80GeKqCPQL3jWjI3fSCf8KZwWZ
	 grjBGT0cCyxT9OeXJgOu4746nsv25Swp7wpPSDO259XqMocSjQIR7OegclyUIRL458
	 ISwnlcxrZun3Ey/u7fjzcRH6QIm6QkRQYQ/RptApBf+5IQtlPOjFLDsK+uXxQefJ37
	 cLOvjgNXbOYm2qjnGzys2RVkbkGkBccECwpeWfOYPlp7pC5+Z0/f/pBBeY90TBKgaa
	 byaLnTgJ6Nu2bvrkYBJ8hKdIwqKVV+aEH0wjcnaHKRGA0D7JJng8nL4+WkDw81z7kX
	 iPxuLdD9hUUQdXO8PWUkIsRLyAAyYpxg0cGaWYmRBBaIeB/ABfUeUJPe+s7LnoNxdf
	 PJfbkONkgkKsTmse+ccbDqSzwitCw0L05P2mJT/z67W8nBphc9rvB1DHyDxqa9N201
	 Gp0HLIivryaGYo7pxQYExyzNIGqtDec8Xi0fWbNJJ8VvEKQ8IrvabWEQC9EFvigtFk
	 niiMu/nNfgDj8SlmHlIz+8YY=
Received: from zn.tnic (pd953014d.dip0.t-ipconnect.de [217.83.1.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id A750840E019B;
	Tue, 12 May 2026 14:34:19 +0000 (UTC)
Date: Tue, 12 May 2026 16:34:12 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
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
Subject: Re: [PATCH v6 10/90] x86/cpu: Rescan CPUID table after disabling PSN
Message-ID: <20260512143412.GDagM6ZLBpvt6X3jzq@fat_crate.local>
References: <20260327021645.555257-1-darwi@linutronix.de>
 <20260327021645.555257-11-darwi@linutronix.de>
 <20260511200032.GAagI1YMP51EzCo7dn@fat_crate.local>
 <agLS2Y7smYRHyiHf@lx-t490>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <agLS2Y7smYRHyiHf@lx-t490>

On Tue, May 12, 2026 at 09:12:25AM +0200, Ahmed S. Darwish wrote:
> So the min_t()'s intent is just to be defensive against hardware surprises.

But when you read l0->max_std_leaf, you always get the current, highest base
level. So there's nothing to protect against.

Or am I missing something?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
