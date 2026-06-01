Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5A73B9D81
	for <x86-cpuid@lists.linux.dev>; Mon,  1 Jun 2026 14:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780323636; cv=fail; b=HjCukHCyhKXHLbYcOTwzdkjdEMg7/E5lXLumVIDQz76V2pLER3ooFg//JyistnodC7rgWE5UgY5ahmXzP1VhWc3cyJ8HgQaE4TlIJosO+vaJMF9DWzEnt451VzpzPTgWkQYEJmwZXBcR/QIi+HkXxKx5nVunQeQZb0Gvi6d42AM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780323636; c=relaxed/simple;
	bh=HzDzu0BoBf7PH+sgCQV4ratOMNkhfs5dZSYpAHPwMwM=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IJLrRgQF/q46TA0gLMirT7Wrugds5ST13EQv9gvmaZU82JtBQCg7RX7J+MXSirYiNJnxuLhNmLYUlH2l1yXq3z9AwQrkwqlNHtbs2ckDI33td6FkYgXFsiOFK3DFDd6Ng9o/N1vbC8RbwX/yjc07F1NaV1WcE5ZHZsIRa7Ws3ks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q9WHtRIw; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q9WHtRIw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780323635; x=1811859635;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=HzDzu0BoBf7PH+sgCQV4ratOMNkhfs5dZSYpAHPwMwM=;
  b=Q9WHtRIw9MCHb+JdZGZsnO/4O6oX6Wqw4OoOGAqK94I8gJ1SedyHkFZK
   hJBUecXXhNnR7c9Q3YrIzbwD2/sTalWGqa/WIg+kEM7Ek+W4aw1FsQZvH
   +6gpSqDCmzI5p7G61B90n4b80Is/BAFE4iN3kPfPs7jMa3Ts9NagMRa/d
   uu7K1pdKX8h9rn/+jpn5sZbOgiiVERovAj/kIzfD9/WQrV48Cc/vvpbzy
   WtqchEpLQLIhU1jqgXE+BgweIzL0b8b9XWejd4+EDD67rejJWR2vLeueb
   z0jI887w4i7VHtttV0ZUqjWVvXFbCdJjKZkKhLpsBfHzSJwtW12mftq0j
   w==;
X-CSE-ConnectionGUID: p60LX+uHQMOPCyg9vf5EJw==
X-CSE-MsgGUID: WOqAkThHTqOwG7JYOD2d8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81141226"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="81141226"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 07:20:20 -0700
X-CSE-ConnectionGUID: 976OvFN/TuS7gj4qIcZw8g==
X-CSE-MsgGUID: PRkK0VHhR5WWVg6qpeLSgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="248505541"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 07:20:20 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 07:20:19 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 1 Jun 2026 07:20:19 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.16) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 07:20:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KSg0ySD/7VK/4FWirzqJo//ELTD7pNL8ZV57u6fdGJ7Q8LPegX4BvcW6G8+G9wgdzNHyvHB6VYZwocKW2oh8RdWjO4z1BQtmpHP3NG3IOi8ZbvqKJE9SsbXgDCt2ASm/1XeOlzBzNcUXWnVU7jZSNW8rQoRibxWzYentklf/eSbK8Ows/XrY/GvZ7OLAFWrh5I3rJ6/PhF2tVcavH0d9gEwufk21JyBQwn7RJ4r+WJLeJDCSoA0hHFUBbt1+jPr+uPQcvoCXJTvqb1JNEncMmBaP1YwG+XczW/DU1rG9dpMeYzk9/JyRpbu0cqdfeS0rR5LCafqiQDMPxS71qQLXXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a5MMwDwjaF8e+0JXTuba/C1btbZc/k+9ZOV0UOMKFLM=;
 b=iKgDxVsLekYuBZlLJj6q+qyT63UXeMigl5t+MunwcYs2VGUPDESDoPihvWH2Z2NIn8LuFaWFS1/rMOgvXb/yUhnbpV1QTz3bKFJdfPWLLYjYe6u2hTOQN2BEdNS/W24aLJHgccgpxY0oKOw99tIb2HKVXRoocAfPIse6Pw/66IHyNq/xrbZsevcMumjZX9IRCNtkSZ0kUmNw7dyAMppYzQAJ9sxlbXUfAmypVm757cUKMsiRY4AYppL77BvZzhBuF5VrUN7HvQ53SG0bEegbRNQRGUnLOtkPH7+/nPBxwK1sXzA56Z2T7e+zmf/2uUvjrTMz1/oNtBXWSk+442IE1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB3282.namprd11.prod.outlook.com (2603:10b6:208:6a::32)
 by PH7PR11MB6554.namprd11.prod.outlook.com (2603:10b6:510:1a8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Mon, 1 Jun 2026
 14:20:14 +0000
Received: from BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19]) by BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19%4]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 14:20:14 +0000
Date: Mon, 1 Jun 2026 16:20:08 +0200
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
CC: Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, "H. Peter Anvin" <hpa@zytor.com>,
	Christian Ludloff <ludloff@gmail.com>, Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>, <x86@kernel.org>,
	<x86-cpuid@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 059/120] x86/cpuid: Parse CPUID(0x5)
Message-ID: <ah2VAgG-fmW4YBAv@wieczorr-mobl1.localdomain>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-60-darwi@linutronix.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260528153923.403473-60-darwi@linutronix.de>
X-ClientProxiedBy: DUZPR01CA0015.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::18) To BL0PR11MB3282.namprd11.prod.outlook.com
 (2603:10b6:208:6a::32)
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB3282:EE_|PH7PR11MB6554:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c91fb88-c319-49cf-9e77-08debfe8e5ee
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|18002099003|22082099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: xiBTKXM/pzSkD3PD3H8+Y7JZF6KilQr0qPA3JiUgah9Qt7tpl0LgiJYEicA6ZIwQl6iY4z44/+xfZPuCJKdaPmICGYzk6EwEFsYkr5mzwcKdCmNA+dyE5z/2FAiWYDoSirpA/mLHSd/yVXL5MA+BDsw4rBqfgagCgT9sYEByH7ervCBzqJmBJZ6tZas3No720E6ulk4mBP3vbvu/nREYF+lxICFmeRFSQ7syZoeK1HohmreHnXPFe5/JKtLnmqXojiuMoAV3B/q7bsnt/UFBoA/E+h++JbtRzXEGnWkJLKfjHuksNRr+sKSUtLMEb65rYZ8LbhG6cjsFm0WKrBF5tUhMbbhu9NkvmG48u6g/AELPwbiSQfzcXoPg5OjM+Hx12FsRR0gWuGLgqlbmm8+ulUZTrH6d2sohAWQa1YQBWhr/Zu7F1tx8MNexIZ4y+UG70CgbSgWPxO4Gs/KdYDyih9um8X6vVe25OhbtCwGV+xFqpIGrgKTm6GTuf5mSaJX56yVV1UJtuXHD/G0HVo1FuYnP64HX1voWNOCwEbd2etojaaZk6FKAnViT4AaG9D8hrk+byh2S2paIUtDkyCSZanNuv3iVmy0lQXERMPsHffrU66c+QA1EWufU+UkiqjgzZzSj5fQm6MkrX/po7TJojWFKn4eKauimiWsolHKO/gh1Vx/PahubPpypu/9JdaBx
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3282.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?vj7BjPv+pzCrFmy87C2JInBbKlDR5vik1Gt9JG6nSjykauSSTKLGIdI3L8?=
 =?iso-8859-1?Q?jq/Shnftkwjvzjc//4EKLxdCW8gO8dzYonNGFU7CKUR5DfnP+3ZMnQ/lh2?=
 =?iso-8859-1?Q?uN3ipSS/c6t7WXH5fonsnMfwe7DFNJDB3GMB/B/7QU7l+Y22LV3sPP8rUb?=
 =?iso-8859-1?Q?h++7CVm6GOkIWx7htnsgGzbEjMSqVEOMfBUjM3wY/I2JYNodFjyzumUBj5?=
 =?iso-8859-1?Q?EH9Y3ju+M76DfQ+XJVte9TqwjiumRmR9q5AU0wu0pPuaK8mTkMaHR1A6nD?=
 =?iso-8859-1?Q?TqbekhWx2GhBR25B9CTK7wtKW3v6+sk0Yc1Xam8rztgXzAya5tBZOa7+iK?=
 =?iso-8859-1?Q?sQjPn8obTK5tLcu6dvkKUH/AndJL57cWhEE2nhnaGnBFKo9f1R69lwrxnQ?=
 =?iso-8859-1?Q?bb1IiAIeG/p+6hULU91ktXvntguMa2bPCo4uFW2YV5coQMz1MwQIPbCLfY?=
 =?iso-8859-1?Q?ToOnwPO00RTACbKDaeK/Og7VMfLuJr2wq4bH5b+NzWu0oA2z6V3BKF+PbW?=
 =?iso-8859-1?Q?jASnYw+L8dbf3hvyrLSHAruexJwMZEIaQsObkigioCgvBvwB/9O5itPd6Z?=
 =?iso-8859-1?Q?9u5XwRZT7rPNo7vBTe2Up+QZL5KfE2lSzo7pSX5aViOzEMwsGVCc0BhF+B?=
 =?iso-8859-1?Q?sKRcL0Rz9+fX/y8Kkib9zWmEOEaoasXOHwIdcNb6eZIVjYpLe6aMsE2u4a?=
 =?iso-8859-1?Q?jYyX6OB4L140FrPMF60q2hBvZ9Dy4KJFt9xsedYwvUWgaI6JrV+gMXbpB9?=
 =?iso-8859-1?Q?XfM6YXyKin+haTRDgTsdb0T/SC7PeWq8BM35syHdbUbx2qrq3Hsb2rjHEo?=
 =?iso-8859-1?Q?HQbVEegCseAuMOoGlNzOJq/kCYnl22vqHtfvQDKoZe5J7CHs5vFMWWX5Ca?=
 =?iso-8859-1?Q?Qskp0WJxNAckI7X0fsdsF6CzVXnwtHAPx9uakNfJmyhgf0YIrvmn0YvUS7?=
 =?iso-8859-1?Q?taqXGIgBHRtThtbj/RaTwsiSf93dtuVh+dZe02tRHY3MYeno5twrg/wqIq?=
 =?iso-8859-1?Q?+5qgoiQT3Sjsx5viW0h+hdVAlxjR8wYz7qOFaj0t/qhQ8vDCYVbpdVvJwH?=
 =?iso-8859-1?Q?fSpWhnGcqLMRVACWFO8xFP6W+rthElhqtamN3oN2BggYIrHG0m/pJmduG6?=
 =?iso-8859-1?Q?WwSUb2OPjh2jeAVOnqU13JaaYV9I/ns1EtOjYBpq3MactF24hs9I39L9yD?=
 =?iso-8859-1?Q?08t4+eAlVO+CKffHFmKbEqsSf+Dfntsp8tRLhGQifwxfBsIfKMKh8k0Jab?=
 =?iso-8859-1?Q?ZByq4yE0Bg0QRFCEwgDrH6By08QMsQJ19Crtq/VnWWjY5xGj7EbNHBbIiw?=
 =?iso-8859-1?Q?1/VFimjvdW6cVBTPz5yHKmi/V2RGfuHcoTmtm9JZy/sfMKAj06WdGkDvVH?=
 =?iso-8859-1?Q?rypi2Bb0o/9/0zEyjyxjsbLYt6REdMWZz/9A0nQOKS544hIwL5atNZ4IRl?=
 =?iso-8859-1?Q?1iIPti+vvODjRpMXsfvUPyCvWsZ+bp9yld7xW67CP/qSLgQZTKMzIw2M8H?=
 =?iso-8859-1?Q?nYCMxw9CsP+VGuhzGX/WgffNv/d3XsBqC96sL8SfkiYVP0aRljdm0r+o3V?=
 =?iso-8859-1?Q?UAPDigVs/P/dSK+ujd8PUzoUGelMHMrUVvM7aePFe38GzCbTk/tENelv2f?=
 =?iso-8859-1?Q?QNVOhqzaHEHOg+jfC/hykfBabKoB4R4N4KFmMVQ+vCkfjfmyucu/nwtmeP?=
 =?iso-8859-1?Q?8JUg+w3HZSyxUHF8TZUCTRxC2kX099/pN4w/BF7nSr5Tx1r29nH35eIKDP?=
 =?iso-8859-1?Q?Wk8i4Jg+LP0KqK3EDNRFyQwISJZCnrwVBOyu9UNyIf30tnkdIeHevcruVR?=
 =?iso-8859-1?Q?CW15pEKtaGaeHBIZBsATNddiIz+TZHV5KbbX5GHL1phEEt2d+ocU?=
X-Exchange-RoutingPolicyChecked: YRnaoPtnmA62T/FEhhMZjduXMBZsTC+sqEkw6QmeJRUGLKGLeRAK+ZvBNpTGl3McpKWh9lb0yc7n3WwPd+8pmO2lB5os45oj+lyaKXwnJyalrVsNsTarZMSn57EgGLrt3aLJyS+1yVFfcxJiZGODZkyeUzydQR99R/Et2oX3U9uMGsyuh+f+9esZsFBklscWWRHqhp6nFwFzpDxaPHINKQrLWf9WzS8jBW61WcLmxjgDJFXib/0MS6sP/mCeEdvyhLLG9U7QujENsz2v5gMeUW85tu7VgIXeVqqoXu5PRMpVqfTuZ6mT3FSiPsc3EOgoLxXmyav9vUMxMLRK2JK8Xw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c91fb88-c319-49cf-9e77-08debfe8e5ee
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 14:20:14.5313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 48qige8SU4ARBv0te0Zw5DPjMrdxcdVA0kcvhCtMjVGLF2E+UpV42FUpWfe35i+QIzKQM6HKsZvN8l9hyUoBjdNBOXmoEad+z+V0KeRtXQc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6554
X-OriginatorOrg: intel.com

On 2026-05-28 at 17:38:21 +0200, Ahmed S. Darwish wrote:
>Parse CPUID(0x5), CPUID_LEAF_MWAIT, so that its call sites can be converted
>to the CPUID API next.
>
>Introduce cpuid_mwait_n_substates() since its logic is required by multiple
>call sits.

sits -> sites?

...

-- 
Kind regards
Maciej Wieczór-Retman
