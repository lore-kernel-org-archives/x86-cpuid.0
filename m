Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2084.outbound.protection.outlook.com [40.107.93.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD0A27F4FD
	for <x86-cpuid@lists.linux.dev>; Tue,  4 Mar 2025 16:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741106579; cv=fail; b=oaFs3GPukN09cCOXUR18e7DEE3Myd08vpVeYDm6G3i+Z0584bOgreVvJMmctSbxP4SB/wLEBzphGO6k+/cD1jvkn+QyRjd2AiRUVYNbxcn70I8pA4kXeTaiCELbB27RMoqlpYqCxmei6vIUbW7Lj2Z7OKZAntT2R+zzL6QE8VcQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741106579; c=relaxed/simple;
	bh=2l5G9R/57PjJ3zwc8NcywUvr9bFWO4gqLC++9Fr1e4Q=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ss19RKr5TrMboB7Qg9V2G4NuJOR+RvwE3Sg+QRhuo23R+fh5rioAcZrPOV5z/+UoAiWKdDZ/KxrF3owNuy9AceBGZu4lfT4UxOp/QpirKR1ixF3+Z748RqFSYMBMe83hEk4M4EdAbtGTpBGQlaiQsqgnSJQm7gQOpF2V/fe65IY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ciulA9Zx; arc=fail smtp.client-ip=40.107.93.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ciulA9Zx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YSzjjgpHAualLFnIsds1TT3SAS+n3L93xESh6lA+ZetdmEkmszEx0IHaqEdOHRZ8LX8VBKN/kL6QlFSS+Wfdo2UehyFF4IlWEgw6LIrnbzBqgBs3McE1peeJuoLCjKAu2Y6znByrmn758MmvM/U/oFbY3oHokubzZapwQrPFK3ekwpyBCmrk2xR/11O9qR2irzrPsicXOubmdtu0g4TNVmH7mct30B283viL/u+PaXoh21r9ih2BluMvbIABzmBzp2I/oCVfAifIFeURuuBv2WsHEDFjGucZiaBXzUgEK9JtDRhQn45UVuFxXgqf95WBybcyRipymzqfr1UEMo1nyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0shpgdGYp0wlgogp3R8Hmu20yJIMaDMqzFvemeSS8wU=;
 b=P658N9JuTI2vSb7yppQboWRAmcXJ8NQNau/afyKiYIxNVcHxXX4pC3T788Zh3xEZKKXAoDYHizNsG4uwSukaDFzxgCYKrsmZwPoXAOPPnESTwF8fSTC8udKXsPSFxgRK1Ucln79Ro06AEvxWxEUfWgr4Wx/FrfJDTuuTjIbmxR4vS2qhurecqG4Je8BKc349byVxl88J9Odrla4pNOY4QACCGxuD6cn4F2ZSKmNQ/m4ANXkk9Loc60xjIZw+ampBF8vaU9cq8Uh7aleSHACI9KXEio+/12q3MGZ2s86TGhZkxNXZciAfVJq0TaqAQNey+hJgx4FjbXda1vfKnEB7eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0shpgdGYp0wlgogp3R8Hmu20yJIMaDMqzFvemeSS8wU=;
 b=ciulA9ZxjVrnqu7treZSMmx5+aiH/nMAX2/EXZGbJ6Xw2ntq7hDpM/0rB/MndUg5FFs+iTEdAwf++79eWx5po5K2wjqe2unUrdPxOTLVDvN4BzNkTcfgJzr43U9orK4Ch3bMOxtWHnTLe2+IV/yTLEi3Hh2gWqgWKSS41q4BA5U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5388.namprd12.prod.outlook.com (2603:10b6:610:d7::15)
 by DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Tue, 4 Mar
 2025 16:42:53 +0000
Received: from CH0PR12MB5388.namprd12.prod.outlook.com
 ([fe80::a363:f18a:cdd1:9607]) by CH0PR12MB5388.namprd12.prod.outlook.com
 ([fe80::a363:f18a:cdd1:9607%6]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 16:42:53 +0000
Message-ID: <c63d4cda-b583-40a0-8dda-c5786f1f56f3@amd.com>
Date: Tue, 4 Mar 2025 10:42:51 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Add missing CPUIDs to the CPUID database
To: "Ahmed S. Darwish" <darwi@linutronix.de>
Cc: x86-cpuid@lists.linux.dev, Babu.Moger@amd.com,
 Avadhut Naik <avadhut.naik@amd.com>
References: <20241115181345.262296-1-avadhut.naik@amd.com>
 <Z8crqWioDw7Y_cgG@lx-t490>
Content-Language: en-US
From: "Naik, Avadhut" <avadnaik@amd.com>
In-Reply-To: <Z8crqWioDw7Y_cgG@lx-t490>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0071.namprd11.prod.outlook.com
 (2603:10b6:806:d2::16) To CH0PR12MB5388.namprd12.prod.outlook.com
 (2603:10b6:610:d7::15)
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB5388:EE_|DS7PR12MB9473:EE_
X-MS-Office365-Filtering-Correlation-Id: ff383562-0f69-4f49-dce2-08dd5b3b9bb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y2UyZnNpK01NY1dUdmVjOFJJR0tLZ2dzQk91NTlzSGpOTFlXb2FONENlVmFC?=
 =?utf-8?B?c0srVnllUFNKUTQ5RXkveGZTdVBhQi9xTXRJd2VEcGdiSXZteXFUR2lTeFpp?=
 =?utf-8?B?Y3kxbHlIUm45cjlWU25tK3pWaERFVGpZczNTL0x5U1JPTjAxZkkybWdJNXlM?=
 =?utf-8?B?dHpuVEdmamRyRGtUS0JqVG0yK0pKUEw1aGJvUnFiQzdSeEk0NDM5ZG04TmQ5?=
 =?utf-8?B?RlRBWmR3Kzh5cUFCNEpsV3VIcDhGaXNVSjVaQUpTS2Q4SCtiZ3QwdHV2UTNq?=
 =?utf-8?B?LzJldkVIQjlRaEpEZUllQ2syQlZ5cGtFLzA3Y29aQ0d0UUFGTit0MTNpeUZT?=
 =?utf-8?B?OGJtejFTdW1NaVo1Q2xKZ3orYWNlNk5NdkpWQzJGWHAxM3BBaWxaKzdwVW9S?=
 =?utf-8?B?WmZGdzRtUHA3Sms5ZTJaVWNkWXcxRW4ra0t2NkFjbXc2Nm9sTUdYQUlUVjhE?=
 =?utf-8?B?bjhiWktXdzM4L2hncjFDSE5tTEJnR0ZUOU8vSTZ5SUJFSGNnZEdmNGhPVHRN?=
 =?utf-8?B?elBmMXpTc2V3bnRuby9MQmU4WVJhZmlwLzU3ODNyK3RQRlFCaWFIbk9OWWFr?=
 =?utf-8?B?NnlmSnRNd3dTS1pEZHhCQ2lMUHVIZ3M4UzZzeXFQNlhaUURWVzNhZUJVWkc1?=
 =?utf-8?B?dThBbDllL05EcGh3Y3RwbXVnVFVJZ1gwVjA4OXZqQ2ZuQ0xCVGNhU2RwRFBY?=
 =?utf-8?B?dWZQMTJ2K1RKK2VDT1pEYzl0R2lCRE9MTHpDZXRKdW5LUDAwN3g1bnczZnFY?=
 =?utf-8?B?RC8zdWhSZGd1R0dWdUVkY3RyM3RmdjlqV0NTRVREam1oYTNJWk5iU1BybjR5?=
 =?utf-8?B?Y1ZZZUtaMkR2RmE2V0UxTVZOWU5LNHdtMWVrOW5EWnYwSExwWGsrTFlVU05M?=
 =?utf-8?B?djhzNVcrZ0tnMThRN0NCUW15SWxhYWtqUWt0NkpRUEhZd1F2Zm53M21teUJY?=
 =?utf-8?B?aW85MHB5VXZpbitPOXNmelhBYU5lZk1oUlN3RXRnWCtpSW4xRWNhLzJhK2Qw?=
 =?utf-8?B?ODlRa3MrSFJqQmMyQ3hWYnJvUDMrYlZ6T3BmOGo3V0pYYnB0c2pTSWQrSWdo?=
 =?utf-8?B?aFppbnJOUWhqNG9wVzR1cVFrR2pSdkRTd1N6TUR2SlNOQzVBSGYvRm9NS0M2?=
 =?utf-8?B?bXVHeGwxa0JkZjJRZHdVQjRtRTZpVlQ5T1lETWhPMkM0U2xMTyt2a2pwQjNo?=
 =?utf-8?B?MFNsbURwQndBdzRkYXlldUw4UGsxTVA5QzJiR0dQVFgrenBBcE8rbmNMajEw?=
 =?utf-8?B?SGVLSWowSHRKc01HOVV3NHVUYzB3K0VObFhwY0pVb2VzRGJMN0w0T3dnSm9D?=
 =?utf-8?B?MmtuMW9jY1FxZGJlT0g1MkNjZlJoNlRyWnJGaXI1YVdweGNtQTkyWmVDdyt4?=
 =?utf-8?B?cXlxbGJDbE10dDFReTREdDNBM0RCRXdZQTg4QThoRnVISEZUblRibnZaVzhC?=
 =?utf-8?B?VjM0N3orQXViMm43QWNFcjgyeC9UUFBZb3IrV1gvUTNZNEhnNGdxb0Q0TjVS?=
 =?utf-8?B?L0d4SVRzeHh2bFNXRkRkTmFpTHpyZ0R4OVRZazR6akpWSWtSZkZXYjVMcHRl?=
 =?utf-8?B?MHU1Zjg2U3FWKzd0dGprTVZHZStOOHBFeExLR0FUSUVXeUUzSmN0Y3lQd3Bm?=
 =?utf-8?B?dmdtdDEyeEt3NURPWDNtU1U1c01qWmtjcURUSjNyNGV4OUtQZTJKSVYvaWlq?=
 =?utf-8?B?Y0NUNDc3NUNWaVFyWlBYUDYzczU0K1Z4NE9rUkVFZzg3NFhBTWdaVnYzL1ZE?=
 =?utf-8?B?c1M1cFpDU3JnYys3OFVBZXk0MENLaTdKbXYrN1BVZWVaU0hmZDdpakJ1WFdR?=
 =?utf-8?B?Y0p4dGRiaHNFUkd6ZEpWM3JmM2FaeHhDaUxVM1UzMVc0VHR1YUJEMjJidTVX?=
 =?utf-8?Q?1p4dS1rHVPUsP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR12MB5388.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2IxRVNJdjl5Wm0wSWJDcDBLT3Q4VXE1eUlpcDIyMmlLc2RpZEthaXV3TXJi?=
 =?utf-8?B?bEhXWXlqdVRqNkZmQnk1SytCeWhrTngxcklhbS9BTG1SUDhEYXo2eTg1dEFy?=
 =?utf-8?B?K3Q0WjM0MUNnNHR2d3U4TnZaMWVDYm1nUXBiVWlFZ1JKcmdmNllJcEoxT0JV?=
 =?utf-8?B?d1RLSEplSVZENDNFWmhmTURtdGVBVEpDQVQ2TlgwV2lMYXFRdWFZckpMZnp5?=
 =?utf-8?B?azBLanZ3U2tWa1o1NThJbHMyNDVzejBselJ4UnppejQxODZzZ1J4UXYzQkJs?=
 =?utf-8?B?WmNzTGp3QUtnOVBHWjQzeFU3Z2RzYXVGbWdlM09GZ2tGaGpaajAxZUFudy9K?=
 =?utf-8?B?bDVjdC8zU1A2R2RCMnNuZ3NVdGFMeVpLZjJSc2JiRkg3ZDhvVmdTbFJhYmxo?=
 =?utf-8?B?VGtyUFdjSit4bFZBeGVKdEtWc3IvRDU2UkM2VWZNMDlJTHdjRVNRbEJqNU4r?=
 =?utf-8?B?VXpjUlg3MEwwVjg5c2VJbCtGWWJTa3FyeHQ4dGtnQmdSaWk3aVQzVlJBQjNr?=
 =?utf-8?B?NEFhZzdicnduNWVOSHZPd2NxY0Z4V0hBdjRRVS9peUc4aFNIa0tLRjhQTEhD?=
 =?utf-8?B?RTVxYnhWaGpzelpQSVdDM3ZPWXBsa3ZHVys4VUVrSVZPaWRnZlhhcm5ldlJU?=
 =?utf-8?B?ZEdZbkF6dXpycmJPNTVVNkRCelFFSFQ3ZzVVWHJVWVFuQzhGOGtLVGloM1JN?=
 =?utf-8?B?ckpWaDczcU10d2haUFkzbUNaVG1rYWtKaEIrM0E1KzFPTi9zeldmc0hHTW9V?=
 =?utf-8?B?eDFBamI0blRWRG9ta2xOSUdxYUJFQ2JhOFprdmR5cXFFblFUdkV4Qi9BcXNR?=
 =?utf-8?B?VVVuVTlvcDB6SnFhcXZCTUxQSE9BTFBsUzBxa3AxZHBBZndCWW5pQkZOWEI4?=
 =?utf-8?B?Z3NsV2tGdHZpUFBHN0YrZHU4blFvS2dmQ3BSVFZqU2hTakF6WU1wU1dzTWx1?=
 =?utf-8?B?L24yeHhIQndTMkQ3N3ZDNW5vam5wRzl1aDROdUc4cnUzTU52KzJBS25oUFZt?=
 =?utf-8?B?YnpxSE5iZmliWEZSSzJId3dneEl5UW5TVjZydExpWW4wWkZ1VzM2cDZONXVS?=
 =?utf-8?B?YWlFd080aGhOMXdTV3ZzbnNWODZRc29NT2VScDJaQWtWTENwV2cwY2FBMjVj?=
 =?utf-8?B?eXVYOThZblZPVmJIWGIyQklrR1hOZW5qb2p6RTc4b1lpbkd2QWprY2UrcHZJ?=
 =?utf-8?B?cTFxUTArZ20yUzF0cUxvQ1kxek9YdDN4TUFUNDBPb3loSjRwdVBMTWkzWUJa?=
 =?utf-8?B?RnowY2U3NFRFLzlZRFo3ZHdwTVNBY01YUXpuYmtYR0hVQ1hQYXBaMnVud3No?=
 =?utf-8?B?Mm1UeEFJdEhMaG10cUxCMFFKU2NlazFaSHRic2pFQXRCeUtUbUZGdWIwNDN3?=
 =?utf-8?B?dUQzcitlcFlwenYyUGh6NFhNSDdrMkFOZXN6T1l5WGxFam5ySHpBYVROR1BV?=
 =?utf-8?B?NjFzdVYrVkt4bFI1NHdkRmxIOUFydEJmVVB6RHpEOGVwdDZOS3FITFliZDNB?=
 =?utf-8?B?czdhYlFoZ3Jrd1BsMXhWNncwWDROdkEzbVAvZXRXalVBNWdlajRySmhJR3RF?=
 =?utf-8?B?bnBFM0hkV0ovOVpiVnJEMVV5MEpKWXpzSTRIc20xWEhacFZqc3RpdkNiTlVH?=
 =?utf-8?B?eTFNQkdEdjE3bTVyYVREWitlSVVsNkt3MjNObEMzUW80ajVHS1dTNTZoRlZO?=
 =?utf-8?B?cDc2T0tjWVo5amtGdm1udFhPbTJ1dERuck9GcVBTai9HLytwWnJkUFNUVVdU?=
 =?utf-8?B?R2E1Y0g5TXBqTXdMelpSS0ZoS1BKREN4bjd5aUJlWW1DTlQ2RllIOEhKNzB6?=
 =?utf-8?B?VDlEY3dXWG5XTmtpSVptR251dk1xYUJJS0JuN3lWS2RvYUlaNE9zOXRPUVBa?=
 =?utf-8?B?UUNjYVp4ZFhCQ1JGL25xTUpGVmEvTEhzRlYwaEV1M1ZCNnY4YnVXZVMwVFl2?=
 =?utf-8?B?LzY3OGt2NHZzcE8wbUtydlQ0WkhlUlZOUkkySmlMdWlOZGpFS0FhMG8vK3pD?=
 =?utf-8?B?clNtSmdNSG5rNGl0d1VjcktWSTQvZ2Jic0tZcEFKWk15QkhiVkRmOUszdlFq?=
 =?utf-8?B?MUpJWjNrUTBacUdjMGt6aEhFSWNvSldvTGJYNnNJMFhBYkJWR1JXaGdtdmJk?=
 =?utf-8?Q?EbwzN0VKFtsihoDGKcszCxNdj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff383562-0f69-4f49-dce2-08dd5b3b9bb0
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5388.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 16:42:53.1745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xAHYy/pyOY0oM35MJOIVBzShGTynf02FHjNZLEKQUb4hVuxE6qloorE9lsM2IfhPm3QhtZnG9AnLQj7U8QPYuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9473

Thank you so much!

On 3/4/2025 10:34, Ahmed S. Darwish wrote:
> Hi Avadhut,
> 
> On Fri, 15 Nov 2024, Avadhut Naik wrote:
>>
>> This set adds some publicly known CPUIDs to the database. These CPUIDs
>> were introduced in AMD's Zen5 SOCs and have not yet been added
>> to the database.
>>
>> The first patch adds ABMC and SDCIAE bits to the database.
>>
>> The second patch adds WL_CLASS_SUPPORT, ERAPS, SBPB, IBPB_BRTYPE, SRSO_NO,
>> SRSO_USER_KERNEL_NO and SRSO_MSR_FIX bits to the database.
>>
>> The third patch adds Rapsize bit to the database and modifies the number
>> of bits allocated to MicrocodePatchSize field from 12 to 16 per Zen5 PPR
>>
>> Avadhut Naik (3):
>>   db/leaf_80000020: Add ABMC and SDCIAE CPUID bits
>>   db/leaf_80000021: Add missing CPUID bits
>>   db/leaf_80000021: Add Rapsize CPUID bit
>>
> 
> Thanks!  The three patches are now merged to tip:
> 
>     https://gitlab.com/x86-cpuid.org/x86-cpuid-db/-/commits/tip
> 
> They should also be part of the project's v2.1 release, to be pushed
> this week.
> 
> All the best,
> 
> --
> Ahmed S. Darwish
> Linutronix GmbH

-- 
Thanks,
Avadhut Naik

