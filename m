Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2048.outbound.protection.outlook.com [40.107.94.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA631CDA3F
	for <x86-cpuid@lists.linux.dev>; Fri, 15 Nov 2024 18:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731694441; cv=fail; b=HULByseWL52yxvQjuSEio+t7s58xeUcQRhAHTsvhJpTzQoS+TYhLKwgmcLLSEn3aFn73uryHGNBgtidVpV/1FjIkikVtWv0sXakM8T7EvNr/mumM/cBRQeS6te8pM0i3+IgOOBwnFjOIJWstKzph6sfdDv7jiL8rmFPbqPeRDvA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731694441; c=relaxed/simple;
	bh=B8l0vwPE2IXaVhdw3xLS6NGsx4TNYY4pEH6pRBioPHU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=T48ENnQa/GFv/5xXhKrXREvCUEppclUtXoL9hUrLf5xQFXeF+t9wgeG5YWo7yM51ZuqVu9K89sfay80m7T1rtPUElrazeaYj4lHhQaf+P8QUBrGE3/guKnQEENhrMLHB/U11jaBGPUht0Dop60qcC+afHzzLvxgCq69JBD24auo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=zOAmAUSH; arc=fail smtp.client-ip=40.107.94.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="zOAmAUSH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N9dPdrS0ezwecqu7LDtec0v8FkOxsiDuACkkoRzf1FhfbmJj8JqhD9cHavK/ZXLd1ZrgoIXZRBtns6jTrVq/tVsCRvCVoNbMeWwBA/5J9wtw/wud5lnwjKQ9yDE6YDuKSCdknQuAkptEQaQrwqZ8SkVT74fAdwQT6S1FPGTYO48qOEIAigQJxbTj+x3hsehMiC3+jArxx04Z/3gm+6jUvMm6E4uG8BjtCHMu23jDyu3fjvAcMAjcfQHuuM9cZLaDGqe7UadZyu17/Rj/Lx/gYiGRZz4ri/k4GzTs8Mu2oVpLZQhuyXTv935SM5h4MwiOVn+zKioAZRnmQtsGGHuEBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ef2hJt9TG4WjBQhVm8dDrHiY7O5iarzL1MzmFReKqnE=;
 b=wyueUKzd5+RNZ1vfvtyLODGuLpoIHJYOVA9AdTMCk6A1roAH17aYA/yB/O2ZPGH1nHfqivrr80mbNK2H8yVvWNoTy5qykpDONpNEuohPMgD0JG0b067eGnG8Ldv3MJ1On1Ekgn7wW+8bQhSIuOAcLFPJhNGf8iTwHjF26CjvyYqzyBcUTOEmNUCJ15+ZsiwWiVwWoET2bp7K+JjjCrFOFt3LsK/qwM5qN2rX7MGJSJeZnt1PmGpRGLZ0jIpFhvIKzbNNPtSnF0lAADwPavxAED3zZTFr1eWhvCzi2LXv9fPAlPYuSLCEnazlgXt/mZzCs0W13CRPHXG59fWQzVShCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ef2hJt9TG4WjBQhVm8dDrHiY7O5iarzL1MzmFReKqnE=;
 b=zOAmAUSHX//KoAcnQFKv3Tmgx03a0Qg2jRxpvGLV3hJOPSvXGpdDsjqSbv5/+WVgNg0eR3Pbg7XeMviushoW6QOBiIf9Ug2BXvTvD/R7Kf9anJ1tPtXWJYXOR21ftYmNvIu/TicdYyYLGMSadQKXmoBNY6esVNkdXzBmJtZZ6Iw=
Received: from BLAPR03CA0055.namprd03.prod.outlook.com (2603:10b6:208:32d::30)
 by CYYPR12MB8992.namprd12.prod.outlook.com (2603:10b6:930:bc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Fri, 15 Nov
 2024 18:13:57 +0000
Received: from BN3PEPF0000B374.namprd21.prod.outlook.com
 (2603:10b6:208:32d:cafe::7d) by BLAPR03CA0055.outlook.office365.com
 (2603:10b6:208:32d::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8137.29 via Frontend Transport; Fri,
 15 Nov 2024 18:13:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B374.mail.protection.outlook.com (10.167.243.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8207.0 via Frontend Transport; Fri, 15 Nov 2024 18:13:57 +0000
Received: from titanite-d354host.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 15 Nov 2024 12:13:56 -0600
From: Avadhut Naik <avadhut.naik@amd.com>
To: <x86-cpuid@lists.linux.dev>
CC: <Babu.Moger@amd.com>, <avadhut.naik@amd.com>
Subject: [PATCH 0/3] Add missing CPUIDs to the CPUID database
Date: Fri, 15 Nov 2024 18:11:21 +0000
Message-ID: <20241115181345.262296-1-avadhut.naik@amd.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B374:EE_|CYYPR12MB8992:EE_
X-MS-Office365-Filtering-Correlation-Id: de3aae93-5fde-4470-9e53-08dd05a1458f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?INqJZkCOPtuR8cuJBvhthLL0c6nsE5e/InqXFW7RB9QaDGvrwgsGXYThJx92?=
 =?us-ascii?Q?GoXAiVMw6lJSf36KqZSzDBlDlwnltGdHzaUsZYY8E/w2c5ez3sKK5XyftI+4?=
 =?us-ascii?Q?4ZM+6mCk2vQS7ksOuaoE9tcURI0v5rqGt4hihBybRUQUSQOQtFjv3e1ASNsX?=
 =?us-ascii?Q?3lHxvERth1Ed08Gdv1LzlcllCrPcpYELkqTDN0DM5EDRVXsr98kqjYRAU8pB?=
 =?us-ascii?Q?rj6WYKXZoV+AKjPbHU/poMVK39yZCrR1mfUoJA1Cm8qNSnvxmgrxf5z+QJT1?=
 =?us-ascii?Q?3g9kcKingCjnb0BYGRYyqUxz+iteUjvry93PZkTZrX68fXnQghuDFrzQ5jx8?=
 =?us-ascii?Q?A+3d1xIcWs0BUsh707SOjMXDfmuBa6kt6cP1IommqxFJ4axWghXlUGYOcSjI?=
 =?us-ascii?Q?OcxcIayytU/Fsl/0us9h7pRPPQ9AYAQ1QwtbjDbiTf/3L+JDVytao0r6um96?=
 =?us-ascii?Q?pKHu5C75992G24oG3Ek8kAedIXt53gibVJ+gwguFri+mBhfRgY2KMX1SxDtj?=
 =?us-ascii?Q?wAVwnTVN7hr5H8+jqYUmtQ06zFV+8JRw34eCrUbiOGmtP5beEruMl3RlIPhn?=
 =?us-ascii?Q?ENtj0SbtUOiXvbmFG5euBeBT2xbgtB5ozXdZyfjVODLVutZgj2AygVjyj3Fk?=
 =?us-ascii?Q?lgXVdQyfT0gjTOUBYFPSxAXNBnRFWV0wZ6vlVQPwM0wM5hDPA7BGUYH686vt?=
 =?us-ascii?Q?e3X7T7b2DnCcf3OpeKMxN1BL02q7UMtfBb8CGdOIaQiu/nL0v68GUA9+W276?=
 =?us-ascii?Q?yIEmVoVeIZ+aqn6Kig/7DTXmJj9dEo7ma4H/wHTE2PTdMqRz0AepznK3ihiV?=
 =?us-ascii?Q?b/m66hzWFar4t2K15gp0Digrl9Uh3hsdH3pyLDFQcqht4LpywO/tAXP8A+J/?=
 =?us-ascii?Q?nWqCTaav7+DmaM7u3A6/RHvbI9SHreLriXbHEMp7Vv+s67uH7e9/p5CdY0A6?=
 =?us-ascii?Q?ULTkhB/L2BTAvkd73qiC28Yz/wcSkcd9p6YzvOgwuvLN5/hy79i8NXcumQ8J?=
 =?us-ascii?Q?/9UhsPQPddQdpCHq/ce3bKr2FQP/owNyVrpG67xQBi86rsy2QpFuXkLSkfXY?=
 =?us-ascii?Q?x+pUlER+MNkr7N95F/IhXhshh5tgaB/Ih3q9g0QvvRiwtMEOY3TedDyFT4bw?=
 =?us-ascii?Q?9/xOt48d/nFDbwmUNjH03pB8K0cx3F7JJkrVK4fZYi2zpDyyCnaE2zx5ETGt?=
 =?us-ascii?Q?IVxr4urnfoYtbDQIpUooNwrOxde6i7wCTxzbdbL+bNYIk+8sHNU/sAGPa7MO?=
 =?us-ascii?Q?f3ClCG9XPUFN5DJ2dlfIHvJ/pQPkoNZveQIA0lPaAyPCXFIE+HXjM/c3T/O0?=
 =?us-ascii?Q?iC8UAAHGXBRBAcF0onHCBk8Q9gFss3IT4v+fmXPrRVcZm1ov9C1fy4ntIxTJ?=
 =?us-ascii?Q?7iP4ggHOr4YCsZompLwmYLCufqgOVudUkXOv9635Q7ypkt6L0w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 18:13:57.0767
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de3aae93-5fde-4470-9e53-08dd05a1458f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B374.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8992

This set adds some publicly known CPUIDs to the database. These CPUIDs
were introduced in AMD's Zen5 SOCs and have not yet been added
to the database.

The first patch adds ABMC and SDCIAE bits to the database.

The second patch adds WL_CLASS_SUPPORT, ERAPS, SBPB, IBPB_BRTYPE, SRSO_NO,
SRSO_USER_KERNEL_NO and SRSO_MSR_FIX bits to the database.

The third patch adds Rapsize bit to the database and modifies the number
of bits allocated to MicrocodePatchSize field from 12 to 16 per Zen5 PPR

Avadhut Naik (3):
  db/leaf_80000020: Add ABMC and SDCIAE CPUID bits
  db/leaf_80000021: Add missing CPUID bits
  db/leaf_80000021: Add Rapsize CPUID bit

 db/xml/leaf_80000020.xml |  6 ++++++
 db/xml/leaf_80000021.xml | 39 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 44 insertions(+), 1 deletion(-)


base-commit: e1dbdd1664078cb8961ae0ef0253c4e86ee755e9
-- 
2.43.0

