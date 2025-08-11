Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2058.outbound.protection.outlook.com [40.107.212.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3932225793
	for <x86-cpuid@lists.linux.dev>; Mon, 11 Aug 2025 12:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754916785; cv=fail; b=m57H0mONPpnjsNrkcSDUlTyH4SNkmqOXFn2fpml3kigx/nxydd/ZKJYIvY+ru1jxMBIAj2GjMiEVCeqmU1asfQEd6DC8GE9asNU7DpvBSC9x3ip+mtPRClNbtPekjXeWpgnWOzYx7GkJNLIfTZx671CGVcRQtapgDNh87EbJ0Ts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754916785; c=relaxed/simple;
	bh=YPVqa/KREln31u4UjsA3DOK9pMbSB6bIZS3nG5BrRfw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=P9kgV8zhu6RcRqnyNvQ/7aNHKaOjmmItxTvbhjqz/aewxxkZ+39ZDW7eEuKYpqmZ9lKIY8T3mM9TgnR8WO5sXZPvlMA6tzEX9IRP+6yKudHR5M1BXTz/FsEiQZdfs8w92clyRnmj98BnEr1qjvq5FHZVB34jGiakuBJaJoY18iY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=oreYKa33; arc=fail smtp.client-ip=40.107.212.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oreYKa33"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DTXic3oO71b9FY37Y8FRH+CCEyh719lFvG9psyp4lTVz1oh82QzAvz4gj3YxbDfTBzAFV4wO8NG4Tdl+mH3uARm8qdGuTeaQB67wW5Jrdart5ndp7kPU1xOrbz3nKGX0aIuh1Q+ayqUBHxa5D2G4VR9otm1TOoC2sYU9P94G1V6bun0GtGWLHpqm3InDIQw7IC7f0Fuu9GlbhNk8VFgqGOCtl9pH6AmLYyU553RJeZtOKWxmBBFTdjdKSBl4r8QWySee9POBRZfo0vES8GNwm9FlPSy2sDb+jdFDIOI//i+s8d0ZA+HqQpuOLatiszVMk4FV09d77VTbIvWVQvaQLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AWC2I1I7t0p3CHykQuEiJu6Nzt/Z18PLsXWkq9iWoMw=;
 b=RFj0sjs7LEVHRaPfpTeLL85dox99o44cx4keekJI9PmMGbjfzd/j+7bHnEslTy3tFtY6K29MEVw0ludGOgKlg4hITIfkA7PHReZxGrwpbrUmYinaJqmdYV3YlMECwb16mwadX0pdPWtIJ7C9lKBaBPguznDzFV9YCSZ35JLQrikDk/w7zt06utRaYAe1NpWlOyGjaXI4awXq/5oomyW/O0NUI2n+jTtJZcDIQN+ZS8czBkLasaJhfz6xIRrF62ryBpzy71Zx/yCGE5eVRZX0O3SGIQQ7vaDZhTPpp87RC+7VkKGfVKEty+pmoYXbfv5iiRCkcqZY9ipMxF+xj6Mn0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AWC2I1I7t0p3CHykQuEiJu6Nzt/Z18PLsXWkq9iWoMw=;
 b=oreYKa333SHI/kbl5AveVBP4usaV28K7K9lRsrUYCNtKrMXeo2qB7y5+MeUNE+HpDujiT+rgaZm9ORcRD7gpNyYPK81CcdlrT9B5bIXQzASqxp+qR5nvcD5DoG1O/gaSPPuPUDTF9lVOgsNTGuA8cauBxzUdR+qqre7lRR5NaoE=
Received: from MN2PR05CA0043.namprd05.prod.outlook.com (2603:10b6:208:236::12)
 by SJ0PR12MB6942.namprd12.prod.outlook.com (2603:10b6:a03:449::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 12:52:58 +0000
Received: from BL02EPF00021F6A.namprd02.prod.outlook.com
 (2603:10b6:208:236:cafe::b8) by MN2PR05CA0043.outlook.office365.com
 (2603:10b6:208:236::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.13 via Frontend Transport; Mon,
 11 Aug 2025 12:52:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00021F6A.mail.protection.outlook.com (10.167.249.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Mon, 11 Aug 2025 12:52:57 +0000
Received: from gomati.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 11 Aug
 2025 07:52:55 -0500
From: Nikunj A Dadhania <nikunj@amd.com>
To: <x86-cpuid@lists.linux.dev>, <bp@alien8.de>
CC: <nikunj@amd.com>, <thomas.lendacky@amd.com>, <santosh.shukla@amd.com>
Subject: [PATCH] db/leaf_8000000a: Add Page modification logging
Date: Mon, 11 Aug 2025 18:22:36 +0530
Message-ID: <20250811125236.2606331-1-nikunj@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6A:EE_|SJ0PR12MB6942:EE_
X-MS-Office365-Filtering-Correlation-Id: 856c9976-50d4-4986-a723-08ddd8d5ff52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?R+aJS+6k9Q4hhZ5Yt2qajlsux444gXtVoUiEbSL5kATic3i2eeo6Jxx3wcoB?=
 =?us-ascii?Q?CLwPt2aQ+2yjUVDCBQQjox3QFx5pD5TpoaRyApD5VNF58p2FlXuASCmnd++b?=
 =?us-ascii?Q?i+07JKCjXGVDyjEBDHOXH8o5R9U6tA3Uergsf1Aor393wfxWx2zUaJQDD+Uy?=
 =?us-ascii?Q?XuJUSE0M8pohIkfaB84xu5Sk52YpQbflXJDTuWTZ5S/NBPRBolmvosuBZ5+T?=
 =?us-ascii?Q?qiv9vDWEyIEZp/1BL2UWBIob0MwSZTpFGtRo8WjPVCCpkdqJcPxN1dNfE65e?=
 =?us-ascii?Q?plVMSJ/SCldy/k3KhYo7T89T+t/E3Oa28jd5Oy71RHCMt6f6hoeUmnPiNujp?=
 =?us-ascii?Q?b7Tyz0GC29CxoDj1tp+LkhXCzGBjtL8cr6Gc+H0UZkLpzSFt1a3VASC77VWG?=
 =?us-ascii?Q?QsGnAatQXIXomrA5rD2k+Cc/QjArK+B4A0pX4m9NtOjt1gNQMsfyMkeZlSXD?=
 =?us-ascii?Q?nZoekODaT9RaxSRGEd5xs9Hqe5/3TuxOffntb4ZNuJNJdLp2dMHTG1b+ME33?=
 =?us-ascii?Q?ZvOjV3EAw/DFHRlFX4vHH4zb8JqlqBEXwFEwVxCO5aoqSgF5mRl5g6e4efrV?=
 =?us-ascii?Q?kpooiczNgXBCx0TdNco0GPcDlh5UQpG1BzTI4RsfvB0QFOWP0UztUD3RTiXF?=
 =?us-ascii?Q?mEgTdsOaoDVBt8VILNvh+R9JGFH3fwEW5NFXKVz3CNTTro9NcsUR6yX75GJ0?=
 =?us-ascii?Q?jpo/5AErk8NGqL2e8OlWQg3Aw/J/MZ/o740VmgrbGzh6yBiSTBtReXxNGz60?=
 =?us-ascii?Q?TeabVsN3kMmVqVriI3HFD3F4UDvCcIcTsBuyOsH1WTms97gLKA2Jr6Tf7Ujk?=
 =?us-ascii?Q?KlVeVvEgcPloaHnYdqCUyBd7PxbmIO6XUDfV8M5zpHNuQe59tMtMfYf3q3YO?=
 =?us-ascii?Q?XasNgjUz8RnC+54svwm9slYP0PNHhb7JWxXd3gS/3BpQb3tW1sgmwHO8p8hG?=
 =?us-ascii?Q?dfmwhjFUZ3XFoQS2vNbfWsMGLN21LPBVAtwdgJ+QMjldeof0k6oM2crnx6b4?=
 =?us-ascii?Q?cZ5kYor1lMMZrRUlkn72tfTc42k6XtqfjddfR57dEytH4THkbmT42+UaOBdX?=
 =?us-ascii?Q?yUMgZcvlUESnQRIvm7TdtJrGvosvnZSdQhJs/Y+dZxNdbKxa4eTkxGQEg+Ce?=
 =?us-ascii?Q?eR5P65LxhWox2qyw9GYkMAPwLP+jnwVlTJQT4TBs3VjQGnZ4nLP+e01X78SB?=
 =?us-ascii?Q?n99HN6fCJ1Xsbz+ZUqAtnFGPNgONofed0oDt6/rf7t/jB+de9SEnK8iERF8U?=
 =?us-ascii?Q?DfepxTVh7olZ6WL3GJiBa++aIqUelcvfe3Ssna906/Acsxjf8ZV2J2h0Qvnw?=
 =?us-ascii?Q?xijabjAQfkikQKxGrdmD71zTnG15WPfYkCBCqvWLMM3Q4rPYY4aCQ3AqxNzz?=
 =?us-ascii?Q?hbKvi5MN3BKztxW9FQJdN75A5HJrYwHTKj2+qRyr+Kf6ZCn4zc39i0RPOfDO?=
 =?us-ascii?Q?ct9ywe+sEaRFj60kMi9gt4303w84A3fW34sbcHuLcm5qE6NRhgboGgH99hEF?=
 =?us-ascii?Q?M6QSA5Y9TQHkmltbLeNvBXzwmrcYwk9V27KQ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 12:52:57.9281
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 856c9976-50d4-4986-a723-08ddd8d5ff52
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6942

Page modification logging(PML) is hardware feature designed to track
guest modified memory pages. PML enables the hypervisor to identify
which pages in a guest's memory have been changed since the last
checkpoint or during live migration.

Signed-off-by: Nikunj A Dadhania <nikunj@amd.com>
---
 db/xml/leaf_8000000a.xml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/db/xml/leaf_8000000a.xml b/db/xml/leaf_8000000a.xml
index 7f73318..433c4b1 100644
--- a/db/xml/leaf_8000000a.xml
+++ b/db/xml/leaf_8000000a.xml
@@ -14,6 +14,11 @@
     <ebx>
       <bit0  len="32" id="svm_nasid"               desc="Number of address space identifiers (ASID)" />
     </ebx>
+    <ecx>
+      <bit4  len="1"  id="pml"                     desc="Page modification logging (PML)">
+        <linux        feature="true"               proc="false" />
+      </bit4>
+    </ecx>
     <edx>
       <desc>SVM feature flags</desc>
       <bit0  len="1"  id="nested_pt"               desc="Nested paging">
-- 
2.43.0

