Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9343E5A15
	for <x86-cpuid@lists.linux.dev>; Mon,  1 Jun 2026 18:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780337301; cv=fail; b=gcrMw3Nh/A6S8BsengDhOC3UlQtWGSQ9CAOK3SET5QdaPwzEThi5sRMq2/ERoZoYSgxI0dO+8lZNZ3erfZ1zasK9Hg90lfSKVs61M0L6nJiDCoUKvI7eUsF8vjaM6CBjEBFyTvXE985JBtp9Lu1gKqAvcv3JXzO4kybkhFE5hes=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780337301; c=relaxed/simple;
	bh=UwODsxunrF5MMd6t2ObMVhXH3UtMdwjl5rtvbIuj8sE=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QAbONQ+m1Egx4ZKfbf6nZ0OyCOOJMa6AYCSYmKelRDF8wcNNE8K7lpf7cPk89hoj1+6t0WXk3KoLMR4irZSRETjBUfyr+Le3fzgJnSKiUsr3/UQ40+9+NXL7T3tL0xJtg4iIMaowSJFPqNgBb1EtA/DmsjmN8hkKJVN42Mm2UO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=myPoSOmQ; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="myPoSOmQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780337298; x=1811873298;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=UwODsxunrF5MMd6t2ObMVhXH3UtMdwjl5rtvbIuj8sE=;
  b=myPoSOmQtR5Sxkq7pw7x7ilbzYC8Iu3d41+EuO3vks/ZxVglbzHGesaA
   9nnR8L14YsQRAoNgu96VqvZwv7Vz9iKdn0otWP7rkCBIBnAEhSKeXygvL
   bXI/KFE+oduwA+AdjQT5GhE3fOofJPnsMhnztUESxrgmUTaJbh445fq5N
   MuOmz5a/fY+n14qcX1fB9YsuaardQfpoMLkHp+4w0vENMbWlhpoi33FZU
   pybHQqF24JlQRN/o0VTsko/72skvjgqSJbPgNFKOTa532XwF+z3eOLp7z
   7wkzT71TgtgmgsLpEU8uL5+/YEAwk5uCj3em9nbkq9SxyaMQrmv5G7/oQ
   Q==;
X-CSE-ConnectionGUID: e18CX6FVTHqDV0C6korSlg==
X-CSE-MsgGUID: tyEg3B7YRL++ZpSVz5tQ9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81216624"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="81216624"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 11:08:17 -0700
X-CSE-ConnectionGUID: OFqqqXz9TE+Y8D5fluAnsw==
X-CSE-MsgGUID: Hgj3pBT9QNeqXSv8qHpFSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="237299041"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 11:08:17 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 11:08:16 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 1 Jun 2026 11:08:16 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.53) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 11:08:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s7xcwFqDSm/LThYNOyjG2Xci7Oga6brAZqaQQO1I5e9kI5l1lkCdRc4VQo6BO81cx9EPyOnrXwWgZSZwhU2SAIjnHMUJeJcKgy+pUFoC12k3rng6jciq5JvCEjA9sqjstbrWXqZ2nJuMfSrmGQ3to2qLcFN5Y2YSX+L/DNLOx1Is5kkkjrHnMpDdqVRqg2tcfeeOOsKiMMrJCfkUPHebXvzALA1n/HkQGFpcrg1fNmJRQ2FtJ4HjdvhSQmDKKsWGq9cQH8IApRbm1KguI2CzsBCSEqJXfX9/O5X4UU7mqQcqMkE0Ft1H87x5dLDYGKiuKWkZpIbCq0g7P6Ei+Zwlqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FhjFp5ugvpAbp1W97pQaEorBZ5QumsXtDtMoxIfmoP8=;
 b=eFf5GPVKWU8qrSR0Db8XOUIBT5H+P8kdnOPAVX4SEeFElQo5K1PZXexdAfB9ys0Nw/ZbslkHmj7POyFYCGmdmKQtE0j1zVGKKFxRl2cDioe0E4EzestWcm8OqCdBCzsWKDixBq3vi8xMU6y0r4Q+OEB1guUrqxjL+l+K4UEKcSaP4+v9naHsTd0qhNo+4glDT+ZKDkLOnG2byn5fEciMNkSfuv4rY7xoqewu6YIu7+q1PzpcRuLcikMNC5FofWgCX11eOmdhEQosfyOnE3H0jivjvCBG8VFdgku5OWEEIMp421gbbkteAfeMHAP0OfuCTToZPXw7yfZ1YnqoCMr0cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB3282.namprd11.prod.outlook.com (2603:10b6:208:6a::32)
 by MW4PR11MB6912.namprd11.prod.outlook.com (2603:10b6:303:22a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Mon, 1 Jun 2026
 18:08:05 +0000
Received: from BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19]) by BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19%4]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 18:08:05 +0000
Date: Mon, 1 Jun 2026 20:07:58 +0200
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
CC: Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, "H. Peter Anvin" <hpa@zytor.com>,
	Christian Ludloff <ludloff@gmail.com>, Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>, <x86@kernel.org>,
	<x86-cpuid@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 111/120] x86/percpu: Add offset argument to
 x86_this_cpu_test_bit()
Message-ID: <ah3KEQIGMlJrWiVX@wieczorr-mobl1.localdomain>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-112-darwi@linutronix.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260528153923.403473-112-darwi@linutronix.de>
X-ClientProxiedBy: DU2PR04CA0079.eurprd04.prod.outlook.com
 (2603:10a6:10:232::24) To BL0PR11MB3282.namprd11.prod.outlook.com
 (2603:10b6:208:6a::32)
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB3282:EE_|MW4PR11MB6912:EE_
X-MS-Office365-Filtering-Correlation-Id: dd1d3a10-1826-4812-dcbe-08dec008ba7e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|22082099003|18002099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: 6q/4YK5d6Of0/MH75F3+gpbcTMbzNWdzp79jYZeiqX8peXUWdQv40MwSL2gP5R4DrWeYsNl61VPCKGDTmp6Pggc/kKSy7oc+YTaRv1zHejagH7c7wibT6YZjbyCOcaDQbYOMdZV/b6Am6tMpdX3ZfrY55FIvfgDXi++BbfG0JgikdHVHVwfl/sUMJZmns1N0H024AWr96B2z7CYFDjsZ4zM2jYELnw64l2LhjNmWldTNE13Ln7Mj7/i3MiOZPMDm/E5iq6+R6236BxXBt+/lRi5RGKsbrwh4hNZHvgbMN+ChYE00PnFKP/aX0rkhMvpug1kFk/5UxlAUiCBxCgi9BQu+Bubc8NCEw/JXDL49C/y5+FZ2eFBnWWL5z0aj896EmfH5Wu7fbKXgC1xfR9yGi/nsUnHCBSucIfR+zfIIyBd9VnxjRErENlkMII92ZwBWFN6yZsoZlEsN2OA1+njNtIORuoZXZOuV43M/lGkr25Yp5MlpFx+p/M+XTeG/7zUBYzLqyWyPeGVv7UmQS5VsjpFyqM7WfAFDqf/RFGEWRQllpflurJy6n4u7m3bgnUs3bxlCa6Rj64BmC4aDJMdaR6PxrgYP0C57/oSpMgpts9T/Qr9V9Laq3r5BZGxiZxSd17N3zFuVLFz0qlPDTUaQruw3DKKOQRfwP+UQmK+T9wlBHMiqHKqDKJ1GRbP1qPhs
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3282.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?uO0Yfd9Vtx40Qz4F1VkurRIYXDqK/e/VJzCWUS7FhTL/nA9kJBOKW1HGRD?=
 =?iso-8859-1?Q?VB3O7MOZsr7N8YP4ajlwGmgicFNozHtZwyNZ9/rvQOVDxWJvFndL6c5d9V?=
 =?iso-8859-1?Q?B50557keAAGl6TIdS9p1spyvuJ5hZtnJALB05Lg1Zi52CRnCRVXOt7SFIC?=
 =?iso-8859-1?Q?/DUJBAD4yiIzIBtiJYJoiWPDuXIBBMosK0TGBMxfE9eKeHiHBH0j8jaOhQ?=
 =?iso-8859-1?Q?tFOXu3MspI1dWpYeuQMa/TzTUUlqCrlWI7vIOk97d7b6g9q045EUjO3lmM?=
 =?iso-8859-1?Q?YTJd55xgmL1pmRAnano7h/wO4UKMJWoUlWR0wrkSwvrGJ2jeLHAxQrxPHl?=
 =?iso-8859-1?Q?Fq338DOSnzeOKc92EY0P9mubTtPIY+hIjhI5B5ptalILOhypt8aYWXwKzN?=
 =?iso-8859-1?Q?LZK+JjEAQhCCH3LG76f5qIFRO05PM1/mMToF5FZKW+s09+vRBka1NYaJiw?=
 =?iso-8859-1?Q?GMDvYNqqAzxH0y+weFI5O4xLaF/PpStmw6rOp83YfXD35iOrUfUZRN6U+w?=
 =?iso-8859-1?Q?FsdUKQmYZqCKXJRGzCGnqao7CuGLhV/p9QrfozMlsAN8cAGNs3LYbEd2VA?=
 =?iso-8859-1?Q?eoPT6jWd887wd/0bqLsKEoFqMNqDzuI5YNvETxyIIEPr7RXtWgFq2ekB2w?=
 =?iso-8859-1?Q?fxvJnr/It1TaSwarZZXH3xooQhkc1rv6gkzSaJblc5uZJxYHWiknuc/GPj?=
 =?iso-8859-1?Q?Z4ZLU3AMN3eIBOqdGbhpJA+amqsjYa0+htp0efNSqV3XkxYCdogOdOs2rM?=
 =?iso-8859-1?Q?SJE0IVw+44oGDGctsgIQ+EB/7HYnRCQXFIqr6Zy3qXKyB7FaDQ25s2c/o/?=
 =?iso-8859-1?Q?twjDUpfNf/uGB3xHmJJmtOQXW21wAIKuTChdjAoR0h1NSWdQVZs1f07Yq0?=
 =?iso-8859-1?Q?RK63Q+F+3PFDU/VTk8kGVmbnpZIB3G9q+Tf/lsTSJM/4L1pnrccQ1L7fBv?=
 =?iso-8859-1?Q?dpGThpxqjtkzGM7DkJPoBcEei0vLs0Sha+tPz0iSR94BY6reQJ23Ol289B?=
 =?iso-8859-1?Q?AUAoRKYT9iR9BDsRsyeHXMBdgfp0gwfE1roJOQ8XPDLvtCBAJzeKrpN1GN?=
 =?iso-8859-1?Q?ci2Tru1nNHwO8w2IKTf0cNjm+Hu6JcIO7NDnPMgDInYbr2kMsFhohLgZrU?=
 =?iso-8859-1?Q?14J5GBwtBtReu9YfQ055NTGuovAs46LrvO7QiVOI4ez9IIekO3HV+fgAbS?=
 =?iso-8859-1?Q?HOrJTO89Q7DEGTwYxR0h1K13EPyhzwSZdzffmWXSwirXstLD9iisCTG18z?=
 =?iso-8859-1?Q?3gPH2VCWdyv2Ujv2HYGJozZo/hjh30yQxInIPikN+r+DNJb9JCmUDGmViE?=
 =?iso-8859-1?Q?ulAbgnd8ZHIF+NwkmKwOLvDt4DP/LfnbAszdGY1UM3WmZ5jRJ9VFmR71iW?=
 =?iso-8859-1?Q?2dyxWXNB/lfiInQ14aoKNFZKoGddx0cAQAh5VUt8NgfoKuXeVGhKV9bUlz?=
 =?iso-8859-1?Q?hS+o7W5NEDB0o/qakPZzZV7gp9SsGPYM/E8BZeSELySpiwbzxIhxDIWXIj?=
 =?iso-8859-1?Q?EMjAsPC09WZFsMGQZ2I3DF04/d/3qTgF/PeNzN/jYYcT5+I3y5LljAgdMA?=
 =?iso-8859-1?Q?BS3jYxAr3Tf7+I9SuLd9CzLih7U0TgfScGe6ik8U3E2sSr1jo3TB/fjm+c?=
 =?iso-8859-1?Q?cH5ERr+EHCaVuABdXOwB2n4WmXF51SZEziGkAWpZKv9Yt6qGmMpfBgx6Fn?=
 =?iso-8859-1?Q?qqEJJG4eJQXFDlxfpKPZ3eadS/TAJRKcx1/NaC5xcdxJFSB2zAivDQtDAA?=
 =?iso-8859-1?Q?MQx4vk/o4J5XsaytaDmyu8me96qYqclTOpPCquWhPxINBQreVwM+i2a0Z5?=
 =?iso-8859-1?Q?EdrPNCpATws9VpxOaKaoRPib8L5d0lK1wtKEB5yDiRXJuRMxKt7V?=
X-Exchange-RoutingPolicyChecked: aqLN/T6tB587UVnFr2ohLPRyIOHfxAskgmdhNG1YcvXqxjUCwY1FOoB2sFKw/hGmct1pe5pBwGWrBnKEMc5WpKiwEtxOCREDDhT1zbOn+DxlcM3OXazzehMgEjtTxknjn0PPmBZMqZWedWHNsO1QFzTGkOm/lVee75IIyuEpltz1n0CLaKiUW3T6pgJcYhYSagn4xfqIDllGz4MACHaWIkYXLeXxJx3G/5epLgPjqLlxF2XQ1BFpfX8e3cVuuRGlnxWQC1mHS/Te6gzTjT521zc1LJrqa8MoXVMdSQMh9vfcEyGjGvIc1PSQUSv2LPRL3uWt9l3tzfuPc9IRUDVrlg==
X-MS-Exchange-CrossTenant-Network-Message-Id: dd1d3a10-1826-4812-dcbe-08dec008ba7e
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 18:08:05.5864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: luTZiWRyzN3+Ma27lcNyN7z9QDSMrWL/UHzjqSTBtRr0kRWbWYXHtIYhYqR608EBrq+uRmXyZ49QDIzx0nRG366qQqFuL5c6u/cQerrOEgY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6912
X-OriginatorOrg: intel.com

On 2026-05-28 at 17:39:13 +0200, Ahmed S. Darwish wrote:
>x86_this_cpu_test_bit() assumes that the queried bitmap starts at the base
>address of the percpu object.  For X86_FEATURE bitops, this matches the
>current cpuinfo_x86::x86_capability[] layout.
>
>Upcoming changes though will route all X86_FEATURE queries to the CPUID
>tables, where the bitmap resides at the per-CPU CPUID table plus an offset.
>
>Add an offset argument to x86_this_cpu_test_bit().
>
>Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
>---
> arch/x86/include/asm/cpufeature.h |  2 +-
> arch/x86/include/asm/percpu.h     | 34 ++++++++++++++++++-------------
> 2 files changed, 21 insertions(+), 15 deletions(-)
>
>diff --git a/arch/x86/include/asm/cpufeature.h b/arch/x86/include/asm/cpufeature.h
>index 520949560138..b12bde4986b5 100644
>--- a/arch/x86/include/asm/cpufeature.h
>+++ b/arch/x86/include/asm/cpufeature.h
>@@ -56,7 +56,7 @@ extern const char * const x86_bug_flags[NBUGINTS*32];
> 
> #define this_cpu_has(bit)						\
> 	(__builtin_constant_p(bit) && REQUIRED_MASK_BIT_SET(bit) ? 1 :	\
>-	 x86_this_cpu_test_bit(bit, cpu_info.x86_capability))
>+	 x86_this_cpu_test_bit(bit, cpu_info.x86_capability, 0))

I think the same change needs to be applied in the same arch/um directory since
it has a matching this_cpu_has() implementation and it uses x86's percpu.h.

-- 
Kind regards
Maciej Wieczór-Retman
