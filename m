Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C027227EB9
	for <x86-cpuid@lists.linux.dev>; Mon,  1 Jun 2026 20:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780346128; cv=none; b=Td3UAfH3HgHUendjazMwjis6/Nlk7CxLHxfAoZxLIb9wPiu9MLydV9w22wj5iBDUY14P3sBOsLZBddkJZlXZj6kdyiLw9OC8CJUUd3q2s9N6J+Cn2SMJME9Edq6g2iVajTVDaOHn/1rOCBr5NtKQapw/w+hdv1HJ5fmDY6bk+JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780346128; c=relaxed/simple;
	bh=XtINrUk2nGcLlIYdQQx/vFF3LjUp49U3y5yxV7x7ZZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CrYIW6cewo7q3COTGjCJT3KrZmlKDmq8sLH/RPfIr5geAwoNALUQufavjRWrUtl79Sm2APzVxoL6JZM1ZrcgjM1P7qV2GpwIh3phMnPykw7Ro0paXEtlWVL8yG+9vBIwW1O37uTdsl1j39DJRVv6fIVToCoZd9XRwbN/fVmXiqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=G3LkKToK; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="G3LkKToK"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 8F02040E01F9;
	Mon,  1 Jun 2026 20:35:25 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 69dwsBA8JV_v; Mon,  1 Jun 2026 20:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1780346115; bh=htD4mQtj72kG+p6FrPQpW0ZcMtZa8PfHPALl9brdVVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G3LkKToKTolBlGoMkfN9M4sIw0dV8gS/ALtpuBMAc4jMLwCtefTqWgZrt//PosMBs
	 QT5YUX8+KJ831p5VWL2w5U21kn2WVjcKV2OZRDHWukg44UqZre3W/v4WFZcNA3fCaG
	 6/upqb1k9ny6nmkZWPO0uhRKpl88+slO0BsqLJ0otQQnFMXgHx7YWXk5XEqI8kIpEr
	 AYScyEfug2foxBHytO1xQp6sADs8K+4w77VUkpmbbxpH/Cjhsvs6DiWQE7zkMtC9PF
	 VpgNQTelSdy3doFxoXdVNd9XcTT+CDuaS37jprC+DXdGAsb3qmX5tcC8ubcnPSfAWv
	 Si8Y8JerajdYwzEkhmjmlDIk/W6QkNHoDMSXl1puLkG9uBsQnBuCpsrP16fNFTrJLO
	 oG7Q8mxYgc+1TJFTg3JN7AVPCDtYSlsyoHGbydShXKvvofwecTzKGIT6Dngsb6/K1F
	 3slOj9wfH7f5q3M1H9puWKzxAClWergmtTEGZWWxcuxhsVk4dwbn/Hhc+SiuqM9mw3
	 LR4F8weM4Fg9Op5UI+iNSzqXxeXNZUevPpqD7HqT7FwMEq000dtLgov9JOLvNWiSQO
	 sNWUH1I5zZH/2b1JkuUMP7Q7y1D1guclUXO3Lr3HjJXTtqg0EUwuozDvsHRBzH2jIF
	 Z+cgmzx8ExTqWOMDjWxfSVO8=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 0E5ED40E0032;
	Mon,  1 Jun 2026 20:35:01 +0000 (UTC)
Date: Mon, 1 Jun 2026 13:34:52 -0700
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
Subject: Re: [PATCH v7 004/120] x86/cpuid: Introduce <asm/cpuid/leaf_types.h>
Message-ID: <20260601203452.GAah3s7FevsRDFT7rF@fat_crate.local>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-5-darwi@linutronix.de>
 <ah2WBnBkz8KQrph0@wieczorr-mobl1.localdomain>
 <20260601194150.GDah3gfjoIZIByCa3d@fat_crate.local>
 <ah3jPMYIxC1vsUUB@lx-t490>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ah3jPMYIxC1vsUUB@lx-t490>

On Mon, Jun 01, 2026 at 09:53:32PM +0200, Ahmed S. Darwish wrote:
> I'm doing another iteration of this PQ this week, along with a minor
> x86-cpuid-db release to fix those couple of fields.

Maciej found it and I'd like to give him the credit for it. So Maciej please
do a patch ontop of current tip:x86/cpu so that I can pick it up.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
