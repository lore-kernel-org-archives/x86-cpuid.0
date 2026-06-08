Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F8230675D
	for <x86-cpuid@lists.linux.dev>; Mon,  8 Jun 2026 09:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780910587; cv=fail; b=FO/CqMDEqtL7rb9UYvsIkGK5vddKvtvGLuJfy7Rf1ESf2xEo0wZn9hUo4nc24IuN34lyML1WHZ5M/RfvAl7b+6OB8JxANBviSgmG37GyNDmnnsVeiS3GZNZuY19Ml/bAbA0V9fgvp/Uoikgqmu+dwAud0xwcyI0vI2fiOTboz8Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780910587; c=relaxed/simple;
	bh=JY4LtaIC9OY4uNs07QmCZH6ArCKBXR58ZMK0J/PPmws=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NGNYfgySYabt4umPu0D28qF0WAAfuF6CleZAdsk7KbE3tAC3mlipEfbJwBqQg30W/nBHPr3LWV/cSgLC/v/3F9DJmk22ECbF/5hcpMLYFQmaCwHnaTAbeM9BBg7u7PcMjwCHMMNKyHmmWpJXGW72rHQssKYpNdDMR5ooWEv+MUo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GrbPRKw3; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GrbPRKw3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780910585; x=1812446585;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=JY4LtaIC9OY4uNs07QmCZH6ArCKBXR58ZMK0J/PPmws=;
  b=GrbPRKw3/cSxhWeY1qaBqGdc8vS0+vfMhGFF0RbSlao9q0xhN0I2r4uf
   LyIptbELMm7OPO4WvhvncCUf9P7/F9nb/sKuJ8F5cUhXewIqdN42g821k
   zwTbneV0nAKplantOLuanaSy0EbVz5PdxzFxjF5FJJ0P4z7giek03cTP0
   RIUCrBdzwZGF9qZW0AJuooHG2wrLdF/3PxVfW2wyCk/7qdUG+UMjsMrrV
   4iKjgIM+lo7kTKK0/lxKnV5Xt7GVHz2JSmIbu7l3kc+Akyi6ANsyG6pHx
   KDHdOhayl0YgkU4cJiK+1KMPffMzK6apO30Ci9HGNB/0J5l9P27EtLudw
   A==;
X-CSE-ConnectionGUID: 5/JuPiXJSiiD9d8u36eiuA==
X-CSE-MsgGUID: 8Uv4lYBfQYG0B7XJlgV84w==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="93126866"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="93126866"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 02:23:05 -0700
X-CSE-ConnectionGUID: lKEAqEgITeyhoeiAEDX4bQ==
X-CSE-MsgGUID: pCdPdKRYQ16t4l0IeHEcyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="243046154"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 02:23:05 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 8 Jun 2026 02:23:04 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 8 Jun 2026 02:23:04 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.44) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 8 Jun 2026 02:23:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gSBUt3aszGXIA7v4yyfZZSX5A4/ChLGehjB7OwrF+DUmlGfntRjTFBNP6TYSLrTswISSXPEer2wxIdN1VnDv2V/b6WClUkOsXbnFNDwtNQ1bNvQpwsZ7TSpwEhywTNOx8ys7Ul5S4vs29LrbhU05EjnIhs52x36s9lBpIbIha75XomTHHQNcodEu1azujckLRQPfQtlpG+yI51Wy5gri++aLeDEXKXVAbCPjnemLnHhRK2nbrl4h+smualex3OtNCCE1bSqXtjkGWOrTnsXGPh+22IOZng6mtQ26SufZaA91K8yLGjVCuYCuy/PwwtZt7Ursb26/A5s6d9qfxxU0AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nb46RDI8spIVLe+Rzjno90m7upZZg26i4IL+/fxNMyo=;
 b=noKZDaxBW8BUF8uvKUAM1GVnlWxDpukRSQDRiSn+Wz6dVcm4y5t34EBoIPCR2A4Bhd5/eO74qdOJR3QjmJ8YKZGBi6rKcKmD0idoZZOxHg9Nwmaayadsdir33EqLLYmlqF/4/e1DqcmlgsPFa+4uMb95um2GNzW3/S+qBFP3czWutygFHVRYqVyVsS3jHqNov//X1u1Odz8YOQ2ZPfBCuJhnzoAVRgBieI2qb0fQXB+TtP03Rv1tXdWKkPWAnv4m+vuZZeefU4O52bltFba3+hCxfdeOpKojKq2FsmuL6n9zD5hikbCCh3ysbJmtmXY+ZXyPfeUjrC9zQBEM5fTJ0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3288.namprd11.prod.outlook.com (2603:10b6:a03:7e::33)
 by DS3PR11MB9818.namprd11.prod.outlook.com (2603:10b6:8:365::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 09:23:01 +0000
Received: from BYAPR11MB3288.namprd11.prod.outlook.com
 ([fe80::e3e3:c791:111:6904]) by BYAPR11MB3288.namprd11.prod.outlook.com
 ([fe80::e3e3:c791:111:6904%5]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 09:23:01 +0000
Date: Mon, 8 Jun 2026 11:22:30 +0200
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
CC: Ingo Molnar <mingo@kernel.org>, Maciej Wieczor-Retman
	<m.wieczorretman@pm.me>, <mingo@redhat.com>, <dave.hansen@linux.intel.com>,
	<bp@alien8.de>, <hpa@zytor.com>, <tglx@kernel.org>, <sohil.mehta@intel.com>,
	<andrew.cooper3@citrix.com>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>, <john.ogness@linutronix.de>, <ludloff@gmail.com>,
	<x86-cpuid@lists.linux.dev>
Subject: Re: [PATCH v2 2/2] x86/cpuid: Update bitfields to x86-cpuid-db v3.1
Message-ID: <aiaGHc8V4tLK-Rn4@wieczorr-mobl1.localdomain>
References: <cover.1780506200.git.m.wieczorretman@pm.me>
 <9653d8690ec7093c8190b12d1fa8c689c4da50fe.1780506200.git.m.wieczorretman@pm.me>
 <aiEsJPkuEaRPcwdN@gmail.com>
 <jEFsDXcGVUCv1Q5UgHp5Wg0Y1rfflX2uZIB4JGPOU6BajyoaQGcVikWOO-o8MXRXNbh0f09hkL3VH4dlEjJvzw==@protonmail.internalid>
 <aiZifD6RY4eTUimw@lx-t490>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aiZifD6RY4eTUimw@lx-t490>
X-ClientProxiedBy: DU7PR01CA0034.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::9) To BL0PR11MB3282.namprd11.prod.outlook.com
 (2603:10b6:208:6a::32)
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3288:EE_|DS3PR11MB9818:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c93d3ae-607c-4076-1ae6-08dec53f8860
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|22082099003|18002099003|6133799003|4143699003|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: msOKWGRlebXlLY3aeaoTwro1vdT0fdjp3BRaQiut8WNQ5xp5a8FSMtZka7QZGL8Sxd4vZL79As0VvSWEzDihqyqEiedm3IjOCj4LjSdAxKfQhWGi9pOfTqD9Hw20rJ2+xrc1MQ95kmA3Tle2kQ48tDre4vVJMj+CtwhyD6aFa2mlwdbtNSuDYiWJUIBe0ijBeie52Z4JfXMEITZokTxccgMHdNHKkM927xnyf8yLv2blUYFBAiV6eleEUqI/hnalMc1TWjo+V8NPweYF9uEcos6Qi3ewNBKnr+7vegpGtQbBtksXWiGn8RW59+QG9NxMrv7IQnOhBBWM4yek+4WR8l4OKQZ/IOpFZ/rh5o/hEmyilyOnB+TFFW/Paqx62aktY4xFYFWO9hXsKy2TRiDXH4jKkMqBn52io+wbXchR9F8gDJiGIIVJQ8IpFDJXgvad+QcE+ENE8mQQbjT0OXd+aJoNU5snO5FJ6vZAQynBfJbi6Vd63vaDarNu4Puns5xP1gAs9PfcOaVPr6A0yv3jyxJjetyUYSUdkJQdWTochYgJsyvebb+wO4DYgzMCvGTDDSl/poD5I+ZQu1pn8uegsu3rlH/ZGAuJC7N7hB9SOe45nEC6cw0vfJXXoCBSf2csda4hrm1EmObbxS2bydI2vCAVNL/QLuUCObqznBo16I3fLdutkju/rck6W/UzRlZD
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3288.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(22082099003)(18002099003)(6133799003)(4143699003)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?QjukBAU3FI+6+Dw8kCrpvHbUWF5liELpJkMrJtEBXE0+s0NGiue4FcWKzV?=
 =?iso-8859-1?Q?YDJOJd7h4cFx1py+rXOVMyTqzf6Z7eX2LkD7zd067uV31U1U+PyKc0yf2d?=
 =?iso-8859-1?Q?DwunZacQ8eDRKiO8HTbXUzHn/Sz73aPAHAhAP+dULn8QPd5jc5PhsM4GM8?=
 =?iso-8859-1?Q?DAS8m8FAVSppzMA23TqiIHAbRiopTYpfYapJrdDnevJ/TY6DbmnS5SqFo3?=
 =?iso-8859-1?Q?uNqfinl5S8F9GpthOXxylXL6DjWrlYe1r2qpo7hYLTgXv81kpNHCuja5O5?=
 =?iso-8859-1?Q?pfAUF6guNea0FMWFk2Jj0EJxeVw850suU8FZS13xJ2H21l6o5bbpJ5zQF/?=
 =?iso-8859-1?Q?WNFdA1oE2o1GiWWU+YYesjrA6AQBuplUCDVSP2D1gssilS4WOeq499lqWj?=
 =?iso-8859-1?Q?zSk4KGUze/77ERYXJY5NChiwoAz5EaMhjIznvdl4n4bsHjyK4aRwvKzLw9?=
 =?iso-8859-1?Q?B51lh1mhhcgVxRymhjLPmFvkKrb3A7FbOWcOeiO9EdeVHq5RFH318xrlR/?=
 =?iso-8859-1?Q?vxUhPOUr5zZ/nBCXUhszEPJzNXWx8qjDQ1swqIsfnyW5pRvpJxVGI7d2wg?=
 =?iso-8859-1?Q?LpBWYxoPceuNoV9/1VVx3iNB307HNkaOLFjQVkjJpia7HO7/FtR7GLuQFD?=
 =?iso-8859-1?Q?ogZeCQmFbr3j4toRoct3qC5VsZTXm8nyjU4UjlR9nGUblBJxUe5hADDirf?=
 =?iso-8859-1?Q?moPrjmi2l0MDqOP7TSzQ9N5QIizzLooUImZt1OMve/tt5HyTPGIKWu+Ch1?=
 =?iso-8859-1?Q?Vn9izkrPVuGi6FG4ekXvAmIAb1FNdC0rCS/ZZmvaGdij+spdT9V1JfmZa+?=
 =?iso-8859-1?Q?ooDKqSfENMDqTlLoXTtm1EHXrKZC7RrelH6vXPxeTRRqRPqO2lenG1K8s6?=
 =?iso-8859-1?Q?mv83DEZbzqzVvjucVkeNWy35VcMgX3GylRWooCis/I0sVEoTql/DlGBTzi?=
 =?iso-8859-1?Q?JPBSSINleLUd/oJd7sRBE/PHVlD/PGV32IvCb7wCH6AwL5QbRPVdI//w1w?=
 =?iso-8859-1?Q?ruIF2aUjf5A9mRg6iGbSXz/A6wo5jP8PKtz0DvdeCa15WjWl+DWvdhTUcs?=
 =?iso-8859-1?Q?O+u89LZM92UaT2BEvIfTk0/2jhZUdvdY53KAYqY8YqGtUq5UGPyXMVdutd?=
 =?iso-8859-1?Q?lQOu7lEwOCZgPfnlyaZaj7mVsd1pcp11qX9Zr5xPgS2vMt/L89DkkHZuzo?=
 =?iso-8859-1?Q?TdR17P1eUWo3bofgw9ep3THniB3JjqMAZ3JrjBb1Yj1A7PjK0aDwrG2zzK?=
 =?iso-8859-1?Q?sQ+YA4SHt9Ws5K+7kB2cEyZU/+2sVI/yOxbatjPSEG4VUsgVyarzvuL8cN?=
 =?iso-8859-1?Q?YppggJ+g9zjHXay8mA5/kq9xU02FGpsl1uFQgE8q90GXxMqMqepkjqtiJY?=
 =?iso-8859-1?Q?47KXhNJTp9R9iRtz2vwvg73elhD9Jv/bY+Uuqx0QJndjzfhqivWawLAyms?=
 =?iso-8859-1?Q?tE67PoDV833Y80kYSQVo8yMcuaL9yQs3hWhAH/54OBvC3NAN6475cYgvS9?=
 =?iso-8859-1?Q?iZNN9zcHsZbLmm+D7nvxCogjqX+byAhZLwXU8TQwypcuesImmQv/9IZxfG?=
 =?iso-8859-1?Q?aC10svLBlKSN0IjiAMC8S+cGrYPYb1Gp8IZwEEh6poW6SSNdaiJMDtsjBL?=
 =?iso-8859-1?Q?Wy9lepDxzPvNvJXcPB8VkhvUITZMkBbGrotlc8QIoJXb5Cq0bddX3gCD4/?=
 =?iso-8859-1?Q?yUaJuu+KkUAUUmUvtQNFOpWu0N2xTXOyknxfyTQhPwyyjwl5m6LfzRjwvG?=
 =?iso-8859-1?Q?3mvGO+UQgKoxJUwn1fzhAyvb9nXHV2OnDm/JOJ7vLN3blwWqxHXVzY2eUM?=
 =?iso-8859-1?Q?oongH0rU+Dcdbt4f/8H4muQczXUMVYt2gAtaLQsKDFtAAcuu1Iv3?=
X-Exchange-RoutingPolicyChecked: mgwuK1z+Ibr8nIqSPaeuRDfSLpis9hTUnjew+JJo5s3AGo5s343ZKRz6wJpqKXaZnMoXpxxNcXh3nfWHbxZ0gXW+eAisdlXokrP8M4+15jr0xX03L6eYhEryGncjn3yLt+K7eSAFi6ZceYJkZLAifTfBO09GqY1Ss0COLXhg/j42K4xaFcWtimKNOUpe4jOKorcRYPrI+OMOKMPVwkZMWgO9iS3nM5ZRqMv19tabUvsEzIj4JwHRwroWvL3j0tiYXu9hvttZo0G5M4nf7nTw6mPvSi4drNGcWuNsRUPRWia4JxEQRIXnA1DraSf5js+EQdGYKvw61gQ+9TQuwUw4DA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c93d3ae-607c-4076-1ae6-08dec53f8860
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 09:23:01.3974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lW7rKHJyyGGG2zLUN2HJ2RVcI50dpb5plRM0ql4B914cf+zTwiVFDCZ9MEroVzJxG5blwIS6291Y4fpunNHL+qJQ7fh5/qHAcLYtwyiy2TI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR11MB9818
X-OriginatorOrg: intel.com

On 2026-06-08 at 08:34:36 +0200, Ahmed S. Darwish wrote:
>On Thu, 04 Jun 2026, Ingo Molnar wrote:
>>
>> * Maciej Wieczor-Retman <m.wieczorretman@pm.me> wrote:
>> >
>> > Update leaf_types.h to version 3.1, as generated by x86-cpuid-db.
>> >
>>
>> The following detail from the first submission got lost:
>>
>> > @@ -246,7 +246,7 @@ struct leaf_0x6_0 {
>> > -		thrd_director_nclasses		:  8, // Number of classes, Intel thread director
>> > +		hw_feedback_nclasses		:  8, // Number of Intel Thread Director classes
>> >
>> > Note, for CPUID(0x6) thrd_director_nclasses, it was written this way
>> > because the project does not support bitfields names with more letters.
>>
>> What does this mean exactly, is there a string length limit on the
>> field name in 'struct leaf_0x6_0'? What is the limit?
>>
>
>Sorry, I should've made that more clear in the x86-cpuid-db release notes.
>Yes, there is a limit on field name lenghts so that the C headers formatted
>output is aligned and human readable.  It's an implementation detail.
>
>After Maciej's patch:
>
>    https://gitlab.com/x86-cpuid.org/x86-cpuid-db/-/commit/a7af01507814
>
>I searched for more typos, grammatical mistakes, etc. and fixed some:
>
>    https://gitlab.com/x86-cpuid.org/x86-cpuid-db/-/commit/41380ff73e60
>
>Fixing thrd_director_nclasses name would exceed the project's field limit
>(23 characters), so I checked the manuals, and hw_feedback_nclasses was a
>better name anyway, and thus used it.
>
>That's the whole rationale.
>
>I guess this can be appened to the kernel patch changelog:
>
>  Note, for CPUID(0x6) the "thrd_director_nclasses" field is replaced with
>  "hw_feedback_nclasses" in this x86-cpuid-db release.  Fixing the typo of
>  the former would exceed the project's bitfield names chracter limit, and
>  the latter name is more descriptive.  See [link to x86-cpuid-db commit.]
>
>Thanks,
>Ahmed

Thanks for explaining :)

I thought the name change due to what was in the Intel manual was a better
rationale to put in the kernel patch log. The character limit seemed much more
specific to the cpuid-db project. But I suppose that information could be
benefical in case someone would want, in a kernel discussion, suggest a name
that's >23 characters.

I see the patches were already merged to tip but perhaps in the next release we
could put the character limit information in a comment somewhere in the
tools/arch/x86/kcpuid?

-- 
Kind regards
Maciej Wieczór-Retman
