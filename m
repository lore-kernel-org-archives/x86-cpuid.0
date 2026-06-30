Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F343D386C24
	for <x86-cpuid@lists.linux.dev>; Tue, 30 Jun 2026 04:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782792353; cv=none; b=AgnF6IL7xxgbuboJadcFFzmasoPPI6ktSmTsqSPuoAo+w4n85M0jrHDYkiG+46yKjy81y4M4+YIzugw8OF6U/mftfDoIl5ZlKvPE7AXmgI5lB0ZyDfngVyfapCvPUxR7A5Vqu8HGgclZSmWgch7dMZ3SM+OYOJuAliITpUUbC3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782792353; c=relaxed/simple;
	bh=qHcHXwSJ3r79RkFKPXuIka44u00gnAI2NNMvtPpvPiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rohPFMsQgfAt+7JuN1qw4Dq/+JnRHy32zJrtmH51WSCbZZBOgzOFFuDRiVJuV5LaBdFEy430BOisG0NHTwOYAsQBsYPcXnmcLARYOAWcsIUupLpfH/6YcE1lPDQHcA5iIUwmeloiq0GpE9eeSXU1AEoj1XywGPCM9EQOkg2elrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=FAgT+FEH; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="FAgT+FEH"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id AE95E40E01CE;
	Tue, 30 Jun 2026 04:05:40 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 6qAEAv9uARxV; Tue, 30 Jun 2026 04:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1782792329; bh=73uaMyQVUbXu4+gxZkcjqQRfDInNML7z72vLI/9bTjY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FAgT+FEHESvVzlyrceCshkyhJkUJoX0/hQBmEjvZP/GLLYzBXwm3BFSM7y5OTC+Cb
	 1QU4oaLyBGs53DwbuhCnUj0kZlcfZKyWnsYIlIV152lhxez1mLbg9B08GeCuDnVMvb
	 m9eAgmK2nLZklYsDYGiEdOh7bROg1uttyBACP1vJo8T1UBA57FEttIBrc8PFqFdfcT
	 P7dI6mWNjt/oc2tdwOL1L54yq1Dbj3vn49t9FChSAxjLkGziccJf0oFt2h0bp4c3S6
	 6wCCMI0OsvGFoV+gB9FG+wSP0OD14ZipXLXM/ryrp+p5kqbKJ503GGMDwo0smiCn1g
	 Wumi9dc/velRh+L+SwLYrCMfjdYo08B85VFUO9D5fD3B0z8gz4gv5CG15LoFetCbXa
	 EwKn5Nn7xWaDI2oSElMYVFbgLa9Y0foRL+onKDfTwweBYEqaN/g9JY5dWVcErKdpsU
	 /c/I2dT2GzQDM02QV+WIAqPzPLPid3rFDTRfI3MpJ5xVMV/GKGCQ+YV0i0906/8yAg
	 SKs6D+ai5qblpDZTWkJKa9n2nV2zq0LQ29pVRyiS9wmulbJs825nz2pGutmEU1mLyF
	 hHDRaeBIigpK+uV9xA20zaYhxaHd8zDDWNeD7xHTl+QCYvd3ROgXUN8SUBfVbrER8p
	 rriLZFNv47O9uXftr2zjOlxk=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 4D3AB40E00BA;
	Tue, 30 Jun 2026 04:05:16 +0000 (UTC)
Date: Mon, 29 Jun 2026 21:05:12 -0700
From: Borislav Petkov <bp@alien8.de>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Christian Ludloff <ludloff@gmail.com>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 023/120] x86/cpu/centaur: Use parsed CPUID(0xc0000001)
Message-ID: <20260630040512.GAakNAeGJZAlmQjxeK@fat_crate.local>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-24-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260528153923.403473-24-darwi@linutronix.de>

On Thu, May 28, 2026 at 05:37:45PM +0200, Ahmed S. Darwish wrote:
> Use parsed CPUID(0xc0000001).

You already said that in the title :)

> 
> Beside the CPUID parser centralization benefits, this allows using the

s/this allows using/use/

From Documentation/process/submitting-patches.rst:

 "Describe your changes in imperative mood, e.g. "make xyzzy do frotz"
  instead of "[This patch] makes xyzzy do frotz" or "[I] changed xyzzy
  to do frotz", as if you are giving orders to the codebase to change
  its behaviour."

> auto-generated x86-cpuid-db data types, and their full C99 bitfields,
> instead of doing ugly bitwise operations on the CPUID output.
> 
> Keep the x86_capability[] CPUID(0xc0000001).EDX assignment.  It will be
> removed once X86_FEATURE translation is integrated into the CPUID model.
> 
> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
> ---
>  arch/x86/kernel/cpu/centaur.c | 25 +++++++++----------------
>  1 file changed, 9 insertions(+), 16 deletions(-)

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
