Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276C8362138
	for <x86-cpuid@lists.linux.dev>; Thu, 16 Apr 2026 19:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776366994; cv=fail; b=TG5NpX0bFhps1EpcUyrALAjUtqGltCnuHca70bCaAdvQ8mo4VY1h97HFl9TUPTAumEu+vJVlAH0mfALcjXY/rM1ryAVnx1I05zhk7/s+KD3syWoFAkFbuWfm3cJk4i2J+sisBXY2gMutwj77B8u4zzoyczQigVE/2irYpoR6IlQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776366994; c=relaxed/simple;
	bh=8XVD90wc42dsyD577RGLQb3Eb4zH07VD0zhNTA1VP7A=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bALRljo8yK1wUsrNm+ko7ovRCHyhfQ87SNapqv6ciWOoCOV/mSdXphGvAZKhICM1NgSUMaRBgSJx8q8Hk6DYBoLFFDDAtZB4Hft7+897ewziVNu8R20bAijKQFzl10OP7601EI9LKROJHzXkGKpIz75lbZe1w5Mky3FS4lpkY2g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hwgmKXEC; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hwgmKXEC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776366990; x=1807902990;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=8XVD90wc42dsyD577RGLQb3Eb4zH07VD0zhNTA1VP7A=;
  b=hwgmKXECqNRLggmVgid0MxWL/KXFeezZ7X0YKdJJ3gQah9gkIPlhur3h
   K57SDbyLGrCxCGeeUmEAgdn/uiEuU2Sh7e+7YJK0JMoEvVFKVYPqw5fFM
   tgee9EHxAs2C3elVqsPXsVkva8sLHN0qfvCAsk881mDfKACcXXVO2PhOB
   79iQ4BlD0F/cT4qEgtEP+l0GEoRUicseFXc/jo1Z4xdlovIOT4N5KcpNE
   dz2T/i0BsovyLm8w3Zl067Kmh4HLTKb/wOKJKjh8S92hoaUC4aZaKmaMs
   wD+UeL0UVkE3LJodjcgO7skiW7yMF3BxZiVQkTgl0zQxsbwCMQtbZvwFm
   Q==;
X-CSE-ConnectionGUID: fttwJTa3QRGvuSa+fppN+A==
X-CSE-MsgGUID: fWXQ6U0oSCeEFSDqBdOMFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="77495555"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="77495555"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 12:16:28 -0700
X-CSE-ConnectionGUID: E7i44678RF2kN6ri3SoALw==
X-CSE-MsgGUID: a0A+lFAkScSQlTdtDH48ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="229977840"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 12:16:29 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 12:16:27 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 16 Apr 2026 12:16:27 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.37) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 12:16:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gvMB/6iTU0dSf2n360WaNi/Ctu6NLjvqki25PJk9uVsZoGoJXPzy43tUN/O9TJba2+i82CcJXwlK+Q6ouWHSbP6ZnAlczrwO0X/PS35rebnHZt/CjdqFiUgeN+nDcQwYr2M8sPPRebB/ItDa4llYXd/l6JrXg+lPOOJiMTKl1IdSj7kG+X0hVM91NJkAavIKY/XzSdvqa93yC0kicPdDWQbRFEFOMP1srASNmdSq06P/wCiXOKxcRC+3r/YeaNjZgv2cJAVpoVUXyOpfHkm80XQ9qgrtZjn91Bw3ko0YeCpEpyK7B87ZHnSMaaaJ8gk3DcUxXwFJ/OwkphfzfRR8lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C3GikusXuZPN1QS2AeiuBwq6oQ4NR77pOFKdDehDrd4=;
 b=mg7OmR2gKa+7fZHzvz2K4k8Sf9ScyJYcmfK0oPoeyo6V1qfiknwN7Y1NS1eBxCzkHlDpJ7xSKU3hkiJf9EoXODJt1H6hxrJ45SQFa45rOUpgIvuSs6MgrPoCyyll4AvYv5ielX5eWMwTZVOs1aKuEbP8bCri98db9+mCKglXcH+qBB/Hwm1WPyRYp/bpXWX5PTPSEVF4qiOOtaQZ22pBZNFnovG32bjjk9UpteKXjf8G8Es8UU7aKQyfhWtvYuZoNa+aq7tHc6s9qh79HLOHHjfso1oCc+483Mu+k17Vbfsrvfgg8LdN37rLam+DwrWqs1vL/CbKIIssfVKveOvvNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB3282.namprd11.prod.outlook.com (2603:10b6:208:6a::32)
 by MW4PR11MB6885.namprd11.prod.outlook.com (2603:10b6:303:21b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Thu, 16 Apr
 2026 19:16:22 +0000
Received: from BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19]) by BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19%4]) with mapi id 15.20.9818.023; Thu, 16 Apr 2026
 19:16:22 +0000
Date: Thu, 16 Apr 2026 21:16:13 +0200
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
CC: Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, "H. Peter Anvin" <hpa@zytor.com>, "Sean
 Christopherson" <seanjc@google.com>, David Woodhouse <dwmw2@infradead.org>,
	Peter Zijlstra <peterz@infradead.org>, Christian Ludloff <ludloff@gmail.com>,
	Sohil Mehta <sohil.mehta@intel.com>, John Ogness <john.ogness@linutronix.de>,
	<x86@kernel.org>, <x86-cpuid@lists.linux.dev>, LKML
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 33/90] x86/cpu: Use parsed CPUID(0x2)
Message-ID: <aeE0Vh2SqPMYgu_d@wieczorr-mobl1.localdomain>
References: <20260327021645.555257-1-darwi@linutronix.de>
 <20260327021645.555257-34-darwi@linutronix.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260327021645.555257-34-darwi@linutronix.de>
X-ClientProxiedBy: DU2PR04CA0173.eurprd04.prod.outlook.com
 (2603:10a6:10:2b0::28) To BL0PR11MB3282.namprd11.prod.outlook.com
 (2603:10b6:208:6a::32)
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB3282:EE_|MW4PR11MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: 2009e8e6-44bd-4188-437a-08de9beca52e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: qx/QV8HJzUuTjmpEsBiWUF6R66lErrUi3uvKHYaeZSa78X8It+BkMeNKEdnEuy4NNXdg3CyJmLPcLh+1MJho2f9wcVpCSUsIFWSez4wkATvLyojRsl3REVM/b9shQDJcH0wk/GFVIbi2KxetxZeH7bHQ38KfbF7CJvmmkZCGXmDtlrH5uKFoykEVdl32Da8KaA1gKAbHUwQD7mP7Q0I0Ow4LeOgxVmKrkyC63MemIXw+GwXzEbvPqbrjsd/lquz1l3ZTni5akVV8kx1lVk9+RsQ2iX9HdBkGdPG301NjauFFnX0mrmskymq5iWMVl5c8nMjmXi47a88fYxpmhHKeuEJaj5IUXtR8J2c6RdQeWkBTKRMsqlPELxqURjjT068bl/VCpBsp1EXFWFOde6sHtIArTHqAnP1oSJiBccE/BUW9Jz7LTBSapCsMylGCBHkAYQi+MKTNS26cQbrjOOSDx9SLyqOzZJC2vCNNWPklH79pe+tIdTKu8ZX6NXOJsR2ihKHGiAzGMwihWvUyXDfCDc/5agPoLis1VcZNSuuH/N6CwIHSbeZxwsRTQLgjZJK5ozUmmMOMIo48QxK4XgKk2fOQyLmES/8K33dpd/8me1AFM+87mZIDB7E2BF9E+OgRE58VODy2d/OFgUyMX5JdfPebRlsiqRcO8x6QnoaWyrg4UCPhdpWv0jnqXKWwkKeWTo6OW4G4B4cawGSAG7nG66fC3kDd2Omi9WCj71CtA1E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3282.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?UBDS2M83l5vWF6nCrDkRO77IaYO6WMCaE/RVuXMdKsc7Xj3Zyzz9zCKL70?=
 =?iso-8859-1?Q?VpZT7twEL+n7aBN+reLlm2epqv4iuJ6b+ZIXp4AACh8Y6of7eWS3Ip3YZ7?=
 =?iso-8859-1?Q?J8OWpZR3eKd8EWOotdOSWWYHrTVEN25xIhqfOjjqhj4swrT13GVF5gGiIH?=
 =?iso-8859-1?Q?de8emcTRanzOnw1PqzQcP+cQXwcLg9cDLUDXXoZZ4Pj4eTEzIiYpLykByf?=
 =?iso-8859-1?Q?wLShYGaA3DIiMDFQ1quCfduFXaj05B/GjdCE85OwvfsdCKtWIZgwY/ILtG?=
 =?iso-8859-1?Q?Lfhzic4VKwO5j1WojscIvkvpHqcBWuYRyMEuP/4QwmcCAkhN0fisTyc8/T?=
 =?iso-8859-1?Q?yyx7nNQw48q6o7yidkxNLtWpmmFl6OyyellllCWBHGRJG4pKRrPNzj27w/?=
 =?iso-8859-1?Q?NsHtd9Fk1aSucjCx8QuorcbeDB+wCksBe+CvBecQBLT7W9INTYuCj++7Kt?=
 =?iso-8859-1?Q?F+7uwHyCnnWL3Kl0+Bw/8O+EQrDEiIrGkZ0JvmQfoe7LK04NqzNscn2EVp?=
 =?iso-8859-1?Q?MX/7F1ON2UupRDemeoLsmNTsYbYpjIm16S87oPHz88HwFZJ0g2+9+r0uCs?=
 =?iso-8859-1?Q?yw98U4DX2PFOE0ea+9fL+IT20r6yQiy8UYjDmEwyjGmx16heazfgkMmS5m?=
 =?iso-8859-1?Q?Cnjup+7czOov4gKkqLAf0a1BuDI7/UkxAkjISvB2EsVdHch5alDdbOcI+U?=
 =?iso-8859-1?Q?xpqgW+ZvPt5dyGgI5TZlUs6qhqDZbPHOtUM3Pumw2YhwRMZbRmlT/mAZC2?=
 =?iso-8859-1?Q?zhpH8J30aTDH0HB9+SxD/la6RPgF5pXOsiLNfVVQi8ww4my9gBljvBOXNU?=
 =?iso-8859-1?Q?MoE1P3rvCuxXXRIPlUYDJc2hO9g6Z02k7fgc7282TKyvQ9RJDtDYsJ2M6i?=
 =?iso-8859-1?Q?aB2EtBHtQzgerspygbSL4x1Co3wYPGIp7jqGgN8nwpTkd2CjaFhucwNWJb?=
 =?iso-8859-1?Q?kjil3jk181AdRfSgDpdu5wT/3c7PTXXV5ncVfuc16Os7gygs+7rM96mDq6?=
 =?iso-8859-1?Q?9JKJMHDSz/jrxpt7m8sxJ2EogpVBZjeLinBqZukrWXJfCZUQi9YPG/3qo4?=
 =?iso-8859-1?Q?Jq05+m7Vbcr7e4TCu+CDnc6RX2EWtN0buZjbqfvPFrhKcQZdwfBUKtDlvN?=
 =?iso-8859-1?Q?GOXGYbexW4Byc1i8IS6EoEF7i3QdrTbbR0SG4lG+qbJ1vsCKotPrE/weV2?=
 =?iso-8859-1?Q?/m48NPuEbgJYlD6IRsXTX2THkI6aXye8rX/wa3XOr3S//8QTMvsixyDWfp?=
 =?iso-8859-1?Q?zjul4Ns0reiQGeu+7k3nFcxJUzuCk92yOnBNoS5M6keMN7ThiQcawdvuR/?=
 =?iso-8859-1?Q?PEGuLcFCdfa3i8qGmu6q1DFNb4qawMSsEd+y6307vy90RBDpNsARfYSs1U?=
 =?iso-8859-1?Q?TEPHm6RXDqlwoUI0RjYDHyuduCrMNaDXs72TsxICGkEa4v5bCKCaAokL/9?=
 =?iso-8859-1?Q?L6Hc6RwbLecxwpUT3IWg226C1ib2nCnCLxq49UnTj7ytgrmsc/DMDtmhjB?=
 =?iso-8859-1?Q?8jOukhPaI7WOtagdr1XNyG+Nt2zsjd4qki5zvYesRWVSgtD/l/hzQ5myOj?=
 =?iso-8859-1?Q?ChTe7sGoDJXHfoGuG5UVS0EYoOQsPjt50j79s+owwBzSuK23shSh05RkdI?=
 =?iso-8859-1?Q?wNtj9iBwdrYDx5yJjhQdUvDpC1UphgaFDuj570iMQe61tS0qagTlZNsWDh?=
 =?iso-8859-1?Q?0IFTczlbQz71m4jMZwoX9mezSuCo7J3pOgR8JkFA9hciNpS+qkGj91/8xK?=
 =?iso-8859-1?Q?grFCzI+Qnjkzahb6vf9L4wmuifMWUEBxum+TkVYnpR4IAEkNz9o5rDjQIJ?=
 =?iso-8859-1?Q?4r2ROfJTRsJN8HMZH7w2b2Wegcczh09d301Tm9QJ5IIDpzoQJZf5?=
X-Exchange-RoutingPolicyChecked: PIUBPduzPFlWTbCRux4A0JBIcokZPVYa3FW85plLdnpQr4nyHXGE5UnAYK+ADI+3y5nts9DDumCvtA0QmML1IJ9p/P47XI0Zh84K+ceBMJJIuUSHF4lwJZQ5OdU1e/WclhWl50VPRr7lfpxZpvKQonJPb2yddlobPlCcd4inVxjBSGIW4MTDub+1g7SLu9q5Ndg+Ewr2oRxzY8ARmsm1HZfjQFTQupZIckLcPhDz1nLkOq9Qzid1kV8YRxp+WvT+k4ZshvRnWXOcUVdWGjh1fl9mXxZ+DLtWMDraiQPXAx0Cy/r7UuuzWsnZ91IMCWiQY4iXErwt0m7U95+E2SzJdQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2009e8e6-44bd-4188-437a-08de9beca52e
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 19:16:22.2869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: entf/dh/RbED40SVCFIfna13cXAFP3C4n30Q512JvM/Sg8ISsiZBLihXYUNLNK2/NAPrReILKgyeUIFDZG90Aj4RC6r1SremxBD6iosnQ9A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6885
X-OriginatorOrg: intel.com

On 2026-03-27 at 03:15:47 +0100, Ahmed S. Darwish wrote:
>At the Intel cacheinfo code, use parsed CPUID(0x2) access instead of a
>direct CPUID query.

I'm pretty sure this line refers to patch 34/90? There you modify
intel_cacheinfo_0x2() while this patch doesn't relate to cacheinfo in any way.

Perhaps the line above should move to 34/90 and this patch should say "At the
Intel tlb code..." instead?

>
>Remove the "maximum standard CPUID level >= 0x2" check as the parsed
>CPUID API output NULL check is equivalent.
>
>Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
>---
> arch/x86/kernel/cpu/intel.c | 10 +++++-----
> 1 file changed, 5 insertions(+), 5 deletions(-)
>
>diff --git a/arch/x86/kernel/cpu/intel.c b/arch/x86/kernel/cpu/intel.c
>index 08869fecdf30..cad66ca14ca4 100644
>--- a/arch/x86/kernel/cpu/intel.c
>+++ b/arch/x86/kernel/cpu/intel.c
>@@ -722,14 +722,14 @@ static void intel_tlb_lookup(const struct leaf_0x2_table *desc)
> static void intel_detect_tlb(struct cpuinfo_x86 *c)
> {
> 	const struct leaf_0x2_table *desc;
>-	union leaf_0x2_regs regs;
>-	u8 *ptr;
>+	const struct cpuid_regs *regs;
>+	const u8 *ptr;
> 
>-	if (c->cpuid_level < 2)
>+	regs = cpuid_leaf_raw(c, 0x2);
>+	if (!regs)
> 		return;
> 
>-	cpuid_leaf_0x2(&regs);
>-	for_each_cpuid_0x2_desc(regs, ptr, desc)
>+	for_each_parsed_cpuid_0x2_desc(regs, ptr, desc)
> 		intel_tlb_lookup(desc);
> }
> 
>-- 
>2.53.0
>

-- 
Kind regards
Maciej Wieczór-Retman
