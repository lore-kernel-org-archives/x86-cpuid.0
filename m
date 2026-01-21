Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E6832A3D7
	for <x86-cpuid@lists.linux.dev>; Wed, 21 Jan 2026 21:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769031989; cv=none; b=mqrSuzfLhBKit+X4CTCoPwR65zNEh+zjDaYRuacL471GoqOGDDFLMjmyRLHtKWTU/D2IXyQ/LbMoIO+7MPbyx7NDk2RewDd3s/MkLJnFL77LmTznUjsAkiVPSF6w1u2TFtuDEDbrVc4JR4syYXGNAkXJUKPVJkgyFi7aaric65c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769031989; c=relaxed/simple;
	bh=RxjkAe1lc6tpq2Vh1ZR69JDa2+qfbAphUA3sQxEiZH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t+6d1JW6ro3a7rz5pBkxyVadVTmqbUGoJzQ8xLKOHeO3UyXYfNgtOlBrEPZOvYBQDkJ0CpQUTh8uYzqWV1n/9lvait5Wa7F703sbAo1PlIvncpI53/U4NzTgOdseFpGAKyhHedVzKyNSNyvAq83bcvG7biALkRamVmlDWw0qoug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=F+Nq/SlN; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="F+Nq/SlN"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id DB84E40E02D3;
	Wed, 21 Jan 2026 21:46:24 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id mDuTENFC6xHa; Wed, 21 Jan 2026 21:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1769031981; bh=dWr2zp0aG5f1cpN7YYQL7Bo7b6KnwOXRZc/9W8kh5yY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F+Nq/SlN7nCmd2KRvONNCzz/BOaTgtBCYlAN4CddpHoOziuCclzinJxUgmhwBt1Og
	 66ED6Lzj/r+rWAVCLjTLaK0ZCwDpzTxdLazLMRwhxI2akyILnyWmOtkwN9iz1bHrmQ
	 fQMeMth7iiYZCtl0L74/wjMiNTGVCruu2nKcUUsylt+J9R38tAdfkuNIE5lBmWn3PM
	 DKZHYmxPPTlcgjw4EN7Jmz9dMKtEpSAwoMFN3ElWMrheRWAcg4X/2UQsmDf1RUpiFP
	 YPyJk0ZxefVP7K8ACQuURqXQozkTYzrbah5lP0a5/OM5hAisxK3lVgcrUzWq5J04Jr
	 /8/R2iCha6YZgOh0eKsvpHCijEfaZ0QuyX7lLwwapU//HZId1mPBzFBlFwlBKra4fp
	 xnBEjJ4CxUSK8Ei9EJiUsNkN3ddY6NEt05Ma/1UMJvU992Qh3Fp/qXq35R3sOakGUe
	 p6FKrHL0mzB/HagzvhBLqMIYKCxyeJvdD5yNTDTN/p6RndIIUFRKsUmmiV+E3h0ERC
	 oW9m4sy1/mLOpMhClRPXXq4QLPkNpOSgFlZtqpDyldLNOvykin6bZuREz9k22wR9P7
	 K29R7FLt2XUCtIwDdNz3/cpdkfA1ZN/Gvo/0JnQol91ogTyCiQZgdhMZO3ykiJgN3X
	 rCayaN+e0jGaKyApxdBOcq9o=
Received: from zn.tnic (pd953023b.dip0.t-ipconnect.de [217.83.2.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id F197740E027A;
	Wed, 21 Jan 2026 21:46:06 +0000 (UTC)
Date: Wed, 21 Jan 2026 22:45:59 +0100
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
Subject: Re: [PATCH v5 08/35] x86/cpuid: Introduce a centralized CPUID parser
Message-ID: <20260121214559.GEaXFJF-EXVBvyMCtm@fat_crate.local>
References: <20250905121515.192792-1-darwi@linutronix.de>
 <20250905121515.192792-9-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250905121515.192792-9-darwi@linutronix.de>

On Fri, Sep 05, 2025 at 02:14:48PM +0200, Ahmed S. Darwish wrote:
> diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
> index 34a054181c4d..43582d7e167d 100644
> --- a/arch/x86/kernel/cpu/common.c
> +++ b/arch/x86/kernel/cpu/common.c
> @@ -1729,6 +1729,7 @@ static void __init early_identify_cpu(struct cpuinfo_x86 *c)
>  
>  	/* cyrix could have cpuid enabled via c_identify()*/
>  	if (cpuid_feature()) {
> +		cpuid_parser_scan_cpu(c);

Or simply

cpu_parse_cpuid()

:-)

Plain and simple.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
