Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2087.outbound.protection.outlook.com [40.107.237.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7731C68F
	for <x86-cpuid@lists.linux.dev>; Fri, 15 Nov 2024 18:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731694476; cv=fail; b=FCTsHnj8aCXWSgo6pB8LafeEK4Y5xbJnup57rfzOBvJF5f3pV+4XSRh8y9atiPCEz52oUCPeCG9rGm0+v3DMUR+Y5YIZEu7axs8EP+yqoU1aix9+ZKuHFdWQtz2LFvdG54fhb/6kuZAz4M8oKw592uuZY5HlHUpZmVEg6xrbEas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731694476; c=relaxed/simple;
	bh=OeJiD7ChSXdxx2uTJF0eBrV35Sy2bOKfUG6deLOrw+g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WPvcCn9y+XcyngkWIrXdoXcfur67l2mgqy42S4SYR7Y/4JDDQQPduWjRB7nSekNNPKEsLgftyasiRZGiL1E0sXT93G9Z6e5wCy/kfUFmO1YK+plWWU4hI/Z7zcNJzeE+1komEU+9Ga0q+rdVwLKJEA9CRJkqMlbjjfPa2fGGE1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IsGVJL35; arc=fail smtp.client-ip=40.107.237.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IsGVJL35"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xQJDldNAbyrRCirdnCQSYhmISXhO6L6HR3y/VuMjnAsL/qelHlWADsPUAajYzKtcvogzHp3YIS+vlHnGrPeG2MmURLXweEUmdioACd1qZAJYmCCppI4LwXbrzRZ2/QpI8SHKyv83tdiZLrRhZll3wAtryqkf51fSpsKawKrJ1wA9VLkTzMnuGThhGh7nTlKMDGITRh8zDIRJFJoHhjklTj6CWZPSFHxyPpa/cgVl85El+ye0VNlQnVUJcfW08Ue4guqrlAFm8JXYULO4IGRgWgmpN/FdJSKvZ/WVpIx5ydPbS7p2okcRi+SjCzXxqfB5Z+ZMlQt9tXig0Vhk6BWkZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rvgl/cySKVH4vN9vJR4ZPrCM6Zrdrwp91Izl0725XC8=;
 b=TZISsI19UgRoBLThKhJdpMxOm66m/GCiy/SGU9vjgng7CaFohsdPZJ7uJXRrZ1fYQHs8mLc6Y4j/obz1FJtCExJhHIKmJD1v9skQLytLiZWAR83D0kTTWXPRcThSy9xXKPPo/Fy0xvuN4JdpBL4tfRwdDbsEV7kaFeMGgO4wThxXCi/ue1kXnV/I2mb21GXd/J8yg329fD+zKzGWd98XPGWPJSKLA/Om4y+P65tMHYruO9huGE2PY9ww8T+Qrh5SQS8hQBRkWNwaq6fat1gsqUaCZaHBXqzQM9xtMpVng2pFjyvF+gE9S8UYNvGWHaC7b1TT3sbZJ5g2OoQrImgpoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rvgl/cySKVH4vN9vJR4ZPrCM6Zrdrwp91Izl0725XC8=;
 b=IsGVJL357hKEJc/12lMGOHrAG70nTKg9A4K3zXDlKM9OBTDiHo1UkpKn8YfP5qLV+ovwie60mxx8o1+NVCNBwBzdXbfMQ4MAytyxycPNSlgJcIe/Otw6gFQl5FfoWsC03/dpF6j5TeYDhhNMytVqQ3m7qH7Dcfr0z3GCjqRUm50=
Received: from BL1PR13CA0387.namprd13.prod.outlook.com (2603:10b6:208:2c0::32)
 by MW3PR12MB4346.namprd12.prod.outlook.com (2603:10b6:303:58::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.20; Fri, 15 Nov
 2024 18:14:29 +0000
Received: from BN3PEPF0000B36E.namprd21.prod.outlook.com
 (2603:10b6:208:2c0:cafe::7d) by BL1PR13CA0387.outlook.office365.com
 (2603:10b6:208:2c0::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17 via Frontend
 Transport; Fri, 15 Nov 2024 18:14:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B36E.mail.protection.outlook.com (10.167.243.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8182.1 via Frontend Transport; Fri, 15 Nov 2024 18:14:29 +0000
Received: from titanite-d354host.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 15 Nov 2024 12:14:29 -0600
From: Avadhut Naik <avadhut.naik@amd.com>
To: <x86-cpuid@lists.linux.dev>
CC: <Babu.Moger@amd.com>, <avadhut.naik@amd.com>
Subject: [PATCH 3/3] db/leaf_80000021: Add Rapsize CPUID bit
Date: Fri, 15 Nov 2024 18:11:24 +0000
Message-ID: <20241115181345.262296-4-avadhut.naik@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241115181345.262296-1-avadhut.naik@amd.com>
References: <20241115181345.262296-1-avadhut.naik@amd.com>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36E:EE_|MW3PR12MB4346:EE_
X-MS-Office365-Filtering-Correlation-Id: 58473329-4cd9-418a-137d-08dd05a15907
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QkE3TC9tSEFHaStUODhCb2pCVmdGZlBLeFpjUFVuOG84ZUNob09nSFBoRUtp?=
 =?utf-8?B?VXpEQ0JHM1dPNkRFaENFWXhSY3U2TWtEZXdqWXVRT2w3cERYSVpWSnVoMnVj?=
 =?utf-8?B?S3Y3bEM2QzNmdDBVMnZ6OGtoaEpTeU9FNmFjV2o4ak1HRzJiWUprMHNRaTRV?=
 =?utf-8?B?bkd3cmlDUnlvV0NKNTFUWi93TlVOZkFNak5PTUM0UXBVZk1PVGV6bEV4NjZ1?=
 =?utf-8?B?di9od1JDVFVtc2lNMWR5ckRzNWNzU3NsclBDQXhVVjFWUEE2ZVBPcHZ6ZXZE?=
 =?utf-8?B?Vm9sVGNwMDF3VzJzQXp6cjFna0pCalRzbEFKUFJWMzlJSjQrODV3US9HTW9x?=
 =?utf-8?B?bkZ3RytKR3J0OVlmTmF2Zi8rQk1wWkRrOG4rREVwdUYvSUpVQitxVEY2STZ2?=
 =?utf-8?B?eDY3ZjJpbm50bkNsWW1RYU03eXdMWk84cW5tVFpINmFOK21RZnlzTWN0NVpq?=
 =?utf-8?B?Umt3bFJ4d0VkWjM5WGNPQTVXOEkwTGdaQXJIZUE4Z2ZsUlczVjNDVjNFeUFX?=
 =?utf-8?B?NllCUGphNXFZaC91NVVwMjVUUDhSWVd5c3pVUXNTUlRzaDI3YmNoMjlHMUxv?=
 =?utf-8?B?Y0xzMDZXR2g2YzAxeE42WjZ3ekJnQWV2NzI1bTBDMWRnU2c3cC9kWnF4V3dj?=
 =?utf-8?B?Y1pXMW9ET0FyTlpBelBkMnoweGQ3MkZqS2hPdm91VmRHU0tVZGRhcGRpaUlU?=
 =?utf-8?B?cC9HKzcyNW5maHgrT1BTMEgxamI5czdWc2hxY0xUK1VORWdqaUxYNmtlZUo0?=
 =?utf-8?B?MWRsQ3RxbmxncndXNCtDS1MrZTRKK1YrZUJld0hlbDhvLzI1S0hjRGZwWTVZ?=
 =?utf-8?B?YmdIS2l2LzJZUDg0ZUZ2eXhMLzVsZzBhVUlmL2tLd041LzNRaVBGMFRFb1g2?=
 =?utf-8?B?ME0xR2VtZlBWSThmMWYrQ1FTOGxXeE5IL0NvWER4L2M0TFJQYVhXb1pLdXh3?=
 =?utf-8?B?OGVXalg1VFpPRXRVdG9JNDJCMHc4Um9jODJ3WDByeUl2emYwQkc3eEFqa1N1?=
 =?utf-8?B?L1EzYTc3VlVYMU1LeTdRam85K1MwcG9NQ3QyT0J4N0NJMU1aUEwvQ1FDYUxV?=
 =?utf-8?B?WkRoWnAzSFlxQXlZSE40UFRRc2VRNFBYM3BBQkVVazNxRGJhL1hDQnMwSUxJ?=
 =?utf-8?B?Y2F5UVhFWUFwV0Jick9xQ0hQWENIL1lEbHdNdXJuS2FyVzgzbXMzYVV3VklU?=
 =?utf-8?B?QVF5UU5WcFpCSUZjaXVYa2haTXZyN3FaY1ZFRW5oUjI5OEtCOXNiOVZJK2NT?=
 =?utf-8?B?cllQbm5GcC9SZHVlREJKbWc4Tlg3ajlNejlnK2pGT2xRNUdlMFlEZUwrRVBs?=
 =?utf-8?B?cHc5UGpCN0FTS240SHJ4TU1INmNibUV2MkZHVndzVUVvWllBdkhxaEVBajc2?=
 =?utf-8?B?NUNPc3Nva3NmS2VucVpDTytjNnRmdUZzUHZuVEwwOURveUdGOS9XN0s0UUky?=
 =?utf-8?B?U2V3RE40SEp3cXZpTlNyc2VJWWhyUUd2K0hrb1ptUkk1SXREWEErQmo4NG5Q?=
 =?utf-8?B?RTFtK2wyc1p5Nmd0QXQ2azNSbVJDbCtyZkRYL3BRemlBcmwzWlVkczNqTVJo?=
 =?utf-8?B?UkVqMysxcDVXMmlEN29SZE5LVVpmNlBkenViQmxocFpKNzFHNy8wNmhNMFI0?=
 =?utf-8?B?QjBGWjd4aG8vR3BUdlc3TkhjTDQyTG82cTNXSmlrSlJzRWV5QTUyaXpQa2hK?=
 =?utf-8?B?TCtPY3M0VE40MzRmQ3Y0U3RMSGV5NXlSR1AwNnFsZ0VZY3JZbFNVRkZpMEJ5?=
 =?utf-8?B?MjUwdFplM0UwNldYeWxkdFdSK2VUcUUyU3oxbkZUY1liVzdhMnU0UVJDSjN3?=
 =?utf-8?B?b25DZDdtbng2Mnd1NkdmMnR3SnZkaWx2ajZHZlgvVmRSaldJRllySnBzUmZP?=
 =?utf-8?B?Z1RqNTBOMVBZS1hlU2IzdGMzNkFiQ2R3azdFVDRoTktwTHc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 18:14:29.7206
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58473329-4cd9-418a-137d-08dd05a15907
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4346

AMD's Zen5 generation SOCs introduce a new CPUID bit for Return Address
Predictor size to the CPUID leaf 0x80000021.

Add this new bit to the database.

Additionally, the number of bits assigned for MicrocodePatchSize field
has been increased from 12 to 16 on Zen5 SOCs. Modify the database
accordingly.

Signed-off-by: Avadhut Naik <avadhut.naik@amd.com>
---
 db/xml/leaf_80000021.xml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/db/xml/leaf_80000021.xml b/db/xml/leaf_80000021.xml
index ce1a8dcca805..64d8e57b7582 100644
--- a/db/xml/leaf_80000021.xml
+++ b/db/xml/leaf_80000021.xml
@@ -73,11 +73,16 @@
       </bit31>
     </eax>
     <ebx>
-      <bit0  len="12" id="microcode_patch_size"    desc="Size of microcode patch, in 16-byte units">
+      <bit0  len="16" id="microcode_patch_size"    desc="Size of microcode patch, in 16-byte units">
         <text>
           If 0 is returned, then the size of the microcode patch is ≤ 5568 (0x15c0) bytes.
         </text>
       </bit0>
+      <bit16  len="8" id="rapsize"                 desc="Return Address Predictor size">
+        <text>
+          RapSize x 8 is the minimum number of CALL instructions software needs to execute to flush the RAP.
+        </text>
+      </bit16>
     </ebx>
   </subleaf>
 </leaf>
-- 
2.43.0

