Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A9D383C9C
	for <x86-cpuid@lists.linux.dev>; Mon, 20 Apr 2026 20:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776715667; cv=fail; b=DqoWzh9wC1/K0ufwiaFeKXD6/g9tb8gUGEhD9ea2T22/+wTmzaawmVDZdB8B8JGNUJrwLhJXPcHVkYnITtXgZEE50qz8K5Qdh9fr95n+4BvzpwlW/5APh5D56vU9e5HyJTxCmjORW5n7hybfe02jJ++3jZQkUD8JonNIe8iIwBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776715667; c=relaxed/simple;
	bh=g8T9UCPSEdx1e5wINRpY9Kol6iDuv+4Ifuzl/jZHUys=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mYQaBn5j62ZTBizGhx54noZ+Jnton0xBRzQe5xDToAXPztlDzKWxt27lWOg/GXcVblppg4MZtWpgtiwJqKRye3Gr5czdE5RDKqZSKiOttlvU5KXflY9vQbFNobpzZvLxI+p7O7Y0a3upyFvpXWUl6qZONf1ntcdI19yZJFFQV9c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gzv7YpcT; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gzv7YpcT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776715665; x=1808251665;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=g8T9UCPSEdx1e5wINRpY9Kol6iDuv+4Ifuzl/jZHUys=;
  b=Gzv7YpcTqwGzEu34u4pxBq7LJ51dKy3eg/i6bv1PnJvC7VfOwVxQ15j2
   GCRi9g2FFWPBqMXa4mRPNJdOF8ZqaseIPEioB/IdrPGhzcFWQAplEAz+r
   tAEDDcWOJugM2/jLh768m2/rav8rimDhTTkUZEmYYdXEh1vkNG1PZZXJT
   ZYbJz2Qh055OByQavNigBCeaZbrXKycWiVohJ/x2UTXK05kOJxU1t/PQT
   7L9MsCr8B6cDzdtLzx4RF2tbV2TjEvI9Ld/My6rjdbN1VCcITmJIgxgfD
   4Z4QPnALVXuU9iXQGTYYPLFQeAfuYbrxcLIRCD/I1Vh1AquVk9I3SssYp
   A==;
X-CSE-ConnectionGUID: qlszhRdvTzO6vKsBFoSycQ==
X-CSE-MsgGUID: 79Wma/RjQnqjAt3Grhc/DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="103103867"
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; 
   d="scan'208";a="103103867"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 13:07:44 -0700
X-CSE-ConnectionGUID: a9NFHz7jTautfpIaYlBjJA==
X-CSE-MsgGUID: iXER+REXSYWCo/DRWka8+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; 
   d="scan'208";a="225334379"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 13:07:44 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 20 Apr 2026 13:07:44 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 20 Apr 2026 13:07:44 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.14) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 20 Apr 2026 13:07:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IN7YmDpGS/Bww+/nBrIhllOtC8aY5Mf7aVuzm3ju8MoINwPqqhRrHdjWEi5gKzHkG1BUQnga4QJDFyud9xzp0/v0mN+pPrV2hYS3s6GbDwnaewe1TdBi869MJ1UIOivt4ZuYGlHU8gSnNKvS7Y06hwXxkr3MtQygUIDB2iUB8NDp/r8/aQjO7T/OeDUmKQNS3r2mkdOXLn0eywbwfDlhwjq1DI8ufqeI5ozbKWSXrQtpWZ4LT6FkSpeWhcqCwLXXdCEEecCBQsUZji/UI2P5GXBmXCto3XTx3gYAofnIywbhT4PM9SBB4OwafmT/aHiCq6XBJTZBAmH/pZxvtTAKxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9dqXTARGyL3vy8hmd1O4ZWW1OfxkEfl3nvi4DhcaHMY=;
 b=hujbrCXSC5ZiXWXmpT/az58NVUkwHhavBDli1h5s7rxF10ye/psqgrJosejo79PSvscX37EvsjvAIHT4GuA/C72N+Fx/4XcQuzWTvEge00DqQuDlItWelacGrUQtwsS94YInUAyFvUFgVhSYAgngLNroY0hAPaIxJF2lTZeNoo7GdeRyB1YitQIYd6g+UKvwJC20DTsBBZXFoyhYCfeY3jieqQqYicpaKnB1bysiXbi7JHg4XEWMLtg9oOVIyVwjd9rJTptP53YdkO8mgUVJTp4zx77a8hxWjZ/1uGaNkTOaxuY1PH2MkeM0i0Kx3saI++2YJD8y12eCLGUusj9YfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB3282.namprd11.prod.outlook.com (2603:10b6:208:6a::32)
 by SJ0PR11MB7155.namprd11.prod.outlook.com (2603:10b6:a03:48d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.12; Mon, 20 Apr
 2026 20:07:38 +0000
Received: from BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19]) by BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19%4]) with mapi id 15.20.9846.014; Mon, 20 Apr 2026
 20:07:38 +0000
Date: Mon, 20 Apr 2026 22:07:30 +0200
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
Subject: Re: [PATCH v6 65/90] perf/x86/intel: Remove custom CPUID(0x23) types
Message-ID: <aeaG_zJluVqkg3k8@wieczorr-mobl1.localdomain>
References: <20260327021645.555257-1-darwi@linutronix.de>
 <20260327021645.555257-66-darwi@linutronix.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260327021645.555257-66-darwi@linutronix.de>
X-ClientProxiedBy: DU7P251CA0013.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:10:551::34) To BL0PR11MB3282.namprd11.prod.outlook.com
 (2603:10b6:208:6a::32)
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB3282:EE_|SJ0PR11MB7155:EE_
X-MS-Office365-Filtering-Correlation-Id: ecb553a4-c492-45d8-6ea9-08de9f187841
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: RKVIP/wtyQztyScXocfFq3SS48fnVg+tcGTRLXkySGCpaTXv0BzFxjcR1sG5fFZu/3qYNuVEseBt+vNiZabTQ6WA/pj/D4Hls0yrHSWZ32P3HHL0nzNUrf0+G79IB4isZQM5ffw6VsezHoiLsUJ38gdDgkSaSLqqRjLyVFnfPH02hQ2NnnUKkDdw04RiFHwdPG1Pag30lP0H0lv1QvGUraqyhlC0zwKrJYe+rqIp9N5sfZ1vGGOHujEupGVovyD90XQjnNKcCx9XLREVyWYH8HFsYA4hT0sRujxK4M6cffdW75sFy9kV+OZulOYHv5eht3EfhlRQQymVdgfq3vanOzdM3ut+yR7rc9vvAVrhigaZrP30tA/fCPuE4iXjMDfT6SmysPg0+50rxWX3l0N+WseSC3Nn/BwFoCjT5hStEUNZiBTBKafgsIhjtR48L7sgwI4GlvGXt+pb/0ZA1fSLFtrql//3hcn5MMsndWwlYFiTv0JhPdgfq+/7lou59vAJ+KbV8+NPHjwp3IuF0vW9+W6pIg0niSbnr4LksaQsxfOlW2EIMIxa5jK9yVsPA6whpAwpCNtaxQG+Zh9lY9IPvW8h0vIIL3U+6AKzbZVp70Y6494+kooVQivL4+KQCL18MqJ5UJnQvvH/5FLp8R0Q5RfDWamhS0rLrwdI3ShGfzjZnMYJ112y4QwqspTOOOgWgy7FWyR8wtkHsq0a93ocAS3DMSdBzooihcDZtoZFh1g=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3282.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?SfrCvgKZhbBKFThiFWVNvpQ73VQfnd6QxwnLoTgsL7EVgC3ORSyxe9SfIw?=
 =?iso-8859-1?Q?2rh23781TR7NYJlleIHr+au4465IbmPxFtthGV1O5Vfpp9rPJtQ9VZtmqO?=
 =?iso-8859-1?Q?2XM7ZQWHpQvD7ltAzy0rPbV58pMA4ylidU1PvlMmfU5hWh+RYVF50Z+P9I?=
 =?iso-8859-1?Q?j+FSFuZMCp4zYg4fSfwEpxkb42SmojH5DMepVb44xetlAulM+SeF/q85rF?=
 =?iso-8859-1?Q?inX07nTr8+WDNUBzF9LbJbQQHk0h+T7EaCcap4HQfWLmoOQIiSZiVaQym9?=
 =?iso-8859-1?Q?H5lMVLyn+8bgOwiEpmPJnknlnQXQVRgHYEVN98XpmiQMnmaQeXDKpTW4Zn?=
 =?iso-8859-1?Q?6sCxkdi+5zI2IUT7kurHrOq+905CbTgkld/Vv5+TUs8/4dZKEXPL9ZySR8?=
 =?iso-8859-1?Q?IDxtpcldvIqPoKBwyxoUuGTH5ONnR2kYAu1achp12Hl3IZM4voKgv+Ul9g?=
 =?iso-8859-1?Q?fa7HUc7xC0kb+I4P2ZMMmVRs6cmPVfnw2xTYfSWLYVgAwJCjYJ27IvmhoL?=
 =?iso-8859-1?Q?lEcAv8kjPcNnHZuB7g1vr2HS+2qVszK5gY12LNpnDMz4kaUrJegZbwPGQp?=
 =?iso-8859-1?Q?HIwZR56sVoNjSptjj/Rk+FbMMcSwPEj2QM2zIE9O0aJ8m8zgrToRBkPRaP?=
 =?iso-8859-1?Q?2Jq3QgX+ZJIcI6jIzD2zrutDCucRJWTcRqVfk1x9eMQbtBcFa/9lbZIqd0?=
 =?iso-8859-1?Q?2GEnhLrZOyQnAam8OUtgjppJLb6wAAhxuz8omajLbrT2rA6TZYXBJ51Hhb?=
 =?iso-8859-1?Q?6xidot6/ECfJwC9oiFMEJ++aUdHzFUfwE/QrTsKmTfn8r179dbrtKmoZtM?=
 =?iso-8859-1?Q?C6AWd8RUTLbzdJGHBkkmAz9AYIvUyTysYGJX3xVl3y6WWOMv52gWKI28J7?=
 =?iso-8859-1?Q?pRY6KorL5+qBe0EUXX4JPKg7SmbEQb4d1JIn0Hk5YFUW4AOvU1xBBSKB7z?=
 =?iso-8859-1?Q?pxNO02rAZex6YGd9jSPxhQyO+XzAt69osKyw5sjLptVI01hPPw3VKMAQTV?=
 =?iso-8859-1?Q?0rgjcE3GWfD9joMePmXfZxFbZHksZAS+TZlTFnmppDPcCTSxgEvITH95c6?=
 =?iso-8859-1?Q?Fm7ewQjsBMHWqQyi++2+05lWTkKcUTTHC9NMSRCgOHrV3AvcACAV8Xfad2?=
 =?iso-8859-1?Q?l7qq2sEUi+ZW6eGAgi0QjLa8UDBHVslgEuUaG0VN5TRUH5pFLKwOaAfAss?=
 =?iso-8859-1?Q?qBw0OqpqCjvTdRwAKJtsW4pRxTPQ2+B7Itbs+v48P6O0YSahN5U97jVM4p?=
 =?iso-8859-1?Q?Wpisd7oEcrsIXTaP4oFmYpdaui1LfdN3XqvOc/ED9odLlIwQBTRHZdFkyh?=
 =?iso-8859-1?Q?8Ws4s/9AD7E9oFWG02n84fOi6rY4CkCX4WwDTLnr4rHXWTxb9wbI9aj1s8?=
 =?iso-8859-1?Q?VrnHx7VzYW65PDkfLMi21aJcBktBS5w8Qgqut9tflSAdbFHWMsXOqwVG/1?=
 =?iso-8859-1?Q?XoaTaKSZxY2XKKpLBPYgh8LzlPsvErCKpyrY0cixG07NXWcjiB/95cm5l0?=
 =?iso-8859-1?Q?P5AOlyahKfLNT4LBysneNNVuuu6gYMGV7W0B8wgOKze3P/0OUTjDdFWDDM?=
 =?iso-8859-1?Q?t2msAhPGAjpwnF9W1FgrlRI9ZEzAGQlZ9XLGNHMKzWyadK6BVmWQPClHtl?=
 =?iso-8859-1?Q?JEvsRSuUlc9fthLBhRKKQ6S/2+A4oqExiG0BFTh94WxdMK3sgM/cbPFF7w?=
 =?iso-8859-1?Q?5tZHTYHjjoHX75CgIgmMEt8Zi440At3uuUMiESUZxixdwUCHOpIp3dq3SW?=
 =?iso-8859-1?Q?QP8N6J4jSQIqcwAYJoI2fO97IYV9eXrU9xv1pVi3KLvG+YqdRmM5bCJbdR?=
 =?iso-8859-1?Q?KWd7A0fwaO4NYpNlqV7ArdE26yGjQErS/+2xpYzt+LACKzNjz4AG?=
X-Exchange-RoutingPolicyChecked: FmJd75BsSKTkZv5LUq+72yvS4DT0UBDn9JBRxpdlmjSW+dfwH5fYgJFd2t4u235Z30hYW2Q89QdFWdEF8fvXVCqZQ69KVpFGt+UXxeoMplICJs1uZbHSPaSlfTx8VDGAB49LMJSg6vOsTYj4RusKkhiIvQ4jijq94YkhK0F5tj+0YSXcwj78soRYohpJc45hidCzobfQ6Nq9Lqa4a+mtEm7VMLTyVWiecfFfEW58d3+IBxETENE1TANFgbRDCTcZgJnwvpZhx8x9vxIRR7xJweh8UCXhPKiByLMLPj75efm3/RApEequwSsXKLIEpaNeEc99uA9jVFZE6rMEKXNp0A==
X-MS-Exchange-CrossTenant-Network-Message-Id: ecb553a4-c492-45d8-6ea9-08de9f187841
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 20:07:38.2607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YvURjLB6EHuE76gMV84mLn34z8b6R4I0tCHy5IXhgracKF+Rv4DPnMSwQDkOeSTuH+XLq/mEZ9eVD1AbnfkAWRD2Wns1XeIqxTOiHaw10gQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7155
X-OriginatorOrg: intel.com

On 2026-03-27 at 03:16:19 +0100, Ahmed S. Darwish wrote:
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
>index c57e6c9231aa..5aa07710af12 100644
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

I think these two and the TODO comment can be removed? I don't see the constants
used anywhere anymore.

-- 
Kind regards
Maciej Wieczór-Retman
