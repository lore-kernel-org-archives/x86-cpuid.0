Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF54021146C
	for <x86-cpuid@lists.linux.dev>; Mon,  1 Jun 2026 13:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780321736; cv=fail; b=EB8ccOygk2WqqXBPDAWujJ6w2LpECS8+NhAcaogm6IGmTWbDMShKlnZ9VD5nQUemto/t9HXS0F5W8KVsdfi+hDWZYliLZKGU5ZtyyViyBpHihcdZsseZ/DKETpF6FSNrHgyQsUJM1CqDbKCMbmmRKMlr5Uzwp9UbMl6dH5O0txo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780321736; c=relaxed/simple;
	bh=GL7tZ4tmQ2l3f5OEwCtLDzw3w3fb/Ks6e/VGlp6dv/0=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pEsOOHQAzPlgM20KOrKdrptc4lziJ0FBzLYkj+DYA9Ss/hJEJVS/8RNRGNjOhBanfCrJ1bjFPDYAeYa4a1snXN1KPp2EwEBHPI430ez29fIKdPi90eCHem9mQq5VwXBkR/PuEcPdJHvld8Y3djIKq8geiMyY9pKfiK+Zbmg3ddk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AZk6Ql3B; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AZk6Ql3B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780321736; x=1811857736;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=GL7tZ4tmQ2l3f5OEwCtLDzw3w3fb/Ks6e/VGlp6dv/0=;
  b=AZk6Ql3B4hX1pXQOpKXXyDhlg73quQvZL7WUwvBJ7K1gzZda1TloEQSg
   diR/wXSaYQmTbCgtLuNsfhJnaSA0mpnNW3bg9RJ4X1HNLhyRnZnMHawSZ
   ga4d7L0R8pET6tGSw2beiYdrScZbneNF9UpI4G4AXd3HfOMSgNkKS65eF
   FClCqSG5msZMCtooZFrugXnHLSCQlU3zxullMHwvSGjwxdgcznfbi1YJe
   9YEOkYm8anCQn6D3W3QyWXZUY+q0m7NuP0uj6VLpJ/qTgefS1LreFBiTU
   AU6xbuG52VJD4T/z2nNypAZgSSdiFQRTenoYgeN+v90jbamVWmlOXUH5y
   Q==;
X-CSE-ConnectionGUID: n7uRyiMwSAOKS82JAOFQwA==
X-CSE-MsgGUID: FtzX01y3TyGcAAkxiBOehg==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="91390116"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="91390116"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 06:48:55 -0700
X-CSE-ConnectionGUID: VkSjdyywQza0S9wD/84oLw==
X-CSE-MsgGUID: pAJNcMN8RN29cimxwlw6lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="245402177"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 06:48:55 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 06:48:54 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 1 Jun 2026 06:48:54 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.70) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 06:48:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m8KMU3z/htJ9NWtgDaomrK4H8z5cF/G6PKw7XgFjrdjkL+HpZwjBUXPq43YZFFoi10QRTD4ejlAVHDaPcV+q9BFWxCnN5vDlu5XWgak2IK1wQy23iLFuMhz67YnSwtDs+vfTcqheWliqkYVEdJYCeVUqy4tlk5j3r0tlsgXtVfHgHM8jOao7ztExv4tXbEL/cAl4I9oYWxs8AXm0GBMR30OzRZhdWdspsZ0gFWWtiIhh/acI+/5GQCos2qDXvJUIGy4OnKk7ttQ2/sj43TBrYJc0DSVmuqV5HoSlMi6bL7gMEOr6TGmIU8h6T6irVa4Lv66tkMRmnogt9YcThU2MsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5A4Sc75ist7BxlLGTJpcq86mRPREIRkuATTbwwy4PAM=;
 b=QQdiKb+bv4GyuzWM4IPMQfl6M55TteZ3YRo9mUHP5mFl2jgV78OxageSs2SJcB2/D1bp2TDTl55Wqg/dRsJe6d6kwW0cO1BIemjD7iMyaV8gjsMXPh4d+3dVXErtuHygb6T9AfajS9WoBByPn32gbKwE9r94Rk8LSPqvMrx+w08/tuD30Vp67/Q2GL4QWVvPF4F/ucgbIxfTB7ga6glLCA0ZN/zu6l4nQeOE7yDBBoDc4f01h70fRGuTMHaDK39RZ45Lm+mqz6sew2E4O+nx5/D7Y2zm7tUBfajljgpfmr5FbOwZ9fMYB44Tlc0rKqI/WLxoMly5ZsOXfvFVia8zUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB3282.namprd11.prod.outlook.com (2603:10b6:208:6a::32)
 by SA0PR11MB4751.namprd11.prod.outlook.com (2603:10b6:806:73::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 13:48:49 +0000
Received: from BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19]) by BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19%4]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 13:48:49 +0000
Date: Mon, 1 Jun 2026 15:48:41 +0200
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
CC: Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, "H. Peter Anvin" <hpa@zytor.com>,
	Christian Ludloff <ludloff@gmail.com>, Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>, <x86@kernel.org>,
	<x86-cpuid@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 057/120] dmaengine: ioatdma: Remove custom UP local
 APID IC code
Message-ID: <ah2NjeaFfphluN5H@wieczorr-mobl1.localdomain>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-58-darwi@linutronix.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260528153923.403473-58-darwi@linutronix.de>
X-ClientProxiedBy: DBBPR09CA0043.eurprd09.prod.outlook.com
 (2603:10a6:10:d4::31) To BL0PR11MB3282.namprd11.prod.outlook.com
 (2603:10b6:208:6a::32)
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB3282:EE_|SA0PR11MB4751:EE_
X-MS-Office365-Filtering-Correlation-Id: e7a62f53-8bd2-4212-9c4b-08debfe481ef
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|56012099006|11063799006|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info: pUUgbov6nybhznMwuG4IwSCWnZ/ZNZr2nymyNmqx6jhjxpt47Bdbdu8Hh3pBbc5Q2U4qCj9HJhlvbiHy9jSlANMgZ8yHORPS/pqjhBxNd/mxaBayM2RZ8/CE1iNSk353CVwSaLM5f1TFFv5YzuFMcdMZvocZ50XqdBdLME/KvBGaYGIKNUF1BMJGkrLA404v178W4uk+SGHdU3LO6PVel72WuDjD3CmeJq5miICEbiXLRQi8mZwRUDdnfpQqWaFyStQx2GQNdf+nK+LTneqqkPSx1Ugv1A/An3gl5SZzfjBWboASORuPNUMooNourjKB9nchAXxVa2GZI1PrZUrTyKUhMtGHG1W5wq2U1OQyIer4LzuorFi7Hnlp8mnTjRjX0Lo4G6z/oYb92znBy9nn9moPyUGH+OCM4tGauiPR9z2sbFZBM3WgOwbLXhm7H9ho53nsktivsY6gwjPkmV04rYGIMM8xQHCpwMgrazEr5ZQBhrWFTvnCtQMauMhXmReLaOD7eP7MClYMxcmHrf3vKNIF3Z1j7SYCzyFKSQEx6llps1Vfjh6A64rjXbRfaNgmDW4kEUmndJPO4rRf+25ACeoZKt7t+ZtDLaMJdTEsYFoYrDGgyKDyh4sBN+BtwuG1OsrUihI5zqsB7OqkPR3KsDNVLgjou00Yb8+hC6CrNvmBDeOW+lQ/8Mgd+igS0r2W
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3282.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(56012099006)(11063799006)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?UXrLnumuMhfJPCj2bT1uHY3v1fAbsK+Kw6vjCQAzfZK4Zutno0dZH73Isk?=
 =?iso-8859-1?Q?X/8TKtH0FwZuCzxImXWr7RX2tax0+mLeje3xARWCKQU2Laf6MCzZd+I0en?=
 =?iso-8859-1?Q?5eDByufXOL0qExs0tMfEjLGbs+j2aN29IlXkw94VbvnNEHq32vUdXpToRa?=
 =?iso-8859-1?Q?ZbRnCfmBufPWhQeD3HIJI24FdRm3u6Vp/Z3lJ55Q7BV4uiVwe93giIP5+E?=
 =?iso-8859-1?Q?z7VZ0pkthTfGVbM3tp9rMfgj4S2teQn5PPwPwe2NO7nmPVApM9IpoKtQao?=
 =?iso-8859-1?Q?ljxHes+pPVDqK5DxhRMJklPUua2zrTd0B4OosZ7atQJmqZnZHh/yqJpZ1C?=
 =?iso-8859-1?Q?tdIgVQwGvg3jzdeTOGfEcq14ud2mx5XJUfa+gDyzC3YfkCa7vcDmv8N2T7?=
 =?iso-8859-1?Q?Q4vb2qN2kzJFbvgN12cB9JQdE8NV8nzDr5YcGbvNalCps/hLJ5onOPGjFn?=
 =?iso-8859-1?Q?fZiHyZ5Q0IPsPlA5BJzmbilOBrkJ2b7mKAnkKp0lqe/k+uzv6AB2gq4oGt?=
 =?iso-8859-1?Q?7S9xcO5boF0osyYP1P6PJogB0lW9y/MHD0Os3FBlU08Q5/RhNBIIx/OQiF?=
 =?iso-8859-1?Q?CiPT/b5SpdR7D8JX1/JSvbMWBKYZPQgO7/h3HU1Exy4S0mFTP2QsI71sGL?=
 =?iso-8859-1?Q?QeO58g6VC+aOKQ4Fs4oxk06XyyM0e/z5Kb6lSwQDIhg/vyaZ1nAqtK2SUO?=
 =?iso-8859-1?Q?ovRaCqhSyKyP/raPMLxibghzCstgMyRdpIHjHf2ZXSQYy3eTH2PeBKI0I6?=
 =?iso-8859-1?Q?n96xtsoAhrHkdnx3klCbhMLqpxjHTmoe//utbXKm6wXVO5/qp/pPqd2O0P?=
 =?iso-8859-1?Q?2cYbNz9Y+Idq/1esiw1ibjU4OPBkCG2JUYGHZHC4yYtnLt92j0EnHJft1R?=
 =?iso-8859-1?Q?Ib9sq5SxB6IppHm3ca1Lt8Rl1JCrrLctenghq3LTmVKps8IIWjPYNQ9CcG?=
 =?iso-8859-1?Q?hSONmfiREu7Gv9GfR5RbMC4sLv4jC/PAO1CWKQyxeaRh/NXTH6VrRq0Yob?=
 =?iso-8859-1?Q?nWktoQQqFmLHNbL0Oo+L2XmtKMIGWcxXdXp9HoOUFO6NCHVCruZ9Oq7dgj?=
 =?iso-8859-1?Q?KkjLtGUolz3O40fSkgLwP7Lv0CKhPYiWo4HEDEzFLM840RySRaXzXI1udW?=
 =?iso-8859-1?Q?8uTH9ICVqjLNx+WHa7fGajEp756WQi5xP0n11Uwz9Uf3qOizyfIHVDHGG8?=
 =?iso-8859-1?Q?pqof8v7J3D+XU6/yf/gPpqrBxPK/yB9g5DXr5SpKaNHmhPtpanFtPVCTF1?=
 =?iso-8859-1?Q?cPHllNa/zDsEI8yiUFXymRSM8AHFxqVYs8qgZWGsHzLM+TNR3w75m4uTp5?=
 =?iso-8859-1?Q?m561ziP1rIgs+4vLE4UViYh619WKwl95E9nj5TwFm+bRX3RCoYX+G9blgH?=
 =?iso-8859-1?Q?OKJR6ltX8M8/Pl/en6iCELfRJGGphsuKpxLe9vp1986YCC6m0jPu/62p1G?=
 =?iso-8859-1?Q?GaOkdNTw6FKF8gzgXZO9iSuFNEcidvFMzlpsLg1R44+QZnj1BeDRRxGOCz?=
 =?iso-8859-1?Q?M3Mv4A2l6t7yjQZ0mYu0wrBcd+apuc7prWyDX1Nn0+2PO30xJ5NX9X0awf?=
 =?iso-8859-1?Q?bUMUqYcN9aLTZENwyXAuRFCjjhaIcQZD4V+KAm4V26x1VNuZtFbQH/tCGn?=
 =?iso-8859-1?Q?LnuFJKCQYdbdhC8HWb6kWHnyXtZrxmjR7lyG1Sm691+KUhyk/Zg89wz7f5?=
 =?iso-8859-1?Q?Wy7UOZw4FYxdootyxFBdFjeTxLEM1+BAQQ1GxAEcU4GL3pvKkbKDhe/d/r?=
 =?iso-8859-1?Q?dY6K8zbH5OkAi1snhv0/kbPDiugNhaZZUzOfFnUsVXevNaylimTATnzVJp?=
 =?iso-8859-1?Q?KL7EPIxhBU0H7TvL+eQKn4q8rWlWFmKgCxiMR1YlXYVkfFqwZWyw?=
X-Exchange-RoutingPolicyChecked: NJWY28YpnG9lDy8m7mcYFqJGpP2/zJgRIG4mv7oKlu3KhEhrrgS6jdy/gEg76HBOQ6rzLay3chB81lApGThh1nEz0HtdzxCcsERJqT09yuGKwZsh2evwBECWssORsscQwbDUbnA7X9W17Mhv+5K/YiREXzu91g0bwkcEkLUK0FSiTrb4/a/ym6sfbUEG7jAtTe2H+Ep8SRQyf3z/cywREihOp0gIlUPcgTn5fHeJ2AOgVtMQJ/aquz3KaHrgzXR77xwWdo5YQzi4uo4Y01i+UlJNVlDcSmdm87djQRKO9fAIgdIPAxjYgoj67uysc1pL09fxGZG/XgoxY+PdpiA7/A==
X-MS-Exchange-CrossTenant-Network-Message-Id: e7a62f53-8bd2-4212-9c4b-08debfe481ef
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 13:48:48.9346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2d2JyOS6jSlh1SB6jsepm8Rs8BbjnRy6zGUv5693n6jcRkCBTHfHWel3WcWchSbm33HxJyclPfBF2mMcUu0PBt/hl9udxYpaNZYtLl/KmP8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4751
X-OriginatorOrg: intel.com

I think there is a typo in the title?
APID IC -> APIC ID

On 2026-05-28 at 17:38:19 +0200, Ahmed S. Darwish wrote:
...

-- 
Kind regards
Maciej Wieczór-Retman
