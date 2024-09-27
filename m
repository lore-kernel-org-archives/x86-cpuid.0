Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0C623B0
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Sep 2024 17:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727459289; cv=fail; b=qRoWdqKq+AwFhpFsMqaT5+uFC+WmqCdVsPYEf5oNUBdfWaD3wMObFZdUNiJ9Bc9lfEW4slxh8cd9w4XCOAcYqSbUJNjAY3d/fLh0vXYWOldT3AGKefBIAwL53g8Qj+pnIermmrxuDswA+DyFtRPgF39I7lwDQKuuODtC04xsbzA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727459289; c=relaxed/simple;
	bh=B13DEZUHqSJC2J8g0bXZbPIhZUBU4eTqOEbFKCRtr8E=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cWBcB/mEb7U0vUe07y/jAVftsWp269pdezZStOWsmopIrjOZKmzN2ueIdN5T0A5TOVxB1rGkVDWY2ioUcrkdCpvCsh65U6XvmqMGLwL2vmquyRVMtVfriJltIhrsdhUmILiPGUAMKTuRt5tjaCt9x7F1bCxQ4V5LTUuVpkaEGvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bf+rYb7X; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bf+rYb7X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727459288; x=1758995288;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=B13DEZUHqSJC2J8g0bXZbPIhZUBU4eTqOEbFKCRtr8E=;
  b=Bf+rYb7XJuwd3pmdiQS5ZV+2HkfAsdDj9VketEVVMtRyDjllvvQQlT+F
   dOreTogXGlWAayCv6oYm1XPfVImOECFQNyK40/hHjnxi7ql7A4IQWEARV
   V6yBPkhfnb4EXlpHZLPpWu6bx/MWkpv7Q+MC1e4rbNTrD5wSFTw9lHXxg
   QhDs7AjczmngXx/7is/jrCjZjfNr/LlL9VuaKRrTzWXjdiDKkVaYeTJQY
   RYj9SUHGDomCtvE4OD5JTb1/Y4chKIuLm0dP5pDFXc7mgRKsBuR6FR2F+
   pKpZYQqtlrTgxpdD0Q/IP59O9V+nXriyJ2HkJSGZ0QWA8cEjJ+4rOwxA7
   Q==;
X-CSE-ConnectionGUID: fkotbRZtTp6mbUX5gKa0Ew==
X-CSE-MsgGUID: fRT4RHg6RCSMPIR5m+J0VQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="37179928"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="37179928"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 10:48:07 -0700
X-CSE-ConnectionGUID: bps+fqMrQDi8qXOpy9MUfQ==
X-CSE-MsgGUID: LH0UbUd7RBuLZZgg/zIeUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="77382835"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Sep 2024 10:48:07 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 10:48:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 10:48:06 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 27 Sep 2024 10:48:06 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 27 Sep 2024 10:48:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gSgg3RhuIXKN9NfaaC9JMbpbtw634Q8MEcUwpEq4cjXE+oXAsuRdBDpzw3Wi6oIX9/I6evOcvF3W7JIyVHsckqfS5vdXGw64ELOnl82E7Oi8Ir1c+efa0nGpNFhBsrG3ufU+vdaOlYgMDeL/cNOa2pzlYkGmlnoEsFbvPIGzrUsVJy4XYbCCipPYwhxCg+HL62yifoXVtocz/ZpZ5oUhv/8GjbTt2u43ZcjSPTwrYOQKWmaixTYlf2oIuxTEKA/DtSHGOYKanCA0OqBQcq/5zS3Ctec2YsH6lSuXFngQFqn5uYx+/g3s+n0SMEkfaUORLx9PrPPx160jQRwU+lMTdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qg/XSpa6lsnzuo25TWEG9mLH7LwRXBdum5dr8jkVndw=;
 b=uvdvDMb+4x72ixTgaJFbU7Fp6CBCU9IC6BlM4fRjivXjqsj0BN9WESTe31XO7POD+en91m2q2Ff8TB4T4Bf5o9r+7cLi1d2fJpHHhZ543ZxQyBw4AYYmi6dYYLJw/922Ir5C8WY6uDH9FRb4tOUt3wFQbz/iNLJzgVrd/WPtYNOZMEXSHsEwIeNuFBpIRGYDmc8q6jn+4DY55VJPQr8x4PNKgCPDgXouhQWPRxlAhNa5NaHmkL2LbCKLkFnPhI2KrUj+l7dhXNKOQ8dmBYDT8Kifm4J39uSM0TZiIGaIGO/oc93PHvSuuMdHyaNRpd0ofQLzwUL0mOFp97qVEWl+4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3320.namprd11.prod.outlook.com (2603:10b6:a03:18::25)
 by BL1PR11MB5953.namprd11.prod.outlook.com (2603:10b6:208:384::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.22; Fri, 27 Sep
 2024 17:47:57 +0000
Received: from BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b]) by BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b%5]) with mapi id 15.20.8005.020; Fri, 27 Sep 2024
 17:47:57 +0000
Message-ID: <a8fc6ca4-79e3-41f5-b195-e91d4d515f8b@intel.com>
Date: Fri, 27 Sep 2024 10:47:56 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] db: Add Intel NMI-source reporting feature flag
To: "Ahmed S. Darwish" <darwi@linutronix.de>
CC: <x86-cpuid@lists.linux.dev>, Thomas Gleixner <tglx@linutronix.de>, Xin Li
	<xin@zytor.com>, "H . Peter Anvin" <hpa@zytor.com>
References: <20240923223213.852758-1-sohil.mehta@intel.com>
 <70cf05c3-0ba6-4a5e-a7ab-21cadad3c255@intel.com> <ZvVdzJIIqaC_javn@lx-t490>
Content-Language: en-US
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <ZvVdzJIIqaC_javn@lx-t490>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0191.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::16) To BYAPR11MB3320.namprd11.prod.outlook.com
 (2603:10b6:a03:18::25)
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3320:EE_|BL1PR11MB5953:EE_
X-MS-Office365-Filtering-Correlation-Id: 85f62127-7dc3-40f5-d976-08dcdf1c854a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cmhUNDRBa0c5SURtZzRMMm8zejdJa1pqRzhqeFNQRzRVWnQ2SHpwcmVMYWln?=
 =?utf-8?B?dklwdnRYZU9ubk1hOGdJU2M2Ti9WNVFSTlBmdGx3a1B0MWJPOUlnM21uVy95?=
 =?utf-8?B?SlZxUTRVcEhNTS9WcENOU0U2bzRkMUJmbi83ZVlIaVFnY09JTE02Z1ZhWkxD?=
 =?utf-8?B?b2IvaTc3Z05zakZrUnp5SFN6dW9Ib0hwb0JYbVdybENPbjVXRktDL0tiUlhi?=
 =?utf-8?B?SExvbFhyaktXeU55QmNKbk9IUEhzeFdtRDZ2bXZiSVF4ejh6RDJsT25oQVNa?=
 =?utf-8?B?d2t6TW8xTDVLY25YbldtdnBqQVZZczBvMThVRXlyM21rZmhqV3NXbm8rd3k3?=
 =?utf-8?B?MVVjdkR0NXB5VU5DMUFINWRuQ2s3ZXd0eG1DU3Q3U3pvTkJjWnhtRE5pWGZx?=
 =?utf-8?B?SnJPVmFJWTJMb3dlbFkzOVVwMnlGVzhRSEEzMHJTN1pkYXVkRDU4RzhDVzN2?=
 =?utf-8?B?aERWWVdMZ215SEpsUGlwNmpCY1BpMlBKWFl5MkN5RXkrSVMzQVh5cWprdUJZ?=
 =?utf-8?B?bkdOMWdQZnJqMHFLcjZCbm5GbzdtU2NxbGJkNzVOYllMRUV0dW1ZVHFycFVs?=
 =?utf-8?B?VHFWM0MxRkQ0NzV1YnhkNEVaeEF3STRrOURkOHc4bWdteUJZajg1SDlUNzNV?=
 =?utf-8?B?K1p6eG5ONXUwVDA2SWxkTUdBeStKZVR4ZW9VREd3cGRXWDRzejlqZ21vaDhE?=
 =?utf-8?B?ZVlyV2ZMNnVKSk9MREVGclFMZS9RWFBTNC9uSGlzRDhxblc1THRSV08wcDF2?=
 =?utf-8?B?Y0pkS0dsMnFtRktoYUJqTFZSYXcraW5BUEl4cmZkVy9PY3ZaNHcwcFFYeFkz?=
 =?utf-8?B?dGIxcHhJVlJQdktReEdGa2ZvYnZsRWdwK3hHdTlNQWh3U3BBalFnemswM2Fr?=
 =?utf-8?B?RmpRRHA0ZFVrRGdLSFJkVUJ3S3Y4V2Nxby9HcDFzaTBBTkdTZG9GNjNLNWZr?=
 =?utf-8?B?b3JaQUVkTFl6bVpVUkZoT1Z3UklnNTA1NURnU1lnVW1oby9GdklYZmRvaVBl?=
 =?utf-8?B?OGo5RHF6cVE2Y2ZvclYxbDFXMVJ2cDg2WnB0SEcvMUFuNlhkdDJ0aU5LZEh4?=
 =?utf-8?B?cGZzRXdjb1FyM1Y0bk1WMWFWYmZWWVc4Y3EwbitPa0JaL2VwT2dDSGxjYnlk?=
 =?utf-8?B?dVl6RkJiSjdRcHlPMDVpZGlrNVlKeHNVby9mRmV1V29UR2c1Q0w4SENSaU1k?=
 =?utf-8?B?cURBOFhaOGQwZk9ENmc3V2JwTVAra3Exc3pQRzlweGhwQXVJWlM4SEVSQzlM?=
 =?utf-8?B?UWdKUlhKekZJbVRkVG9NTzVCM0tDcGJlT1E1SDZRUmRJZWFIYnpkR3A4d1dZ?=
 =?utf-8?B?T3d2NkdadXpYVXVSNTg4VVpnVE16MC9aRFRodzFEWEJpWm1kN1lhUzRFZ3Yw?=
 =?utf-8?B?Q3dLcHU5bWJEQmhRSE4xRHdLcS91Qmtjb1RxMTdSamZGdkkyMXhhQkRjclFN?=
 =?utf-8?B?MDhzdnVsWWNjTlVzZHd3OC9aY0pzTkFZK3BCeFhzemMyb1hWK1dtbXBpZGFX?=
 =?utf-8?B?VTQrRmpiRW5TbGVnYXZ3REE1eUJzSFY0MmY0QWs0ZEZ0RldJQStEK2Jtc1RU?=
 =?utf-8?B?aVlXR1VrRSt3RTdvUlRxSm9oaDExTDZtbnJ6WmRnejZWS3hjQmRkbXNHRW1z?=
 =?utf-8?B?bHI0aUhVREpsM290SHVxK0hjaW9xcnBJUXl6N0U3WFlhTGFHVnZmTTNDemFY?=
 =?utf-8?B?VWIxaUhrN3k3bUJjb2I0bk0yMHFqbUpQWFFoTU5XR0QzWkhLWEF3WnJQalBj?=
 =?utf-8?B?OHJBc2l5MFJkVUIxTzhIMG1QK3lVSUxueGFIaG4rQ2VMZ2dhUS9pbWZtUDJP?=
 =?utf-8?B?bXpLZWtEMEs5ZTEzenZQZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3320.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGdsb0N5MkVmdE9iNmhIL292cHZaK1FUQldJZFVNY3MzN2c0eE1aeU8xVDkv?=
 =?utf-8?B?RVdvT3RGQUQwdENmeCtoRXRVS0hoVHM5MVhtclNmVlVONWNadENvTkFPcFFH?=
 =?utf-8?B?YTdQN0NpcmJ1S2k5aVFTMDVqNFA1eHV2N1dGUUl4amRpUG5mUEI5ZHZhQ2sy?=
 =?utf-8?B?N3NZeVF3ekoyVzBMUE5waFhoUzFWZDZuUVFCaEI2aWdlS0tCWHFjUHFhOFl3?=
 =?utf-8?B?ZTlFTnowYVE2S1NlUXlCOTZoZVlqYWdqQkhjcGg0Mmc3emE4dXMwS3d3NmRa?=
 =?utf-8?B?bDV0dmdmeDl0akhNSXhSLzR0YXk4dHpCeVE4MjZ0N0FLaTFUOVdGZ2tKbDVP?=
 =?utf-8?B?WVN2T3cvSlplS09kMWVzeXVxRzRrbnFFT3NWNE5WMXNGbm4zQm51WUtWOFBw?=
 =?utf-8?B?emRET1AwT2ZZaGNPL05kNFdjUUZIaThLZFRuSmNkSUMzalU3NzBKQkdaN2hm?=
 =?utf-8?B?YnVQN0h3T3JwM1gxbCtzTjUvSDhScHlUU3QyMk1WYUJJcC9vbExraTVuRlFH?=
 =?utf-8?B?WXB5SXpmSE83YXYzeGE2Q2lBcDdlNlk5aC84UnU0aGV3Ukh0Qzl5bEZPdDBw?=
 =?utf-8?B?Z0dsdjloTCtvRXNEeVBYVW5IRzhIMG54NUlDanRhNkdBNndFMXM3T2RCL1Bo?=
 =?utf-8?B?STBjMDBIZHZraG45SFQzY0FpNld1WnRsREV0Qktob05LaHZGODlRclJNS2U3?=
 =?utf-8?B?QVdoSEZIcXZOWTh0ZTBYNFhibjdrRzJXdXRzekdJOUZxT3BJQkoyUmpqTGZh?=
 =?utf-8?B?amJ3Q3NEUmhHcXBJK29tYnUyeUhMemdZVnh2V2JqTllERjlBUHNLTFNyUlNJ?=
 =?utf-8?B?UHFja3hPQVlubDErRjhHY2F3SDVDWFNDNVVwY2ptTjVqc0x4d3V5ekRSSTV4?=
 =?utf-8?B?bUZUbVBLQmVrV2s3Mm5SQUtoLzJJS010REdRd05lUk5GaGNGMEFtYTk4bC9z?=
 =?utf-8?B?bmMvdjJ2VlZCaHJKNnhGWW5EZktGMkpsRVZJYzZTZjRXUEpRMmE1Vm4xNmJ6?=
 =?utf-8?B?ejI5alcxNnQra0FUTnBsVDcrc3B5UkhiK1hwd0lCek0rcXptaVdCOEg2bGVj?=
 =?utf-8?B?YU82VjVFVlFDb1BTSlRJMjFwVW1KK0U5Umt2N0ZLTzRZcTlYVzRBTFJ5UDZ5?=
 =?utf-8?B?N3d4Z1NPQWNzMjJxUG9vTm1vTmtNWWlFczRUZTV0c3U1RGptaXlqaVVjeWRV?=
 =?utf-8?B?VDVwbUpOb2lmdHVpV0lrNFJwNnhLNkY3TkFJbG1XWVRvRmNtK3VPSlVmSkJz?=
 =?utf-8?B?MU1hOHlpM1BDRW9YOWxZY25FRkFESFZ3dkxhU0ZuUk52TVRZMHZCQkplTW50?=
 =?utf-8?B?MXkreVpaNlJBZ1R6Vko4cHFzeFA4L1FRL2UzVEl1TWRhd3huelhkQTYzc2sw?=
 =?utf-8?B?VDdtYitPUWdVTVhOajBkV0IvdS9RZGg5K3VDelFOUGx0T0w4UVF6MUtHYmtw?=
 =?utf-8?B?aERicnBOdzE1UUp4bXJaeXB4ekIxVEx4MGZkdUVDMlhPbTJWT01tS0l6Z1Jj?=
 =?utf-8?B?a0ZmTVNBcXVoSHZuTGNsQ3ZmNk9GdnNNek1nY0lvM1diNkEvbk1Qb3hvL293?=
 =?utf-8?B?djBpNVV1U2VPdzkrTkdaR2NPSFlPMHRrZC9lQXloSVFiSEkvTlE1ekVHbmJG?=
 =?utf-8?B?bWpWTWhqQUI3OUJ3M3Z5WWtuZVNjc0NPTkRQOWlJaGVTWXMzYVgxQmVaTEhk?=
 =?utf-8?B?MllaZlJRZU8rYVk5OHc0VGxqOFNpY0dmSXVlU291Tnl3alFQZjREeVdpUGlO?=
 =?utf-8?B?UklzbUR0dzdsOEdpOTc0eGdUSjIrTmlCOWFjRVVDM3lzWm5XemZiNlpQR3Nh?=
 =?utf-8?B?MlpDTlJoenJqRWRPM1pzeW9lWUhseUFzaHdzMGU5NFFTTmJjcXdvYkQ0L0Rm?=
 =?utf-8?B?TlY3cnZXVDc2bm1aeUxCV1c0bVVVVis3V21SWWJUOXk5MlJGeU9yQVBKUTVq?=
 =?utf-8?B?d0xvL2xVeXNHV0J3M2NEVFRHb1hPRk94ejlzcGRpZnRYSXZpWk94ZEhCakdI?=
 =?utf-8?B?YlNmMUQxUFJ6aTk3Q3hQbmNLaHJNeFJSQ3NFVFdDaHBpdCtNbXRSZWplSGVD?=
 =?utf-8?B?WHpSSDE1c09rdkg1QkdxM0ZpRHJ0aVo3cWUxQzdxSE4wWmVCTlhOKy9rNVBS?=
 =?utf-8?Q?ir5cH/Dm0izbMBoX2rjIdydla?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85f62127-7dc3-40f5-d976-08dcdf1c854a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 17:47:56.9505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qZGnJNX8C83tue7g5pmDXFmsKG7Jep4AVFnBN7LwTdbg8NJUqiWX+ab/c1HlInJmJITO10N7lydi+2379phFLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5953
X-OriginatorOrg: intel.com

On 9/26/2024 6:12 AM, Ahmed S. Darwish wrote:

> 
> The <linux> tag means that this bit is also represented inside the Linux
> Kernel x86 tree in various means.
> 

Got it. But this would mean that the entry needs to be submitted after
the linux usage is established.

> For now, the goal was to cover all known names for
> the cpuid feature bits, especially when they differ; i.e. canonical name
> vs. Linux X86_FEATURE name vs. Linux /proc/cpuinfo name.
> 

Also, the various cpuid bit usages in the kernel might happen in stages.

Are you planning to have scripts that automatically pull this data from
the kernel as and when these usages get merged? I believe asking
developers to submit multiple edits to the cpuid-db might be
inconvenient and error prone.

> Thanks for the question! I'll indeed need to document that part of the
> schema before the v2.0 release.
> 

Thanks! That would be very useful as more folks start contributing to
the project.

-Sohil


