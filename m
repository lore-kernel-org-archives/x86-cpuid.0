Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8401637105A
	for <x86-cpuid@lists.linux.dev>; Tue,  2 Jun 2026 16:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780418338; cv=none; b=nrnyJX9ExHkfx2678NULPlcMgH4teqaik+DqbYPtCro445gSlWURYQEluGlyiL0SbiCRCyeecxdx8NWYd7wJDgdXXOsi+u/XtU5S00IbzsqN7qG7e3Fi1JJ2ywZPklaGArhXCo/d9oRVP6kZDY1jmzM3jLEGoV/cqHoZvFKaflY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780418338; c=relaxed/simple;
	bh=hzFiObhgIu+wcZKZ0Ak+QxBAmFCPza051+fUwCb6mA0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KEVFIlQv+K5BTwisBp5T1YGqGQ7M/ICCgwv29mbNsdZuA8lLDOlr0aEQ/P67+1ERPdRQC9svbb+vDw5HhUi7OgzIBi8E3lT+/MqXjoa29T398pi6ZMUO4s1Jmcg95qxNzEmVmdrT5gF4fvthJjNla5B+pLWDuXAzRrQTkrF4jvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HbsFNF2g; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HbsFNF2g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780418336; x=1811954336;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hzFiObhgIu+wcZKZ0Ak+QxBAmFCPza051+fUwCb6mA0=;
  b=HbsFNF2gQdRJ3634F8ZOgjOl6MrbpmOn65+2K9a0eRmtMd8i9+1i//iC
   QyJeDNxDetuxcMw9h8jzAz0EKhLUZQaHtcbPTECan4n2WVNyc3qIo4XGp
   NY0rVDBbJasX0H6ekSVmSpRlNfJrkpPq7diToXuguJx11Q9/ERJAHPytj
   kReJfZOzj49dJEwYQgNewEa1tkBW8wcRMpLSugJKbyvuJHS0l1Wjr1wVx
   FIn2InLHcTvHtLgvqXNrSYdyplObyR/wKJGN9SyEXLqVh9xBkPYJSmQGV
   G5pzUVIhO6Ok6UkiOxJhxEASS1dCg9zMlpuUGNY8V6FGT7COtrYaNkyiz
   w==;
X-CSE-ConnectionGUID: q2d6b1r3RcKfBfUVaxamaw==
X-CSE-MsgGUID: gKBuxZqLSyieEU0ZCqRsgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="91895347"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="91895347"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 09:38:55 -0700
X-CSE-ConnectionGUID: svdmoHY+Qg6smAQR7+KtNQ==
X-CSE-MsgGUID: AeUTCxk1QV6hGrspcb4wWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="248885727"
Received: from rvuia-mobl.ger.corp.intel.com (HELO wieczorr-mobl1.intel.com) ([10.245.244.34])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 09:38:53 -0700
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: x86-cpuid@lists.linux.dev,
	darwi@linutronix.de
Cc: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Subject: [PATCH] db: Fix typos found during kernel review
Date: Tue,  2 Jun 2026 18:38:39 +0200
Message-ID: <20260602163843.671293-1-maciej.wieczor-retman@intel.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix a few typos that were found during kernel review of moving CPUID
data model to use cpuid-db [1].

[1] https://lore.kernel.org/all/ah2WBnBkz8KQrph0@wieczorr-mobl1.localdomain/

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
 db/xml/leaf_12.xml       | 2 +-
 db/xml/leaf_14.xml       | 2 +-
 db/xml/leaf_4c780002.xml | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/db/xml/leaf_12.xml b/db/xml/leaf_12.xml
index 1953b7bd2776..b6be91c76b6f 100644
--- a/db/xml/leaf_12.xml
+++ b/db/xml/leaf_12.xml
@@ -67,7 +67,7 @@
         bits (Intel-defined bits only!), where "⇆" denotes a bit matching relationship.
       </text>
       <bit0  len="1"  id="xfrm_x87"                desc="Enclave XFRM.X87" />
-      <bit1  len="1"  id="xfrm_sse"                desc="Enclave XFRM.SEE" />
+      <bit1  len="1"  id="xfrm_sse"                desc="Enclave XFRM.SSE" />
       <bit2  len="1"  id="xfrm_avx"                desc="Enclave XFRM.AVX" />
       <bit3  len="1"  id="xfrm_mpx_bndregs"        desc="Enclave XFRM.BNDREGS (MPX BND0-BND3 registers)" />
       <bit4  len="1"  id="xfrm_mpx_bndcsr"         desc="Enclave XFRM.BNDCSR (MPX BNDCFGU/BNDSTATUS registers)" />
diff --git a/db/xml/leaf_14.xml b/db/xml/leaf_14.xml
index 6c996e943ce7..1ea55c9b95ba 100644
--- a/db/xml/leaf_14.xml
+++ b/db/xml/leaf_14.xml
@@ -26,7 +26,7 @@
       <bit0  len="1"  id="topa_output"             desc="ToPA output scheme" />
       <bit1  len="1"  id="topa_multiple_entries"   desc="ToPA tables can hold multiple entries" />
       <bit2  len="1"  id="single_range_output"     desc="Single-range output" />
-      <bit3  len="1"  id="trance_transport_output" desc="Trace Transport subsystem output" />
+      <bit3  len="1"  id="trace_transport_output"  desc="Trace Transport subsystem output" />
       <bit31 len="1"  id="ip_payloads_lip"         desc="IP payloads have LIP values (CS base included)" />
     </ecx>
   </subleaf>
diff --git a/db/xml/leaf_4c780002.xml b/db/xml/leaf_4c780002.xml
index 0decfc30b857..09548debcb92 100644
--- a/db/xml/leaf_4c780002.xml
+++ b/db/xml/leaf_4c780002.xml
@@ -67,7 +67,7 @@
       <bit15 len="1"  id="spectre_v1"              desc="CPU affected by Spectre variant 1 with conditional branches">
         <linux        feature="true"               proc="true" />
       </bit15>
-      <bit16 len="1"  id="specture_v2"             desc="CPU affected by Spectre variant 2 with indirect branches">
+      <bit16 len="1"  id="spectre_v2"              desc="CPU affected by Spectre variant 2 with indirect branches">
         <linux        feature="true"               proc="true" />
       </bit16>
       <bit17 len="1"  id="spec_store_bypass"       desc="CPU affected by speculative store bypass attack">
-- 
2.53.0

