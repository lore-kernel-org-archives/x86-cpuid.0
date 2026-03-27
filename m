Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E10B37FF46;
	Fri, 27 Mar 2026 20:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774643785; cv=none; b=TuYy+Tu+ynWFVL9CgTstuAT4wyj67+S137BwR0tPM1CXzncu1v3qfaORnOSU9FSPMF0oI03CHCnhjKewRfxRnb8MvdPU3Zps6Ps3kbuFCvGBtgHzf1FdX4MEfs+3c8O+dCftsJtu3AXHd84xu03gvsLvy7e25yWmOAdJCyrHlyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774643785; c=relaxed/simple;
	bh=K+3x6PtritfWk9C1nQwD73Ya4/x0FXHq0EqkCD8gGFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PAmvcbkresI5vPvaoXDA8GdZiGCuAQBDzupwe8/UW3ON16RsgzTD9RysmTlHsKc50kzgC3/hKDWZ6vr4QtxVwRWK5JfxhAQF1qkgJKqedbNfV/Oa1TL/jnE2ApfuiQMzYoUYJjeNafluggrFKVfiW/RSr4kPldctUz6m+eOLTxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bwpxDlR9; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bwpxDlR9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774643783; x=1806179783;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=K+3x6PtritfWk9C1nQwD73Ya4/x0FXHq0EqkCD8gGFY=;
  b=bwpxDlR9YMcSmsqGmgmUt2npDtVxrGI2rYYKftzAkivpAHbKlCu2WOHC
   duNrK4Jj9n1CwOuzCFePxcDN864fZEZccjPwx02/hZCoONF54tUeuIFR8
   nIfja1qblNXnZp2MyN4bR0nBd3CkyWWNqF4EEbCjqRXttPnypGBQ8p2x9
   ytYixxZjogJ5xN+nIv0ALXfM/OAClQao18IYN1CeqNP6wUhnmxzHdi6cF
   RA41rR3DZVQrYGfb4HLDSQFXro7SrTGvNjIXuo5M/9EOf1Kzy06bnXGwI
   kVt4FyHlzU3hXiK+tFebspnji3JwTK1EpoTCRMwNBfvx5s+wPjBYNPGoy
   Q==;
X-CSE-ConnectionGUID: Z4WDEqmJT0CU/ubVYF+y3w==
X-CSE-MsgGUID: Lf1i62LJRgGZkoVFyO4iBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="75837767"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="75837767"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 13:36:23 -0700
X-CSE-ConnectionGUID: 5h9g+1yxSHCGjuLUf+1o7w==
X-CSE-MsgGUID: /t6mi/JvTl6RnRPEiOcDLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="222544307"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 27 Mar 2026 13:36:19 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6Dui-00000000Air-0iAE;
	Fri, 27 Mar 2026 20:36:16 +0000
Date: Sat, 28 Mar 2026 04:35:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Ahmed S. Darwish" <darwi@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Sean Christopherson <seanjc@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Christian Ludloff <ludloff@gmail.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>,
	"Ahmed S. Darwish" <darwi@linutronix.de>
Subject: Re: [PATCH v6 86/90] x86/cpu/transmeta: Remove x86_capability[]
 CPUID initialization
Message-ID: <202603280449.C5WZiJry-lkp@intel.com>
References: <20260327021645.555257-87-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327021645.555257-87-darwi@linutronix.de>

Hi Ahmed,

kernel test robot noticed the following build errors:

[auto build test ERROR on c369299895a591d96745d6492d4888259b004a9e]

url:    https://github.com/intel-lab-lkp/linux/commits/Ahmed-S-Darwish/ASoC-Intel-avs-Check-maximum-valid-CPUID-leaf/20260327-215933
base:   c369299895a591d96745d6492d4888259b004a9e
patch link:    https://lore.kernel.org/r/20260327021645.555257-87-darwi%40linutronix.de
patch subject: [PATCH v6 86/90] x86/cpu/transmeta: Remove x86_capability[] CPUID initialization
config: i386-buildonly-randconfig-006-20260328 (https://download.01.org/0day-ci/archive/20260328/202603280449.C5WZiJry-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260328/202603280449.C5WZiJry-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603280449.C5WZiJry-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/cpu/transmeta.c: In function 'init_transmeta':
>> arch/x86/kernel/cpu/transmeta.c:70:9: error: implicit declaration of function 'early_init_transmeta'; did you mean 'init_transmeta'? [-Wimplicit-function-declaration]
      70 |         early_init_transmeta(c);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         init_transmeta


vim +70 arch/x86/kernel/cpu/transmeta.c

fe8a36b887f719 arch/x86/kernel/cpu/transmeta.c  Ahmed S. Darwish 2026-03-27  65  
fe8a36b887f719 arch/x86/kernel/cpu/transmeta.c  Ahmed S. Darwish 2026-03-27  66  static void init_transmeta(struct cpuinfo_x86 *c)
fe8a36b887f719 arch/x86/kernel/cpu/transmeta.c  Ahmed S. Darwish 2026-03-27  67  {
fe8a36b887f719 arch/x86/kernel/cpu/transmeta.c  Ahmed S. Darwish 2026-03-27  68  	unsigned int cap_mask, uk;
fe8a36b887f719 arch/x86/kernel/cpu/transmeta.c  Ahmed S. Darwish 2026-03-27  69  
fe8a36b887f719 arch/x86/kernel/cpu/transmeta.c  Ahmed S. Darwish 2026-03-27 @70  	early_init_transmeta(c);
fe8a36b887f719 arch/x86/kernel/cpu/transmeta.c  Ahmed S. Darwish 2026-03-27  71  	cpu_detect_cache_sizes(c);
fe8a36b887f719 arch/x86/kernel/cpu/transmeta.c  Ahmed S. Darwish 2026-03-27  72  
fe8a36b887f719 arch/x86/kernel/cpu/transmeta.c  Ahmed S. Darwish 2026-03-27  73  	print_cpu_revision(c);
fe8a36b887f719 arch/x86/kernel/cpu/transmeta.c  Ahmed S. Darwish 2026-03-27  74  	print_cpu_info_string(c);
^1da177e4c3f41 arch/i386/kernel/cpu/transmeta.c Linus Torvalds   2005-04-16  75  
^1da177e4c3f41 arch/i386/kernel/cpu/transmeta.c Linus Torvalds   2005-04-16  76  	/* Unhide possibly hidden capability flags */
^1da177e4c3f41 arch/i386/kernel/cpu/transmeta.c Linus Torvalds   2005-04-16  77  	rdmsr(0x80860004, cap_mask, uk);
^1da177e4c3f41 arch/i386/kernel/cpu/transmeta.c Linus Torvalds   2005-04-16  78  	wrmsr(0x80860004, ~0, uk);
3ad602b4fa9f92 arch/x86/kernel/cpu/transmeta.c  Ahmed S. Darwish 2026-03-27  79  	cpuid_refresh_leaf(c, 0x1);
^1da177e4c3f41 arch/i386/kernel/cpu/transmeta.c Linus Torvalds   2005-04-16  80  	wrmsr(0x80860004, cap_mask, uk);
^1da177e4c3f41 arch/i386/kernel/cpu/transmeta.c Linus Torvalds   2005-04-16  81  
30b82ea08c3365 arch/i386/kernel/cpu/transmeta.c H. Peter Anvin   2007-02-13  82  	/* All Transmeta CPUs have a constant TSC */
10cd5a1e5403d7 arch/x86/kernel/cpu/transmeta.c  Ingo Molnar      2008-02-26  83  	set_cpu_cap(c, X86_FEATURE_CONSTANT_TSC);
30b82ea08c3365 arch/i386/kernel/cpu/transmeta.c H. Peter Anvin   2007-02-13  84  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
