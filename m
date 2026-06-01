Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF39A3AFB1C
	for <x86-cpuid@lists.linux.dev>; Mon,  1 Jun 2026 14:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780323052; cv=fail; b=tA3smH6JOWPFp4WzSdrYtK0+Uev9qKztIFc8DS4vQPFOl+wtQJl7zrbavIclVdQ7cT9DpFOWGOtkmyErMYuLHVnjg0dvSqTeuH43d/ihmug2YaMXJCK7ZzfTcRmmeuju5/1vxikWQy0j3kqnRD0DDYKiTGv4adD84YHHZ7dhSWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780323052; c=relaxed/simple;
	bh=fVvq4lSDemMmElTCr8RkjscIcpvE2yglihEPAFrS2cs=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hu4YBTpcmKPz9LkjhDYJK+53c1HBR9vJXLKeW2tgI28cn5m748BI9RE79HLAA+UmAtK61119oRQzVuPPqIvgzrOSilMfj1IsYn5pjTYvXmp3BZJ32QxMTAIwMNlSddd6Wj7QUkL4Lvd/LUAl/lqxt/U5BJqqUUJgvfBbKHPGihY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LgvX1TZz; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LgvX1TZz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780323049; x=1811859049;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=fVvq4lSDemMmElTCr8RkjscIcpvE2yglihEPAFrS2cs=;
  b=LgvX1TZzev/L3BD0W5sKElWvbjayki/VVYYYci0rs+5Ox9GHs9LigJwJ
   X5NUkydu3O1BgaoF1Zib6HcKyumXCIsawoE9dleD4tJKbmUSmDjaInr3s
   z9Pp24oJt+vfxXudzcD8nDt5cLm6Pbg2i4ypZgoOhinr15JDVwjgdCjPz
   W68gsNgNjz7pmUZL7Mevi2xJT1eQyiZglDeayc1SXAFSyq7sUU5BZfr/j
   z9bvbvw0NvTvRJViZuY2rNJnOIGEyPu+HIQddapfuUivbtYXlykQEUao5
   5nGJE6ZLfu4fZw5rYfEBM30HmfB7hdJf6m/FpzWtgiCJ34Mk4Y3YtPLxP
   w==;
X-CSE-ConnectionGUID: unyD8iFwSNOZlfw4EpWqdQ==
X-CSE-MsgGUID: BxCTzb3vT6yaDFtJYfJ0WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81265860"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="81265860"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 07:10:49 -0700
X-CSE-ConnectionGUID: wFUXKC+5RzOlxQaGCyyDdA==
X-CSE-MsgGUID: OuQ/JAGvQXmPqy3wy0DEfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="243687482"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 07:10:49 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 07:10:48 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 1 Jun 2026 07:10:48 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.15) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 07:10:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N+Wr0q/gSV6wnR0Uy+7X7OHlVIBmXbpEyOVL6WaG4NBSWXyanC1NRCvgkXphbrQPuJNJ/fr4j5YEkLimrlmBXf+vjKvYNjDNIkfnmClpho/sPV1d2Qho1oRANNT52chLv+3JrPvCfy7hxBJ5CqplRsImjunW0TGRGEW3s/WQaVm0PH+125VIOJnBRVO3fPf633vM0LUW5F/xx/tDtikU/Q9xsxaFQGcsUEvu2ELLFdGOMCpSqiL5HuzBJkn+lTrioM7jxU6v3n8vvrzvkkTL75PvaqnLVOtHY1ciGDjBqvneygFDY7qtr+wIN3dBCTYozw6D9FVY8+12krGEVgA1Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RIz1Mn529aDMKohUxCeAjRTlBUvZLMhaovQUxFTdbrI=;
 b=QGThqBmCaBe9f3hNjvcf9hyNJqc0ZgyscHNRyeXdutCRHNdz5NALelnBAQiFYe+bVgfSXIob/jGxzdYn4fBqRRbGMWpP9d+ouxH9JtmzW2f/5665p2GpuzaH1CLu1Sy4OuUFv2/NbK3XpN6ZAYd80KhRVSVVKH/VDMCqHeQ/0whoDXIdiK7sTAPjnWOjw693YjoxCr7BaxAOd1YN3ys1DSnwSXBTqQLciMIeuyVOhYbYu/nq9j+5nIrfDoG0sUMAaxvlZKpEyoe8mUnqd0qQSjLoidFBsOcQmh/rk+n4+CaHFZ7nPJeMQ8NBi0F9XKplt2/vb6Bq/OyFTr+myaRTmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB3282.namprd11.prod.outlook.com (2603:10b6:208:6a::32)
 by DS0PR11MB7309.namprd11.prod.outlook.com (2603:10b6:8:13e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Mon, 1 Jun 2026
 14:10:45 +0000
Received: from BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19]) by BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19%4]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 14:10:44 +0000
Date: Mon, 1 Jun 2026 16:10:38 +0200
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
CC: Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, "H. Peter Anvin" <hpa@zytor.com>,
	Christian Ludloff <ludloff@gmail.com>, Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>, <x86@kernel.org>,
	<x86-cpuid@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 118/120] KVM: x86: Remove BUILD_BUG_ON()
 x86_capability[] check
Message-ID: <ah2Ss3WM5sJn_uri@wieczorr-mobl1.localdomain>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-119-darwi@linutronix.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260528153923.403473-119-darwi@linutronix.de>
X-ClientProxiedBy: DUZPR01CA0346.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::29) To BL0PR11MB3282.namprd11.prod.outlook.com
 (2603:10b6:208:6a::32)
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB3282:EE_|DS0PR11MB7309:EE_
X-MS-Office365-Filtering-Correlation-Id: 576eeb3e-9fa0-4a32-d605-08debfe79263
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|56012099006|6133799003|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: w25JirvCgY0EygNJSsLY/wUlXOnwU2W2nVfeqDalqPWqymcNjMOkqZzqSjMqvov78XRRV7hjM80NAoeXbibMpQN6Xx3DSV4JJVlLLoyazC7vQPU8zqWB721z5FyYqjh+7bz4xCmVoWRZFZxRDnfwekeWhXm2yzf1OI0k7k18yeEf88vwE+HX+78BzqDLCbggl77N34DQoH/I8xHjb5Fg2J1aM1ydOT7RM/2PMGG+CVwlsnuKU+8CiTVinNuZbdWhcXIu+fRnAfXRtPvQGjLObGsoazDyiGrk7S3Hxs9OIP1kfcFf07wtXzQ1LbyUA0+WCJCuH1uvacyGSoB0IK3qzyFuKCXHFb5IUCHL1EuzEYBU9hOHSrY6n3pB49brbqSLPiO9B86iAgNIbjnvAs4H+SUV1Cx8wxiWZaR4SeiDz549If9Vv0HlGQeodlgljAtcr4Pbfdxfu9KFc2qk+vNswH37RIX3/+SGoatswIw7eGqSG5M+7ivDJKiB2kEEA6Z95hEBjAvns9I9+DdTjXCI6mDX7ErZRZYOpNov590ypsO/sIeSrTg4qwyi8YrAVf4prXfl0qeB5IFJzek6I1AKqNv0mCBTYWyOuykA5ZAGGkUl/qQsvQveDlJZ96J2t9lCX+QMqS1gT//ZkHMqX/eJgnKU5DGwOIab8j4zaVey2V+UY6BFdNe2ffCex9yvRR82
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3282.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(56012099006)(6133799003)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?FpEZnm1QvMPelH2TJFqmIzKBzJ/YmkL0T+vYjN79jqLtEPxVHvmzUC0bSe?=
 =?iso-8859-1?Q?02cuhecvy4sFdYScYdmt8gIaOljV3bDZSCWgqsGVBwdjKvLcA6pYTOfS2z?=
 =?iso-8859-1?Q?Hb6JHbceu20T6HgTrVCLjP29dh9vCRer7WrktMpQ491z3LCP4fIWFeLasS?=
 =?iso-8859-1?Q?8YMTWz8BtJx76ZhRWj1a1l8Yys0syeEbTbF5WxoFkRwkUMA33cj/HZ+EaC?=
 =?iso-8859-1?Q?PcLoh0u3ESaJrIrIYKen49pIrR0QDQM0+6duArh7vqpsufdpgwYE3frCAo?=
 =?iso-8859-1?Q?oKWRpcj7z+qKsjsdQHdO/l1jBZ6GdnzN7UINQ+SWAJTphzzhf77ROH6iaJ?=
 =?iso-8859-1?Q?dKi4gDcblh8tfLYC8p64Lgi/n4GSwCH5s4NmOWUIiTwev/StQD31R8ftKa?=
 =?iso-8859-1?Q?41V1Py6nzuwgA/56x7Ya5GkT7xor3lXfKfmdtrUkYA8DE8VSJA9wWNDnzL?=
 =?iso-8859-1?Q?pM8dAqs+OmgCYT70WJ5wAt9o2HLb64E+NWJ74iqKlJ/2oO5O4ujMD940eh?=
 =?iso-8859-1?Q?b4Dh/jsUbmoVl0phod9+XRlH7s+7I60u7qpVh9OKF8h8+xg+xHOd4OqyF6?=
 =?iso-8859-1?Q?Dc76BlCwbhMQ7/fNLZ3QHXUE27V3Mv9uLhAfyAzebI9nYPdC2op42gMmBq?=
 =?iso-8859-1?Q?hmNUiNBv2PtXWZsamXfnyjAVbCkWliFg6r7gTObaO5APlvF8WwfCLKhZHg?=
 =?iso-8859-1?Q?2tkgCSqRb/24it3TtisEnYEA2Wn13QePZxOxpR0rjnv9D5ahT78Uo4k1Yg?=
 =?iso-8859-1?Q?c2IqS/rD4/lfPtkOjWG1Y5d+z5jrOZHKkmvP6Qgh8lObYCOzFUH8JVaeuU?=
 =?iso-8859-1?Q?pqZtbGioN5cmTIjC5NHveb/4Yk5wSdfdUuh7K59XIlHQ0+cVoFpNIC6AQn?=
 =?iso-8859-1?Q?w3T+XdF+4+1Y4WIXl0bFeHvBZtJUNtUC/9Dp/HEb9NWp6iZ0Y9qR1/9KNN?=
 =?iso-8859-1?Q?0LAV53OxZ33RyG8b9jfTbAL4ImZu11nD7vsb/KjdMBVNLzPzyw3bOYtGqK?=
 =?iso-8859-1?Q?LQ7D0BapbVt6IA4VRuSjGfCvaSzgP4At3WhnESPUSQCyWuSNdbUuFWc6yb?=
 =?iso-8859-1?Q?81PnCXDkT+rGMFJLAdPV+dPXDAJfFtKobT1zgq86LiQQCkLNfpNPcUpsB7?=
 =?iso-8859-1?Q?qeDNrX3T2hqZVNDVH6ukzDxoCZNu3G2q/VI236ijyT+UVLehYXXcMBy1HY?=
 =?iso-8859-1?Q?rVFkBGnnUkmYZMXfm7KM5qmZ6gNuv/eaJTlsNYbdYHCa2yWX9c3kHK9hvr?=
 =?iso-8859-1?Q?QIFm4LaGE62iEXDdjAp7czSv4WccQ8NVtzjopWXfNfS7sES+E2V09wRoB+?=
 =?iso-8859-1?Q?kr1F34Vv4kwIAgL5Bb+3SdPNmc7YVA1r4tNwn8C+2DhbCAmAcfDmM3vdTt?=
 =?iso-8859-1?Q?P2f+5sB+9EcmF8W1ne9xkrKrG0zepZ9IIqZNx9/HgdC/cYFtVPV/5s7kVW?=
 =?iso-8859-1?Q?pHSzAeKDdZFwkrqfcR0jVafXjWrkQJm3U/QQErEptAvek3Pvpz0XKXhzwZ?=
 =?iso-8859-1?Q?6YvFTxk46wnWd3UgeKv4QPJ4FpWNv1rTds9BHQQeeM6UKdwv/OnUvNp7C/?=
 =?iso-8859-1?Q?jgJgu6AaBzFrWSmNteauMxmXny/AL31+Jyo3rQMWDmqXP46qF01Z13QhS1?=
 =?iso-8859-1?Q?hABAT+f3wa0MRzycKGaeJ4h+vPIQeBpk1KRsxB0ThFyHOKPB73QgnApa1A?=
 =?iso-8859-1?Q?T5t9ZBD6s0lbBKqB3sRyZI4EtVTu7hQfPXdl1DKzeSO56XnWX0GfhFl4XK?=
 =?iso-8859-1?Q?OTPHrPMI717AIhwDWushodNqWGeOs6vIa5s5JpxR4qMj4yWAos+G4h/F7G?=
 =?iso-8859-1?Q?yR/8fdYa7FMGJ/Wa+s4iagGlFH3AmmA2RxmUdaDcgQI1jsSuZsPM?=
X-Exchange-RoutingPolicyChecked: iEadVMqAKb+w3WPswN3vZuc3xT9N2nLBItKY/InbkoJq3gAwrSbX6VbimMVqm/xJEygluGVOvqxKPGu360XfBg8Pt2dK19RtnJlsER9RPYv46xWflcHIPobSOXnYWvdPiKhC9KUU8WA/26xl9zsB2Pz3dPZsNRpUVSar6AShS2iMBL3iWyFpiO4aq8DFeAzhMTtVnZ9QcNQGKuedeRV00khukga5HfMvB1jRR9XGiny2QQr/In1yQ4EE3EHL/daAGUykiC1/RAuRRJRTpxZuTjXcl7K2w5rXcRVHj63KIiL8z9bLdz/64lhaJZCA9fMfzLFKQb+f3B+EOuy/mGn/dg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 576eeb3e-9fa0-4a32-d605-08debfe79263
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 14:10:44.8843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DhM4h2L83J8wVXLWS8nfgS6RTUOwmhqnqEkkGBOlIevzYKxlCSfFWdh33jK5ePg9s6PmUEHa0/1qIFtN59nBwnOotLT6dAR90EU8R3ccvJk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7309
X-OriginatorOrg: intel.com

On 2026-05-28 at 17:39:20 +0200, Ahmed S. Darwish wrote:
>KVM's direct access to cpuinfo_x86::x86_capability[] has been replaced with
>the cpuid_word_*() APIs.  The former is getting removed from the kernel.
>
>Adjust the kvm_cpu_caps[] alignment comment accordingly.
>
>Remove BUILD_BUG_ON() related to x86_capability[] as it does not matte

matte -> matter

>anymore.
>
>Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
...

-- 
Kind regards
Maciej Wieczór-Retman
