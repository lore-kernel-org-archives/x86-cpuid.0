Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6982039184C
	for <x86-cpuid@lists.linux.dev>; Tue,  2 Jun 2026 18:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780424839; cv=fail; b=n6FTMVW//9c+3dJo2ObZJ975VoJIPT4Ti8GvVhAK4fE96JX04Z1OU0gkeK4/U5LBHtMb0YNaI6qvz8blitSsNn3MbrdWKpd6Sq17WT9LFb+lwuCKEhe0jy5EKi9PFcb9OAONTwGzDvfk9XhtQSkMWlEoVAx/HBoMenTUo0yMPx8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780424839; c=relaxed/simple;
	bh=cnTHOSem/7hqas1ZQPCGJhZuWD7skOQZ3ROgIstrN9g=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gEpEYwiPj9U5yWgt28e2WsUSwyyfEYSrvwecDart6GsnDNWAlMFY2Q0ON5LBUMeDp9EYjotdXPzIEcGJhEdsil6J9QPAbwWel9ijawDea9xirdP7nRRBC94zha8APoc85GcYHdxFYJrun0d3PBrcxGDwCb1A6Cvi7EyI640/69Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VALheIo7; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VALheIo7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780424837; x=1811960837;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=cnTHOSem/7hqas1ZQPCGJhZuWD7skOQZ3ROgIstrN9g=;
  b=VALheIo7hS90W2urkgXfLrZy9OphALhVzVNN5VKYR0m3xF+PeS/v5Sq+
   Hnfr7mwrnOKET9q0zSblIc9qArE/N1PWyxF2OMFgPJWwMvh1dq9Us84dR
   KWkkV7nd2da++3/JNAeyoZyI1mpouojW/OsZ59zHJujzrpJb3xg9MV7jV
   KynT15cV5wIlC9GAZwijpe8P4NJ4OAwytIF0TvmgNWMk6F2cnpBmlL27W
   5tBo+hFOtacntjfw9DsHlZpVci9gQBvWavG5cLWJuilwvibkzNVUBYhE5
   alwx029V2l7setwFi8dnPPGyAw5JdzAa6EO6GhsRFt+p9zj2sBCiD9uzA
   g==;
X-CSE-ConnectionGUID: IBKZKh+yRKGIuHuOpLEwvw==
X-CSE-MsgGUID: /ya0W3/mQJe0Ogf5XOz1/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81081670"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="81081670"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 11:27:16 -0700
X-CSE-ConnectionGUID: /QZpjaWzT8qIHDdoblA2QA==
X-CSE-MsgGUID: Otbr6vzqToKntVl3UH5neQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="267853350"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 11:27:16 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 2 Jun 2026 11:27:16 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 2 Jun 2026 11:27:16 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.23) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 2 Jun 2026 11:27:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SvnFG3AXT+nk7dh+zKm2YbceXrprTgaIbSkVoRh+py6BmK3N1TQxRzROmy5a3sKLXbmRblUxdeQQQqdbnug9seDAx68nJE2xFCQjwhbYJvL2ovjTfZtbtViwmk+KBsLv3XOJYlgX+tUFY9lT8N3GhRM83siEwMSPfNd8AUSS4o39Q1A0QlxB32foEq+j3+ER7G7idXJKR+MjOp1d9Dsl/VBh/pWEd2dlKKDkwIwLj6MpdvBk223PX8aj1BtxaAZfmmFNQsc6kbv/5W3XybxZ8YQhOozQRc72oMM27LWsNGZS02ezytUUYjpo/v7N1b5P/kETcHLsQUv5aVKGwAwMrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QtCIwFzvBue52hxUuzCIIn7uVhLtquiN0J0lyo0ld7c=;
 b=ty7D+tT/hKE9f1B7fxhKta+uCCk8Q+ZgVPmoZswDosHYFtGZO571fxq4RR9LCfx+168rJB0BsmdHT7GyOlqQowoZvIc30m8TKQt+OIsKMv/mrYLtKP7UuHFWiH2eC4ndqdfUvOzCgUJX8h6olzwEZ21+nsR8rBdMVUwbREyDHaU4pE4KqQw2GJSIs80xx1JVOgfNLSGsnpn83OjNsSqQLSs0fisU4cfEHWcuRLQ6TBTzO2qRZ/4HwU9N3MZClGKco7pwQMu3GkfOTsJS6Nz/bzHZgBXC455/kgOb4a0VKOoyZTOYUv0rehZlwg4F1Q0I4b+gBTKSXkTDR3BtBTF+7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB3282.namprd11.prod.outlook.com (2603:10b6:208:6a::32)
 by PH7PR11MB5942.namprd11.prod.outlook.com (2603:10b6:510:13e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 18:27:10 +0000
Received: from BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19]) by BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19%4]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 18:27:10 +0000
Date: Tue, 2 Jun 2026 20:26:40 +0200
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
CC: Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, "H. Peter Anvin" <hpa@zytor.com>,
	Christian Ludloff <ludloff@gmail.com>, Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>, <x86@kernel.org>,
	<x86-cpuid@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 107/120] x86/cpuid: Parse leaves backing X86_FEATURE
 words
Message-ID: <ah8eCgGy-oBhgX9D@wieczorr-mobl1.localdomain>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-108-darwi@linutronix.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260528153923.403473-108-darwi@linutronix.de>
X-ClientProxiedBy: DB9PR01CA0019.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::24) To BL0PR11MB3282.namprd11.prod.outlook.com
 (2603:10b6:208:6a::32)
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB3282:EE_|PH7PR11MB5942:EE_
X-MS-Office365-Filtering-Correlation-Id: b8e13ec0-af59-4493-ae01-08dec0d48f11
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|20046099003|3023799007|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: 0a+V3hUDU2H5K7j0j7g2j54SBoAtlvjOWeMI6sEJnxQJp6yKW+yoIMuo2Ic5EHIKQZ2E9CTuP3jN7wbYMj56Fkt5B7J+axa5GAn7RdlLFw3CfNgtSE8fT5ClIjjIidsZ9oHLLYg8Q9uyhb0c1yBiaS8Tx5uMVr1q86TH1UYfx4bdJAwysw74IC1OfVCwrVacYlhu0HI57ENO1zL3c/TBUxMG1Lof16gC2sK6Hf2SE0rzzRjFexDJHlOSnDMOdfGNOlLTOgjvmu9WofV1l7fLzl7su6xI0eEGtyQYmyJHKpDlE2G+7Nzfk+3IXZ8bP8ZMtGzPJ2AmdhMtzXG89KJUeB9Gb8dpX4pIXjy2e+EMzXnbQHILge6HJsuV2gCOYnMuE/kmUXUvWjpKFpBIUhsjAoYv6iq88oMLyv3NrS1PBDWbWOWoftSPBe2Xvw+pjlr6wl+8zBIZrsl+EGncQjKUYemOLTqS5eduAPBcg1TNvjSq8HRsw2XDVPU4Gb601f4D6fpA90BG6ACiFxgpgHvCIhOLyKeVMiJ7nFqSi2nUT3K0wkiyp7nI3svmbkzV/uE5KlZAo8gYCSp01nqd3mfDn1X0lKZUI/7/aXWwJrmx256d31qMazau/qeQpFwgGrpUS3sapWHFRE7NlTz5Rmfv5ywRM2+QfLibvKCarJTSyy0IKcJxoQRK93iArqQkOkIq
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3282.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(20046099003)(3023799007)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?80oXgE3Wf3KA+AH87bbEP4aXCJKZjnf9Dacrqhe44gqT2oYpDAYRajyqYX?=
 =?iso-8859-1?Q?77pqSZPHHPSWy9ggIxGX5nVQcmBXCFeMFgLl/wEuWi9tm3xB5f69O8RauI?=
 =?iso-8859-1?Q?TDNItasM9382EYaPTkxOMIvRpv4oafuIQngqSPfJVntF4x9DscbmnIau04?=
 =?iso-8859-1?Q?R6S/cpnoB02NL64h9vgwwhU2Lxyt6nZAE/h7dpZLNcCKjYXk7FPhQf3YXA?=
 =?iso-8859-1?Q?NcMLZWWlJZORxIp3hOxsRi2oJ19m+F1wbieU5fVnwX8upYjNCh8UMWxAZh?=
 =?iso-8859-1?Q?XNIzoI7f+TSqPmk+p5vXDIUamxPBwuuStkrNqDg5VSFT85sqnHBcwAZDOX?=
 =?iso-8859-1?Q?5c9P/6FgvaIBj0MnIW4rf7FxtTGW7XhAt/hltfOYgaXstPl2Z+jE3IsEzF?=
 =?iso-8859-1?Q?xORM0SakGRnu3Bptj6oK3vsdHDC93OTAExtbMe6Plk6o4qeZtGZRr/YmAK?=
 =?iso-8859-1?Q?dbgxzT8OUzKxPhN+PMjtpDMX0X0Gr08xriUIRa0J4eMO7QQJWkfUpECJfl?=
 =?iso-8859-1?Q?PzDGlWRqhXJJIRj2MEMe3qWo3Ljdn21Ehc9zFONbonjePui9C2prj0xL6i?=
 =?iso-8859-1?Q?+N8fYm5K5Os9Ia8+49UXcWlSdyu0Q/fL/vEK5+GQ2c8cEMM1WsdOY9pn3g?=
 =?iso-8859-1?Q?m4K5pCMU2w0PbJn/WdeUyzpN4EOl1Mp56tv5kGevb0+Y+853CJZWtFfe+w?=
 =?iso-8859-1?Q?XJc7Uvwfe8Za5EAlLWtk/inkyIz/2pdkRZy3QLvI97G5qllZleRuoVrW3i?=
 =?iso-8859-1?Q?RK7mnFdnFKZz6Tt9IDkMh+dmaCW/6O1Z9E8+5xnCHYWw7XS/6Cf+AfhU4c?=
 =?iso-8859-1?Q?4pBff2jK0q1n57SOLC6Ak+vdXgCUe56e5baUm6P7WleYe9Daf9JzfZVpJo?=
 =?iso-8859-1?Q?iPSBSMuGOWT81YjMh6Pik0DbHdXzZ29g6DyO8IBgMCT3KOpoLt2nfk44lG?=
 =?iso-8859-1?Q?XRwWnOp5I8P/PpUuWmiPcHYSlBvjY6JQvFByxLD7gylyqkzJRRKK8IA47h?=
 =?iso-8859-1?Q?nJ5wxMAw8UADkae80FeWjiUXVKLPPXphvroJg1L0TTY85l8ER5Z9bW+GJ9?=
 =?iso-8859-1?Q?lry3iANwD6G7kPCWPsh4DdqHFsHPT2nsmHDO0aq+/e3tDCMpIq/MYUYjKI?=
 =?iso-8859-1?Q?/e56MT22f7L4ni9zjIxYdhqc8DHUhsxxtnK5HgUPq57OBFAFufKkVeGaCg?=
 =?iso-8859-1?Q?3JY7CClzmHQdSIbIP7J6tmpndbhp92aJ1X3VtSyJyB80X4Bdn5wlj26cg0?=
 =?iso-8859-1?Q?7vVFLyIw9mPlGHqfHqNXPuWrn0D9BBSucRyrIS/xbpa9rF85/lemgdHEXI?=
 =?iso-8859-1?Q?YAFLOmCC9VtN/Dl6ffpPEwlZGgzW6ICYE98njxPXbztcPzgYvZZW1QeQwm?=
 =?iso-8859-1?Q?YUIvlPdvcf0dvJEZkeFMlwdLn7jfHtLDRQXRUnoJ394e8YpaEYEP2g4jHI?=
 =?iso-8859-1?Q?JS1xs8WhiYdN43LMIB0KDkJxUVX8Cu5CBrSjNsDShYzCSa/QyB8xMG+8vV?=
 =?iso-8859-1?Q?104QPlJpt8v5E8YB6rWcZeIXGn5PVyjN7paBKBLOq7Z/CqnUHyBlZ+tlpc?=
 =?iso-8859-1?Q?zSoz/34EGrgqYJY6RlSZy22tShc7ueuTMOVQa1adTgQkr1QS5dARxpqBpN?=
 =?iso-8859-1?Q?v9eXoLwB2H1AisqXCHigLpKF/Qx2xel/DTlpM2MybH4E6XkBNhG1nmigb8?=
 =?iso-8859-1?Q?zVixOc6aSa4ph/YtWFc/r/MI2u5MtpnsWKByGtOenlohmRNP5LhP7cBrXR?=
 =?iso-8859-1?Q?bgLe8NnyQVrszAIwzDujXHCJ+nKjPsOjOHS+JMBouTTpp7+BvPCJPV0CQq?=
 =?iso-8859-1?Q?l6EzYfEZUTOplyyWvxCp7ez7hprxvlc=3D?=
X-Exchange-RoutingPolicyChecked: HOgYN+ON9uc+dm/qF7EYFwrAVtNRHtOZPbzQv4EBcAcGOZV9stoc0zT2+n0QAH/oIkVjSp7x0ciWNLYTl9p4wZUK5E7Yw2/3Oo2cA7Zj8nBizBg/MF/THUmV08IvXMwryqNJSsZe1KhKtAeogAaSgiwoR7Hoda6XM+5k0lBh+5jCyxkKl7i0Rvu5ZtU/yqKhIaq3hnGfOIy/gbJMo++S+0Ls4L9CCN88kcnfUHhY0Lmrgd943Mk1dAbD35BX9xhQJwJK1QNUdIL0b57P85OgvvUR2pMf971kLYijtyb5VXK47flaHRsWmcoXCgFUCtaDTQJsVDjdKbpx7P4iDpt7xQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b8e13ec0-af59-4493-ae01-08dec0d48f11
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 18:27:10.0542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v33ETITHxFUjyHe9ZGA7Z/lQgRyWLXA0Uy+ElrepcQGif1zb3PmQn5XdoqmfAubrTEUc+dO3IqR8kk9WKAq8yYVJvUWKCugj0pj/0RyQyrU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5942
X-OriginatorOrg: intel.com

On 2026-05-28 at 17:39:09 +0200, Ahmed S. Darwish wrote:
>Add CPUID parser support for:
>
>    CPUID(0x7)
>    CPUID(0x7).1
>    CPUID(0xd).1
>    CPUID(0x80000001)
>    CPUID(0x8000000a)
>    CPUID(0x8000001f)
>    CPUID(0x80000021)
>
>where one or more of these leaves output registers back the X86_FEATURE
>words at <asm/cpufeatures.h>.
>
>Handle CPUID(0x7).1 via a custom reader.  Its availability depends on the
>subleaf count reported by CPUID(0x7).0, so check that first.
>
>Do not use a custom reader for CPUID(0xd).1.  Per the Intel SDM regarding
>CPUID(0xd)'s subleaf availability: "sub-leafs 0 and 1 are always valid".
>
>Note, this prepares for later changes that will route X86_FEATURE queries
>from cpuinfo_x86::x86_capability[] to the system's CPUID tables.
>
>Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
>---
> arch/x86/include/asm/cpuid/types.h |  7 +++++++
> arch/x86/kernel/cpu/cpuid_parser.c | 13 +++++++++++++
> arch/x86/kernel/cpu/cpuid_parser.h |  7 +++++++
> 3 files changed, 27 insertions(+)
>
>diff --git a/arch/x86/include/asm/cpuid/types.h b/arch/x86/include/asm/cpuid/types.h
>index 7671f8d24014..1de66781cb5c 100644
>--- a/arch/x86/include/asm/cpuid/types.h
>+++ b/arch/x86/include/asm/cpuid/types.h
>@@ -214,8 +214,11 @@ struct cpuid_leaves {
> 	CPUID_LEAF_N (  0x4,		8  );
> 	CPUID_LEAF   (	0x5,		0  );
> 	CPUID_LEAF   (	0x6,		0  );
>+	CPUID_LEAF   (  0x7,		0  );
>+	CPUID_LEAF   (  0x7,		1  );
> 	CPUID_LEAF   (	0x9,		0  );
> 	CPUID_LEAF   (  0xa,		0  );
>+	CPUID_LEAF   (  0xd,		1  );

I think I found one mismatch using your lovely debugfs features :)

Specifically seems that CPU0 mismatches on EBX in leaf 0xD, subleaf 1:

	Leaf 0x0000000d, subleaf 1:
	    cached:    EAX=0x0000000f   *EBX=0x00000240    ECX=0x0000dd00    EDX=0x00000000
	    actual:    EAX=0x0000000f    EBX=0x000006a0    ECX=0x0000dd00    EDX=0x00000000

EBX reports 'the size in bytes of the xsave area containing all states enabled
by XCR0 | IA32_XSS'. Because all the other CPUs are fine (no mismatch) it looks
like boot cpu didn't get updated after the xsave area size was updated. From
some digging around I believe the update gets done in
get_xsave_compacted_size() (MSR_IA32_XSS is updated) Going back up the
call chain I arrived at all the fpu init code. I have no idea if this is the
right way to fix it but the below snippet does eliminate the mismatch:

 arch/x86/kernel/cpu/common.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 8c52503ae360..2a4fa4760025 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -2566,6 +2566,8 @@ void __init arch_cpu_finalize_init(void)
        fpu__init_system();
        fpu__init_cpu();

+       cpuid_refresh_leaf(&boot_cpu_data, 0xd);
+
        /*
         * This needs to follow the FPU initializtion, since EFI depends on it.
         */
--
2.53.0

-- 
Kind regards
Maciej Wieczór-Retman
