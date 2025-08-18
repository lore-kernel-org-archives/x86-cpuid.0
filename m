Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2070.outbound.protection.outlook.com [40.107.237.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B3B12D1F1
	for <x86-cpuid@lists.linux.dev>; Mon, 18 Aug 2025 04:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755491493; cv=fail; b=oBEI2klyvYZp43mG1Rtz6kivkZkX1adk0frGQxbnXFirxNLL0kJzVngUNIQhalj8GiJVh4w0Sn82i4LsymEehWkxt+ZZnIqIqye1CAfVmWxNo41BPVt3lgSoP+Myhd2jQKd4zeVukr70q2TBBWFwqm78KL6wYC+P8XN7pezYbzQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755491493; c=relaxed/simple;
	bh=8pcVh2c7Lj8Llh6XFtaBJC+apLCZuZj2GZrz/7W3J1Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Ru31dyHfbE7PRw91Jxwb1ckUyJraWgQhcJ9m/9f0GlKZ6/Gq2+uZ1qARt4Bv4ly6wuK+Sv6lKrXLbFerLyZqHoan9r208nTfd4hZmne3/ciDzOw9oVpGnhrbr0JaI+ztTX4ytke0ROw7b6cFN9JKWKVdGGam4XQkx1wAgw4kj+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=BvyFO5VJ; arc=fail smtp.client-ip=40.107.237.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="BvyFO5VJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D9mJj0UeRAOQrT1BVPO0ZkfLnhJtITj0ssrZlDn2s9C7gMssZkYPPlkjpVH0p3vdtGb6EpP/FXuFOjAeEZuL3KJcMEEP/PqMbSFifK6nBq0tBH8itz3K+MriC4J/8U4pYnZvVwly971+uwLwAboA3KK84giT6zh4lJZTU9qf+FP2X36eeRzhQ03jSRL4nAmLaGh9yDRsVfTC9rmLJ8aK/NCt8EfUVbxdQx7K0GS3t/iyyZB5t0jKkpCcDrye1asiIXrdviCaxp1waoK0guH5MyRA28qdmZdiXu6U3Mq6y6ODcXgAsHYk+hb6ZNXG6Jxb/iAN1RVk2rQxaEtnb6zPvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RjTvjJqaB8TEBxNgPsGn7cdTWg4tVPm9yQzwpRT3NvM=;
 b=C+Me07uXvNwGkcwAVuzKh4YUUdpYuh64xna9RCK0y6jjoS2fqm4LsHE3ABDPqo5lyBmS31w1a7abQ/SR3X8H8rslgW0mOOwvQKXhUi2Oj0c6H+56LVk2bP7+9yHF06UrYaylXi6uBtLMJcI/3gfDAwo4D0o7UXyzBe7Cje0B61pR141ixfWTZsJMSEc8Mf7rYyBxU8cjZ6TceyhegNAg8wBxCYUV6IgdfE1yLlQ32LxWaqWN6Ho8MOC47+8Rq/1P6yblfJdguC7G9UHCnGokYGh2opkUazEV4BGCucTdLZZfRuC7PQ1HT5TQq/daqCVdAe8rAzaj/ZGiTuiArtigHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RjTvjJqaB8TEBxNgPsGn7cdTWg4tVPm9yQzwpRT3NvM=;
 b=BvyFO5VJxjiwqbGmuRKCc3Fccv6lEGwbey6BPqUpBjkPTxGDKw8tonslHLX9bBp6pNGfVy69gYF3oM79fAdShS7c/XROPD4WOHPx3N9DVygUcZI4GCLs4pl4fdjvsSDLx+5GEumgseqU1mSTbCl3M6QL3vS+1Nt1Va2MRj6+1/k=
Received: from MW4P222CA0007.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::12)
 by SN7PR12MB8101.namprd12.prod.outlook.com (2603:10b6:806:321::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.22; Mon, 18 Aug
 2025 04:31:28 +0000
Received: from CY4PEPF0000EE3B.namprd03.prod.outlook.com
 (2603:10b6:303:114:cafe::f7) by MW4P222CA0007.outlook.office365.com
 (2603:10b6:303:114::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.19 via Frontend Transport; Mon,
 18 Aug 2025 04:31:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE3B.mail.protection.outlook.com (10.167.242.14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Mon, 18 Aug 2025 04:31:27 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 17 Aug
 2025 23:31:27 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 17 Aug
 2025 23:31:26 -0500
Received: from [10.252.207.152] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sun, 17 Aug 2025 23:31:24 -0500
Message-ID: <78f2fe53-2e53-4cfa-b96e-ef82da444f6a@amd.com>
Date: Mon, 18 Aug 2025 10:01:30 +0530
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] db/leaf_8000000a: Add Page modification logging
To: "Ahmed S. Darwish" <darwi@linutronix.de>
CC: <x86-cpuid@lists.linux.dev>, <bp@alien8.de>, <thomas.lendacky@amd.com>,
	<santosh.shukla@amd.com>
References: <20250811125236.2606331-1-nikunj@amd.com>
 <aJ7erI-UKNIBehjP@lx-t490>
Content-Language: en-US
From: "Nikunj A. Dadhania" <nikunj@amd.com>
In-Reply-To: <aJ7erI-UKNIBehjP@lx-t490>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: nikunj@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3B:EE_|SN7PR12MB8101:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f01e32a-382e-4a4d-1d89-08ddde101918
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YWNaTXhrU2NvTC8yVDhWVkRnNWl4SEU2c290Y1J4VW1sTk4xdkhQQlJxTlgw?=
 =?utf-8?B?Q1JjZG5oRG9IRDFMZktld3VDSU9QUUZYemUydUxCaGJ6NW01MkFaV3NScWd0?=
 =?utf-8?B?Y04ySWNUS2QxU01CL096TEQvRmZoTmFBa0RMTDlGZTQrYzRqeUZYRjh3Vk5t?=
 =?utf-8?B?SWwwQTQ3SDdZM1lDZy9Pa0xqWEcxV0lVZXBGRkNRNi82K2lxTWdFdE14cXFE?=
 =?utf-8?B?dUJDZjBJdmlIcnpxU29pQmlYcXgzOVU4bDIzVzYwZ0NhSmF6Ui9wSlNvV0hz?=
 =?utf-8?B?L21RQnJvQTl3SjdiL0YyRUhKenVSdkl5dnV4WDUvTktEMXdIWEJHZlBDalBt?=
 =?utf-8?B?dW1YUWcrQ1VDd08zUVdYWVZaR3dQRk5Tek1Sc1pWaGVvcGxLazRWYmltY2NX?=
 =?utf-8?B?TEtSdGw4LzJ3VkFndVJFSm5tRHhCdWhTeWVURUh5RG1CRGZ3MHpCN2JpQWxD?=
 =?utf-8?B?ek5rN0duc0xRUzFGL3pkcmRIcTJiQVFFZjhDZHY0c3RuWCtIZEh5ZlJQeWNG?=
 =?utf-8?B?OGxYcG1KK2ZmaTdzaWFGbExOQ0prSjdnby83S2NHY2prWmR6VmViNTdmakRz?=
 =?utf-8?B?RXRvWnY4aVpOUVovcFdhQWFUZHFaaEI0SnB2WWtSamZuWE9CL3RlZVh5RWlw?=
 =?utf-8?B?WlVHZXNwRUwxMlJYM0p0WGsrWDluZ3R2UG9mSlNIczZ2TElaV3l1aTZmWjZs?=
 =?utf-8?B?K1NpRUVRc3A0Nm01b05MZDhsTGRXbENxTUpqYklWYURENjJZR21lZ3JSd1Zz?=
 =?utf-8?B?Wks5MjBEWVlISmhtVHd0K0dhYWswOCtTTjduSEdJS05hVUwrNjQwQXprOFZj?=
 =?utf-8?B?YVFtZEtuanM2QldlaHN0K1ZoL2w0SWJKeVh2TlJQOXBFMUNjNHYrMThheUVM?=
 =?utf-8?B?MFBNUFhsTWRNeEcvNC9IZmJMVUVHSlhDRDYvMFJTaHNlVmp5N2JVcVFKcmVL?=
 =?utf-8?B?VHFxaGdibkJrRGlMZnBlNzVxQmJIUlE3VVZleWFKYzZST0J2MS9Xa3RLcEtV?=
 =?utf-8?B?cGJBT2l4UTRSZVBqcmFycG9MS2RRcEhMajNNUFU0YmFPd2hYclR2djdtd0FX?=
 =?utf-8?B?SmdsM3BZa2FrWlk1S05Yc0UvRk1PY2RjZUhOMXZZbEZiV0diM1dHV1hucCtw?=
 =?utf-8?B?dmdGdzBMMXNLejh2WmZoYm5IeU1xZG1saE5Mbi9RbzJIOTJ4MmE4ZmdQU0sw?=
 =?utf-8?B?VEcvQlUrM0V2UzBSblhXaFpVR2Y5MFp0L21xLzZ6NHVQU3I3NDlZbXhuS2Iz?=
 =?utf-8?B?OEIvbkkxNzl1MXI2cXlpQ3E0YU1FaFRldXdBRWZRTGRiSDZZWDJEN3llL2Ev?=
 =?utf-8?B?M1RFQjhWNXNERzdDZlRkWWlWZTBsclYrcHBTWGlVcUx3aGdmdGlJOW93SUI3?=
 =?utf-8?B?eDdQaXVseVRsR0F0QXpMZm81NzRTM01tQThpTmVOamF2RVFCVFFPaEtsRWpl?=
 =?utf-8?B?bzdBeUJJTDZudUdrTnBSVmJUM0dVR2dRc3d0Z1VYTUJBWnNpeDJQWWVQVk9V?=
 =?utf-8?B?SmlXRXJVK3NzZFZrNVovRnBlK2hEL2htL0MydjVhTFpGRDgxZlEyZjVGWXRr?=
 =?utf-8?B?Tm5UeEV5OWFYSW5ZQTl2U0VZdFY3MEF3ZDFHUTIzeUM5dHlHL1RwQzhsZUI1?=
 =?utf-8?B?aDBvb2RvMENXVzR4UUs3T2dTOVF3QjE5ODN3OGVTbHNDUUV5a3AvNXIvWDNx?=
 =?utf-8?B?TlgxWStGcCtudUY0bnhISFpzdTVoT29nYkRqVnBGWFQxRFVVUnUyZUF6RERy?=
 =?utf-8?B?UThBcEY4UkwrYWQ5LzBJUHpaNXNmdWlFWWF1Y2RnUVNjL3g4MnRyYmVaSWNZ?=
 =?utf-8?B?UFhGZVBTckk1dWlsZGErNlZYMHlZNGV3UXN4dDk5dXlnYVprZDBNQUFwN1pI?=
 =?utf-8?B?ZE90bTk1S09KVHFZNG11aTltVGRqQlhQK2RlYU92L0M0SnJ6WjI0Mlp6NFFE?=
 =?utf-8?B?cWVzaTZFVFpYWjNrV3FFY2V1ZGIraE9JVEJ1elNLR283RW95MU9IV3p1QXZo?=
 =?utf-8?B?SEVZNHpuWGhqaW5LTHFXQ2cxbzk5NWVhem5BRW9yR2oxVFBzVVpQcjJSdi9z?=
 =?utf-8?Q?czm3Dk?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 04:31:27.7439
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f01e32a-382e-4a4d-1d89-08ddde101918
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8101



On 8/15/2025 12:45 PM, Ahmed S. Darwish wrote:
> Hi,
> 
> On Mon, 11 Aug 2025, Nikunj A Dadhania wrote:
>>
>> Page modification logging(PML) is hardware feature designed to track
>> guest modified memory pages. PML enables the hypervisor to identify
>> which pages in a guest's memory have been changed since the last
>> checkpoint or during live migration.
>>
>> Signed-off-by: Nikunj A Dadhania <nikunj@amd.com>
>> ---
>>  db/xml/leaf_8000000a.xml | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/db/xml/leaf_8000000a.xml b/db/xml/leaf_8000000a.xml
>> index 7f73318..433c4b1 100644
>> --- a/db/xml/leaf_8000000a.xml
>> +++ b/db/xml/leaf_8000000a.xml
>> @@ -14,6 +14,11 @@
>>      <ebx>
>>        <bit0  len="32" id="svm_nasid"               desc="Number of address space identifiers (ASID)" />
>>      </ebx>
>> +    <ecx>
>> +      <bit4  len="1"  id="pml"                     desc="Page modification logging (PML)">
>> +        <linux        feature="true"               proc="false" />
>> +      </bit4>
>> +    </ecx>
>>
> 
> Thanks a lot for the patch.
> 
> feature="true" means that the Linux kernel will have an X86_FEATURE_PML
> flag at some point.  I've quickly searched LKML, and I didn't find any
> draft patches for such a flag.

I will be sending a patch on LKML adding X86_FEATURE_PML.

> If that feature flag is not planned, there's no need to send a v2.  I'll
> just set feature="false" before merging to tip.
> 

Regards,
Nikunj

