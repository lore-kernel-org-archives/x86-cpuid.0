Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99CB1474A7
	for <x86-cpuid@lists.linux.dev>; Mon, 23 Sep 2024 22:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727130854; cv=none; b=jluaDANBb3EZcbZvnLPZY6j8m6l3T15VeX9jc0R2EIQ08mjDLi7gOIVVURQ69xWmP1zj8hq5g2ytHXM+aBN5Oz5pHTAKGSlb4zKCDiD/xsYKamrtBd8Ip93uFC78KM8gaAnDCbejf43AjxYaCd6AzB1w6mfSl7vtkGdNjAGa5LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727130854; c=relaxed/simple;
	bh=kR76fG6PRQw/l1hQUKPkQ7w23QZe4M6XmSpRionuwiM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gznCqrJcFZfr9KuxsYLertdjMFmVia0yP1AmMFvirUKajbwPBwb3gc2nIzYi4LwEB0BGKkCWAkPwvGMsxMitV4trWRAiEfUoLUUvm4cpT8Z0aNBHPcqYlo2PR6V4lDwfCqS1FLZWUPk0oRWE0982eVZp33yneUH5jz+cEtD6JFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GYxi+qyY; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GYxi+qyY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727130853; x=1758666853;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kR76fG6PRQw/l1hQUKPkQ7w23QZe4M6XmSpRionuwiM=;
  b=GYxi+qyYp4LgXU0/ZUM/+UCCq5jH2NZ5CpKuKV6FjaEiaMNNS0tKlQEx
   4x1cday6MA8gFRjGMRhJqR3tzzl7UVLXSwUxyc+Ms0DoecznnCUKES54e
   nCMy0vM+a5F4cTIEV79MywhNF5YtNWfca1w61aMb/WhZUN+drNcFISgPt
   PXE0C7ivVjY/nB5BWsLEjCe6p3gz6xWj0JLqAtmEwLusrVHIAovPFsRA8
   GpgjR7kSGWS4LGgVvZYDXUSCaTuyYR+PUU/iex15RPqUP4KlFhAmMwddv
   JNlnR1tUa8a772K4wg+ZC4E+Zfl2ZgMTrMuaTBf5m54P1K3CTsbXJ5/id
   w==;
X-CSE-ConnectionGUID: lQAnWt8TQf6D+Jxdo0W9Jg==
X-CSE-MsgGUID: jBZNy7qxSwaewNJqEkEnDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="29818828"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; 
   d="scan'208";a="29818828"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 15:34:12 -0700
X-CSE-ConnectionGUID: cg+3qwGJSr2wcN6fy0BFlA==
X-CSE-MsgGUID: kHwGLT72TSiPHJj9+ApoYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; 
   d="scan'208";a="76133045"
Received: from sohilmeh.sc.intel.com ([172.25.103.65])
  by orviesa004.jf.intel.com with ESMTP; 23 Sep 2024 15:34:12 -0700
From: Sohil Mehta <sohil.mehta@intel.com>
To: x86-cpuid@lists.linux.dev,
	"Ahmed S . Darwish" <darwi@linutronix.de>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Xin Li <xin@zytor.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Sohil Mehta <sohil.mehta@intel.com>
Subject: [PATCH] db: Add Intel NMI-source reporting feature flag
Date: Mon, 23 Sep 2024 22:32:13 +0000
Message-Id: <20240923223213.852758-1-sohil.mehta@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

NMI-source is documented starting with FRED specification v6. It is
enumerated with the feature flag:
CPUID.(EAX=7,ECX=1):EAX.NMI_SRC[bit20]

Link: https://www.intel.com/content/www/us/en/content-details/819481/flexible-return-and-event-delivery-fred-specification.html

Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>
---
 db/xml/leaf_07.xml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/db/xml/leaf_07.xml b/db/xml/leaf_07.xml
index 415524e..5d15015 100644
--- a/db/xml/leaf_07.xml
+++ b/db/xml/leaf_07.xml
@@ -566,6 +566,7 @@
       <bit19 len="1"  id="wrmsrns"                 desc="WRMSRNS instr (WRMSR-non-serializing)">
         <xen          feature="true"               attrs="S" />
       </bit19>
+      <bit20 len="1"  id="nmi_src"                 desc="NMI-source reporting with FRED event data" />
       <bit21 len="1"  id="amx_fp16"                desc="AMX-FP16: FP16 tile operations">
         <linux        feature="true"               proc="false" />
       </bit21>
-- 
2.34.1

