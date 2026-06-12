Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FA9340283
	for <x86-cpuid@lists.linux.dev>; Fri, 12 Jun 2026 19:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781293784; cv=none; b=DfLY3z/XD/AA1AEvz6lJXbbn8YXBfYjMGUD5OuB0QGOO1fBrbSBLgxabXv5+vvv7V/2OUDCJabePosCYpjyJkaoFoVRgLAtpMk1lnVti4u1n2sNFGcubPbvqAzMrVyz5O2dGudqueBd6DuXLpevewoHWHGq9g2hPYuGk6EsfmmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781293784; c=relaxed/simple;
	bh=qYJflftZ3EivyYqZho1ThRM9HY/MIMtuCD//B1q6pHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eMbF+1eqG2UrhdhsPuMS5IGjQjFnFIgNZR3TpL3HN/4Zueyt7d911vl1L6NaFjY0ycDmYFp4h73RZGmbOgDbMRM7yBnVSRfUFE4Vy1NcI/462AZ5YzDgpaugEQFVulv7qlGrua5RPr2HIM8/CoZ+lc7PTvIY9oLXbB6NAp85/tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jvbrHiv3; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=B/hiHLRN; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jvbrHiv3";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="B/hiHLRN"
Date: Fri, 12 Jun 2026 21:49:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781293781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KRZP+ozIw69VncZ2fMCTJjs9aMiEyd9/078n5whlJLA=;
	b=jvbrHiv3tm0hGNecY+tGLqcfwTKHeVCL5tu8Zan3YNeIY25JlLYzpd7Q2GJYpdMnAU6uq5
	4QuVbgc5T9K4YMS7x3cJyubqh/CrG7EHx/FmrOyr5vHW74slAFOIuONJtt5KySvWhz9bQz
	9ENZadO0dRypxy8FpqimJeXcBLeG1cB796CZI8SBbbf49MYqC8+/JRzDXe8lfBuJa7OxX/
	krOhiGetk/Qlgk27tNpb35TgLU+/I4Tcpueynw5CVdY42Xui2Nicd5QwFLHa4c455h0406
	lUq2hJNt8q7aKC5Lmh4BcXNx/6ZQGY3W6WbEcUeYE8BAJw0u+/We0/PiA4maIQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781293781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KRZP+ozIw69VncZ2fMCTJjs9aMiEyd9/078n5whlJLA=;
	b=B/hiHLRNWp3txzTWOwN1Uxnu/hhLmqcLTw8mOeOiU+xJIbp6jlI4bw0csruRX56Gp5SWVh
	gWbkV2H0yipUW7Bg==
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
Subject: Re: [PATCH v7 013/120] x86/cpu: Use parsed CPUID(0x80000000)
Message-ID: <aixi07o7c3s7EOaX@lx-t490>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-14-darwi@linutronix.de>
 <ah2-WUDXHFfrDLaB@wieczorr-mobl1.localdomain>
 <20260602012205.GEah4wPes4qegK9T9K@fat_crate.local>
 <ah7ahOrmPfhX_7bT@lx-t490>
 <20260602171009.GHah8OcUVV9whwCfqi@fat_crate.local>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602171009.GHah8OcUVV9whwCfqi@fat_crate.local>

On Tue, 02 Jun 2026, Borislav Petkov wrote:
>
> So I went forward to look a bit... the whole point of that code in
> microcode_check() is to rescan the *full* CPUID leafage into a separate copy
> of cpuinfo_x86.cpuid.
>
> And then compare the old and the new one and see whether microcode changed
> anything.
>
> I see you're doing something in patch 106 and I'll know much better when I get
> to it but my gut feeling right now tells me, you should leave that code alone
> and do it separately, ontop, when we start removing ->x86_capability.

Patch #16:

    x86/cpuid: Split parser tables and add vendor-qualified parsing
    https://lore.kernel.org/lkml/20260528153923.403473-17-darwi@linutronix.de

initializes the CPUID table at get_cpu_caps() through cpuid_scan_cpu().

I'll just move the group CPUID(0x8000*) patches after that patch, and
everything should be handled nicely.

>
> AFAICT, the CPUID parser can simply do:
>
>         struct cpuid_table *table = &second_copy.cpuid;
>
>         cpuid_fill_table(table, cpuid_parse_entries, nr_entries);
>
> and fill the table. Then we'll need to go over that table and compare it with
> the existing one. I guess adding a __cmp_range() or so in the same manner like
> you do iterate over ranges right now.
>
> Something along those lines I guess...
>

As you hinted at, this is indeed dealt with by the end of the series.  I
actually tested it back then to make sure the before/after microcode
comparisons are still working.

So, I fully agree, let's postpone this until we reach there.

Thanks,
Ahmed
