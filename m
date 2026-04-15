Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D711C84D7
	for <x86-cpuid@lists.linux.dev>; Wed, 15 Apr 2026 06:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776233380; cv=fail; b=d6VkLd0GoxxxKhWtvNHgq2Yd3J0s7u49RQscLbItZcNnk2kumro7u25mbGLZGAZmRcY7EXmCqk6z7ShKCZPzBoM9HjHPOKXxw9McBrPCN3oteEwEF1eyh6qdMkHyERM4SaEx76Vfawjq9i2iPW3D34UkJfX1ayrKCSwdeiU3rgo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776233380; c=relaxed/simple;
	bh=/28+EFOf6qEtH0e/6tLwFihmpzvhg6jovs4f0/ZCpZ4=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VfZYSfnP+YKvTEAnfFLTi97tnxrXj9yLmhEF6vcnVc3JRvlaRornt4eTY00B6QE0U9eAucZUY3b1h5Z3akw1GR9hW48va7d/FtQb2HSkLaB86oKh26PdB3Kuict2FtEBJtgQ/zcKvSP0WUUgRbFTtmnpTpbd0kWL7qlMLzEkoF0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FnoAEiVu; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FnoAEiVu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776233377; x=1807769377;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=/28+EFOf6qEtH0e/6tLwFihmpzvhg6jovs4f0/ZCpZ4=;
  b=FnoAEiVujw59n2bGrdd8EPkl4N6rxgbfrbCdsupxp2Ehvf30zl1e4iZd
   q7vqgmIedXdNRYWETq23nBbxuYYYF1kHQ4griigk/sMt6YTjf5JLo3VUY
   lYLdEdb3MJaZn+JMWS63uP2IssVKtkEOkxm2BVS0by5YmfINZtOKaHjXf
   glEgZX6kdmr0YxYqsa0vMbEFD7+68Rl2NUzrLb1uEJ6+7nFVTOajsiW7F
   1QBvUUKjN7wl4i5FFCZ54FGfF9gnOo9qWjNZaILcgyGP2abl+GZsxKryd
   +FF9qNy/1OASJk3ESHXh6dzS0WtI6RI49e/xyc9rV0stlncpibi6PmbGn
   g==;
X-CSE-ConnectionGUID: 9GkvzI5fRQ2UjP8o/fXp7Q==
X-CSE-MsgGUID: Ed2oq09pTeCWQ7devCIq9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="76905272"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="76905272"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 23:09:36 -0700
X-CSE-ConnectionGUID: QcQOurgFQ86QcYCPOICYlg==
X-CSE-MsgGUID: UeBahbwHS/ugPwgD/oWMEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="223815265"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 23:09:36 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 23:09:36 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 14 Apr 2026 23:09:36 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.33) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 23:09:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ePI/HDbRtgsIp5ccFeZCjfikv2JyYlvw3hQIYNsm8ds8VU3pI5F3HNGH582liMpE1SOON4JXbq2SlEeYZKKd1OcZFDgrrx2Orz0F5vKFk1fyzl1PH1sNVwZl7Uo1WmISu6hRPxhA8ESanmCFsYlNAD91C/qX7Oqj1k6s1DoIV1JZ+821izH1TP0bu3cSBpN5FhZ3IdgrfXuYbzunAIwZwGkJdsskmF71FcV3wjPS+xiY4gms5i38CnO1dr/ebZmHo55D9PFsyQYD7kG4i2FZ8XtUgDju6+TL2s2BgnSaDE9Quy9xqj80dn06T3aqEuJ0CPN5jQxSH1VZuZpLwCVwCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aaPPvSkYEiOZ8bRNRraV4qJwLWjXlq+ZIsM5oQcISnk=;
 b=I2Zhg4wke5dDBUxDiV7kdHl6QUJvb0o5c7iLF98lqjzNSkHm5yhenFzhl0PsZILqo+QM7gLGCh1VAZf5wSzXrY8XN2dytFX9lmF1vH67OSXbpC3SeVi+HnzPrIFuU9nPkNfKq2qeIG62O1OtdzruphpFqnDq6iLETVooMkTmSdfFwwjlxDnLFm9Hd2GZo2rzypAGNSHbwrUA/Zfav67Nzu+m4xFyI4SH9kxTZn/0AKFXuWA+57wSlpMbcBKvxX80NM03zw826gl6A57IFCqxU3/iLcYqYe6X9mOTZO2/Y6WsrRUvK+W9TyKBWUTRurpxPqKHU7eCNtTen0jdPIDOvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB3282.namprd11.prod.outlook.com (2603:10b6:208:6a::32)
 by CY8PR11MB6820.namprd11.prod.outlook.com (2603:10b6:930:60::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9791.34; Wed, 15 Apr
 2026 06:09:27 +0000
Received: from BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19]) by BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19%4]) with mapi id 15.20.9818.017; Wed, 15 Apr 2026
 06:09:26 +0000
Date: Wed, 15 Apr 2026 08:09:18 +0200
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
Subject: Re: [PATCH v6 09/90] x86/cpuid: Introduce a centralized CPUID parser
Message-ID: <ad8qK8M0IIJRnVOa@wieczorr-mobl1.localdomain>
References: <20260327021645.555257-1-darwi@linutronix.de>
 <20260327021645.555257-10-darwi@linutronix.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260327021645.555257-10-darwi@linutronix.de>
X-ClientProxiedBy: DU7P191CA0011.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:54e::18) To BL0PR11MB3282.namprd11.prod.outlook.com
 (2603:10b6:208:6a::32)
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB3282:EE_|CY8PR11MB6820:EE_
X-MS-Office365-Filtering-Correlation-Id: d6344a8b-4156-4f35-2ceb-08de9ab58bc8
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: a+onsoE0tsyx+BrgTeQD6eRTAA9KaWtcvZZYcbqJbH+rlsiRfjMpWFQdDo93rW63HSdOI6E2stU+aHJQWd1+FF3sKCSwuvr5tMmVPGCeY3RzzUFHUYch+7DkO+XApRlpzzlS2Tex1GRY83J5h0pxTj1oI9uIB1KjXec8MZeneTAoxkakgkohBvbm3yjVq62UQsqbtYJCFBTY7qX1d8egpUqSLhZs2RMdYdLaC6voNxdyjYcRhsq4gws/M0qxg0Rstzy/nwClXcqtachMiM0vXTjEcZtQF7SBtrdaGRNg4Rd/Qg2PHsi8jMcz5El1BneMSg7Ze6W9TxAyabKiGEioxOrBb7IwdkaRQRo7EvVTyQh2D6dY6OlYp7AP14PQabkEmmPjEsyaTQMKa2dEK9VfC7rpj+0eAIUFRFVoh1Jf62bLHsMQe1AzEqY4100ZGeGT/ux5dM8Q3r9uGci7CW9UZxOF83tZvyK3WYE9JOkWBoDK7IMxIV+QWzGWzBDPIKoukDHUCzC3LBfXSy6hOSZeIDs2xICc3x7hdqji/Qup/uLVR4tlf/DACYSVP6sPXxK7/0eOPJZt3oG8cd3lHmss3xTIlsG8Zu3HU23UsGXGqiqMoWd/GGhwXXjOk4WIlgeW8COO5hYm60b4s51OXSGTrrgtVF0VgplisY/tvPzQiaOnGrFFekNl4qVKkP4vnWJ2B4nCnsD5jMUFd+QduTch3wxN0TrCLjQ2upQatBu7ZyI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3282.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?qOk/jd7xO7LOInN6nJnxkrLXfbnEWklKjI3Q6gZx/+BHOTHKqy9JjrzxC4?=
 =?iso-8859-1?Q?xa+XvfG/RqbhDqzH2ZTzdvj+lkqx6sQ49+1NNJlFWl1lp9i2cMWKi+qzfz?=
 =?iso-8859-1?Q?7GpMckrSF/FxJ30V1pOUVxIhuS6kr72orn4AC5R57a1UmJWe2Hk0ReKuhs?=
 =?iso-8859-1?Q?zUG8gWKFcuQDexJ/j+OBdrVcXxBrvvjYpc6lI+JqXQ277ZuKd/D+ZIj6ih?=
 =?iso-8859-1?Q?8xy6fbdWkQ580YblJ9IC21UOmK8iPy8COKNWHCWfw5n4RqFOxwOnlz0Zfa?=
 =?iso-8859-1?Q?VbMefmnRj47DZiNT4qlmPSrlfOMwsVD1cgh6mNZOgly7rQIEKIX/NbHtza?=
 =?iso-8859-1?Q?uwllSszfWReArD4ozFKfdEhJ97lQLGE4Ei24iJuGdpeEDzSYLF1VubBX8g?=
 =?iso-8859-1?Q?74+mL7kuvRAvhunufpHg2iRIPadX8tJh0/KSadMNhdH+gSNDZKO3kBQRcf?=
 =?iso-8859-1?Q?DL3G/VQAlBPaE8CQGxUl4ejqMtoSAvs3JcUVyrVSKcFqPiqWUVcba1DQd9?=
 =?iso-8859-1?Q?NPwpuNQGNRwLh4myhmQU796wNKmG6DLvrd6b6jJ34ylclDkQGwqesazoDN?=
 =?iso-8859-1?Q?u51ZTQBZHrVk+gWojglhGzyt7Ni2Goy5/GyrY7NpscaGIqCHtjEj84KQtq?=
 =?iso-8859-1?Q?UqzHBMenkK+Bqb0wSiZeaR4dDAnOlCrA+BHjMc2Jp2/DGO3K7+SD3NdWZL?=
 =?iso-8859-1?Q?OWiFT0q5AI8fhC8EhpAf9AM4OF7gmsFnGEmqVUTipzShqslPosURnGrZRr?=
 =?iso-8859-1?Q?Kf/wDs4+1fLZdHLMGGgq4aE8biDlul45yckGRB4OCvD8/1Ob7XAcrbGPmH?=
 =?iso-8859-1?Q?oM0LrFtf5HelBw2tj7dB2zOkpslxoY2J/ihpwQ1rXe0cqCMmCShOrz+KZr?=
 =?iso-8859-1?Q?bv8GzMt0TChgz7fzGzHHpDJklm1NBZAo2aQFk5NmZcwQ9Y3+EFd8tFNoE+?=
 =?iso-8859-1?Q?AfdiekQAEOcz/P2EcXf6S89GdmMbtrgTjXCuzp27idqfTo26d733zp2vdN?=
 =?iso-8859-1?Q?MLcRSD/OZqe5Z8lhkhvT1R+P2kFfDTACgdOB96dDFPZyg8jXuPfxNXg4/r?=
 =?iso-8859-1?Q?3ixh9IVsgbHtHld6Md04VZvyS3viLHg+8TFkBIrrGi36ki0t7sam6coygB?=
 =?iso-8859-1?Q?yr0JIEX8OMNKc5+hVAVGNPhKDlMlkrs2ON5G1M9gatpM0lruVnX5rKV7Hi?=
 =?iso-8859-1?Q?qrBu64j/IhtCCMDr8BMG2QNbUrbrbS7BZz35MYTrirn/2ItwUHKSMQmtrj?=
 =?iso-8859-1?Q?iwOCeR/M78Vgj9frOBddqGnXNL6O8FFOh5AzABtxfMMFlXynTYbpSXV8Iq?=
 =?iso-8859-1?Q?Jawg/1N8xFWm3JTjqNUYESXZH/9cz5TDuW0GJa1UxmarZgRsuqB5kP9YrR?=
 =?iso-8859-1?Q?GMenVzIxAiHJtKbXVY+lxPz6C9P3hDNbhhyvSILYdOgx1g4nA8pwoaQeuq?=
 =?iso-8859-1?Q?AFvRM6G8On4q7Rhc66NBrH2gLuBTwhc0WmAPMdSYhSFH7vobJBQgQ929G4?=
 =?iso-8859-1?Q?Q4dCqTIUXI+kjX/LnZVUlGrwkUwf01zRXkMg5j76wX8Yct1bQ1d0u4syDf?=
 =?iso-8859-1?Q?8YPfMWEHf6S3HHb6pBIk+FtOCqoY7WPDNtTj/wlAAKzTOGDj3yGxoQOdjX?=
 =?iso-8859-1?Q?+hi+659IjTc/YPVRjcuxhCFNKscwvyoIJp2KV59fFJX3nGokEQg5JwdePp?=
 =?iso-8859-1?Q?IswSICVV7lbHqSezbqO/cXlTh4LpVnncuR45MGxWSln0ex2F+zG9ZWkHlq?=
 =?iso-8859-1?Q?PI5t7e1c2NGvJemg/Npi2DcM1ZS/kpvi2IUFbZCqu1t38rAoBRbODFYKvv?=
 =?iso-8859-1?Q?eF05qnvilHmnYjMtNu9q/u7XVrvMGv2ylBnBHU3Tayn36vFyJZT+?=
X-Exchange-RoutingPolicyChecked: f6Oen53H2BEEdYBLIy/9iS1W9Xclr4OJKKTder2zH415nDzMgOr1HDrvLJKS9vC1df64coxzTgVIFy0oBXMWsCe0BUZW8I+/UX/+mvZKGy7geJX1xXfTgieMAA5CpfCZyxzCcPbMpFuOuWSlu58uAFoRwA4kHBrAcv9vZEUR+eFlcxiYKWY4FvEWvD4Bzyp+xzsToiFbKT0jTSlxHiaM5MWjApKNYUlG7x/5XSL8of8cSPBu5pP4425ehkxWQzaumGrO9JZ5Garqu9NF1u7XBkIFB75OwPjaHvFYmcoKIsaiLV+vQPtu4FegDbZ/3dwWNQETlUb6p7ers5dR66uY4Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: d6344a8b-4156-4f35-2ceb-08de9ab58bc8
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 06:09:26.2205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: beGEl6APe22yUHrE+RYcnXNfkcAvf9m93wz5RhOVeLKIgOGRm8uAzGbr3VFdjYmE4lwWIDMZbHxxaEZ5Nd6LYIauipnSVMhnrKrYmUKIjxQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6820
X-OriginatorOrg: intel.com

On 2026-03-27 at 03:15:23 +0100, Ahmed S. Darwish wrote:
>Introduce a CPUID parser for populating the system's CPUID tables.
>
>Since accessing a leaf within the CPUID table requires compile time
>tokenization, split the parser into two stages:
>
>  (a) Compile-time macros for tokenizing the leaf/subleaf offsets within
>      the CPUID table.
>
>  (b) Generic runtime code to fill the CPUID data, using a parsing table
>      which collects these compile-time offsets.
>
>For actual CPUID output parsing, support both generic and leaf-specific
>read functions.
>
>To ensure CPUID data early availability, invoke the parser during early
>boot, early Xen boot, and at early secondary CPUs bring up.
>
>Provide call site APIs to refresh a single leaf, or a leaf range, within
>the CPUID tables.  This is for sites issuing MSR writes that partially
>changes the CPU's CPUID layout.  Doing full CPUID table rescans in such

changes -> change?

>cases will be destructive since the CPUID tables will host all of the
>kernel's X86_FEATURE flags at a later stage.

Also should cpuid_parser.c/.h be attached to some subsystem in MAINTAINERS? Not
sure if it should or shouldn't but I noticed you added leaf_types.h before and
was curious if not adding new files is intentional here.

>
...
>diff --git a/arch/x86/kernel/cpu/cpuid_parser.c b/arch/x86/kernel/cpu/cpuid_parser.c
>new file mode 100644
>index 000000000000..898b0c441431
>--- /dev/null
>+++ b/arch/x86/kernel/cpu/cpuid_parser.c
...
>+static unsigned int cpuid_range_max_leaf(const struct cpuid_table *t, unsigned int range)
>+{
>+	const struct leaf_0x0_0 *l0 = __cpuid_table_subleaf(t, 0x0, 0);
>+
>+	switch (range) {
>+	case CPUID_BASE_START:	return l0  ?  l0->max_std_leaf : 0;
>+	default:		return 0;
>+	}
>+}

Trailing statements should go on the next line, right?

(resending this email as the old one lost the in-reply-to)
-- 
Kind regards
Maciej Wieczór-Retman
