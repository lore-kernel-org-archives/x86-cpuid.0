Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA2238B7A2
	for <x86-cpuid@lists.linux.dev>; Wed, 15 Apr 2026 20:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776285256; cv=fail; b=FpdSfriy7ZooJU3rsDgBc4bKZWeAfdFaYwqR8TZK0y99v5k6PQt3alEzvo28kJruZ8kluacv6RJ+DNLkpYx1Jz/4h9E33K/CZDzoWLWk8PcRHY8oK3w7mZVBU4zPUxX3wexWbptTldL1N6tDCkde9n861n846/Mn8U6dbxe+Dio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776285256; c=relaxed/simple;
	bh=w+y/Xg6p+8xddtjB7wcD4hP9w4HkpQe4I4KJDk9+jf8=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cEriobSFozA6tdTGhEFYBHIw/1FbDn+mHfy1d1tptmuy3Eq/BswHiuVwcnBZN4G7HZRrHT1N6difOAq6eF/bdnPDWSXxIdXolgn5B+F2zVhSQztQxMAhYCR4t5+45lIO6uvy24aBfJW8++glBknysv1sdMeUnC8gdwsou5qnybg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DEPFzhxr; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DEPFzhxr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776285255; x=1807821255;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=w+y/Xg6p+8xddtjB7wcD4hP9w4HkpQe4I4KJDk9+jf8=;
  b=DEPFzhxrhI00FqXgCU7q73lleOeePZg3k9ekC/yGC9aFqAea/49u2S0E
   ijFhLxlCv3isqkXVlGJ6ILrTW08dTARCH8wDXfTjF5WY9BZmrdAmNl4UC
   TsBZ45KSW/N8zT283ZPWjFuHPzI+NLIWpLXkb+9Ixvm/oAFO+9pYNPqsc
   XkEq3mByEaWU4RSzeP8ybcdkCR5592qvDT61cTZH5d2YbJZ+cT5pAqeUm
   sAFAofK/MbSA0kh79sSxqkJLJYU5+XTSY7qWkQLBnA65RCB3gnTchlQKD
   ymv74fTUeccoNsnBHAfKbFiyx6MqbriG0NXg0P+KmWwpxJKoBXMQoivyY
   A==;
X-CSE-ConnectionGUID: k5UgtYMvTxGRGQxSyW8Lug==
X-CSE-MsgGUID: CWW9e3vrQleXnPS/G9v/YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="88656970"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="88656970"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 13:34:14 -0700
X-CSE-ConnectionGUID: XWNuYhwbS5GQkMXOuZpZeg==
X-CSE-MsgGUID: VomMgSWwSU23wAs0cb53eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="253778510"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 13:34:14 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 13:34:13 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 15 Apr 2026 13:34:13 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.53) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 13:34:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JPqidlkPLvcnkaeu2T/Rke2S9UTbRJTWtPPka9iVOd1r/GML2mpcIeJfyUcWMZ0hrdk550HRwgegvdC8BSpMYlCBmg8v8mBeMyhWLt0jOvKXASRLj1MIhOXbSuglARFVObVRV4nK0LkRNTuHUbM3sW6ogDSTYeJwSRVaEHG6CXZMd1dbNWxjaINnd0B99L/FPIuyqnjAAc7kkyhygAdXnCdY8WiaSEuL+pJLjv+zds+k7b4bYjZgR2rMPoHUXW8WcyjTZNZ9NcZN+JM8zd9TtkEKX3jhlq+bqIIXRyA/xuoRgJd547zPGP4clFvPCPKBhYEFs1a/SygtIVrUvcruVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3NkJC9e7ADZAb7SwSOnRHv5dQQSF4dTBsmqJP/5ctIM=;
 b=oXJF42R2bPeJz7lIRqREIRSMbqYVoWg8gDzCQJZMyVl69qOylZmYzJKTh56GUcpMpxib+y8JIGskCBttRFOGMwWfrGKozoEHBL6JpxxGBy2+4hE5Dzt3wyijfEJcNszhVLo1ODXPqYEasZoe3XdXpdizw2sEVDsuCrahoFIi/kvVzC8raBuszs6Eg/X5UTzmCKMz9CpkddsZSK9PIzOcy47Fj5dk2wuS5MLmlpXgaKAO6EGaRXfs3l/GEtk//23EBohyoSSz2pDHDs3s0qozc5huvJc4q1LdFVUgzEmIoDg6D3xw0IH+Hr6VsUt2NYzZErLjcK0LG7hEyam45PCoIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB3282.namprd11.prod.outlook.com (2603:10b6:208:6a::32)
 by IA4PR11MB8990.namprd11.prod.outlook.com (2603:10b6:208:56b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Wed, 15 Apr
 2026 20:34:11 +0000
Received: from BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19]) by BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19%4]) with mapi id 15.20.9818.017; Wed, 15 Apr 2026
 20:34:11 +0000
Date: Wed, 15 Apr 2026 22:34:03 +0200
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
Subject: Re: [PATCH v6 22/90] x86/cpuid: Introduce a parser debugfs interface
Message-ID: <ad_1qCLqJ8WjYf79@wieczorr-mobl1.localdomain>
References: <20260327021645.555257-1-darwi@linutronix.de>
 <20260327021645.555257-23-darwi@linutronix.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260327021645.555257-23-darwi@linutronix.de>
X-ClientProxiedBy: DU7P191CA0006.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:54e::34) To BL0PR11MB3282.namprd11.prod.outlook.com
 (2603:10b6:208:6a::32)
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB3282:EE_|IA4PR11MB8990:EE_
X-MS-Office365-Filtering-Correlation-Id: fc33c0bb-87ab-45fe-879d-08de9b2e59c5
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Vf6N4yCKffIyQmC9f9w4iu5CHeIfCFJft8yIFszQNsvJGnN93cl78//UxEHR9x1ujqjiS7pGNUL6dPlu5W4PQCPVAqrXICwTwDwFv5PEx5mx7HzKhA1OIVRovw/6nD+RgB4Pjq61ftmT+H8J4tuneNiUG4Otsv/gzRcPuCCxdDSEv7t743jJw6sOBxFbtny/qPJalYAvTM8/ZnRb214x8e3Zvz8Xb4Znhuinr4SOdBLUwc6lkBdjnmiPiVI5j6uxCJx+scYwQroCsB5ygChn2Zy9gos0F9oG+r75l9OvuAyzxvuu8+LFSNj+hU9675LXhhauCekCZVSTmFNxRz7e/dIGScufN1arErj0dYGPc6O63EemlEyLZPuOt3OLeryq5j9xC/kUwif5cLD76r9nK/gIjf94f2WyHzlmygP/h2offwm9xhTlLcsVVA+JI1DyFFqdBJBbCb3zLHVACwuw5lCeRbO+F+AqGA7wCi/VP0OHUqLsLD7I/z45zV161OuVRp3YeG20c++Q9QVLn5yHSvsB6i3E8NOLQItDXy/9E/dMRWuTk8AtMEKEikKPsSzLfANgoEftYgbcE5rft/e270hl5mqLUIQFsAOr9Lzmso8nQDMUvSXYTkdw16FTB4LWT2e1nc/RTn64N/selc5c4rVVLxfil8sOXF5qwty+RJtxe8mVW/Sz4SaeFQQ4TnAL/TbOvg/QBDmcYMfj9fAGHhboNZ44Io3yX7w+W7FnCqQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3282.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?PjodDCYqwOlC+oQcAL3d6WuukD8b7yDHx/tGzB3wnWXUQX7N6lAGbpQWQ7?=
 =?iso-8859-1?Q?pWbMOpUW1kynmuD1OVbhSWo3pGgV3cfrs3xV5y8cDFwgkbKet4uLogTBkk?=
 =?iso-8859-1?Q?/JJfZfwHyl6KSPjicQq9T7uX6sp4xbz/ySBlLy5qT5oWQbmy5a1YfkiABG?=
 =?iso-8859-1?Q?4fymGCi5BbabdoXSsUzdfLnIKTrLA51zFc8w+SPnx2w7Rbck/ddXlLeBr7?=
 =?iso-8859-1?Q?kLqG/IekqF9C0+p+oQBenq8HentsWEoTAEclfvEAGoKhPlpBDkCHXAzkCb?=
 =?iso-8859-1?Q?57eKfd6Ypx+lJgXFzMh4oRZKAYZv2J0GiFu8wmRZ7OOUOaHBBgTm1M+J37?=
 =?iso-8859-1?Q?x5h5Dnd+b5PYmujMN/phrUz++swu3U8TfJtJdH6pPIzkx2T2LfjD4+Ynop?=
 =?iso-8859-1?Q?H0HElNkBcCy7nOBIF4S0RM4OBdb2+g5q4QX2Mo8aP3WE+s1SsIyO0t/y8W?=
 =?iso-8859-1?Q?k9OGXB5+0n3KlLdRHTpLujjX1J7UrgXRygFXsSCNWQMoUMYUZVq7Wjof/w?=
 =?iso-8859-1?Q?jxlUmbTTGPHNf43/clFb18TG6k+UoOSGbsAW3kY/wQJKsxNk9vvDlitl8P?=
 =?iso-8859-1?Q?6j14nCZjCXdIclog3u+eNDId14ZaW6LnVw2Y1O2pelg3XPL+ACaQpxulB0?=
 =?iso-8859-1?Q?USSmNMFPTLIzlRpTFtfRCa+dbd/dFAaEwegg8tWIyeLuZcROlZ3YRhfV+U?=
 =?iso-8859-1?Q?t4hiBzZIKbv1uCNB7lS1uBxwbaLCQTMfL8d39XfXOVJqtyfXz9lEJknkpX?=
 =?iso-8859-1?Q?97fKCv2j8y+KdczbNZeBn1ASGbGodmZ7O8PpL4R6Iqr5hwF65T8gzNuJ1I?=
 =?iso-8859-1?Q?Mmt5G894iR5ak1gunWYL/qqOpxyRqnhRwmjICbsZgZDJ0Djy5YnBAW5E1D?=
 =?iso-8859-1?Q?LYF0W+NCChpRYHKWQaxwwTd8QIptOsGvygJjkJy/+ls/eZVA3V4KSVR28v?=
 =?iso-8859-1?Q?0FyyRz73mOG/tV7tfv2tqdZQIRyuPephIAIcI80lCBV/BiL8n84U0Jomqm?=
 =?iso-8859-1?Q?gRE3l8UhS6dsRtWDCcRENJsWeCtQUK5OAClF6hbvElf9aU4N59ds0uuaMb?=
 =?iso-8859-1?Q?oXbBsMONqOjHEiYx4W6DmsExxrrHkTCxoy7/pepIqzmgmjdK1e2Inm4qnB?=
 =?iso-8859-1?Q?uoe16Ou9+JGC/2FTmVxhtIDIn2asoDqfNAf8yKMD7uVNguhDGU7HO3ypws?=
 =?iso-8859-1?Q?ccnXyWHxYqyzLnsb0Ia9RMv0ctx28t7NvfVZwQJnabgdtRjTkM+gn3kmGm?=
 =?iso-8859-1?Q?o3IGA8nVzNaQKwqrUKbped27f1ALS7slTWg94RQqByDR0LdFmOBv4a288V?=
 =?iso-8859-1?Q?HK/b22eMKtQe6FQYaGfWaMlysfWaYNU8Ozt1HdW4JIDO+iX8df3XRLeb9F?=
 =?iso-8859-1?Q?2p5oHstiSoTGP8GJRDB9y6Bih6BGgE76iMiN/aDxDWtJZ1Z5Z2YsvqH5B5?=
 =?iso-8859-1?Q?9mKek3peZAq3EOgyK9MTz/fPvkTcsLXKPbaH+leDYX9vsdjG4ljhqSkfr8?=
 =?iso-8859-1?Q?Gwuuq8V4CEfdiphn/vn2tHcjFeipPVPXSVM21vvFGTzVvyJ2PcovAbjcFp?=
 =?iso-8859-1?Q?0Lrx2pihKtBLzovz0Vrx8zF/U6wunHbcfzRJdfv+8U/PbKr9NCmlqbLYtN?=
 =?iso-8859-1?Q?MZ0dtFN2mJxj+45AeSqZ5bpbp/ZStFCPMA6sXmZ4HakpkviLaa/PPlFw0k?=
 =?iso-8859-1?Q?Nw0Vi+l/s5TvQEaTAIdVmPJScYbbKJ6SgsMnJjG4zaZXAhCBsIh1GBgC38?=
 =?iso-8859-1?Q?6Exdnpvhge0Yo6t9NPoKl+UGK9wi0zB1d8b7tPxki0FDyms2XyH5LWhjjh?=
 =?iso-8859-1?Q?8o94xWO54QQ3SFoCWW/sWh5M0ibgDdPcR2qNsXaFe3mIstK7E6zf?=
X-Exchange-RoutingPolicyChecked: kuDvQGEgHkjWPFSKP2XAvVTDtvsV0hJPLTUE3aoYmbHEBuqsGWw9YFqVQbzQYLIeCxOohnwBkKiGAMA9L0p28bszUwaFTqC7LTgistg61/cxdG87nqZYY8t28xoTsIKoPi2QZ81qIJYxnT1dvB5k4H/vz0s7rAoHjdnw74+lOtHMH84EktlejoyCd6HXI1edHTcQwDA/ReKKlmfYiJyzDW4hI+MGBU+aPbvaNB4vlAi23Yoc07s+e2wKYnqiPGv+ttFG1Xhcb2xauIZe4qnz5y3w6VTKOvjrdV7bAOYL8NkS3yASKS7xIKn3ZPmTUOlY5+B6W+Z41w8f+6PECj6e8A==
X-MS-Exchange-CrossTenant-Network-Message-Id: fc33c0bb-87ab-45fe-879d-08de9b2e59c5
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 20:34:11.2558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i9Q1TtbJzdXzjZw2+hpv1VjTBOZ77dSrKjFEVQ4xnrrFbEMx9RFhXR2TVyvU0tE+deBeHjufCgeKmUbyvI9wIkOPrhc/fBApcmrconrvh0o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8990
X-OriginatorOrg: intel.com

On 2026-03-27 at 03:15:36 +0100, Ahmed S. Darwish wrote:
>diff --git a/arch/x86/kernel/cpu/cpuid_debugfs.c b/arch/x86/kernel/cpu/cpuid_debugfs.c
>new file mode 100644
>index 000000000000..4bd874bffffc
>--- /dev/null
>+++ b/arch/x86/kernel/cpu/cpuid_debugfs.c
...
>+static __init int cpuid_init_debugfs(void)
>+{
>+	struct dentry *dir;
>+	uintptr_t cpu_id;
>+	char cpu_name[24];

nit: Reverse xmas tree variable ordering?

>+
>+	dir = debugfs_create_dir("cpuid", arch_debugfs_dir);
>+
>+	for_each_possible_cpu(cpu_id) {
>+		scnprintf(cpu_name, sizeof(cpu_name), "%lu", cpu_id);
>+		debugfs_create_file(cpu_name, 0444, dir, (void *)cpu_id, &cpuid_ops);
>+	}
>+
>+	return 0;
>+}

-- 
Kind regards
Maciej Wieczór-Retman
