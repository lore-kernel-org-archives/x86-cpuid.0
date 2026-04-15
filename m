Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B1C2C15AA
	for <x86-cpuid@lists.linux.dev>; Wed, 15 Apr 2026 12:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776256704; cv=fail; b=hpKJAtximBPipk0DvDALOwTWnFGT4oTHyBnB1ZkMWw3Vn6YsTvAnUqmPTlAf7IS2wcL9GybMwtMFb2jioC6FyRbBUAGT7Q1cXRH6duOz4bydkMlpEz+XaatZbajF2B5tuhLhHTmkKKKcjCGfdWuq8t/H66dzL53NSsxYImlQgpo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776256704; c=relaxed/simple;
	bh=t7f4Rn0sfnnUm7nmLvfqcGUyVqRcQuOOxqSnTJZ5SA0=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VhudMgloMIZnTyrPH9qGC6TSYmrBSYaFnEm4qzi5VDzfp1uWP+LRmQQo2uNpOVZIj392w9Rqh+tzIk9sJFIoEjjr51X+WpUyAxVl3gWcc6Z7ve45l2IrUFl+8fmZ47mnaD1aTlV8WFIHoIGwSMXq9SF5P5BSDidgh7hJ02Ul1Ws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JD4r5yig; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JD4r5yig"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776256703; x=1807792703;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=t7f4Rn0sfnnUm7nmLvfqcGUyVqRcQuOOxqSnTJZ5SA0=;
  b=JD4r5yigjWcBzev0Tfq7+ArKSFeocZf3Q9HqvFvNCvODmxs6acZnyffG
   //UcmqRnWInv+yS0qISAzFDW0OsPH7K+3xRqPMk/DWB5bvrJ+YvVCjNx6
   UZhtVcJbF7CtcIYFWyNV7+CbInTNRoDFYO4vpRJVou/FnLZf6yEXZw1TW
   s4Wc2BktjABHgM/pb4BcjIcxojesi9NqquSCCTAJ1vgMl9CuQnoIX8q6E
   XPPwWp87aD3WiBIPYt0B98fccjFBQE6kCYYR7y8GbevNujae2xUzlVeFM
   +hzMZZsbWN1khWFV/b0k60BQ6NIKM/ya18S7jNCx+qUN2889KyDHKq4wF
   Q==;
X-CSE-ConnectionGUID: lHaarw4+RLajYAs264aNOA==
X-CSE-MsgGUID: FrLJ/2FqQgGYEF9PMt4oZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="99873043"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="99873043"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 05:37:06 -0700
X-CSE-ConnectionGUID: 6zp4km8yRn6KwaHLwIT/zQ==
X-CSE-MsgGUID: srwbNwzpTciuieKnTiEGzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="260835480"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 05:37:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 05:37:05 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 15 Apr 2026 05:37:05 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.57) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 05:37:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fm4Fc4ZwY/8e67dtKW85q+hwWAxY+BW7Czg73XH+PYcOFeEXiJgjDYdkwYioBVQbb2EL/nXKTVtK/lJPPp/g+9go6CxvBv0Z3N8t3AdQroWawfyJPzm/0Kgz+Gp8VrCnoomu2OZWA2HmU0aOKKHTtVYS7rUj4y435bW+M1JVmgQFmhTTyWZkNc+thK/jb8cPTAIt+8z+36PMMx3yEmmknUqRibIdBrlePSK5HMLLPhIktXEpU4flwBAKVgcrM5t4vlkWMTh/2iltoq6zvobOmAQDh7FMzod//noGP/ApccZzV9gKIKRzSu0TtOqH0M5PMYceBY7pp9gT6575P/1x+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/nxgmOaJb+AWjMmTeQK1Uld4+rC7AyvyA3PhAFEzPk=;
 b=EZJJDALKbdh8RjuLD2RKliaIi7t8FMYql9/uV4ptUDKrZamPwXh/LATAIOt7V8kiTNICbR5yq7s1oR10aDsG7q2lYejECVCEGny+gRssWILOfPHnZJe9Vejk/m8+6m2Nb8IYL/geSRjGIbHukHhYbkaRn6ivQz6rPS7S+DTbHofHAwJbODZ95N1LX0Il4/EJQCGRGNdV3v+WWddYNeGBP0MCLLQzrvMnvLXtI9pW0kJKQBaMLZadAOkNQk4peuIH1ZkTm/XCOVeQu7EXNKyL2cZuFEQw5nc5FbFpz8QGPadXCrvh3ELfg/Or8I6O3eXL70hs3g0H8q+rBm0rUF+9FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB3282.namprd11.prod.outlook.com (2603:10b6:208:6a::32)
 by LV8PR11MB8772.namprd11.prod.outlook.com (2603:10b6:408:200::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Wed, 15 Apr
 2026 12:37:02 +0000
Received: from BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19]) by BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19%4]) with mapi id 15.20.9818.017; Wed, 15 Apr 2026
 12:37:02 +0000
Date: Wed, 15 Apr 2026 14:36:34 +0200
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
Subject: Re: [PATCH v6 13/90] x86/cpu/intel: Rescan CPUID table after leaf
 unlock
Message-ID: <ad-CVzsotZC5mR4K@wieczorr-mobl1.localdomain>
References: <20260327021645.555257-1-darwi@linutronix.de>
 <20260327021645.555257-14-darwi@linutronix.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260327021645.555257-14-darwi@linutronix.de>
X-ClientProxiedBy: DB3PR08CA0022.eurprd08.prod.outlook.com (2603:10a6:8::35)
 To BL0PR11MB3282.namprd11.prod.outlook.com (2603:10b6:208:6a::32)
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB3282:EE_|LV8PR11MB8772:EE_
X-MS-Office365-Filtering-Correlation-Id: 4461a93d-95c0-479b-34e9-08de9aebb184
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: fV6m4dYQx0tOyqmmKMujt6bXpriMtxFJH7IbUBWkejXKaCrSIzP+DQsyk5I06zaxbYFNyS4h8cLkMlBpWYdBcD5OBpvvfBsxQSApX7lpI50tKpkEwzc4mPqoIwD+dGAUfe8ldOkYy+M+QWnRdRNv3ktHW82cFi7/BAz2HQDt+IxtAz3EYdElapSk8qyJTVWSKL9Q6E+PjOcJiRRJR/SsbYfNA6oE4fIoYaTCjFqp0A2Q/Iex+hEgpDbT4+2PscmNvfCXYYu3wi2fUPyI+jk3l/wld+t5w0DX1HkW6k5/M17srfehp3xNjoT5lx2SJCVJ8+NN26AyxYq3Hxe+VmtYpXYzcbORvnF3YZxl2Qpd6vZULc8xWL2eOBzkdo2XxDpuvdwaEtNEnIy03O4CYXIyId2TSMgfJGOR/oTsAYyjqVWQaQfU3KL3SUyElma53+9CYODiozlRbrO2xsqjfsNmWdvFYneBzJUYOwiweTshuPckgfw+Fb9Gy6dnI9cAHzXKN5pOrgKKPz7WKtX+8+9CKtnJvA6Qr6KTVOsd0FaN95DTjnPYt1fb7kQz924bBm6ZOH2+KzkmPfdoU863muPO9P8hVmDbzeUe7Tgz5kPe/bnlWamrec/9oHTYQlzEO8Dcs9n9t7g3SUewKa9KJf75NQpSnbWaybPQCVIXlJI0fRrDMmKn6aGA+lGi+nv+wCFc9eySHQfHU+yBM7diCqLoCgh/XZSixFLOKbrT9Ahq1RY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3282.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?e7zl5uy4MJL5vZAcce/J2qd0uACAp2wl0yIu66b+i8Vqi0THT/QW4weh0E?=
 =?iso-8859-1?Q?vdnTTqJCcz3cogDhxKoZZ+r0lZpwLq1gnKYWPIMSlc8G6koeABMTuCoNQM?=
 =?iso-8859-1?Q?bXoVchw/HZD4CSlWeakkS1VlN54XaYJbgu9elLjetAXQ/z10KOr3LGWJ40?=
 =?iso-8859-1?Q?K2I9UT3F/xyLmHlGgkxGqbsHw/fcynJj6oKmkJ5M0MOPnCBjF7pdEYQdWK?=
 =?iso-8859-1?Q?GSSJkKqGij1N3S8gGaTreEmypudzU2ex5Rp0OHIElxfWhO1BnvgzXkRvsC?=
 =?iso-8859-1?Q?fmprahOwZLFf5gGWRRqfQpgUnuFWR6NSdsQOBOAFsAOfE78B9SkxEMAoam?=
 =?iso-8859-1?Q?Cl0unJL1cxY+hgvnFU6E/we1VftGFnZ6ZcEDf318jtkEkeGoUklGZEhmoX?=
 =?iso-8859-1?Q?29F3yV6lkD78GzvvzBZH7ItSRPlLboM2ryzUXZ+7yfIUByiqzZrYR8sGI+?=
 =?iso-8859-1?Q?zIQmxbtwasiTJFw7i2Xwmg/PcPqXaIZG3idpHuUKTqlYZXDn8fzrh25CsF?=
 =?iso-8859-1?Q?4Gmj5d1/02ZAVOVDPXnWs8tZfCRzCIGjJLBXUP1laLerQVE+Kn1AjjxpqT?=
 =?iso-8859-1?Q?Iulpmxnarj6YQ6ZWdG9zJ3Tq5rMEKSqKQrQQHd4TJ8SIdnS92s5xjqachJ?=
 =?iso-8859-1?Q?2J2QH6zn935RMuR32EBGMTcEcTwckB+NJ0QCoEngKdokm/9ggrDfZnJcG+?=
 =?iso-8859-1?Q?WLolXxWZMahLgGZUwecJ5TiZYPkOnuYWS/j6wijlanDo6k/XEKnLD+rEzS?=
 =?iso-8859-1?Q?SZ1QKVvFPn/s4PrWGbVrLfAxoRZbOjQWEJJxAQn7n6/WGgVQtlnq/2++Z9?=
 =?iso-8859-1?Q?QvnvndrYdG3EL1AsvENKm93X3EgapzUsOjOi74VeEb8VIsT+OUbP94LwUa?=
 =?iso-8859-1?Q?nkjbvn0DUO8QNvfqRi0swpYe7P48tWuAhWm2zKuA1ujzspaKj3pfBqkOKd?=
 =?iso-8859-1?Q?qXXVqxOGI3SZPBp3WZFh5AUxYeC6cTkyyhhHrD044yT/USdNinqQ0rQkXu?=
 =?iso-8859-1?Q?vyj4k2JKbaLQCYFsbsbIyG5JAC3QvA1KAPDoK+b1TQF74btzNL3M28aDdP?=
 =?iso-8859-1?Q?DqHnL18dUup6Lj1jzkUvxn+7vhh5+AQKdssQYf6vb6RzM/+fyoLzOZ8xtX?=
 =?iso-8859-1?Q?m27IYghC2Zg7sUkKvRUPP8L5dWHrBD56JoyJURg5cwHK/Dd0WapoHerLQ3?=
 =?iso-8859-1?Q?p7ww8hxvZqdAnvRIsZV8kxElhgSHF7AHkuriQHhCk1p0a4vS0tzDmzDISt?=
 =?iso-8859-1?Q?jnbIODaWIdTOO8gRiSkPsZX41Xr1ne1Y6gymohQiLbdCmFcokvoFEIIYMt?=
 =?iso-8859-1?Q?Ugw6dYzWvXk0mGyT9OQOID9RoPfyMWrSO+5UNq+SqaDdWWwhlI4QswHlga?=
 =?iso-8859-1?Q?I6kYyvpiymMoePDCmjJI3WG2Dw707b1t6gF6NWpwmLazVJKsExZ9jiERKg?=
 =?iso-8859-1?Q?L1sIfEsr28DczP1WtH3w59pU8gYlogvtbeX9k+rrBjST4MQbECtohDinXE?=
 =?iso-8859-1?Q?KUmc5Oa1nB0B6cw4X1TMS1JrdtfixzyLx9yivlDKo7f9PLCk6wCJ7DgLP1?=
 =?iso-8859-1?Q?frZFo9u3URY7LdE9EOXyV4gM0cFrHf/Mi2bT3h2GCBXnzER4cxl/4qmtAL?=
 =?iso-8859-1?Q?R+VH42oE8gYQwu9v5Z3+ZKoUbRd62bx4JOaPvf20I2TXLYSrTCyWR4tuFx?=
 =?iso-8859-1?Q?ldmsB/mq5w9u7fbvHzZqI9HS6EiDs0IJuctydM3kQR8lB8z8ZdK20emap3?=
 =?iso-8859-1?Q?GB/58eFYU54XnWc1GnQlRi288xx+7ma1qJRzGl1d+p0SmIVvyZKc1gdUm2?=
 =?iso-8859-1?Q?e2NSZFF0Q7ceELSIJqM+cjw9Xi9gplgqMhmGUu6Nh1z27Eil8QS3?=
X-Exchange-RoutingPolicyChecked: s/D0gU1Y346QFSwtnPdQhRoQI/XK8A9RDrlABXzpKQyWLNr/iswnnLz49vFJUYXtWGC4Mm8wIn761bhOpE3oqcccARRau6OMVK06pAtJEX6RQA/7Hh/+WLyz0UICWoA5ZoGMRE09mnUWS3WUhvRmLOC9Cg1IZf6Qe3G9PeBKfMmhlaJmm6S/8FrLy5xEsCERSjKv9AKht3No/PZ34W/z5GbF9GSkYbf0A+wDhc9LWsHm4W+iv/Q6xyodKTp4v00nHPE55+hGaSUFDSDKeYtRxXKCHPaX9xTgDvgjetB/7AzzbaNBSfPDuK4ekOjmVth9H+Hfex6NFHWW7U/dO+T01w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4461a93d-95c0-479b-34e9-08de9aebb184
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 12:37:02.2934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kke3t4CTa/Xrx35c5CcrH3xRvTraYNOSlx3RYMNXWEPW718GaAuF/xj5WItS+7QVY5oR48ULPZIablYlVUaerYzTZLVIVLc52rH73otEkCc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8772
X-OriginatorOrg: intel.com

On 2026-03-27 at 03:15:27 +0100, Ahmed S. Darwish wrote:
>Intel CPUs have a "limit CPUID" MSR bit to limit CPUID enumeration only up
>to CPUID(0x2).  This can be set by old BIOSen before booting Linux.

BIOSen -> BIOSes?

>If that MSR bit was set, refresh the cached CPUID table after clearing it.
>
>Scan only the newly-found CPUID leaves, not to override any of the kernel's
>previously force-set or unset CPUID bits.
>
>References: 066941bd4eeb ("x86: unmask CPUID levels on Intel CPUs")
>References: 0c2f6d04619e ("x86/topology/intel: Unlock CPUID before evaluating anything")
>Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>

-- 
Kind regards
Maciej Wieczór-Retman
