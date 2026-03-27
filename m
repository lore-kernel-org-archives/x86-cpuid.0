Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C51D3346B4
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774577891; cv=none; b=A3w947S3X9KMQ28YUSRzXPHYjYzZSFyUxp/GWbaMwwJijWHDs3RZQ2BdF9fPVWp9UenTPMb9L84mfiTH/Qk5K56/q7aqJsdZGlJT3ujm2VG/3+GzjksykG50XKvFJuY7wpv61grsKEHYLheG0ZD+ggY2c0R51EWHyfnOFpTv2Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774577891; c=relaxed/simple;
	bh=0anUBszkYETNsFvKFDaZ+ZJMseXEuUeoVKu2SapGjRw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZJHllrs9Zrjq4FssX/W7vxtXiJ3Ai/Y3duTR9nDEreZU+33aTbCIJR/+fmqEZZONAgZOpegkgOidl2YCQLrO5ZhCidw9ulu5ucG0vasNMbJJz5Q3q/JXUbzWuKYjAX9IXPpMWHUcLsicx5u9A1AH0VvSGd9pz5FvMuKN3HltZBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fFG4l1zt; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sAV2BtPY; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fFG4l1zt";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sAV2BtPY"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774577888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xt9zZ2ej2EvKo8A2ksnwwKEosXOT196FBGDnWfw8evA=;
	b=fFG4l1ztdpJGFj6wUPMMpjO2Ml+fnGpN81u7AqxWNmk/xtTlqCL3cyHP5et3L6WY7fkDO9
	nwuGjHhnhOINS6U5/tQJ/952dXIDBi3F1+vnx1510znYkffdQA8a5M27tyW7WXjiqPQNia
	WWXCnIG1tR7BL8jgxDQAjgzCOBgAI+Se3KR03wAQPr//vTTpFrMR0S75ECwqnEfvRzrfDQ
	VTnwTgvswD4/UUsC0NhrvWMj0v88k4dj9RfUXneRiFhQJkp6Zb5pPUKaCRdNcS3WIuetE6
	wuGkRxpSLviDkQfnda+CPOHBn4sro7ccw5AY3coO4L1JD0v/2XZme8EQonSvcg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774577888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xt9zZ2ej2EvKo8A2ksnwwKEosXOT196FBGDnWfw8evA=;
	b=sAV2BtPYMRe1z57EwsMK92TNGudYPfHNviuOFYSwvbLL/dP0lhNfKo4U/BGS62+vrfp4+F
	Qq4Fmch5FinqakDw==
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
Subject: [PATCH v6 13/90] x86/cpu/intel: Rescan CPUID table after leaf unlock
Date: Fri, 27 Mar 2026 03:15:27 +0100
Message-ID: <20260327021645.555257-14-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Intel CPUs have a "limit CPUID" MSR bit to limit CPUID enumeration only up
to CPUID(0x2).  This can be set by old BIOSen before booting Linux.

If that MSR bit was set, refresh the cached CPUID table after clearing it.

Scan only the newly-found CPUID leaves, not to override any of the kernel's
previously force-set or unset CPUID bits.

References: 066941bd4eeb ("x86: unmask CPUID levels on Intel CPUs")
References: 0c2f6d04619e ("x86/topology/intel: Unlock CPUID before evaluating anything")
Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/intel.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/cpu/intel.c b/arch/x86/kernel/cpu/intel.c
index 646ff33c4651..08869fecdf30 100644
--- a/arch/x86/kernel/cpu/intel.c
+++ b/arch/x86/kernel/cpu/intel.c
@@ -183,20 +183,34 @@ static void detect_tme_early(struct cpuinfo_x86 *c)
 		     keyid_bits);
 }
 
+/*
+ * Intel CPUs have an MSR bit to limit CPUID enumeration to CPUID(0x2), which
+ * can be set by old BIOSes before booting Linux.  Clear that bit.
+ *
+ * Scan any newly-found CPUID leaves afterwards.
+ */
 void intel_unlock_cpuid_leafs(struct cpuinfo_x86 *c)
 {
+	const struct leaf_0x0_0 *l0;
+	unsigned int rescan_from;
+
 	if (boot_cpu_data.x86_vendor != X86_VENDOR_INTEL)
 		return;
 
 	if (c->x86_vfm < INTEL_PENTIUM_M_DOTHAN)
 		return;
 
-	/*
-	 * The BIOS can have limited CPUID to leaf 2, which breaks feature
-	 * enumeration. Unlock it and update the maximum leaf info.
-	 */
-	if (msr_clear_bit(MSR_IA32_MISC_ENABLE, MSR_IA32_MISC_ENABLE_LIMIT_CPUID_BIT) > 0)
-		c->cpuid_level = cpuid_eax(0);
+	if (msr_clear_bit(MSR_IA32_MISC_ENABLE, MSR_IA32_MISC_ENABLE_LIMIT_CPUID_BIT) <= 0)
+		return;
+
+	cpuid_refresh_leaf(c, 0x0);
+	l0 = cpuid_leaf(c, 0x0);
+	if (!l0)
+		return;
+
+	rescan_from = min_t(int, l0->max_std_leaf, c->cpuid_level) + 1;
+	cpuid_refresh_range(c, rescan_from, CPUID_BASE_END);
+	c->cpuid_level = l0->max_std_leaf;
 }
 
 static void early_init_intel(struct cpuinfo_x86 *c)
-- 
2.53.0

