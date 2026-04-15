Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56F6352C2C
	for <x86-cpuid@lists.linux.dev>; Wed, 15 Apr 2026 16:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776270125; cv=fail; b=b3VcnC0IYfB0H4kKJA3+jqzyUA6GRD5YMZnlJ7fd3S4NmLcq4jc6ZocBshHDL4ya6mCvm8GaZwcMg6TeG8ji2AvBn/uvTOJF5IGF75KgitmIYNL1m4T7xO+PvjpeZ6kRTfbapOXyFkOcOiZITNA6MUf9BLv35G8ZTujg3uTwPzY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776270125; c=relaxed/simple;
	bh=rHZhwBxCHA/7urjguzZUSs3M9eCm5IKK2gKWegURPBE=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pVh/h8t1goahMH0H1lLCQB8uET/+BqYa13D8jZ56jv6c8uzHXhrv0qwZMheSXnA58KaLegC/bK8W7haj+qHjZ/sWdDMMOSHA3Xnc2IfNpbfE3lVCb/2Cx20KBtKXklr/kIHoUV88MlYH+MXHU0Z9yPiEBfauOVhDQ4M1Eac20rw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C9vFUg36; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C9vFUg36"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776270124; x=1807806124;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=rHZhwBxCHA/7urjguzZUSs3M9eCm5IKK2gKWegURPBE=;
  b=C9vFUg36KMWemHlFP6P9ehiQsBqrbfh6qYlj3CmxO5NwCgewj+DKJUzD
   WbucZjoJQIpzbRuIhIofqONPGpgpK3Id8rrwLOAmB7rwwGcSkYHn2qLgw
   11ICsfOBDTr9OxLCDziCGWxUnJaJhyp7yLNrY7ZbrCrgFv0S2TZb/GMsA
   9wiro0MDgMYnOlBgcPBkNrAcFd2sXa5ZrwdYhsv2/H9vRmrDy6wXU7Z0w
   nowzCOJUSIXFdmLX1a5lWFrTvuQFCPX1QOMAIS6OJlZ4rEMfqx6yQkmo1
   Xa1pL2E0ejwI5qW98WVPBKzlkeXUjq9ibC1r/J7+JsErtsqcERBB8vh+J
   A==;
X-CSE-ConnectionGUID: kF8EOVehQKeYzyAME+yW/A==
X-CSE-MsgGUID: 5vCXwUcwT8eahDwwvav28Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="94825715"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="94825715"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 09:22:03 -0700
X-CSE-ConnectionGUID: UPgc5sadT3aGQekoL/NgrA==
X-CSE-MsgGUID: KK9OfC0RRD+Jbi9ofr3tUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="226149739"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 09:22:03 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 09:22:02 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 15 Apr 2026 09:22:02 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.68) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 09:22:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DUeEfVuvvwfWljpnl32uHhIQ7Hb+4PaR7wy9onlC56o+x9+Fl3sV2eMJrO60TsI/B8L43IUomDs4UcpjiZPUV7xmd5DYF7wmIS1K4wDhDtIfo1reHdNqgYVlXOhU0w1gsOPohNjAQoHaoGDsfwnai6sbMVuZO1Nl9bG2bo1rf3swjZe1WTFDfkU3BG4pOLKBKV1TuM32dwDODceLlbBJw04J8g/qgo651fXpZahi02nECni1BTETyNsEJc5mAgdjTpZz4EX9vUF+EOwuGDnznCSYtWTFk2koh3qlaMvgho21Bo45eBS6ghvPuJSRYHcTPIblBU035QK6GbuCVzvyLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/H/I8AvH1JhTTYYNSMdKbtYTIZuPOM3KFJ1ohGl65DU=;
 b=OIIzWh0acc+Sxcxoj4DB1yukcomk1uzJyCH4KlMDzrBkTFQDuLFbyc6NGm+BtB0N+wC1xSlOYBiwObbDFtMEmbay6Q4+F5L7bvkCT/ToifApJ4WWMgV0rCDaCE10JFd0drQd+mbAXLFpiwpqoxXqaWL7EjpemX4lAyqXJ1yD6AA3OxdfkKuRw+i4HVQW2q1xmp8wxlTM2NoGA7+w2pKfM6DDEjvc0FHmQ17LalplS++sBs3/HtYsHLWYnOXQL2x8PU0xtq2rbIgHKyEsnnFwgC174yiQtbMgkvj4RHVpQniq5Gketnkees4Ro2qfuCP/1nXE0dt2ACyWtCQNmsqcfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB3282.namprd11.prod.outlook.com (2603:10b6:208:6a::32)
 by IA1PR11MB7870.namprd11.prod.outlook.com (2603:10b6:208:3f8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Wed, 15 Apr
 2026 16:21:59 +0000
Received: from BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19]) by BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19%4]) with mapi id 15.20.9818.017; Wed, 15 Apr 2026
 16:21:59 +0000
Date: Wed, 15 Apr 2026 18:21:51 +0200
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
CC: Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, "H. Peter Anvin" <hpa@zytor.com>, "Sean
 Christopherson" <seanjc@google.com>, David Woodhouse <dwmw2@infradead.org>,
	Peter Zijlstra <peterz@infradead.org>, Christian Ludloff <ludloff@gmail.com>,
	Sohil Mehta <sohil.mehta@intel.com>, John Ogness <john.ogness@linutronix.de>,
	<x86@kernel.org>, <x86-cpuid@lists.linux.dev>, LKML
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 17/90] x86/cpuid: Parse CPUID(0x80000000)
Message-ID: <ad-6mHH7HaiAP_AD@wieczorr-mobl1.localdomain>
References: <20260327021645.555257-1-darwi@linutronix.de>
 <20260327021645.555257-18-darwi@linutronix.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260327021645.555257-18-darwi@linutronix.de>
X-ClientProxiedBy: DB3PR06CA0033.eurprd06.prod.outlook.com (2603:10a6:8:1::46)
 To BL0PR11MB3282.namprd11.prod.outlook.com (2603:10b6:208:6a::32)
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB3282:EE_|IA1PR11MB7870:EE_
X-MS-Office365-Filtering-Correlation-Id: cef8efb9-c581-46b4-a995-08de9b0b1e64
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: qyf11Y7lbACvlwLZ76GPRp9J5AMLGYi5kPZioMoDX2NNgnFexVuBkMo6C7pmB4JB9GrcFFeA0ieuC/pPK4emlGnlketDPD5J3vYwjSUqT5CKW7oecUhf1cqrVdq3TFc5ke10/SJuTUsTu7elcDe7fEMEgI/hOKCMaJyDRH1h6DW7SBUFUAR4UF9FzLseiT/XUTATOKqP3zuijLMXV/uvWSaWOVMpT3/aN0gbLiM83Gm1uTUA3VUjxNOM6AExS+4VoZ3MkGNfKVbOo3xAbdmEY/FXoRSAhF4MFNxvEiSixB8M4ntu+BPdzyaaR/LcgTdSPARJG+1JOsPWrpomOJgdnBBiMrzk9/n2S5QCeE+tl+yLmL4YLqhOVZee8LpGbWjBHSnSkf82r6cGsJWwnCD9YSqMdjL3OdtzNcDjJtg9Japqwp4Ey3dRv+crPBqIf+i+2im+Mixz0Cqunz53z5O4WKWP4e3RfpKLHx5sYEkhXC5VxXuEaKX2nuyYb+T3wVG2KM1S1pDglL/TzP+AbZxLQoBY767zUGycqJpUx/CBTknHaHGIp8tKqEn1MFqdUGBQkKsgIu7yucwgpXhBo9XZ1ahjE/EfNMx2Q5Sc5Hivf6g4lNLf/ZIOJ7SK+TT5QGIE/7HAga7sTfnHCXUaoeI5Gw3ZcI0n9AF4yWTRjyFGwjy4I9J+bYp/8g+hMLuT/5JJ8/UceckYSvelRByNS5rw317h50FqUH9iZvd1XfB1pLA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3282.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?dbWPfY2vnjfrvk5+RQsw1htX91faWkPfFWU1QWEi0UKKD1O58BdnYtiJwI?=
 =?iso-8859-1?Q?40NBcQUyk0+UxmFGdGEAXGPdMjRFX/FXYR/GwOG8mPA10IdNBPqGiaVbe+?=
 =?iso-8859-1?Q?jfKzbVIaVrscxy7FL2gncBXGBT0ibREUbeXjb4Y8iULDSUEUQoAS+TvHhC?=
 =?iso-8859-1?Q?JvdCfGbn1isKyHzKFTD0UxEI7QTFHZgbdczfJDk/royose5NI/iygRS9iI?=
 =?iso-8859-1?Q?5MqKazsE4cIniP9xQHgg2P606+Dxfu2BZqKyC0FQh7upleBqgjaRDHXAjz?=
 =?iso-8859-1?Q?5XUCqQ7/ztIPlRlMjQaUY7/mx5WlvItSPJZ8Rv+7nBUBofCNEhlzquhiqV?=
 =?iso-8859-1?Q?jl0VZXN39wk5PfZX16EF73M959f3PryN0t31Ozx/x5BxvYZpVWiMALki+M?=
 =?iso-8859-1?Q?daEL5HJ309IafkSmRMHouneSDXyKa4ZnMw7/n8oATfX5w2AdKaf09X7GTs?=
 =?iso-8859-1?Q?XwQm+/hAxuG/mDHC8QModi/cL9C40EVKrVwEWe6j+teMwpyyV1IwsU+dQA?=
 =?iso-8859-1?Q?FLbCoUeu+6TDOy6ec7RX6ZxbRjD9TwDWhqfGBIYmkQAXF72fltr49uZb4o?=
 =?iso-8859-1?Q?C4RKTVAoF7W3eGzpGgM8Bsl2qtwMXa+Zrhwp3nV19NFgIVff6WLIf5V0ga?=
 =?iso-8859-1?Q?n+u+AfSRJeX+W8DHEd7xW0a8HA/Ym2EAChQB8WRSh6AUDjKBUYnJoHqEv0?=
 =?iso-8859-1?Q?oRf15Yafe2WjaDMPC9PnaHMdw2qUValOd59pehUr3XgBx4HQpwG0m0xj+M?=
 =?iso-8859-1?Q?huUDEZh2eX/Z440x5J3QMXoWkp7IPCxUcWrRgKjPBR4j3yEq8D86Y0QLKq?=
 =?iso-8859-1?Q?/bpvkEgszBAhFgsBQ/c+nh3hNdQa/d0TmXj0v2uENXVn15wz/ZEQ+tbSJh?=
 =?iso-8859-1?Q?Y+WfnQocVUieyoumZpVbLPBhtd/XmY+TMXH6R9ZBb+g+ETwPS9mm0tMTgh?=
 =?iso-8859-1?Q?3kb1gx5ZUbYW5Mv3MHcM60LkTJVT7kswaPXbPqc162bVJ5VSdQBDVsamVo?=
 =?iso-8859-1?Q?OCF3Mf26mITKWDVW1WuH7Kjiv6Uu8Z7PfuqlE7DCjcGOHREuy2cvYDkOpG?=
 =?iso-8859-1?Q?wBXCD5ocpPFeL2uf19gnrBHvrFaBUHqIfZuYWAXbfU0JV+bS7Au7JzFFDt?=
 =?iso-8859-1?Q?hD6RDBHRaicOd36DdDbT/AgnR6J3/rkZ9aoNLCmdk5uFn4/sFqm109RrJS?=
 =?iso-8859-1?Q?PAGFobCuh/2mCgVHNYD3EOjMoi+J+Xt7FcJweNWVB78QPJgHraFaFyUFGb?=
 =?iso-8859-1?Q?l0caXStErzdVGzPqFfg4v6njcd0wHEO8LKfEcXxHpOlj5ArSSR1Esp9hUt?=
 =?iso-8859-1?Q?/IeTaGAI4kPUeZsJurARPsFApLTTWE1P05JxFjUpSXmM3sK+npKGeEXsIJ?=
 =?iso-8859-1?Q?plnZSziffEhXPdgGt59Irug+oIBeeV65IKkHb6IXdzV/V6z01EYHYX45WV?=
 =?iso-8859-1?Q?vH3/3q8EOhOm+UWz31RGFCUNkXMhZSW40MEO8a25yidDHyeqttjk3WKAP+?=
 =?iso-8859-1?Q?5llE7XKoRS+2ag5Ak28J6KOCd/HaiDAoESn3QAObi/D9GR6gcOU4vShd/k?=
 =?iso-8859-1?Q?AwxjmJRk/QomnOnUE6oDvBWt4IeeWVdx9es3wN1ueJRI97bYREJZNZ6cNB?=
 =?iso-8859-1?Q?s1Tc3YyyIZQqLxiz+ru+w3aKWIKVFserlmQ5iHUP7EINniazyn2A19qecJ?=
 =?iso-8859-1?Q?yFqXYmhc+3SfDkaAA+R/LEpcHMMgvrDkTOj9ybqNuA+THQfgQ4+jT9dqGy?=
 =?iso-8859-1?Q?dMg/mWqgDQHKaxCVmpoXDNBqkGQz42CPH0d++Jb9nEI8mIHwRp8rnUeNAQ?=
 =?iso-8859-1?Q?F19Z6LYYRPDQ9h3fvQpiM06ylIlWOZd1DIKias65VQiXjj3VwN+X?=
X-Exchange-RoutingPolicyChecked: u+EOu2hX8u7R5bRzAX3d6YkUdDcWjGmf2HxSfOb3KVcq872l7x/okgySTkg9MR1xbnqBOmfGW66Af1o3GIik/qNNdJ/VYU0ydyYgrPAkjOsLrkwzsrbjhSUW+cj84n/TYoF1cqcHQ1yWai+wUcKRS019kIzU6QIZyDWsr8/8UTriascIVlcaW022BY1nw355fUro8nEuKlbMkfs+YJMj1bzRCIHenJO4OTZPEwqVdXF/QMYczTfJaxEECME4+qaQg6rKGTtw6UTY4n4RkVBk4req/r5D7Ij/5nUKCsrn1iW4PWaLG28BTpcBxOvm6yM0WI8TRT/wZRRIQRR1R+ZvfQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: cef8efb9-c581-46b4-a995-08de9b0b1e64
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 16:21:59.5500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x418uinunhn12SaE17D0uCdCfPD9luRVM12CwDoGBRoXHd3vUx77h+BD67lGIrkA8lEZMeeXFKy6UEHETa9l/ZlJRVXbBWW2AefyyiiwFK4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7870
X-OriginatorOrg: intel.com

On 2026-03-27 at 03:15:31 +0100, Ahmed S. Darwish wrote:
>diff --git a/arch/x86/kernel/cpu/cpuid_parser.c b/arch/x86/kernel/cpu/cpuid_parser.c
>index 898b0c441431..2cebe15f75d4 100644
>--- a/arch/x86/kernel/cpu/cpuid_parser.c
>+++ b/arch/x86/kernel/cpu/cpuid_parser.c
>@@ -53,9 +71,11 @@ static const struct cpuid_parse_entry cpuid_parse_entries[] = {
> static unsigned int cpuid_range_max_leaf(const struct cpuid_table *t, unsigned int range)
> {
> 	const struct leaf_0x0_0 *l0 = __cpuid_table_subleaf(t, 0x0, 0);
>+	const struct leaf_0x80000000_0 *el0 = __cpuid_table_subleaf(t, 0x80000000, 0);
> 
> 	switch (range) {
> 	case CPUID_BASE_START:	return l0  ?  l0->max_std_leaf : 0;
>+	case CPUID_EXT_START:	return el0 ? el0->max_ext_leaf : 0;
> 	default:		return 0;
> 	}
> }

If you moved these returns to a new line in patch 09/90 then there is one more
here.

-- 
Kind regards
Maciej Wieczór-Retman
