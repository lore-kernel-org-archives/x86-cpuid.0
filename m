Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DEB451071
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983035; cv=none; b=n2NofoEkomzV18WQlbwzPtoNBDgq6W0F3i97IyyQ8p0KxvUBJgTUgmmTWxHqdysHNH3KFBUQAAUrd6Rz4H3uwxH/9l1r4itCINvs1eYHkJcizhz14H5vWYx4xN1VZkBJ93N+evqsqzOG++tIdTl8u7LBqd0Xtte+ZmbrJcYgrU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983035; c=relaxed/simple;
	bh=6iwWiEZpjq46yvEEL4/0Yv1P3YTbWsL9QC+szUTpZ1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A4u9Z7rZU+L235/kalUsmT6lZcaPxWOOxKX9bGmhze8Ydew00UjflOvNHpC2E1lx/WsmhOSlB5ZOlv+nacdTK12TFTwOxjFBnqaj6Yx7EdRnDTqYqT5C3AKr8TWa+KHGVgMqDpAy1hpqgdjCu9Qz5Z6isnqc0qZcVg05474HmUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OmuRCdHv; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bn6zcIka; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OmuRCdHv";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bn6zcIka"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+nd/NmEhNyF21nuREqSFFUH5qua7zbrhz6reJSpDQNw=;
	b=OmuRCdHv/CRddthyFo/QDT0rC5uUV1srsBoJFOgH/8w42Ww1wjYTVi/xdhV/UIeyy4Ksoo
	3k5nHj4jTyekGToCk2wgY4q/oHB93G/fKTc6J0pZJQLgXTgwTjqICd9f41PT4dklyJa50N
	Abw6+VIQaVT54VWe7A7HHWiJk+OsmXinQtDR3LLHi7GDFZP01OkfMVQnDzDZwzjSD4jr0z
	OF2KMEU5tlogsjy9b03uRG4h2ViKpRIuIAipXt1h7HBvI0mpXV56T4GPykAQ4SxplZcvIe
	KERwUzVs5rmEYxozuGkic7rCbKOcRMsAUpVljxfHRtGzqpS1iX5qMUZdQJkqUQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+nd/NmEhNyF21nuREqSFFUH5qua7zbrhz6reJSpDQNw=;
	b=bn6zcIkaU5g5r3q+SvieNBWsTQve21ZKZOHs8ti7XJ5Bzy15yl6SxaT6cqruGl/Bq/iy9D
	2Hv9gqNO+PSg3uAA==
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
Subject: [PATCH v7 073/120] perf/x86/intel: Use parsed CPUID(0x15)
Date: Thu, 28 May 2026 17:38:35 +0200
Message-ID: <20260528153923.403473-74-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use parsed CPUID(0x15) instead of a direct CPUID query and raw register
access.

Remove the maximum CPUID level check as it is implied by the CPUID API not
returning NULL.

Remove the excessive details regarding CPUID(0x15).EBX being zero since it
is not relevant to the actual code beneath it.  The code only caches the
TSC to core crystal clock ration numerator and denominator.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/events/intel/pt.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/arch/x86/events/intel/pt.c b/arch/x86/events/intel/pt.c
index b5726b50e77d..b938acac9cee 100644
--- a/arch/x86/events/intel/pt.c
+++ b/arch/x86/events/intel/pt.c
@@ -189,6 +189,7 @@ static const struct attribute_group *pt_attr_groups[] = {
 
 static int __init pt_pmu_hw_init(void)
 {
+	const struct leaf_0x15_0 *l15;
 	struct dev_ext_attribute *de_attrs;
 	struct attribute **attrs;
 	size_t size;
@@ -199,18 +200,11 @@ static int __init pt_pmu_hw_init(void)
 	rdmsrq(MSR_PLATFORM_INFO, reg);
 	pt_pmu.max_nonturbo_ratio = (reg & 0xff00) >> 8;
 
-	/*
-	 * if available, read in TSC to core crystal clock ratio,
-	 * otherwise, zero for numerator stands for "not enumerated"
-	 * as per SDM
-	 */
-	if (boot_cpu_data.cpuid_level >= CPUID_LEAF_TSC) {
-		u32 eax, ebx, ecx, edx;
-
-		cpuid(CPUID_LEAF_TSC, &eax, &ebx, &ecx, &edx);
-
-		pt_pmu.tsc_art_num = ebx;
-		pt_pmu.tsc_art_den = eax;
+	/* Save the TSC to core crystal clock ratio, if available */
+	l15 = cpuid_leaf(&boot_cpu_data, 0x15);
+	if (l15) {
+		pt_pmu.tsc_art_num = l15->tsc_numerator;
+		pt_pmu.tsc_art_den = l15->tsc_denominator;
 	}
 
 	/* model-specific quirks */
-- 
2.54.0

