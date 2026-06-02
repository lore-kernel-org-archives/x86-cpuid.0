Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4BB25B080
	for <x86-cpuid@lists.linux.dev>; Tue,  2 Jun 2026 18:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780424125; cv=fail; b=u2pc9fFnyrKjcpGpneq6x8JIjaiBXJ8gh0M0TRDFrUvqEfYTwisdf6xP4gnrXt+dGbzZ69zqXFI1CCC///WolKgovGQ2Bhbu5pmVEZPgAuPCV3OXvXzY4JdiVQ7YNfeG8igsjH7gi917qR/6wl1lAfhunhNx7BbS22+6Zc0xsUk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780424125; c=relaxed/simple;
	bh=6K5cixA4mGtqon8FyVGVCG9bpk7FWbssKxXDsfn/Zdk=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DzfbMBk8eQuhnUumUUMC+4bjK6jK30Rf+AhQTgWte7TLug7/2itf4AGgiGXsLt4HmUqmYIE7MJPLZHE1xhzShOb8VWeXkcgLxj+Q+sSBOZcOEM68H9F2a8zZB5SUabf7jHV52X3KAlPV0EoBxxaANeLkrI6e+s23txqd6Wt055U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dWLBWdpo; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dWLBWdpo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780424123; x=1811960123;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=6K5cixA4mGtqon8FyVGVCG9bpk7FWbssKxXDsfn/Zdk=;
  b=dWLBWdpoGHRmTwED7tG3ganAnC9AiEfVXSvfk1ey7x9VlfUHlj6iDzEf
   DAsWrLiNdnaWEJSuKQELyV2W0yixW14zbClBIiUvCrn+e/85EH/yemJmw
   jXgB/4ss2QpC+rGiQWCf277KXN8RRVH5GGF+0cv45TDDZ6ABwSCsH+efD
   pWAB2iPVaF/TrYas/CDWQIyLksTH1JHc5aDJQ8Gbq8RVrOQCAeMsaALCp
   NamG5edtu9a+sWPvLpk7PpyhF3sYR6DInwcNfGpiVoFuCHqVXpzoHwVDI
   x9SNLcSuPaNsINS2j9oQdpak3zK8NzBEnj3PNuJYgf0airjB3ul/SP6iN
   g==;
X-CSE-ConnectionGUID: LL0e7omPSGC0XZd0WT0DUw==
X-CSE-MsgGUID: YbDQQbsyRJiU9w3LQjsSWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81192506"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="81192506"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 11:15:23 -0700
X-CSE-ConnectionGUID: ETv2QqbgSoWGpy5pdAJjMQ==
X-CSE-MsgGUID: HE1Ted0jQies8lpAO2bz/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="248273410"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 11:15:23 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 2 Jun 2026 11:15:22 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 2 Jun 2026 11:15:22 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.16) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 2 Jun 2026 11:15:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BPAgwSC7xoudV59ZLbAjFoRVKk/VcHs8XVETB4HXzeeYvMn1jcjY2+n0/x4kqUrd0uRKWd8DZojp9z9WnbGesCFuE0F6KxnANICvlvxpQfGSZcgrpIHYeVg+wLS7uQIkjsyS0BVjAvZtrwROnHQVGScKnziAHx+YjQyqVH9CKeD380VQzTnzi4xvfSwQ17h+um7MpV2wxuFgOUf3+iO/D7VcYzfinJ/Op0eIb3IIK9eCmqlosmMMqrQf6ADrpXgaqRbWOCzCbrpjuLEzqCNt9JJht4LZObQyKYkCEgct73A/1avVnKaqs3nc44eIaCF/vhn+2Qy4nkej9c3mA7DB3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U35kIv+5r6X8OMU0vV47rjMs4kOhM9FAqsKOKiEDJI0=;
 b=kO8K9URKkVBVRQUOFrbd8XTYIX3mBE+YrecsSi4G8kvWEY11Jniy7QdFc5Sz1ZZWZNdXz6HiaWthVSUkX2mSFqW6qvE7hL29D49fvp5Oi9jhtxFC24ufcWv9KBUtU8CvuwRBseerR9TsvV4+gaCwFFnZmf8lVucuQ8lhEz9qvu0lLaIUoisva/ung1ecgCHLk7gfsn0YcpB3Fm+Vyi9FebWT/evDjY2pRxtb9NY21c6Ao/ZwUcQLi9oJUVBx+y0tDUgrQlVaUiu7umsfqGzdFZiy7eSRvxK3uKvfKDUfWjh+Pwbd3MISQ+A7rprUeRru91VMMG9S5kBLR+1DkmuL4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB3282.namprd11.prod.outlook.com (2603:10b6:208:6a::32)
 by DS0PR11MB8231.namprd11.prod.outlook.com (2603:10b6:8:15c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 18:15:20 +0000
Received: from BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19]) by BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19%4]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 18:15:19 +0000
Date: Tue, 2 Jun 2026 20:15:13 +0200
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
Message-ID: <ah8dd81tBtIZQ66i@wieczorr-mobl1.localdomain>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-5-darwi@linutronix.de>
 <ah2WBnBkz8KQrph0@wieczorr-mobl1.localdomain>
 <20260601194150.GDah3gfjoIZIByCa3d@fat_crate.local>
 <ah3jPMYIxC1vsUUB@lx-t490>
 <20260601203452.GAah3s7FevsRDFT7rF@fat_crate.local>
 <ah34pi6j5HSMJdrL@lx-t490>
 <20260601225306.GDah4NUvJwaqQem4VQ@fat_crate.local>
 <ah7_wPJ8_FGLOwZd@wieczorr-mobl1.localdomain>
 <20260602174746.GJah8XQvEJo9UKru1l@fat_crate.local>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260602174746.GJah8XQvEJo9UKru1l@fat_crate.local>
X-ClientProxiedBy: DUZPR01CA0014.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::7) To BL0PR11MB3282.namprd11.prod.outlook.com
 (2603:10b6:208:6a::32)
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB3282:EE_|DS0PR11MB8231:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c2ae979-4bd6-4066-bcec-08dec0d2e7c3
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: pxR1lPVL0C1ZZSuDyFLwngrzQe21y7d0bMeptg8RWCc6So/pNxO16hpvQToNNJNi7kVGeYgeH/bsCOJ+ZtNAyl8XI9kuTNZjdlA3EVPzgVvbEexkuNBTf/5RQNYOawch5oQlO7rSyXPLgQLeacLXD6oFZRWTiBQAYTKS30IimSsDayoWKRwTXUSEe7lM3OLBbOsROVqwtiEVw9vIoC77j2L47xa57zPNbJvF9pBu2+rjD6Mz+3lU94ULQWMPyM4YMaGACyT1NnfE8+RTNttt4Qo7xBYOLZYY/KOutnlkZH+Ea+gGUQIEFAlTbwFh/soW+/htQM20iJE8Jb+9SrzaYV+YWT9Hm4cv79HWqjmhTKFfBsqLGE1v0AVeV+Q5ZX2rV+PqcuMHcihtcy9VZ+o1ZWDPSVtaLGU86JyOB6o1Brsnqd3UoDmYOEgAWukyYW1mtCUakhKeRtfI1xyP1HuurJeYmTJ44VEgb83SF5Hn/tmACR4lzqo76DLhaI71/rpiANRUt+E6pdrGUCPVwB+vid8DfiNngc5jTNrdipnECqkbnipbtwbWYJvKK34I1+Q701wiSo7jtW5C+btAZg7JJ6X4shC68Zlds9MB2fitkRGZbXevH9XKdowPjSHNMsNRTImGm1smJ09FN4zhOdbl0qhvaAjtvOtVXwlmnoLoaMWlwMdmHh3f22hPEsgdUeM0
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3282.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?tv5+tSo3z4nvFz93nmOA1MbSR6QY+W9Z/eI6Bgf2tzjOJ9IQavotsHtreO?=
 =?iso-8859-1?Q?ns3BnSv1Xj72dgiiTGYNy4g19KEcx7bAP9fHDbaw6b5KnXMipvJF5oCYlr?=
 =?iso-8859-1?Q?9GtsM1u5gWMcOXWVrQ8yn5np5c+Okza/+j1UGosS+uPJcL3PZA9M5qeCcv?=
 =?iso-8859-1?Q?WO2Phj5LbirIVXC92a84d0URBta4LfpCk9LSTRVfNQa8348yW0TNtv0Uha?=
 =?iso-8859-1?Q?CGmSd3E+z+dL1kiUdi5fLrVbS/fYRkv9pB5x+mKaBq+sQ9NLrKE/cg3+J1?=
 =?iso-8859-1?Q?n4xsGziv9wX/MalxAK8diawBD0G1GpH2UsowYfT7RIv2nXQdmfGKj2bijQ?=
 =?iso-8859-1?Q?08+Gf0g3MIsoyTZaKF71L+CknTkQYs/ltUS48QirUctSwhsWZUEPr6hFQs?=
 =?iso-8859-1?Q?wWdhDxMSdzuz6joFysykytOeIVdVJtzfrV07fGXC5KmPdcTZRuR7jSZ7gC?=
 =?iso-8859-1?Q?+ptgqY2kmWqs71yqO9UNu1cKJHYjCxZLXqRdoLtE3pGdXU9fyyvJOVARPj?=
 =?iso-8859-1?Q?snwe3bNl3fQ8A7rt18BLiar9YCRNeo/+8bnTtDR8ylHWJRrs4qq7IXJWPj?=
 =?iso-8859-1?Q?F8RFbMVqmdFno1FUI9Izbt2vHTW9JRclEdNJDFXlRYB2T95HUQciuaqOPM?=
 =?iso-8859-1?Q?Uo9HI/PnHXhA2LYurV4FN4gcxMymUPrTDnij53e/6zhNUCq2P9hSx7WKBl?=
 =?iso-8859-1?Q?kTuvdgvk3TNnoEu0J69IyTAfHRzL8Xc2erjoAHgci0despjguIAJG3Vgtb?=
 =?iso-8859-1?Q?8UIJIg5mOtxW/CaxHBufnGkc/RLc60k8gwsNrhNRdnEVmOfk5KXhMYW/BD?=
 =?iso-8859-1?Q?rEB3xJWqbiheSbhI+dyv5f5LhcSQoDXkeMON/3Z2MAVzWp1Zy/cC9ZXac6?=
 =?iso-8859-1?Q?Gsru8Pa/TUb/ns0UF7W/V1JZMTS1YIz1y5LGUGxQbvKluSKTQo4fNmLPq0?=
 =?iso-8859-1?Q?h6svn2riTLfE5rNL7UPG1A9lfxQMaJRvdigsGXMiwIPvs12PMPRly0sG6m?=
 =?iso-8859-1?Q?OqUrxjPgEo2rtIkDHY4JZ1uliW4A5dPqztyLnVKNwMbEIZFXlPk2X5RRdA?=
 =?iso-8859-1?Q?5TPxtWwLWyKnrA7XNh6CYVa3WZNIGg6R8qpkOk5W8z6crd4twmWzBGNWRS?=
 =?iso-8859-1?Q?8WQmRcnVtA/jqYF1HYrMxWYVZyqXFqtR0vu4BD7/gbfMotc0xOHpolzVnZ?=
 =?iso-8859-1?Q?DVL1JTBSDY5fr5BGyJ1a3jweZ58yCPYJRgas4oE/90EJdJb8o729Jf3PQ2?=
 =?iso-8859-1?Q?0mnbBkKNY8jIv9jGVzpWPyY1rGRdQX5WDGi8f+59D9FdIAgb9X3ScExP1R?=
 =?iso-8859-1?Q?J/u79aReGr8eRDwUs5GNGpoG1flehW7HIS4U0B5O98bK5JxpEvr6mwYqXX?=
 =?iso-8859-1?Q?bRxuB8X9fVIO+1yH8Lbzqt4wbvaKfxWOZMiSQeB9kOzLqRbE0x9cAIBkW3?=
 =?iso-8859-1?Q?M1j5aem6lFjE1LZXhKH3xHl4rN/P7mLkKAxolsxQq2xaijWSy5Xt8lWM6/?=
 =?iso-8859-1?Q?wz+98zcys+3ADIeF5eXVAww+KppEJhclSuC0fvu1QTE9N8RsudgJLUN0CL?=
 =?iso-8859-1?Q?OrMQQc5/XJKqTPVFnkdsNwQrHK30h3eH3x4HxUFVbxlg0QkY6gu4Pl99YL?=
 =?iso-8859-1?Q?++PJ9ztX5N6ihX9ZNh2RdP3dxWILw5KhF/8rM1P35jWXymCC6grqxnLkzC?=
 =?iso-8859-1?Q?gEFi6N4AhdYmgfu5FG/OMYcxvQqTcDQKyn8ZHjkLXujXlIyinJYvPbOzj/?=
 =?iso-8859-1?Q?p7T+TurRnsohAgRK/ah91e7MQ4Fc47cYTA8CcGYTYTGgddMoC6zRZjkPte?=
 =?iso-8859-1?Q?Kv4pBip/B1eR9I52lWeEPTxb3mN9L0guVwSPv8offUaFMi/ZhWva?=
X-Exchange-RoutingPolicyChecked: SNPEBN8PlQb+Hk5ktKimvjl1GctcVoyNnF1i08GvYdN6rly6jUxTy9xVZf00zm/9LQfDkdL0Kn9ASOW5FlxqkLCNWNQiERLzkWqXiXlumuObQPEib43orZbNqmxVWiqiLSm/5OzOwPbnTQOz8I1dWZo8LXHeExc7PqHoo0HBilWGDqfAXtEYRIzhaSUTmnqbg61WnYRYw5+aPw4gCjQjIXcunnLbi68yIkHNzg4P4vW9DjQpZoVS1lWXt2+9A/6dwt9uTFaavRwjlAiKXcdpYE8eGKzQ9DEkP5sxSioHF/nlXW31wI6PxcKSRSraz/nEUIPtlEcPI5rA60bnzumbQw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c2ae979-4bd6-4066-bcec-08dec0d2e7c3
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 18:15:19.8743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eYPSWnj3CQW8Xx1HzPLpGi9vjfVVIFvKDDTsbwxLlPi3wUei3N2wKTvmRRXOz9eGR5A/HSXymcy30nqlIYwQckZYaCat7q3RUqmFu9z4bgo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8231
X-OriginatorOrg: intel.com

On 2026-06-02 at 10:47:46 -0700, Borislav Petkov wrote:
>On Tue, Jun 02, 2026 at 06:12:47PM +0200, Maciej Wieczor-Retman wrote:
>> In that case I'll send the patch only to x86-cpuid-db.
>
>Well, I think it would be best if in such cases we do both: send it against
>x86-cpuid-db and then generate the kernel patch from it. So that we don't lose
>time.
>
>I wouldn't want for 7.2 to release with those typos in a user-visible header.
>I mean, there's time until 7.2 releases but it would be good to send a fixed
>and complete pull request to Linus already in 2-3 weeks time.
>
>Thx.
>
>-- 
>Regards/Gruss,
>    Boris.
>
>https://people.kernel.org/tglx/notes-about-netiquette
>

Okay, I already sent the cpuid-db patch. I'll go generate the kernel patch too
in a second.

-- 
Kind regards
Maciej Wieczór-Retman
