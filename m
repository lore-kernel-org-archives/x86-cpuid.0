Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FC242188B
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982909; cv=none; b=Toiv1/dXjHyS5au65tu1UFT9YtmpVRpfkfuvIxdArCmllkK4mHLC8n06rcv6yp+JY4KmCB3tstUsk8eZ1JAJcHWKOYs3+KC973XRmoc9ZKF8natpADF7K6nomsUimjZsUOJWTqoi9y54xd+8ddKZ0gnQ6FK7ph2roVDImtTXp+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982909; c=relaxed/simple;
	bh=4Uobgi05lwFGgCCIX2zjPYZK8R471mlh44TPDuDud1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F06ScTct5K0h6Ym4mWFFjtiFrTaHn1ClXsRDTIk3fP2trcGglKntne28C0b4KCXVMYwNErxoPH7FTikYH7XIO6GkZ927vkUAHGerZvTokQN9JKNlF9JfGq8wxiLeLWQUJsNYLm+LEuqwNM8UjeOZT2PNwDEEnOUzyo7GrcZlp4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=a8VdSrl0; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xW7VrgND; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="a8VdSrl0";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xW7VrgND"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aiGfhNyYp68g38e7FWsCeHJurzgGYRzmuGFV0tjptEo=;
	b=a8VdSrl0YsSwcxnelkCs4ArraSL3GWuEewsUWZ+dm5x+N2ucDvS5GKKNz83kG5PfjlMpkD
	KWC/SAMH/mllYMIUH5wnIBYW5jzCZz3Psf3ZsOun4qr6Xm5xdxUU8bnEggG6L0TLVAt3K9
	Jg4w1aE3A9pFMmFEJ0BCPePx1bBDN2Ero8toUkKfK+p6vKGvKBxabXuFCo8mb3EGPoxP+m
	/KMr4YSrfr30d5PzWr3L7Nui1XDA2oboVlS+iTkSKUBcczhXWQHuPBBBuZPmUJ1wjmGeM1
	kBk9xxrrI5yuZ+SnfQbj7OacOCewCCiyCpwuvr8E4ZUaAI3bduh3KFNpK86vZQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aiGfhNyYp68g38e7FWsCeHJurzgGYRzmuGFV0tjptEo=;
	b=xW7VrgNDyZUhy0+AI9tX4mxeEGK+bJXqR9MZaYLId+BXi82Km9maI5cp9ehOpsBmpBJjZB
	uGmrNbNcDHQ2G3AA==
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
Subject: [PATCH v7 037/120] x86/cacheinfo: Use parsed CPUID(0x80000005) and CPUID(0x80000006)
Date: Thu, 28 May 2026 17:37:59 +0200
Message-ID: <20260528153923.403473-38-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For AMD CPUID(0x4)-emulation logic, use parsed CPUID(0x80000005) and
CPUID(0x80000006) instead of invoking CPUID queries.

Beside the CPUID parser centralization benefits, this allows using the auto
generated x86-cpuid-db data types, and their C99 bitfields, instead of
doing ugly bitwise operations or defining custom call site types.

Remove the 'union l[123]_cache' data types as they are no longer needed.

Replace the expression:

    ci->num_leaves = (cpuid_edx(0x80000006) & 0xf000) ? 4 : 3;

with:

    ci->num_leaves = cpuid_leaf(c, 0x80000006)->l3_assoc ? 4 : 3;

since per AMD manuals, an L3 associativity level of zero implies the
absence of a CPU L3 cache.

While at it, separate the "Fallback AMD CPUID(0x4) emulation" comment from
the "AMD_L2_L3_INVALID_ASSOC" one.  The former is as a code section header.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/cacheinfo.c | 103 +++++++++++++-------------------
 1 file changed, 40 insertions(+), 63 deletions(-)

diff --git a/arch/x86/kernel/cpu/cacheinfo.c b/arch/x86/kernel/cpu/cacheinfo.c
index 209a0c708213..7dab0d7152cc 100644
--- a/arch/x86/kernel/cpu/cacheinfo.c
+++ b/arch/x86/kernel/cpu/cacheinfo.c
@@ -56,47 +56,17 @@ static const enum cache_type cache_type_map[] = {
 };
 
 /*
- * Fallback AMD CPUID(0x4) emulation
+ * Fallback AMD CPUID(0x4) emulation:
  * AMD CPUs with TOPOEXT can just use CPUID(0x8000001d)
- *
+ */
+
+/*
  * @AMD_L2_L3_INVALID_ASSOC: cache info for the respective L2/L3 cache should
  * be determined from CPUID(0x8000001d) instead of CPUID(0x80000006).
  */
-
 #define AMD_CPUID4_FULLY_ASSOCIATIVE	0xffff
 #define AMD_L2_L3_INVALID_ASSOC		0x9
 
-union l1_cache {
-	struct {
-		unsigned line_size	:8;
-		unsigned lines_per_tag	:8;
-		unsigned assoc		:8;
-		unsigned size_in_kb	:8;
-	};
-	unsigned int val;
-};
-
-union l2_cache {
-	struct {
-		unsigned line_size	:8;
-		unsigned lines_per_tag	:4;
-		unsigned assoc		:4;
-		unsigned size_in_kb	:16;
-	};
-	unsigned int val;
-};
-
-union l3_cache {
-	struct {
-		unsigned line_size	:8;
-		unsigned lines_per_tag	:4;
-		unsigned assoc		:4;
-		unsigned res		:2;
-		unsigned size_encoded	:14;
-	};
-	unsigned int val;
-};
-
 /* L2/L3 associativity mapping */
 static const unsigned short assocs[] = {
 	[1]		= 1,
@@ -117,50 +87,52 @@ static const unsigned short assocs[] = {
 static const unsigned char levels[] = { 1, 1, 2, 3 };
 static const unsigned char types[]  = { 1, 2, 3, 3 };
 
-static void legacy_amd_cpuid4(int index, struct leaf_0x4_n *regs)
+static void legacy_amd_cpuid4(struct cpuinfo_x86 *c, int index, struct leaf_0x4_n *regs)
 {
-	unsigned int dummy, line_size, lines_per_tag, assoc, size_in_kb;
-	union l1_cache l1i, l1d, *l1;
-	union l2_cache l2;
-	union l3_cache l3;
+	const struct leaf_0x80000005_0 *el5 = cpuid_leaf(c, 0x80000005);
+	const struct leaf_0x80000006_0 *el6 = cpuid_leaf(c, 0x80000006);
+	const struct cpuid_regs *el5_raw = cpuid_leaf_raw(c, 0x80000005);
+	unsigned int line_size, lines_per_tag, assoc, size_in_kb;
 
 	*regs = (struct leaf_0x4_n){ };
 
-	cpuid(0x80000005, &dummy, &dummy, &l1d.val, &l1i.val);
-	cpuid(0x80000006, &dummy, &dummy, &l2.val, &l3.val);
-
-	l1 = &l1d;
 	switch (index) {
-	case 1:
-		l1 = &l1i;
-		fallthrough;
 	case 0:
-		if (!l1->val)
+		if (!el5 || !el5_raw->ecx)
 			return;
 
-		assoc		= (l1->assoc == 0xff) ? AMD_CPUID4_FULLY_ASSOCIATIVE : l1->assoc;
-		line_size	= l1->line_size;
-		lines_per_tag	= l1->lines_per_tag;
-		size_in_kb	= l1->size_in_kb;
+		assoc		= el5->l1_dcache_assoc;
+		line_size	= el5->l1_dcache_line_size;
+		lines_per_tag	= el5->l1_dcache_nlines;
+		size_in_kb	= el5->l1_dcache_size_kb;
+		break;
+	case 1:
+		if (!el5 || !el5_raw->edx)
+			return;
+
+		assoc		= el5->l1_icache_assoc;
+		line_size	= el5->l1_icache_line_size;
+		lines_per_tag	= el5->l1_icache_nlines;
+		size_in_kb	= el5->l1_icache_size_kb;
 		break;
 	case 2:
-		if (!l2.assoc || l2.assoc == AMD_L2_L3_INVALID_ASSOC)
+		if (!el6 || !el6->l2_assoc || el6->l2_assoc == AMD_L2_L3_INVALID_ASSOC)
 			return;
 
 		/* Use x86_cache_size as it might have K7 errata fixes */
-		assoc		= assocs[l2.assoc];
-		line_size	= l2.line_size;
-		lines_per_tag	= l2.lines_per_tag;
+		assoc		= assocs[el6->l2_assoc];
+		line_size	= el6->l2_line_size;
+		lines_per_tag	= el6->l2_nlines;
 		size_in_kb	= __this_cpu_read(cpu_info.x86_cache_size);
 		break;
 	case 3:
-		if (!l3.assoc || l3.assoc == AMD_L2_L3_INVALID_ASSOC)
+		if (!el6 || !el6->l3_assoc || el6->l3_assoc == AMD_L2_L3_INVALID_ASSOC)
 			return;
 
-		assoc		= assocs[l3.assoc];
-		line_size	= l3.line_size;
-		lines_per_tag	= l3.lines_per_tag;
-		size_in_kb	= l3.size_encoded * 512;
+		assoc		= assocs[el6->l3_assoc];
+		line_size	= el6->l3_line_size;
+		lines_per_tag	= el6->l3_nlines;
+		size_in_kb	= el6->l3_size_range * 512;
 		if (boot_cpu_has(X86_FEATURE_AMD_DCM)) {
 			size_in_kb	= size_in_kb >> 1;
 			assoc		= assoc >> 1;
@@ -170,6 +142,10 @@ static void legacy_amd_cpuid4(int index, struct leaf_0x4_n *regs)
 		return;
 	}
 
+	/* For L1d and L1i caches, 0xff is the full associativity marker */
+	if ((index == 0 || index == 1) && assoc == 0xff)
+		assoc = AMD_CPUID4_FULLY_ASSOCIATIVE;
+
 	regs->cache_self_init		= 1;
 	regs->cache_type		= types[index];
 	regs->cache_level		= levels[index];
@@ -213,7 +189,7 @@ static int amd_fill_cpuid4_info(struct cpuinfo_x86 *c, int index, struct _cpuid4
 		/* CPUID(0x8000001d) and CPUID(0x4) have the same bitfields */
 		l_0x4_regs = *(struct leaf_0x4_n *)regs;
 	} else
-		legacy_amd_cpuid4(index, &l_0x4_regs);
+		legacy_amd_cpuid4(c, index, &l_0x4_regs);
 
 	return cpuid4_info_fill_done(id4, &l_0x4_regs);
 }
@@ -298,12 +274,13 @@ void cacheinfo_hygon_init_llc_id(struct cpuinfo_x86 *c)
 
 void init_amd_cacheinfo(struct cpuinfo_x86 *c)
 {
+	const struct leaf_0x80000006_0 *el6 = cpuid_leaf(c, 0x80000006);
 	struct cpu_cacheinfo *ci = get_cpu_cacheinfo(c->cpu_index);
 
 	if (boot_cpu_has(X86_FEATURE_TOPOEXT))
 		ci->num_leaves = cpuid_subleaf_count(c, 0x8000001d);
-	else if (c->extended_cpuid_level >= 0x80000006)
-		ci->num_leaves = (cpuid_edx(0x80000006) & 0xf000) ? 4 : 3;
+	else if (el6)
+		ci->num_leaves = (el6->l3_assoc) ? 4 : 3;
 }
 
 void init_hygon_cacheinfo(struct cpuinfo_x86 *c)
-- 
2.54.0

