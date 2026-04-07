Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFD5399009
	for <x86-cpuid@lists.linux.dev>; Tue,  7 Apr 2026 09:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775552411; cv=none; b=QiC0OO7zsK3iJHyHf6zp4yQ7qcya7CfQI4EjipXNPk1DqwbHI1/xYIBbnPsPAaswjfIdaZ+hzRyctTTnWHXP6FROxmF+l41UWaACXMJAiXqEjNaeRnfcwwLjf9aey0STNHPalQkTEqiBZbVw28JTt/DjhkOcMyU3bO+BEpY8yVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775552411; c=relaxed/simple;
	bh=xB6oTK4MnK8NFfvve2iP6jJti3HDhqju1njSIMoTLcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XlKkKiEt8ULP/55WBE+uTWek2sePoK7koL9ea5OMgLdgtN3urDMu36e1Vujq+JYcrYBahuaBCCTBuILw2omEsCmPzllGXk3zh2xuUs4DuS3JP85ZD2MmCrNPc+GZNsdNE5iUROIVJnkV0zluQKOvTPM8N7SEjvsgAEEObLa9m6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=H+5KdoDr; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="H+5KdoDr"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 7A04040E0176;
	Tue,  7 Apr 2026 08:59:59 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id zWMrylUtiOGL; Tue,  7 Apr 2026 08:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1775552394; bh=eEgb1GW8uzfQ+h65JW6FCdFjHddvwD+daHCn7hE6A8A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H+5KdoDrVEEnh8c/fgkxVPA863FGTBT/5bytbbuSg5H0pp5yRhkmtT9roiShXJMNB
	 c85NIm+w0T4BSxbzPRnKY+SzojfwBoLCJMe+c/R6jvV46DXTvgeoaxjohi85RU0Hqj
	 l2F9N5a7TMUOPIWOMwEwMEPtcSukoko2qnbSjSFHELxK4qkB9YF0ChY3aapaU1Id7s
	 kwCyqmARdGxeKfjLKasLXoO8YlRk3xkzO6SH8038unicnLw7NIXi+M2BqNyWpGjZJV
	 BHhAGmeAzKlXo78NfZsNxy5Ds+H52SztS82i8asL83aXTQrKU8tTIRYH6UIu7yCYUW
	 El8sgkfI/Gktn3tIemzNQs2CbtG8dytYrp6Xzw+zpzK4C1nf6lOAuWKzePqg02ArJF
	 KmvMR3CQ62RnEXbNFJtsdPUzKGJ3oywT6rrJ5ivPzvqa+BW1OZsZkKXvzqQH2vv7k0
	 oxoLdWyIlnZIABvDVmpwqO7w6DDBBDPQXYgMKcmkphOyYJqbeipJajRRhNUTnhtChj
	 CWY2YxAMcUvUKQpHTMGo8YT+hQLkdM1gQZ7Fwjro3JB2Nm3oNHjddB1tQp6AofWxpL
	 Tj1Pcuhs8BpCZhXQjw+jplhbLK3cDhf5bwU48MpQsRd6c+iuwWmBe+V/oeUqWhv0/V
	 HmihB9nRB2VX/TkFZg1ZrtUU=
Received: from zn.tnic (p5de8e020.dip0.t-ipconnect.de [93.232.224.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 16EC140E0163;
	Tue,  7 Apr 2026 08:59:38 +0000 (UTC)
Date: Tue, 7 Apr 2026 10:59:31 +0200
From: Borislav Petkov <bp@alien8.de>
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: "Ahmed S. Darwish" <darwi@linutronix.de>,
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
Subject: Re: [PATCH v6 00/90] x86: Introduce a centralized CPUID data model
Message-ID: <20260407085931.GAadTHc-oelnBjSw8t@fat_crate.local>
References: <adS_GfkQSB9kEs8F@wieczorr-mobl1.localdomain>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <adS_GfkQSB9kEs8F@wieczorr-mobl1.localdomain>

On Tue, Apr 07, 2026 at 08:55:07AM +0000, Maciej Wieczor-Retman wrote:
> Hi, very cool rework! So far I didn't notice any problems while testing.
> 
> Buy anyway I wanted to ask if you thought about including the cpuid_deps[] or
> cpuid_dependent_features[] into the new cpuid API ecosystem?
> 
> Or if not (since this patchset is quite long already :b ), then do you have
> any idea where best it could fit in? During discussion on [1] you mentioned the
> feature depenedency should be encoded in x86-cpuid-db. I assume you meant it
> would need to be first patched into there, then parsed by Kconfig?

A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?

http://daringfireball.net/2007/07/on_top

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
