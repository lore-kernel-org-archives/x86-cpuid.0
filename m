Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2044.outbound.protection.outlook.com [40.107.93.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7280D2248A1
	for <x86-cpuid@lists.linux.dev>; Tue, 10 Dec 2024 06:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733813205; cv=fail; b=h0cA5fUf07Z7YvnYD4s0njZFaDM0QXrMs5+3QH1YTG7Iwu0dhIKrZUlvfyPIdJxDNH8PcLLERXMBUHL3/wav1aA+8iqajMP0UBCWfJligKKcRjKN9V12io3l7V4SR74BgvltMR68i2KRcA/LKNy6du+LVaC7ZoH6TBO/O4g20vA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733813205; c=relaxed/simple;
	bh=i7LXod4SE4F4AM+bUKw+PqZ4IjcUGXH0h9ECdNs+DSU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jrf+4RWE6ZN8YiXS9ajzSYwit50uMbDmzpyEe6ciAFw75vFqOPGL1ZGKNIx6HccVVFgJILiwRaYGqyt3PaJ3UmxTyfKH8lhybIrA29Q9gX+29EM1mhX3bMbh7txiTOiOqL8FAAqX+0I/qCI/UQGKgv6cQax7uJ8Zt09HTKeoRkE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Imy53sUm; arc=fail smtp.client-ip=40.107.93.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Imy53sUm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ccqK6ygqCRKgsgHUCQwzP5rySsCVeHgTRo2xrpubYZkmXqJ0GfZpDeKVXs3PN8Fs8/ochzfG2wBogn69p7DxwnkzhxTAKLVI3BdK3m1LLLv/A3f/L9PeJlnSeLDA3GcjucWZzGd1ICwncDFDSQlu4NG9xlWh0K6Oju4ZcGcoerHa5qoaXoOT+lSjixuRV2y5c6vO08xiIFXEA/ifHX++m3qDcRlw8iE09+Zn3QrAqZuz5jcO7hnn8lrBqUiV/t2vy25N9zRIZA0xNW5dXdWUbFeoijq92p5r1pyJK0q7KMfddIViGwuEaMRsH57ZoOniPdBRcxtS1AZmcpRaiVJlLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iiJ/JdawYv3l1ylAYHAoB0uQgbvOSSDVlTvT6khStJo=;
 b=W4amT+7fHVYeIF6HKAD2qoIBbRfwASHcPVk3XLtTRAIbVTSabNjIjFUZCjUmDc4LwiiyFgJoz1eP1E3pxkvdDqKa9J75u6VFp+pg77QztaKzqPZCThaeS0yDNcBEslVmLG6+x/fTfFGfPV3dHQO1CpIkgyd288tLnYIEzONjKhdRgSwKVU8wtlAb8L1MHnxSyeF0TTlvj0kug6q/z6e6CGKGd0hbk5Xx6f7HkB7VkGdYWar/AYq6FFNC7nSzO4YO7unUeQHe7r4tQUKwklhp9M3Zfw9AVeNyN6rPXSiYneIBPN9tu9OK33rsvoHDypzwbAS5KtFjjjc0A/ZH+bCp/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iiJ/JdawYv3l1ylAYHAoB0uQgbvOSSDVlTvT6khStJo=;
 b=Imy53sUm2KZ6H1VbBa5zGQfSS/KV8CuPz0ghsdyEG9nEuUAzRKLzlXOQIIUPopQeHD2uvFze5QlcfmtLaftTsPyY3ITW60bOq01VZ/ZbJeEF4GSvXmG+PWGd0jgnyEX9SE2tB8hIgXJthHLBNspeAAu6C+45TkB9WcaD4/cN33s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5388.namprd12.prod.outlook.com (2603:10b6:610:d7::15)
 by SA1PR12MB8120.namprd12.prod.outlook.com (2603:10b6:806:331::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Tue, 10 Dec
 2024 06:46:40 +0000
Received: from CH0PR12MB5388.namprd12.prod.outlook.com
 ([fe80::a363:f18a:cdd1:9607]) by CH0PR12MB5388.namprd12.prod.outlook.com
 ([fe80::a363:f18a:cdd1:9607%3]) with mapi id 15.20.8230.016; Tue, 10 Dec 2024
 06:46:40 +0000
Message-ID: <2e8be526-9a8b-46f3-bf35-05331cf16ea9@amd.com>
Date: Tue, 10 Dec 2024 00:46:38 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Add missing CPUIDs to the CPUID database
To: x86-cpuid@lists.linux.dev
Cc: Babu.Moger@amd.com, Avadhut Naik <avadhut.naik@amd.com>
References: <20241115181345.262296-1-avadhut.naik@amd.com>
Content-Language: en-US
From: "Naik, Avadhut" <avadnaik@amd.com>
In-Reply-To: <20241115181345.262296-1-avadhut.naik@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0174.namprd13.prod.outlook.com
 (2603:10b6:806:28::29) To CH0PR12MB5388.namprd12.prod.outlook.com
 (2603:10b6:610:d7::15)
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB5388:EE_|SA1PR12MB8120:EE_
X-MS-Office365-Filtering-Correlation-Id: 84f52c59-3758-4d16-e982-08dd18e666ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NXJiRkpkcUFpNEJ1MGl1eHZwZFVDMXVFd21RNkJjcFI1Q2E2Ty8xVENnd0Y1?=
 =?utf-8?B?c0JWRTZFV3Y0dEd1WTVMV1RXTEdMaU1CVkFOYzMrNHRhQmhlbWdnK0o4MU1m?=
 =?utf-8?B?SEYvZlY5SHRoRGhBU3FYeHI5WHY4UEtjcU1FSDhoNDg2NU9vc2tPdi9uZXA0?=
 =?utf-8?B?Q1BsM3dSRjQvUXZIUVR4bTlYUTU4WTUyaEFQdldydlpWSDdrU2pLUitYKzBl?=
 =?utf-8?B?U1g0ZGJySkRQTzJQSERSeVZQdExCRVl4Vk1oVTVXdDZVUGpzMHAvcUtzRlJ0?=
 =?utf-8?B?MEtaZEJIU2R0eG9zWW56M0dYYWV1RlgrV1YrZ3pJdkVpdVhXU1NmbzlRd29E?=
 =?utf-8?B?SjhzSzhUMlRqalNLU1Izb1YvanhzT1JObTZSMVROUGYrZUVibGh4WjJ3S05B?=
 =?utf-8?B?N0ZhNXZLbWVFc2JZb2ZqMnZSaE1icnN2aUloZ3VyRGpzcUhNaW9nd2s2bE5P?=
 =?utf-8?B?b3Y3Q3NsT0duQm50bGszSm5tZndaY2ZLWjBCdVhBRGszUG56WFNySnRXTDE2?=
 =?utf-8?B?a3pzL2duR0J4RTFNeHVlSkwxZWZTQWNVcURtWGtTRE9pYWxqdnpOM0VvRkpt?=
 =?utf-8?B?MXFvNWh6R3dVbGhyV1I2VjBvMEpHU0lYejhPNktjNVhYdjZRT0U1YWE5bzla?=
 =?utf-8?B?Y3NHakNOaDRyMTB2QTdvRTh5akZBcGRLU0kzTDh3SHNKN09KSWRabnVTUXo5?=
 =?utf-8?B?QWpVZ3hHTWx0aFk1RnFJTEEyME9jd3ZtVDRKN3BCNnpoYS9iQThCRHMvVGRz?=
 =?utf-8?B?SkxuQWx1N3RITU84NlFaWUlIZE9qNlQ0K2dSZFBZaUdDVE52NUJFMXVoMW1J?=
 =?utf-8?B?OXBBVEdsMkpSakhOWVJiVnB5cUFhL3BPNVBYcDZzNi9jR0UyWjJiVnRYWExt?=
 =?utf-8?B?d1pPTjFDeExKSTZpaEIxc3RTRkl5ZGVtUW9xcTl3bDg1dzJSSFVsZEJ2N0g3?=
 =?utf-8?B?bGJvSTdRb1UraTUxZFR4MzRVWHJpaElrelVwWk1KcnJCRXZ3SGxHWW13UDRm?=
 =?utf-8?B?RFRJMUN4TUxzWmhma08zdlpsbDFYcnBUNFltRWI5TFA3WWxZcWNXZzFHbkYv?=
 =?utf-8?B?NjVLdy9CeklYbmJYM3ViaENWRFN0dWRkZmQwMmg0UkZNcnRBMGRhV0xCUEtN?=
 =?utf-8?B?ckN4Skg3cG5oRHBFM25ON3ZhWXZLeW1neWpNOGh5MVhnVWxaY3RrZWhGVkcr?=
 =?utf-8?B?Tytxcm9aUkU2bTBIVElZNXdMQ2JBNzA1cFdNdTQ3SndYRzROdHNIZ2VGTmRk?=
 =?utf-8?B?Tm5rYklsVXRNRktFSE9FYlIyV1pNbnpINmdyWThxVlZSUFNLckg5UXlqc2Ur?=
 =?utf-8?B?d3FoZmdMT054bVlwcXFOSkZ2UzZlOUw2UGo5ZGJVaWRZamlyZCtIOW5Sc0gy?=
 =?utf-8?B?YzNEdFNjNXVDbExuR1dMWitGUmV2Y2d4Sm1NOFp4MUhESUlELzlwKzFOTEE1?=
 =?utf-8?B?YWJZalBpRWYweit4THg5SG5tMXdTbGRzL09uL3RPOGM2dkxaSlkvdThBbG00?=
 =?utf-8?B?YVRHeWtBQmRoR1QyVXkxTG1UT2ptOENnT3k3WDV4eGZwcWhWWDhNdjU0ckRn?=
 =?utf-8?B?Wk9DU1JUZTRrdDlOTjlGTVZTelRQZEd3bm9xL1N3dThlU0QybCtQbVlpaDJt?=
 =?utf-8?B?Z2xFYzNOc0FJb09CdHpDcXlhZjNGaFFzNmZ2UVAxa2ZnNWRXNFRaT2M0TmZL?=
 =?utf-8?B?U01sUjMxRVNWdHV4RlYrNm5teVloVE1LbXZBUk9RYkhvRFdHL2JNRkxpcysw?=
 =?utf-8?B?d1V6NUY0V29YWjAvbm1YRThsQlpEbzBldTAySnlNK0VIYzhVc1QwMS9zVHd1?=
 =?utf-8?Q?8wOZ1rb2GeCgBT1/Q/eLDm9Uy/gPSEKgX1n90=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR12MB5388.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDJ2YjkwTmEzT1NsUENjMlBUVG1ldDUrMzRwTmF4aDRJMmlnazllM3k0T2ti?=
 =?utf-8?B?WDBqdXhhQlhMUEIxTHNLc2orT0ZNRUxPcUxzUk5PQjVKcUw5RlZsUitCaW1E?=
 =?utf-8?B?aWJkZWdGQUV5MitzTTlhbkgyait5cE0rM1BzMlpVMmxEZFJEdXZwK3RHSy9s?=
 =?utf-8?B?cDV5Q3ZYTDU1bGNsOFBnT1RxMEROZEJPbTljUFJ2blBjVHo4YVdFWjV5SGxi?=
 =?utf-8?B?UUZDUEZjRitiOS9FTXRzZFA3WVNIRCtVbHhRRklYT2F5NUx3NjVUTjVCdUdB?=
 =?utf-8?B?bHIwWWdFbUh5R0VIZlNYSHZPQnlOcnB3czZtbzJmVDJGbTB0M3Y3UEN5SExz?=
 =?utf-8?B?bzdRMXdkRnRvMWV4L2VYN3JrbnI2TkVUZTVISlpENXozOHN6cXFVQWFWVWhP?=
 =?utf-8?B?NUtDM1M0VWRIbWt1Mit4Q3dQSzhWNlVHbEZFYWg1ZEhCMFplWkdidVljUFJt?=
 =?utf-8?B?eVRHbFQyeUloVm8xL3VuMngxK3kxZndHeFJZakVHZE56RVBJTUtZSE02eWly?=
 =?utf-8?B?TUV2VkxUNERFSFM3Q0JZVTRKMEpDYlFCRW1tTXY1clJqK0xLcURsQlFFY2RT?=
 =?utf-8?B?a2xJMHNmekdCc0pxN0hIaUxSR1FXbEVIOS9FeEdHSk05OEJkYVRQZW53OHlP?=
 =?utf-8?B?Sk45Q2U1dUR6dXZqOUEyV3ZDMHdMa1Y4UUcwOUpSRDZ2YUJzR3g3dkhQS1pi?=
 =?utf-8?B?VUlMa0IwR1J2VG52Vk16V2VrQ0locUQ2QUVSUGk5MGRjVlhSMlFwK2s5RWVs?=
 =?utf-8?B?NjdURzlvdTlBYkhoNmliNlVkQ3kxWlhxTEVGYkhacmtKenRQN2NadzBIUDZy?=
 =?utf-8?B?bHpxRU4yZ1JSalNzUVY2NWVMM1UwWkNYcFhYV1ZuaW1MRWNCY3dxbXU2V0Ez?=
 =?utf-8?B?eEoxdmRKczlnOHA2SGxtUTVLV0dhZVFmbVZEeUNrdUpOcllhSlJROUZvRHk0?=
 =?utf-8?B?NDFPTytpeFNwVVk1aGJpVlBuNTBvTnc2djZRQmFSOFlmZVlSYUVOVWFRMERa?=
 =?utf-8?B?bjk2TUZvWmhUa3NrQ3ZpVHV6TW1KcFE3Z2tqVUdNcWR6YklvMjhJdDQ5VHN4?=
 =?utf-8?B?NEFuZlg2NDF5b0s2UHdOc0hYUFhSS0RNN2IwRmhiQlBvbmJnZUhJajQ3MnY4?=
 =?utf-8?B?dWVWNWNrc2hqMUZ3eTBxUGxxY2ErVlQ0Q1BTVjZ4eW8rSk94d0ZwVGs1U0Ex?=
 =?utf-8?B?SGlyY2VHR1FqZU5hQjllWCt2UlBlNTI2aTFxZTRWS0xpclVQSDlNVjBNd1A4?=
 =?utf-8?B?S0UwQXZLUG9OTmJ4Q1BNbWxGY0h0U0U2U0VJMFIvdGJnWUo3VmJpSnNQb1hi?=
 =?utf-8?B?a2lGMDhEUFVqQlp4TjlwVkhOV29BMXF1TktkS2RlV04wc2tCTWZTdlQ1SXFh?=
 =?utf-8?B?MlN3RVhnVWQ4WkoyeXM1UlFTRGRTYk1VajhWbHBrR3FJbENpUnNjM1l3RURT?=
 =?utf-8?B?K0RSdmZBQU91aHU3NzlFU1hkTlIrNm1BaU43N0FsT1hMMlJEeTZLQi9QbDRr?=
 =?utf-8?B?d1FvM2hjbEEzTWRVY0ZyKzhCOW9qRzEzN2tDSnZOczMwSGVPQVVNRjFUT3I5?=
 =?utf-8?B?NjdyRytDZDV5ZERSckVzeDFEUkhKUmxjR1VWZUJMcmlXTWJFWG9XVmlmdFVj?=
 =?utf-8?B?Zm96TW1zVjMzTFJvSWtGMHBxNnJYVTRheXBZaUY2VENQV2tvQ0hkOE9GZ2p5?=
 =?utf-8?B?c29FZmVuT1dYdDVxcDFjWE95MTFJMzFpeTREKzBCK2pUbW14N3JzdTErSVB3?=
 =?utf-8?B?M0d1VVlTRGtHdXRIZGlTaVE2QW1DOS9sNmk2WE0zSHMvb0QxVTAxQ3VkaSt5?=
 =?utf-8?B?SE1ua3BDakhuakFqMTJBQW9TWllIcm9NUWJYRjRVTlNoRVErL0RGNnhDUnZi?=
 =?utf-8?B?ZmYrdzJzL2ZsZXdGeHhuYjNYVWlnUEFZZVBiSU13V25vK1Z3U0dBd092MFEw?=
 =?utf-8?B?OHdVWWNERG1MUDZFRzZtUFJ6aWxoUFN4bFRidjhGeGkzWjJCcnVjQStLZ1h0?=
 =?utf-8?B?YVRJT1VpQnJJaXpqZkhwcjBSRzQ2KzVpYmVrS3dJV0dXdDVxbVk1T1R6aExB?=
 =?utf-8?B?dEhBakNpalQ4a3NyLzNRUWw4T08wNEltd3ZiMWhqZ08yY1o5RHd6NTV3ejVJ?=
 =?utf-8?Q?NKKsbP/BHxzOKTGRb2Vdb33EP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84f52c59-3758-4d16-e982-08dd18e666ce
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5388.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 06:46:40.6606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KjL74aht7rfVAeIcTcAUvgA7Xi+168bXQgti0H5oNyRl2tQEAwRkrlS9iz43O0+FqDozsZSIQVOOCFrDCajaAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8120

Hi,

Any feedback on this set?

On 11/15/2024 12:11, Avadhut Naik wrote:
> This set adds some publicly known CPUIDs to the database. These CPUIDs
> were introduced in AMD's Zen5 SOCs and have not yet been added
> to the database.
> 
> The first patch adds ABMC and SDCIAE bits to the database.
> 
> The second patch adds WL_CLASS_SUPPORT, ERAPS, SBPB, IBPB_BRTYPE, SRSO_NO,
> SRSO_USER_KERNEL_NO and SRSO_MSR_FIX bits to the database.
> 
> The third patch adds Rapsize bit to the database and modifies the number
> of bits allocated to MicrocodePatchSize field from 12 to 16 per Zen5 PPR
> 
> Avadhut Naik (3):
>   db/leaf_80000020: Add ABMC and SDCIAE CPUID bits
>   db/leaf_80000021: Add missing CPUID bits
>   db/leaf_80000021: Add Rapsize CPUID bit
> 
>  db/xml/leaf_80000020.xml |  6 ++++++
>  db/xml/leaf_80000021.xml | 39 ++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 44 insertions(+), 1 deletion(-)
> 
> 
> base-commit: e1dbdd1664078cb8961ae0ef0253c4e86ee755e9

-- 
Thanks,
Avadhut Naik

