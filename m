Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C20A2C08BB
	for <x86-cpuid@lists.linux.dev>; Mon,  1 Jun 2026 17:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780335283; cv=fail; b=VmzL5uTBEtyVZAMXX+Ki7LKyCxHbViUaGC1t1ZImwbah6Zw80kywM8+izKI0G+UKpjVOKn3apzPfkPWFTf4MaMMC8YlY1OSly/70NYCqp55AFmuGWUxlb7bRYRUCnLVS4MpTAsEEElTtw+Dr74KALadvJ4IetkAAYi542F0H7E4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780335283; c=relaxed/simple;
	bh=vD05c6nZnQqALFeq2PCHGx8RY3YdyR1lddOPOAjkzaE=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SM1vc9H9qAPbhG+t+udHbETQ7MEltky/jmIPwhVPP6jDH5HnPuhyfaQwcEngLWdqZsqseeuxEZ3SRuM3iitnLWmy4RzTlXrSmy7ewyUVHCd12LGOwVeL0PVk48eOTWppgap8eSGVvLHSNnBPLlOuL+w93xTi8AszkIlwb9hyGEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I8joNP+P; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I8joNP+P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780335281; x=1811871281;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=vD05c6nZnQqALFeq2PCHGx8RY3YdyR1lddOPOAjkzaE=;
  b=I8joNP+PxVrQxIsmD0WMekgM7j3VdPAVa5YEQJgtZwmRB55GWCAiy0l6
   Dtr0e8VO9SHklL89XcPyt+l/n9nIALa09a46jXAi6c+Xi+85gUfaYdKMJ
   v2XWQ5/NMQdFNJXfwlHUeHJTlhdmAVCiIDVXw4Dcy+Zq5Rge+cQhrWiLc
   iBKvtzjmZm+8xj2DC9nnDiF53znLpdv9rXDIel81stvRQ5xSdUadvyMMj
   hHKn1q4dQwUa+Umo59oZtX+PisTsxKFJi1rS8SCZgF1c2q8vBlvHXibqI
   PoWsTV/mXoHyzXBPw2kHTPqOJ0pQ13Or4NgJpoL7qWn3Zn7B5ae6o4VmW
   A==;
X-CSE-ConnectionGUID: d2c3Eo0sR8eCvFFQih2MaQ==
X-CSE-MsgGUID: Qs0YH7JLT7G61WZx/UUo/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="80130989"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="80130989"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 10:34:40 -0700
X-CSE-ConnectionGUID: rtmEXX+WQe63cJqdM1PMqA==
X-CSE-MsgGUID: EhsiGFl2TKGQ85+N71tjZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="245460636"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 10:34:40 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 10:34:39 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 1 Jun 2026 10:34:39 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.7) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 10:34:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KH2EiyLYYX6zRLlKJVrN5LB3SOoufzoVT9rV0Rau0D93jjEX8akJ4FIRy3QFydDG/PCa/ct2j/WFAaBhF9stfh+YJaDyLoF2firYmQLCic9qYIqVLKYi3yJvPlt8w8j1INst3e6k1V8myMO2YmWkX4MA3R3vVAn9aEoYBCIV91Cwo3UaK+eZWNlEUKyps2nyL65if0466pmbmGZpjB8LbK6Vt+RBudZTLKJCH6rSnczEZItYRVxBPBCqaQISBJfQ2UNEXxpqeSIKKgWUz08VJphu4JCPOwSKbyydB/a+lxinyN8arkWoBmk6W7o3K3M7CVWRd/yy0Q29KQ/fq+CQ5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R+i59Fh5lKSfd4YnIBjxl2nYe1mjbcI5t9AhZBxHo8I=;
 b=kNV7U7SuQxt6zLRLt3OMwOPiKdyM33gwXStBJPDPZm8BWvcz6K9+wiDexIsgtL6dno/Fw2orRxxCpVIb3SNwT0e9XHshyEVzAojQGsRbjSZrmUi8sFFYp3ZimhzF/6WBqklnj4P1wALXzWKvUnCC+q05jA7EQRhYdDvnx/Q/qM4oTaDOgZ1PypL2sexIwe/LsaiOMH3JZPa9E28H8U52YEpxG+MXXFXJa1KiR84p+POYmhlN3/+HBukGzCPJiGnH8m9G7YZcfyv2aZwdHN+6aAtPAmDOJyRfYxhIB9zy0Lbhaz9nlKDvYrVfr/1+10ewHe6gweNx11JnP3VNsk6R3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB3282.namprd11.prod.outlook.com (2603:10b6:208:6a::32)
 by CH2PR11MB8780.namprd11.prod.outlook.com (2603:10b6:610:284::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Mon, 1 Jun 2026
 17:34:33 +0000
Received: from BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19]) by BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19%4]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 17:34:33 +0000
Date: Mon, 1 Jun 2026 19:34:03 +0200
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
CC: Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, "H. Peter Anvin" <hpa@zytor.com>,
	Christian Ludloff <ludloff@gmail.com>, Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>, <x86@kernel.org>,
	<x86-cpuid@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 013/120] x86/cpu: Use parsed CPUID(0x80000000)
Message-ID: <ah2-WUDXHFfrDLaB@wieczorr-mobl1.localdomain>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-14-darwi@linutronix.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260528153923.403473-14-darwi@linutronix.de>
X-ClientProxiedBy: DUZPR01CA0223.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::10) To BL0PR11MB3282.namprd11.prod.outlook.com
 (2603:10b6:208:6a::32)
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB3282:EE_|CH2PR11MB8780:EE_
X-MS-Office365-Filtering-Correlation-Id: 49242a18-5bf6-4089-0f8c-08dec0040b2b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|3023799007|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: yc59zd0hfTf0npywBz66oxNXLj0MHLYqj9UM5CM4AnrBAg+78f6LSEmeIbUuNNk6/U/xUun46TvDBFiYkxz0/BhRqwUyshkN7ovRwC191i8hwgUtfadgnYOzluiWH5JsUyXqsZ5A9Aqt/c1M5eBInhs85gDHHlpIS8iV+cVAe1DD/hsYgI8Ae4eQI3L7qukzkjaPaP68HmY1rIZdf960QDtyAXAktN8PdMqhkkSv8mALz3gI5BPtMahIV8/sGdmbF38j3WOPXve7OaiLOMLMJVr0E0QBDsmcIeJ3qQeQdKqa0kHcvzUCrLAKe7a/H1E6jivSnknxKlu/n4jQQjDSHv794ky8vOmDLdMsVkEjcjXXkDYl9+BJ3f+PRvTJ6Ih06m7kiYsbey2SUctCkN59vTfKrbTOD82p/daw9PK6NlWme1F/2EWK6bU6bxO3FDXYJP2jmo2OSVU45053zZ+DlYjjpXRSHSwaA21FyFKzFavD4sLWRWgBLlpDTaU/4HJfZauvN9XPlgk8PwVKGbdGMGug3qhuITZXhYfE5jPVaCmikb2GfZhY8yUqqQbtUJOiL5bXiYBw9K3yNwuT69i1jXEhsKgzFzBKRMbrk5jhNbOfaxL+NcXRWp10pAcZfUrOyQwFXVEHo83/EGYf1UlCBYTLyaM4CaIhM7xtyXq2HStfOJlaVOf/BwCoyT+7F6Yn
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3282.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(3023799007)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?n+mAnRALd+7TWc61MYzAu50o/m3H55i4Y7Uhr1gKpBeLb4CdRwSDiNIwlL?=
 =?iso-8859-1?Q?zg7JNvHZ05AFfviH70APNr5KefYAuqZwkWkUjA+RhO8w+Ad/FTkdMOt93Z?=
 =?iso-8859-1?Q?1aadB8IHI0TYcUnjqvnnh3cs8s9WG3IdhRQ1EYEXXjgAM6eECTxlp/d12w?=
 =?iso-8859-1?Q?NTq9jvo7Iea6s4W3ew3wFd0BWgWEzj6JHRkL9WlkUhwiZrD/npvZ6bikS4?=
 =?iso-8859-1?Q?3lcAJaaUkJeuWZMO0v38uE2khtCYnOQvzRj0ro7Mu4IZgdNd6/mX2+nTfa?=
 =?iso-8859-1?Q?jsVhU99pAIXUZQSMOje7BdaiQF5cX9KEpT8/1z3VjiKW3Fb6mrSppAz35a?=
 =?iso-8859-1?Q?2pYRYqRp1cBIVK7yUl2XHkUFDBy8d3iqroWBcSd/530Tix8wMFrhRJqPir?=
 =?iso-8859-1?Q?H09fG5vlPzWqyLSAWoIL/bnxAme3Kz44uJ7aIfDAAQjbbtuGIzWs143T7e?=
 =?iso-8859-1?Q?Z0/v45XL7MJFOXrDAwpxkkUHdT9PluHkDBlHYCn9hdi2XnWoakUjWCV0Fl?=
 =?iso-8859-1?Q?RKgr+gabB1I8PCcbTcIlQRk/8V5hgD1pV0cxbCcxbFsvV72XEQmYNFd2ZO?=
 =?iso-8859-1?Q?TEQ/nf2gex4fzwAfQaN3rAZiutDOfDZRP0qtawZCflltkDzwSPx+r6QK4K?=
 =?iso-8859-1?Q?Z+4PFUd/yelkpeI9CD72iAeiHcv3rDoR1Rvm4NRxSEp/ziUWNnZyIRcV91?=
 =?iso-8859-1?Q?EGuEqtR7ZYS/2l5JdJHtTywdSYUB7ZU7VxQg/a84DTnsOWKT9hFREYSWrX?=
 =?iso-8859-1?Q?UEUcbMcx/u6T21dSHx4bvAp6Nky9uMdWzH6NauEb7I4cZfVAB1veHJWLrp?=
 =?iso-8859-1?Q?Z3n6B2zP+IIj98tCs2HIawk27NQgUlfYr1pp6Xsp2QWoeNIeSf8zNGwJkj?=
 =?iso-8859-1?Q?lsrbGOg7FZ1BqdQd9wLyZjmt5MeSGRxkGskrCEpxdG6ta5QbBV6JBFvveo?=
 =?iso-8859-1?Q?6n3wLq9ptDWHdX0F27r+34zTW3cc7meCvAusdL2l9YAfeMtC2vkUSC18bJ?=
 =?iso-8859-1?Q?+4TMTmrwNSFibVjs8Nxh7TgwmNQDxA8RbwEqmx3gYR7ri7Jb+xugxc4hg3?=
 =?iso-8859-1?Q?v0ccz90X/x13rYQJQX0NEVUJvOmOI7W7zHIaYyxewgeb03AwMBOWCKZhzj?=
 =?iso-8859-1?Q?Qr8OgRlYb3J4iCH7bYB5FW98sKTdVimFOmARnY9UmvoKxBpGK+F40REndy?=
 =?iso-8859-1?Q?Rcfvo4MABCvdLDucHj7ZK5VLZBTke2VCX4H7td9TFXf6C2zEtZ8T6c+kms?=
 =?iso-8859-1?Q?eoTWmOdLz/VwDfBdVihF4HTwHyai5rADaeDNAppQTeC7W4QhMxnanSJYRY?=
 =?iso-8859-1?Q?oLPv4j0OM4ByzUxSAy4B4hNGJvN5YjMtXf9YpIHVamQNGn4tM425b3jqsk?=
 =?iso-8859-1?Q?OAtC/i3Vye/+QhyPeqtYze3+EynRE4W91vn5XaWb8u1/zy4xyNrcl3PNla?=
 =?iso-8859-1?Q?WvRR3doTWLY6/SFdGVyhpSvrJS0BCNg7ufScgwnjsfajgb/hSqCzkE8HvU?=
 =?iso-8859-1?Q?5g8RGhpXX6yieTZAXVJv17j5mfIA5Xnjdi3fqiAB35EcGmn3XatArNAFl4?=
 =?iso-8859-1?Q?kpQ2n6Jd0dy38l5PhK+mHM8mOIY50KrI/1e/bzjohFcoYtLx7UM4fxVUH5?=
 =?iso-8859-1?Q?ve2/i76MGQCbuGmlcWwdIi0lsJUtlga6+4xjI0K7gyoCSP01hzv8b9OrRn?=
 =?iso-8859-1?Q?ANTf/cyZjogBT3qQZSG/9GEdO6JprL9ZAgJKHXvmgi3blWGblnYeAhOiLf?=
 =?iso-8859-1?Q?0CH1DKmLUwcu7LBjSOxl2/fAOIeKy3KUIMg1IDZCYpUnuPj6kBy9TOZbsu?=
 =?iso-8859-1?Q?hPDGtGrQ6OIDFvaLW8yxlpSLKZtbYMwyEABpWGPMtEqoksx7sd9q?=
X-Exchange-RoutingPolicyChecked: GX1w2ulyFwK20wn9sFTOQx3onwkyqhWY+vStqnFUoHKJHxNSL/QHe3gtZaqTlIwM1qNcfqPL4BGEZuP5bmB3Ae8/C6eIy8dq9DcXCpitmN4yC9sV+OyapU0M2iitvM7ifTYiI2/pn9OEQhGOc5q2cVO9hhH6zdhzgPsQOZuuS2VT5JdtfafEqRcNHMiAYfaWq3tEHo68lJg1oF4pliVZgKZw982waRoLA9Kd3fFe4CQicGwwfh+i4cb2cC9TCCMhmd+NrYCi96Taf/m9fydWLZeMt8Lexqbx8xusY8Bwl4tgkX/T8Ob73U/Odvb7VNk8J1hvtV9KOHC4ODijKOGnuQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 49242a18-5bf6-4089-0f8c-08dec0040b2b
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 17:34:33.7822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /rXq/8KPVObWDa9F6GQ2GGrDCR4a3BKYp4Ga7+NANBx4KLdxGKb2F0Hm8515y88geR/tWd4jw+uTPvtO734CqlAe0b/syWP5k1cSR5eZ/KE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8780
X-OriginatorOrg: intel.com

On 2026-05-28 at 17:37:35 +0200, Ahmed S. Darwish wrote:
>At early boot code, use parsed CPUID(0x80000000) instead of invoking a
>direct CPUID query.
>
>The original code has the check:
>
>    extended_cpuid_level = ((eax & 0xffff0000) == 0x80000000) ? eax : 0;
>
>to protect against Intel 32-bit machines without an extended range, where a
>CPUID(0x80000000) query will repeat the output of the max-valid standard
>CPUID leaf output.
>
>A similar check is already done at the CPUID parser's own CPUID(0x80000000)
>read function:
>
>    if (CPUID_RANGE(el0->max_ext_leaf) != CPUID_EXT_START) {
>        // Handle error
>    }
>
>Thus, for the call-site, the parsed CPUID NULL check below:
>
>    el0 = cpuid_leaf(c, 0x80000000);
>    extended_cpuid_level = el0 ? el0->max_ext_leaf : 0;
>
>is sufficient.
>
>Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
>---
> arch/x86/kernel/cpu/common.c | 8 ++------
> 1 file changed, 2 insertions(+), 6 deletions(-)
>
>diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
>index 257808609ef5..9b05a747161f 100644
>--- a/arch/x86/kernel/cpu/common.c
>+++ b/arch/x86/kernel/cpu/common.c
>@@ -1019,6 +1019,7 @@ static void init_speculation_control(struct cpuinfo_x86 *c)
> 
> void get_cpu_cap(struct cpuinfo_x86 *c)
> {
>+	const struct leaf_0x80000000_0 *el0 = cpuid_leaf(c, 0x80000000);

I think at this point in the series 'c' is not initialized if you follow:

microcode_check()
	-> store_cpu_caps()
		-> get_cpu_cap()

I see the 'Route all feature queries to the CPUID tables' patch fixes this but
I'm not sure if this was intentional. As it's not mentioned in the patch message
I thought maybe it wasn't intentional.

-- 
Kind regards
Maciej Wieczór-Retman
