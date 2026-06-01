Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0F63ACEF3
	for <x86-cpuid@lists.linux.dev>; Mon,  1 Jun 2026 14:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780322429; cv=fail; b=s8MzQgS6EjLQZb/RTe6VlMvKXh6DgvxwwOE1BuXHL+EOK7vbr/D5XO3dfcOelo2JOabP1nVdDg31rwR4npUlmP7ZTz5GPliEZGiqpiKJgDM9vc6NA8dTC1bTwPDOr8nQQ638IkwW3JPHE7CIC5Ilm5+phN0OSrNxB1gIPE54Lws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780322429; c=relaxed/simple;
	bh=xFLjuJbiJRawILVfHs/HZaNh40iU4Z1xX2UkuzPGN30=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HNlnnOT5IqWz5BN4KBr2H/8y5XtYvx+PZStiWI7f47WqBcyAetnkty6YhqjSg9Mb3QTsuGcMz5rl0NxwkIvXV/si5IK2om9CcsUhUBLuAWxyfctFyr5xaK7pBpup/I/1SRhs1x68dTmXGLwq+zRulNIMXsODYEK2NY3Oq9idZZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rc32m52I; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rc32m52I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780322428; x=1811858428;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=xFLjuJbiJRawILVfHs/HZaNh40iU4Z1xX2UkuzPGN30=;
  b=Rc32m52IAiAHe/pdFDzwhz0fwccsPpeX9NLWqGWouf6t+TxFyz7gTSth
   J9hoELZKtPR2z5pUGI9GN/NKFMWDtyL9nNq/n/XhIVg7dwHYgIbO6+OTy
   JuPqbzabhBbCBbj939TexD8+AUolsJs8+dZfyMHEwXHMBqg4tQvJdpxOo
   Nu0bQsuzckTioLlwqCBz0e8nXIfL7vh1SikkrHd2yMVlpCVzF+l/sK0ZD
   icFVKrn/L3CsKFruuaRJ+O3yIRkxWa4rbFHfu/cshSTq/LJGbuJDD4i5R
   KdnXxkKDkkHn5itWMcsaOeaiya2lXF+xaeAzEV08WMvO1+HHLjhKzs2yf
   A==;
X-CSE-ConnectionGUID: X+/Ak6fnRi6OeSVtzDWWDA==
X-CSE-MsgGUID: DcJHCbugStG3bX6/mQKUJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="103749628"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="103749628"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 07:00:19 -0700
X-CSE-ConnectionGUID: qkQRFDi1QM+IXJZiaWz4kg==
X-CSE-MsgGUID: YimqvJIlRiyy8rAR5ZDnhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="239163092"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 07:00:19 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 07:00:18 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 1 Jun 2026 07:00:18 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.36) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 07:00:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=anJLwRqTsN/zwcw/qfSuqJbHnuIcSRLJK96SvVQY8U44zjk/IsieIRgD/qL9jvKv1IB/gO31mS7eUikLJmI2aBUY+H2KAm7z2nFF2Zw6YuuEVVi8AxPV2wkWX3lloJuwQeTIrm0DRrVeIWcVRcU9Q+cXOU8mIAemG6PwXka0eKBnpJ5/dFHC5tRKuLpd4s+1CnpCFSnJJxNq9Abe4Dan+is554Cyy3Y4EPCO2f71qA43FviAGHPfUg0UJTiDNbifYZnXGLmS59F+uLRAbg87/j6L9bnIeWaNXNjHLsHvX6nrk6aO5S0XCRcCExZ0kdSJttImwqyJOcp6W6d9H8/q2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQLLcy1VFaIfdJeVnyz0JuUSXMx7Vx/d4PmPsjL+phA=;
 b=gwZm3IKwDCXWNVa3kwUhUFUNXrSw5Y5M3SqH5ZK0SQPgJ+Xg5tfKeipQGIZY5vmJaUMcU4xiMJct7MuytqSKvyLnPGv/6Vo45CPoBxQHCnvRg72AYA0h7En8NEsTbdGf40/DcuzAFbYxjLWUyvfJUICAmDKn/Us3ukzHRRnlJ9wjNMW9l75Wf9aY4/cY2t7Fx97H3K6454QkmD5lMU4jKQ9etqrnT0rYQ0iM10GtUnL8pP/It8ikgP2crlC46XOEOB9/ZKB2jd+5bp5vxiuWk+e5Pl5tB+azprvMCNQVATaO6VhJZCdBsKhUrYSsDzEozMnG+DjHLV70T9wySLZ24Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB3282.namprd11.prod.outlook.com (2603:10b6:208:6a::32)
 by DS4PPFABF58482A.namprd11.prod.outlook.com (2603:10b6:f:fc02::45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 14:00:12 +0000
Received: from BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19]) by BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19%4]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 14:00:12 +0000
Date: Mon, 1 Jun 2026 16:00:05 +0200
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
CC: Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, "H. Peter Anvin" <hpa@zytor.com>,
	Christian Ludloff <ludloff@gmail.com>, Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>, <x86@kernel.org>,
	<x86-cpuid@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 095/120] perf/x86/intel: Remove custom CPUID(0x23)
 types
Message-ID: <ah2O5hPRBe3z_ebI@wieczorr-mobl1.localdomain>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-96-darwi@linutronix.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260528153923.403473-96-darwi@linutronix.de>
X-ClientProxiedBy: DUZPR01CA0295.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::11) To BL0PR11MB3282.namprd11.prod.outlook.com
 (2603:10b6:208:6a::32)
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB3282:EE_|DS4PPFABF58482A:EE_
X-MS-Office365-Filtering-Correlation-Id: c8080a2d-2015-4366-f8e2-08debfe6199a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|4143699003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: hPcc3XT3+ynU9VYayBvfWAkd/L5EwOJTq33qzdczVs7lY0pq0RiQWG8PifaSq7bfrHQkNH3zpfhwvHSpZja2fgcrHGMuV7X40XgiItNltlXVEBF4Sfm+TDZ07Q/mcsyUSPXBMD9unIyfNjePWkx+i9BHquSEOtPVvxrEi6pI+k/twAarDVPLWOH8qsqqPCMQhGCo/Qxl7GH5gpeg77XdSfy5GFbOgyFMjMQ0lwImDtsIQNxW7aCarGnYaupNbeJimNIOyvz0NRu+bM3uG28LszycHfpU5IqNi7xaGh0KfNpQDgyF0iKiPIVMEY5ubLJdiPf74iu/FsiWzRdB8J0q9MJBKfRcIo9F0J3vXJVlabKukx7Y33v8qwAofHGy/Qu23xaxYZSCpj+khWuIGSr9WlWphGkj271WDOPzoUCrEfoQ4lug6Mz1Uhn93GW0T4bai3HdTjlpQrkW6hP4cszt5Jr1pClk9BRTrjPUfnYzv2EZw4DlBdFC7vSPC71f9OQkyKQ/B0KZJNxVm2xHbXP+vwZPp/0DIfwWivU7KM2dvFaL8XMm7aETVMwBV2d1PWOCCWwR+BGTaEJkqecXKnYpjIDEA2QLjSJT/eHSVWC0CJpnNm0dfbGddbc4jpF78SaX/ybTrG8IMTnKp/3ymT8NBSgVRjdhkUxys8nIhH61seOKr0IAdL/uLsRb0I9MF2ZJamTs9jV0d8pq7/3VffnWJQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3282.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(4143699003)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?3RY9UUweFQMQ083xi81Ba3IRr6fU9jbwQSPl2ubhw8oJZcpqzfx3pBkLcD?=
 =?iso-8859-1?Q?Vp7ln1+L1Ks6unnpTzwsaKm8oFFl0NgQ6frsu4YLKTdGUU7LdWFWPQyrTb?=
 =?iso-8859-1?Q?JJR9mkgWPADnEsHQXQtjubof9VNoTvxDxHuUogispzQCg4ZGNX01TSHh1f?=
 =?iso-8859-1?Q?TkscaCC6Z0Ejvb2bpbLOWX1hO7cF+RdZOyxibfgverzjmqY8VBfpqmLYd1?=
 =?iso-8859-1?Q?qEMoVhKhUdL1yT/MZVL+qGNGh9bpn+CwZvvFU9pszsHkn7yMs57lTguLt/?=
 =?iso-8859-1?Q?hIvnm3ZGSfl3yIACr6H5cHhxl926QkOIAHnG8iGn3nKd0tu5zA4ajxFk1a?=
 =?iso-8859-1?Q?8y7lSzQskkoXZlUst7+P4fRO7beZswnYJshAo5ssi3yhaAQDIbKvpCO4W/?=
 =?iso-8859-1?Q?zvUQT9bUQpb5HpNFeb4uVYnhV94fea/x1CqHUAHUsvZgujNdsySz2/AuAS?=
 =?iso-8859-1?Q?vAse//OKJBerUG+DrLo1IIDVyLEQsbiBJ9HWvZF+f7d3JWNXRaVIj26Zcs?=
 =?iso-8859-1?Q?vV1YS7SGZRGlM8HmtEQs8QT6P3dlCxg9I5Sk/lp4cPSSV/3UA6zNaj7IVM?=
 =?iso-8859-1?Q?oRv8clMHQ6b3vXERhhggLWMPga+EnBrDhWj66h2PsIvwBjBJpZ6jbf39+m?=
 =?iso-8859-1?Q?6Vpm5x4/igU2pcOR+E32Uctax0+6KHTlWcOKYarUt1FrIe6N+BbPUWNgYj?=
 =?iso-8859-1?Q?cV917oXEhM5DX8nmkejTFw3lZnG9lXVd3WEUJkq7vijRNP8sJBzpuba2Do?=
 =?iso-8859-1?Q?ZBg/cYxmalEb/9VCemyWdeDu8d4QsC+cukMAtac2w0C343vaXAEhEVHTfo?=
 =?iso-8859-1?Q?J8ft2RMnLrK7rpXzwWJ9Hx+ZE4SOQ3D4nGO3z0zwopcgovFNveTVcztk4u?=
 =?iso-8859-1?Q?o4Ea2rTq/Q4U1TXOX02aSXkJM839gVLA0RWwr4TJ7D1Md9ox6ZBc+75tpl?=
 =?iso-8859-1?Q?LcmGxm+Ov/sklzxvCL29/VQG65vO4Cq5jlbUTUr0297LDnVR0GapBMXQFW?=
 =?iso-8859-1?Q?3YQs8PXexadsSzhxAvxGO/UjIjFqXsOWa8ATbpS1jjUnZqHaDsZfdLmThG?=
 =?iso-8859-1?Q?1K9ZlGb0Uef1r9eTJhIbAv9T19MVT3LjanvghzusH1siZRAfVqtgQELSPp?=
 =?iso-8859-1?Q?JWYLxP60iU+DIie47psIY+DI7B33gypNMgvzSB8YsqYHZssNbpY/3sIOj0?=
 =?iso-8859-1?Q?xb3NjryBTKFjC7oTQ18mfWY++5pBsUNVydhaTs1oaEBiNHSdqi02Mhs3pv?=
 =?iso-8859-1?Q?yxDQ6q9dKVx+QwB+Fb7ELM/1W5T2EaKzKdS1BO379yldgzewAO5Q0cxamm?=
 =?iso-8859-1?Q?FDZ3lW2zLK6TxML0AYuMelEwWtAjBCMvt3EvBTr3wePcRcTAIcU/pYOia5?=
 =?iso-8859-1?Q?AZVn29TsiNJs1NokbVexpudZst+Zw7JD/euzrXDuqW77nTG/Rz8QrLS+9Q?=
 =?iso-8859-1?Q?y2HXCUmWcpQXMh2hMGQny8jLzQno+qoDef0vHkT/TrF6EMHHHx/jBlXI8f?=
 =?iso-8859-1?Q?32k+dqxcAJaRdtW5YwDqkrAlv1c1yvz0yRal2dDk3IXQXk4WoG8hvkR2eg?=
 =?iso-8859-1?Q?6qfu5vUXCiH2Aa9eEvUjdnbvM6PaCDoFEor+WKSXV1EuttK14SNF/3bKxx?=
 =?iso-8859-1?Q?bqX6Bw3OXT0jHsn/HN3jTvYXv1KAlxyhJwrZ/zup8hrG1Pe3/2dcxqjk4J?=
 =?iso-8859-1?Q?67u/k90fmtCyGNE3gQMmunTV9HEgZiF/ncQVp7pPAfFsZe00d9fjZPBoMN?=
 =?iso-8859-1?Q?iMywH6o3ymgHrqTLDge6aPSMV3tEocwM+6wXZGvugmUBtNeRqd1xRAhRc9?=
 =?iso-8859-1?Q?3LpwzEy01dfLUaUz0aN4Os+LoL/+O8m3LeCcdiB3POwStW/d2S8m?=
X-Exchange-RoutingPolicyChecked: hLtBw3fB2OHAt5YfY9O21buLZ6wtxp6OkBPrcBZg5+jtikrLVfm4+1UkI/mPuMpgKFNx5Vul2ZxpSwSdssrqYsWgTsELZ7hZ5fjbz8RZimrh16xbVinYpkM7UaDqSyCeEL3QJePDBGJrogodTnZfIcCpobRLiwTE5Kn3WsudtpRrA0LETnaMqJWtbDEKQgmmnY7Dk3VRuxn78rNVGCTNSduz1IipvmMCfPbtnO1pppkcv2XTLs/GjPdU5/tOVXbGgesb9SQzv/OP2k3sRszKFcoYhzhVgO9Qg2kTjp36dslRPeYdxHqIVKHxfdBrglySkYi6b53fT11DPrMdhG5EXg==
X-MS-Exchange-CrossTenant-Network-Message-Id: c8080a2d-2015-4366-f8e2-08debfe6199a
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 14:00:12.8524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lQyRvbmrdAycM7GYjZnxvMdKKP++a51GLGmRcHQ6Y1oPz350Z2zT7XdvZ2lx7PIw9mt7/UoTxn1a9aLQXiIeX9ZpMpPIKGZqLLXzUHnLj/s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFABF58482A
X-OriginatorOrg: intel.com

On 2026-05-28 at 17:38:57 +0200, Ahmed S. Darwish wrote:
>All CPUID(0x23) call sites have been converted to the CPUID API and its
>auto generated x86-cpuid-db data types.
>
>Remove the custom CPUID(0x23) types from perf.
>
>Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
>---
> arch/x86/include/asm/perf_event.h | 38 +------------------------------
> 1 file changed, 1 insertion(+), 37 deletions(-)
>
>diff --git a/arch/x86/include/asm/perf_event.h b/arch/x86/include/asm/perf_event.h
>index 6270f4a26a59..ff844cec22ab 100644
>--- a/arch/x86/include/asm/perf_event.h
>+++ b/arch/x86/include/asm/perf_event.h
>@@ -157,46 +157,10 @@
> /* Steal the highest bit of pebs_data_cfg for SW usage */
> #define PEBS_UPDATE_DS_SW	BIT_ULL(63)
> 
>-/*
>- * Intel "Architectural Performance Monitoring extension" CPUID
>- * detection/enumeration details:
>- */
>-#define ARCH_PERFMON_EXT_LEAF			0x00000023
>-#define ARCH_PERFMON_NUM_COUNTER_LEAF		0x1
>-#define ARCH_PERFMON_ACR_LEAF			0x2
>+// _CPUID_TODO_: Remove subleaf 4 and 5 after defining them
> #define ARCH_PERFMON_PEBS_CAP_LEAF		0x4
> #define ARCH_PERFMON_PEBS_COUNTER_LEAF		0x5

As I wrote under v6, I think the TODO comment and the two defines can be
removed?

-- 
Kind regards
Maciej Wieczór-Retman
