Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F30121ABB9
	for <x86-cpuid@lists.linux.dev>; Thu, 29 Jan 2026 16:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769702864; cv=none; b=TM+cB6CCB0NUBLVvB6zjQVXxNr/WxZnpRKos9AjYjltoFwG8nfvleqGGq0W28tonNDEfmN9J8TMux2W8XhRCx/pdmq2yHdST4fPS9PsOF5j6Gq7ComLuif1VxtIoDHxsWAhBYY/+yQccGaW+hE2WYmyhJGcO51Tfsh7/U/mqOyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769702864; c=relaxed/simple;
	bh=Hd52fsIbHnkBcRso1kbglneEs6ZUz6aS2AV9uyqy1mo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KySvoBA83Nl1c+sYfEjPK/o/w2AAuYD6+dL3+Ge8tj3Eo4zmb3Z3GjBpDa0G/MUI+nZOyVlQv6Kafu+PzEAsxTMiHbdNcEywUVn5beLHyI2Zxhw08eOhw5mEcV6sPMiA2jCYMBtNPsVMwqupGI5FPIV1t1DzkDn8oj1he5jCiHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=HAzRYo8V; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="HAzRYo8V"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 9BDBA40E02F9;
	Thu, 29 Jan 2026 16:07:34 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id s9ZaFlqhdgiX; Thu, 29 Jan 2026 16:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1769702849; bh=03R050uQBvmIdoAMN0AlwZ2eOjWiJDoM0HJtIvzdtO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HAzRYo8VyJ0QDgQO5f/YcPfpoMqbILpK0hrXFRJ3HRumAC8rYTjiq2OAmtFMefp4w
	 rNry/iKMVSnmLPydegMs7lczLw8eefJqLvDX7hE+sm25+OLZswVb1Auq7X1JznMYLm
	 asAp+jfgjMIpnUDKF2L2A7JWxkaE5sQe0r9W01nkfLuuE/u5UVvqBLpyEMDfelP5dY
	 G+NvjbaSuUcCQ9TgJy91EmfHQaf4oF900+qL8d4lb8a7XreHMK+qKy4qdmATM4aDsu
	 es34+50ZizRwKYxuFChB8lXNly6ifEHE5qM+NSubwvV42MNeGwp1pjjk0LqRHa3CyC
	 Eha2dkhTVC4FgTWANGaooaSRIHee5j3C1I46svMjkciaQFAZsLgoMRZytDaQCZrozM
	 /TRq7lAyihYeQZEtYbxQxGBo+kzmK4+mRlTamNWT3+roA0eHBSMZWiL122hkRUqr4+
	 d7zQFBhTiZ0yUUulySLiLWAkvSCjhcU9uA0R8jjCIyGfAufM9DhWmyJM1MCJhOP8NR
	 Ys8Er2zStHPeG2zRzfwphofa+VxY7yZd87ZE30ZcRo+CMaVd+Ye21G+XB8iHD1nhtx
	 3lrR1LVmWyRE9DdJrKSsZ4gpX90SHjdY144dCCj8A+Kcmt2lHzPKwLpai+kc4QT2uy
	 lf2gJsNkZ+Da1ly9SBTZbQYA=
Received: from zn.tnic (pd953023b.dip0.t-ipconnect.de [217.83.2.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id A22AD40E02F8;
	Thu, 29 Jan 2026 16:07:15 +0000 (UTC)
Date: Thu, 29 Jan 2026 17:07:09 +0100
From: Borislav Petkov <bp@alien8.de>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Sean Christopherson <seanjc@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 07/35] x86: Introduce a centralized CPUID data model
Message-ID: <20260129160709.GSaXuFreAkumbetUYJ@fat_crate.local>
References: <20250905121515.192792-1-darwi@linutronix.de>
 <20250905121515.192792-8-darwi@linutronix.de>
 <20260116203117.GAaWqgFYTv1bHLxKV_@fat_crate.local>
 <aXdmc6F5wLthVDEU@lx-t490>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aXdmc6F5wLthVDEU@lx-t490>

On Mon, Jan 26, 2026 at 02:04:51PM +0100, Ahmed S. Darwish wrote:
> So the root-cause of all these "static" vs. "dynamic" distinctions was to
> catch call sites, at compile-time, when using the wrong CPUID storage
> output type relative to the requested leaf/subleaf.

Hmm, ok, I guess we want to catch stuff like that.

> I'll get rid of this static/dynamic terminology and think of something
> better.

But this is not about static and dynamic - you simply have different subleaf
layouts. And I guess you don't have to call them anything. You simply have
different struct types: leaf_0xd_0, leaf_0xd_1, leaf_0xd_n, ...

And that's fine.

The point being: we want our definitions to be as close to the hw spec
definition as possible. Not invent new things. Just use what the SDM says and
that's it.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
