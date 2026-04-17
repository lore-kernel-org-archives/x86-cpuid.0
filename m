Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666D03B38A6
	for <x86-cpuid@lists.linux.dev>; Fri, 17 Apr 2026 09:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776417671; cv=fail; b=WccYvJTezJcO0o7m902+hiDwZX0Qv2yUNNvRmaW74kJwPXFH6QMb7BwPXYCl3tmnz75Vv6iPp51lxsU3smZcxIR7UZS10YuET/6GjQpEy8NZ9pxru4VwmbV69J1IiEDs7Y7Otpu84FSgJ+7cVfLDsX/OnUnUG4cBw6Gwg9vhwMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776417671; c=relaxed/simple;
	bh=TZjxjulrH9VK4xdHm5XLEYEe0Zse80IfbQeInIztQTk=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=joU/FuXNaXgw00c8vl6ZAv2qz3rOiIRCh08yvnJKYtbcBo041mTTEUJmRZIUTTfwf3gqZN0g3zJnKx18a4IaATQp0Cexu5OTcjv1MilJGmih4UOL+POi6y+XOc5Q7Fli9L+XO+rZtobCxdsL3ydqo0iD0Zrty/Pdtj0L4fMJEG8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MyFeTqaN; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MyFeTqaN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776417668; x=1807953668;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=TZjxjulrH9VK4xdHm5XLEYEe0Zse80IfbQeInIztQTk=;
  b=MyFeTqaNJZg/KthT/l1AiiO5GU+6GKaVt8Nyt/aPhr+TBWSqC3omozTH
   486Q/py+/8SxYrM/X/ett2IR4hofRzgZHVsEqAc29H3GRZU/DI8RcWYtc
   jZgI32Wu506lrfzh+OuDH8mY2+cuLywLyJ2IouuwjZq6ISSq5n3r66349
   f7Vtfv92Imv02X/Ki2sJf5mJgq6TsJNc/jpsDqexKMkEa/olRRVtSAp28
   Bbr+fh2HmdCNw7hwBiNWfpWNqSvKX7PiC/6iaZMZZwjRJ2Mhorp3bbdY2
   X0dNfPkOZGsdggUitbkncHRXE8s4bptWebpMFG2q8un76gaqsHnIJiReI
   g==;
X-CSE-ConnectionGUID: BbeyLiasQjSlRu/Wbg+lSw==
X-CSE-MsgGUID: mla47R0XQESREjCNdrX6Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="88813297"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="88813297"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 02:21:07 -0700
X-CSE-ConnectionGUID: SCTIZvGMRuyicYQcfSnvxg==
X-CSE-MsgGUID: GyLjg2T9SWCwGy+0GHjI+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="230128834"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 02:21:07 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 17 Apr 2026 02:21:06 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 17 Apr 2026 02:21:06 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.49) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 17 Apr 2026 02:21:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NE/wjLgJhtVeoeaT1lNArnDTcXDFMDJs8QfD6DU5jdyjc2u2tPlHgD+rwPAwbJ+ntis/BpQJstDU0bQqQxk5flnMgSUIBSOdtY4qUnsxDwqdZ+8uah5ZLhE7VW82o0s8A2n7EpEIOW1cD3XNqw5sK0d5OAUM+vAU+aCcgi9tbdTTqkS3tbaSOa9pjJitnxWmf8Eql6gGjao5DNgAvYVcvF5vXYu55f/bdQc6XG1uvaZPgvBEbL4a2W76KArnE1RXaNVcZY8AAYYJKfZTDw55uNHrt084Y9V1i4VcAu7pTmXCTjlkn+QKJ7x89swqi/M2ZWHny8DmnkMe0QQP2ENNlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iUgPvfNcx9xf6KvGnM/Ie1NdlK5xlk6DSwvOzdGS63M=;
 b=HmttN/2CVcPum0BAHXu9Qzz6yCBCUdGToS/FmXcK2C5423/0I24Kxt/bLi90SAkbiSz0HLz6VkzwYXUR7S4oBbldm/tExhawOZ42V+u8MPUQ4OIKBqA8y03PbE58/EErPs9LzPhurc0XBELWCcUelObSPMZCUpL480F7WThmeJLxZn+B4r0zIw69bSI8XlxLUMQHJ4JXQKexr4CFCLUecrC13ng/lJXAGSUs5nUx8K0zT2nDdCI5NTDhiap1Us2ZgdllgqMRj8ly6dGOKlZ1o20HK1c+3ursz3VaI44Nrb1rPKhvLc0THAv9ksQla0KGaEnL57hDDp5YgRggPJnTvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB3282.namprd11.prod.outlook.com (2603:10b6:208:6a::32)
 by PH0PR11MB5190.namprd11.prod.outlook.com (2603:10b6:510:3c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Fri, 17 Apr
 2026 09:20:58 +0000
Received: from BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19]) by BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19%4]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 09:20:58 +0000
Date: Fri, 17 Apr 2026 11:20:27 +0200
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
Subject: Re: [PATCH v6 36/90] x86/cpuid: Parse deterministic cache parameters
 CPUID leaves
Message-ID: <aeHjZj6i7TQeLaGr@wieczorr-mobl1.localdomain>
References: <20260327021645.555257-1-darwi@linutronix.de>
 <20260327021645.555257-37-darwi@linutronix.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260327021645.555257-37-darwi@linutronix.de>
X-ClientProxiedBy: DUZPR01CA0074.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::20) To BL0PR11MB3282.namprd11.prod.outlook.com
 (2603:10b6:208:6a::32)
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB3282:EE_|PH0PR11MB5190:EE_
X-MS-Office365-Filtering-Correlation-Id: 50817edf-9a99-44be-d4eb-08de9c62a213
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 6rBZPYnBtP9qGdAoBlPYk1HbgJHOeLsay5KUzcPB1nWBm0wATr9vsIdMsOzNz9UHNZNmTqrrMG77XB1iD993CzprUtUpNgOIoXQkTYHYSLhqMFY6jOmmuJHvpeo0T3VEgFShGwlyLDVn72e8uIKIyib14/hTUlIw2+UwHeM0ywJp8516et4+bxCGVFaeHfciuD2IN1FUPOiGrT1HxTnCnqZY7zNBTuDE6vJzNcWD5kMwbhTNeqbq3+AyFUkko0aTF4T73xfivyWELpl09JhL0BTt/NhyYEGZoroY0qyODuBQKQM574M0pY72bNwS28X/4FUccaxo5Ukzpr9gKAG26DEj/KpRhWE4oZFLVauLCmM1fe1d0owEv+yp8Q2kY1+zivJKYdHzG7r8u9dGrnepQ979C9VB+bApkoeSid6s+UkQZEPOapF8pEGtSr7daapnfhPO9kIObH5Q7evkWw0lh7q3b4X33/oudy8XbVOBL/Ho5nI7xVHpcYYVQ2O9WOkMxMtJvYianvCBYAeHGIwf7i+dYk6WDlEnqFkyd4MP4H0A9ZtaimxdoG+pLtpsSUkDYyWYGgTYgNbBA9CwlQ+cVY8c6l1LQ1FEUT+5uT6mIwjW2bU+btzsx+HvtgSEKRasto8UOUS8SQtGZImXuNSs3O2hzq0OqR+ICQPgjJv5SXRvSXd1Ouu7kyu5Hc1RK8vNGZ1klr13kakajybeTVPiXjn1wKZQRJsaak79IF/xsc8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3282.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?PRIXz7LSzsbvhZC64BdA6SqSejxyz5Ifxc7ibZGO3/heGyQF/ZTZYJ00ap?=
 =?iso-8859-1?Q?4bJd8uhRUWYcaLPmpRlmxjWFLvasS7CiusRMBhjUecPD/P9uJztJ4bL5Cb?=
 =?iso-8859-1?Q?A5ZMNK4wh3c1+lC6IOUh5pxonlX+19f3s76IGV5yT9wAjwJ7wjeWGL/CZj?=
 =?iso-8859-1?Q?LfJFAGzUw62ZREpy1x48RM3+WJcXFoLkuolgrA33ldOtwrVlOafnH7O/gu?=
 =?iso-8859-1?Q?RP8XFh8UK6hLdgJ7POOLcAAjTCJqFZ/6r9gWFVoza4TqkXessRBxNTr9eu?=
 =?iso-8859-1?Q?L7rHYsjVScPTb6gW83r7bUikvnBmPGum+4uEJq6M32mMNlauvPmUAMQ++a?=
 =?iso-8859-1?Q?B4x1XmFwOn18L5EH+bKc3yw3YtlHnqQ1EuoxxTBFSFQnhzRNe0bEgnYBgE?=
 =?iso-8859-1?Q?R1uhu5mqExLdaimw3fGaNvZcTcgwH1EEFmvCe3T+w3AL2/LNcOxaivS7qc?=
 =?iso-8859-1?Q?4zD9S4kPMbJ/vz79hu7QQPLmQDYrSKRUQbmozQLDmqoxA3jdqnb5pqAaYd?=
 =?iso-8859-1?Q?DCyQpmPm5QOl7NzQzbR6YwLDsQiinpJME1gL31f4k4ZvlgCRG93nSnFmtc?=
 =?iso-8859-1?Q?K7nZrzaSx8iRwkJo+mln6hMDd4o7fT8BDCueaa0CD9HLyFlY889MlE5OzR?=
 =?iso-8859-1?Q?laCYOWtBdO0ccatvLra1zNqiqhusyC2EpP4O8WZ9Pm6Pz70Pbg3nnepoJl?=
 =?iso-8859-1?Q?rbGDhSMC0B4+mqpgNehDflpJrTbE5EIN5RWGrYKA3tM6QOfiVohnHyxyDL?=
 =?iso-8859-1?Q?/SgfhvL4IBIffRQ/M66Li3C3usa4OlHffCwlWbO6p+Da4vlLI+T9oEGkSz?=
 =?iso-8859-1?Q?PHsbxd2vzGV3Tc5IZzowFn/rmh7oZARbQpdB+cCGrj9kSZC+FacL24cnSh?=
 =?iso-8859-1?Q?ib9F6zkIQh8CQ1Kgc/OC9Lvyd/bcscshSkN6PEaGsVRqPLE1ZG66ppV44P?=
 =?iso-8859-1?Q?6FpKisdVUBHNbw8tElVhpKT3fEC6h2o68vsYEHqxaXi02/1UM2r9Qeuh8J?=
 =?iso-8859-1?Q?0vmsLK94jIcAYwGf6mf/a3VvH+DuCvkeIn1kvvnF1PgE6VAJxN56CrRkWN?=
 =?iso-8859-1?Q?4tm3vNMprNu+5/P7AgzVqlmQbwHFpGrlK7jiqNtEK+Rl74BBKemoMf8ZTN?=
 =?iso-8859-1?Q?PwmhxC3Gu5gW6ch9nhx+d51n9IijQsUgFJO5nQv/kWVxMVKCLvCgIt+eFb?=
 =?iso-8859-1?Q?AbaGQBeCm+LS+EjQ0qVV/NGMS//ecagkAvHThIX9i/HkeujGhZeBDLofm+?=
 =?iso-8859-1?Q?03f4hjs2TKxWy+SNAMzh7APj192qnoruAi5SG7NAmd6Lw3fdNg2/ur1ybZ?=
 =?iso-8859-1?Q?qWj+5172fHtzYjEUcvTV19D/gnQiCpASkI0KOfAFWbKyv+2OCgn0jTy9hi?=
 =?iso-8859-1?Q?gHQKRJjrSNMK4K4er+/XoBESz4Lk9AfZjsi9FjGEWM+soAbIVR4WY2Z8Uk?=
 =?iso-8859-1?Q?JVOVMyNud4QnzE01vX7W3ctidTxORYissx4p7S14pGo6Tko7yabyVAQrDB?=
 =?iso-8859-1?Q?lFUhV1BBB9UkO/1o9rVFMHV14dtwLc8i9PqvmTfXKdML6Q9PcG1YbQMPlx?=
 =?iso-8859-1?Q?dXmcaQrD330seSCfYoABlSY1qMIj2rar0HXQHGItfpwXb62mdbdi5f/0ew?=
 =?iso-8859-1?Q?qhq5RMljeNvQ7Hu2SMO9nEd6cskpRpuwrabrEv3deusPV7VQWlJDccQ/0y?=
 =?iso-8859-1?Q?wUCVV8VFGNvX2eHHaPqcWvESlO7g4JMpjTYSvXBwHC15wEGpF5lGYYPmvj?=
 =?iso-8859-1?Q?p9I+TAT+65aUpIyofCJkjdw0+ozsY4oXzEGpAYPioijVxi/Jvkex2fPW5w?=
 =?iso-8859-1?Q?uAN44RQjvY/WKVRKt8Dt9Wv8RHtr9fyVffgAVqQAex6fT5/H597p?=
X-Exchange-RoutingPolicyChecked: rBg+UdcfqH1mi/jwKTjViDv+09vIys9Vwda8/I/SnTo6nxG6kbbX2Q4aOlfISnp6lXplm4/FtqxdQfR7w7IpqB1m0O2QBTepZqUhbsRatXpMPo/MmNmTV3l8af3YWAHbvoJc6fybfybHRnBRVAblNI8shJOgATCfP5uM1GsH6X14Ffj/x3W+r+CNDXqUm2Z0n9vLOQEVLSnt8RRDAMUcYL2ETL/Nek0AUmDoJU9gnaTnj+AWE4spFXwchXq/BTTqCspR5m8EGRYGe4d3E1/uHYZrRRZaRHFIIZeKoCYtr0gmZMcc3XnBwne6N0VQsFlsJT0A/p42J/qzk+Rwv9H7mA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 50817edf-9a99-44be-d4eb-08de9c62a213
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 09:20:58.3286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /5eZ6jfNzJLa7f5Qp9TvlWrGOica9HC+KGiX9LiKx4uQmj3UWHgrpbzM6WoIgs5F2JqlGQgQnBMfUTc9Qr7n8IBY1iGAiGNZefSMi8dG8eo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5190
X-OriginatorOrg: intel.com

On 2026-03-27 at 03:15:50 +0100, Ahmed S. Darwish wrote:
>Introduce the macro
>
>    define_cpuid_read_function()
>
>to avoid code duplication between the CPUID parser default read function,
>cpuid_read_generic(), and the new CPUID(0x4)/CPUID(0x8000001d) logic.

Maybe it's worth updating the comment above "struct cpuid_read_output" so it
mentions that cpuid_read_generic() is macro generated now? Right now if someone
would grep to find cpuid_read_generic() they couldn't find it.

Or otherwise adding the after-macro function name to a comment around
define_cpuid_read_function() calls could work for other cases too.

-- 
Kind regards
Maciej Wieczór-Retman
