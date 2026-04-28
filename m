Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54992874FB
	for <x86-cpuid@lists.linux.dev>; Tue, 28 Apr 2026 15:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777388642; cv=fail; b=MSpnqQGIwD8WypO9hhQaI0yk8N9Oxhzu8e9rWqqXFJmSwTbGbUeDP6J2d/HUpN2vybo4V/KHRezJvGIA2C6ya6wvLtIRvrye3HBa1EZ59H8YziGm9WYH6fVdnKq1+H0jDO/bs65/Im2Ozyqr+Taj8CU9AYpIXdqDSgpL0NMkRro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777388642; c=relaxed/simple;
	bh=cnxjMV5doGMA/ps1YQ/oWJOZ78vVtyJVbRUaixScLDo=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=I38UEP7Nnuep/2C7ST1xwrs4HzTdSFkIZ4PlW8P1AOqEnUd/JDToSU2kDKscSavwcEQo5ZelQig0TwhCYGLv5s9lQA1ECZXXWBaBRw6MD9Cbyp4vemzb76Uekh0TVi/iVZHtwTAmOT8ism9tIxMuqNCnJXHxJDcv8Rki9mcgr00=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X0LlCmXU; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X0LlCmXU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777388640; x=1808924640;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=cnxjMV5doGMA/ps1YQ/oWJOZ78vVtyJVbRUaixScLDo=;
  b=X0LlCmXU4tP9AnukdlhNIFTwe6vMHQaXGEsp3t6YK5sjwUXXZdOsv/4U
   uFdT5OyKOyGzyNl2a7WAe+6viBfCJRRJCS4zlqlSnsAVG9h7m31S/zfOt
   EWmbykWkClheZsR6Y2mlmbj2BJidk6YQwdy3eEwDA1J7jBmfDtuwikQPE
   nl6UlLy8u60xATT6NVTJqwdgMmo0tq6jP8AWtNsfy3z9iy0auMINSb93S
   5bfvZtprss0BhPhvSeYbvZH0UVLVHfTK2xj1MOjSe3+6Z4pqqh/vUctuL
   0yL3q5pMmh/+OPV3EkK0L81GXbPRLgfedCox27usZhwvsEkNA468cASlc
   w==;
X-CSE-ConnectionGUID: QVYnUm2AQRScAhVAMshd5w==
X-CSE-MsgGUID: AdNBCuLuQHOpdfUICAOy8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="78215125"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="78215125"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 08:03:59 -0700
X-CSE-ConnectionGUID: 4BC+eUfARPKuT5N1zcqQ/Q==
X-CSE-MsgGUID: FxUy6e7HSve7Doox6JIMyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="234279000"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 08:03:59 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 08:03:58 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 28 Apr 2026 08:03:58 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.22) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 08:03:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XQg3uBK8PuSw5bqZDLWmH1GOtU97TVzybVQNZFcX0oLxZfYx3B4RadelJU+RsodSn6YZ7XPANgbO6bUCy9GZ8yOV3Lh69lT3V0yADLarI9hETuKH+G+oJjeUFr6jE9b6vXpIr0bk9b1Z1VJRBwP++oaOKdzg2ITszwpT/1ScqmhYWMU82g72+7xJ5AqwRXkjQjR6FgSOkm/eXpzruRQHy7tVf+thythpNl5F3N/e2Caac3P5D4Ug7XlAjTGE5nsJ8nOsLdQLlkDsnJPG7ZXflCdPHGV25sbruEPambAZgw1UVUnntYysgCfdCIyUyJSkW7MG+gwsRA3ZUeDH7GF1gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s3cC3GZ2rWdl1BbU0Ac0XjmzHbrthO4JtqbFpHHwabU=;
 b=CtMoZEO9fWnMPzxsqaZ47PScaEWrQy+NSqlwB6SwM+8cMhlvpQ9b/q45NKARh5G3njqdBss6coa9qYKHPyBlS1ONUCxv744TY7z9AKO0vyIsFAw2m6Q9Gjv8LvJ//ZwY4nhy0P36KGwI5AApzbELZdMRpiX/EiMKJI48k1zxqR4LeOHwbqHugfAUyyGL5KRfhZuvDb/gPY8e7VXhPApki7m2/PUjWLRf5gUc7ALccIqwk1EDRSQulYX2F5S9eIpXk5jL/MwDJyt0naFSdbxW/TbA4f1bE3GaKe0ckTdcDnp9Y1GPzNkZOMePhEE0QB5eEmX8PKIk2DQjYZ+gAauD9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB3282.namprd11.prod.outlook.com (2603:10b6:208:6a::32)
 by CO1PR11MB4948.namprd11.prod.outlook.com (2603:10b6:303:9b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.15; Tue, 28 Apr
 2026 15:03:55 +0000
Received: from BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19]) by BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19%4]) with mapi id 15.20.9870.016; Tue, 28 Apr 2026
 15:03:55 +0000
Date: Tue, 28 Apr 2026 17:03:47 +0200
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
Message-ID: <afDLyypH8R5rrOOZ@wieczorr-mobl1.localdomain>
References: <20260327021645.555257-1-darwi@linutronix.de>
 <20260327021645.555257-10-darwi@linutronix.de>
 <ad8qK8M0IIJRnVOa@wieczorr-mobl1.localdomain>
 <ae-8EOo1KScF1Qp8@lx-t490>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ae-8EOo1KScF1Qp8@lx-t490>
X-ClientProxiedBy: DUZPR01CA0009.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::16) To BL0PR11MB3282.namprd11.prod.outlook.com
 (2603:10b6:208:6a::32)
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB3282:EE_|CO1PR11MB4948:EE_
X-MS-Office365-Filtering-Correlation-Id: 538a0f8b-20b6-4818-5c3f-08dea5375de4
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: KH4Yl9UopO3eKcWZimjOIFeQ50gLFR3Kif14xKSXo5Rstm9zRurTy1H+QRkXqM70gsutOn8N7ITP14RqIfQhAmN7UmGECtHA1plRCfkql0C/QyCY8GWZaQ/GPR6+36zyPhWZoHSNZFQZmVUdWFvey3Lcq8CELGZHAKN6OYobtX0vSVZWnr7ELvJvaHEw5j8xE2Yc8RWXY2ccQwETcaqJkMXqEu/3kZPSpdJE9DQpchSoWxbfMJXGXlNKlPDBCPJwKg8cXyn8l91AdDx7oVYjHLzKPozA4OI4QVAVC+pvrYsJa4sdmue2O31Xv6YITbiholb5ereNmbAulSr3jsu6siv1rpnzdgM7w5DezqvaU39uSQ3yPZZIq5dRPuoQ+JFWpLkAxv/9FC5SZ300csgLDIPQzCmHrzp28YHW8JL6jQBWNMAGEm25YOyk4H9qxesqd0fF6RnSuD+IxaXegriuEcK5Qgb8tmeTik9ganaY6JrYJCtkgRcMRLCWbAvs5YSuVu2h8rum+GZgToGrBgL1eaEah2K+8as5+swLlCeE7nnBx2RmMnIf+0xmm9URTYsrQid+rOECVUNinImarkZPxL16LTtABJQGljcHAS/mi8id67nQuFWO5l9UzD48lMnc5THMPyvIs0KhwgnqSa421RZLftKq2nHYhZQ6FnYGAA3oNX8MaRxWjRkZBokg1yAguc5KcfOAXyYHTUD2qKSMZ3MBcrfpcNyRtcM//ome0mc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3282.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?VFGqKc35ED3V1dTO0YHYK7ZxMKtDn5Sj2NTtx58FlZ7Z40lCOlkW9fUIii?=
 =?iso-8859-1?Q?F8ckwnyXb1+M0EDrAtDvu6FEuA2HU9hJ6x4VoZZ4UqKqHZ3VDpUXHOqbsW?=
 =?iso-8859-1?Q?IgTlEhprTYOrsXxkKp56FMNxAvKZWuyN4rlAJ7mLrWzZRdY5ujzhy7Yd/L?=
 =?iso-8859-1?Q?n+9r/aJ943NIBsAWKq89EmSJ3A0IL3LxYVkqUmfTtmQq8lbOedtpNEd/7z?=
 =?iso-8859-1?Q?WofDhIajNnc+wIkk3Oiav9EyXXB2ix0tEMvO2yAojjvNO0Iay70AdukNFn?=
 =?iso-8859-1?Q?FZnXjPvNB7hTD/suZqVdZcm5xMdd0zpCaylKI+CFfK0gpPaER6K8kVhIq3?=
 =?iso-8859-1?Q?rsefEMzpYHgsPvUwk6mVZIigEQG634cW/LSiO9s6+julLbsjvAivHxdnKJ?=
 =?iso-8859-1?Q?b2a+zq2eHtu+N1ecBjXVbyNYF6SR0YQuNwuaF9ZtMPh5oHe9s8vD9/xRi1?=
 =?iso-8859-1?Q?v7BYciMUnzfKu2UkDsQF2HOeUiwazAs4A+ebkKhfhgOnQl35il/mVmF5JE?=
 =?iso-8859-1?Q?67uqMSKoOHQqZmDO66Easqoyq8okDzWBBrTwLM+MTOBSVMcJsY6Tw/9FeA?=
 =?iso-8859-1?Q?HzpBZoPcIs6q3ZfR8ZacDPBvgFcc9EHiQgZ3vbg00ArkxN1pEAnrSs/c4B?=
 =?iso-8859-1?Q?LUvoGrtybGkUAR1A/eCexcoYAeVEzXdwX66aHbjeiesh8zaCbpVmZ8f1y4?=
 =?iso-8859-1?Q?Yprmr4Md1j5y9r4Ld1LnLwqgHqiQF1Pq85PONLMrnhQ8iNFfqc8a1h5jcm?=
 =?iso-8859-1?Q?l8J71PHHkc/mj7xEQVRDxtvSKKbi02ZCXCTXjXHG+vHwVAhmdei0BawRbj?=
 =?iso-8859-1?Q?dQ/GYTfC74uAOSAf5jMSCi/vqPlb5ytgbKYHudDbDbXSH21cY24WIuSMyb?=
 =?iso-8859-1?Q?AYxxoHTwWOE4On5Y4geLlwyf/iA8FidwdCojCHWc8pemzF7bOWGwfnDaYy?=
 =?iso-8859-1?Q?blQ1dYFSLm0QJVKma24K7bFsFubOz4GxXS9uYu3zdCcreDZ0i6DT/ySdYy?=
 =?iso-8859-1?Q?LNKJCbveT5k7O4WZPAWUdLj7WQ7LnGCoABxn+e6tUxxd3CPZIzCbuH7MxI?=
 =?iso-8859-1?Q?fH2sEjphUJRJS07Bc/lIs5Pwd4M2v8VFf/iQNUqFjNCCccGoaDj4IQ1dgc?=
 =?iso-8859-1?Q?Fg7mLE9A+qRSoWFdBYpRjbyrcULfsLv/fmmClveJ0Xy8sIhaEW0COuSD0l?=
 =?iso-8859-1?Q?O1+8sKcLT5PFEhbq6LrL5kZSXrWa6lHFmzhPoaPMMeUPg9oOq3pt3Q0bX8?=
 =?iso-8859-1?Q?xXe1EAA0rJCS4oI2p9sffTTpX2I8j6xpDl1UAJmEDoOLedLn5+tIw1h/wx?=
 =?iso-8859-1?Q?B9E2+FnWy5zO4lHSN/6+/adTH3hqEvvziy9YM0LCN7rBoxNeUwTqaw0ma1?=
 =?iso-8859-1?Q?EUGCc9iSo/uL/GeQk1zUxREFaR4plxjNJeTz4zViuuyByvZgqciLsShAzL?=
 =?iso-8859-1?Q?+CkcLxR0p43uWhTNBOYI7xs75eitPEQeLwIHOqXg/jihtTGo6EwzXcBGEe?=
 =?iso-8859-1?Q?ZYQAYJfwLzISmlMv7FXCEhAWt/o7Bvcuis0puVAuL1d+e9QKVcpCMDds3H?=
 =?iso-8859-1?Q?Xb4KY+WTdV7B8imntB5HWGJ4m+vVLVHnAfSuVi+Sx73bqgHepqp1BMuerC?=
 =?iso-8859-1?Q?XmBvhgtACF9IwBXEUdnkczg8NTLZPN5d30u7HUnaV2gppkdCQ4JtoZeNM8?=
 =?iso-8859-1?Q?IB0KpYs+cKnKEDCig0mH7kXRI9LIwAWl96zcDaBUuJqisaQIVJwFJtL6rC?=
 =?iso-8859-1?Q?AsjnSq97txZQ8+LYkF5oD2a6svT8y4jzL39nnvkuDuBBt3VczeCI8QEIXV?=
 =?iso-8859-1?Q?g/E+d63nP2bk8kYxTQe1i7DkIsj4fkH/g3Zg4E6KUWty+CuwTp4K?=
X-Exchange-RoutingPolicyChecked: p+M4n769U7p8g2aaItD3WGaT4eEJkiFijxBcHRNCeES2u9yAj/dz1dfzbyPv7wZ0ryMqfFvY577XXV4hsCzAx3pYVqCU2yDclX8AMtulCzYIhAkRdzLaFbSHmY+/ZUySlx46OlqDEG5rdMTANAATW05Jgjog0/nU4BEw500e5IbhSIcY1F4kznYU3qdpHtYmHNymykQ6IWjpAWDypyfCtCm/tLKpXdhgRw8dkOrhNKCcKacAAhmAcKKHV3NqyLTflZn5A2mWVoSH9TGkU2ZcpjTg/3io2Wdktlm3lJOPq7a1MVwndon4kdAxhSnW/dTq8kZ6k8G0cHLlq9NW8Xn8TA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 538a0f8b-20b6-4818-5c3f-08dea5375de4
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 15:03:55.2319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yQSIRAp5xshErrV32gqLyEGgdAKplryxxL8SCGjnfPdTVrNb4S0Rw6yMS3iJ/pIAgS1q+FzBLq81hc87pLr7ZYJ/UenJctq7UBIy25b/fLo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4948
X-OriginatorOrg: intel.com

On 2026-04-27 at 21:42:08 +0200, Ahmed S. Darwish wrote:
>On Wed, 15 Apr 2026, Maciej Wieczor-Retman wrote:
>>
>> Also should cpuid_parser.c/.h be attached to some subsystem in
>> MAINTAINERS? Not sure if it should or shouldn't but I noticed you added
>> leaf_types.h before and was curious if not adding new files is
>> intentional here.
>>
>
>IMHO, it should be maintained just like any other code within the x86 tree.
>
>leaf_types.h is added to MAINTAINERS x86 CPUID database entry at the
>previous patch so that I can catch anyone modifying it outside of
>x86-cpuid-db.

Okay, I thought cpuid_parser.c/h would fit more into the cpuid database but I
guess that's only for the tools directory.

>>
>> >
>> ...
>> >diff --git a/arch/x86/kernel/cpu/cpuid_parser.c b/arch/x86/kernel/cpu/cpuid_parser.c
>> >new file mode 100644
>> >index 000000000000..898b0c441431
>> >--- /dev/null
>> >+++ b/arch/x86/kernel/cpu/cpuid_parser.c
>> ...
>> >+static unsigned int cpuid_range_max_leaf(const struct cpuid_table *t, unsigned int range)
>> >+{
>> >+	const struct leaf_0x0_0 *l0 = __cpuid_table_subleaf(t, 0x0, 0);
>> >+
>> >+	switch (range) {
>> >+	case CPUID_BASE_START:	return l0  ?  l0->max_std_leaf : 0;
>> >+	default:		return 0;
>> >+	}
>> >+}
>>
>> Trailing statements should go on the next line, right?
>>
>
>By the end of this patch queue, this aligns well as a table:
>
>	switch (range) {
>	case CPUID_BASE_START:	return l0  ?  l0->max_std_leaf  : 0;
>	case CPUID_EXT_START:	return el0 ? el0->max_ext_leaf  : 0;
>	case CPUID_TMX_START:	return tl0 ? tl0->max_tra_leaf  : 0;
>	case CPUID_CTR_START:	return cl0 ? cl0->max_cntr_leaf : 0;
>	case CPUID_LNX_START:	return CPUID_LNX_END;
>	default:		return 0;
>	}
>
>Thanks,
>Ahmed

I guess that is a good reason to ignore checkpatch being picky :b
Ignore my other comments about this then.

-- 
Kind regards
Maciej Wieczór-Retman
