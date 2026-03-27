Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219BC35DA47
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774577967; cv=none; b=XCFntBQdxXg82LZKYmYn+8Cy8AciXPEiVf6kpHb48mjpllwChXFYVDUshv9tgbfsMX1DdFbwqQEyruMCw4jRwH6iV2CNWYIkTK+NfdSzNRoeSoSFqUVxEGPRn3HAld7SmYcf9PpRoIzslu1Zr6MLLAts158tlYrguNST3xMIw8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774577967; c=relaxed/simple;
	bh=j0NNmTULtzs6O4gYMrb0bGW6VO6yqIZUGKoUspmhHZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DbsyBfm0uWt1yh2Qi4ecgyKZAFeGh/m/MPGvr/g4vtP6eqx6eKd8wVzEdHuTs1fEgo4EgA5L/oOd0Y4BPK1ba29m2GKGJCcvBA31+rdia2gHnqNtTRtcc8vgjpKyRlYbBAbKAWRxhEdWqPzqS7b829DOD7IVXggzVfEx4S2yJTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sQcPt0Yz; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sj8VoFt2; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sQcPt0Yz";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sj8VoFt2"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774577964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/W83RmVy3CtvFXEUSfKwuQmP/1LVkuagddT/fO9nTeM=;
	b=sQcPt0Yz4DyRtQuz9A5bQtIeFOkCYcHURL18tHbnYf2v/h9WIMkbVP8Z/zFOxlDtqSysat
	N1CFzGirSelWjUkAG+IDkuCBIN8z1TzV6kIPY1ETeutvoQZFhPDv3w6qQa8IHcNwJI1c99
	BHrpv3v+S5gA9w6kupOTlL3bCT+96LUjQEOY+Wj2X5LrujiSyvd21IBqsvNVPSYf86f5JK
	DVIwbf1kHCNvXFTNRDvDB29/pOafCfHd4X35sOI+lsRpYnaETtJASILfkCf0phNW4N/MRZ
	mlNem65d7zm5ETJf73xXqVYYFDezQUf/BukC/eu+gF8QYi3RRh67UO7SXiGpXA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774577964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/W83RmVy3CtvFXEUSfKwuQmP/1LVkuagddT/fO9nTeM=;
	b=sj8VoFt29Tndb08pxsGGGDaYTmpj2uOZUYzhHEFps9PYRDniGbDGEulGtK0Ym15aOgcfgQ
	9n4OjWv4qbmjnHCg==
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
Subject: [PATCH v6 34/90] x86/cacheinfo: Use parsed CPUID(0x2)
Date: Fri, 27 Mar 2026 03:15:48 +0100
Message-ID: <20260327021645.555257-35-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use parsed CPUID(0x2) instead of directly invoking CPUID queries.

Remove the max CPUID level check; checking cpuid_leaf_raw()'s result for
NULL is enough.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/cacheinfo.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/cpu/cacheinfo.c b/arch/x86/kernel/cpu/cacheinfo.c
index 51a95b07831f..6fded356f2ee 100644
--- a/arch/x86/kernel/cpu/cacheinfo.c
+++ b/arch/x86/kernel/cpu/cacheinfo.c
@@ -391,14 +391,14 @@ static void intel_cacheinfo_0x2(struct cpuinfo_x86 *c)
 {
 	unsigned int l1i = 0, l1d = 0, l2 = 0, l3 = 0;
 	const struct leaf_0x2_table *desc;
-	union leaf_0x2_regs regs;
-	u8 *ptr;
+	const struct cpuid_regs *regs;
+	const u8 *ptr;
 
-	if (c->cpuid_level < 2)
+	regs = cpuid_leaf_raw(c, 0x2);
+	if (!regs)
 		return;
 
-	cpuid_leaf_0x2(&regs);
-	for_each_cpuid_0x2_desc(regs, ptr, desc) {
+	for_each_parsed_cpuid_0x2_desc(regs, ptr, desc) {
 		switch (desc->c_type) {
 		case CACHE_L1_INST:	l1i += desc->c_size; break;
 		case CACHE_L1_DATA:	l1d += desc->c_size; break;
-- 
2.53.0

