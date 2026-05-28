Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC22447DD59
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983124; cv=none; b=A4SrexisBXPcHBcmfVm/joHNsE2/InQP8heD3KXLaZJZNwhYbyyC/65Eb3ch8uXHbkkwH9WRBgdUOiNJea7yVa0BizU12hVNIfMq9DJP+VoXHU4bWiVDaj6hIzfoRRTOadLdz4l18tO938Fo7w8OwxcwS5Zfyc8Jau72hl3puX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983124; c=relaxed/simple;
	bh=9te8/wZu4c7n99hnkC0stjRuHzkibHN44Uebt4LZvkU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=euEMn+zdFZUAUTDkQqM3Z7DL66Nj+Jw0n7XM7NM0rxPbinfVIriBe9zmK6W2dVyYuFxVosSzLYsFfrZhjzABapFyWCDXTZfXJqx0acm9Wx1ePVOQlArmlF9AFyfpaXeXQhnRlRr6DlQbZ7NMJt3a7qwcPl502qHw7O7daz4Lf70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1s4+jVH2; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Kcv9Y5sg; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1s4+jVH2";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Kcv9Y5sg"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gkODCsKD2v6DKO+d9ptCe0Xo2luXxqr8GFYoUCpPhcE=;
	b=1s4+jVH24e+dRxU85xkkdKvk4gsM64joZUg7D2F1cHdzuPtIXZWj6Ul5AJT9WFljIcz0s+
	Dk0eP32+VsECEhOZ5c2lG0lmme0W0zEKpertzqddk3oMWeyDlWUd0vNc5Jr4J/mXv/kFpg
	gKa35DUoj6jRRWd188kN9UgFvStrut81bR7Na4fmPKhlyQjkaoOtBk11/1c+MVPyq4HTE7
	CGaGUCO7JpnPeLwVfkZk6ZIsWlqRzFW/4HWFx+hvvSVYgagMqAaD70bvXn+TFvotMpXxIi
	pwwTcd+Jq+4W0XLVR+ZzRfu3tW9spN2DeBw6+6K+ladPiVE8Z1TIr/bEGs5/Sw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gkODCsKD2v6DKO+d9ptCe0Xo2luXxqr8GFYoUCpPhcE=;
	b=Kcv9Y5sguGt260sVRor2aaI+jrZ7vutJTs6Bo8QcqfwXKp+62uyFeiWVekITMrA0Z3UpuN
	eNNfSBNgVrui39CA==
To: Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Christian Ludloff <ludloff@gmail.com>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>,
	x86@kernel.org,
	x86-cpuid@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	"Ahmed S. Darwish" <darwi@linutronix.de>
Subject: [PATCH v7 100/120] perf/x86: Remove custom CPUID(0x80000022) types
Date: Thu, 28 May 2026 17:39:02 +0200
Message-ID: <20260528153923.403473-101-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All CPUID(0x80000022) call sites have been converted to the CPUID API and
its auto generated x86-cpuid-db data types.

Remove the custom CPUID(0x80000022) types from perf.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/perf_event.h | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/arch/x86/include/asm/perf_event.h b/arch/x86/include/asm/perf_event.h
index ff844cec22ab..61da03dfb642 100644
--- a/arch/x86/include/asm/perf_event.h
+++ b/arch/x86/include/asm/perf_event.h
@@ -161,24 +161,6 @@
 #define ARCH_PERFMON_PEBS_CAP_LEAF		0x4
 #define ARCH_PERFMON_PEBS_COUNTER_LEAF		0x5
 
-/*
- * AMD "Extended Performance Monitoring and Debug" CPUID
- * detection/enumeration details:
- */
-union cpuid_0x80000022_ebx {
-	struct {
-		/* Number of Core Performance Counters */
-		unsigned int	num_core_pmc:4;
-		/* Number of available LBR Stack Entries */
-		unsigned int	lbr_v2_stack_sz:6;
-		/* Number of Data Fabric Counters */
-		unsigned int	num_df_pmc:6;
-		/* Number of Unified Memory Controller Counters */
-		unsigned int	num_umc_pmc:6;
-	} split;
-	unsigned int		full;
-};
-
 struct x86_pmu_capability {
 	int		version;
 	int		num_counters_gp;
@@ -498,11 +480,6 @@ struct arch_pebs_cntr_header {
 	u32 reserved;
 };
 
-/*
- * AMD Extended Performance Monitoring and Debug cpuid feature detection
- */
-#define EXT_PERFMON_DEBUG_FEATURES		0x80000022
-
 /*
  * IBS cpuid feature detection
  */
-- 
2.54.0

