Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787523839B8
	for <x86-cpuid@lists.linux.dev>; Mon,  1 Jun 2026 19:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780342949; cv=none; b=Nqmmh58xhO+OLOvZizzrfbp5YSfP5QNYW2+9FTtBuBDhQtR1fsFqEVlXAecbtqBRsXKtna754W494qqczmGnXzlm0fkFCJggj4RAwVwxCxyVmRAoymAnhGr2iy+1n90h1WSDcsbax5SOqqgVcQezTJamkGZOhtZ7TsuKaWK01Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780342949; c=relaxed/simple;
	bh=HM8+j+2iW1tf+LFoxU0MeNj4tR61G4/J6Inl0S9sFsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f1ue/N/0wRl8dXTa3r5xsOJytGVjUMq7DZERnukrvaOe94aM0jVfUic1+cpetY4M2AGlpWOLtxoeZ2zF6p03/ajTw0ApmWrpWUF1aOZLCZODb6xwva1Y5JsnXHvoGJ7N8fY1mzpUNqtZZUaSqwUklMZCFGZPARhUzU0Oz3ZLt4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=GatFbWtq; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="GatFbWtq"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 14BF940E0140;
	Mon,  1 Jun 2026 19:42:23 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id SF4OLfHHLAPn; Mon,  1 Jun 2026 19:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1780342933; bh=ZWpsC3NTrPt2gqv84MB4c+ihG6703dYQyQ/LPOSPS50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GatFbWtqVaNaqwGpLSD7xmvjwkw0ILeY4FvBar+wdJ1GCvw73qlSGEfpqkZuFTRZD
	 +9BpAs0PMsP2bXyHjNFpdMPblX+a+qClfikbGuMeBA9KIpGAjKYt4h6nEsLLIidTMM
	 rgxmQON9B9xfCHbWzA8oSFYCqqDUApUAkvwpsu7uEM3Y7NxaSqBMPjssSjHYw7BCEm
	 sPUamd1O9Yj2ZpYJ/bDIDQ+bUTL2nsmuSVjpnT1PKzdK/QASU1EGMpU6ewZJCzQzes
	 RYQjBYqgK+N+E2zEn5hNJ79I1kHvkZjfGCU52oyLmCYBkjMFAbikEv9NJN1ST7tMYl
	 E7aC1uGRcSv7AuO3y+p2NEcBASeM8yYkPv3tCHTTGVvOBjo3mjF9leQOSmJTAr5j2X
	 qMXa7grio8sZRdUeRxL2qVPxc/lHqQZSDkdZa0ie785gfLv28LP0o2lqN9sdL0GeS9
	 +umGsr5IrBKlZ1TdaKwyh0A6Q7O8FRS47aYv+8QX2VRwLxGBfYeqA5vuqzu1FlZ6vg
	 0WSPP+fxUGjUGlEbiqmNGs4SLtNduhbo1A0hFyjhM++jbNZsw5PTIsyW2GG00avlFQ
	 3I/FlcobaD17cR3SbPCowqG4fkywIB+y/9e+4DplzOGdE2rfoqm9JZkMW0HYWFfyTc
	 vFjALFSbJqEtzTXdureyCE+Q=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 7E8FA40E00BA;
	Mon,  1 Jun 2026 19:41:59 +0000 (UTC)
Date: Mon, 1 Jun 2026 12:41:50 -0700
From: Borislav Petkov <bp@alien8.de>
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: "Ahmed S. Darwish" <darwi@linutronix.de>,
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
Message-ID: <20260601194150.GDah3gfjoIZIByCa3d@fat_crate.local>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-5-darwi@linutronix.de>
 <ah2WBnBkz8KQrph0@wieczorr-mobl1.localdomain>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ah2WBnBkz8KQrph0@wieczorr-mobl1.localdomain>

On Mon, Jun 01, 2026 at 04:30:01PM +0200, Maciej Wieczor-Retman wrote:
> I know this was already merged in but as I couldn't reliably check 2k lines for
> typos last time with my eyes only, I pushed it through my LLM kernel review.
> While the typo in the comment doesn't matter much the ones in the struct field
> names seem more relevant.

How hard is to get you not to top-post?

> On 2026-05-28 at 17:37:26 +0200, Ahmed S. Darwish wrote:
> ...
> >+	u32	xfrm_x87			:  1, // Enclave XFRM.X87
> >+		xfrm_sse			:  1, // Enclave XFRM.SEE
> 
> (line 714, comment doesn't match the struct field - sse vs SEE)
> 
> ...
> >+	u32	topa_output			:  1, // ToPA output scheme
> >+		topa_multiple_entries		:  1, // ToPA tables can hold multiple entries
> >+		single_range_output		:  1, // Single-range output
> >+		trance_transport_output		:  1, // Trace Transport subsystem output
> 
> (line 774, 'trance' in the struct field should be 'trace' I think)
> 
> ...
> 
> >+struct leaf_0x4c780002_0 {
> >+	// eax
> >+	u32	f00f				:  1, // Intel F00F
> >+		fdiv				:  1, // FPU FDIV
> >+		coma				:  1, // Cyrix 6x86 coma
> >+		amd_tlb_mmatch			:  1, // AMD Erratum 383
> >+		amd_apic_c1e			:  1, // AMD Erratum 400
> >+		bug_11ap			:  1, // Bad local APIC aka 11AP
> >+		fxsave_leak			:  1, // FXSAVE leaks FOP/FIP/FOP
> >+		clflush_monitor			:  1, // AAI65, CLFLUSH required before MONITOR
> >+		sysret_ss_attrs			:  1, // SYSRET does not fix up SS attributes
> >+		espfix				:  1, // IRET to 16-bit SS corrupts ESP/RSP high bits (x86-32)
> >+		null_seg			:  1, // Setting a selector to NULL preserves the base
> >+		swapgs_fence			:  1, // SWAPGS without input dep on GS
> >+		monitor				:  1, // IPI required to wake up remote CPU
> >+		amd_e400			:  1, // CPU is among the affected by Erratum 400
> >+		cpu_meltdown			:  1, // CPU affected by meltdown; needs kernel page table isolation
> >+		spectre_v1			:  1, // CPU affected by Spectre variant 1 with conditional branches
> >+		specture_v2			:  1, // CPU affected by Spectre variant 2 with indirect branches
> 
> (line 1383, 'specture_v2' should be 'spectre_v2'?)

Send a patch ontop please. We better fix this ASAP before it goes to Linus.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
