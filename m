Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874D62F3C3E
	for <x86-cpuid@lists.linux.dev>; Tue,  2 Jun 2026 16:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780416784; cv=fail; b=gG9q8yUOys89CXoOFLMORpy6/YVhjnSoOVOmGZMDJop2OkKCFSGWb/Lt1O9YeT+Iz18H9LXqSdujgoDEOC7IU5+fQ/+9MgeZ3UeTIszS1hPMjpfGBIj2MZ9H78FQQs+Hzf8utcCbI6TBvjcDbqXy43Zr49Nst0l7u+VCiG0nEOg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780416784; c=relaxed/simple;
	bh=V9RyaGcCjurUf/nn4YWjj0GOV/64FlVjUy50rXLiCVc=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=p//jVW7GWrpCJlVlaHJNZoZhyyUir1Y/aUyYF6ODfa4F4ngkyPK6tdD1TVj1FTG1NTZe/J4iYQLDxM+IAlwGPG9rqJYyscaW07Vs51I01nPN3XsvWWAvH6N7v8zfEaRICKg27N9ESPMbv67r2tyH0KD7+eKW0RWkqa/YsCjVFQY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ibqbmhfq; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ibqbmhfq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780416782; x=1811952782;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=V9RyaGcCjurUf/nn4YWjj0GOV/64FlVjUy50rXLiCVc=;
  b=IbqbmhfqKZZsOY4UUA4ktq0UlrbGQL8zzwsaksBVFwlSyJGCutr56y95
   JzyClvHt5LbN5LgtVhvawZLJ3xuIlFtf4FVDEASLA2WkCK5yQYc6BwWH9
   Rmbj5NwQkBPFvs0Vdor5mkrUSVz/9cOvlxYSTPat2t7aERDdjnJCNieWw
   f5Q9d1jlGgjrw5IiEu/CjIhcsDmrFeJ2N/OBNWVBJs0Q5n/DxkRLD9ppr
   ZWi3gGIHV5u1c3dQLbwQuT4N8y7fNHvV9RpGXsY8EhKlLWuKXzuE8LCX6
   GKs6XLNqeg5zEA8x6DcJHmlVR29Ad62WOkbPO6kJTSEwztlmXELGZvita
   g==;
X-CSE-ConnectionGUID: VNAZD0oVTYqcNu7MsPTHug==
X-CSE-MsgGUID: uQEhTPJiSBCV/F392ofFug==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="92694309"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="92694309"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 09:12:59 -0700
X-CSE-ConnectionGUID: n93YfSopSGi9yqcMIlsZdQ==
X-CSE-MsgGUID: GADDbJgCQ2ihli8ySl+1/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="237601330"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 09:12:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 2 Jun 2026 09:12:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 2 Jun 2026 09:12:59 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.31)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 2 Jun 2026 09:12:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q1Mses2VizNcsO/vyJfdmDQ9+Oah0SDI3n7wzDzTsYxiO7wZHH4ANuVwwgGWfdcNAM3OahVCI7AcpMnEvmQXwVDWuNqYK9udcSGcJcI0gB0shSlpTzbHnYVzfZ/9CiDgCJWmLGFpRwLxU2HIMUzV2n7LJAfO9vtGzj9/kNdAqAfF3MM8i3RmzASMlSH/+Xo57G5Cwe5AjXL0ei1FEM8HyEt95OVllw/dPA37M8p9Ye5/+10tIRN9a73Fp2ujAS7h7Y2awHH3StJJPYkRjmMF9oDOqI+TTVzvzoSuXtodQt3bYpk24K42Tc4E2hQunZle6XG6QfdXFBHJUfEfVLttIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L75kvjEb3ZkR5aul8xHh3yVbAgk/m/83Lp+TP3IxGtk=;
 b=jb6CAHsC81kDdGcmKL088V0Hzbp7Q8NAJINlYd0qSf/L/a7Vk0cq2iarKNJ5SjG6RWX5HKvjM2BABFLy679/orPlvWWmoA68fsVUyQOt8ZCDdUKLUuPrxGoxi+Dx4XlGX7RgZNcXURyJujGbLs5pFJvYdvMkzdIefA+sJC1pZtGZIhkoV5ZkIed32loH2l32UJCFhpUN2gUCivd9CNXIFHfo9dHTT118IZojnLg1WiLOhDGe644qqUHhPT9hdRgbfhAtdsdp6yeEEZhpC5mVGOonldxJWIy+JrFmtKxFtDd7Q5n5U5XKHIhErhOe3Fonc2Ehn8f0XUXtwDgT6rnMHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB3282.namprd11.prod.outlook.com (2603:10b6:208:6a::32)
 by SJ5PPF7CF5FEA5F.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::838) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Tue, 2 Jun 2026
 16:12:56 +0000
Received: from BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19]) by BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19%4]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 16:12:55 +0000
Date: Tue, 2 Jun 2026 18:12:47 +0200
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: Borislav Petkov <bp@alien8.de>
CC: "Ahmed S. Darwish" <darwi@linutronix.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, "Thomas
 Gleixner" <tglx@linutronix.de>, Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Christian Ludloff <ludloff@gmail.com>,
	"Sohil Mehta" <sohil.mehta@intel.com>, John Ogness
	<john.ogness@linutronix.de>, <x86@kernel.org>, <x86-cpuid@lists.linux.dev>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 004/120] x86/cpuid: Introduce <asm/cpuid/leaf_types.h>
Message-ID: <ah7_wPJ8_FGLOwZd@wieczorr-mobl1.localdomain>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-5-darwi@linutronix.de>
 <ah2WBnBkz8KQrph0@wieczorr-mobl1.localdomain>
 <20260601194150.GDah3gfjoIZIByCa3d@fat_crate.local>
 <ah3jPMYIxC1vsUUB@lx-t490>
 <20260601203452.GAah3s7FevsRDFT7rF@fat_crate.local>
 <ah34pi6j5HSMJdrL@lx-t490>
 <20260601225306.GDah4NUvJwaqQem4VQ@fat_crate.local>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260601225306.GDah4NUvJwaqQem4VQ@fat_crate.local>
X-ClientProxiedBy: DU7P251CA0026.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:10:551::30) To BL0PR11MB3282.namprd11.prod.outlook.com
 (2603:10b6:208:6a::32)
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB3282:EE_|SJ5PPF7CF5FEA5F:EE_
X-MS-Office365-Filtering-Correlation-Id: 56aaaea1-4352-4dcb-e8da-08dec0c1cdb5
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|22082099003|6133799003|18002099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: df9c+JQhJv4AwM2ObA9vuOa0ZjOInwYjoSvZ+hJEjJoTa68bWNXchyJ/I4zcCErehkkl7EOhMOvLlEgkI7u1cJN09zSwnqlGRHSw3fNrejqTruNM1nXX2pSU5OBkXqVT1ytPXfvk9/rgIq6gskXhm6UmJQ+sigOEC1gYWEzxr22eIMyH+09YNM8ftgaEO8YDrmxlMMDaCwut0ZxkSex0ZffZOWw/tOLCQk7aP2xzXzQM+hmCAHLHFF2XGurbb2OsAWuiReE08ACfxNxtIcklJNSG0Ifzv0LGt9T+l/nLoge8DzDH+ybFHjtwGhbnS0HZLvIIEIspi+ZygWiIc2/uC26s4x07tyjzQLNIL4q8px6+pYyfnPYsGkPhUdBOSfzETNZdnPixuLz6HS5kNoYClAAfmiGYzclTaSQ6I5PgncoE7GDvDxEeSVOyJ+VmcKvb0MUlcqMJVZCxEQwxz2nflAokSo3EjTZ3xPXJi2TJThERRMP2Gba77N852QVDlFoCEEFpWa9NX2yOepeZcrX6BiZwcLQtl4xfo1dv604/ve25LLU1pXPd7tfOqDzPzLiXGi7/00VDC1F3mxx1FNTNrOCWpF1NNmvdwztmKvajn3n9MZr1k7K/3xvI/HVlr16EuNpEFNOrXf7QMWwC5i1tllf+EWkdHRD1QDw0SUF3yiwsf2+9CtfTxK8iFMBcyT8o
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3282.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(22082099003)(6133799003)(18002099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?fVfpCda4mqEmylLNW8lRsturTBeFpLCt07THv4JGlKwuMY9lfDJHyXXgJf?=
 =?iso-8859-1?Q?/j+x1ju4AjMg15yvYexC7kLB70HhizBghHqPDpgyPtgbvsJhkgee8gL1f8?=
 =?iso-8859-1?Q?5249VXJzuwdCCcY5e0Zs42o1bvwwQV7W952M1jBBLCEALgvszKxrdOINLP?=
 =?iso-8859-1?Q?lZ6S8e4xSh1Tn7Y/9dU9aTqYMG4icOpNnc6JvHl2y0ugHFgQ9sJeacG9+8?=
 =?iso-8859-1?Q?V8urT7zSOYbn1E6cJcYEQ+6P06pkN70wXaX6eaAQGxjxPMLurNcxfceCoJ?=
 =?iso-8859-1?Q?gwzA30KPFBCFC9+OOV9GVI+65Wb4B7iLBJisFoq3q4VO7s2oh2Tmj0rzk/?=
 =?iso-8859-1?Q?1QmRvnOPJT0VqCT9Z6kOl8dZVJ8D2hw5KF0FOQ/ER9nXJUIcmlk2X+TALx?=
 =?iso-8859-1?Q?65oMrJgWjWumswb3v8CEBM4o3OgPPaKSrfUCFTcBiPStN+GDRkLdovsVOj?=
 =?iso-8859-1?Q?y9zR7VbAvu9IBJdQ6n/cYQPDXgMlbkk++g5y3B7ojtJitYMlG+mrM9IKgk?=
 =?iso-8859-1?Q?ImUTe7Lec9lhJOxnguRk+u4+DzmNj/CArRBrbwPVO5mUDzemojsnV5mSUH?=
 =?iso-8859-1?Q?2AY6BbdKu8pSiDPVoq33GorAyo47/V708R9sdhQyIYb1Rf7cQ+45DUD0sZ?=
 =?iso-8859-1?Q?NQGQ4Gy4AsM8j1nWFWpLQVmQ7uf52RpAyUbV9Mbiv8BNWvhUfJIKraoOaT?=
 =?iso-8859-1?Q?aHOV6PmD+HjWMLehYJaXkc1VbWdE5t8qLDKJrkoj//47U+PagrJbBV18u1?=
 =?iso-8859-1?Q?qhKakDShy26d3yAQAnZ7p8NXYDg7yxUM7ylMtqd3GF9MNaFfsWBg7iEqNU?=
 =?iso-8859-1?Q?qt0lkAcf2wkX+DC/sU09uPhkK3cR0xkjcUNT30TfBwJY8bglLgjW1iZLos?=
 =?iso-8859-1?Q?DrQuGpzhUEo/Uq9YcFOcP56iSTW4Y3BL/S+D0CP1/bIkBdUnpKoVmYM5Rj?=
 =?iso-8859-1?Q?YOXo6B2/wiTh8mTS0m+L7V65IHaMkmEnLW3eViovwZGN+Sv3biARNBwaSy?=
 =?iso-8859-1?Q?H5pyj28OlX+XNzvPsXfZgj66RVerw+q+SVFbRqICiK3sbGL4GBUIBZc8Fz?=
 =?iso-8859-1?Q?vNAQjvogOmT6NU/KVDeA6kaW64y8Eq4bRMhB8ZhP5PEDlV94oJiCxZvmdB?=
 =?iso-8859-1?Q?bZMJ8CHEPiH/bGOdx29Sisilggy4mqFJ4jLhDqmkCMtIliqdv4DFttr6Vl?=
 =?iso-8859-1?Q?0LvnBkD9rLv2ea1ocHbKL9bmBlDw6pAZpxARHFSa/M0V21zdyQoydiW3oG?=
 =?iso-8859-1?Q?I9a9Ph8HPwglxY2H5BM40uiQXWrchC/5dEeHd/Nk3qo6//bEd7DVq/qzTh?=
 =?iso-8859-1?Q?OUduTNuBn3QSJYh45LHA5QGGwKic0J2VhuF0v/ItpgyFu4efJM/HRRlNBF?=
 =?iso-8859-1?Q?pSzpzO2VHMyEOGSbIVKs4/hpW8oIEoIKCq7MusuifR+dHUExoUt+qyo6vn?=
 =?iso-8859-1?Q?N9CCXCWlDAwoTYrdW0xyaL9WQvQtjfe1OhxoJ/MoEvESuGFB+s1vD4fwzC?=
 =?iso-8859-1?Q?ShaB9R9PoRbTDfrDqhv4Mp69hKrQVyvzif4i2ERXZUyU3Lt5O3MJKONTgc?=
 =?iso-8859-1?Q?O/C6v4/Y0Ug8r1TLvAysg4KRLS6EjdSj0yFFOzzTjjAhLBHoAGxPI4mATL?=
 =?iso-8859-1?Q?mzm44U0dxdQqPAJvo4O5urENOaaZQmj5x6cVa0OpxRZ/2qMoKsJpSipCoj?=
 =?iso-8859-1?Q?CL7mtHS5/V4aO0mb7xAOT+Uu4f4NqC1c297pYHDQ4hWTAOafuMWPiWnErR?=
 =?iso-8859-1?Q?X6vU6BkX0y6GvCyHr+Sv3VY8xCuePOlQtvkWEjSQCJgAkC25+uoFWpzOw5?=
 =?iso-8859-1?Q?xRIHbwOXyvsWzIjgDznvpaYNXKTa4nmdLc7uTZB1zGrsrNxvqR5Y?=
X-Exchange-RoutingPolicyChecked: SgIk1oKpUHjsNNxD+Xb5jOUEPkpv3iYZR4ZDPwju0ZAqXwJBptN5NrF44PWDmHsZgHnEYfsqqy+kh9yUAmmkqg9w3ZSVUIV2aO29onu7fV6u5O9RtD3IV+FZbERleVUqZUbEILu8MLlbziRkv/icIZQLHfiOcRj9Sui8PQiNabTy1DVtBguCbwqff3ojFev63edpKkYcbtoILtZxvr0q+CZKcoiU1CSu46ql9Bs2UWH+t1+PhJ5cHoi7+h9V7owyw+ETZbPuGsCluOsDaMr0vCxcPp38ZmCt+SzmoMuHlwb6G8Gf8Z6fXmdSayXhkiV1U/PlqYICVqgVzFZJJrxnEw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 56aaaea1-4352-4dcb-e8da-08dec0c1cdb5
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 16:12:55.4333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m367NLU1i0dBlpWWlryv/RRCcT7prrzfn/NFKgCycT1BsKNZQ+jvmG4Rt6R7iVnfBhUOUK79UKePHpCL3otQRC4Zcjv1TrRi5QzLTZPPB00=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF7CF5FEA5F
X-OriginatorOrg: intel.com

On 2026-06-01 at 15:53:06 -0700, Borislav Petkov wrote:
>On Mon, Jun 01, 2026 at 11:24:54PM +0200, Ahmed S. Darwish wrote:
>> Maciej should first send a patch to x86-cpuid-db.¹ Then the header
>> generated by the tool can be submitted on top of tip:x86/cpu.
>> 
>> This is for example how it was done in the merged commits:
>> 
>>   49394b5af45c tools/x86/kcpuid: Update bitfields to x86-cpuid-db v2.4
>>   300ba891418a tools/x86/kcpuid: Update bitfields to x86-cpuid-db v2.3
>>   5e0c3c5e95f0 tools/x86/kcpuid: Update bitfields to x86-cpuid-db v2.2
>>   ...
>> 
>> One component of this work is that you and the other x86 maintainers will
>> enforce that "auto generated header" rule; unless something really urgent
>> pops up and common sense applies.
>> 
>> But a single, yet unused, bitfield spelling mistak is not that urgent to
>> warrant breaking the rule from the get go.
>
>I see two spelling mistakes and one in the comment.
>
>Agreed with the rest in principle. Also, I'm fine with the patches going in
>parallel to cpuid db and the kernel so that we don't have to unnecessarily
>sync there and either can be picked up independently.
>
>And yes, the process is already documented at the top of leaf_types.h and
>I need to make a mental note to myself that that is the flow with this header
>now.
>
>Thx.

In that case I'll send the patch only to x86-cpuid-db.

-- 
Kind regards
Maciej Wieczór-Retman
