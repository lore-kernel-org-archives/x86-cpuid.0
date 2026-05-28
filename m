Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D915640244F
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982853; cv=none; b=TsWfN0kYTH6quE8eXcZ/l+cGgFB5GPBg+dT+9LkUEvFLL1gsJhzj4vy2ke+vyoEr68um7BIV4RAcK16CAG7r0KDk4uvwjOW7G2o+An/7grmWKS7YkhNg72A1qMy3Av3TacnN8M0+l+J1Z55mHKehHe9M6/UGmzj0BRAIvhbwstM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982853; c=relaxed/simple;
	bh=ydHPv7fmHv1JzEW1FzW4Y61d/BGZPKPLyjXn7yZ7gTk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZTxH+uP+GlyfcSaR0DX1yVDqAldPfeCiNXve1ifATY1rd054yuyLvty1gi/3pU/MLitFDEhkpMrkl+o7a3xLLSZzyrtXcJrW7gKcaMACr6rJKnHRxXi3hCP8rBIy0Jj+jnoqdmUqyZ1FA094hX7QqwntIP1nCjicGmQOXc7GD5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Owcnq1yI; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=k7S5/ZY6; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Owcnq1yI";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="k7S5/ZY6"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H3whWOY414cV6/V1ssDuQm1WPHOhn7VoY/VIHM54nKs=;
	b=Owcnq1yIUf7Bto/myYAgcsWAMTve28bLzN4nKI6su3csj8yC7B4vuPY1/UxlqYkQh84m8n
	Za+kU6rQECX5zm7H6EvucJrhEcpaOm2CjwQJzhsDMdVZ6csrRBRpYfBQr1JG+Z13pwCh97
	RMNWuYyvnv4q1/Gz7rHLJPJGHu8Vdu88kXQ4kiVV7+/Eys7dPdFx9tidbVBEcZztyl2PlM
	7oU85Q5g5eENX0SFPl9w0jS4RlT1xHZIDI4d2k/2B6yEwrS2ly7xnq+hFhdIGeiuqXZqkZ
	jz+kGLT4fmjOw6z3jvVjBcbi02L7ZoBFE9lJmUaKX1tfSYdar+waB1njqfmZkA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H3whWOY414cV6/V1ssDuQm1WPHOhn7VoY/VIHM54nKs=;
	b=k7S5/ZY6wXPuv3QYQ3vPsDk9sCPt18T7+MORB/J99V4Pll8KDR9AQjTPdHhHWRPanmfKLM
	cleSiPLeyPmZQ/Cw==
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
Subject: [PATCH v7 020/120] x86/cpuid: Parse Transmeta and Centaur extended ranges
Date: Thu, 28 May 2026 17:37:42 +0200
Message-ID: <20260528153923.403473-21-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Parse the Transmeta extended CPUID(0x80860000)->CPUID(0x80860006) range.

Reuse the CPUID(0x80000000) read function and its safety guards against
CPUs repeating the output of the highest standard CPUID leaf.  Transmeta's
code at early_init_transmeta() already carries a similar guard.

Parse Centaur/Zhaoxin extended CPUID(0xc0000000) and CPUID(0xc0000001).

Add x86 vendor tags for the Transmeta and Centaur/Zhaoxin CPUID leaves so
that they are not parsed on other vendors.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpuid/types.h | 13 ++++++++
 arch/x86/kernel/cpu/cpuid_parser.c | 48 +++++++++++++++++++-----------
 arch/x86/kernel/cpu/cpuid_parser.h | 18 +++++++++++
 3 files changed, 61 insertions(+), 18 deletions(-)

diff --git a/arch/x86/include/asm/cpuid/types.h b/arch/x86/include/asm/cpuid/types.h
index 2939ad095f6c..8cc9f81e9526 100644
--- a/arch/x86/include/asm/cpuid/types.h
+++ b/arch/x86/include/asm/cpuid/types.h
@@ -37,9 +37,13 @@ enum cpuid_regs_idx {
 
 #define CPUID_BASE_START	0x00000000
 #define CPUID_EXT_START		0x80000000
+#define CPUID_TMX_START		0x80860000
+#define CPUID_CTR_START		0xc0000000
 
 #define CPUID_BASE_END		CPUID_RANGE_MAX(CPUID_BASE_START)
 #define CPUID_EXT_END		CPUID_RANGE_MAX(CPUID_EXT_START)
+#define CPUID_TMX_END		CPUID_RANGE_MAX(CPUID_TMX_START)
+#define CPUID_CTR_END		CPUID_RANGE_MAX(CPUID_CTR_START)
 
 /*
  * Types for CPUID(0x2) parsing:
@@ -211,6 +215,15 @@ struct cpuid_leaves {
 	CPUID_LEAF   (  0x80000002,	0  );
 	CPUID_LEAF   (  0x80000003,	0  );
 	CPUID_LEAF   (  0x80000004,	0  );
+	CPUID_LEAF   (  0x80860000,	0  );
+	CPUID_LEAF   (  0x80860001,	0  );
+	CPUID_LEAF   (  0x80860002,	0  );
+	CPUID_LEAF   (  0x80860003,	0  );
+	CPUID_LEAF   (  0x80860004,	0  );
+	CPUID_LEAF   (  0x80860005,	0  );
+	CPUID_LEAF   (  0x80860006,	0  );
+	CPUID_LEAF   (  0xc0000000,	0  );
+	CPUID_LEAF   (  0xc0000001,	0  );
 };
 
 /*
diff --git a/arch/x86/kernel/cpu/cpuid_parser.c b/arch/x86/kernel/cpu/cpuid_parser.c
index ab736f03051e..a7e6692f767b 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.c
+++ b/arch/x86/kernel/cpu/cpuid_parser.c
@@ -42,24 +42,30 @@ cpuid_read_generic(const struct cpuid_parse_entry *e, const struct cpuid_read_ou
 		cpuid_read_subleaf(e->leaf, e->subleaf + i, regs);
 }
 
-static void
-cpuid_read_0x80000000(const struct cpuid_parse_entry *e, const struct cpuid_read_output *output)
-{
-	struct leaf_0x80000000_0 *el0 = (struct leaf_0x80000000_0 *)output->regs;
-
-	cpuid_read_subleaf(e->leaf, e->subleaf, el0);
-
-	/*
-	 * Protect against Intel 32-bit CPUs lacking an extended CPUID range.  A
-	 * CPUID(0x80000000) query on such machines will repeat the output of the
-	 * highest standard CPUID leaf instead.
-	 */
-	if (CPUID_RANGE(el0->max_ext_leaf) != CPUID_EXT_START)
-		return;
-
-	output->info->nr_entries = 1;
+/*
+ * Define an extended range CPUID read function
+ *
+ * Guard against CPUs lacking the passed range leaf; e.g. Intel 32-bit CPUs lacking
+ * CPUID(0x80000000).  A query on such machines will just repeat the output of the
+ * highest standard CPUID leaf.
+ */
+#define define_cpuid_range_read_function(_range, _name)					\
+static void											\
+cpuid_read_##_range(const struct cpuid_parse_entry *e, const struct cpuid_read_output *output)	\
+{												\
+	struct leaf_##_range##_0 *l = (struct leaf_##_range##_0 *)output->regs;			\
+												\
+	cpuid_read_subleaf(e->leaf, e->subleaf, l);						\
+	if (CPUID_RANGE(l->max_##_name##_leaf) != _range)					\
+		return;										\
+												\
+	output->info->nr_entries = 1;								\
 }
 
+define_cpuid_range_read_function(0x80000000, ext);
+define_cpuid_range_read_function(0x80860000, tra);
+define_cpuid_range_read_function(0xc0000000, cntr);
+
 /*
  * CPUID parser tables:
  *
@@ -115,10 +121,14 @@ static unsigned int cpuid_range_max_leaf(const struct cpuid_table *t, unsigned i
 {
 	const struct leaf_0x0_0 *l0 = __cpuid_table_subleaf(t, 0x0, 0);
 	const struct leaf_0x80000000_0 *el0 = __cpuid_table_subleaf(t, 0x80000000, 0);
+	const struct leaf_0x80860000_0 *tl0 = __cpuid_table_subleaf(t, 0x80860000, 0);
+	const struct leaf_0xc0000000_0 *cl0 = __cpuid_table_subleaf(t, 0xc0000000, 0);
 
 	switch (range) {
-	case CPUID_BASE_START:	return l0  ?  l0->max_std_leaf : 0;
-	case CPUID_EXT_START:	return el0 ? el0->max_ext_leaf : 0;
+	case CPUID_BASE_START:	return l0  ?  l0->max_std_leaf  : 0;
+	case CPUID_EXT_START:	return el0 ? el0->max_ext_leaf  : 0;
+	case CPUID_TMX_START:	return tl0 ? tl0->max_tra_leaf  : 0;
+	case CPUID_CTR_START:	return cl0 ? cl0->max_cntr_leaf : 0;
 	default:		return 0;
 	}
 }
@@ -180,6 +190,8 @@ cpuid_fill_table(struct cpuid_table *t, const struct cpuid_parse_entry entries[]
 	} ranges[] = {
 		{ CPUID_BASE_START, CPUID_BASE_END },
 		{ CPUID_EXT_START,  CPUID_EXT_END  },
+		{ CPUID_TMX_START,  CPUID_TMX_END  },
+		{ CPUID_CTR_START,  CPUID_CTR_END  },
 	};
 
 	for (unsigned int i = 0; i < ARRAY_SIZE(ranges); i++)
diff --git a/arch/x86/kernel/cpu/cpuid_parser.h b/arch/x86/kernel/cpu/cpuid_parser.h
index ee1958f3d369..76a87a71b430 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.h
+++ b/arch/x86/kernel/cpu/cpuid_parser.h
@@ -149,6 +149,15 @@ struct cpuid_parse_entry {
 	CPUID_PARSE_ENTRY   (	0x80000002,	0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80000003,	0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80000004,	0,		generic			),	\
+	CPUID_PARSE_ENTRY   (	0x80860000,	0,		0x80860000		),	\
+	CPUID_PARSE_ENTRY   (	0x80860001,	0,		generic			),	\
+	CPUID_PARSE_ENTRY   (	0x80860002,	0,		generic			),	\
+	CPUID_PARSE_ENTRY   (	0x80860003,	0,		generic			),	\
+	CPUID_PARSE_ENTRY   (	0x80860004,	0,		generic			),	\
+	CPUID_PARSE_ENTRY   (	0x80860005,	0,		generic			),	\
+	CPUID_PARSE_ENTRY   (	0x80860006,	0,		generic			),	\
+	CPUID_PARSE_ENTRY   (	0xc0000000,	0,		0xc0000000		),	\
+	CPUID_PARSE_ENTRY   (	0xc0000001,	0,		generic			),	\
 
 /*
  * CPUID parser phases:
@@ -182,5 +191,14 @@ struct cpuid_vendor_entry {
 #define CPUID_VENDOR_ENTRIES								\
 	/*		   Leaf		Vendor list		    */			\
 	CPUID_VENDOR_ENTRY(0x16,	X86_VENDOR_INTEL),				\
+	CPUID_VENDOR_ENTRY(0x80860000,	X86_VENDOR_TRANSMETA),				\
+	CPUID_VENDOR_ENTRY(0x80860001,	X86_VENDOR_TRANSMETA),				\
+	CPUID_VENDOR_ENTRY(0x80860002,	X86_VENDOR_TRANSMETA),				\
+	CPUID_VENDOR_ENTRY(0x80860003,	X86_VENDOR_TRANSMETA),				\
+	CPUID_VENDOR_ENTRY(0x80860004,	X86_VENDOR_TRANSMETA),				\
+	CPUID_VENDOR_ENTRY(0x80860005,	X86_VENDOR_TRANSMETA),				\
+	CPUID_VENDOR_ENTRY(0x80860006,	X86_VENDOR_TRANSMETA),				\
+	CPUID_VENDOR_ENTRY(0xc0000000,	X86_VENDOR_CENTAUR, X86_VENDOR_ZHAOXIN),	\
+	CPUID_VENDOR_ENTRY(0xc0000001,	X86_VENDOR_CENTAUR, X86_VENDOR_ZHAOXIN),	\
 
 #endif /* _ARCH_X86_CPUID_PARSER_H */
-- 
2.54.0

