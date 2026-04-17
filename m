Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C09C26E6F2
	for <x86-cpuid@lists.linux.dev>; Fri, 17 Apr 2026 14:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776437295; cv=fail; b=f6cB+Dqv1mFBvcwnQYq0ePT4LE16/l/C2NXkYLN1Fe3HszmO9glhU+eYXTPUoL8IgTLYM9I4qLaQ5XWCa9cTLAIXOdsGSvH2SEQpN25DxOWNlo7j5AqE147kf5VDISVsaaDF3pacxP3P3wDFHIaOeqW2FldHL28rGTX7vwFrv3E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776437295; c=relaxed/simple;
	bh=jYeiHO01bA9pe1OXaguOGs/1KjvPU7utGzyrZMYKaJU=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JbDL5VZxOmkb9gQVxEQJh/F2WriiKApiUYvjWRnXBiMvy0Ue/wZRNjAToh+7BNc+JeBLGyWymipCFuNWU9ogY2/9czU0nmIXe8BuUnFvjHlDkKXPFF41l8McsQgIbILRByMP3NWevIx7DPUOGdTObKR2tmJL3bhHHi00JkxBG6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eRM9DdCp; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eRM9DdCp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776437293; x=1807973293;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=jYeiHO01bA9pe1OXaguOGs/1KjvPU7utGzyrZMYKaJU=;
  b=eRM9DdCpnGyQA837eBofd/H3ZeqqahrmHQLoULYTm0jD2+vFaoO1VjGe
   xcNroGMrN9mjX0v5+OCuCKCaGnK3uY8kvllm43Btqa+aF+4zDs7PZGMQd
   iyejMGevXoxaq17vCNeF7oYvtZ6fH89dbuoOCxD1Bcn6Em4t6hznEHrp0
   sIP2LujQFeY+NQri2908W0GsxUU2SfPPNw/rkTzlor+wUHQYGaEyuFG6w
   0sOebf/t77RcWJDenHIXPOig2wNDE/WguFfTH2RuyR+BKXXPeiB3Tv9tn
   0qQkLUuAyDQlLokQ8qRud8lFIP78bi1J6vHDrx+5AUqCQzQh/oFSBXOz/
   w==;
X-CSE-ConnectionGUID: UU3UgMRNSWmp4dYscM7eig==
X-CSE-MsgGUID: gp/g3iinTcmkrKvmKOzzgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="88909260"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="88909260"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 07:48:12 -0700
X-CSE-ConnectionGUID: ZwAOk9fuQd6aw/u2cOZXRA==
X-CSE-MsgGUID: 8yyMgcdlQBSEZgbQEyrgEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="230046826"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 07:48:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 17 Apr 2026 07:48:12 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 17 Apr 2026 07:48:12 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.9) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 17 Apr 2026 07:48:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NEWClhaPX8hcM1UDob+OsTBkR0zb8K16sN33uHzKf7XoF4Dg6IDLPR0gjOYIr92RVbse2kTqzhNtBiAKEXV6Ytu7++FtH5oigCJbsb2BAhF//sroD1zZM1M3hyBAFjs/cg6StLeNcz5cqkIrAnl2SbQq/c7PgS4gkURViKLj1FJWCwfwNN6DF6f0w9DknlrY7eawKtEdTaDzFS+DpO3/2onEqe0cQ9Fh9kFKXECkt4oK+w1wewBleeIc+afTRAI5osgxUHjYzOrsAzmVPqMWdDp9ilyBKxeSOBwoe/TLM/oKuqIkvHZU8stS2I94CFSY4t5XqyV606Bhg6dJfzVa5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQ747vBK18l0s09834s60OZIgVGeC0aaTum9ZwmYS0A=;
 b=XdH3sNMqKMvfPue00O7cqL3lXjSt9Ox4YVvzaRYF3KT/KADYG+gjTXdfjgOpMPt4xawvRP4nupakmQ9Lcl719DgsnlF8EDWNffj+zkFMbL6S2dCrnCnY9WxczoZDwUTMI9oKD8RNpeZ/6frFvmr9VGiYWERH3aC2ksDQHc+Pxc6Ia4/KUFTuJqOT0H+CLQA3xH+WJTvulhYf8fKL3Z8oPAlWuxbzAAHGI/9XY6hy+R1Tx5tzHsIj2dmZF5LOlO83ieqK2JrQ3lmAkI8HtVdhhkwCSHgQfCwQQ3TN5V67NW9MDikhWeq9GaAwBKQlaw9c6W0BymIimX8/FyDX4ShjUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB3282.namprd11.prod.outlook.com (2603:10b6:208:6a::32)
 by DM4PR11MB7326.namprd11.prod.outlook.com (2603:10b6:8:106::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 14:48:02 +0000
Received: from BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19]) by BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19%4]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 14:48:02 +0000
Date: Fri, 17 Apr 2026 16:47:54 +0200
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
Subject: Re: [PATCH v6 39/90] x86/cacheinfo: Use parsed CPUID(0x8000001d)
Message-ID: <aeJHuFLIqxdqhy1f@wieczorr-mobl1.localdomain>
References: <20260327021645.555257-1-darwi@linutronix.de>
 <20260327021645.555257-40-darwi@linutronix.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260327021645.555257-40-darwi@linutronix.de>
X-ClientProxiedBy: DU6P191CA0050.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53e::13) To BL0PR11MB3282.namprd11.prod.outlook.com
 (2603:10b6:208:6a::32)
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB3282:EE_|DM4PR11MB7326:EE_
X-MS-Office365-Filtering-Correlation-Id: 3536f63d-0ee0-44d8-d38f-08de9c90536f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: qkvPlJkN6/pq+6P8z/g5+yei1JgeVLn89kd/hrJvUTUP7ptMWtPKWrHBWclC1wMjHw5m/XbqZpWdCkInL1Nhd6TwTsj2oye4T6sGbhFH1SWRQvdanIuCgt3SWgAVOgca+KGXi8/eb6HizPqXEoS05GyQnv0KhmE1srCKFZpTSv1Q4xTVLyBT/4W+jz6W9KnPL9L3+NfbUUvX/r1UiHwcqzsEXp2I6NFl6RMd+WUz9RiNu6kA5AtbQPoNT1D0dctCTQcaBNMCADw/Y2RBqJP/M9jv783Q583roJcyqaHXOU9a7nO7FaZql/mlvr4bCSXI/+crNl70xFLlhmx+msqwXXy/5jIwGLUCgA08Z9Yqz0LYCs7sM1o4+dn5apxOfkh+vtva1/hM9lZ2euDG0kYg8lzKI2hL6tt1HbAJrPMqrkAhYva1+aPavgQL7piKaMk620wXBVQ8NgoZtb9AGKXj4vGMMWk5QXOwCYymLoLgxCOJk6QY1OvleXDUQhqK5bWpqboRXB4uLbLo2rdOrF5kzh70t2hks/k7CVTWTSh3Ug2i26xzRmFeJrri3YoSPT+p/me/O4eGhdNBr643kOMVzP1Q7l4OrjoZe7oNgfgRkscr/A0AWgmRKjmu1Xp9wjdpkWh6QHXrneo2twsXVa2tmmZ60qoq0EXQeKsW+PleeMhADj+7jVf7vi675R9RHHZ1zbIGO/+02gkdNFGXf72o2uCLoXwopoaxpzW2NzrfpHo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3282.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/rir/OFEsmt8x+XSTpfsHgHY1gBlzepL3Q/bN8HqyrJgkLEggDYKAisInO?=
 =?iso-8859-1?Q?mYUJkEW18gZ+datBS4vQXoV3hlsbNbzpzus+GmgOoBZbzeEVQ/GQdyJHnS?=
 =?iso-8859-1?Q?6X5Ap8/CD7YJbk9ubEujHFbMOnHwtwkXoKOxOwL6xZ1ry1YsF/zRWpGm67?=
 =?iso-8859-1?Q?qLOfOn9HKcaqs8e/jG5bNH/Vm8TTXS6frfzG5pbDSHi5Vz4ANCtQx0junG?=
 =?iso-8859-1?Q?3vHm+xY9Tq4TpiOwSfrglqL3yFtkqkkgV4lKLbX2NCc2KseH/e0ASLTeUg?=
 =?iso-8859-1?Q?xqIETY6enqsKBnPs1Sgo4LqZhQrJhLu9kZJ2qEF6pW0cr/7TKotlHY0Pj4?=
 =?iso-8859-1?Q?TJXbxGPp0zn0HLzi5+RlxQsc6NXtZbZNSCx2kcV55PDgoPzWGx3QYfrHAD?=
 =?iso-8859-1?Q?sUSjzv8PCtdAwBrLLnd4gIUPufxkZvRQ+7QyR3Hu4KkcFhTCIWnR26RksI?=
 =?iso-8859-1?Q?p3OFxmW+f/bw6u6nOc9QnazydE7EGs+uIz4w4hRza4ixp01CxJeLA/3Jdf?=
 =?iso-8859-1?Q?pWmerrBnrcL+iCfkjv06ptwtmGOIrtv65K2uNNJB/svShzu5WHDpMTt50r?=
 =?iso-8859-1?Q?+SHOUpzYqtTatIRHb63lMAVywTvnfWEqclDHBrma40Bmz4CUcjeVKpI0ox?=
 =?iso-8859-1?Q?khwtEiNMbJD8SoIL77gtNcEMl8vf2kMyVnzwB5IQvJ7LBt/hIt8WsvyBS9?=
 =?iso-8859-1?Q?M6SBsxjICnywSWJsf2ptukrVnWPxxItY5Ljhs0eLfPYO+Qv/aTb+XNv2rC?=
 =?iso-8859-1?Q?c0XOsZji6kGHyGD/v1nA3UZ5EytaVgI/JyZM6UGYrkdaF2XIYXJFPwkI/T?=
 =?iso-8859-1?Q?gABFXQNou0ILK8MkXJY6Fg4Twoh24fjP8d02oo8k2vUcC89uf5zMegBUpu?=
 =?iso-8859-1?Q?HsGzs5HAQSLaaNzJRj1VK8R/buCPWG/iaTsNS30DLdchU1mjrC3SOGczLS?=
 =?iso-8859-1?Q?y/en1XCJJ+PILVRXqYUZrTiGJFMgBK+kjZWtwrnOcgx0j2oU9HXvIDyzlv?=
 =?iso-8859-1?Q?1ynafNNzCbPELLvIQbxSa0Jc7uLQlEsPuEHX35CSXsAm3BsnnmNVvddmGV?=
 =?iso-8859-1?Q?6a/br1ohPF/Yqn0cDn+vBkUGd4IZn3hksLJUB7OsbD61sfYMPKZOJxIgeD?=
 =?iso-8859-1?Q?jtVc/ZHYwbclvJoHbVHV2EZhF8jOjYbQbts9klkhEzp2BSUhmrOD0fbu55?=
 =?iso-8859-1?Q?25MhYzP+fPHYcMkjKxjAxQY8aveUtEw4jhzhU+uX/U2rMIlEsE/W/mGFAH?=
 =?iso-8859-1?Q?Me/HQT/j4OVuDkr/MydxDUPlt9LAZCZfx/mPlCilWoo5tM4B4Oj9OFoaAD?=
 =?iso-8859-1?Q?TvaqJoa7hQRZZHlofElK5avEXzNl4aqkotz1odg+iO16IHZUPBPjoCTp5x?=
 =?iso-8859-1?Q?7l5a/REVOd9z4WExQF/TMiWzJ80aLQm8NKTv+fzrGZpxXMgmvAx6tkYudi?=
 =?iso-8859-1?Q?5GK0jMbx0U0Yz9m/oNtfNwBqXtad5h9908/6Xpq36Ti3ib4esZMFlJ/pKc?=
 =?iso-8859-1?Q?2vxscH67OD7/DXmAwrMvtpEsq5BsEK+0LyPvlvIu8v6Kn4GUBaGc6JRHf/?=
 =?iso-8859-1?Q?3NV/EG/JvBaaUd5I0Cm0C/P+dEaqNzzvsjbLl888ioWj6gUnsyRH2hhOP2?=
 =?iso-8859-1?Q?suBz+Qm4PAdh0nn3eZCy+S5SvYktpmK/gbDbgD2qiXzlagnQsDbN+byaYu?=
 =?iso-8859-1?Q?zuMHcGdXEzgi9tlEon4TZ6ooJmRu0yjEaQ5CXqmQeZSB3Pyr9nPeZh/Nb3?=
 =?iso-8859-1?Q?6UUFylhoJg0rK6rja07wNxtIWWSwrVHkahDsdRSiKDM5bnxDijEihvDrI1?=
 =?iso-8859-1?Q?K3VPQTDVi5hX9NrBxBkkcXXVPKHB3aXsewajeWBw18A6JZq4qlvP?=
X-Exchange-RoutingPolicyChecked: W1gtsrT0ssmhwheYvMngaQW/usPFnwYhmBIl6oKevQnd2wrgFj6EOzpVVVeGw6G1v8KyA1b3m0hWCNf9LE4cjQhBffmfHc64d7OkOgEbF3tEjd0QYz20WB+5xueb+c1yuOChGoP6iRK9O262Q07iEFNhzH2P7Qg07+Ex+eg+Yiy9O26NaFp1Ph1hV/MaSs0kTewZD9/QGK1YBqsC1b2zCJ48Z7ieVSgGnsAIVsizKokEEJgVPMZdh0ni2Bo6Br8S+lD7ynzaqvxUXMtk8SGALOiSOKhl+98qOUClLrOTpeF45R6HxQn7qHJD2z1tyMhLnk8PGXrBjsh90IfMVKHlhw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3536f63d-0ee0-44d8-d38f-08de9c90536f
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 14:48:02.4914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SYV5KTg3oF6ZK3tbi6jE0Wz8Paiz3r60K9ijYJSAFx1ERSb2LjUEydEK3RiQqlgrlaDAmBxEbU13taBFpdpGw9u3GPt/uIjQhVts6khxZEI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7326
X-OriginatorOrg: intel.com

On 2026-03-27 at 03:15:53 +0100, Ahmed S. Darwish wrote:
>diff --git a/arch/x86/kernel/cpu/cacheinfo.c b/arch/x86/kernel/cpu/cacheinfo.c
>index 91020f85c000..86a8e1dad935 100644
>--- a/arch/x86/kernel/cpu/cacheinfo.c
>+++ b/arch/x86/kernel/cpu/cacheinfo.c
>@@ -237,16 +237,22 @@ static int cpuid4_info_fill_done(struct _cpuid4_info *id4, union _cpuid4_leaf_ea
> 	return 0;
> }
> 
>-static int amd_fill_cpuid4_info(int index, struct _cpuid4_info *id4)
>+static int amd_fill_cpuid4_info(struct cpuinfo_x86 *c, int index, struct _cpuid4_info *id4)
> {
> 	union _cpuid4_leaf_eax eax;
> 	union _cpuid4_leaf_ebx ebx;
> 	union _cpuid4_leaf_ecx ecx;
>-	u32 ignored;
> 
>-	if (boot_cpu_has(X86_FEATURE_TOPOEXT) || boot_cpu_data.x86_vendor == X86_VENDOR_HYGON)
>-		cpuid_count(0x8000001d, index, &eax.full, &ebx.full, &ecx.full, &ignored);
>-	else
>+	if (boot_cpu_has(X86_FEATURE_TOPOEXT) || boot_cpu_data.x86_vendor == X86_VENDOR_HYGON) {
>+		const struct cpuid_regs *regs = cpuid_subleaf_n_raw(c, 0x8000001d, index);
>+
>+		if (!regs)
>+			return -EIO;
>+
>+		eax.full = regs->eax;
>+		ebx.full = regs->ebx;
>+		ecx.full = regs->ecx;
>+	} else
> 		legacy_amd_cpuid4(index, &eax, &ebx, &ecx);

This part after 'else' also needs to be inside curly brackets.

-- 
Kind regards
Maciej Wieczór-Retman
