Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A2F3D904C
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 09:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774603622; cv=fail; b=VdQd9fMY1hEGbHrS8xM7H13dcaM0VkxXsBlVwgUwqyA/xobVoMGibgtRWKPmUZO27N3GfVTICVpbMaCd4DbdjDGn6tOwvfalS0cCbPVqLONSKrWHMsGn0kkXISqC6+Ba3mDFl+o9WyS2NyX9xc869WW7DEpeuVkn3E5HOBJKufQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774603622; c=relaxed/simple;
	bh=TL/xi0aqhISIvC4aNiCLmBFgViiOmJYfEkRtEZk2wjU=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cbVR+oKpNCB0+kV3LtbMbL67E5MDaStac0W5IkgSDFRlNmiwO65fOK15JHfC5kA9rakO70D1xuEQvcoioF3sQDKbA8g+tLEvuCW5G8olYHpqA33wf9phE3LQaLhpvxkV5yhyTfiwQxjy9oy2j9KkPWdKuezrc4K6zw1YlcVtoj8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OP08qmMW; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OP08qmMW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774603619; x=1806139619;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=TL/xi0aqhISIvC4aNiCLmBFgViiOmJYfEkRtEZk2wjU=;
  b=OP08qmMWsR5gQAwzYKzgq3KOQ5cxMF/cvFu8JZW0TAIbPKCU6DGSFrpy
   EWRAEAbGJ6wFKRnS/OQkTY6h7PO1Swb/vKq5IIp/yJmmOopcnSLszTnBl
   c/5z5RuC7qNg0pwDVIUM8W7lgl2Z5Om9+B/1aXmMMH7GdpbxmgHHmqoQR
   KBRW8A54iLXCCjF2cbqUSLTDraZzqlO2HNwRPprPqCEPIW7MWfDSAai9y
   rhXdDoNq0TvJS5+p+7eElj2D9wLwaDfz3Tz79ndGosQIZ7Ftq6rRVex23
   MwfXM//OCtGSpVUj/oi7hjALFdEmxMMgRABAVRpmJ2Ur/1h65b0q+YZuh
   w==;
X-CSE-ConnectionGUID: 6yn1QkOsSoulPHcGUyrpyg==
X-CSE-MsgGUID: a6zkrsMRTH2w/z0djINceg==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="74704967"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="74704967"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 02:26:58 -0700
X-CSE-ConnectionGUID: SzUTZG17Qpyza//OtO4orw==
X-CSE-MsgGUID: wT4Fv3z7TkqXZFG1f3uN7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="225185066"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 02:26:58 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 02:26:57 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Mar 2026 02:26:57 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.65) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 02:26:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rwz1KqWJtWA/1dou17MGMAyAlYUFFWjh07IVl8zb+jcwReEV5bwKSPCsebeqnjttor4S4Q8iVTqSUFollPWBYeEwGF61AZJa5ByXcpwa3TP0YNcv1HCixLluy5jN73qzVq+78dclt5zW1HtZ9S3ht54+c0TvwWQIcrMzqugYg++vNBo8U7sZ2KyeCjqyw67vJ5UsEzslm/ToRG9J6qtJzojbWl7Bn/kXHvUgMFPKDmDq3VLviXif2EqqasxOXOiJPtEu+U1/UZJoH/ZMx7WVpVTeq37p+WZqc2v1d6uCmKkl0wJo8ksJSzNlFPABPHFopDG56BXgYsqn4MTMwO9xuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iCc7hHmFpjIk/WZSwFMPswf+ffFb2UVx6PaJqgnd3lA=;
 b=CiwAD/tWUPpm89gM/amEuniVorf9ipi8ijCLk6+e+z4N6eFvJ339Mnzea/nsls3/A380KKN3totS9QBLRvUThYd1s307xn+uVXM0/6xZKVWm1vQ5OH/U5uDSEJRav7H6SSKe3UT+K9lbhPP6Hvq11TVUrpILH7V7H8NhAPggYzkRUALbxFp7+DxbR3QUd+MrAnG+Sg3y+1ASF1sz5Gy70KkrAQXXOBDpaIv+rTNWludlaqSWRqIgo0GdG+S7LWwDu2iONWSd180T+wLb6DEi8ESPUDS6SXV9ytvy5KGJpzmV0mBplo5gHIez1SHH35QPTWh9FGkq01wIZnVurntU7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by LV4PR11MB9490.namprd11.prod.outlook.com (2603:10b6:408:2e1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.7; Fri, 27 Mar
 2026 09:26:50 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214%6]) with mapi id 15.20.9769.004; Fri, 27 Mar 2026
 09:26:50 +0000
Message-ID: <5657105f-ae30-4237-8374-db5ec15d5f50@intel.com>
Date: Fri, 27 Mar 2026 10:26:43 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/90] ASoC: Intel: avs: Check maximum valid CPUID leaf
To: "Ahmed S. Darwish" <darwi@linutronix.de>
CC: Thomas Gleixner <tglx@linutronix.de>, Andrew Cooper
	<andrew.cooper3@citrix.com>, "H. Peter Anvin" <hpa@zytor.com>, "Sean
 Christopherson" <seanjc@google.com>, David Woodhouse <dwmw2@infradead.org>,
	Peter Zijlstra <peterz@infradead.org>, Christian Ludloff <ludloff@gmail.com>,
	Sohil Mehta <sohil.mehta@intel.com>, John Ogness <john.ogness@linutronix.de>,
	<x86@kernel.org>, <x86-cpuid@lists.linux.dev>, LKML
	<linux-kernel@vger.kernel.org>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>
References: <20260327021645.555257-1-darwi@linutronix.de>
 <20260327021645.555257-2-darwi@linutronix.de>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260327021645.555257-2-darwi@linutronix.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0326.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:87::17) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|LV4PR11MB9490:EE_
X-MS-Office365-Filtering-Correlation-Id: 30250881-84f3-4c56-3ae1-08de8be2f9b8
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 1PwlBMdtWE33iKH0ldFXIPXXazikwe/WnVqVi2qG4Rq7hN4nDF9QUhcEVOOtUIzpGwFBaH61wtDYmofZXkVCopoNNJWWTnIXdcuO+/PW3JtOw3HsOz/DEBAfsVL2ByB0nfeqPBzpbbIMlfVXLk0zfE9bA7FK00jrvmBDa0+zNtR5NAiktmTEd7v1SM9MYd4Uk/3Sp68jLbKv0B8CFQzlV54/70KwT+VPqn+tuStS4otC5eg1cTZw81KFrkMJN+9KOXkMdIhP4E4N6U9pHhP8A/UTAOr4fK3Y5Y947DNc+nNk3Tw8sO0r046jKqhP1QQ47tYy09QLV4AKRHmBhD3Xs08rFcEPFdboCgg7KNyUWgCqlFLQwKsZVwzNzLbijfTYg1+IdP+balS9KA8tSGUA0lMBhHp5wLtGweQmnsejOUnUfUbJzDfIu8IjXbkOkxm8XNRhQUTtN6/N8ps0yziSRDJsJaHwrq8FGlNcmBB4T1GMJW9/Lx8bQoRSGZUZtbYFoGq1R1ssTmBEWh3ttfPpiBbm2zuwiWZQrJFYh7Sv4So0ySPM7YHqJgsQf0p3l5zzBYSHOkYCNLVlnDvlz+T7kqGO43afpbRRtAedqUo+lH7oMmUs4YMWK8mPlbMhrRHBSqMsPsejhwDO8SqTwECZP1fSJB2lNKZp+n+ZMJ6yqSRnkAy9dJyyS68vmcE2MTzfgq5Cs+DnuGTESC1CclKM+0v1x0EXYBSNtYF8mFee5n8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVJObzJRczVreWsvYmJBRHlTYWp3ZVVCcHBRUU8vT2NWNWYvWHJnOVZKZjdT?=
 =?utf-8?B?ZVBuM3RiUmV6b1BMdVVWTjdhZ3ZRWmlJTDdUZEZpMTZOWWQ5ZndJcFdQYm1v?=
 =?utf-8?B?VGdhS3J3dkJ3emhnU0JPamtqdHI4WkdHUGxoNTg2aWhOUE1EY0lkeW0zRGZM?=
 =?utf-8?B?c1ZFREkrSGMxUUZrSDd2aU4yaXB0SGJlTEtRd09wWmNDOTdXV2Y4ZWRHUFYy?=
 =?utf-8?B?c1ZTMDNwa0VIY2ZiajFTSWUvaEJxOXFiY0tOaU40cGozQjVMY3A1TU1xNFBh?=
 =?utf-8?B?SURZN2NVVHlMdmRVOWxoMUMwUURjbi9zSnVBdTNPSUZpOTlIQzBkcGRYSXlG?=
 =?utf-8?B?Q3FzOXpwVXR1RnFTYitBZkg4RzYyVkFSQUI1UVQrd3VXZzg1cmRCNGFNQ0lT?=
 =?utf-8?B?UXc2Qms5OFJLSVZNSkV4b3Z2b2dpTk1lZWhzVUU0ajUybmNGMTdTV0lKQk1E?=
 =?utf-8?B?MXRXbGZuSFJxRXZ6bVF5R0drNWlLSml3bnNzY1JseDJrclJtNkgwS3V6d0hI?=
 =?utf-8?B?NjhvVUVDRFdacm9meXVGZFFIYnVaMCtIUGpjNTRlWjN1d0FoNkpNTXMxN1Q2?=
 =?utf-8?B?ZzJ5L3lZbmJEQkRRNVo2OUdiSnJnQ0Z3dTVKWWNZNWlIN2hTVXY3V1hRSzNt?=
 =?utf-8?B?ajlzUFdPY2hlYUI1dE5vT2FjeEorbkZIREtaUUQyL05OQ3V4a1dDRUd3QlA2?=
 =?utf-8?B?ZTl1SGUxU290TnBGSXRBMHN0ajZzeDRqakk2VFpXQnZBR0xrblVWbkUyWFZQ?=
 =?utf-8?B?dFdSVGcyS0dWUnBReHZ4WERmMmVNVDVhMCs0Nnc5d1NMNU13b0NSbXEyeDFj?=
 =?utf-8?B?cDZEbjhnckR1Zm1JSk00UURnd0oxOXZXWTlUTXAwTmpaWHF0L0V3T2pIZ2NE?=
 =?utf-8?B?dGlrS0pOT1hUTVNocWtlbm4zL2cxY1ZObUlWc3dOOEM0d1k3RkxyMDAreXpl?=
 =?utf-8?B?MDAyNCtvaXFleUd6ZEdqaWNVelB3VkpIKytSWjBJZU0vUXl1U3NwaXlnNjFo?=
 =?utf-8?B?NnJlUSsyRy9HZ0VKemh2VVg1endtOTlKMmhRUGpROXVHR2ZoV0J3UFQxenRl?=
 =?utf-8?B?eC9VMEhyb0g2WFljZkxmRXZVbWlDV1FXYUIycHFpSW5VU1NjbEVLam16bUVy?=
 =?utf-8?B?akwya1lZelVRS1dXSkl6ZitYaUVGK1NXUExDL21OVjhUODVxUnlrTlJFN0My?=
 =?utf-8?B?aGtlUnFPbUlyOG9oTHJsUEFkU0VrREJ6M2Qvd0s5S2RpenZlcS9vS0t4L1ZF?=
 =?utf-8?B?U3NVOGlJWWRocjQrZ1oyNFJvbWRDRmZ1Q3NrdFJaKzJ6NlpHWUp6WnlGa3RS?=
 =?utf-8?B?bXFiZko2T05vb1NXT3lEY1hHc0JiOXBFMXBqSU91b0w4alIzYTFOSXdBcEQr?=
 =?utf-8?B?UnplWTFNWmk5SmlBZnV1YVdWUk13V2VSVkhNaCt2ZkxpdlRicEc2MTdiamlD?=
 =?utf-8?B?cjI1TWpaMVBveXkzSVhLU2MwYVFjQVdKRHFFaE1ONUZBYlpJeWpvbERhNEFa?=
 =?utf-8?B?ZWUzdFNyRnh3aHBpS2ZKdHVCOGgxTHVyelpQcFBhdC81eWtuU0RvSHFjcTZr?=
 =?utf-8?B?STI5dzV1UC9iQVd2YnE5NzA5Z0ZPYW9tdEhPZnI0QUJ4Zjc2MU10bHpkYU1O?=
 =?utf-8?B?SlpBYmpkVlU3Y3VrbEFkUlp4RFZjY1NzS3VLRElxM3IwVktub2xTaGdOakVO?=
 =?utf-8?B?SzBvbHhwaW80bW5mejgvalR2L0s2TEc2cjNUQ2t6QVE3MmQwR1hTZzJSRzU4?=
 =?utf-8?B?U3E3UisxYzJ1ZHBCUGdVVVpyV1diaEtpWGk2UmlBRUJ1V1E0enhzMHpLa2Np?=
 =?utf-8?B?UE9Wc1B1U3ZZQjNHaHpFZ2JmYWZhUDdEdGRBVXh6RDNMejFxcnMraGNQbmNM?=
 =?utf-8?B?eHhYTzBrZDdJVTNlam5JMmhodnZ0a2FGRW9lUlQxSU04OVlEZzVnaHlGdmZB?=
 =?utf-8?B?SVp4cDdWQXdnRGFXMHV6VWV2YzgzelNzUHo0ak93RWJ0N3JzblZZM0Iwa3B2?=
 =?utf-8?B?SkNmL3hpWkJQNW9iOVdOUDY0SE9zZllTRFlCbXRBRGpHSHg3SVBvNFVLSkVC?=
 =?utf-8?B?MjNLTUlsSFRaK2ZCZFhkL1dZUmJ0S0RZamhISGdnbUFleGcwRFlDSW1JaGlx?=
 =?utf-8?B?a2pVQVl1QVFJWDM3Q0lvVzAxeFJCV3pabFFMTGIzU1UwSCtaa0EyVG0wNzd4?=
 =?utf-8?B?VHRSSUNwMVBTdHRMRTJweFJVYTRaZEdBZXMxcG9VL0g0ZVl2aDVGaDVsekVC?=
 =?utf-8?B?MFcwWDlJSk8yejA0MndmRUpIa3owZ2xYMDBzUzJ2YkJPdGV1UTlLMEp2TGQw?=
 =?utf-8?B?RThTbFVDZ2FBZmVRMGUzeDZKMHNLbG4rVlBMbDVMM2g5UGRpa1BzNW5LY2Nz?=
 =?utf-8?Q?gM7a4TfhgkJMi3Wo=3D?=
X-Exchange-RoutingPolicyChecked: hYqpeOcJmw+tI1zUIqWCUI1BlQVgDqZnwskthdWJwSbRbcANctK256m2fDjHqfjZDS34HIXJ1uDv7YzQKPy4yZn+F7JSLLlclEdfRflWPwKVuJM99XswTJ/Cz0WFnltpvp2a0Aa1ETujjAAB3bGikrpwwetvPQtE1VGctGT5u8lPpD63mafrEmX8OdSs8haYfIvPP/9eg8zX/iKNBw7tEj7ak4DfGZ77E3M1GgUfM1JyJMmSIvdqTvHaqSv9UAaaZuUiMg0eRC8A9EpO9n2rNp4o99kx3llBLiE/fsmrf6xkGf7z3ZW2YgWh0OVJ2o5oy6EudjgK4erEeSGQJINGKQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 30250881-84f3-4c56-3ae1-08de8be2f9b8
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 09:26:50.4539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j7xKCz/FLg1pP5jfmGhfV31IVlr+2/H8wPV7eg7+W/9mFkwYcnDNeaRO5Ex7gWAK8gBTZtgyhlCye3dLNU6hmGjcRQuGN1F+lFbHlyoVGlw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR11MB9490
X-OriginatorOrg: intel.com

On 2026-03-27 3:15 AM, Ahmed S. Darwish wrote:
> The Intel AVS driver queries CPUID(0x15) before checking if the CPUID leaf
> is available.  Check the maximum-valid CPU standard leaf beforehand.
> 
> Use the CPUID_LEAF_TSC macro instead of defining a custom local one for the
> CPUID(0x15) leaf number.
> 
> Note, the inclusion of a header file from within a C function will be fixed
> in a separate commit next.
> 
> Fixes: cbe37a4d2b3c ("ASoC: Intel: avs: Configure basefw on TGL-based platforms")
> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>

Acked-by: Cezary Rojewski <cezary.rojewski@intel.com>
