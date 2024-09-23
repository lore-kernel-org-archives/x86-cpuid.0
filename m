Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FD32E419
	for <x86-cpuid@lists.linux.dev>; Mon, 23 Sep 2024 22:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727132242; cv=fail; b=DIw6dRxXJnqzZMYWky8TidKap1YZmf4UjxR1T77pvceGXQ3b05UiW/t0HOq2KZsEsRwNdMaL89FIhKbVKXb2yPHwturBeZDgIzX965MXRU40E1TrwY/Xo1vc2+L8Gg2T9cL5mBzuNVwC57wQGVDXBz7EQoK61oXPfVH3zPQHhZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727132242; c=relaxed/simple;
	bh=a2OZQCFRrSuiDdS/pqLVGe+o5jbyLHt/9X24NxMJObw=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hHjzFrrjoX/TsPUelfyYy3PhOQIZ3EhZNBk7ot4DJmBsz2FKCyAW09rvJdcNippzZfSIK1VaOawFe+NNOisOwOz9P7tLDV5iMVN4/PHLVz14ATENqY3lV3qNJ7kK8vU+0quX75bkU5a9p7I9V3Ut8dJcue9q66u1SG23t7IFQec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JZMh5HGx; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JZMh5HGx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727132240; x=1758668240;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=a2OZQCFRrSuiDdS/pqLVGe+o5jbyLHt/9X24NxMJObw=;
  b=JZMh5HGxf8EeMMrISkOnARcu2LTl6JCgP0r2t6E3TQ45pUCkXPyWiOd0
   dnzzP7F9ncWg4GBNeBmOJG3AhFZPuTVhWExYpOBb74IZ8xjL5xBfJduvq
   YZ/cctQrHcKinM/f75lHIkbBxUPlpoLMbbPQLalTbe/QmbBarDODhl7Xx
   rQsAUybKrQrAESqZR2KXY5QO76xF1AdVb2SqILBML1wPWFJKGCq+QVBzo
   LUnWL4/A/EoOS2oWHDROyAGu5dqmjG3fGx/If+pugSHeSonvHzbgtpI6f
   QppIzJ6xbV5Ks/5JwOD4POHhQ6A37uGbqAH6YWaEWCPgMKd0IcLlTbaux
   w==;
X-CSE-ConnectionGUID: l336V5OwT7usWiqbQ0I9aQ==
X-CSE-MsgGUID: +cBLFVTRRcCa3Np6TzwSaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="29820678"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; 
   d="scan'208";a="29820678"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 15:57:16 -0700
X-CSE-ConnectionGUID: 8+h+xEsYSMaJ1xFW1DbO0w==
X-CSE-MsgGUID: MjEpvvdrSu+ZztKd7Xe1kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; 
   d="scan'208";a="76136844"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 23 Sep 2024 15:57:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 23 Sep 2024 15:57:16 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 23 Sep 2024 15:57:16 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 23 Sep 2024 15:57:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OHVOEEgFEa7hDKRRj4JVKtE0ymK/iYz9AEvA7WspTHMSydMXHTZEZpBRMvk/XGI7BjeBUy0jhAgd5z99z37qhqVPllMgXCeXM0IssgoVF7/0ieBr46qV+BBDnDsKM9mUWo3buPuDQSDY9jgM7dXGvttcuIfDAmIuAxGtemueH7LMoJYUCaQmXYgZ4pFdJ+ILpHBef2jKe/Shpg+Zbsb37fnZR2/O/nZ0wX6yKIoSFHO13F/xq9IsZZQElxPMuCbxwcSUuEks8ploK3dDMaxaib7cy674vfVvZ0dDuwe9mbn8Mb6QuUTYUUabR4umthHu4AndG5jxMH6A/U7z+cCUwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yeKBP6tFmM3KsIj/XW+/Kog96Bwo93/9Vwpw170IqWY=;
 b=GRYoMlXbl3YYLaZ5FmvpH3G1y8HEphDlBzFHzHD3V7XVYsuJ3wfpFpqWzuAYSucprwj45DHB6xVw7gYn/SMP7yDTog9GyZ6VqeIPQUuv6REkzz5CHp2u6LOON4oiRiBM5toA4/QM5xShvXaBLl/vyiag59qXq5xuaKB+mUW3Dgap5IA7q4Ded68Pw45zShDsnnyR14y2wV8wkHLw7CYN9FbDE60iN22vOLC6DwhYnIlolHzMA+7UnNbh9aDaCF8XIsZdlo14GEAZFLi8SNz9n8eofuI87ASj7ByMOyrAB/Is6IgSQQvJZKyF7X2RNzsycwQHBdiXvYEkDAmYBmFVtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3320.namprd11.prod.outlook.com (2603:10b6:a03:18::25)
 by MN0PR11MB5987.namprd11.prod.outlook.com (2603:10b6:208:372::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 22:57:13 +0000
Received: from BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b]) by BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b%5]) with mapi id 15.20.7982.012; Mon, 23 Sep 2024
 22:57:12 +0000
Message-ID: <70cf05c3-0ba6-4a5e-a7ab-21cadad3c255@intel.com>
Date: Mon, 23 Sep 2024 15:57:11 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] db: Add Intel NMI-source reporting feature flag
To: <x86-cpuid@lists.linux.dev>, "Ahmed S . Darwish" <darwi@linutronix.de>
CC: Thomas Gleixner <tglx@linutronix.de>, Xin Li <xin@zytor.com>, "H . Peter
 Anvin" <hpa@zytor.com>
References: <20240923223213.852758-1-sohil.mehta@intel.com>
Content-Language: en-US
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <20240923223213.852758-1-sohil.mehta@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0019.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::32) To BYAPR11MB3320.namprd11.prod.outlook.com
 (2603:10b6:a03:18::25)
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3320:EE_|MN0PR11MB5987:EE_
X-MS-Office365-Filtering-Correlation-Id: 38f04774-a0f1-4ac3-2cbe-08dcdc230fa9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dmlMODVma040MERNK05IdkxwcVRtQ2h6bWkvTUZyTlJqQWl3ODhYU1RlNWVp?=
 =?utf-8?B?OGs4QWFqQng0V3dNQ0lHUFBXOXlrenhYZlpSY3F1RnZJdVFKUlZvVFVxNDJT?=
 =?utf-8?B?WlhXdU9rdVExT3YrNWhObDBVWks1anlUUy82czQzNGRsbGlSeE9mYmhhTXhZ?=
 =?utf-8?B?TnROMlU5Mnp2QWp0T1RaZ0gyZERGT3RPeDVDQ1VXS3ZhQ2xhdndlMGNBRjhX?=
 =?utf-8?B?NTVjYmh2SE9vUjluZ3ZsVk8rY25Ka1ZrVFpMYnFycklieXAzQ2N0bXNxRVpO?=
 =?utf-8?B?UlZya1dKaStlNWtvUXRRczJYc0xjSzFJcllUbWI2RWxRUTdFdE14RE0yMng0?=
 =?utf-8?B?enJqYXA4QXlITHJFcWtGUzZlempmNDdNRmR4ZFc0TmdmalRNRVUyN0N6VjRz?=
 =?utf-8?B?RUw5VzIyVGFkNHh3RUJIajE3RHpHeUFld1IxVzczV2t2QXN2QmU4a0RkYmlZ?=
 =?utf-8?B?cXJ0bU92ajdXYlVadDZOUS90SXFKaWVpSlJZWFh4Y1BSWTJqdm0zdHlJc2VB?=
 =?utf-8?B?VjlDKy8vSFdWOVBaWTJxODNRemlFc0NOMU9FUkZZdnRZL3hMK3EwYmtVSnFU?=
 =?utf-8?B?RXoxTnU3eG95UDFZQ1RDSGlSTGFYa3JCMlBpOGZrU3FoSjJNV0xLWnpCTFdS?=
 =?utf-8?B?RUt4UU5KK0E4MElkTi80WGluR1RYK2J5NUtzZVRPenl3c2V2S2xKR0ZVTE1U?=
 =?utf-8?B?T0R2VjV1cWlVSDd2VGxKTjhrMXJEelhkQlU2NmQ1aXlqeXhYRWJaVnpjcjd2?=
 =?utf-8?B?VFVCQWF5Mk0xQmJBODU3SHF2eXE1UVBpeStsVUJSSUVwdWt4Wi83WTVHdSs1?=
 =?utf-8?B?UkhaOEo0SDh3b2ZHL3Q3TXZFcEdUN1dNTEdqN0dGZUxRWWRaNmtXZ2VZVldl?=
 =?utf-8?B?RVlDRlI3dkJNWnQzMHV5ck9sUnByRWJ1eTZkYnUrQXZWWTBXL2RSUEEzaG5C?=
 =?utf-8?B?ZjRXb3NaNENCY3hFY3hCWG1rL1dHTWlQQktyZzNocy9JdmRkZ3hlZzBsYnRU?=
 =?utf-8?B?bE5SZHQwYnJXdFNQempOb3hLT0pUaXNmWDBkTlJMbE5vSkFQdUpUbXVYcHky?=
 =?utf-8?B?b2l0cHJBUUhBQndqMEUwbkVxTGVtb1ZUU05aWXl3bUhOQ3NsS3liZ2grRXJa?=
 =?utf-8?B?NlpqMTZSaTNXL09aZ1U3WHIrZHRLZDJFUUlCaTNsdzFVaFdpNjF0cGxkN3Vr?=
 =?utf-8?B?bzJuellZVnd5YWRnUloxcGVEdlVxWG81MlN6NFEvc0xpUHVKYjUwdnBtS1dE?=
 =?utf-8?B?ZXBMcDc4Y2JIQmo2OXN0NGlTdmJJSHRYSWMxRWxiSEN2eUtwNnRLMmVtVWQy?=
 =?utf-8?B?cnVNV0lpWFNGcWw2MERvSy92Z1Y3R3RITllDdzRPN2xOcE16SWRnWDg1enZq?=
 =?utf-8?B?bHgrLytDbldwUVlhVkJ4aG9VT2s1SDN1TTdwd00yc0RLRzFkenFVMWpwUGFS?=
 =?utf-8?B?aTJnWi9tVGpRcnZ3bExleGhiYzEyNmZjNDE2RCt6OFg4K0dMb3Q1WHA4MmxZ?=
 =?utf-8?B?Nnd5QThMSzYrc2JONHlNanZvS21MTUFya1lXUG41U0xDQjJzdXgwZHJKNmQ4?=
 =?utf-8?B?TW5GenJJSFUwL2FoOVNKNFJMeDZ3SXU2Sk12NS90OUw3a0d5UFBuNlMwbFlt?=
 =?utf-8?B?clpKTnRxZExJVnNGWjk0N0JUdWlaQ09BMU1kRHFGYUhpMGtxUWh6blVEbWFw?=
 =?utf-8?B?aXRrRnBQTW1ObG4zVHhOZ01GaHpjeTRJRG11UXVza2Nxc1d2TlVnV2huVk9Q?=
 =?utf-8?B?b0JEQnU1L1RwVWVNMjNwVXRYY3hnMmZYc2JKME5wY09pYjZuRnl4TG8zcjVX?=
 =?utf-8?B?N0xYZnZBWW40ejRBNitpdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3320.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amIvWERwVWJrQjZBK2lva0JoYjlHemM1RTh4Z1JHWWVWQnlBZk12c2NtV0N5?=
 =?utf-8?B?UkY1NnJPZHMvckYycFAxTHpJYVprdmhOYnRLU3dKYUNzdkx0ZUJsMUlod3RY?=
 =?utf-8?B?Ly9keitOUmYzQ1NhUTN6L05vSGdLanhBcUxTOEhxd1h1MURndHljNGppQ3ph?=
 =?utf-8?B?Z1l3SDNjcGkwNmxFUEt4QlAyOHc1TUZUVDdXVjMwdEdIOTV1Z3lLcmpaQWpC?=
 =?utf-8?B?RklXdjdzZENYaVhMcFo3aXJuQmhKcDdJcUFGa1U0a0QrdEZiUFh1bHc1czN5?=
 =?utf-8?B?RXNtbnBRbmhXb0dGK2NtTkdqMlVCOG9scUZYcmlTakhuRTV4QTRhR21ZdVFS?=
 =?utf-8?B?cGlVdVJ6ZkkwVGd1dVVXaHIvNDNVeGlxb3lBNFpOcThzcUQwZ1k3ZFhNNHBl?=
 =?utf-8?B?NGJBSlVJcHNTY2tPSVdJZzZMdEtxRHdHc3U2dWNYU0VoUGxneng1K3BoK0gr?=
 =?utf-8?B?eldkZU1MeG5UM2NxTThXeXZxcnppZUFWaE1CdnloaUN6c3VmOStYbGFOaTNr?=
 =?utf-8?B?S0xzU2RHK1NFTnhEK3BHZWdvSjVER043dW9hVHYvaWh3ZDRtMFUreXJvRmJZ?=
 =?utf-8?B?d05icnowOGM5c3BCQ2JxSGxMRU5sM0ZNVlFNenNRdFFSRGQ2bUtMWGxVdVdq?=
 =?utf-8?B?bWxFZzVGanVHTFlxNjI2L2Q0MktyTEZlY2tFWWhISFhlUlZDL29VQzRVWnd4?=
 =?utf-8?B?aTBOVEg3SkJhRi95NVpXNE11MEt3bVUrWGJtT1lEbmo3a2xZMFNiMm5BaHd4?=
 =?utf-8?B?eXZwbXRCZjlkTjRVOTVYRitVYXNGSmk3ZWF2SUQxME01UndkWGhYWW5jNFBa?=
 =?utf-8?B?aTZ2S1dqMUo3MzVXdkJhSktsc1hxeUt6QjlPUGZxZEdpbmx2SGdqbkQ5ZkU4?=
 =?utf-8?B?d05UWCtrbkdxTWdva0dwbUpqY1FkNUJQQnlTWmladE9mVXE4MHJsZ2xWSmJ6?=
 =?utf-8?B?UUQ4dkZ6QVZrVXFmSGJ1VUJLQnZsRnAwczh6NW4rVm5ObGNkRGRhSTcvb0JG?=
 =?utf-8?B?NVkzZm1hTlVSNHpHeTl6d0FZK0txd3p2WDFPQTZsMm9zZ1FXUmNVb0dVbjNH?=
 =?utf-8?B?N05FUmZTb20zZjM1OVRNNXgvSi8zSFE3eDA1MjVBWlNoVCtodHp3Z013Q3p1?=
 =?utf-8?B?dG1LREZ1eUJHTVoxTW1DNlM5SFdueHYxb0JhS3VEcWlmQ2hJQkE3V3R3bjRG?=
 =?utf-8?B?bjllbkQrcUMwZmRoNVdtU3ArZGE3NGFoYlA0TmhPcTVMa3h6aFVCeVZ2cVhm?=
 =?utf-8?B?LzlFRk9lNHMyZE4vVEhIOWJBK1NwR0lXUjN3L1paMmVSSHRheGpoRzRmZzZi?=
 =?utf-8?B?VVZQaEFqQ0o2ZTFBTE9IbGlkSWJTYlBlR1pTakpkR1NFb29remJXdWFydUd1?=
 =?utf-8?B?TFJRcU00WFoycGZxQXgrWDNqQldnR25FMUhRR0ZpU0h5MVlkN1dvZkdDZi96?=
 =?utf-8?B?WlJOWWJaQzNNNnlON3lkTklQV2RhUG8zVHQ4Q3AxVFNKT2hUQVI5VWk3Smh5?=
 =?utf-8?B?ai9TcmhPaEpURmhDaGtTSFVZWWFlakxvWER6ZVdDYU10NjB4dUhSQWZCdTVX?=
 =?utf-8?B?NTBFbXBONVp2NnhkWlZPK3QxWGhpWlJkbTNhZFFxVFBEeXd1M2Z0d0FYWWRm?=
 =?utf-8?B?eTRHL0RnaTcreTgxV0J5RW5LUWFCN1h6V3Y5akpqU1BPckNDaWNBZm1rZnFo?=
 =?utf-8?B?SHRGOGpJeHVQdFVKRW04aEpnTklxODdOQnYvQXpNZlRPdnc2K0RWMHRqWllq?=
 =?utf-8?B?TzdyaTlBZGFMS1ZQNkhjY20vWXY5U01UN0FYVVJPU2JPNWIzVE9IMmNUajNp?=
 =?utf-8?B?VndTclRmblVuVi9QSkpmRjVwYlh0WnM2N2VINHEvelZSN3ZWbXREWXFSelhQ?=
 =?utf-8?B?TjVFS001RmdHSHFvSlBJY2FhM3RndkNwZ1BXTzY2dGtXejBXT0lEVlJJRS8x?=
 =?utf-8?B?cUR2a2xwRHEvTGQzWkZPZW5NRWEyQXNOSm9lK3lBWmNmTERWTGp5WWkvaFBn?=
 =?utf-8?B?VmVoUCtNenYrUTJOVE43RlI1TVhKa0xyY2MxTFNkajQxaFMxZFVBMDJPNFZp?=
 =?utf-8?B?K2ZrdzFPWFBLL2xGTHZxMk5hcUZxbEVpSmNnN0JFK2dhTWo1bmNBSS9EUHJo?=
 =?utf-8?Q?/SVK3qYKcHCqGq6P4XM/Ejv6+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38f04774-a0f1-4ac3-2cbe-08dcdc230fa9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 22:57:12.8847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bgc/yXyyAh4BX88NMon6WVdAMewWDNOI7XxiX+UyiCCaP/WoZIiYrUmeGY31UMQSfmZcWrKSvyQ6w8MLIXMEGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5987
X-OriginatorOrg: intel.com

Hi Ahmed,

On 9/23/2024 3:32 PM, Sohil Mehta wrote:
> +      <bit20 len="1"  id="nmi_src"                 desc="NMI-source reporting with FRED event data" />

I am starting to work on a new x86 feature and submitting this in
preparation for that.

>        <bit21 len="1"  id="amx_fp16"                desc="AMX-FP16: FP16 tile operations">
>          <linux        feature="true"               proc="false" />

I couldn't find much documentation for the <linux> tag. When is it
expected to be included?

Also, are the following linux hint attributes documented somewhere? I
couldn't decipher them from their name itself.

>   <xs:complexType name="linuxType">
>     <xs:attribute type="xs:boolean"      name="feature"     use="required" />
>     <xs:attribute type="xs:boolean"      name="proc"        use="required" />
>     <xs:attribute type="xs:string"       name="altid"       use="optional" />
>     <xs:attribute type="xs:string"       name="procid"      use="optional" />
>   </xs:complexType>
> 

Does feature="true" mean the feature is intended for linux or it is
merged into the linux kernel?

Thanks,
Sohil
