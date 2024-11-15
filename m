Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2065.outbound.protection.outlook.com [40.107.243.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1BD1D61A3
	for <x86-cpuid@lists.linux.dev>; Fri, 15 Nov 2024 18:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731694464; cv=fail; b=usajx0HbgKZfSgmX4ZZHedRb2yWTSYSZJ+yFXoXDX+tvcA/KPGtR+RzyqSDr0i8qsCFXMcQzA4cnWFqAKowspWYmlDihvToq+KFOQP5uVgYOsyIqFxIdqEO23MoTLEZIvvBA2mLFNcZPDAr7KRHN9dbv1+40n/eXjGeI6NagNYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731694464; c=relaxed/simple;
	bh=5qy86dfirnOwoLYPtGCVzveV3jeU+4PPZ8lQ2AEX26E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k3pBQbIXvpN7o07AHrDY1TKR+90xV7iPusq5t7zz4mECv6L3HM0+fZmSQAkG3N/8jFfy7TyCfHfZExVhO0o1hfQOjdMTGhPaa9DoLF1NN/eyf2FcRz3RrBZnFv96n433RIhBPuvQXFbhIxbwOYGRrD7ifE4vixxka3y/Q8o0dts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=sLMyyT1o; arc=fail smtp.client-ip=40.107.243.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="sLMyyT1o"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KL7SOXbvumUJfY5g5SPHHfI4XhfUNILE3HlZ7AKF8wGJB8l0bxy2Xvc8m0WlQWf3B+Yn9paBfg9ExIFIK2fQFJtLInuBgGK3i3kyRInRO3jdtN720fGqcmwKAwyYCdCKWauRTk1sKUCz2yA/fPo8sUkIZqWhqk5MHDTQtOnDVdKZ1nNAwE2c3QOj/SRxMMJrxMW+DjQcA0cAeL5RvXEmw/Cfa43BQG+qD6KPqoSRXHMZ6adQEM4rxLcJjuE4N+vQrdCOXFJcnW239BSCGvNgG98RS76DogQFNg/ZSQ1f3ZD8V/FOMOjUZIXwHbbVkoKT1Cr/Zpnc+IQxTpOJViEOyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gh2eVW6nWyTwUFVzm0/SHQwQeq2J0pRiSBSlELEFrEo=;
 b=LFGRzrNFO0ROIoppXwSmTaIrEdHcANXYwM2lVYmaCL2ABH9bi4aTPhSmg599fAEbzARPGdX93DhrZvzZSev2auEie5TgWWbjXUCvuT46Z68ecwP9zde1pXVBHTM36fklBD+pLiBK0kMXN3rwkQozV+ppCDuzrPl8aDKhX9ELeR8A8a1xTiDnSASSLWBtWeTmhy+XtBQX6mjdkOYKDNqSCWqPrccBrhFWIH2UYcrmX/dyhhvNVgyJSjYKcoUdgzcOozLSdSEsS4Wk0wYZ6s6MIAdNTRRWfUKCn7CsXX1/00ISl7shRxkQeoJ46YMS06wVTNJymFN9DfxbqpseiAGNxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gh2eVW6nWyTwUFVzm0/SHQwQeq2J0pRiSBSlELEFrEo=;
 b=sLMyyT1oyHWKpi5NSp2y/GDU0nYFkvm7YJkX5E1/I1nrG00PLNOSjpk8Bpz1MFYw0p3BJJF8zOB1gqcyUtjreiCh2TkI6BO5oyjG09VpadiQ8oSrCj3iP7NKGnpjSqDurKZS08IY0eOgzhfcOG1kXFEc9AT+7xOw552PwyfMFCk=
Received: from BL1PR13CA0363.namprd13.prod.outlook.com (2603:10b6:208:2c0::8)
 by SN7PR12MB8169.namprd12.prod.outlook.com (2603:10b6:806:32f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.19; Fri, 15 Nov
 2024 18:14:19 +0000
Received: from BN3PEPF0000B36E.namprd21.prod.outlook.com
 (2603:10b6:208:2c0:cafe::21) by BL1PR13CA0363.outlook.office365.com
 (2603:10b6:208:2c0::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.16 via Frontend
 Transport; Fri, 15 Nov 2024 18:14:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B36E.mail.protection.outlook.com (10.167.243.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8182.1 via Frontend Transport; Fri, 15 Nov 2024 18:14:18 +0000
Received: from titanite-d354host.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 15 Nov 2024 12:14:18 -0600
From: Avadhut Naik <avadhut.naik@amd.com>
To: <x86-cpuid@lists.linux.dev>
CC: <Babu.Moger@amd.com>, <avadhut.naik@amd.com>
Subject: [PATCH 2/3] db/leaf_80000021: Add missing CPUID bits
Date: Fri, 15 Nov 2024 18:11:23 +0000
Message-ID: <20241115181345.262296-3-avadhut.naik@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241115181345.262296-1-avadhut.naik@amd.com>
References: <20241115181345.262296-1-avadhut.naik@amd.com>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36E:EE_|SN7PR12MB8169:EE_
X-MS-Office365-Filtering-Correlation-Id: 739fa3ff-2ba6-43d1-ea96-08dd05a15286
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?t/YQVSyv9GLB8/r7EuBIWghjfrHTO0IfUB6T4wV/qrnW9QG3LuFXVjUoX5Tv?=
 =?us-ascii?Q?o2BMB4gqxKhuA0hZ1w+oyMKvvOCQsoqGPfO4b1Z2YdrIEyDKYhp6HtnRUKe3?=
 =?us-ascii?Q?VKfIjMu4ZL5XAyTBlsThGVEYmkryWV5Moo3Xl2Xa/OGi9CB89Y6ah8+GNd26?=
 =?us-ascii?Q?WVNmKG7P96jH4B43krIYnvwu1EsvS3W6g3I7vv3QXGydvrhaibz6PF3Np0gS?=
 =?us-ascii?Q?bD3JCDgiYGDE+rMFi1upnxxSAHphKq/ONG7f7cUHjA+4LGEq+AdwT8XGzBpB?=
 =?us-ascii?Q?36l4JxAkhddiFDQomQ9ncNCauu2Q6xCWDpZdIdpIE6b9Oqcuh+zWsgR0wJhY?=
 =?us-ascii?Q?XGl08aNhhx82AkWYKKUM2y13COj9JKMg5+DySTtRRDnhdmHUZGu0AiDgUD8w?=
 =?us-ascii?Q?a9ZW2EX4FTn2PDPexR8zdJFbb+RBVyWxLIFDwy8+/YyKP3KSJWB16PrO2Cdm?=
 =?us-ascii?Q?zrlA9iqqwr87++eyC8BWg08a2hvAoi7uKaMyL4kwlR8k6FmsyePKDqIGcT/0?=
 =?us-ascii?Q?2qTE5Nw9x5bnvNz4rk05Q+L9dPwM0bj2CgwOh6pyRDbj1O9Q5DEhhzBMtCop?=
 =?us-ascii?Q?f2Q1CO0WLsS7EKwxXWKobkELTHPLFPqK65IZC8/WTqP/MRlE+uuhk0zjVUjR?=
 =?us-ascii?Q?NJVq/DEYogjsxkoC51l4HDfZA52ICGnyJCd3zCMYKUmpIhz7exEDDH7mEvbX?=
 =?us-ascii?Q?FjVbuEY6E9AMDoSl8tzDksfQMibi8gH2c2PiMwMNW8PbKsHqZcoHK3Ocvf71?=
 =?us-ascii?Q?hC94O5EZ/Bkkb6qagEy1O0zZwVRWCq/I5l/eWuFWw+JrTpfRTo69Gve42kPK?=
 =?us-ascii?Q?j08QRxuTN9Dkuc06n4vMt11/Y9aOVxWPH4Kb8j2LstrYiIM/o6jEPsRX92ud?=
 =?us-ascii?Q?pTjbDUI+sw8QcpuX2ij06XHBqbIGTUHdVTzMjZfKo1kUGeDPPF4MO4DWM/Ac?=
 =?us-ascii?Q?+A4w/uSi8gHzA5bhVRWZJ4/USbt5EQzJbSkTyBhwUq3nyCcAqvGcsLdEjhOy?=
 =?us-ascii?Q?T02Nprx38gf9Wz+YcG3qkjYNR0Hocfyex3k9o3/47HriDu/3sS+J5tWYnlex?=
 =?us-ascii?Q?shxSbU5TBkfiKWuXbosoGnnHCgW8rbNRkX1QHDx/54if+IHY3zHd8HFKROPc?=
 =?us-ascii?Q?+Zk55uxZCJO/cJKPMmJh5LzHnwTJsaMnQUFEsyoE+qXj1BV2VekmbGQCpiHp?=
 =?us-ascii?Q?BCg9EzxmpnrRdZ1qEOEXEZAiwuvIX6qsL8uA/op7x78kG9SBXtYmS+mNggmB?=
 =?us-ascii?Q?lWGyqv8t55ze8soXj38UKjDRmlAcNE8zZLhIQJ8Y7/uJivlII3ZXhHvlRFx8?=
 =?us-ascii?Q?SBQZ7OFehxCfeXtJ2soKVpF5vNGf9nWDcZK59gloTbEzFNVYyVaojLNj3FMW?=
 =?us-ascii?Q?CMexsjQQlpL3fmZM97WX/ywn14fd0mseD8nETIp6bphftLif8w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 18:14:18.8144
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 739fa3ff-2ba6-43d1-ea96-08dd05a15286
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8169

AMD's ZEN5 generation SOCs introduce the following new CPUID bits to
0x80000021 leaf:

WL_CLASS_SUPPORT: Indicates support for workload based heuristic feedback
to OS for scheduling decisions.

ERAPS: Indicates support for enhanced return address predictor security.

SBPB: Indicates support for the Selective Branch Predictor Barrier.

IBPB_BRTYPE: Indicates that PRED_CMD[IBPB] MSR flushes all branch type
predictions from the CPU branch predictor.

SRSO_NO: Indicates that the CPU is not subject to the SRSO vulnerability.

SRSO_USER_KERNEL_NO: Indicates that the CPU is not subject to the SRSO
vulnerability across user/kernel boundaries

SRSO_MSR_FIX: Indicates that software may use MSR BP_CFG[BpSpecReduce] to
mitigate SRSO

Add these new bits to the database.

Signed-off-by: Avadhut Naik <avadhut.naik@amd.com>
---
 db/xml/leaf_80000021.xml | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/db/xml/leaf_80000021.xml b/db/xml/leaf_80000021.xml
index 1daef091e686..ce1a8dcca805 100644
--- a/db/xml/leaf_80000021.xml
+++ b/db/xml/leaf_80000021.xml
@@ -37,8 +37,40 @@
       <bit10 len="1"  id="fsrs_supported"          desc="Fast Short Rep Stosb (FSRS) is supported" />
       <bit11 len="1"  id="fsrc_supported"          desc="Fast Short Repe Cmpsb (FSRC) is supported" />
       <bit13 len="1"  id="prefetch_ctl_msr"        desc="Prefetch control MSR is supported" />
+      <bit16 len="1"  id="opcode_reclaim"          desc="Reserves opcode space">
+        <text>
+          Reserves opcode space 0F 01/7 for AMD use, returns illegal instruction for opcodes
+          in this space.
+        </text>
+        <linux        feature="true"               proc="false" />
+      </bit16>
       <bit17 len="1"  id="user_cpuid_disable"      desc="#GP when executing CPUID at CPL > 0 is supported" />
       <bit18 len="1"  id="epsf_supported"          desc="Enhanced Predictive Store Forwarding (EPSF) is supported" />
+      <bit22 len="1"  id="wl_feedback"             desc="Workload-based heuristic feedback to OS">
+        <linux        feature="true"               proc="false" />
+      </bit22>
+      <bit24 len="1"  id="eraps_support"           desc="Enhanced Return Address Predictor Security">
+        <linux        feature="true"               proc="false" />
+      </bit24>
+      <bit27 len="1"  id="sbpb"                    desc="Support for the Selective Branch Predictor Barrier">
+        <linux        feature="true"               proc="false" />
+      </bit27>
+      <bit28 len="1"  id="ibpb_brtype"             desc="Branch predictions flushed from CPU branch predictor">
+        <text>
+          Indicates that MSR 49h (PRED_CMD) bit 0 (IBPB) flushes all branch type predictions
+          from the CPU branch predictor.
+        </text>
+        <linux        feature="true"               proc="false" />
+      </bit28>
+      <bit29 len="1"  id="srso_no"                 desc="CPU is not subject to the SRSO vulnerability">
+        <linux        feature="true"               proc="false" />
+      </bit29>
+      <bit30 len="1"  id="srso_uk_no"              desc="CPU is not vulnerable to SRSO at user-kernel boundary">
+        <linux        feature="true"               proc="false" />
+      </bit30>
+      <bit31 len="1"  id="srso_msr_fix"            desc="Software may use MSR BP_CFG[BpSpecReduce] to mitigate SRSO">
+        <linux        feature="true"               proc="false" />
+      </bit31>
     </eax>
     <ebx>
       <bit0  len="12" id="microcode_patch_size"    desc="Size of microcode patch, in 16-byte units">
-- 
2.43.0

