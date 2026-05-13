Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB852388E77
	for <x86-cpuid@lists.linux.dev>; Wed, 13 May 2026 17:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778694492; cv=none; b=LPlzItOAe2ynIij/LJkMTanb8/r3IAsQrSQ5r4XxbeczIzEY0Bku3+0oeDXd+3ZPe1ghKtvnD/twvlfYjJG861cd9KX4w4zwzGPleoXNGL7nA6O5IRbO3H9jvnrGeiv+brPFVmkTO5YgYlIMDbhuEOD8JN9b2BiMeXOBOs07tDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778694492; c=relaxed/simple;
	bh=W8K6K3nflatcrDcFWZ44vwWeShDNSdBA6HdkYP7C55M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cUABUmiViWpdVV+FvObMevncrPKphrTN1kw+sf3qE0PTVt7YdLFyXg2LHxAIfpjDDbjqL1QL/mp0B0cE9JDrHasX/jV+6aHw3eq745FwI+sdvaFMis6NQirTvnebB+0nr1pQNxtjNpGO7qmT/XwxflNp8sxc8fc2A0zXgip4oTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tV+v/RFa; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Kfk0hQPu; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tV+v/RFa";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Kfk0hQPu"
Date: Wed, 13 May 2026 19:48:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1778694490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W8K6K3nflatcrDcFWZ44vwWeShDNSdBA6HdkYP7C55M=;
	b=tV+v/RFaTW8GVpeO6EvQToRbMvz0xOODdIkfO205iiXxBk8pvQyMSS1ifZaLVAPSTqwVlb
	yKWvhH28uOAaunRzjekOODMKbInqN9C0hkpQMAldxuogVfLoJCAwuGrHiUkCVXaQBze8QF
	XYpEgZqQkTpEasCpd0pSoJ6WulbxoW1XWuZ1VSs4DA4AilyRN41Bv69iJ7dHYa63NDoW3K
	EcUMrvvCS5kygkId0meKHKJg/TkV5MuEPIg2zQ0np/GSrBm0MYhMKtAD1fPenvcTsx1kEm
	dKBBe9ihB0FpoHWE7KfMQRch5yKPx3duXf3ZZuaAGHyTcVxeRKa3BAFyts1o+A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1778694490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W8K6K3nflatcrDcFWZ44vwWeShDNSdBA6HdkYP7C55M=;
	b=Kfk0hQPuL1RJh1aze765xUUUtPdq3n1C3jv1iIi6DWTX9QyXfJ0ThmILdzumo7mAxFD8nZ
	SL87eLLcNQY/83Cw==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Borislav Petkov <bp@alien8.de>
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
Message-ID: <agS5WGThgj-Evkn9@lx-t490>
References: <20260327021645.555257-1-darwi@linutronix.de>
 <20260327021645.555257-11-darwi@linutronix.de>
 <20260511200032.GAagI1YMP51EzCo7dn@fat_crate.local>
 <agLS2Y7smYRHyiHf@lx-t490>
 <20260512143412.GDagM6ZLBpvt6X3jzq@fat_crate.local>
 <20260513152742.GDagSYbheCBWwNeVj-@fat_crate.local>
 <agShjbCo_HSs9YOf@lx-t490>
 <20260513165128.GFagSsEPFCogQu7n5t@fat_crate.local>
 <agS0A2pRhz_qCPce@lx-t490>
 <20260513173842.GJagS3InAztdvoiPGl@fat_crate.local>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513173842.GJagS3InAztdvoiPGl@fat_crate.local>

On Wed, 13 May 2026, Borislav Petkov wrote:
>
> Maybe... later...
>
> Right now the *only* thing we wanna do *first* is the conversion. Which is
> a huuge undertaking in itself.
>
> So please no more unrelated changes and "it would be good to do this and
> that." That can be done later.
>
> If we find a bug while doing so then it is very likely an existing bug which
> we'll fix immeditely and continue with the conversion.
>
> Once everything has been converted and the dust settles, *then* w can do
> improvements ontop.

Sounds good.
