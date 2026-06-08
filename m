Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC22F3C989B
	for <x86-cpuid@lists.linux.dev>; Mon,  8 Jun 2026 14:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780930191; cv=none; b=Pu1Gld+sbp/JWiwSs+ICc2GZPQO+VC+NQEYJ4Fvc9y+gxHos16x5HFmhjH+FbaalyLXXqbLhqZMDjJZN+Ksun1LKt8t9bcqIi7Q+FvHeahbCID9qh6h5S1rR73swxb0iP2MC03+Pnvc6DH1B1B90M8dg8SxreblI9LVDWRyH9LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780930191; c=relaxed/simple;
	bh=m9uBPX5rEAWO+dwTkBNkfkQ2KIQTpfgOU6143ONopnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PNf5Rf2hT6uwb/KgT6bY8cWsqaBmD7nmF2Wmsnra/rJSyuu4vLh/yov797q+NynBg9v1dwX1fzSjv9T3XsaxyzglrfwmkRgw5w9RBJl3SCCMcJqkmEXejjmPJ73YwEVoR7iZe5j1MGDZi3Fxn6sOcV+z4C8h5g9dYPZc34h2t38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=S7YbpxHW; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="S7YbpxHW"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 7BFDB40E0214;
	Mon,  8 Jun 2026 14:49:47 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id XFGob_aB89oi; Mon,  8 Jun 2026 14:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1780930177; bh=v898DU2rZQTUsLZvngWvMOFD1Zm+PJxbYrnxpA4yW2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S7YbpxHWu1iIEYyJis5tyt3Gbb9/0O0BOkJN6nZCQ3psYHcYnmCGRndndIWsa0GBj
	 kjHrlE40oklUxxsgjT9EeAV/ATYV6Fbnq+coFDs+sFiSkdCdnx4dVwrvOuSBA6kAXe
	 cGNsXSgKrd9JF6V9kTeWvP6DvbQ0Lmb4cOg0o/aHhUmeRu5IrixvldtbJ9GLMWxSZv
	 0HrfYVn5aFjIh5tfy5xdfnArxiRIb6fIZzeEJa/J1vYHpeCN9sVGYm1FpYaA530Ed9
	 1KjbuC4Tq1j0A3Osx4jGfyp86RTg8gyNjvVbe/rP9TFNGg2KouxpqGLZ0W5ikXT00C
	 ZYo2TGAaF+S9fjzflronSbiCxmyfYi3DWxnkpKwCzRbU0kVkUz3jjkK09YVFc7zkaX
	 kyiJuN9ePPDInu2AKdaFP5ISW7M52vP2rtb7PBE2USdKuvpC3n8sJ/TtjmESSclefX
	 biA/+2KT6lWTmDPHl7b26M2wSYdAvXWcVoWW3jzxmk5eiFDsB8CUI78qNdi7z7yghu
	 4b4MOQaRkrMXWgHCthyZrdZv64+Zk/VxQC8mRfzQZfUCCZip4TObm5B1s5h6oqKDpe
	 xMlsMvfuoYe8z5oqDV2DMBnPNC91Y/0N2kSbKd1cYNETV1sQug7wcYiddA8QUjNlF4
	 8RkAxTlDXotU3YQmpa/7XW8E=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id D17E440E0031;
	Mon,  8 Jun 2026 14:49:23 +0000 (UTC)
Date: Mon, 8 Jun 2026 07:49:20 -0700
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
Message-ID: <20260608144920.GBaibWcLl3BUAPL8XW@fat_crate.local>
References: <20260601194150.GDah3gfjoIZIByCa3d@fat_crate.local>
 <ah3jPMYIxC1vsUUB@lx-t490>
 <20260601203452.GAah3s7FevsRDFT7rF@fat_crate.local>
 <ah34pi6j5HSMJdrL@lx-t490>
 <20260601225306.GDah4NUvJwaqQem4VQ@fat_crate.local>
 <ah7_wPJ8_FGLOwZd@wieczorr-mobl1.localdomain>
 <20260602174746.GJah8XQvEJo9UKru1l@fat_crate.local>
 <ah9H2hxkMPMeuF-o@lx-t490>
 <20260603003129.GCah914Tc9sEpO4Nxl@fat_crate.local>
 <aiZjpPCTsz4m-1O3@lx-t490>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aiZjpPCTsz4m-1O3@lx-t490>

On Mon, Jun 08, 2026 at 08:39:32AM +0200, Ahmed S. Darwish wrote:
> I guess that's everyone's goal :)

Glad we're on the same page. :)
 
> You mentioned that several times.

I do sound like a broken record sometimes, sure. Better that than dealing with
nasty luserspace dependence.

> How can userspace depend on an internal x86 kernel header?

Well, the recent futex snafu teaches us again that luserspace can depend on
anything in the kernel.

What you're doing is a database of *all* CPUID leafs. How long until someone
copies or exports the header to something? Or starts generating the header
from your XML and using it in her/his project?

And what happens if someone has already started using the headers, you fix
those spelling mistakes, release a new revision and someone updates the
generated headers locally and code starts failing to build all of a sudden?

What do you do then?

I think with issues like that which can cause nasty workarounds, we cannot be
urgent enough in fixing them.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
