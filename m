Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC033BBA0E
	for <x86-cpuid@lists.linux.dev>; Mon,  1 Jun 2026 14:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780324215; cv=fail; b=LAoz+Oppu78arl3FybQt2JXh8cfC4GPol3qqoTaQg5nf1XG4YaU8+PMY9LKIkaKsv0RZZUtqRpECXdHvXlyToWFKHf6HNc2x40zj2iHMaNBbQ48j5d9VeCB1SCTl5uiCvhQcPJngrF573k+8pNKAs7k3YSttSVGFa+yKw/MActs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780324215; c=relaxed/simple;
	bh=MCyR1xq6yBvfqn+f0rhAKlzj3XaMiRlvGRpwUy6K1xQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eYjvdHx5Gk1gBDc4XuEYp++yL2Fn8hdXD7BUHnIjAeGfDmVQ+uwuTp+Q9O5JLnOYMaM74Wn40uE0FzHrhKiKFprO43XQgTFiv6dh3TOWcPZLc6OwZdWFvYzMDNvWJCSUU/8FuPVjt9rfpRm13oRD1PfxSLIdhyqo4gB1an6dlmo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GHxrfhNx; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GHxrfhNx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780324214; x=1811860214;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=MCyR1xq6yBvfqn+f0rhAKlzj3XaMiRlvGRpwUy6K1xQ=;
  b=GHxrfhNxLzQiZ8xKtGN07Qsz4DG4sPlbGmPxoFcncfqm9SQfdvKQMWTe
   +XrPQF0DP+We/4pT0SGlHKZhwAGa5Fp35BdMr/8HT1s2RoMYK1tv4Bs45
   COwxQvjEy1KGkRjrpUhuXfu8FX0/QMBC14n6jEJqZ0BP2gRsnjyBSg8kC
   jZv0TdKG1uTz1b2oQ9GtqHYe/6jzkGu2d35oqqyQCuCCwY8rYEZpLDX9q
   2QdZU3qnZEj5eJbsJ6ymH9/RWdXVrLZ0Ocuh8PGw9GbvKFM3KUA/W4I3q
   DVefg5WLshzr9Ft5s+DhHypCi8CrNudFFECTVUCLDx1z8eAEImA8Ncb7l
   w==;
X-CSE-ConnectionGUID: 198ampSmS+Wz1tft1RabWg==
X-CSE-MsgGUID: 1QGzIBlhT3qBirfvcq7vdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="84969985"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="84969985"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 07:30:14 -0700
X-CSE-ConnectionGUID: qy8YuVpBSIqXgWqxbiAwWA==
X-CSE-MsgGUID: 8yzVwJ8AT6qVJA8tpWUlHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="247549967"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 07:30:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 07:30:13 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 1 Jun 2026 07:30:13 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.69) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 07:30:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XhQOTDkt7yo80XbUWzyPaOPS1p8a7n25lLP22ApLyWmr4uKE+aDOQ1GDy+OCsQ/KZh31McgfjDvmjV24RCJH+g/RqbdtXtRxQnP/RFSuP8xzZKLmv7km7J0Aq9f6dlR5vqHFvtBPba8lzJtvIdtPm4xdFLKBq6mIPQZGbuX7ReqxzHx+aKywY9oVGihR7FQm7jT+SuABGXjg849Sr0YRRVGg+v3DgHkVabreOAy8LU8BDbYGJW2OUPHIF3X38duXwj0aY/APNok49QYnGYIRG6Je7l1Yzmb5WX0xvc107ECuUevAb4oQz8ktFW6nYeg1ew2KgTMCo84f57VXMlrYwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IK70rsrZ52P+C6/c0neqqY93kU4T+JajzfwtKuekCRc=;
 b=j6MtH3tjQH/4q1gh6tCFxhof2mnKKcvDCeN7zFnDHY51dFJOZcluoZ1Q9TE0bQde8u6fQ+Vu6nJdC+9RcitcSYPNJJ7ZjyNXXlUsjI3u3Kb0g7TABoJcmDSsmBa9GgtXubos9Gm5SB568ECdunXbYhqWZrEx2+5DxRwCmyB3uxzFKeTSfjZE6+alZR9AGA1tlGJhVBBe7uXNzQCQ7UDiALRtDhxe+InBCLIaRDY5LVIpYGCimdfCBS/lncLMtP1FDLNQmUO0v+vCUBbLhqZrn38O5kmlhaZwLwKprOCViDvtzgcA6csGGSdjEjGVBkf3793DI2isJ1JOXKJOepNr0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB3282.namprd11.prod.outlook.com (2603:10b6:208:6a::32)
 by SJ2PR11MB8499.namprd11.prod.outlook.com (2603:10b6:a03:578::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Mon, 1 Jun 2026
 14:30:08 +0000
Received: from BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19]) by BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19%4]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 14:30:08 +0000
Date: Mon, 1 Jun 2026 16:30:01 +0200
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
CC: Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, "H. Peter Anvin" <hpa@zytor.com>,
	Christian Ludloff <ludloff@gmail.com>, Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>, <x86@kernel.org>,
	<x86-cpuid@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 004/120] x86/cpuid: Introduce <asm/cpuid/leaf_types.h>
Message-ID: <ah2WBnBkz8KQrph0@wieczorr-mobl1.localdomain>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-5-darwi@linutronix.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260528153923.403473-5-darwi@linutronix.de>
X-ClientProxiedBy: DU2PR04CA0008.eurprd04.prod.outlook.com
 (2603:10a6:10:3b::13) To BL0PR11MB3282.namprd11.prod.outlook.com
 (2603:10b6:208:6a::32)
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB3282:EE_|SJ2PR11MB8499:EE_
X-MS-Office365-Filtering-Correlation-Id: a4d09842-f46b-437d-5498-08debfea47a4
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|18002099003|3023799007|11063799006|22082099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: KdTTZQt+vyD5lREwXGjQL5a1HP6xgt5YY0p8aTS2NgGXAKN3O+0XzaJeqTyjDiCO8mkOkkkjGaP7iQR8+U8U5E0UPbvXnlMRNQUuz334wdnT+jONBHp/w43Q5zN3xYb9NjVWSDixjiHmWPSUMAAIe2Q83U7MBfFfhy5k1goTW49kwn6Jsvyq0AfUqlERZtUQBVVydGXRI0WFOTDddbrdBzMXaQBxyRKfb9x/ClNUWjhSGBXkTx8ICZWiu6NUFGHRcv3ux+EQtSZs31wsaRjXfaOmKN0P6zvdm9yz9Hl39e6zvR1e6DkBEBOXFoCMKnqtWvrQ7238e65WSA9w4p/HNlUnoIEAI0cTuoJP8tarVJZ+vHMjOVId6bYnT/sagmt86mACUfuErVzxbaBC3W1XAfAXMnnJfh4cOGtRdDRCHan/04AXlnI08+oUPB+Q4jJ3/4x0GBB6pizFQeSbjimfXpp1pG8u+9pz/egZ/2G17dN+0N4epTDMhD3uZj8eirTGklvblcPyeVFFP8k43UMnC9z15RT8kTGBcI4yzY81IUdiHqE+mfde3YxnK6pQXepNKuWIkHUQpvU2ciwhD5Z8nnyEwncvR1JPxp9P4F4WwO+++KT6gH28nZ9Jr9eRPUwcavNgrSww+OsSHxcFo4oPTTMGglntQsefUb2MXUF+98Whhq0uHwEhQJ0LQzUsDx4o
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3282.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(18002099003)(3023799007)(11063799006)(22082099003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?iADPa4b8Wv1Eq931UiGHafvqiXinChypiA+jUsLSdPRfiKmPrwFvwO6GdP?=
 =?iso-8859-1?Q?zLAeBoyvF2mo5iwdQAIsCWwoToMeYe9G0rDUM4EcRv4mDyPyrESl9VfTmX?=
 =?iso-8859-1?Q?n89WTscLQqatgNxgs7M66wzRAJBsD2ORc8UEXc+MbR0KimX6jh1WFzaxd4?=
 =?iso-8859-1?Q?mUdHhbq6S94EaFVaVjVLgzfM2F5HFXG/LzCJ3UQs+u0SItcL/gA9lqAlb+?=
 =?iso-8859-1?Q?Z+kj9VaNLefIM73fjsGNjeK2HcdLxrQ28cAevV+F5P69w6uBinvq88tDtB?=
 =?iso-8859-1?Q?ZfuHRB4DeAPHFHgqPWM/3eISB5iUQgkEC9Eyg2fgC57hMUj4c1ekKmzKbo?=
 =?iso-8859-1?Q?kmR937biNeOH7jdFFaXLZbJgYqhoD0QcH/oPPyQvtJJXMQBNk6UvPJCMzl?=
 =?iso-8859-1?Q?VtBPyovZm6GgBrIsIEWgvgUxY+6nFvH21rJ/n4NzZJX3J0ESweKuOKbUiO?=
 =?iso-8859-1?Q?c1V/dGwdFSdRPjnv86YuIWu9YDxyYa9DAdIcmPvC2Gkjv1/9vnt89yjvo6?=
 =?iso-8859-1?Q?YE6OcqQIbo4o97nTUyOZeWpsLWkKwXniPGtnr3arzldeDi4WWBOCGm2mnU?=
 =?iso-8859-1?Q?mbIwZQ/b5BrJlbT2yKLuHj6axC+EpTbS1v1b9ollF2QHEx0Zg6Z/YEFtua?=
 =?iso-8859-1?Q?4EnjsYxwtjR6j1eFbwWX/7/c31O3P7GCoxgmNUqwzqXmBQIfwLls8r/6lE?=
 =?iso-8859-1?Q?DlCqHrIBBMDQmjrkVyEcTfGe0fFp6pRAX+FlvqZieu11o5Rmm0Ccn8g3Ly?=
 =?iso-8859-1?Q?KaBeA2gwsfN10SHUf7gjZi9qpZ2JI3Ee6LNgu13d7vBJQ0wtCHP8BfAbyu?=
 =?iso-8859-1?Q?0oHMzX1O2dqWJRtKNzOGunOPUCEaDNs9uSeXuiW7U//BHcO1CxY6Je20I8?=
 =?iso-8859-1?Q?nUEqHvVqTFOwSftp7i+++p7zYPybpwkKlc1dCtgLAvppOBL6OD84xjWTAw?=
 =?iso-8859-1?Q?nOurxTdo8ZBCRLYKaWEf+lfv2SiAPsxoHbDsSv8agcylPeX4DpXZzWVO9d?=
 =?iso-8859-1?Q?37vi8W4X4UJDJQlfVSlQkugFkYTlfK3bo4+GVhxlle/LGKePRT0bl9Anwa?=
 =?iso-8859-1?Q?woGBcBquu7gxco0z2l9N/bjwHTonGBSOZp3I+4U00e0ew7ZVBMkiQDc6Vw?=
 =?iso-8859-1?Q?SltwwkoujWHsVOdW3FVWlq0EAab3WWG8Y8JooSAKbsEIrVbMTbv9jkW5vz?=
 =?iso-8859-1?Q?AVCG5Q1L0zSXc4B+fbiwU3ON945CJjOEsoD+E1e056f3H1vekEX8oWhNk5?=
 =?iso-8859-1?Q?Bd2e5hDTIIc1iWtpgo0daMoT5IGRvWtD+UzyA0JdRaBx2n7WYNlo9xqDhA?=
 =?iso-8859-1?Q?oQi+fZ1DJZjPZYXSEr1GxbJmFpW9cwR31fqXGRrn/2ZG2TIpa81lRnwlRt?=
 =?iso-8859-1?Q?QBwyMNzjiUNdkVY63KAZIu0wVx/aPl242KGnklmm0U3BDJUd+JkVOFXMrw?=
 =?iso-8859-1?Q?Y3KSDvny24932hmlQsGesV6t2JAqOuO6oY746e9Pxn2lhRYU730Q2iSNxE?=
 =?iso-8859-1?Q?WbLTUDnYDKSNarxnoYEkB/gUQaIDu/yiIjzeRVu6a5VvFgqR5DyCjw48NB?=
 =?iso-8859-1?Q?7rCNB+kAunX/mEOIVOfIB3pgkQ3D+qZy+8BJSIGN1ZUz31H6asYdXHztff?=
 =?iso-8859-1?Q?rCHym/Vkr48jJyld+ILkIz2bkzmWYIOb66vU+Ci+obAWQeUeDK7/s5IhML?=
 =?iso-8859-1?Q?hOOq+9Crg8AbuD8AduUKp+tfYD848UBeLG7J0SOVDNLH6wM0CtMpsWcncy?=
 =?iso-8859-1?Q?AnmX1th+0VRaMWfFoK7Z7EO1Cf0t93fLvEeOoAvD+K3kbF+jKGwWBj/DRx?=
 =?iso-8859-1?Q?UhARuDXwuE3CJAn1gJHTipPq8f9wQh0scrjKrQRBWxu1Ialn95Nm?=
X-Exchange-RoutingPolicyChecked: rH81IuGNko2htI++LaB7GnOol92ubbUBMuU0O6nXg+XiPlU4AD+e9aAKDmjte7/Wb2UwRzvA+ZQr4cKDSKYE7z0UueW+zC5CjmUdj9yGPllCAtYvFjM8SQUSnps8jZavSViYyg2o1fK60lBhaT7cBaQ5cLylaj/wgVtO5weUIq16JMtiNABObvuL+4xHOTqA04xNMPkgwMT/+x++0QeDdunc10HKJ8mrr9gQ8kSy3uvrYhi+QWpnhJMw9ZtJr1Hq1ujnlGkq1hXqov54XtfxLH7JSMSbDMbyR8h1VF9rFSf5y3usTl0T3QPwmkHUxpFg7oig3tLl1oXoUkOAISeu3Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: a4d09842-f46b-437d-5498-08debfea47a4
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 14:30:08.1253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fOYrKnbiU+HYuUWBVRXaQJXIUGAFH8E0yOCrrPi2hl2tuG7COGTfFiLgSq6p8qHmTMCcneX9V0c9pdVMR0fCGJMIXihCeZ8Z0eQEmEsYKts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8499
X-OriginatorOrg: intel.com

I know this was already merged in but as I couldn't reliably check 2k lines for
typos last time with my eyes only, I pushed it through my LLM kernel review.
While the typo in the comment doesn't matter much the ones in the struct field
names seem more relevant.

On 2026-05-28 at 17:37:26 +0200, Ahmed S. Darwish wrote:
...
>+	u32	xfrm_x87			:  1, // Enclave XFRM.X87
>+		xfrm_sse			:  1, // Enclave XFRM.SEE

(line 714, comment doesn't match the struct field - sse vs SEE)

...
>+	u32	topa_output			:  1, // ToPA output scheme
>+		topa_multiple_entries		:  1, // ToPA tables can hold multiple entries
>+		single_range_output		:  1, // Single-range output
>+		trance_transport_output		:  1, // Trace Transport subsystem output

(line 774, 'trance' in the struct field should be 'trace' I think)

...

>+struct leaf_0x4c780002_0 {
>+	// eax
>+	u32	f00f				:  1, // Intel F00F
>+		fdiv				:  1, // FPU FDIV
>+		coma				:  1, // Cyrix 6x86 coma
>+		amd_tlb_mmatch			:  1, // AMD Erratum 383
>+		amd_apic_c1e			:  1, // AMD Erratum 400
>+		bug_11ap			:  1, // Bad local APIC aka 11AP
>+		fxsave_leak			:  1, // FXSAVE leaks FOP/FIP/FOP
>+		clflush_monitor			:  1, // AAI65, CLFLUSH required before MONITOR
>+		sysret_ss_attrs			:  1, // SYSRET does not fix up SS attributes
>+		espfix				:  1, // IRET to 16-bit SS corrupts ESP/RSP high bits (x86-32)
>+		null_seg			:  1, // Setting a selector to NULL preserves the base
>+		swapgs_fence			:  1, // SWAPGS without input dep on GS
>+		monitor				:  1, // IPI required to wake up remote CPU
>+		amd_e400			:  1, // CPU is among the affected by Erratum 400
>+		cpu_meltdown			:  1, // CPU affected by meltdown; needs kernel page table isolation
>+		spectre_v1			:  1, // CPU affected by Spectre variant 1 with conditional branches
>+		specture_v2			:  1, // CPU affected by Spectre variant 2 with indirect branches

(line 1383, 'specture_v2' should be 'spectre_v2'?)
...

-- 
Kind regards
Maciej Wieczór-Retman
