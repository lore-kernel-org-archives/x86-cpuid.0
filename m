Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5C53559E8
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774577938; cv=none; b=tPccLd6oWlmj8stouwa7HgJyHJjtBqZz6NT+cBz78Ix5B9tUlBluIfm8PfAtGLuKRhSEfSqKlgqqtfLuGL/xfWD3wCyZ3Cv6twcClsvdv308a4uXQ5VetDdQELMI7SA5sZARjsdV9Zi8NV0xyLc9vEPNt/LMaEyn/2952ToN7zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774577938; c=relaxed/simple;
	bh=YXIZRbiNEUcf/NLpSpEEoo7dx4ESB3wWm393N+Ot7ro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b8Kx2Nqbfh+wDj5Tx1qBIDVwtWNv8IgoHUG/HhxF1Tv5pCAX7vhTiKFe3w0PX9wQyo8CQRi7kEkKpyg4HP6UbM8+BcfJzJfC7/e2MJQkru4xaYN8xY3nxBS0xnjqPFCeF720WvTTSGFbbjVKjNS4O3kj4YkFEeqdlxOirTdym0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=FxXNn+yc; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=YPhRPxq+; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="FxXNn+yc";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YPhRPxq+"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774577935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B4eBStrXtvEmpr4VJLjsismDwKU/t5nMSjoRqRmqOzQ=;
	b=FxXNn+ycrlEQVOiRNtmv+WPfC1ELUGs+e4pDutCC0/zeZdpT6KwCEGzCD83uw5pOH4CXme
	gaDFWXSf4cFXAquB8+VAJNEvpdT3kD1t1G+rylhTzXWxy+fK9/YnkhSdx3u9ZhHRfErwMs
	F2tqFiUNOgJXZYC8uyapA5tOLFiA8GI/WvsX8GrpJYd9RKz38cNKb883sYopMYMoOHKDKS
	Z2gz7QX2XjkGuI74BLUSfNuSqc66+Z2RGlKsrqDAYuuSr1lZJpEz1Mk0SLf5L4rptAOjt9
	ryoDT2Art8Zbp9IFhE9050Y4c8e1BtY8ep8csQWe1adzOyh4zdRTD4Wkl+THsA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774577935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B4eBStrXtvEmpr4VJLjsismDwKU/t5nMSjoRqRmqOzQ=;
	b=YPhRPxq+JLQZnRuUdoUPQSMOUI/W1UwoyCeCaJrOkJU5dOINUk/oDCuVy2MjnLBhgDscXC
	MxKh4r+6+T1rG2AQ==
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
Subject: [PATCH v6 27/90] x86/cpu: transmeta: Refactor CPU information printing
Date: Fri, 27 Mar 2026 03:15:41 +0100
Message-ID: <20260327021645.555257-28-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that the Transmeta init code has been converted to the CPUID API,
refactor it into two separate functions for readability.

No functional change.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/transmeta.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/arch/x86/kernel/cpu/transmeta.c b/arch/x86/kernel/cpu/transmeta.c
index 4b77dc1a7d9e..991e11d5c28a 100644
--- a/arch/x86/kernel/cpu/transmeta.c
+++ b/arch/x86/kernel/cpu/transmeta.c
@@ -27,19 +27,10 @@ static bool is_legacy_revision(const struct leaf_0x80860001_0 *l1)
 		 l1->cpu_rev_mask_major == 0 && l1->cpu_rev_mask_minor == 0);
 }
 
-static void init_transmeta(struct cpuinfo_x86 *c)
+static void print_cpu_revision(struct cpuinfo_x86 *c)
 {
 	const struct leaf_0x80860001_0 *l1 = cpuid_leaf(c, 0x80860001);
 	const struct leaf_0x80860002_0 *l2 = cpuid_leaf(c, 0x80860002);
-	const struct leaf_0x80860003_0 *l3 = cpuid_leaf(c, 0x80860003);
-	const struct leaf_0x80860004_0 *l4 = cpuid_leaf(c, 0x80860004);
-	const struct leaf_0x80860005_0 *l5 = cpuid_leaf(c, 0x80860005);
-	const struct leaf_0x80860006_0 *l6 = cpuid_leaf(c, 0x80860006);
-	unsigned int cap_mask, uk;
-
-	early_init_transmeta(c);
-
-	cpu_detect_cache_sizes(c);
 
 	if (l1 && is_legacy_revision(l1)) {
 		pr_info("CPU: Processor revision %u.%u.%u.%u, %u MHz\n",
@@ -59,6 +50,14 @@ static void init_transmeta(struct cpuinfo_x86 *c)
 			l2->cms_rev_mask_1, l2->cms_rev_mask_2,
 			l2->cms_rev_mask_3);
 	}
+}
+
+static void print_cpu_info_string(struct cpuinfo_x86 *c)
+{
+	const struct leaf_0x80860003_0 *l3 = cpuid_leaf(c, 0x80860003);
+	const struct leaf_0x80860004_0 *l4 = cpuid_leaf(c, 0x80860004);
+	const struct leaf_0x80860005_0 *l5 = cpuid_leaf(c, 0x80860005);
+	const struct leaf_0x80860006_0 *l6 = cpuid_leaf(c, 0x80860006);
 
 	if (l3 && l4 && l5 && l6) {
 		u32 info[] = {
@@ -70,6 +69,17 @@ static void init_transmeta(struct cpuinfo_x86 *c)
 		};
 		pr_info("CPU: %s\n", (char *)info);
 	}
+}
+
+static void init_transmeta(struct cpuinfo_x86 *c)
+{
+	unsigned int cap_mask, uk;
+
+	early_init_transmeta(c);
+	cpu_detect_cache_sizes(c);
+
+	print_cpu_revision(c);
+	print_cpu_info_string(c);
 
 	/* Unhide possibly hidden capability flags */
 	rdmsr(0x80860004, cap_mask, uk);
-- 
2.53.0

