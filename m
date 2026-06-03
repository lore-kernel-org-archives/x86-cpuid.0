Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17FD409120
	for <x86-cpuid@lists.linux.dev>; Wed,  3 Jun 2026 12:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780490643; cv=fail; b=m1FQmR4ghlMxLsqGOQzc19e7HZFm7zVmaVb2sxqvPYISz7d7tP4nM/Y/izrg2YHyD06M+asSvX/Cl82H+7H4NFHfGIrLYllecCubFEVIZ7Z39EtNlVbABjjQtDbfA9TvJy9wMPy72AdSoeQlPvjDp7nw3eFIwq31xwfUgsnZImg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780490643; c=relaxed/simple;
	bh=yI6duPOW156tbV35J0FBsoerZg9rz7IqbQudBFXE7zg=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OzQtsxxy9+EDGBR3A0h02YB80s04Zev8n6vua5bjQ8e5wJErk4jAv5ZSt9+kF+y9CasDcA4174E34kVzjKmdRmXZervx0/SAOD0Nbo9GVgi6wHsbnn6ThesRWIqsdwZMqGPkICs4KVtulIIKlGOylo9Sdamk+DwJlaoDtILICg0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EUYnpM8g; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EUYnpM8g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780490641; x=1812026641;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=yI6duPOW156tbV35J0FBsoerZg9rz7IqbQudBFXE7zg=;
  b=EUYnpM8gwg9QLLGKEMoU6StbxKAeIs/B2i4PqBoCZ/tY0EzviL3+rUQ1
   BEIidciBzGiuV+ucoF1UrWi7cMsJMlXfYaN3OCeJaBxPPlk7usEesFBb+
   6zy/8m5lG27ZFbkcJlNtKBfcR6PLsOQ3FDg35ZP2FogsFGZtzeI97mNH9
   ibi0KQDGOTnKwBFhuCdh3mh4U4n3coRFLxJaDEWlP8HMwKveskJgU911m
   RnJFzioiN1M9yfEf3+wR7Hp7G/GPcnOo/1lvGE9TPhpfIcsa9oz0pNJfd
   P7lovmBZDh2nPmhEUjkAlaRwIIqhr2m9SxWP2KRp2RGXatC4EuwqvMA2D
   Q==;
X-CSE-ConnectionGUID: 8qvNzSF8RB+NBSY6fIxX8w==
X-CSE-MsgGUID: qYhseL43REaEaYVPYAKbZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81274989"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="81274989"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 05:44:01 -0700
X-CSE-ConnectionGUID: fix0ydtvR3SHVUCR0X8syw==
X-CSE-MsgGUID: QQFc4XWwRya0020cUe+Fsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="243382416"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 05:44:00 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 05:43:59 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 3 Jun 2026 05:43:59 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.70) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 05:43:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LUI9wLfF962ynUjoJRo39Hv4G0wRcGb0JQN6YLCGuePfPEuzsGSJ+czNP1iScOeMmZVJOw2BUsmXuWTJaUBzvFyzf2gLyI/xsYOVR2xqXibhgAKpcCr+wUjGtHUJxwIzLmK8kf6qh9h8EVFPg8+yI853Lj0Lnxhpw0ZtdU3ZUAAwLnLmaZI5MHJqpPmDNgt66CZ3vT1/wx5SLIpev7vIik1Ycxe096uoHNEJMv+a6aUZWFNcsmoINUZDDXq/ph1GQpKEuSAjJInPN6DxDAbVw8lKWborDlSMJ1t4Bj65SdQLG9++9n4/oDb/f+wE0ykG00lbEaJCBQ2LNKeXSDgJYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EkSppHt829vd1ixFPp2U2n8n+lptGQ29n30eTxWEb28=;
 b=oAxuweAey85AYibCRIR+wly7ufAdu4ERRRgWMZx/HQDVNyY6JYPt7uSY/rWq1fq+tz+PQEYY+wjqVbAvhwRsm2Bja42BfbY1k/PQ4Vt2oMGZxEhiOfHjqs2h5z/ksTI7e6WMV2FLrG1TMA6RPsdpaJsR/knWyTrnHce/RAcYKjAw7f275TGNNSBqSMXoqKz5ulcdaMZlDeLMWDy9IksQiXItcErXKmFqNRya6vlZY+Re29lvzUwntKzCTwTsOqppermZzMiJkvJr8K5D/Hrrpp+ymPJIYqPXXWlUfobIxbfrzrd+mgXwl9rFGaNGJTI6P0m0Fou4I4/hVuuUjMwPzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB3282.namprd11.prod.outlook.com (2603:10b6:208:6a::32)
 by LV3PR11MB8744.namprd11.prod.outlook.com (2603:10b6:408:215::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 12:43:56 +0000
Received: from BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19]) by BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19%4]) with mapi id 15.21.0071.015; Wed, 3 Jun 2026
 12:43:56 +0000
Date: Wed, 3 Jun 2026 14:43:49 +0200
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
CC: Maciej Wieczor-Retman <m.wieczorretman@pm.me>, <mingo@redhat.com>,
	<dave.hansen@linux.intel.com>, <bp@alien8.de>, <hpa@zytor.com>,
	<tglx@kernel.org>, <sohil.mehta@intel.com>, <andrew.cooper3@citrix.com>,
	<linux-kernel@vger.kernel.org>, <x86@kernel.org>,
	<john.ogness@linutronix.de>, <ludloff@gmail.com>, <x86-cpuid@lists.linux.dev>
Subject: Re: [PATCH v1 2/2] x86/cpuid: Fix a few more typos
Message-ID: <aiAg7jiKlMpEOg6Q@wieczorr-mobl1.localdomain>
References: <cover.1780487165.git.m.wieczorretman@pm.me>
 <237c2be340be63e67263c76f065b3aaa9fb1fbbe.1780487165.git.m.wieczorretman@pm.me>
 <VSPzv-XskmaGJdDd-GDBQ0Z8tLO4IP4x9mkfGrzTkrhxb6Fn1eZnwkUnu3XkEKFGKgVwkh5zyv-E5dqAlhxyNg==@protonmail.internalid>
 <aiAgMebb3JpT7g84@lx-t490>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aiAgMebb3JpT7g84@lx-t490>
X-ClientProxiedBy: DB8P191CA0002.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:130::12) To BL0PR11MB3282.namprd11.prod.outlook.com
 (2603:10b6:208:6a::32)
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB3282:EE_|LV3PR11MB8744:EE_
X-MS-Office365-Filtering-Correlation-Id: 1477a9ff-7ef4-499b-24ea-08dec16dc66b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|6133799003|3023799007|22082099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: Bhidpwc4ACGJxLcTHSiz/h1AyL1bA9oS1xZCNsAzHJedtbnDmFsiyZiAWr3vC96+Ik/Fd4NhYs51xdnIojgHYfCbxPjOCAAkQEiU2cq/7fa/2AzFqvFWAabu2TliGbsow0LxrjcZXwARlcwbfYJEyYoUy53BpOSymCspjgomLr3bK8HMMlma2QC3Ua0ncLC0urKyVqGKm1BychaFk0GgAUogh8VfJv2mmeTiK7ZupkFgOsWQqUGRs/A/aSxnrFH+Ak3RloN4mUwp/h758nRbhU9UJKvLqPbrX682lB/DAdDA/NfyPN5q+lbvY1iagzS3Ztqj4QidwDcVtE0E1wRKEfUEPHgVmf8rxtp4JMEfLdzvVbSxeSuR5xaVU1hi0vNmnXRaYGa65WbJ55oqeNFUlUBi2oYoZqLuYMA06rfFKv6YmuYHiwvtr3TzAcP9VG8j2rCSOeN+szvGLPEIZhL0KeVZtkSVRXlUwx9P+PrtJjQIxEjhAs/l2N99cwImlxk2SiG7SK6Xp7KDmqYN1Y7HV6cDdMbFtl53eU7iqWGliC1YxbdliTNCuMhcBrJ+/YKRMMwTepk9F5PrUtXBZaGyxQ3BxRNKNG8yMBbpt6qt1OzQuyS+y1hVu7CZ/JWM9UDvDkg7xnn+HhJVrN3L3eMQjQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3282.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(6133799003)(3023799007)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?dQ6TCN6cdyv3DDHWqueM2ozFixF67f6m3KR67A/JmasRIBfum8PDWIpAy2?=
 =?iso-8859-1?Q?B03LvDTjn3QT3fibgqfJ3qzszXHMfG2f/43mZbcMsFHxue6q+35Xc4CA8a?=
 =?iso-8859-1?Q?ZZD261gMwpc3Z5UIA3d9UA8XG+IIXcsyiY/heW3bga15iQQh6a6/pkeGJy?=
 =?iso-8859-1?Q?9YdlSFBeqweZux6TvS5CaJh5l13yrOnAMwI9UXcMqbNsEMauyw2Zbkw0B1?=
 =?iso-8859-1?Q?7x8Ytrd6b3XwfHZA51MqiVYiKuWxyaSn+/kgW+1mO/TaIqlUnC4R6P1O1b?=
 =?iso-8859-1?Q?vfaXCFTYLrFDjquSWOcZH0Mz04yOhrJ0sAfWANQeXmCxwT32cCavbIUR3D?=
 =?iso-8859-1?Q?okMxzRbd3NQ46fEWShpwAUVAmA1F/wDxjpFxPXAgtXW3Bz19xjpnzyZC32?=
 =?iso-8859-1?Q?5Mg7aB2hT+BVh4wYLK4XXq1DD51h1in3d9QuocAVn/qvx1IbXQnCku1Tn4?=
 =?iso-8859-1?Q?//Usgy8IScbafoGzsfOnBBfISaokfZP7BTanJDhQspE7u3c5ANuzT8k/AX?=
 =?iso-8859-1?Q?e+7o1oxWFvFYQs7+Um+IOHOVpZrHTZrwsb1cSWGYg8VJk6gdzXC/SssjDk?=
 =?iso-8859-1?Q?BtrCVOKPBC8lwFZ1lu1XAEKB8JWuc0dE1KIqYlHnvHWTpNvVBCI1vNhxr/?=
 =?iso-8859-1?Q?RmCcwpXcrxI48/LpCxxsOeV1Hv+B6TsPZ55j9GuOaclXZfWESPnYI/Rnty?=
 =?iso-8859-1?Q?JAYk8f4bGdQorUfpqUBbM+Rdrdr7PaPHginymy2bxSaB+xsmVheJok8X0O?=
 =?iso-8859-1?Q?oz3Dw8BdHTyS8HWLRErnDQ+pMASv9F8uCMw7S4BMLo6Y1NuY7Wc9NLUk9y?=
 =?iso-8859-1?Q?X4AH/4ZJXKWTlw2rP8GVIjM6CmJABEvHldfFf3nRzROUld+rMnKb6FX/V9?=
 =?iso-8859-1?Q?bVSYe6TX94IhL1kmjFlCq6lpUFCMzARV2zLLv1Yi/M9u3efagqiYRJKj6L?=
 =?iso-8859-1?Q?FA/oGJVSmFXvFYw1BltWWlZEUS9pEYm9Rspc4YybBqcsl4QXevfRBlUzam?=
 =?iso-8859-1?Q?ZEcP8Z7V9zaQgQntESiBCUcoEbIxPrfVpOVSCI6cahkTlN8r2l5mPVFEQO?=
 =?iso-8859-1?Q?0ByFPuh1DPU7jDLp0fqlCmwBS72PE4Hm/NUuO6X60NfoN9fxqJq/wTErXL?=
 =?iso-8859-1?Q?Bcm6K76KJ8/XMVVtnyDdB8YO3/GglU3qKZ2lYskBTwzYV/3bfQt/GYgpt9?=
 =?iso-8859-1?Q?s0XRsOv8fB8NcoYx7+5Yo91ycc2vCrdrz5kZt7u+fAJhquHZ+UikHY2Vf2?=
 =?iso-8859-1?Q?87vSsJEgXTTuvgI2AEN3MjvGz4vjJNa7pdaXdsZlZmgaYsBd4h3f4F6Fnh?=
 =?iso-8859-1?Q?EleMGdubRAmOIZXug2kpPuumr6aJNEG6qQ4Ru4CM1T9PAM0ue9If3QVfjU?=
 =?iso-8859-1?Q?v69dOg1ynvzvCed8eC8SGnnH7F9YWMKxSZ2f2qWwXzDDHxSq91G6Eq4c0d?=
 =?iso-8859-1?Q?qk7yfjMazIIE984uujaZjSfuKCOqYEU0VcuMGpOp42/feQRa7qR9Qk/+7R?=
 =?iso-8859-1?Q?TfYylYYjTwH73rV3E+qR0Lv3ozDzDDAJIwD1CU5SRj/jjGALREU3l42++O?=
 =?iso-8859-1?Q?MhNXjb29okm2v8c8JYaSxg2VJyen+klCBMC3P47M4NPrlObYSXLwzdMKrg?=
 =?iso-8859-1?Q?XEprvvu984grUFUeD2bZM+zaFhll9itKk6A8AA2UpH9895LznxI627Oise?=
 =?iso-8859-1?Q?TwNX2U9Y8Z/PX/hvskYl7QQBjEhiBYpyiSZAKPVvWxktzx50GfDAJIqmzH?=
 =?iso-8859-1?Q?SrRPXIHRa96zaA4PINn1VG2/uD8YaOKBUgcKl4w/9SUhut2OnLTMhWI4jk?=
 =?iso-8859-1?Q?FV4Rys6yYYnveEXckWIqN9heknRDbrl6RWhJBpx93vZa6Iiq3MbA?=
X-Exchange-RoutingPolicyChecked: IOJlnrV6WeW6k39EbuIkQ4yu3CNDZR1fkii8h5VuTR6laryFKV+s/QJ9RJuPoZhHLp7ZBL4FZtuKxnpdfyvaP2MXWiowIM3mGbf7lBE9xWwApwrCalwoQRNu7s6bywL+ZjixvyADnNU0HR73kry1EwSBRHdTio6iwOEo6McpypEFPSEyqn/3gXzC+aC0jpQvJH9hmDJTSOL9YL32ijwVgvmUPTienodPaGEgLyfA554IGsXFRkRJOpGeaXy1djNe/Z/O8WQzICm1tCkMOvW2hl4Ka5/1o1PkXvObGhaC7EwIklPdoZO5VIhJ4Fj2axF9rVS8hHapBaNaHIT7Og3hCA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1477a9ff-7ef4-499b-24ea-08dec16dc66b
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 12:43:56.0869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BrrTbf5ckyTZm38gQWVld2NcOup4UvP5XmfOGZY6jnOI6P5ea09+/9qHrVM2bVcuUH8L0gLgUaeekTAYOTDwVIXzL0ofsvpQzU2Z/zmLUgk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8744
X-OriginatorOrg: intel.com

On 2026-06-03 at 14:38:09 +0200, Ahmed S. Darwish wrote:
>Hi Maciej,
>
>On Wed, 03 Jun 2026, Maciej Wieczor-Retman wrote:
>>
>> From: Ahmed S. Darwish <darwi@linutronix.de>
>>
>
>Yes, this is the the CI output from x86-cpuid-db,¹ but I did not author
>this patch.  Please keep the From lines as yours, since x86-cpuid-db
>already has a git history with all the authorship details.

Okay, I'll switch it to my authorship. I was going for mirroring what the
x86-cpuid-db commit history has.

>Also, could we please make the logs of the patches modifying these
>auto-generated files consistent with previous patches?  Please check:
>
>  49394b5af45c tools/x86/kcpuid: Update bitfields to x86-cpuid-db v2.4
>  300ba891418a tools/x86/kcpuid: Update bitfields to x86-cpuid-db v2.3
>  5e0c3c5e95f0 tools/x86/kcpuid: Update bitfields to x86-cpuid-db v2.2
>  ...
>
>So this series should IMHO be just two patches instead:
>
>  From: you
>
>  patch #1: tools/x86/kcpuid: Update bitfields to x86-cpuid-db v3.1
>  patch #2: x86/cpuid: <leaf_types.h>: Update bitfields to x86-cpuid-db v3.1
>
>And in both of these two patches you summarize the release changes relevant
>to the modified files and add a link to the v3.1 release Changelog:
>
>  https://gitlab.com/x86-cpuid.org/x86-cpuid-db/-/blob/v3.1/CHANGELOG.rst
>
>I was confused actually what the first patch was doing, given the existence
>of the second.  With the above format, the git history of these auto
>generated files will be much cleaner.
>
>¹ https://msgid.link/ah8-uSSdb1KcLByV@lx-t490
>
>Thanks!
>Ahmed

Sure, I'll reformat the patches and resend soon.

-- 
Kind regards
Maciej Wieczór-Retman
