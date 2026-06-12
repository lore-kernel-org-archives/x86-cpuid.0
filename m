Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7403911C6
	for <x86-cpuid@lists.linux.dev>; Fri, 12 Jun 2026 20:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781295754; cv=none; b=ljVgBDhwvr9KWhEpOCUkWlT+7fg+su8KqpIz3lpGHGTnTjX2bpVhlR2ji2d5RdRzuwigC7/Ipatin4QjZLiBMKqWqUzOGfxszyAG8kG5bsEOAW1Y5IMgi5B3Pt9AocCRKozjvF7Da0DVodAEphNdhnbfYyoW4+xdNwN8IEajPEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781295754; c=relaxed/simple;
	bh=q/U62D+cNKFrDcyKAgnUWJxk/TBLA1sS5W4Sa8MHGD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oPukXvHQPXLpNnTktmZTBwNk1SK8S9f/N5Q9kWsbIulHkQ/bRj1M3ZyFT5GsodORSfeaXrffcJcuMXdivnaf7mECEEd0krdS7z9dNJmTXknNDz7O5x18oQ98ZwTh35sqyUnJUjTwNHtf8cGtT1NBWKHD3it7qlig9+X1h7dWtiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pDn3Hjd6; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=f1tns/sW; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pDn3Hjd6";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="f1tns/sW"
Date: Fri, 12 Jun 2026 22:22:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781295751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8aVaKg0w6k025W1vSzUduUhj0tqdGB0TuGhsVUnX3gY=;
	b=pDn3Hjd66SS6EYh8l8CdpDT/CUaIxOkL+U89OHoHfcQfk0opw9JiFvIWzjRUH8hGzTCVLN
	Sha309O13MKQXANftZX+nBJHafRv/r9/wDSQnNl6Jw60z7Hzm15EzQprmFKaEYWTzB8GIY
	qitOkGlecvsbyWbI0pqkIge1McqL5kaNsDH1UphLlWetSBMCF0D/F3N31eKzQjc022okPY
	kBH8026pvc8Niap8cdz1IZ18l/ZkwMLKAzz/qfdE83qRJ+E4ar+PQkGLImZKfUO190lelS
	eiyfI8hMi5zuVa/FTkQyX5g5Um4KpBzlg4+0C/L8nneRejKcpVb/SYoPwXCw8A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781295751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8aVaKg0w6k025W1vSzUduUhj0tqdGB0TuGhsVUnX3gY=;
	b=f1tns/sW7I42zUZJcscyAJDJfDr6lF0jZ8jxOiSB7kIBsmAxoSbBiZY/fcJKzWri248LFd
	zAr8k/2NNqr1g/Bg==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Christian Ludloff <ludloff@gmail.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 107/120] x86/cpuid: Parse leaves backing X86_FEATURE
 words
Message-ID: <aixqhV5T3Crcu5UA@lx-t490>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-108-darwi@linutronix.de>
 <ah8eCgGy-oBhgX9D@wieczorr-mobl1.localdomain>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah8eCgGy-oBhgX9D@wieczorr-mobl1.localdomain>

On Tue, 02 Jun 2026, Maciej Wieczor-Retman wrote:
>
> I think I found one mismatch using your lovely debugfs features :)
>

Haha, thanks.

> Specifically seems that CPU0 mismatches on EBX in leaf 0xD, subleaf 1:
>
> 	Leaf 0x0000000d, subleaf 1:
> 	    cached:    EAX=0x0000000f   *EBX=0x00000240    ECX=0x0000dd00    EDX=0x00000000
> 	    actual:    EAX=0x0000000f    EBX=0x000006a0    ECX=0x0000dd00    EDX=0x00000000
>
> EBX reports 'the size in bytes of the xsave area containing all states enabled
> by XCR0 | IA32_XSS'. Because all the other CPUs are fine (no mismatch) it looks
> like boot cpu didn't get updated after the xsave area size was updated. From
> some digging around I believe the update gets done in
> get_xsave_compacted_size() (MSR_IA32_XSS is updated) Going back up the
> call chain I arrived at all the fpu init code. I have no idea if this is the
> right way to fix it but the below snippet does eliminate the mismatch:
>

CPUID(0xd).EBX is not used by any converted call site.  So, IMHO this is a
very minor issue now.

Let's please re-discuss this after things are merged to -tip.  By that
time, you you can submit a patch and we can discuss it there.

Thanks!
Ahmed
