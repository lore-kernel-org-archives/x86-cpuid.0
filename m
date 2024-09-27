Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89621C2323
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Sep 2024 18:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727463326; cv=fail; b=glJCzTQIWhqMjb21uVjvgrWgbOBTs15i8oKncCCqGhUqBNUUelb//U8+hKnulkxlYSr7ZdAoy2y6FRF+e7KB3L2w3nDGqprPFpjeCFxMao/b5rjDlnjSmKTnbjh8ntZ4laT97zrVHKOku4czpLbHLmisZoFdgKqzBaVklmU91LU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727463326; c=relaxed/simple;
	bh=+j9cS1BcIcqFw4Zt4Jwn6lMzxyMudNiDtAPakbCmEyI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jdOymdGVun37Ml7ZiLczt234O2VlOFOqjx2QbiiPWDZLdPeQYkoF3lMTMQ7pMUYS1+5LIAb9g6OwKAIFjsNLwB+bNarWpxavRuLVxUqLp/TqPq+6rc9auJehIprKzwu6Gk4Edz6NbWHuGkRfA4ZucsFDqWEiBoJ9KhsOKCnen2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ki9WFY6M; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ki9WFY6M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727463324; x=1758999324;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+j9cS1BcIcqFw4Zt4Jwn6lMzxyMudNiDtAPakbCmEyI=;
  b=ki9WFY6MULrv6HzXyWAVlqd77ea4pFRrZvvESkJAaaikdt5omlymUKck
   NfCtd6fQ1cIWZTs07HlTe0CW42l0yR4K5ebpt6c9VzQluRZJJ+0SUyS8w
   EXRhhtnTbh0bcb1hazwRKwgvL16KaG2MLflel+bXSgC9k7LhE+99/yaVU
   0xn/yTn+Y9JsT7ZeZPI8YwHhIYvX/xmkBs3gn7ykmILy9Csb8YHKZVmj0
   LiCXbrJDDoQb0a2AcbR2B+8YPbjQPEXrRRKPjYrpF+io55o55dBe9Mhty
   VMgOBqEPLAd0+vLgh2G67558UnHwG4VKKDhPe/YKRNHVzak/usA0tg8Yu
   g==;
X-CSE-ConnectionGUID: Oo21/lRlQRafmI4qTIHBWA==
X-CSE-MsgGUID: TE0ASQxFSTeIFbZkV6FcvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26085819"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="26085819"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 11:55:23 -0700
X-CSE-ConnectionGUID: srv2KtxuQGaHyIbWmDl6Yg==
X-CSE-MsgGUID: 0kG3v6k1SFmgZgST2HwLNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="72597811"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Sep 2024 11:55:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 11:55:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 11:55:22 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 27 Sep 2024 11:55:22 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 27 Sep 2024 11:55:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=puXU5V1UvBsJ0Z8rGDU9HCuBNUkI+77iB9IWrm+6Og1b84/JFqhb889w7XJeFUmX7U03+rJNwZuQtLgpX4fEur+KqTr/MB8/+X+PYHZICKx9K66gLimfHw3Phek2f8ZKZ6y9N3wwpG+iHa7AetG0MnrcV05w63GR4xIWtBodVsVkwMM3K0v5XoROSfip1/IGnRd5SxS4g6OmtPBJERa2j9Jsv/IO7VgNQjFtAv4R2vaUJTxOuDr86U77lxD5Cw9DC5cVE9Q0xfIkKW9VB+6XF8ZsWuSqzh6Sj2a9R+gs8zD1GMxNfZCF/M7D/YIHWOlqwg+kp6ECYvYi0HkhdA3FeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TbP3BcN+Ohcjzm9ThM45cdGHMq+WOPRu9pfMwdmkxhg=;
 b=ak1bIVY5/DlAV7CXYO08VNJL6yQRlyE9w1x+cGlfvP0dGNNBF6cSW3cZcKBCO2XyO+jKFIGxkBaHNiaqLEFglDDLchfX+1SBMEW4jTxvtD0PgcHl8ZGfRxGW3zy5pJNxxQbQroiNgmh54g4RqWEQDPZGlCfKb6j7A6MjRsycr94BdIivA9S8dljf5ptEydwjX77DmbwEq6LMNbhURU4dw0Sp1Rx5bOdIstSi6Z7XUmwOVuxrFEQk2ZpYI76xUN04kXoGpAw6uAMbOUMzoMCTDs+MkfcKJNvqwdQcB5GML1Nt3W9S7JgHE7YOxrMEweYsaUL83kdQMrTRj/DbkULVeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3320.namprd11.prod.outlook.com (2603:10b6:a03:18::25)
 by IA0PR11MB7813.namprd11.prod.outlook.com (2603:10b6:208:402::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.22; Fri, 27 Sep
 2024 18:55:19 +0000
Received: from BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b]) by BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b%5]) with mapi id 15.20.8005.020; Fri, 27 Sep 2024
 18:55:19 +0000
Message-ID: <eb13e75c-0611-49ae-a587-c85f8a2bc3a5@intel.com>
Date: Fri, 27 Sep 2024 11:55:18 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] db: Add Intel NMI-source reporting feature flag
To: "H. Peter Anvin" <hpa@zytor.com>
CC: <x86-cpuid@lists.linux.dev>, Thomas Gleixner <tglx@linutronix.de>, Xin Li
	<xin@zytor.com>, "Ahmed S. Darwish" <darwi@linutronix.de>
References: <20240923223213.852758-1-sohil.mehta@intel.com>
 <70cf05c3-0ba6-4a5e-a7ab-21cadad3c255@intel.com> <ZvVdzJIIqaC_javn@lx-t490>
 <a8fc6ca4-79e3-41f5-b195-e91d4d515f8b@intel.com>
 <6CFCC415-2F08-465D-B61B-E465A44DDD67@zytor.com>
Content-Language: en-US
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <6CFCC415-2F08-465D-B61B-E465A44DDD67@zytor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::10) To BYAPR11MB3320.namprd11.prod.outlook.com
 (2603:10b6:a03:18::25)
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3320:EE_|IA0PR11MB7813:EE_
X-MS-Office365-Filtering-Correlation-Id: 5298361a-ac0e-4793-b306-08dcdf25ee85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d2tvWGZ6bTR1aDZuVkZZdjI0SnEvcW9SKzh3OFNkWmdZN0crQ1ZVU1NMYStC?=
 =?utf-8?B?NllzZFRHZXoreWxkdVAxd01TY2JmYW9RMkl2YUdCaDg2Sm9BazI0bUUxWkRh?=
 =?utf-8?B?OUcwZlI5aEFkTXVxQUQ4eWo2R1VIb1JFT3ppMzhzT3B1WDR2QWhia2RHSXVm?=
 =?utf-8?B?bit1aFQxaDh3OE5tQXYwV1VEa295a3M1ZmovVUN0RDRsNlA2TVJVN0hvU3JI?=
 =?utf-8?B?VlYybWVCWU5lVXUxRGhFZWorWUF4cTJBT2JrOGU4OGdZYkl3TG5lREhhcXl6?=
 =?utf-8?B?SmJuTzJRWjJrbDdwVk9FaTBWL0xZQ3dWN2NsUFgvZkJQR1RFamgzZjd0aGZP?=
 =?utf-8?B?b0pIQm1JMEtvSzg1eUJVNzJWamZYdjRhSHJuRHd6eVN0WUo2Znd6L0ZTRHUx?=
 =?utf-8?B?OVdkTFFjdk9FS002bGRWcnhhb3duaWpDKzl2OGY2UmpaWW9nM1ZKZ01oL0VH?=
 =?utf-8?B?a1Z6UVdzeFE4amJVUWhWYTVsL2lXcCt1emdVTjNDNGZWYmw2OHdNUEhjcHFh?=
 =?utf-8?B?UkxaL0d3LzlGN0VoTHk2bnloLzRBS05HeTRaUUdPTVFONVh6dHZxbEpjVkUy?=
 =?utf-8?B?aU44L3h4U3J6MUJDejdYVkZXYjJOcGdLZ3B2VE0zR1g1WjdaSVByZDVsdHpo?=
 =?utf-8?B?Si9Fa2NXK01pR2xPNk5DWnNrU3M5RHo0a2g2d09xaDJpbjdQeXdsb0pkVit6?=
 =?utf-8?B?WGpyS3V2dWVTendFdkJnRWpJYlArQnRjTXlMQW5aWS9sL2dMNHlGVGhkcGJK?=
 =?utf-8?B?OUs5R2tDZWdhczIxb3JUYjduVXJtTlhyYTFBZkxUa1VWSU5NZTJhclNQNGxj?=
 =?utf-8?B?a0N0WXpJNU9zUExySlFCaVRVK0RLMlQvSzNlQnhtdkdTNVNYTm5XNFgxYkNw?=
 =?utf-8?B?M04va0VwNk50c0JUNHpIZlZUWSsybDljUGdVd0JJV3NsM2xjNE04SHowTUFU?=
 =?utf-8?B?ZnhxRlNlamFhOVRwOUo3cjRubDRubWFKTi9Fby9ZNUNaZmlYTWovaUVzdFRT?=
 =?utf-8?B?Y1FRZUJDdUgrd1pWeEtiMlcwcU5MdEYxUURMQ1JxNnBtbFJqTktsTFRzV3JC?=
 =?utf-8?B?WmRCMEdwVWlwK3Z4T0VTSFczc1RSZEdRazRzd2gzdTdjQkxyNnR2QlBuVGFJ?=
 =?utf-8?B?eGtQdmxIWjkvVmNZSXlLS01IVXc2NnExQWw1SjhPS3BHYWpIVFp4MklIRlZW?=
 =?utf-8?B?bGVwQ0xwc20yQ2k2UmNLbE5seE8wTjRiKzJ6M25CUExQQVFTaStmZ2RBNlJV?=
 =?utf-8?B?NEpydFljYW9qMUZITkpDTCs5d2VsTWlxQVdFQVpKMHdCcjQ2NFprNnRMa09I?=
 =?utf-8?B?NVcyVzF4QzFHREtoVk5NOWEvd2cwYytLWUZLU3NRS3NTd0tLVVZNNTQ2RnZZ?=
 =?utf-8?B?UzFLbXRKN29yVm5jTThpQlF3UEtRTVFuOFRrdHRmOUpiVGNXbmpiTzJ0UVZw?=
 =?utf-8?B?T3IxdVJkVS9uT0Y2QVdvRHpVMlR6anJmQVdMNVpOTWNXazE1dnFLd1B0NWtL?=
 =?utf-8?B?V3ppTm43QWRreENHOFJ4U3dwQXhIVlpyNy91Vk95TDdRSTA0eUpkdjRvQW1F?=
 =?utf-8?B?OFlvNVo0K0dTbXRYcUJTNkxkR2hLZlJ5dHRhenVNN2pnUjlCQXVtU0hTWFdq?=
 =?utf-8?B?Rk1pMFJzbktwb0ltU1ZtUlp4NTR0cUV6YkFiY0h2aEJiTUhTZWhQaENST2NX?=
 =?utf-8?B?dDUvd1dQalFWSlJsbENRUFNxUjVpeHZuYnZaSnpVWGIwVDRjN1lpeFA1eU5P?=
 =?utf-8?B?VnVuZU5VYmROZjI0RmFMTkhXWkx2U1BkeUxKRy9VSndWbHRXSThZNUlxdHdD?=
 =?utf-8?Q?37/C2eQTqCHhnvp1dqU3XLvo8nW0aJOjjoL6o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3320.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmVob3k4YkxRVkUvSUJQd245Y1Q0NXUrSWc0WGZXSlJpYm5Pc1Njdjdub1FL?=
 =?utf-8?B?MTIxdGVtU1JyS0hBbnJzSTAvL0RXTTJiMkRjV3dkbHJMZXlXbHZKcW8zMmxE?=
 =?utf-8?B?YXdwY1FhaTQ2TVB4QjkxSjJySHhhTGg1aDgwWUpkQkdWK1dsb09kNE8zR2Jx?=
 =?utf-8?B?ZWtZVkwrMUFxQnVoZlJ1OGFIbWNRazVWSWpTTHVsM1hoSklaclVOTTJ0bkYy?=
 =?utf-8?B?KzlpTDdVdnUybXhnd0dlZkN2WUl3a0J0WisxRk5PcmtoSG1DOG8wVlFTdEZ6?=
 =?utf-8?B?MWc5V3FRRVJpRmxseHVLK20wUlFnNHBwNXErZHV2SHlTRDUvaG1GZEllYmlF?=
 =?utf-8?B?d0dFSWI3d0ZZTTBuRWs2eVFqYmdJWWpNZzRHdWw0aFRmWkJGUy9tcE1wVVdO?=
 =?utf-8?B?TGpkeGRjUi9EeGxYNnJOUFZ5WmZaUld2MldQSVl6dVM5K1BLcWVSZzYxWDZR?=
 =?utf-8?B?d0t1UEZJZWUxN3RLRlJUaWU1N1BPUEExMFlEMFlmekUrb1JvQXhjbDZHMjlU?=
 =?utf-8?B?RlpNNzhtUnVQU0Q2YWszNUZuV1MrR290VmVFaWFvUUYwKzFLM1lEaUN6OHBj?=
 =?utf-8?B?dmxGMVphdjROeTJyeTRNK2h0Z1YvY3kvQzhRQlJ4T0JQMzBlUFc4a1VwRzkz?=
 =?utf-8?B?cWs4ZWwvVVRoSHR2Nko3aUJGK0ZuNFJWMW5VN1ZOaEYxTE5UUnJkOGhweDZx?=
 =?utf-8?B?SUJMbkhCZTRXa05QeWN1TDljaVlRYnpTMFV2MUJnNERMaEJ0ZUI1RCtFM3RV?=
 =?utf-8?B?OUw0TGYwSFJqd2x4cUxVVGE1WCtuUkRpemxFMFFNRzdzd0gvSnNDRHo2U0Y5?=
 =?utf-8?B?YmN5a1hjemwyY2EvVEtLZ3d0N2x2dUFPclE3akIwMEhjZlZlOFJyN1VpbjlF?=
 =?utf-8?B?U3NONFZKNDNzN000M1dPM3orcFI4QVFpUVVseENRaFRIeEg3dUpNcXlNR0Js?=
 =?utf-8?B?WWRLV0VtdHhGSldPaUJrcnVXOU9yeEF5QnJjOGJmK0FVc1VxTy9INk5ZY3dB?=
 =?utf-8?B?V3ZVNm9CM2ZoUlVadmhtd2FCUWpWSWZ5YmpCTEZ3YVNPUXFWdzlOYnV1ZXNs?=
 =?utf-8?B?UmdkY2JLanBETTJYQWRSS2Q0MFY5cFVTQzk5eE9GakFkNE5jWHpGQzJ1VFpw?=
 =?utf-8?B?VlBrdDBhcjI4bmgzR0l2VHRpTWhSVmg4djNHck5XNDUzUVBJU3VHUWJSVzdW?=
 =?utf-8?B?dmlWSzZGQU1QSnhrbWRtbm82dzhHSGt1UkcxY2VTZ0cwVlp2Rjg2OVp3blky?=
 =?utf-8?B?L0pjMTArOTVhT2NYL29hYmRxUVVlTnhaVzBzYTl3ZlNZVEtFNW1PSWdybEsv?=
 =?utf-8?B?YTVDZlgzcWRpdXVTWXZlNFk1VTVIUThuZWt6Q0tpaHl4WjB5bXVBdjhodGNl?=
 =?utf-8?B?SFhmNmQ5cmxTNGd3NGV0dlBndHdoVC9oNzJjS0F5dG16RlhNVTRwVTdZUnBI?=
 =?utf-8?B?SWNqS1Z3L1RiWTBLM2Y4OGhlRktKN3M5bGh5VEdRTkJ4YTFOY1pQRXYwekJz?=
 =?utf-8?B?NVgzZG9sNklWWlo4WUUyQmJpb3Q2OUdxcklNcStlQkZRTk9sMW9xd1drUDZz?=
 =?utf-8?B?RTlkbE9naTFrMGpIUkV4TDIwVVlsK2FkM1ZDRUxPZWpsUjNHSW01bmo4V1pl?=
 =?utf-8?B?K0QxeWhITVMyYWFiYmoreno2azRVS2MrTyt2d3k3eERIZ09RS0hIekp3bVhD?=
 =?utf-8?B?YXJJd3owZFpCeDFIWTR5ZHVYREhPZEZ3L1VUb3pBYWJIY3MySVNURllYYU9K?=
 =?utf-8?B?K0QzVHRQcWdoNkYwdUtBeTRURXRxN0k5eUFYZnp1aTYzMWFIbzZ3ZjVrWUNa?=
 =?utf-8?B?aEpNWXhjVEFiMnlOSHJLQitvclE0MUFaREg5UEtsZ3FxYk43YzUvQmJaaTVl?=
 =?utf-8?B?RGVFL3BoajZZNVlsREYxRVFSVGVuTU1rQTlsSWZlZzk2cy9EQWxpS0xJQ280?=
 =?utf-8?B?ZzE1ZnFnTGc3a295dkNOcE5qRk56ZHV0SHd1WkRQbW52S1owMnNHL2poWnBq?=
 =?utf-8?B?RVYzQklwZHdmY0g1ZlY0eWpJdUE3dGJnL3ozcVltNXk2Z2pqS1UxVlg1NVpn?=
 =?utf-8?B?TVpYN3JqL3IzVmRLd0dLdkVYUkp3SDFubUhwVUlpcE84cU9ubG80MEdkMXMv?=
 =?utf-8?Q?sQ7ItO5Lga7dbVLHzHgab/JTf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5298361a-ac0e-4793-b306-08dcdf25ee85
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 18:55:18.9669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ltdZdraaB34b26T5T0LKhEM5hvuTCyTlfGHg57SSTFWibdTpThAb91CGkiXGfzb6p+iKuLWV6h4jlIG5pwgJ5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7813
X-OriginatorOrg: intel.com


> 
> Should we include a copy of this database in the kernel sources?

I believe this series does that:
https://lore.kernel.org/x86-cpuid/20240718134755.378115-1-darwi@linutronix.de/

It updates the kcpuid tool and the CSV file based on the new database.
