Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECCE3A7F45
	for <x86-cpuid@lists.linux.dev>; Mon,  1 Jun 2026 13:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780321375; cv=fail; b=Le26jWXPT1lUofS5eSEXetX7aWZm9SIN59bDKhxgIzLMY/HDqFW8HEnugFXbtZNJG+/pVVSQnkabGgw3so3w6/7PinfxjLpYnrGis+YAxNzFe8fb6FXbfeFLqoMLbbJ3mBMm7bkWVrappvoYazAqn2l2rr96K96Wm8s8TozLmsM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780321375; c=relaxed/simple;
	bh=024/jkmhc8VL28bSEGaCT3lfAyOpLWZzKm/GEpbLgjY=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JNJ9LGxbs0vtnvKJu56rimFc34fbVdQogHYzUXD+WO7nQLiqYzXbA1U9ASxB+O+hQghHxhlWZtkQsKs1vNHzrYtgA0dj8vdzJbftPT49R3Oo0xnmhl7olw75VGUpRfL45b4s4SW9p/MLSmCeoyQgvW6s6ngsst5ELdzIupIWfAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NnmLz6Ct; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NnmLz6Ct"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780321375; x=1811857375;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=024/jkmhc8VL28bSEGaCT3lfAyOpLWZzKm/GEpbLgjY=;
  b=NnmLz6CtvYNau0kVlVzsFqfzFEN1ARvOXdAPYiiFXRWUD4VXBfpOB0RA
   VmryXnj9Zc1H70uBV2+mEzrExYIOgUI3tfGJ/aol829mRdF8z7GsBGwiv
   pI610KdeEy7ncGB7ht703zg0vz9sPp0zZ69ua+mcbbwFEu6x1FruPubbv
   NlMJCLgWTCqPQntL9vJ9d/qXxbO+dYiJDL8ylvnkFVxrMJd2BXzhL3inJ
   HDZodvLO7pWMH+nKTCEKFMmgITqbQ2yb7fhc3cGmFBr3TbXAET7QiRZfB
   tWR4+2LM93MPmhsPzbxcfLcLuMBsrt0/vqy/3r2iMkRY56vM+z1lmdg72
   Q==;
X-CSE-ConnectionGUID: 47cUEenyS5OcR0+H3RN5iw==
X-CSE-MsgGUID: ogpfmfr5T5KbUfIWRIOyBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="91650228"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="91650228"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 06:42:54 -0700
X-CSE-ConnectionGUID: BGjVViVaTBC3hL8gxk1lQA==
X-CSE-MsgGUID: TIjwX6ilQaW8l/8UdbMcIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="281698815"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 06:42:53 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 06:42:44 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 1 Jun 2026 06:42:44 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.15)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 06:42:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c9kEevc15iBKSFnwahzFIpchrS5DGhXlPNyZ71kFcij5VtQbdrREXk5wvBxivRtf2xNWyzfOzvf3n517cALBFpD2b/9tS4feVNzOav5k0S4tdEVu4hEsz4tuNENO+Yx8qfqGyDHY8doMdL8AtKvtjYuYJy5CiFno8hZCZ3IgTFj6pn7rL92aAxvzUkXHyh1DaPfhd2qtYj3CEGOPVBtBDzDNY1Ge0GTjGe2aqEv0S7wTPDtIvtsxXuO+bEsdikOj0fiRVddxV0KPblxgyluv88NHkhFXhs2j9NLDXRk4s267MXlqcTZXYV5QqWde3CiH0BJhnSWrR6fEGMEhgWWqiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DSIZZ/KjNJP+SJYgPVkvtU2c3FvGFLddAuHHNzaMIpo=;
 b=FlDkYziRCqMXe7Lj2tb5caHmPJ1ffK1XebSdYTrWlJZFOUVHeOW62r8zqA1/5dr2z5NntIPx87996BOeJzL7dqMIAym3tyz6Rv5pKO1Wv2USeeJgq4gZc2Pfx4IexTUTigeScgfZypZ1eZ7V5P485zkLwnc4Uv1qKuuelWqXrToPCioPnR70CsxHXhmIYhlUbHEmlomrDsNI3Pe65ndYhgX46OCrttNc2WTFh51mRGE9NKsCe4TNSAo7nQvG2IOFCWF0oZjSIiQGyCpUazfJV2XxSYEbtpBEQUv+h1h4lp5/whBf5MNP5re/Owf4DSlWiqKH6mTENSd8b37bTH2sRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB3282.namprd11.prod.outlook.com (2603:10b6:208:6a::32)
 by IA1PR11MB7295.namprd11.prod.outlook.com (2603:10b6:208:428::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 13:42:41 +0000
Received: from BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19]) by BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19%4]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 13:42:41 +0000
Date: Mon, 1 Jun 2026 15:42:34 +0200
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
CC: Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, "H. Peter Anvin" <hpa@zytor.com>,
	Christian Ludloff <ludloff@gmail.com>, Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>, <x86@kernel.org>,
	<x86-cpuid@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 034/120] x86/cacheinfo: Use parsed CPUID(0x8000001d)
Message-ID: <ah2Luj0Qk7WSpl04@wieczorr-mobl1.localdomain>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-35-darwi@linutronix.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260528153923.403473-35-darwi@linutronix.de>
X-ClientProxiedBy: DU7P194CA0024.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:10:553::28) To BL0PR11MB3282.namprd11.prod.outlook.com
 (2603:10b6:208:6a::32)
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB3282:EE_|IA1PR11MB7295:EE_
X-MS-Office365-Filtering-Correlation-Id: bdd3f4de-76f1-4c58-f707-08debfe3a6d6
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: ZcPEAULz2AMHuQgrNfKHIlqRfpSQHwDNkBhkpGykVk6Qrmo4fsAmoLuGe+0/7pCGIuonN4YRXSfXcRx/Ajp0HdZgc7fl9rOoczsoxoVcRUTPlyqZOrZqWbS8SWKPJ3zlvju7uyBM2oJJiwp9yERagt/yJBzGDBYiMM741IDCYTTDkZAXDjw7m1hrGRkMsSc0xyYDzC3NqqZeuZn1XMwJIxU7ashK/xuWhW4gm2iP0pjCfrL7enC03jkog7XM8pPVXjxCTmB9P5XbB2JkHHUFOJqVPMmbZP90GUyiliTum85MHt0RH+BOVOYAi+BCQDVADRvvHzqDt6HWRcPN9rMTXHsv5zVOHRmXcuruSf6q8nIyhu/gKwQIyyvueoMnweeMzfLcRPYTz3atPh99uo3B4B62aMSGZIS+p89CB22T0T5eS4yEEFzuRY2jde5k9bWptS/e2ZTIwDyJIrjFObnx4VKxsJugbkkPHUOqnqta1QpBYk/n2RVySI/pjDrauFHkSVVTB/z/7POeS3uwr1d2KAY+vDgFsFqsvzaCjlyHSA0xrwu1Pqu9OYOqkgQQmnQS+iPnFJ6eTpnJnrVaYH+YKAfo8TXXuJ2gKR3xSFasr9HvwY4VTqJBB79JKVUZCYgqBdljUJHHJRz61CfpG7XjiYBVdYTogXC/gzgvOPJ0zRPcdBj//4DK34NZpdCtQCXq
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3282.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?FnMiGtI/4F/LmuI35fOpE8HUkSMnrMjHltVoQLuB/D4EyFLxGsrioJFg3L?=
 =?iso-8859-1?Q?+jugQSGwodGD/ABoUE3QwVykMX3qjQvqW2dz/N781QjyQB64fNz8N/XH7r?=
 =?iso-8859-1?Q?X9Y84mZO10KCFPunXdi4r5j2Zm6/PXvxZdTZRXOwhIpsa7oN9KMvcigrVo?=
 =?iso-8859-1?Q?gbR25C9XKba885FFvjem2mVTTAKEPL8jro4A4ksP71objXXJ2wKcjc5/fO?=
 =?iso-8859-1?Q?D5WZAzDDDx6DTGe3P2MdpHNPujoZrrqlRjTiBCXSrURGnYRNrmpqjcfqkK?=
 =?iso-8859-1?Q?l76l1Ebr+KhGinLcSJLV6UpyA5T5UtzPgFycH+wTquMAM/H7NoAsOaUa6W?=
 =?iso-8859-1?Q?i4jWnydOC+ilHhFvD7cNFlVZFSHKEzTD+2K/7pMKaib/Nz0FHjolkQwp6W?=
 =?iso-8859-1?Q?DDwLZ6WcgnGM6nV+Y8/P+N0KC8V+VW4xW7vAUH4CFk828H87dgjOU79Sxb?=
 =?iso-8859-1?Q?IlZHLQ8rT8YPZ23F7h/ennpOJWcNpWFWIQVtBcpZptpjnfOOseAZ5jLyKq?=
 =?iso-8859-1?Q?pdWWBDfho47AThV0C1cJPBtVSAsUzhq7Sl1oecqpAsMRbkYHt5HFPDSSVB?=
 =?iso-8859-1?Q?lD+ckkcSQmcxqhnGDEwSPNSOsPlpIrC4rcqAya+e4NA79IZvbaisOnCwFu?=
 =?iso-8859-1?Q?CN6L0Ku4SxXiuRaYycmRwKUbpJ9W9X/oi/OQyFateK5p6mZFJ+dahaarHL?=
 =?iso-8859-1?Q?61VVnHcB2mDTZm6xkE6tq+Fl1WCDu95eydYC6R432r9ZZcfLJgm7UjM/Ap?=
 =?iso-8859-1?Q?0KzkGmVqyRiLmuScvgh4whjNKce1GOeU8ZUiH697YOUPYzjjK1F5muJ0pW?=
 =?iso-8859-1?Q?pC+VpjnnejpkdO0GN16dWLRKespTHC9YFy+mXckcHa8097D4jogUj9tJLR?=
 =?iso-8859-1?Q?Kuu4p9t9iuXdQR8MYFOAtp7LAB9rPn0J01CEwxG3xWBUxyoLIjI7kR+ng7?=
 =?iso-8859-1?Q?L1Q9OR1VLBWn7Z5yxnbqwDsMNj6RI4A3kugJ3X0UdG0wQhtFsRk08J09eG?=
 =?iso-8859-1?Q?dvTUq3tlLY3z/rwX7KUX/eJeGtrwZnElFEoe/YBop8vajfDBsxhaBRb2Y/?=
 =?iso-8859-1?Q?wrzI5As3ZyZjtEhM4Tc7OozhYrH+xwRD0keTw3Rl7LgzYA6JRyCiZy1szd?=
 =?iso-8859-1?Q?HG27eShIYSymDgy5NaQNP0kDZUPbEzIyuVETNnTr0I4AhoCfYvzMdLpxL9?=
 =?iso-8859-1?Q?kKk2GfHin+wXrAMoxTooaXO/N3Qdw3iMgkc0bkIpKHA+gkXF7toxw/Zpd3?=
 =?iso-8859-1?Q?Z9ZvCsiDdoGCTCC388c8O/R4Oz8BhvbRAo8OKhnFVouF/X7KvG2Oz7daFl?=
 =?iso-8859-1?Q?jdU9BmdujPUBfgDJ3zmtoD2i1jYyLNl0tBs1tXBDqu/jst3YxPO38L9sXf?=
 =?iso-8859-1?Q?aLi+AC0vdk1ab3Y/t8Bdel4h6WJM94v/hRsAf3A5bTwhiCeM0LOWlpm3mX?=
 =?iso-8859-1?Q?k86mZVOTVUQN8q8+4G8RvI+zjcRBZpIfx7A7EV6OWMaPHwQXmsCxWUrtn1?=
 =?iso-8859-1?Q?zORLeqYx7dQXllEN+SblCjCCq+CkPtJ2XjgNRUZBTI/l44hSiacIlHyXRz?=
 =?iso-8859-1?Q?VMUdxerW5BIGNQpR7WYpQ+jByYdChhhb7LY1cfk5U6i3yNLdMW8slP62TU?=
 =?iso-8859-1?Q?C2x8E7K8X3p1XhneM4uMNwmJVAuYESYZyYQe+RWEItZyvKVKhylXTgN6T3?=
 =?iso-8859-1?Q?heoPXuX14aSg/zfImzrOOpTAwVEh22s4LTcmBoWqGrbwg3gxZTLbVnp+1h?=
 =?iso-8859-1?Q?cHx+NEAaxxGT2Sqa4IlecQnXeLax2LcgxNKyaW23IgNxpT9Gcu3lC85jVO?=
 =?iso-8859-1?Q?+GSWxQA5rlZ0MZNJZEGjv25PdgPvNYUqAFtMQWRZqP/IWa20gXV+?=
X-Exchange-RoutingPolicyChecked: mgP0nwwu84d8quWm6PylozFXWQNOozzg+MfVXpJoMICMdyWdt9eKuzonLhpr5MYeLIbs3bQ5jnUI37ajNc5nmgh86ZwGKTpqplTBesRyDqlPI3We3spQ1V2KCR/RoF/lxpkPGiJo4l1qmCPJlxYgn3QsxSYSorGkJRxJ9Bo0yC9cPmDSRFb+8aHwN6F65r4vEl9vvC/ieSdjvBVYpLL1evlOGNt4e7P5tB6c9fb7lssHxkJDtvdbtvpsjAxU4ExmSqq3PQqkzeJPMU8bBraNc0De+GkIR5WNgTHIp6T8/pWrbxIOcF+KEcg72McmvuKCKsBtgKR7BNzrNEQb7vc0lQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: bdd3f4de-76f1-4c58-f707-08debfe3a6d6
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 13:42:41.3243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3JLxWI4HuNeR0OMki8nreo1y71keNuHWlTk0smKv6qF595Md1Xa3AHyYGQQ+DBxTkomwvaFUdI+eO58JathAKP2p2Bairh90UCmi7BE9UM4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7295
X-OriginatorOrg: intel.com

On 2026-05-28 at 17:37:56 +0200, Ahmed S. Darwish wrote:
>diff --git a/arch/x86/kernel/cpu/cacheinfo.c b/arch/x86/kernel/cpu/cacheinfo.c
>index 91020f85c000..86a8e1dad935 100644
>--- a/arch/x86/kernel/cpu/cacheinfo.c
>+++ b/arch/x86/kernel/cpu/cacheinfo.c
>@@ -237,16 +237,22 @@ static int cpuid4_info_fill_done(struct _cpuid4_info *id4, union _cpuid4_leaf_ea
> 	return 0;
> }
> 
>-static int amd_fill_cpuid4_info(int index, struct _cpuid4_info *id4)
>+static int amd_fill_cpuid4_info(struct cpuinfo_x86 *c, int index, struct _cpuid4_info *id4)
> {
> 	union _cpuid4_leaf_eax eax;
> 	union _cpuid4_leaf_ebx ebx;
> 	union _cpuid4_leaf_ecx ecx;
>-	u32 ignored;
> 
>-	if (boot_cpu_has(X86_FEATURE_TOPOEXT) || boot_cpu_data.x86_vendor == X86_VENDOR_HYGON)
>-		cpuid_count(0x8000001d, index, &eax.full, &ebx.full, &ecx.full, &ignored);
>-	else
>+	if (boot_cpu_has(X86_FEATURE_TOPOEXT) || boot_cpu_data.x86_vendor == X86_VENDOR_HYGON) {
>+		const struct cpuid_regs *regs = cpuid_subleaf_n_raw(c, 0x8000001d, index);
>+
>+		if (!regs)
>+			return -EIO;
>+
>+		eax.full = regs->eax;
>+		ebx.full = regs->ebx;
>+		ecx.full = regs->ecx;
>+	} else
> 		legacy_amd_cpuid4(index, &eax, &ebx, &ecx);

This 'else' branch still needs the curly brackets per formatting standards.

-- 
Kind regards
Maciej Wieczór-Retman
