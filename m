Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEB3245020
	for <x86-cpuid@lists.linux.dev>; Wed, 15 Apr 2026 19:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776282344; cv=fail; b=SyeoW+neq/Sj+JP6ie/QXVp+D9FxQFrdBY9UAfJOTTy0OVDDS3gpuD0LNtWgASRJ8mFa0eY36nI4N+UDEO7S5NHmSYdN1OjqM0dj6a7fqLuQVxaQ3OWVZYuKvVCX337Ie1AbtqdGemOLsXZ5kuuErBKqJ46Oy2/rEg9h90IWRAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776282344; c=relaxed/simple;
	bh=bJu5riqqfcN8y9GrjZGKUGv3chcHB9HoXZHCLX3WNSs=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oKJ2etEHsfDu28U87dbsnIEqfz+JPkz/rFGQ0HLZfOQg63QsjkIjzJpR6A1yYq8tSe7/0YfmoZdLRhGCNqIJ0ThAKIYrnK0hmDavqAAfYZEJABqq/WDAeEtT7KrjCVSTaxlyz7I1k3R6XrkcJ3yNdaXPP5VVg9rP+d6yn8Xo3xM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fzQ2bKZg; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fzQ2bKZg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776282341; x=1807818341;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=bJu5riqqfcN8y9GrjZGKUGv3chcHB9HoXZHCLX3WNSs=;
  b=fzQ2bKZgAmtDb/4sbYcxjzAHzXqbenLc3IPpXCOCIq9GHxvf/7MYO/uw
   sIpSXhjCL0tLOzqzbVAHNtWDNjTtLRbnluRHu0pfYCOl/zsLdo6viTJPn
   6uscnaSJW9VoVp4jAq+AmnYjhoDPNOKkSc77LFdvfODEly5qWkFss5YuD
   KQsDAKuVo4WBNOYRUZ0okDbdBKt1453nyJvbl53K4xKPgFJupSMtRNenz
   edyqL0VhURDmxxxobWMB/1S7OJuSy3f6l0LE4UBNWT4GSks+cXt/ugVqX
   TvukCevxtb3XtQyH6m+kfBTB/TZ3cfB3Kzz5GmWNIYU2S+IAJHJFimlJ6
   A==;
X-CSE-ConnectionGUID: r34STvmkRGq3zj4lHGtZAA==
X-CSE-MsgGUID: SLuox3IYT3Seng0bmklcQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="94841750"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="94841750"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 12:45:38 -0700
X-CSE-ConnectionGUID: +7U6qHpQRtaAyhqnPVubzQ==
X-CSE-MsgGUID: mhxbJfziRneRv4pVMoTu2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="230365638"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 12:45:37 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 12:45:37 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 15 Apr 2026 12:45:37 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.41) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 12:45:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y80SN0UjYzHmawbldntU1KnSjcjSo2ZvqvA8xGWdag44B4emrkl5cQM0dCmyJzFB3aYzxQxAWfNVO7KLK32WukSu35CK1Q92UzBHoEKLKbGnQ/ppEPbi6rjDVBa8uUzxLYZtpT/bdLhaoNNfUusVC72t1raFdCAb8ShqDuHZyAyG60eHthLWicFFhAmL1ok+OqS56NsDnJMPn4sq95u8LcGHTnaBrVShGObldLn5r3HkvAG0evL3Y8cAqFWiH7azgWBQhV1YQEvW/AyVJMWkIUbOx4rR6imX0WvmAPxEZ6Qx7x/oQlRnrRxXtU+IiBUkMpZzos7+cc0n43CL/3NZCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8D2qFy6JjZ3zs1uvzdN+Huy1nB1yyew6XGSzStcuszI=;
 b=Bm9TQZN8NVZ4gmVAW6zrxalxVwKGMpwpGksHVqq8QHt+4Zrj/l0jbxIacL4Mw9kMi+dfnjUTEh+eigXeUyVjtXoVM/ZbVFH5v1g1cqIcljMPoZbDLO97iNAT4KFFs5o7REUm4rUAtPNQjIKfTRtQaor2Db5CNWum5Egjt52o4/hT/ndnl9zqcpTTtSrqkeNB702Gm89/i29LI8UZ7p+Fmg69AK5/fpyVlWxrPDvgW5zz4rMDxjPJRxJRpoQESXBH5OTIZn/pzyO8akkCaMF6q0IPQJ9o9TkB8AeHpx5z5kw8EIfWdMnkoNR3rou57k5pX8f75qq/7dGzS7wdi/J9+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB3282.namprd11.prod.outlook.com (2603:10b6:208:6a::32)
 by MW3PR11MB4683.namprd11.prod.outlook.com (2603:10b6:303:5c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 19:45:34 +0000
Received: from BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19]) by BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19%4]) with mapi id 15.20.9818.017; Wed, 15 Apr 2026
 19:45:33 +0000
Date: Wed, 15 Apr 2026 21:45:03 +0200
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
Subject: Re: [PATCH v6 21/90] x86/cpuid: Split parser tables and add
 vendor-qualified parsing
Message-ID: <ad_mwz-EtyAQLLoR@wieczorr-mobl1.localdomain>
References: <20260327021645.555257-1-darwi@linutronix.de>
 <20260327021645.555257-22-darwi@linutronix.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260327021645.555257-22-darwi@linutronix.de>
X-ClientProxiedBy: DUZPR01CA0229.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::26) To BL0PR11MB3282.namprd11.prod.outlook.com
 (2603:10b6:208:6a::32)
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB3282:EE_|MW3PR11MB4683:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d812198-9f7b-4330-db56-08de9b278ee1
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: eHVL+UZp35vZVftPhWzlxg2PLvYYInZoj0f96nkfnvMx6TRnVljKpv30DMJEExgXIuslXK1IxHL6GsV0YJHWnETNNJbmFFlCkjAYB0QT+jR7CcN05GWcHlaAPIS7TdfJcsu6HppDu5aJ4YLV+VVmyS+4N1IylCLtTOdOfDwM/5DT8nhrVAGHnTNwcTbkMaGN0fKSoUpFCsZyCSGboIoRmJ26CXZnw31zUJBbdrYyqygDEGNSATDw/FdzAPS3DtQlMj9u7AoJnzlmoDOynYGU/VHhUn1K8fIo6JsJ67FGqrjRWYr8aTTbc0PF1c4GEWUhWTqEcw0Ew0ebAvYriPf0e0PWDOmlujA4GwzrD7mpbPqrLDyWGoFlrBUXHQoo/nIXqEYIBEL2qV0NV6YyxVvkC+AdZVHwxcXP8eeQXPu+HJgXAI2xrwcx3qc76/w2S+lesNaufOKXnTt2ax0QqCivNYypSEauFj3ieCw0/b9U8JQsXBz6y01qGzFfRUDlkmG4HXtOVQhjdjTComH2jNHNkx24VA8RnvM5RGIJPurA/y/wePbkmLMBAm2KPwh2ldxOylDpXRPz1TBCJhXVfCS9cTKW1dmZ7DTnLUd+rHMw2Qm7cV/66fiBG/H9p9R6811nmE23yOscAqnBvkkZUS3qhtakWJt0K6Xia465adnfrx2aoqZaGExkMNHDH5JEmSlDVeDvmBTYxQUXhpLdRA99xu1gRJy7CUspGJCnhZ7T3gc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3282.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?pN3xqZ76CppRWdRBZK/xGCzpkDBixEQA18D3z7xQe4FYHYzU+LAw6yEqQb?=
 =?iso-8859-1?Q?WiFPxgSDbD1Iwav6d4rXV3xtjz84NvkIh9NYzzU3CGBSF2znkGD+fQll7y?=
 =?iso-8859-1?Q?Ydffh2orfj585lgOmnF/VbjF8v4Wk9HdWbZbGDn50ZRy+H04YPp+k60/T2?=
 =?iso-8859-1?Q?Wg/eiDyMLHR8TRXhzwCHujFhX4Fs62LKPtM+e1MrZTPLUqwlxmDP6txMWI?=
 =?iso-8859-1?Q?WqjS0ivlXV8WLBkAy0ram5D1AiKEECdmwh1FsPtj77JQpcRBGQZlvv/Uoq?=
 =?iso-8859-1?Q?PhsmOF3Fw0E0u0mK5Yk9J3YGCEjyWvsyytoMVUBynqCcQ4HOvx1c+x5XEl?=
 =?iso-8859-1?Q?aQZLjREJy9LH5G6Nq7hEw6U5Gyf+GJ11Nu/s8b6BkztEBtNkiMgiuT7PvX?=
 =?iso-8859-1?Q?xL372sOgTukeQOEgkYgdcBa4C1FQCVnI6VMPEaE2XMO9VAihCtHlZ7npzA?=
 =?iso-8859-1?Q?oYeP8Gtuc1AKz+X8CTOHyTj4/TbuxtbhlX3pogfuVwkbU329dlvn/NvlaG?=
 =?iso-8859-1?Q?VKniCh+hL9h4Ir1p7HC24u2z/wnnrKldrjEqVeaeozDYnDWl/HTNUKEMt5?=
 =?iso-8859-1?Q?KU40DS1j9h0LsLiqqp+pSBBx24B9IMClcX3MX/WQ7Z7HRJr7YHrJt5T/eZ?=
 =?iso-8859-1?Q?FOARKebopmUnMht1TjfULL+dnJQM3h3NCWJrrU+3P4ThgelcIAJYd/PQdH?=
 =?iso-8859-1?Q?G545oGvVSQ5vr3LQNlZSwJE5Q99O44tXuO1wYYEb5GHBq44uBlPOpiE8BJ?=
 =?iso-8859-1?Q?vroxLG7fyGAsHOpiHy54mwLvqmbw6oN3vwqd7QNjiWCf6eBYbEuC0AHZWW?=
 =?iso-8859-1?Q?immNaSmpL9tV13soQ4q85Z5TdpJ6U7I1X8wTJvDEvtv0qIBSE5cQkMqKEX?=
 =?iso-8859-1?Q?yvFRwFMkdFroqWMxQNIskj9pif2KoGPUXZzLl1s4TCMdiKbJWmrFRfeODF?=
 =?iso-8859-1?Q?bHuOgOPbSu0dUFy5DcnStU2dBEASQurjrschkypxcQUgGIreoX6n4++g/g?=
 =?iso-8859-1?Q?SpqRABGq2O4VFhkOq8+e+Hjq1mshDAokQoBIZNemzcnJdSZHtTVnivbL3a?=
 =?iso-8859-1?Q?OZDmGa0IkdK4YhxwLpfxh5KH86oQqxxRe5rNqSO3rS5dKy9bjuOMwnWWW0?=
 =?iso-8859-1?Q?tFwNsX7p0rcrxNVicIsQEmeXYnhGax6znL7/ZK2IxAUvD73Ar7rGgoccD5?=
 =?iso-8859-1?Q?sSSJiEoxgOsoyCwscyYemjwIJbfJag6Hby97pUUUiNFmb4IkGVKeCyuA1H?=
 =?iso-8859-1?Q?56NwU7UhXFArI5lg59kr/KzFPSzd7UfSkvj9pE/TgnHzsetTzJZ9lon4tT?=
 =?iso-8859-1?Q?YWJ5U81PPmhxKKR2V0g5HyMYxfKbvppLCyadzfTU2C8VTvjKjCGDOg762H?=
 =?iso-8859-1?Q?deAp3cc0ArVXQ0UogeyZy1mJETFuxD2D6yY0h2BoIQsFtt9oYj07WHVmK5?=
 =?iso-8859-1?Q?2aEzQRdHiM4lU3jaMa2c7GkEq8335tRY4aufnazZvUvDcQEMNiwqi1D1w6?=
 =?iso-8859-1?Q?cmVPpc0wMCR+4rUTebEpYEra6BUkLjFtvJUZYfdLvT2B3Fanv6WhsJOkhd?=
 =?iso-8859-1?Q?Ea5M99qA0V7hUuTAk++m0MTRAgm3dcbuJMs6fdZ0vFrVVWu0Z2GCoeBw17?=
 =?iso-8859-1?Q?dAZvlS4SfpNi8ScgywH28wEIURenVUx5fxdl/3XowMinEmmY2POH6mRM1S?=
 =?iso-8859-1?Q?wFehg7SWuRAfCHDsZWema6xA3sp4u9Ewg+s03MGzojjjht0VxCf+ADmoR2?=
 =?iso-8859-1?Q?QkFFJ1O63sNAoIo6eamXZyBttm/HBlABWezCY8/ijI2xmui5qAA6OnyUqf?=
 =?iso-8859-1?Q?/w7TzsaRVVIcrTCmp5ZVqiiwB9v7c66Ax51Q6sofXJjx9gRRnFRV?=
X-Exchange-RoutingPolicyChecked: l3PiriR8Z7JDpmX/24mHUiZA+1gpB7N/yFu/zoZJFUcp74vGZ+tMUTcVtXBs1bmD+ZeEWCt+kNMoD+Or9pledpHaH+bSP2rhL+1nKd+WVMIzw8tKCbDXHy8sCME9KDJhGDkMTwrXI7WrKhDWQDaqJvC4lTrRoXETdLlE3eRnJzI7T4xk/ZG4BFtjI8LHaa/u5VV3OBus8HqdLV0ISWzQRdEHhwBw6ul9TulQwnIOkMLgcZj9vB1WXqljDmMzN/JvdW0kt7Ed59nzkxJPMXLDBVvKiolB3lUaN0Iy0WuNNHCs9wMyLY67txWckvw03zmWZAojUAdM4w/NybOk5WFpNw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d812198-9f7b-4330-db56-08de9b278ee1
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 19:45:33.8437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hg5fsMVE6BbrGQ7Yd6VYU6iMhcs12SD45Yibkn5kOPYLbD+bLTsr3lrXTJzg5u/rK2gYK9nWoVbabvKHb5SSzoMBy9ZG10vtje3XcSg1s3I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4683
X-OriginatorOrg: intel.com

On 2026-03-27 at 03:15:35 +0100, Ahmed S. Darwish wrote:
>diff --git a/arch/x86/kernel/cpu/cpuid_parser.h b/arch/x86/kernel/cpu/cpuid_parser.h
>index 3e11e13fa76c..a3f7dcc6c03f 100644
>--- a/arch/x86/kernel/cpu/cpuid_parser.h
>+++ b/arch/x86/kernel/cpu/cpuid_parser.h
>@@ -109,16 +110,63 @@ struct cpuid_parse_entry {
> 	__CPUID_PARSE_ENTRY(_leaf, __cpuid_leaf_first_subleaf(_leaf), n, _reader_fn)
> 
> /*
>- * CPUID parser table:
>+ * CPUID parser tables:
>  */
> 
>-#define CPUID_PARSE_ENTRIES									\
>+/*
>+ * Early-boot CPUID leaves (to be parsed before x86 vendor detection)
>+ *
>+ * These leaves must be parsed at early boot to identify the x86 vendor. The
>+ * parser treats them as universally valid across all vendors.
>+ *
>+ * At early boot, only leaves in this table must be parsed.  For all other
>+ * leaves, the CPUID parser will assume that "boot_cpu_data.x86_vendor" is
>+ * properly set beforehand.
>+ *
>+ * Note: If these entries are to be modified, please adapt the kernel-doc of
>+ * cpuid_scan_cpu_early() accordingly.
>+ */
>+#define CPUID_EARLY_ENTRIES									\
> 	/*			Leaf		Subleaf		Reader function */		\
> 	CPUID_PARSE_ENTRY   (	0x0,		0,		generic			),	\
> 	CPUID_PARSE_ENTRY   (	0x1,		0,		generic			),	\
>+
>+/*
>+ * Common CPUID leaves
>+ *
>+ * These leaves can be parsed once basic x86 vendor detection is in place.
>+ * Further vendor-agnostic leaves, which are not needed at early boot, are also
>+ * listed here.
>+ *
>+ * For vendor-specific leaves, a matching entry must be added to the CPUID leaf
>+ * vendor table later defined.  Leaves which are here, but without a matching
>+ * vendor entry, are treated by the CPUID parser as valid for all x86 vendors.
>+ */
>+#define CPUID_COMMON_ENTRIES									\
>+	/*			Leaf		Subleaf		Reader function */		\
> 	CPUID_PARSE_ENTRY   (	0x80000000,	0,		0x80000000		),	\
> 	CPUID_PARSE_ENTRY   (	0x80000002,	0,		generic			),	\
> 	CPUID_PARSE_ENTRY   (	0x80000003,	0,		generic			),	\
> 	CPUID_PARSE_ENTRY   (	0x80000004,	0,		generic			),	\

Isn't the general kernel coding style to put these multiline defines in curly
brackets? Then they're not needed when assigning the macro to a variable:

	-static const struct cpuid_parse_entry cpuid_parse_entries[] = {
	-	CPUID_PARSE_ENTRIES
	+static const struct cpuid_parse_entry cpuid_early_entries[] = CPUID_EARLY_ENTRIES

...
>+#define CPUID_VENDOR_ENTRY(_leaf, ...)							\
>+	{										\
>+		.leaf		= _leaf,						\
>+		.vendors	= { __VA_ARGS__ },					\
>+		.nvendors	= (sizeof((u8[]){__VA_ARGS__})/sizeof(u8)),		\
>+	}
>+
>+#define CPUID_VENDOR_ENTRIES								\
>+	/*		   Leaf		Vendor list		    */			\
>+
> #endif /* _ARCH_X86_CPUID_PARSER_H */

Same here?

-- 
Kind regards
Maciej Wieczór-Retman
