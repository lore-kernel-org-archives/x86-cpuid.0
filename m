Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2471137C90F
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774578098; cv=none; b=gSK6G30Hp498k2R8Wlzu7u5T2HdgwUnApuC0m2C5ZmOt1rh6BkBpDoi9yEzPW3CkVFP6fxU0sjUXYlBkU/v12QGU18995IdGhDfAPIRQatROmnTZbKY+daGYtRYqZCWWdR2lp8TPOmuPW5Uu09qJ4KDsyQeBmzKLNZN1Aq+v5yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774578098; c=relaxed/simple;
	bh=g019V/HJY76Wdkl5YQ2Z90xSZdvx6m1Y2lha2zoxKAU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cu+L/ghTNoAfqphV2UADRGwTm9e9sIcq9WIS2cA5QkjG3ilOt9vqQS+IKXcGeg1NV5fbRZBJ5LyffjHllD1CizsltV9KbUt8LsRfcrCFk31KaTiCa0kMEeQSdOTBZ8Xm6obR+ZdgykEkXCoA22mfLYThe+GRxDddJmJMbCNpsSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qB+4epl7; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=8wKfEPCJ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qB+4epl7";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="8wKfEPCJ"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774578095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yayzzN5dmTMT0wbpfuB90WdBwo9M4Uvccr/uJId1r0k=;
	b=qB+4epl7GJrK0HoEY+9IgNYu1WFKVqueKyYZjSNFJh99/W3eYGr5MC7ZlMUR2i+T1tAm1m
	WfOdz2BQPMfNSbbkC2QdTzxfPDWfLvLXj1EZciTeAT6UrhoGV796SPkR2Cafk7yqVuulzP
	PIxWknSHW7dlP8gut8IU99hvsgcvYLK1VMzQg+p2btSkqPM0xk5qXgPqLh/qz6YbRnCr3v
	72DfQxCLWCEe5YykvV02rrcMnmdaxqeH9i3GAhAFaukCivnL9NBvehHT1XB/EF6TDxDDGY
	I3Qbzzw54sxnX6N5J3WBxAO9sm4e4X5fltgS+WlCrjbqChS9UR5KvQ+wXcG2vg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774578095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yayzzN5dmTMT0wbpfuB90WdBwo9M4Uvccr/uJId1r0k=;
	b=8wKfEPCJA/BDKAkAV20kHxz2LmxPtso/hvxVMxH+4EXd4P0KAdoetM6lEkti3NcuvGscth
	LlFTCM4uWxGGOACg==
To: Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Sean Christopherson <seanjc@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Christian Ludloff <ludloff@gmail.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>,
	x86@kernel.org,
	x86-cpuid@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	"Ahmed S. Darwish" <darwi@linutronix.de>
Subject: [PATCH v6 70/90] perf/x86: Remove custom CPUID(0x80000022) types
Date: Fri, 27 Mar 2026 03:16:24 +0100
Message-ID: <20260327021645.555257-71-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
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
index 5aa07710af12..e90c79424c70 100644
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
2.53.0

