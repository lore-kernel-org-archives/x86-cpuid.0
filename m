Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2089.outbound.protection.outlook.com [40.107.236.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E326A1C68F
	for <x86-cpuid@lists.linux.dev>; Fri, 15 Nov 2024 18:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731694452; cv=fail; b=ED1DMVuZSHV7dnoZWwHot+m9I+cfGjHPbOLmxkRViuOIkuGJB9POObPTGdwJoec2kgG9yRxOdzS0Snna7hnCVRuEVKar9OCJ8wjMkCWpHKfybt6MiXzT+41BR+Sjq2/q/sFpx7T0hU/zZveiBUrgtMUK8WF86rnig9FfVHIKNt4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731694452; c=relaxed/simple;
	bh=69N0O1dzckQtFNtya/sT3FStJU30uhUUN02eBscq/Xc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IGQD4DT+E/rfyO2356Xt7Crfz6MqtasxAr2ekr4lKHtjv+fB5Uy6wmDt2ZxbvzDxalR5wUbRHLmqFtybVL7jjZh3jHjRRuVwU4wH3L+FXmI728MR0L+KMi30vPHamF/gn4R6+ScfcUyPNRblQUzAPRtmnnlvthoYJkHmTfTgVG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jFNwzyE9; arc=fail smtp.client-ip=40.107.236.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jFNwzyE9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HAkPq4boy8d5yzzOFpYkWyd8iMLa/ZAsnIn8q+AIT0yaenPUVhlISPtkPd53QLReXzdgopyjjqTtfdMb4+EztWqw4paiV2NE9Ygx0tNM8xHggVMhjLQvkcjsZdaEZqsSHRJrbD+1wYccHSlu2E27jmFhmw/H5lVwKNPhzou2OxBm6wtnxxzS8gjwT4/z4Gh2/bHNMkdCdKxe8KwhmME+7ZHjYQ5ydQhfOzUIoVdDmbXlLZNTzN+JhE/J+RcP0sIAOc7zGYy8GwMhymdW6TglXt/eQ3nkIEr2PQwRX4igW5nrVCLVCecTf5oPPeWyPl+sJydx5mHQFG0EQTXD18R6BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vMhtOj5lnarEbxfhuCd2vDq6wtxEZnyKtlIj5AfxwPI=;
 b=Zvkrc7+C80vD51bps04j8m16GSgNMcVX3UlKGe3Tytr68aSuGyncCzpJ0bFlT2+y4kXDjCuf23NTWP4fAcip8IyYm1MKzvpTj2nIgwevUSMSMK3rjZ+ryzkq68EDCoPL+qCTtvVfm3vWgNdG1VcZwj0suofUVhzVw40vH3eYaCX1hwnDS6lbyXTvTBlHfdnoyf1ZEwpzc24TbdZlch0sU1rP+algzTVK80IZ7bjN9CMT89bLOf/gaU0qlfEsVDSrTxnFnfzEH1/+dYbJS7Lc32N/z0ZmbEKTsG/kZJR7JYTH3zS7ZoBAF7IMWfGw8QccfCt3lIK+mmL8zpjl51wW5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vMhtOj5lnarEbxfhuCd2vDq6wtxEZnyKtlIj5AfxwPI=;
 b=jFNwzyE9bST9vtW+hygbShS6Yx9Kvse0etqHcF3nFmMKceI9s/YwHH0AeXVW+mk6gJEWQNyXi4QRh3mXmuXH8WT4D4rNxzndi8mIbXWOt9jELpEa3OjvEn0HkWXg8pCeqGP+40g+B+Zc8o72oaDAHn2c7niXijxaXcuhjXQ9ScM=
Received: from BLAPR03CA0051.namprd03.prod.outlook.com (2603:10b6:208:32d::26)
 by DS0PR12MB6560.namprd12.prod.outlook.com (2603:10b6:8:d0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.25; Fri, 15 Nov
 2024 18:14:08 +0000
Received: from BN3PEPF0000B374.namprd21.prod.outlook.com
 (2603:10b6:208:32d:cafe::11) by BLAPR03CA0051.outlook.office365.com
 (2603:10b6:208:32d::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8158.16 via Frontend Transport; Fri,
 15 Nov 2024 18:14:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B374.mail.protection.outlook.com (10.167.243.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8207.0 via Frontend Transport; Fri, 15 Nov 2024 18:14:07 +0000
Received: from titanite-d354host.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 15 Nov 2024 12:14:07 -0600
From: Avadhut Naik <avadhut.naik@amd.com>
To: <x86-cpuid@lists.linux.dev>
CC: <Babu.Moger@amd.com>, <avadhut.naik@amd.com>
Subject: [PATCH 1/3] db/leaf_80000020: Add ABMC and SDCIAE CPUID bits
Date: Fri, 15 Nov 2024 18:11:22 +0000
Message-ID: <20241115181345.262296-2-avadhut.naik@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B374:EE_|DS0PR12MB6560:EE_
X-MS-Office365-Filtering-Correlation-Id: beccfba3-13f2-4bcd-1869-08dd05a14bff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1nEPZIU2O7QRD4CZUih2dHBAm8CAK+bNdqQkjwnoDDBWJs1mxsSiefCmxmvq?=
 =?us-ascii?Q?9OxGeptec2bIff1M5h7HTB43DqXOQdlAmIXUosHNISINsfAb3MG3LqVek+wX?=
 =?us-ascii?Q?Y9MuJuR2hoh87U9Mc39x9c01kjBa+PnbCzq4JOfn9Cxn/bDTcEDfsArglP4A?=
 =?us-ascii?Q?XqmuclZTBYQKr6512u6hsq+RVpgp+qgmkStuStS8310YyZHJdeXiH1PsWvaX?=
 =?us-ascii?Q?3xcwm+ZoG8LCt27GqrbStrShAwlvLG7a8ZE5eGJ8/q2rMXUY4ypviJSajsLS?=
 =?us-ascii?Q?ed+fr6siUQQueLrgrHM30Uzzs22MS0Kpn0pZ6HP56K3bRTS/a7f06QNDH6/p?=
 =?us-ascii?Q?Npo5U1hqY0qfC0UfSPOvGQjXbu39gZPICfLin6gXIGJ0K9+LUn4NLYtolhFQ?=
 =?us-ascii?Q?j55KfOL2ba0Oiuk8mHB5pCTTfA0koGonriORdlDHanhdCmRR2HPhPFvcNqzg?=
 =?us-ascii?Q?2zWtJvAWhD4EwJiYM12fKWWF41MtTbD1tvei4BPzmudCWUBudyhE8k10BsZW?=
 =?us-ascii?Q?8+BRT55kF/GOTy21y0iz6JrytohFvde5FAexfCgvB9vxv8Cv15S8q3B1OLIN?=
 =?us-ascii?Q?EQzbIfCZeGMNn30M1KukkgvZ958VAVOIbKtCJHTB+pWRse/BE34fJm6MUrO4?=
 =?us-ascii?Q?8kgZbh0RYwL07zOpQnGalunmwVqBGp1MBqc0x8i5UsU6MJzXhhPcbRnT3wLb?=
 =?us-ascii?Q?rUy/7JpVokbFunIBUdVsRd14IdS0HEtXLQ/ec1SQTTb8rsO0Xg7nxVnF6Kb4?=
 =?us-ascii?Q?QVn/x58m1ilHqU5Ojk8/XakBzsXjUMlhWil2Y8gepHsMUjR+eqmRVFLLg7UN?=
 =?us-ascii?Q?5+CEj3oZNJwVDWv7ixDktlwa+WBkC9SGW/cAib3SG2KVUNpl1t9zOaMEuzPo?=
 =?us-ascii?Q?Z2pa0GDNTj3C2bJYc3NaDX6njiDFvl85a36agqjcrwrpOE1hrytZ8k6tHIzH?=
 =?us-ascii?Q?KyuyRSrWxvOBoABGmuSKsUkCi1aSiNm4KACAYgQn+TK0QDs3DYF9jCihTwrx?=
 =?us-ascii?Q?fh0BuHLcpfvFlhhYIKBrb0hdF+NCEryU2xQ1v5iQPlyARXXvnYto8/n9AccR?=
 =?us-ascii?Q?vCz2DTuozgQqlki048L0id29Og0kk8uAsgl+XjNg8PKoZSTqyP3aqX++kVRe?=
 =?us-ascii?Q?JcgsAJE8ucVReXZrsOU9xSa4xx9bsrZ4rRW5P2H7VmhyTj4b7WBjgrNEigV+?=
 =?us-ascii?Q?h6GxxcM18Wy2HhbpUvDHxMuKWLfwMcmDuGhz+WtWcy0wfrKzTtr5s04orFGJ?=
 =?us-ascii?Q?UUnf2UyF2TMRQOCMxWuddFQSpmfWNg8yutamiadVyn6T7M2PdrL/gDPdxWAj?=
 =?us-ascii?Q?BUS0f3PiWqSnL6HpbiexyvSIAGh1gk1iPXdywRJCMYFEAmKaKbfRO+PnUiGL?=
 =?us-ascii?Q?/zFLmbSPxnDajGodFGwVMhn6GcQH6k6RmoYaxS4AFZvpejR2/g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 18:14:07.8736
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: beccfba3-13f2-4bcd-1869-08dd05a14bff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B374.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6560

AMD's Zen5 generation SOCs introduce two new bits viz. Assignable
Bandwidth Monitoring Counters (ABMC) and Smart Data Cache Injection
(SDCI) Allocation Enforcement (SDCIAE) to the CPUID leaf 0x80000020.

Add these new bits to the database.

Signed-off-by: Avadhut Naik <avadhut.naik@amd.com>
---
 db/xml/leaf_80000020.xml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/db/xml/leaf_80000020.xml b/db/xml/leaf_80000020.xml
index 2ae6e6e93a70..1eda95b37dd1 100644
--- a/db/xml/leaf_80000020.xml
+++ b/db/xml/leaf_80000020.xml
@@ -27,6 +27,12 @@
         <linux        feature="true"               proc="false" />
       </bit3>
       <bit4  len="1"  id="l3rr"                    desc="L3 Range Reservation support" />
+      <bit5  len="1"  id="abmc"                    desc="Assignable Bandwidth Monitoring Counters">
+        <linux        feature="true"               proc="false" />
+      </bit5>
+      <bit6  len="1"  id="sdciae"                  desc="Smart Data Cache Injection (SDCI) Allocation Enforcement">
+        <linux        feature="true"               proc="false" />
+      </bit6>
     </ebx>
   </subleaf>
   <subleaf id="1">
-- 
2.43.0

