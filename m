Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06283EAC84
	for <x86-cpuid@lists.linux.dev>; Tue,  2 Jun 2026 17:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780420256; cv=none; b=cFWu6KLHH/IG6ntj9hPxla/z3BRdMfw8wFemy3gX9IZzi4F0yrSARxwdjjJrf4Zvf087MEr1bmf/yNP8cN6BXEWolt8DY99WkGmQgUonJ8dQpSgGbTMTGfAvDlZbgN5oYASLXMfuOoD2Cgul1uNfETUMAvoN8NLNrI7YMZYFpKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780420256; c=relaxed/simple;
	bh=Fkaaf7WB3U7rmsJA0Rd9tDK253EhCfLdVhmXTWFvyRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZLAoUWBeGC3UAemFaXJaDSoiedY/A/zH4mo7iwJYSKwh7P2NSNPPEnsdgTesRUFoHqNqNzHb1VLzaBMsknNpBHTHsNR22NDyyp2v1VApy3iTjJss1WesddadQQXOzm62Vyac5eB4KtLkxaYzQ2EVGzqSHRUrvi5cGNVAVmU2q3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=jbiq9PS1; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="jbiq9PS1"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 5C18F40E015D;
	Tue,  2 Jun 2026 17:10:44 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id SjW_TwqS92nE; Tue,  2 Jun 2026 17:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1780420231; bh=CHS3hQvVsmLEG+Yz5kvSLNqKdse4L+VbD4iqND7Vnf4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jbiq9PS17/wC/TzNOzOgCzyt9eHxfXCKNHH+NO9flsYPRzdo/gpcXsVUq89zyKNAv
	 hZL40aESvZgPWR92h2rSPSwtlabxgTvuE3PqLpphJxQNhIk5BPCdSdsuvJMsm2bWp8
	 U4Pkj4aPp5SKFPWch89rv/Mn/V3Syc+QKVA3JZ+R/CzALg9+oBMs8CPZkw3FbaxkQr
	 q96p7rnigWAkc297dkXKJQxtwY0ZPgzMzxcnUGvVgT5aV6GIWd2WYHYSj2v743NjPJ
	 mk2cme7cgk2sk0D+TmfZc2ooOUumXdnZLjqwXepUiILRZMVdOqm4HHADpIb/GlMglw
	 pU5AgeFpYUAiWQfQVKxWrdXzpQL8vty+oXnnfwCiWJLqzOFMrTWAO2IFK8oZSsJjpG
	 6ioXyJuVPVW+xAqstoTAGC4uq/bu/DknWqkI/3k1yAsPgR+e1cjSqvgA2+ULC6b9gi
	 aepUH9VnpYoREPRG4MW04GGlbh9fEZ5rGb69Ia/jslE3Auf/1kKfishVrc3nkrFbMU
	 CZLg5u23QFJJKMTGBjLd9nVEGH8L0zG0oVOPWcjQNFtssajnywsa9PL+cY+X3hqjmt
	 0PcDqVAYvu9+rjO3sSzteKQibflvuaOl6A6csr9YA8QpjWv5Vc/TEOBGLHa6Ao476n
	 iqZtIe6OVmcliy7lqOW0bRdc=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 02A7040E0140;
	Tue,  2 Jun 2026 17:10:17 +0000 (UTC)
Date: Tue, 2 Jun 2026 10:10:09 -0700
From: Borislav Petkov <bp@alien8.de>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
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
Message-ID: <20260602171009.GHah8OcUVV9whwCfqi@fat_crate.local>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-14-darwi@linutronix.de>
 <ah2-WUDXHFfrDLaB@wieczorr-mobl1.localdomain>
 <20260602012205.GEah4wPes4qegK9T9K@fat_crate.local>
 <ah7ahOrmPfhX_7bT@lx-t490>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ah7ahOrmPfhX_7bT@lx-t490>

On Tue, Jun 02, 2026 at 03:28:36PM +0200, Ahmed S. Darwish wrote:
> He is correct.

So I went forward to look a bit... the whole point of that code in
microcode_check() is to rescan the *full* CPUID leafage into a separate copy
of cpuinfo_x86.cpuid.

And then compare the old and the new one and see whether microcode changed
anything.

I see you're doing something in patch 106 and I'll know much better when I get
to it but my gut feeling right now tells me, you should leave that code alone
and do it separately, ontop, when we start removing ->x86_capability.

AFAICT, the CPUID parser can simply do:

        struct cpuid_table *table = &second_copy.cpuid;
        
        cpuid_fill_table(table, cpuid_parse_entries, nr_entries);

and fill the table. Then we'll need to go over that table and compare it with
the existing one. I guess adding a __cmp_range() or so in the same manner like
you do iterate over ranges right now.

Something along those lines I guess...

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
