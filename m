Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0930B3E6DDB
	for <x86-cpuid@lists.linux.dev>; Thu,  7 May 2026 10:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778149090; cv=none; b=jX9KLuHZINkfkTHlkVyBhwGlDPadp4r9KP4p33h1lAmw6yawvPoD26zaG/Y9NGR5v2uG5A9VyQUGo/vGrMqcpLGOU+boAjSdCTUpqkXOM1gMjd+lBSkG9UafWBu38zGRVLgyrrBRyqmO1QQiaeBdw3QiXOcrQJ6UkzxKdhbvELg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778149090; c=relaxed/simple;
	bh=Rrl7YFQPHji1N60FPl2P8oJxoTeNNeiqKAUJwI0BsrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=accWOPiXfrhI0TyiFUwgx2Kc15VuvQgR6HOdLwY5GlXl8AwcCfmFbC+SSIX1NzrK6oXQY/FXfYC1Mg4vTbEPiPwNiCUBRcqcoawEJtru9OFk/QdJ36GCBAwN+vEC4djiEYFravA0xt/b9zS7sLhqhyPwyLiqiBb3IaczAr194pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=B9VexACI; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="B9VexACI"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 3B1B940E01A1;
	Thu,  7 May 2026 10:18:05 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id GQXZjmtNNkwJ; Thu,  7 May 2026 10:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1778149075; bh=o8TTg/JyM55QMa2Cx4aPzfxYc2gu3QuobyetBo2VxZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B9VexACIx2z2+lq0AhAFm9V0RjuXpzQxH7g7wUo8uJhyNSz4hQGv2pRJNt1o5p/6a
	 vi5nTFm7wfqYVbnSdpLSsk7cGlK/jit0I7denVfrstbmVH+b8avMFBaFi74HgPLUF+
	 73mdKnNoVL7oX7wy5VcX8mqFeVVEVkqQx2m/fy0td6sBLSWYu3lZ2Mu5cmUTkua/ms
	 IjoVPhncZDXaOOvIJ2WJBSHbPXWI4mYDMbJmch0wG51flJoiWwe+yU8twTEWQg5bNC
	 QUD1NN5A+oDsFS4Gmgqgz3AuRY9sqGczSmAm9SbYakv2w6N99qeFBOybiyPRjeXwgk
	 GcNyqwvltza8lFRUQj2xiuEt6b4uYw/9c3TwkFBSPqv3I0WAT0TH23c/xfGx+rQuUe
	 0WiCZfyU3J4D71Lu3vCjn29acVcT+HqoNw4pBk9GSmb74Wpe44Z5gypu+cssx5tKpC
	 cJtVbve2jlM3fGAva4E9kqr2fSDR4lbTcARqfBtS6chTDSRuuH8KxKmBcjvNee/gXe
	 EeHzU+npqioiTxS+p+tBvFEzwW/xpxtVp7ORoX1htiy2b2pqP1VLSJHok3udkCk5e4
	 PrA5shbfkhq7NYwBDTiIn94JquFXMAtWMXmuaeFSaDbHizOV1/jNM0iNg+mXhupeaG
	 3qzaQpn7OooiIJ4G2Pan73mU=
Received: from zn.tnic (pd953014d.dip0.t-ipconnect.de [217.83.1.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 15BA240E0140;
	Thu,  7 May 2026 10:17:40 +0000 (UTC)
Date: Thu, 7 May 2026 12:17:32 +0200
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
Subject: Re: [PATCH v6 00/90] x86: Introduce a centralized CPUID data model
Message-ID: <20260507101732.GAafxmvEcQ3W3UHE1j@fat_crate.local>
References: <20260327021645.555257-1-darwi@linutronix.de>
 <20260327152354.GBacahCioljpw5QqUc@fat_crate.local>
 <acrBBFyU_vi4zFOx@lx-t490>
 <20260330230836.GLacsCdDkVu0H3XU4l@fat_crate.local>
 <adz3z_MaWJr_GOtc@lx-t490>
 <ae-uw9836AJScRsq@lx-t490>
 <20260505133350.GAafnxvtgFxJHth8WB@fat_crate.local>
 <20260505151242.GDafoI6oOOs9hknrrK@fat_crate.local>
 <afup8Zf9cmmACdoh@lx-t490>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <afup8Zf9cmmACdoh@lx-t490>

On Wed, May 06, 2026 at 10:52:01PM +0200, Ahmed S. Darwish wrote:
> For the /current/ scattered feature bits, the array which maps them to
> their hardware backing:
> 
>     static const struct cpuid_bit cpuid_bits[] = {
> 	{ X86_FEATURE_APERFMPERF,	CPUID_ECX,  0, 0x00000006, 0 },
> 	{ X86_FEATURE_EPB,		CPUID_ECX,  3, 0x00000006, 0 },
> 	{ ... },
>     }
> 
> is needed.

My assumption is that at the end of the patchset, scattered.c is gone because
we have *all* hw CPUID functions present.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
