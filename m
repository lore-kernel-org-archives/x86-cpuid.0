Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073C9391504;
	Fri, 27 Mar 2026 20:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774645143; cv=none; b=nyD/9PeIivPaholbndwfL4ISm46X4o331EAKzKLZ/rGHynPRcmtkBfg8+JWF8ciXjAyK3zNIkOCDIUf0Cumj1gmDFCpucWIq50/ZkOn1hJUDUP2HZtp/VsffE6BflCp81q9V5yj+Qr6g5b+yW54MmVdVSTSUJ328IUyYJ3ZIHwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774645143; c=relaxed/simple;
	bh=JJOOXqCVOd6mcldHJfUPNs4DwLXJnmnqs72a5d3LhDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=skI19pATK4+maV3KI6FqhcW5+o+leUp+J8kocnx0xnIEmC9O39MQaS5tH390FqIcOojPe5N7Op0hhIfcIH4LN2DkgaHIRv2LS3FyuVUwvhhYAotiXlOLhXASgKaOebLAI/VG5tw+UTiWbZZzCdHu/3d0bX4B+dLZaN1qfeQDgSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y4tZQns7; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y4tZQns7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774645142; x=1806181142;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JJOOXqCVOd6mcldHJfUPNs4DwLXJnmnqs72a5d3LhDk=;
  b=Y4tZQns7qHUde46XClqJQbgcNaLCCHLPrNZEe9JIGQGw6kxD5dVmYSj9
   EBFs3E4CRFBYDVKnIAE6NGTt6k327Lb6cCY0u9B/hl6nMJzRssWDY2mdv
   p4JiK8hkVQ6otgSsTjGww0l2LSq9o06p1q6oejvG8oDuocL+X5RDRF6sZ
   eklDBlmJrJBsAbMn20EcYLNeQfBKfdp+AkSDgucWJZlV3/asW7obPpKET
   ssCtorbGP/Mw4g/TgqyLNz2hWvdSQvqS4LVlOCi/RFomrn568NJq/6kby
   0dSAXO/TWFkPOxQ/ay8CRmj5PB++uQC6JNtjNaoo0uoMx6bW9BGdKLUuN
   g==;
X-CSE-ConnectionGUID: wIWG8HBfTReJl9g8Z0pkgw==
X-CSE-MsgGUID: su8AC+HST+WwuzMf9zEKWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="79332724"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="79332724"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 13:59:01 -0700
X-CSE-ConnectionGUID: gLMdbSD2RymdAO6zRaqdPQ==
X-CSE-MsgGUID: 4ZUXigKaR5uaNyN9fsTYXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="227024194"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 27 Mar 2026 13:58:56 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6EGc-000000007Y9-1aXL;
	Fri, 27 Mar 2026 20:58:54 +0000
Date: Fri, 27 Mar 2026 21:58:14 +0100
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
Message-ID: <202603272110.n460HyzQ-lkp@intel.com>
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
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260327/202603272110.n460HyzQ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603272110.n460HyzQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603272110.n460HyzQ-lkp@intel.com/

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
