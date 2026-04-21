Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E03D2F9984
	for <x86-cpuid@lists.linux.dev>; Tue, 21 Apr 2026 17:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776792478; cv=fail; b=Hwuh2R9Odmou2ArG5aoXDQY77gQ+rge8SF/0J7bYDisGNTOkmsT5I1q0DGr72HDeKH51jLuKgzJGWXsY1hhfhO2R0FHgXGN9uDfkUKJdlqtMvjL/n3RZ+s2KoHho/XZoerB3GJUOVYFh+p5AzzjpT+9pb0Ha8F7RH5fuJQORCCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776792478; c=relaxed/simple;
	bh=EPva5C/BQRPRISmhOvQl6f1OVMY6tD5/cHQOZL1RpbE=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=p10laYD9NbsdF5pmVBFwedNDB5FYyfVvgW2youRUIRhhDwN96OGI0t0hRrJhbgQuIPpnkcG754cNsrp/i/Vi+ZNKcT0dPBRrSBgbngFGJNCbBPuejcau+WJAK8y7XOXs0Tcu+W/Oiw9Qn8X1z3GTr3JgMOyWJoTzEeK6CslfKNU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=awhYvpDz; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="awhYvpDz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776792476; x=1808328476;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=EPva5C/BQRPRISmhOvQl6f1OVMY6tD5/cHQOZL1RpbE=;
  b=awhYvpDzknzEhSJJ8qcpr/ezVuN8X8bqrMWk9UHweuPGNYaZ1+ouzCQY
   8f5ahnPRETumm4d82gUrWzwxMeHX0fZBDUaHj+XGWX+cbYZEOUIU4/VzJ
   VfFY3IUurtUXkf6kNRpgZg8+F8Ujsmke1hqWPhlT/hT4Y5HB7twA+SzMT
   Jgdn6ZJmEmnxVhNewzuBw8CFu/qoVotq1iksDcuHiSFO1WGMZlvhKkzSt
   iZjwY5g7R1N/s3eRdlZ47OlDTqaW6sZ6Ip8TDg753W1d2RN6aZ2Mn782B
   1YzSRlEUcgG9+M/z0t9V2kSKKwpPrauwoxZ7PSa/CuD6PONZ6yeDoNEHj
   g==;
X-CSE-ConnectionGUID: u0DyxDGkQ7m08XNvDfpdIw==
X-CSE-MsgGUID: WEMpwGxlRwyNe26Sv6k1qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="77748893"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="77748893"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 10:27:56 -0700
X-CSE-ConnectionGUID: XT1EkwzzSS+M2It43a98Wg==
X-CSE-MsgGUID: QqlgY7tLSyGkDTjAODws4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="225595145"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 10:27:56 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 10:27:55 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 21 Apr 2026 10:27:55 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.57) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 10:27:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EtpOHlea3wf7/2KPnGEgUuqzlzCpqhbT8SDAEAXd+Vzj6aimX1noepHNRwoWhav1nkuaUdN3tbpXZxjtBLj9xcMLIphICUFKJGLi+NHoD+oRspwM/RqZSlgAZGsDnPaMNTdsqutUjAK7pA147zsWmEkDj/1p+Sw//pvSmq3E2Im4vaCId6YHN46ju2SYrxgE3c70pLev2f7jrzCgWcNUwn2mX+etqWqWQMGn4GPTFJD0P72M/89lALvQ7stVT8n3kh7nhCCa5tC5pjFwoh0XIyDFKuBV6fV+Zb4Xl714UlYRXqA3Y7sXXeox2hHNk+xBLW8os0tC6QFbPj5Eq7BB4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NtAmdynv1rVsv27+uCVcHLgV/jZMZGgLJwdPqXy0OP0=;
 b=FCWrkG7OuzZ9inRmjkzMlKjIiLZYWBGR5+SItKpD504riq3oB3o34JSJ2q6he7njPSAArKKNiAVzs8bukGTTUd4rEjAvfgYYrSiPvrOsE+swo849r1NbuDU3sYELX62xdGASPJwuVUc9v0cpA1zzglyj3SGOiiojOhpC6GvUd8Byu6DLNFKTpupy/VWJM/N4NySwmOaz7QaKn9Qd8MbIC1g1CnJ6MUsI3mIIVINljE1mD55qT2XS+y6S9At+nl27o3ODTM26ySyV7JG7JxhrfPHLITtuSkuSQk/n5vOV9nV5iyyGgzFtIt5yaYPem7a/oeWiIPtcBikjNqQjAuHW/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB3282.namprd11.prod.outlook.com (2603:10b6:208:6a::32)
 by PH7PR11MB7148.namprd11.prod.outlook.com (2603:10b6:510:1ef::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 17:27:51 +0000
Received: from BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19]) by BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19%4]) with mapi id 15.20.9846.014; Tue, 21 Apr 2026
 17:27:50 +0000
Date: Tue, 21 Apr 2026 19:27:21 +0200
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
Subject: Re: [PATCH v6 00/90] x86: Introduce a centralized CPUID data model
Message-ID: <aeeu5hUusoPXN-vc@wieczorr-mobl1.localdomain>
References: <20260327021645.555257-1-darwi@linutronix.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
X-ClientProxiedBy: DUZPR01CA0074.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::20) To BL0PR11MB3282.namprd11.prod.outlook.com
 (2603:10b6:208:6a::32)
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB3282:EE_|PH7PR11MB7148:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f062fae-cb1e-4d62-89dc-08de9fcb5016
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|22082099003|18002099003|56012099003|18096099003;
X-Microsoft-Antispam-Message-Info: DyjE+6x2d20ixGCsw8tlg24zyVDBH6xsvlKO7Qn890JP6/Jwrs8i5NiFoe8qc7qIgRb3iFuXqyrIqWB1TkULVlrsKZC/1Kyd7xqNSHVK3+S87MXq3CxWvySauxIUi0qUP/wbZUl9DVrBMP+pWOkBuPTflbO83+vcp4OgK1MHqQuoozPQJHSTzlDXgM/5pGgQeJVfi0GB0VQdBBp+mgvDZbUD2T2ZDyIEjjtDkIcBQOgoIMDdxTMR4+PRm27D5Gh8tZGVVz/IRFF24QT7uz0vGqBMCifq1naYjkT3pPl2qBStJnNkXCwhXgFWa/d5ZOxcHfjQ6WY9fhMhd1agPz/1bQA//A7j3orKxHF8wPL8O9YqAEEfz2zSTl+TVqjFlXzMappYLQI8h80iVRlRjUjuzysTejEgARG199PfGidv6GF2/4AVxkf33UVylNeTiWVaQ4SrzD2UgZXR7CbOfabVXlPNZoYeq3l77AgQNNmsiouIvuJRdsOnaYU0wYDIDtKltDuK+NfTB5AQJXvM6iIhlsU2vDetkupNqTro90R5wTcolMeKMMlBa596JG08xL3DakNJ2BecjAWHbFy54FxX/LhRuoNYB6UlbPd+3WD0yADyFly1431g3l45YkorB9F1d7CNxVMNRVuRSF4dCbHVNRap43P2Xegl6tlcvRDHnyBmbThLoK2AMCoZoM+96IXfH5UENc32BrmWkHxQF7ZhywsupaGgnK6BLUiMg6i+qLc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3282.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(22082099003)(18002099003)(56012099003)(18096099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?qnK+5PKF8C+akGA8KdHOUaT4VY7ybQj1bAweP8M6f6F5vBU/fomqfA9vDz?=
 =?iso-8859-1?Q?n02lWEaxGIU/ht+mTO18iaA6b0wUyZTJyVOHn2b9TJQRFLAFhoZXvgReCE?=
 =?iso-8859-1?Q?4iToksA5aldTl5HCdFOs7iph87c6pdRA9w1YvHLHPXgJ/gF1+W7IOFX8pK?=
 =?iso-8859-1?Q?JTmqv0uW/JUGAPRCSaKNDhymjHjYqcIHPZGgADklM8OQXTjt4Sc98uOSDy?=
 =?iso-8859-1?Q?vweam+t8MdT1RvBCKFW6FS7Al1Z8I8RJ1tmg1otjmTo7ogJIlHqj7UAGOq?=
 =?iso-8859-1?Q?6+YOWkJJXpgK+YHh0v6NwRJtkRGLmeDfi3cwX8nXH89qmXH7CVmku5+ENq?=
 =?iso-8859-1?Q?9gPrcnvuu9fSmChrF0Vm7OgCQ7eJFSabzZr6cN7aBRl2RdEwUfYXrt2N/R?=
 =?iso-8859-1?Q?O+EmX7I4OJHobElrpmHtGcwD6k7tihgkOptrwo5qpLwaHFq3gmNEHHzv6S?=
 =?iso-8859-1?Q?2kLRKRtu7R1A9hWuRg5nTBD1kNDvOqFYQMchvzHI32RD5aHdUEKQIFJNqq?=
 =?iso-8859-1?Q?K/YXGwawQTfRYMJvFNCEifVEelfBfBiPay/Fucugi/S7ywoEKTPwJXplzX?=
 =?iso-8859-1?Q?xAlkLt7MVvtnBNJK2hpOu9BkXEvYEbXPxO37qwn9ZDD/ysVyKpPbPnI9jX?=
 =?iso-8859-1?Q?IuGiFL27O8vpdUDNgc3iBG85DPl3d3BM/mc0VV98+TeTuBAPuxZVhM8DrO?=
 =?iso-8859-1?Q?r2clIyVJT5seX3guYYeLSGJmZ7lhgb+8cqT6afajBZrDzwmhFPO3X635GD?=
 =?iso-8859-1?Q?YPo1mQexzd18Wk65VwyDqE78PXIGCHYxBEXnvsC159CuSouf5StBZaaaMe?=
 =?iso-8859-1?Q?A8XDRNYx2Z+yw2ft059NP0BSAlxDfC78HHxUZjryPBk0R03q9tLh5jXvUl?=
 =?iso-8859-1?Q?xn/Rl14qm3/c5Rihd3YZ0eNcX2HFFXp7ALMdYmT7cLx3imuQr9BIspo0/e?=
 =?iso-8859-1?Q?49KHsy/ytjnnA4mWlnHRoNFNqXyUAyZq0fgxCduSj2TjEOmrVHCSQOT25W?=
 =?iso-8859-1?Q?dSK5hL9FhMksGuQrEHoQVOd37Ep4hLLwM6kBWoGAWs2NafohqNqvIvKyEJ?=
 =?iso-8859-1?Q?7iQSoNPEDFD1i6873xS4mU8H5pUDWFhUDy3WS1TZnr9tGxme4hGfMKQ1q1?=
 =?iso-8859-1?Q?bvjT/T5KQGFNTPjW8kRNG9VZFi869+zP734QwwMhwTZIoL3t44tgzW2uVp?=
 =?iso-8859-1?Q?0xxyIa1jh332zmaNHzLuMXTzgniZs9YemFQC/Xe5TM3rbtDNYcr03t8GSV?=
 =?iso-8859-1?Q?SMOvIB73qJHsu9c59PX+MVedJo1mIl1uuRMhWuGXNQYKHTqdiFTMzzClIw?=
 =?iso-8859-1?Q?AsWqsv4pgK2DYPW3hCRdG9f46rsGyc1NfMPwxt8MQ2G/awJw8xlzsyRolp?=
 =?iso-8859-1?Q?dXNU54U2I38RTWZTdF34iY3QA5Vu9yVvfTFS9diUJR29mqNCGMm0pVJNI7?=
 =?iso-8859-1?Q?mrkXAqkYO3nPoXAGzrUFOTb2+lkKSRDiywRGh/7sJx9BcB3c+Q3diOujQb?=
 =?iso-8859-1?Q?2L0zV+NyIpcS4korc4Q5VtTZ3fPUVOkanqKibArP3Jsszl7JDgdg/onSX/?=
 =?iso-8859-1?Q?ovTzbPRJ1m7rSuDV3nsvDA0lCFza5/LHLYksuLQ2zxB2L2P1xFakK0PCGv?=
 =?iso-8859-1?Q?RCGsR+6EqtAZP+cGAvMB4ubcuIBu6P3dylNi8EIh8NsheOlco0muzwHpRA?=
 =?iso-8859-1?Q?REnJo3YxmWx3PxIymN3IyYcOlCw5h/UFQJBl6hWJJCLX4iK6oIg3bm3eTw?=
 =?iso-8859-1?Q?0ZPdXnErllSLwhESdfnjH+a5A2sFx1QExrryCehu1+kDdfuj8kpjL2NWAe?=
 =?iso-8859-1?Q?X+qJSbGMmrUgfs7aZiaXOY6MAa6AoBMpGpfjqs9QAPAGqer+OJ8J?=
X-Exchange-RoutingPolicyChecked: A+gfCR+fKPWCNNfnvuAki0JYbYUQrkV8h4DQZ/jhfFpHMIJmaBblSB3k51HDosHw8EoCmeWmAJeA8qRgzCI1rZ0Dxv9j8CjwJJNy0N1w3Xafv6Z1qV2XxNGlDBrtJrb8Ppo3h4dqNSRRk7GyytYyAsiuFV9Y+xCt2dzLS7Z18SHYpiO8ZgwPNh6vVUoKVU4/e9jdIfgVsFuUVcjJ9VgEB4Q9ZyuJmxY1gzONy/HGVsTNDAoOhtozBTT9LEFMd0qy5xK0zDg+zcOK6f/CBMSsc4njv8dMLm2l0rCz+olxnboCnVLF4gv6oW0Y2xCJq40WAjeMloj+E4vLvHEviHV4XQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f062fae-cb1e-4d62-89dc-08de9fcb5016
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 17:27:50.6594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cw/hYzwwo7b+HpOzpUKCkGHx5DKaTmV9uNYK0u+4I7PSuso0Y0EYTLHRZsXD1r2sV/NZArdYN+aLJ24F1FQX28dc01hFpN+IliS+GOMWkcU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7148
X-OriginatorOrg: intel.com

I've now read through every patch and cross checked most things with the docs so
I think everything plugs in where it should (aside from that transmeta.c thing
that the kernel bot reported). Only left comments on some code formatting stuff,
typoes etc.

-- 
Kind regards
Maciej Wieczór-Retman
