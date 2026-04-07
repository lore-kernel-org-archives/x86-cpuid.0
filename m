Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F04A3A7825
	for <x86-cpuid@lists.linux.dev>; Tue,  7 Apr 2026 10:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775556589; cv=fail; b=dwQj6NFxCPJpZC8wZOdznk7aUEFhk24SmnfsDKwWYX/loDD5hAxP83Urn63Q3RKZAW2SH65MaVBR/bNM6+UT02qsCLqAxRDodLHTmOaTZFENhqrCgdRQMU84xLZu06zCYE9lpxnTAckQQCnU07JQ5iUyUcCV9e1Eveq8Azy0pas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775556589; c=relaxed/simple;
	bh=CIEW971X+L+/q3ArmlBIb/PAwdhcVIH0t6x/1q60r9M=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=idWYFffDbiKf677ht9v5YAjri6tu8fKI3QNPwIGTxIZlvK/9ff+4Yu65CANUAct30Vcod5taU+dnHmyif0Z/GziRxzvHfvd8kLa/J7jS5m2GXOimmuH+6oQN+yygSDtxDWCjiAG0xATOFnFhiyqXQ4yHXBhwr0Slvomd6Lb5664=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jabLxlVl; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jabLxlVl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775556588; x=1807092588;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=CIEW971X+L+/q3ArmlBIb/PAwdhcVIH0t6x/1q60r9M=;
  b=jabLxlVlnQK75TO/tOUK1yK54322ggfkrtgLH4CqTmjmOARJ0yLg1Rb8
   ynfGGNXcVvYd0eSGK3rl8GlUhBauGYGMmmmvasPqxmdFCqJB09ylnIjlS
   +oDa0oRwiXXXiKqv26z3piQByTb610JAlvKoEc5EPlgtiMJSADAHIRjI0
   B573E3k/AQVDtVJMKFWnwvHTmIXybBEpoVCjyo3ySTGLs7kl19l0hQ89+
   5YX3n52+zNZHddsm3n3utgMgGT4Km+UiPdGzGQoy8nIkrc0rfrQa5b145
   ya4qJfncVCSEImYFLybf3NfRegM2AxdRComv52ca0ztJ42n/KEHEZi73y
   g==;
X-CSE-ConnectionGUID: v2hXaiSiTfiWfxbTiH9PjQ==
X-CSE-MsgGUID: tpiN4rYaRSKKksSx8WRzqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="80405132"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="80405132"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 03:09:47 -0700
X-CSE-ConnectionGUID: yJiywze8RkKLMI0XLWu3qA==
X-CSE-MsgGUID: iSK+jCqpTNG18pw4cZ7EKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="258570234"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 03:09:47 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 03:09:47 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 7 Apr 2026 03:09:47 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.6) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 03:09:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UueguJAQx0Oej0v63SWle3pMz68XUCrlMqGM/Lj9ICY0v5Em+2CGSSj3JQ8NercHq9kyaRUIpu7zHWCZvx/ZAoGNvWJliOkyXgFlaX5QHEXRxDDCbTZBocK2QmFKALcoCZnyCXTVGfMU5e9Z1mKxdnU5v+gOOs2Ifni8HDhIYNZWWCYckfem2GE4Eepl83ZIKlz39VVZ8aO7USjulhkgGJRcEstMGxqCiwrKjovMje/nD92a7BbsnWUwUd+gwcTIZMj4P1ZGK/SrltYjXKyNZ7BzQyp1Z1gYvNjfbqpnHYw4A0mM3wkcbofcK+KGMvWGXRQgQ7fqsvzJoPRnsHd/KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0VMtBSsyy2VQk0DTf9x/e1129QeJpclfEaiQlDOGS6s=;
 b=ThMLXFcZf8G1XlRYIwlxZ88nSwMrziOt2LHswBY7pwE8Wn7HdKLp4sybQdHUbwuTCzlHYOAk5ZlRBz7qBPQh3h56GgOrQMkJ69SD789umoR0ctTkVGdvcLZ9y8P0wF/MNA15vlm9dxG3DLA2+EJL+9UKvrdYV7I0810N1fKPobD6nZ0yDxxsXNJ9KDGjwRYAxi6Vpwgs0mIiM5d27SYaT5aQtduCTMHW80UhjsZxFt0fZbx1NgbnXJlhct9whqFIbO7d/QDZ0+z74DFPFo9xLbFxfDkuUR7KkSEOz2+q0P9MHq0ecszKTImfsekHypaH5fv9MVIc8b2um9vnab52bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB3282.namprd11.prod.outlook.com (2603:10b6:208:6a::32)
 by IA1PR11MB7810.namprd11.prod.outlook.com (2603:10b6:208:3f3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Tue, 7 Apr
 2026 10:09:38 +0000
Received: from BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19]) by BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19%4]) with mapi id 15.20.9769.018; Tue, 7 Apr 2026
 10:09:38 +0000
Date: Tue, 7 Apr 2026 12:09:30 +0200
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
Subject: Re: [PATCH v6 00/90] x86: Introduce a centralized CPUID data model
Message-ID: <adTWx9JxGt2hUpC-@wieczorr-mobl1.localdomain>
References: <20260327021645.555257-1-darwi@linutronix.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
X-ClientProxiedBy: DUZP191CA0022.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f9::26) To BL0PR11MB3282.namprd11.prod.outlook.com
 (2603:10b6:208:6a::32)
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB3282:EE_|IA1PR11MB7810:EE_
X-MS-Office365-Filtering-Correlation-Id: b7ba6850-cd36-4480-dff3-08de948dc6b6
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: ccnbBXb7/6F8WGelWTRH4O7j98n0finapcOPIFjhh/UgmWxM94BbH1bYR2iyehhEkGdEw0Sh8f/emKOsFW6yYh4PfGkATKxLKTcClC2lCkM4rs4+E8szstZ1Jibxmx+RvBoJHNwEdMH/Ei+mMsacwea/wMDhtrVk3rjsdLGIR8MDYwD+fxLqzDPxHEcskAt+fhHBq80htig+zaQvQR+e08BxLb85QHn8Ln3E4Lsgg0shxegAZ+Rcat6zdTpA61+40pKzxgiFuW9+86Lrd7PzURnJBy4t740fCyH4jPB/fWaOvPoXWRE7zedpA7Pi3m8umS8J8YZ2OTPAQuz7L7mj3GIA25ZWzxRlltykTcuZjaEVvi7drq16AnSfttK0U7NpOhVOtf7B3pl1WXB3TtnZQYSZeynh7nd7eTRPqgsSBx6kq/ToakQoY8sR7agaRguKXdNE0644pZG///iAYaobAGAblJHGpLJkskeyEPKNA96wxBIZLj8Un3V245WFx2sYk67/cov4AfR71xdYH8MJBYpoVGE4yJAk3nphyWyY0KOjGGohqDmvwHTa/ZyZQAxY/DxTRurNa8/8i6rV8yuozOIM7pUBknIp8JL/+efCd6Ai7LHD2XXzvwiGyWfXWqvwHDTEk0p9uQBY0mOfMRFnuDphMBYwwEiKuIP6YCNctl04wnZUVzMqPUSi9S0KjqdiUnpi1YAuzuov2M7Tv8uf0WGZn4CMLZG7ZOIgWGjD1cM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3282.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?kF1xJJjGt6YKEiMXzPrWK5i2Ba8itpX6sBHjDknZ6gEn8ubX3QHT3aSfLX?=
 =?iso-8859-1?Q?kVG1174p1rlAXWrRv8qBbgwRx/XEmT8rLEQqcNPO6zLWlCuaZai1LFikgi?=
 =?iso-8859-1?Q?W2VcREvRzScrc3gSNpJ7Fo/4wJGInM/YD9fNGHy6VsT4c7q9KDHB2XxCj8?=
 =?iso-8859-1?Q?hoRX5Xvuy2MdxTtWnU93xwA38lnWejwYa8lBnBR2d6AHjyDm0pwcSb/YTg?=
 =?iso-8859-1?Q?sJi9P4xzTAgFXsyC+ssndaRaNr6cARKiCFs8FLAFpYssaj4uwFTePHHjRK?=
 =?iso-8859-1?Q?K9hJPwqUkeP/g1mzOwF1WIrln3n5/J3LpoinHfwrF51CA+1oWpZokUJBJi?=
 =?iso-8859-1?Q?ng3RejSE2506XwhSvSMxw7dKmrKFV5GqjAkdm/3tQb2kDAx4eWdia7M+KI?=
 =?iso-8859-1?Q?4NDGPycJ815TtJZGZn5oILuiDuQJnyUIqMUfEm/U61t6zCECnVKv2j/1Hj?=
 =?iso-8859-1?Q?Qyc3qeG/mQTeRBIIQGQljNCzxrBZ1qL2o7/25eKNbRefs4J47C2QsIxZhb?=
 =?iso-8859-1?Q?HI39FVckzMwRH7VSz3wEZyHac5LWa1dlLfjpibT191RqXxrjAs9TSn3MJx?=
 =?iso-8859-1?Q?3XXC9WTRkfjfKUW0WOE1e9Xlig7g6O2dfYt2ROlcQaHPvlmPc8Q2sfrXjK?=
 =?iso-8859-1?Q?FZXWDSVosVU4yyZnmD/HA2arzOt2iqeqmCJn9c/lk8Nnwpu3UZ9FgQbAN6?=
 =?iso-8859-1?Q?qsyPvJqFY7BkiU7R5lu2hxrCprn61xqVDRlwG2o3w+fMoFIFXu6wAuKulf?=
 =?iso-8859-1?Q?XJKRYDqAbUMaEYfUyNIU1MaX80BV/aQInbot9sRCNuSxLpd4woXyc0gntF?=
 =?iso-8859-1?Q?uieZsD1FvN0gQyl3+iScE7CM1PJYQBnB+cmaxrwZmi2gKfia+8aP9uAUyL?=
 =?iso-8859-1?Q?N00LZdufs0WCBNZbP1E0M7gFZWTtOTdg38+HS7pVdXXPvIQFo5IO5G9ama?=
 =?iso-8859-1?Q?nDJrN9o3s7OZw+GgjppgOT5yZqvWW+VPYN5NtJ6CrpWTMeBma1tvo+jkEI?=
 =?iso-8859-1?Q?W3JdW/CC6xUkcLDOelGaWp6qdgSevqL5A/OJU1RP4C+gJHKpwl2YZsGNNC?=
 =?iso-8859-1?Q?/AgpoPq298DNwrICOOwQ1zHZF50oB+vxMuwJguRmYhcpnU0FBM2PbLeBC0?=
 =?iso-8859-1?Q?PBrY+cvkns8A63alRBJf22clFUa5aIFqEpU3FwfFyWIJUUwi2DgeYUyPPt?=
 =?iso-8859-1?Q?Ns26dqP5K7WVfi4Uw7zRpo72L0Xgp8kq6djOFmcXyHT8tKhWVPrdNNga0C?=
 =?iso-8859-1?Q?lF1Oy64pHWprDxvoTUMFa2hr3c6fCpdKb1YtJzsNBBnqMSeZt3HOaI+vg3?=
 =?iso-8859-1?Q?fKn/kjt1ImdBC7BxaisoqFg3MsJIQKXMq/wPz/Kv/EcqcKtXlOX614OR90?=
 =?iso-8859-1?Q?6Nze5LvUt72tJ9qWn6Lz/UdHKNVLRUwS3QILxCSmsWfWESCz//BLyHLfhw?=
 =?iso-8859-1?Q?lZ4qnXfvD1OLP/usxjlKXugqoVCklYXUms1DCTuh5Dlb258Jljk6QPlsmp?=
 =?iso-8859-1?Q?BjN8qyMXgivDjSf+a1uFsS3S7m30lo5Efv6HWzGRQqdBxONDnkQP2w7Ndy?=
 =?iso-8859-1?Q?SqASOQC724wC0CMzwKKqquQEPI7x3NHd2etlMBKA0pBHi0XTzoryUsrCv6?=
 =?iso-8859-1?Q?SpMGOX6SyDu5WjBOn6/jdELWSOBba/qBmRmbr7/eesvTAEXB0QcsQnqIb/?=
 =?iso-8859-1?Q?OLJ+wVlkSBSPEgcBI7H2W7xvxOrxOLQT56cE4NYadG0do6fDyowwdboDna?=
 =?iso-8859-1?Q?Mnq5j3ovJlCsTtnd+LkYeEJnxIXnEnK4+b9QgTn1RqaPfV+/3g8QPnfEGp?=
 =?iso-8859-1?Q?wWcV+9Ulle4MpooiC4DUW3DiRrRefOs3Ggi9CJNnVTyBgqyC0go4?=
X-Exchange-RoutingPolicyChecked: HC8zBwFfNywH92EjrR9nR18aPNyxURntEuZP20WUFf2yy1Fs+dRBTacZl1dHyIkdNkLZT8TDFW9qsTsWoBwWIIGdpyZPBmtD0LNLwjkz1K1MIav40Vcb73QQBAOmDEkmz04au+6cZgO1UZ5SdpawDmDzReVsOkteshQ0xi0w+jCkftreP7rKvWb+fJQe78gsurC106ST28dir8UpA79cc37fRqWDMcnDjOy3KVFf/nddsK1mM6QXeUkZ7LZpgG0B1fZ8USDJfVuM3rwpAgrNY6Czjeg+7kL8YWk0skw7yg2UMiW8omx2Rvl8E4vtRURnwI9DIXGvKOPLC5cujQ94Pg==
X-MS-Exchange-CrossTenant-Network-Message-Id: b7ba6850-cd36-4480-dff3-08de948dc6b6
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 10:09:38.3754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4pRekipb3zNEK9bxkF+ixC2wqs05Pc3I7gHoZcQ4ycw8Ri1belYfdhQ97Vb/siMwHTAIcwHM08wU3b37GXaSqberIk+mVCYRnZiGEewpnRY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7810
X-OriginatorOrg: intel.com

Hi, very cool rework! So far I didn't notice any problems while testing.

Buy anyway I wanted to ask if you thought about including the cpuid_deps[] or
cpuid_dependent_features[] into the new cpuid API ecosystem?

Or if not (since this patchset is quite long already :b ), then do you have any
idea where best it could fit in? During discussion on [1] you mentioned the
feature depenedency should be encoded in x86-cpuid-db. I assume you meant it
would need to be first patched into there, then parsed by Kconfig?

[1] https://lore.kernel.org/all/acruJf-pyld-fTh1@lx-t490/

(resending the email as the in-reply-to got lost somehow and I wanted to correct
top posting)

-- 
Kind regards
Maciej Wieczór-Retman
