Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7D13D75AE
	for <x86-cpuid@lists.linux.dev>; Wed,  4 Mar 2026 19:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772653445; cv=none; b=hl7KcKhxz7c13ywcSY4yXmWfeZUB7tbHAGWTud9x7ORAZt0EsIt9WRxgpMdJKlhQxbWiMZMmCkzhszYOzXb+1bIhTAKM2s6zVbW7qumBKXu/LhAUrF0RkXAJAPp3c7FHRzew2vPXhm0wPRhfi5S/c9oy3XK+F+YF8kB7+2L/VwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772653445; c=relaxed/simple;
	bh=HgGxBtBJFuDkKIG2pu7B7RECk46T2sSCFu9YVbN2tu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HHVmTfn2jEOB6Tu+zCAuHiknr4aEc0aonYBsi7LPNfQV6S3Pw5ta72/mJ4KMCMo55/Jhik625l5JaRZWgKmNiodNLoZvtNpGqSrygwoTqakvumcjO6LnpkorfRL8O072PQMwMRFc/hhls5oAeA7mWMvIC8AnZPAjaUngaqmAwcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=GBoFOeue; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="GBoFOeue"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id B84AB40E019F;
	Wed,  4 Mar 2026 19:44:01 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 4FGeMyd6bCGj; Wed,  4 Mar 2026 19:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1772653437; bh=YRDcFAhL/mbopzYxWL3Tp6O49OCX2r8K/nShx72b5kQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GBoFOeueK3eJl9DVT3d9xs0O+u3WMq3B1eP2it0RuDj9uYO/RpkxBTrSwscPAG/vv
	 E7ubNzOouTKQBX0EjReU+l5vEkd87hpTXm5eLJ6Edo8ZNtwJYqrN9pOKP0vUL1CkLZ
	 Gp1uR5ugDa3ptmhVfG68d1uL3UFN9OnmtpPvIC8gGt4LQylUomiNTvvGu30l2ohIyx
	 cqvHDjtzHnyxdeDuFekB15jkuezj/qpC4Ngh6T9spA5nueLHqNKR4biITwzQL/lotM
	 gt+7F2f19xAt82+ZpQSYduaX93YvX7W2xNFBi/KW+uoAaUp+Mxv9oYf+spqEr5jWo5
	 NhA73r7UxWbAF0//DQwKz0gyicEZvHEGX+9qwqph1gUql32zBcmyetVqRMapQsdeXN
	 vW7H8bfDcgPkAqKr5pBoBhdWT6jT4hcuvq92BKSeBvcPlJWlihrjNMDKAcurirWTcv
	 Sw14F4tolNdch4abKqVDGnzEu5LLI3rrwZ8tZJjnwqIuLncDjy6YHi3M/mXISpZfET
	 FOkFs2NgnOH5YbN7cUZLnuzCxBvDXkTEmi+JlMqMmtsMgMHR89CA3Z1M2dtbTSv8+p
	 O+CF8O1lLkH6P46/sHsAFknaXr1NtUPNdOcq2yiZ7dCQtJ4hUX3V4+8reBLMTf4p6I
	 aDzKl8OF9Mm3hevsMuOEYRBs=
Received: from zn.tnic (pd9530d5e.dip0.t-ipconnect.de [217.83.13.94])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 11EF840E00DE;
	Wed,  4 Mar 2026 19:43:43 +0000 (UTC)
Date: Wed, 4 Mar 2026 20:43:34 +0100
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
Subject: Re: [PATCH v5 10/35] x86/lib: Add CPUID(0x1) CPU family and model
 calculation
Message-ID: <20260304194334.GEaaiLZqPuGUuBDWzi@fat_crate.local>
References: <20250905121515.192792-1-darwi@linutronix.de>
 <20250905121515.192792-11-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250905121515.192792-11-darwi@linutronix.de>

On Fri, Sep 05, 2025 at 02:14:50PM +0200, Ahmed S. Darwish wrote:
> The x86 library code provides x86_family() and x86_model().  They take
> raw CPUID(0x1) register output, extract the necessary fields with bitwise
> operations, then calculate the CPU family and model out of that.
> 
> In follow-up work, the x86 subystem will use parsed CPUID access, along

Unknown word [subystem] in commit message.
Suggestions: ['subsystem'...

Please introduce a spellchecker into your patch creation workflow.

> with its auto-generated <asm/cpuid/leaf_types.h> CPUID leaf data types,
> instead of direct CPUID access.
> 
> Introduce x86 family and model calculation functions to x86/lib that take
> such auto-generateds 'struct leaf_0x1_0' data types.  Refactor the

Unknown word [auto-generateds] in commit message.

> original bitwise operations code so that no logic is duplicated.
> 
> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
> ---
>  arch/x86/include/asm/cpu.h |  6 ++++++
>  arch/x86/lib/cpu.c         | 41 ++++++++++++++++++++++----------------
>  2 files changed, 30 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/x86/include/asm/cpu.h b/arch/x86/include/asm/cpu.h
> index ad235dda1ded..90902cd91335 100644
> --- a/arch/x86/include/asm/cpu.h
> +++ b/arch/x86/include/asm/cpu.h
> @@ -7,7 +7,9 @@
>  #include <linux/topology.h>
>  #include <linux/nodemask.h>
>  #include <linux/percpu.h>
> +
>  #include <asm/ibt.h>
> +#include <asm/cpuid/leaf_types.h>
>  
>  #ifndef CONFIG_SMP
>  #define cpu_physical_id(cpu)			boot_cpu_physical_apicid
> @@ -25,6 +27,10 @@ int mwait_usable(const struct cpuinfo_x86 *);
>  unsigned int x86_family(unsigned int sig);
>  unsigned int x86_model(unsigned int sig);
>  unsigned int x86_stepping(unsigned int sig);
> +
> +unsigned int cpuid_family(const struct leaf_0x1_0 *l);
> +unsigned int cpuid_model(const struct leaf_0x1_0 *l);
> +
>  #ifdef CONFIG_X86_BUS_LOCK_DETECT
>  extern void __init sld_setup(struct cpuinfo_x86 *c);
>  extern bool handle_user_split_lock(struct pt_regs *regs, long error_code);
> diff --git a/arch/x86/lib/cpu.c b/arch/x86/lib/cpu.c
> index 7ad68917a51e..eac217d637ac 100644
> --- a/arch/x86/lib/cpu.c
> +++ b/arch/x86/lib/cpu.c
> @@ -1,36 +1,43 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  #include <linux/types.h>
>  #include <linux/export.h>
> +
>  #include <asm/cpu.h>
> +#include <asm/cpuid/leaf_types.h>
>  
> -unsigned int x86_family(unsigned int sig)
> +static unsigned int __x86_family(unsigned int base_fam, unsigned int ext_fam)
>  {
> -	unsigned int x86;
> -
> -	x86 = (sig >> 8) & 0xf;
> +	return (base_fam == 0xf) ? base_fam + ext_fam : base_fam;

Please keep the old simpler code:

	if (base_fam == 0xf)
		base_fam += ext_fam;

	return base_fam;


This is way easier to parse than a ternary expression oneliner.

Ditto below.

> +}
>  
> -	if (x86 == 0xf)
> -		x86 += (sig >> 20) & 0xff;
> +static unsigned int
> +__x86_model(unsigned int family, unsigned int base_model, unsigned int ext_model)
> +{
> +	return (family >= 0x6) ? base_model | ext_model << 4 : base_model;
> +}

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
