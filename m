Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EB73DA5C9
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 09:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774603528; cv=fail; b=c2BLqVvfZg1CfY2syHKVuOxugbKyNqT0jLn89TAXTSw7PBvdJStKTQSfhwIZtM/wf1palZybZpOGTKacj2eJMsFWEzsrMJnfckBooEQrJZKBRqCTWV2XZN+S2Cmxt65T8WArw60WnHVywrnOW3tBqoZ/iugOzlXdogWmt7RIdio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774603528; c=relaxed/simple;
	bh=uUFi4t1LLxjaUHyjWp5bUoJGPm11HlYhOKncs+rJBME=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KGqQwPK32+ZcmRj/w9WV/w92eciBrTATbZF1nGPeAAEfooNrUmxMOEheUYoK4XM3SYnrA5kE31spV+cMtdlf4e+StRMFoVtv1eFCy3q4tbXWk3JDueTmGDWtxfr+kts7GLa0ywpgFO1GBb8UNdr9wvxCwYBcZg/nJx2gAg2KLHM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gwa8lfrf; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gwa8lfrf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774603525; x=1806139525;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=uUFi4t1LLxjaUHyjWp5bUoJGPm11HlYhOKncs+rJBME=;
  b=Gwa8lfrfUQXdvsGOKo0BcQJ8amREYy5idou8kfOln7noI8Vt87jW4f94
   tH8YCU9FFljI8GgvLaokW+2jcIKHasN/Ln7JlRhFjdPQtW1FcKLhFWDmS
   JAU8L4xXdvynfPl58/vxuK9QWvrOg4LJhIwNsI9xsCaqyUZEcXp8lFNlE
   M+CyFBlbExXWjOCxjLqp9dKuaZEqCls4PuGi1Z0nJppd63Is3xarozlp2
   qkpvSU3NzmVFfiAwCFzm6CaLgO/DzstwoAzM2GnoZCmPlPaEZGz8Je9Og
   sd3X72r6jgtRorG18J2Nra9ON7sSNdmC5GNKVMdRl+EgGUahyah0GSLe/
   g==;
X-CSE-ConnectionGUID: qqxtmHmMT7i/keq4lk4o1w==
X-CSE-MsgGUID: LeecW5BETpq63ZmfdSVCkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75789475"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="75789475"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 02:25:24 -0700
X-CSE-ConnectionGUID: vMlB21x9TJiytR79BY1zMA==
X-CSE-MsgGUID: /AsoNKo7RoG6dO/p5tn68A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="255764604"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 02:25:24 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 02:25:24 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Mar 2026 02:25:24 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.63) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 02:25:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AMNIN+61DVqAnRhqWZzPzFJC8x8/e0FLDel51kYqr6ZG1tx8QdUzqC8HDqKt11q1djRxjjHZsiGYUOUtnOlwjINjoyYFF6yeOz1ElikBKo19jvULySdh5o+X4rx0blHcBk38D5FlpZTa9QEyRj06xa06EGYD1wuuMRZP9qXc8yBt1IZS6bk1WdNsaiZ8zAd3E98gtUBxl7TEd3jh8oAqyue9M/DML6sd6VMd+Kpsa30x1ULzzQmBmAE6rDrlCltYCdVHqWj4f6rsrk6iaqslhvneeSKGt78/v62rsVudmCZCpGYTW1Mib7yrYP1JYlUHiWeGFezmML4PH2atmujkTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JCXvrinwM/6mpKVwGkXriDk2sY7lNcFQkuCCMUTOH3I=;
 b=lTWeMuWU/b8K0nXm71dMI/l2qI6Ha1ZkPair5pyjDlHCuxH5BZ325a7qOKBlHwU0aTQRHR9hLWar0339sc+107UZ7jPQLN7Cd6veQYY90Vq69JGs9PNNMVJ3vYKYr4CUn+0XTdLxZMQ6tvczaz1MsnAwXRKLvZRQ8Qjzbl9lPLsUXJuo4U0W7xpdC4oeeWJLU18twZKwIZq3FrXcjO2bstxJIGmPLCBkLmKw3C85GjztOafYndwrkahE22BuSMBvUkgv0DCMX5laN3YPWbmm77xvOVnrHEJ8+rK8sX9BtdyAjlX4SFyeSyHJSRhjv2MwYtDDRhGstlLeIIhuIEbK/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by LV4PR11MB9490.namprd11.prod.outlook.com (2603:10b6:408:2e1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.7; Fri, 27 Mar
 2026 09:25:22 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214%6]) with mapi id 15.20.9769.004; Fri, 27 Mar 2026
 09:25:21 +0000
Message-ID: <4ab0c909-888f-4ea3-879c-cb85e6d92b34@intel.com>
Date: Fri, 27 Mar 2026 10:25:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/90] ASoC: Intel: avs: Include CPUID header at file
 scope
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
 <20260327021645.555257-3-darwi@linutronix.de>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260327021645.555257-3-darwi@linutronix.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI4PEPF00000124.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::8b7) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|LV4PR11MB9490:EE_
X-MS-Office365-Filtering-Correlation-Id: b34d49dd-1441-42ce-8c61-08de8be2c4b5
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: G78P2ld/d7gMb0+DNfoNGOD3O/WTEUDQzBXF9V6aXNyOpVgNhuhs+B81ZX7/sMVR5Swxql1ymGcU+rSlI06LG7o01nz9viFOZfSjnqEkWPcmc7bFR4pupl/7l6WDkpVzRXORPN3C7PpTBuml0EdP/VPaKjoMu7ipdbfBtjfFrzvYjUixKE0M18x726iNg1QSafcYXCAXB74riJncHPZuBGNuuORIofdk2D3y9N/r1sOJz53+zZn2n7/xPIkUA0QnExKvJTLbixIXm/jHxGUQWTvsXU1Q5MPr9ws8h4XgRM2bwjU//nwKvEddzzpdEvtmZ0Rgjd7qCAX9tn0m5MEx7v19oouRDXXo1IFMcGfK5PkIxPVkDYDbe33/0cHCWZigU0qQP6lUglKMWTuFLTgVBL3OvLQ1bvRmnPDlxjAysmGiVdgJJcykzZi7RhgRN93C4sTo9hS4VkAVDn7Sgc3tZhZ+M0iKe1B0nkQy0UAm25slWHgZoKjxlSqMLT9v0kH1G4FY0wdcDxRoVhiNUlRKpV9iC9dMZJlxWGroJtmfkbrhEwXMhK+oH2ClWZF55x57niotOS2qtmDa4xtLSrNWywRfTVHdEENwlgfo+Iqte5YbxpLGuKTwN9Y6NEga3aXMgzsBs/5Wt6MgVdkEp8f1ZyFzxueYSxyu1T4aKkLzOo3jrOQRfHzBzhQK91bJ/nTx
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWxVSUsraDJHbk5XMWQ5aFBjZ1J1M2l1VEVIak5ENzIyY0ZWOEd0YU94TFQ2?=
 =?utf-8?B?cklURnJXUzFhdnRxckRlVmgxRVVHOXhXTEozWEllRlpWQ1AzaXRDeTgwRUVv?=
 =?utf-8?B?N3U2OE9EWFZzbjBUNTFOZXNBeGswZXRBZXhwbVdHaEt0WXo3OEhvclV3RGNs?=
 =?utf-8?B?eEN4Y3hmeHN3QWdSbm1obUhWdDVSKzJVMHMvc3pvRVpqRWNDMy9OR3JaRzcy?=
 =?utf-8?B?Q3NibTNqdVNNUkN6d0VHdjRSdFJ0VUNaTWZiNm9PcFJidURmSXpyOENyS3U1?=
 =?utf-8?B?T2FtRDJhWUZXL1dZRnRtZkJSY05weWREclBhSWtmdEhXVGtDL1ROWmFhV3BI?=
 =?utf-8?B?QXRJdnZDdGx3ZU9XMGE3djl0OTU5SmMzZkw1QUh1eis5cUVpRmVieGZWOVZ3?=
 =?utf-8?B?dldON01vWVQ1TG5MWXk4RHVUVUQ3N2VyOThWbGpJdjRrRnIrNGpqUUFCNWF0?=
 =?utf-8?B?aGNaM3krMGZQNGxTMitkeU8rQjlITjJ2Ym81c1h4emVGUDBlMG5ZQ0JEWmxh?=
 =?utf-8?B?NUlLZldlVkZPVTBMWGlQMW1nekxaVDFQM0ZrR2crNWM0Rnh0c3ZmZmtPV3Rn?=
 =?utf-8?B?dVIxdlFnSFJCcVBHZ0h6M05GZEVpN1dWZEVuYkJiTENKVGZpN1B2ZnpnT1Bw?=
 =?utf-8?B?K2IvR0dIRmRkSEZiMENvd01rcHhMT1VYY0Q2U0src0s2b2ROQ0MrQ1ZnNnFZ?=
 =?utf-8?B?bVNhci9MRHpJN1gvQzRPVzMzcVg2dmQwV3dzTW9tV3FPT2RIMU1nYml5TGJN?=
 =?utf-8?B?SlFPcFZydnlWckxNZXFFM0MyWWFYWkwzYWZoQ0xtN0hzR05pUDFRT0dZd25U?=
 =?utf-8?B?MVNkMkVoVUVaVWwwRmtYWmNmZVUrNjZRejI3U210OVNEU1pKYW1yRkhseXJl?=
 =?utf-8?B?bVRVLzRsbTVjYm42U3VoUmNGWitsN1pYczgvaWJzSGpYcHhWQkFMbklzVVJF?=
 =?utf-8?B?M051WjdTbnpDYjZocUNMSmN1Y09ISWpTbzRWSlNkS3IwUkJleFpWbHpIV2ov?=
 =?utf-8?B?N3ptcWx2amoxTGV1ektxNHhPLzNmT0dlRDY0VW1oSlZ0bC9oalNSVEV3MS8x?=
 =?utf-8?B?ZzJIbnRFenpaTFRMOFZQUzd1anhqTFMzNUQ4SFRBdnI0b0hiTEc5MjVPMklT?=
 =?utf-8?B?dHBDMHNBZ3BEV3MzN0Zmay9Od2xTSzFWMHZYcDJRSFg2K0RHWWwvbTNoWU1C?=
 =?utf-8?B?blZrV3l4RFc5SjRRT2RjdWhCeC82YnJTQzlZd1dvSXVRbjBzb0xTU2gvU3g4?=
 =?utf-8?B?ZTJaN0pZSTJVbU5KeXc1alNIbitlTHRuQjF5RS9oYjY1WHliTXcvOEFxNUg2?=
 =?utf-8?B?RmhGc1ZMOVJ0NGtiQ3ROM1E3bnBmOXZqU00yS296V1pLRXZuOE9paysvVGN6?=
 =?utf-8?B?MmF5QTVROUVsM09jTFNyaVNVS0xLcEZXVGgzQUovVE42YnNLdUtZU1N0aHpR?=
 =?utf-8?B?RTBsQkM5angvZ05FNGp0bGE2STE4RnVBVHYyazVLQm1HaDZtWmNWRWhuQ2dD?=
 =?utf-8?B?aWtxcDBLbU45QTJ3aDhYTGlDeUFxTWJmalRuNGdwbm5mdGV4ZnhnRGk4ZldI?=
 =?utf-8?B?VFpiOC9ZaUhIRXZReG44ajhUOWVDdUdNYWJFUjgweEJuWGVRLzM4cS9MZ3Vk?=
 =?utf-8?B?K0RveHp2T0JZQkYvYzV0VFFENjlJdkZVbGZ1SUR6YXJTanFFbWZBT2lLMlBG?=
 =?utf-8?B?QTJOd3JUNTE5cXZKR3MzZEg2UnB3MXJscGFacTJaSGtDdENJYlpEWWkxaFBi?=
 =?utf-8?B?anAzeGF4V3BQZkE2NklGUjZTaVN4dm9QenR0QzZnMDVhNWFNTUwrczNjcmFn?=
 =?utf-8?B?UWRwTmJhRytmNFpmaytLanliN002K1hLakIyK1RlaFk3dmpMVEY3RW9pTmFC?=
 =?utf-8?B?TENmaVdRWjZjSGxqRVN3WGVpNThMTFFSZVFMSWNRKzlLY2w3NWUyRy9wRFJt?=
 =?utf-8?B?Y3Rva3Rvb3FFZXgwZlNlbitOVFRnZ05zSm45YklqODh1QlZuTmp5WW9kRnMw?=
 =?utf-8?B?NSsrTUxZdENJeC9UTDhiUnhlZHpMQWo2NFB6ZXVrR2p3di8yL0M1UzJDYUF3?=
 =?utf-8?B?YXhTRjY2azhvK0lNNDFaNXQrV0JDSVlvNVp0aW8xQ2xGTThCd2lLcGtmNlR3?=
 =?utf-8?B?Tk02UVdnM1crNU96K3VjMVc1aWhjekw2Q1VjSnFxaGtwaVdUbDg1UXpoUEFr?=
 =?utf-8?B?MTRiNEJ5blB2d2FjVkNmWlRpT1hPcVI1Ykd5Sy9tdDBYemJzZG15VHB3RkYz?=
 =?utf-8?B?dmtwNUZpUkdMcjJlTC9MTGFUZkR5NHp6bTBKOW9iaHY2Q3dVZFd0WWtHUTVl?=
 =?utf-8?B?UURsTjA4RCtCandyeUJyR0pMZmJBdjU5RTlFalVOQ3Y3WkNndlprWDRSMlM4?=
 =?utf-8?Q?vqkfkIHs19/aQMnA=3D?=
X-Exchange-RoutingPolicyChecked: k1viWp70lFH0Q9z001qjWEMvOD+TWnqjpvMytRsnc51z7s+pdCe9RqZ9ujBaz+mxoUAi0TPSTzhJVmUdxJLSP86tDB88nAw0M9hgxkBzidueYPVLettzIjSV0TnsJru+sqUrNjdGxipTHiwU3qR0QxG1XJWBBtRwA6a65tczVfj612x/wiel/r3eDOmw4Mnz/jU5DeSvMy6vE+JTpx/pe9LnWXZaYCOwmQMbQ3dObFvX48MgjbOEZFsAKl4+60D9oWx4zFOiHQQJ7bks6RjukbXu7P5W5MJ6UmhJt5rfhhKtmxm9BBgy66VH2MmR3Rwv8MZyW3Kh9/c0yfSkCt3MKA==
X-MS-Exchange-CrossTenant-Network-Message-Id: b34d49dd-1441-42ce-8c61-08de8be2c4b5
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 09:25:21.7304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GDxgrB8Euq6Gev6XP3LeBK+y/Lax6FJlH7+Gnsy/5LxxtwBZLDMdwW/pY9QHhteg68eRS96gozH9qscQJIcerxTnv44hFNaotZRgrzteSAs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR11MB9490
X-OriginatorOrg: intel.com

On 2026-03-27 3:15 AM, Ahmed S. Darwish wrote:
> Commit
> 
>      cbe37a4d2b3c ("ASoC: Intel: avs: Configure basefw on TGL-based platforms")
> 
> includes the main CPUID header from within a C function.  This works by
> luck and forbids valid refactorings inside that header.
> 
> Include the CPUID header at file scope instead.
> 
> Remove the COMPILE_TEST build flag so that the CONFIG_X86 conditionals can
> be removed.  The driver gets enough compilation testing already on x86.
> 
> For clarity, refactor the CPUID(0x15) code into its own function without
> changing any of the driver's logic.
> 
> Suggested-by: Borislav Petkov <bp@alien8.de>		# CONFIG_X86 removal
> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
> Fixes: cbe37a4d2b3c ("ASoC: Intel: avs: Configure basefw on TGL-based platforms")
> References: 47a1886a610a ("ASoC: Intel: avs: Enable AVS driver only on x86 platforms")
> Link: https://lore.kernel.org/r/20251016105514.GCaPDPEu016XyDocfY@fat_crate.local
> Link: https://lore.kernel.org/r/da5bf77b-5bdb-440f-92b5-db35d8687987@intel.com

Thank you for sorting this out, looks good.

Acked-by: Cezary Rojewski <cezary.rojewski@intel.com>
