Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565B8188596
	for <x86-cpuid@lists.linux.dev>; Mon,  1 Jun 2026 17:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780335418; cv=fail; b=p3isqft8azhbHUkgd/SWfFni+y3GEDJsMyIGmQGohAlUL7R6zBYOYX9mn9M0zBKwDFb5GFTebM1eT3QnAivm881RvFU0uYKK6oLfWJSRumSQlTg4UDwNmbkPagvkOiWDi5YuIhUMwPTfRn0H0VZGOiSWFYIAHLDtQ/l5tLyFm7Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780335418; c=relaxed/simple;
	bh=y31cCBnMiy8uCgjIn9+ocrUxVYLd9bak1aqQDhQpugc=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=R5DNmz7xEZlW/xu8ndy1vOBJ3wiTWbc+zHX9trBTsb0zKRwAxy6OOM30fGzXLhnFuPRdFYp+mNBXr3+HQV3prhIkeeIiO2N4gkZp3PJkKPr7ErGfzSHD0UC+yNaN0YI6Iid7yrzl+YLwO9TzBTuFD5sKVhc3CtjNm2zy0X3uJTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FXl7vSmS; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FXl7vSmS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780335417; x=1811871417;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=y31cCBnMiy8uCgjIn9+ocrUxVYLd9bak1aqQDhQpugc=;
  b=FXl7vSmSfHUIJnuJotQFNm5FLuG5Whaw5dkRFCuvk874HMMWhZ7jM2Um
   CFMGb02juM4VXd/3AHRTVhQA72uVbXqP2wTmtnLQY1aAWmAlfQlkqn4Ik
   XnL5GSQHo5wcPoiG5vcHF8zNHHuQ7MyVAuUiNpSTmbiZmyvnAZsdRcnAp
   12CQ3AZ/ZuBU4Zt4OEACiFwnfLLybQRb5z5yNwT0RMNDxg/ZsQqHxMadr
   Cp8wdF3Cba8aqV7O7ovUnMwGNCpNHT5j6BEJe1QvTpzPMmkJ2s2ai3N1S
   2La/ZYX5GIkpSsYmXBbVbSfXxJFjnNpHONG0ZHuMCtLIhy+WTJWY+1/Ji
   w==;
X-CSE-ConnectionGUID: MGYWo/tHQeqMZBWItPD0ow==
X-CSE-MsgGUID: 0YqhTVLiQ1ir/VPM3MMtsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="80131166"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="80131166"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 10:36:56 -0700
X-CSE-ConnectionGUID: aH9p1QExQ4uQBsNuUE7aqQ==
X-CSE-MsgGUID: dLEwYztDSFylsqwsfGvbDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="245461275"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 10:36:57 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 10:36:56 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 1 Jun 2026 10:36:56 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.58) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 10:36:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PDFr67us+CoqTOFgSlf0eYMXh9pAQFhAWGlbYv0oXYR3VPf1YxaMV+ZB7Z057NCn8QTOfmqlqzn+CHAIbmI1ZpqCXYXaOK7vLFs8uIOmoRnL6b/mW4WzMg+aL/wiBqvHFsyj/hqWqpis4N1LtQ9txaVHQonacqZVWZ7wEZWE0RMfIlsWzJQGgxyXQcTmxyfFtc7JegDo/2j3mP72T2XRNRiaJoekOASXBW/ORTlbbGshhVFaDgKK61QDdVXyPzJZYqnUiza+bcOQRALFCqPxxhwLd75q38rJzYa0b8AGSn8HcNfJt4AKRj9HwCJ362Dl/4aymfmMPoEKLVeyiqnQvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F67+jXwi42VxHC2/6joIipjJ/iBQHYIZq4KeMOtOqPU=;
 b=phXg1enbdv9A0YZz+6VVTZWIWSFDBBCKpXtL1kwz8OwpiR5c5shcAXl6ui96A+W03mV8WXwl0JLhxXRIIb44Z2uy47HLp11QPPI96VNgquenX6RHT6e2yRZE69aZFoLnh97AxKGW2gGP+kKj5mBxp+TVFbjYhxclpl0D9F5iNbwIk5yDh42JAeNUEGHixkiwbxlO5b+w5mKrFJDX/xXogQtB6Mh41H64yU/dP7DXQZT2B/k5ytqH4VAXOQEwOd/lWld5PP++yyGD29WRsHF0EdZ8ZUzCtnB1Y+2u75t/wbPWYBaDDphxNJm10qAIG/nh8Vph0ctjyR2R3IadY2sd5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB3282.namprd11.prod.outlook.com (2603:10b6:208:6a::32)
 by CH2PR11MB8780.namprd11.prod.outlook.com (2603:10b6:610:284::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Mon, 1 Jun 2026
 17:36:53 +0000
Received: from BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19]) by BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19%4]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 17:36:53 +0000
Date: Mon, 1 Jun 2026 19:36:46 +0200
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
CC: Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, "H. Peter Anvin" <hpa@zytor.com>,
	Christian Ludloff <ludloff@gmail.com>, Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>, <x86@kernel.org>,
	<x86-cpuid@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 026/120] x86/cpuid: Warn once on invalid CPUID(0x2)
 iteration count
Message-ID: <ah3C-TNffTQl9-xr@wieczorr-mobl1.localdomain>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-27-darwi@linutronix.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260528153923.403473-27-darwi@linutronix.de>
X-ClientProxiedBy: DBBPR09CA0034.eurprd09.prod.outlook.com
 (2603:10a6:10:d4::22) To BL0PR11MB3282.namprd11.prod.outlook.com
 (2603:10b6:208:6a::32)
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB3282:EE_|CH2PR11MB8780:EE_
X-MS-Office365-Filtering-Correlation-Id: 4365d82e-96ce-4dd0-9f36-08dec0045ec0
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014|18002099003|22082099003|56012099006|4143699003|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info: 5rJQEUNwwzKRZkTJQBobOkW7UfQRuWi0D0OZX475HrMOAsXgFA9curvKbZ5GdBCRmm2qsquLcClNPaba3rxx3leR65/+DnSaafdKN+CEYnWfzfoXKtmdYugXQPcPuvLEwGje2dakVFm5hwGm1XP0unxxzV8E+KSkIMlSAusUqiRxZ1qHVDPr6fG7qrpn096FcE08Rl+bA/tYO0wAJ7miYjm9qPecVnYwEg6hrDY8yPYefm905zQAQ+zsWMLGk8lcpiklm1SJPuMYO1mtgmFLWEPpNaCadimsUXS+7vg4VrYuuungHSbyu9jKR9Fw1YPkseynVtSXXHFp9N7kYBt3k+QWZZc0UpkK11oBVdPdg/XQFpKyCTRfqMpktRqL+V4FW1ujgJglXQegoJEKmvT9oXLruR3QhXk6VCjSpmPkShcgixDjb3+iTbmfdTysrFuscfYkkWWHQdlcE7ZYeJ+IHRaMDGP+ksSPmUeKoVE8ZYKB4NakwzgW6hzIPbgRizD9J4/gx//TFXSrjOX9FJRgvU/kRt2utzVi6Iug7oGS4uipLjPR8sm+tK8RqRCUtaDAFKuMtEpa6oMjxf0MThgfErlQRqsPMvaCOtbCjXLwhr52gbvwDh7seOXUrygvTggfRJ9adX95EhP/+mHYPKX+KRkU2PvYFFGgVIZ8g7sOP2doQ964qobTWLuFvPYQym7Z
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3282.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?7RWoU9T13TXyt3DsRjJPWfPL3gaHGXHJDC+jUbIMPspy9+MDQ5D/0E+S4a?=
 =?iso-8859-1?Q?AbU/q5cCK1uX7wNJwXicENnVoZf/YKdLe34d4vefR+1Bdt0McTRWs/JnO4?=
 =?iso-8859-1?Q?Wr6VMMYJIudpgjElRzv6XH0KbiojbHkJwmSO9K79S6cl0IjlmhAY5NYmOo?=
 =?iso-8859-1?Q?gq2eQBMHsJRi8DZJVm/E7sRjMezFtSfyWRAqy6N9lAVA7Cmn9/dOU9ahHO?=
 =?iso-8859-1?Q?O2Hygdjkk26kpzpm5m8rx1kPF1AsDpCJBlomT6K7R6qgrWIPR8Gpgpvs5z?=
 =?iso-8859-1?Q?YXgYv100ZfJuklrKMa84sdIlrmxxj1ZuV0ff+JHd2OrbgEMvqGTfJEaQbn?=
 =?iso-8859-1?Q?EpESW85Ubt8QOJPmOQw9FVP9HgIAjBm8qN+4OeZVuK0ebZsyfX1fcO5XMt?=
 =?iso-8859-1?Q?1iWXOr2y/c/bsZOuutP+/A/eOQLw4jxjd8hbo0CrtvLE/uUI4Je2QS+ccL?=
 =?iso-8859-1?Q?z8Ris4dPEOy10jQK5fkGU98j4q6tdQaIKs3IdcVFgWkZYVJVxGQCjgl6PD?=
 =?iso-8859-1?Q?TgQFyDqP3YWXOzAyaoyadlH41qC/WocX3SOazirH11SheL5KVbtfsi/DTP?=
 =?iso-8859-1?Q?mbR6f0Pkzha5FxHM/gzW9t0cjz2KW1HI5xKogBe1B5WXvLONMwT7F29k7L?=
 =?iso-8859-1?Q?DCeyZZLPppNHqb4i2DIQ79POijD5QTwwrQsIDsb61GuDZfbF0ZdkMOKpC3?=
 =?iso-8859-1?Q?O+ww3xg7ia7VtimCSQMMGTDA0SHzxgIVAWBsRMHNIDXZSE3cC/ajvAbkQt?=
 =?iso-8859-1?Q?k3PKIobDJug4pI960CkWWiOIlRSrXtNQ9nKZiW1ftdykhceuIY8mMn7+GY?=
 =?iso-8859-1?Q?OJAhFj5YXYwJpq5wtJi/w/AnInjnB/NUo+W+Pgo/cITGJMrV/5b8OitSGF?=
 =?iso-8859-1?Q?rPJvKSQUCH09IXYdV4eEKZg0GyV+iz9LoK7jzZEbnh+X+V5/s8KPOriBCl?=
 =?iso-8859-1?Q?KVildfXVfisV+IuTf8lDRvKIUz6bbUfsvcSLTID2JDulsbzjueWnSOlfsr?=
 =?iso-8859-1?Q?CkB04R05Dy8mtdoab3mIKgUQO6nckWLOs4c8AFWpTnh3CFmsgnGMqnv1Ad?=
 =?iso-8859-1?Q?2WKiQv7J5vf5oFEyMlM/TaMLRMRvEJG3l6EPcB8sJbwwp15ennZ36ZhdwA?=
 =?iso-8859-1?Q?aPNv644QsjfgmDNKm084uX+syNOQM3QjjYfYel/fzFik+K46EFhJ/cl39c?=
 =?iso-8859-1?Q?fWvdJn77CrBV0q59RKiblDs3NrdRXzW31e1VxuMZwCtBDwwR7OnwgBG69S?=
 =?iso-8859-1?Q?UjpjNlJwy1KWPc4iRJA5o3PAUiI4ins3eoIZfLg2PzK0VVY93KZWYwTuX1?=
 =?iso-8859-1?Q?Ll0draQfWpQxrzD9Uo4iTkcxOFV0Di4LogPZb7AbV6dQl7u8EBziJFHBs0?=
 =?iso-8859-1?Q?58q41ukKUVCLxm3VBuYdSU18QgHOSIhWI4JYA9CYpyBdHpiAS3RWkyHnxJ?=
 =?iso-8859-1?Q?4dNrExHDmA/XO3mNEP+tdRdevrAXW80qg4BI3fETgyGv1U0Q3hJeQXgS89?=
 =?iso-8859-1?Q?zz2YznNYBHjMkHa8BaPhB0EoRzeUvQzv7xUN5m4hjDGRB3AH2TY434QeA8?=
 =?iso-8859-1?Q?GGz1gQ1jk43sC4hIkh6WOAj/Fxn1mt07bZ1Ob8XlHu6EfjcYhbH7/0suaP?=
 =?iso-8859-1?Q?lzdXisKGZHJ3kRCLwgssVNCVhjptREl/oL6bClUdd20lU1Oxml0toY1/dY?=
 =?iso-8859-1?Q?7S2a84WFSZIQUDfjDKoHX/H+xBahkr+xJe2ilBIgaFc2FQ8HAPST8Iwd/a?=
 =?iso-8859-1?Q?MurYImXctFWyPzsd/O76/skaqXHna8H92zeBxujDhnn8Grrg3es/LJlixB?=
 =?iso-8859-1?Q?I3wpio5WfanmKJk9Qr5HB973wlOqbm3DP53c5bRzXZPZOAUylIqj?=
X-Exchange-RoutingPolicyChecked: OTv/Mb+Q+FGMPm9U7dezVJ/Ft4dKUWpYCse/0Xk6o/Ac9PPkYQ26mH19Kd/99Ao0iK79lU2ukF4mVdpQC4AX7xiXHBPTnJ0faf7yE44D7WHe9rNViazjRATcUK1wa9xNt1WNz210P4DRAe70lTDacOYL9lISPzY2/TFF/mSsKyHz/0sQ43mYoxtdSdToNbQuj01snC1egG25/lIDGMPkIt0kmRy+bTg5LuhFk7QR/sADQhRxUNhSo+Vn2XnuGBNoSjZiz5BrDx90jtOx2uVE4v9V362O/1j67v2lbe7VQ1a74TcNJ31Y1F1BVRMAGn4IBZCWH+NysAN/DQk+3IVcCQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4365d82e-96ce-4dd0-9f36-08dec0045ec0
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 17:36:53.7555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7UVufqYgNzFfropdTfe9Ltqwj8Pz3K6DGh899IGBm3icBKrd57RAtuXH4zzoNbKj56EWIaR74nfo4uk/7Nf0doK3nOZTL8wDAL43EmA7u/c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8780
X-OriginatorOrg: intel.com

On 2026-05-28 at 17:37:48 +0200, Ahmed S. Darwish wrote:
...
>--- a/arch/x86/kernel/cpu/cpuid_parser.c
>+++ b/arch/x86/kernel/cpu/cpuid_parser.c
>@@ -3,6 +3,8 @@
>  * CPUID parser; for populating the system's CPUID tables.
>  */
> 
>+#define pr_fmt(fmt) "x86/cpuid: " fmt
>+
> #include <linux/kernel.h>
> 
> #include <asm/cpuid/api.h>
>@@ -54,8 +56,11 @@ cpuid_read_0x2(const struct cpuid_parse_entry *e, const struct cpuid_read_output
> 	 * keep the leaf marked as invalid at the CPUID table.
> 	 */
> 	cpuid_read_subleaf(e->leaf, e->subleaf, l);
>-	if (l->iteration_count != 0x01)
>+	if (l->iteration_count != 0x01) {
>+		pr_warn_once("Ignoring CPUID(0x2) due to invalid iteration count = %d",
>+			     l->iteration_count);

I think a '\n' new line is missing at the end of the format string

-- 
Kind regards
Maciej Wieczór-Retman
