Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B6134A796
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774577917; cv=none; b=G/617NjvqVIi5m/AuhB88Y59pEGUeYTrXb4awcK4mBBGLO3ZKSpbjaklpfi3Pwk6tJ3+OYH/PZXr1DreAVZS1d1/ZMvU2x4kBpdOGosKKcxEKZcpgSwUAGfVtNTYWVTACW6GceWDzwAZoSwwfs/rikKltNPpkKardR9iJlBNOho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774577917; c=relaxed/simple;
	bh=qdI/2fsEm+5+Qjwu/BRetMrox5XiBtoFOVEFvGvEG44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bLQLrDAZIduPamVLbbMlbINsQIgSuSewXD1CqKIkNDJMDzYoKyyzwOCe/xie5iolzZ3cGwsihZeCCwGtGvehOI2owuN+jOwINLgW/Gc+KEA13o/izj+Mbb6ulqj9F+1qb1tdBpMxAJAcE6R57cqO2sYJ+8XEAujdfJ6aA98m8XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RltFqby1; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=d/Lc4KNP; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="RltFqby1";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="d/Lc4KNP"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774577914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DpJMNQoVd5GAesFaI0X69w3FDmB4uuSq3MGQ20oJHwM=;
	b=RltFqby1Mk1aldlYXNfEhnzEj8qO/FPZZQTkUkX10sGWnl+j1exh/GVukB1VATRSEU8G0e
	neHJ+20nMLYsxuN2Dh/Xm1yyX1Vumsfc/bYqJwZQeybvwQfYu9wRoFgNIIblrc9U9mr5aj
	88cthm2KPxJQH51QfUNDByD/A15LQUZEbMR/Yhr6SmxNWX+2AM9M02Qzgw1lLp9zOJh0jU
	W4VTZAPZbW/YKwzcTc/7z10KE487KVCpoDMLW59iiKBsmkJGBEUsBBYaYBE+GyDZiBIMw1
	adZYTTUovmdXWhm4cxeC7aTbxdRseZo4uTIu53iq3kNu551/zXxfhpCBCoNh9A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774577914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DpJMNQoVd5GAesFaI0X69w3FDmB4uuSq3MGQ20oJHwM=;
	b=d/Lc4KNPUST0TiMTb45sl1zmmPU8ul8Umx0kVTbldaAxqyIohZY5/PXtCCPe9POIENvhX2
	1Cix0m9ZTCOcc+Cw==
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
Subject: [PATCH v6 21/90] x86/cpuid: Split parser tables and add vendor-qualified parsing
Date: Fri, 27 Mar 2026 03:15:35 +0100
Message-ID: <20260327021645.555257-22-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For the CPUID parser, introduce a table listing vendor-specific CPUID
leaves.  Not all CPUID leaves should be queried on all x86 vendors, so the
parser will enumerate such leaves only if the boot machine's x86 vendor is
listed as supported.

This provides the following benefits:

  (a) Even when a CPUID leaf falls within the CPU's standard or extended
  maximum leaf range, querying architecturally unsupported and reserved
  CPUID leaves may trigger new kernel boot behaviors or subtle bugs;
  especially on legacy machines.

  (b) Associating x86 vendor information with CPUID leaves will enable the
  CPUID parser to emit (lightweight) error messages when malformed CPUID
  leaf output is detected.  This is due to the parser now being more
  certain that the queried leaf is valid on the machine.

  (c) Attaching x86 vendor information to CPUID leaves will relieve call
  sites, especially drivers, from ugly x86 vendor checks before querying a
  CPUID leaf.  Just checking if the CPUID APIs did not return NULL will be
  sufficient.

Split the CPUID parsing table into an "early boot" table and a standard
one.  The early boot phase parses only CPUID(0x0) and CPUID(0x1) since they
are needed to identify the CPU's x86 vendor.

Once the x86 vendor info is saved to the CPU's capability structure, invoke
the CPUID parser again to parse the rest of the CPUID table.  In that
second phase, the parser assumes that "boot_cpu_data.x86_vendor" is valid
and uses it for the CPUID leaves x86 vendor validity checks.

For each vendor-specific CPUID leaf, build its list of matching x86 vendors
using CPP varargs.  Encoding this as bitflags was not doable, since the x86
vendor IDs are just raw monotonic numbers from 0 (Intel) to 11 (Vortex).

Keep the CPUID parser's leaf vendors table empty for now.  Leaves like
CPUID(0x2), CPUID(0x4), CPUID(0x16), and CPUID(0x8000001d) will be added to
the parser vendor table once their support is actually implemented.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpuid/api.h   |   1 +
 arch/x86/kernel/cpu/common.c       |   9 ++-
 arch/x86/kernel/cpu/cpuid_parser.c | 100 +++++++++++++++++++++++++----
 arch/x86/kernel/cpu/cpuid_parser.h |  52 ++++++++++++++-
 arch/x86/xen/enlighten.c           |   2 +-
 5 files changed, 146 insertions(+), 18 deletions(-)

diff --git a/arch/x86/include/asm/cpuid/api.h b/arch/x86/include/asm/cpuid/api.h
index 82eddfa2347b..3d5a0d4918cc 100644
--- a/arch/x86/include/asm/cpuid/api.h
+++ b/arch/x86/include/asm/cpuid/api.h
@@ -532,6 +532,7 @@ static inline bool cpuid_amd_hygon_has_l3_cache(void)
  * CPUID parser exported APIs:
  */
 
+void cpuid_scan_cpu_early(struct cpuinfo_x86 *c);
 void cpuid_scan_cpu(struct cpuinfo_x86 *c);
 void cpuid_refresh_leaf(struct cpuinfo_x86 *c, u32 leaf);
 void cpuid_refresh_range(struct cpuinfo_x86 *c, u32 start, u32 end);
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 060f69ab3739..f7372833dd50 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -1019,9 +1019,11 @@ static void init_speculation_control(struct cpuinfo_x86 *c)
 
 void get_cpu_cap(struct cpuinfo_x86 *c)
 {
-	const struct leaf_0x80000000_0 *el0 = cpuid_leaf(c, 0x80000000);
+	const struct leaf_0x80000000_0 *el0;
 	u32 eax, ebx, ecx, edx;
 
+	cpuid_scan_cpu(c);
+
 	/* Intel-defined flags: level 0x00000001 */
 	if (c->cpuid_level >= 0x00000001) {
 		cpuid(0x00000001, &eax, &ebx, &ecx, &edx);
@@ -1055,6 +1057,7 @@ void get_cpu_cap(struct cpuinfo_x86 *c)
 		c->x86_capability[CPUID_D_1_EAX] = eax;
 	}
 
+	el0 = cpuid_leaf(c, 0x80000000);
 	c->extended_cpuid_level = el0 ? el0->max_ext_leaf : 0;
 
 	if (c->extended_cpuid_level >= 0x80000001) {
@@ -1796,7 +1799,7 @@ static void __init early_identify_cpu(struct cpuinfo_x86 *c)
 
 	/* cyrix could have cpuid enabled via c_identify()*/
 	if (cpuid_feature()) {
-		cpuid_scan_cpu(c);
+		cpuid_scan_cpu_early(c);
 		cpu_detect(c);
 		get_cpu_vendor(c);
 		intel_unlock_cpuid_leafs(c);
@@ -1969,7 +1972,7 @@ static void generic_identify(struct cpuinfo_x86 *c)
 	if (!cpuid_feature())
 		return;
 
-	cpuid_scan_cpu(c);
+	cpuid_scan_cpu_early(c);
 	cpu_detect(c);
 	get_cpu_vendor(c);
 	intel_unlock_cpuid_leafs(c);
diff --git a/arch/x86/kernel/cpu/cpuid_parser.c b/arch/x86/kernel/cpu/cpuid_parser.c
index 2cebe15f75d4..97b7f296df03 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.c
+++ b/arch/x86/kernel/cpu/cpuid_parser.c
@@ -21,6 +21,10 @@ static void cpuid_clear(const struct cpuid_parse_entry *e, const struct cpuid_re
 	memset(output->info, 0, sizeof(*output->info));
 }
 
+static const struct cpuid_vendor_entry cpuid_vendor_entries[] = {
+	CPUID_VENDOR_ENTRIES
+};
+
 /*
  * Leaf read functions:
  */
@@ -57,17 +61,57 @@ cpuid_read_0x80000000(const struct cpuid_parse_entry *e, const struct cpuid_read
 }
 
 /*
- * CPUID parser table:
+ * CPUID parser tables:
+ *
+ * At early boot, only leaves at cpuid_early_entries[] should be parsed.
  */
 
-static const struct cpuid_parse_entry cpuid_parse_entries[] = {
-	CPUID_PARSE_ENTRIES
+static const struct cpuid_parse_entry cpuid_early_entries[] = {
+	CPUID_EARLY_ENTRIES
+};
+
+static const struct cpuid_parse_entry cpuid_common_entries[] = {
+	CPUID_COMMON_ENTRIES
+};
+
+static const struct {
+	const struct cpuid_parse_entry	*table;
+	int				nr_entries;
+} cpuid_phases[] = {
+	{	cpuid_early_entries,	ARRAY_SIZE(cpuid_early_entries)		},
+	{	cpuid_common_entries,	ARRAY_SIZE(cpuid_common_entries)	},
 };
 
 /*
  * Leaf-independent parser code:
  */
 
+static bool cpuid_leaf_matches_vendor(unsigned int leaf, u8 cpu_vendor)
+{
+	const struct cpuid_parse_entry *p = cpuid_early_entries;
+	const struct cpuid_vendor_entry *v = cpuid_vendor_entries;
+
+	/* Leaves in the early boot parser table are vendor agnostic */
+	for (int i = 0; i < ARRAY_SIZE(cpuid_early_entries); i++, p++)
+		if (p->leaf == leaf)
+			return true;
+
+	/* Leaves in the vendor table must pass a CPU vendor check */
+	for (int i = 0; i < ARRAY_SIZE(cpuid_vendor_entries); i++, v++) {
+		if (v->leaf != leaf)
+			continue;
+
+		for (unsigned int j = 0; j < v->nvendors; j++)
+			if (cpu_vendor == v->vendors[j])
+				return true;
+
+		return false;
+	}
+
+	/* Remaining leaves are vendor agnostic */
+	return true;
+}
+
 static unsigned int cpuid_range_max_leaf(const struct cpuid_table *t, unsigned int range)
 {
 	const struct leaf_0x0_0 *l0 = __cpuid_table_subleaf(t, 0x0, 0);
@@ -96,6 +140,9 @@ __cpuid_reset_table(struct cpuid_table *t, const struct cpuid_parse_entry entrie
 		if (entry->leaf < start || entry->leaf > end)
 			continue;
 
+		if (!cpuid_leaf_matches_vendor(entry->leaf, boot_cpu_data.x86_vendor))
+			continue;
+
 		cpuid_clear(entry, &output);
 
 		/*
@@ -140,28 +187,51 @@ cpuid_fill_table(struct cpuid_table *t, const struct cpuid_parse_entry entries[]
 		__cpuid_fill_table(t, entries, nr_entries, ranges[i].start, ranges[i].end);
 }
 
-static void __cpuid_scan_cpu_full(struct cpuinfo_x86 *c)
+static void __cpuid_scan_cpu_full(struct cpuinfo_x86 *c, bool early_boot)
 {
-	unsigned int nr_entries = ARRAY_SIZE(cpuid_parse_entries);
+	int nphases = early_boot ? 1 : ARRAY_SIZE(cpuid_phases);
 	struct cpuid_table *table = &c->cpuid;
 
-	cpuid_fill_table(table, cpuid_parse_entries, nr_entries);
+	for (int i = 0; i < nphases; i++)
+		cpuid_fill_table(table, cpuid_phases[i].table, cpuid_phases[i].nr_entries);
 }
 
 static void
-__cpuid_scan_cpu_partial(struct cpuinfo_x86 *c, unsigned int start_leaf, unsigned int end_leaf)
+__cpuid_scan_cpu_partial(struct cpuinfo_x86 *c, bool early_boot, unsigned int start_leaf, unsigned int end_leaf)
 {
-	unsigned int nr_entries = ARRAY_SIZE(cpuid_parse_entries);
+	int nphases = early_boot ? 1 : ARRAY_SIZE(cpuid_phases);
 	struct cpuid_table *table = &c->cpuid;
 
-	__cpuid_zero_table(table, cpuid_parse_entries, nr_entries, start_leaf, end_leaf);
-	__cpuid_fill_table(table, cpuid_parse_entries, nr_entries, start_leaf, end_leaf);
+	for (int i = 0; i < nphases; i++) {
+		const struct cpuid_parse_entry *entries = cpuid_phases[i].table;
+		unsigned int nr_entries = cpuid_phases[i].nr_entries;
+
+		__cpuid_zero_table(table, entries, nr_entries, start_leaf, end_leaf);
+		__cpuid_fill_table(table, entries, nr_entries, start_leaf, end_leaf);
+	}
 }
 
 /*
  * Call-site APIs:
  */
 
+/**
+ * cpuid_scan_cpu_early() - Populate CPUID table on early boot
+ * @c:		CPU capability structure associated with the current CPU
+ *
+ * Populate the CPUID table embedded within @c with parsed CPUID data.
+ *
+ * This must be called at early boot, so that early boot code can identify the
+ * CPU's x86 vendor.  Only CPUID(0x0) and CPUID(0x1) are parsed.
+ *
+ * cpuid_scan_cpu() must be called later to complete the CPUID table.  That is,
+ * after saving the x86 vendor info to the CPU capability structure @c.
+ */
+void cpuid_scan_cpu_early(struct cpuinfo_x86 *c)
+{
+	__cpuid_scan_cpu_full(c, true);
+}
+
 /**
  * cpuid_scan_cpu() - Populate current CPU's CPUID table
  * @c:		CPU capability structure associated with the current CPU
@@ -169,10 +239,12 @@ __cpuid_scan_cpu_partial(struct cpuinfo_x86 *c, unsigned int start_leaf, unsigne
  * Populate the CPUID table embedded within @c with parsed CPUID data.  All CPUID
  * instructions are invoked locally, so this must be called on the CPU associated
  * with @c.
+ *
+ * cpuid_scan_cpu_early() must have been called earlier on @c.
  */
 void cpuid_scan_cpu(struct cpuinfo_x86 *c)
 {
-	__cpuid_scan_cpu_full(c);
+	__cpuid_scan_cpu_full(c, false);
 }
 
 /**
@@ -180,6 +252,8 @@ void cpuid_scan_cpu(struct cpuinfo_x86 *c)
  * @c:		CPU capability structure associated with the current CPU
  * @start:	Start of leaf range to be re-scanned
  * @end:	End of leaf range
+ *
+ * cpuid_scan_cpu_early() must have been called earlier on @c.
  */
 void cpuid_refresh_range(struct cpuinfo_x86 *c, u32 start, u32 end)
 {
@@ -189,13 +263,15 @@ void cpuid_refresh_range(struct cpuinfo_x86 *c, u32 start, u32 end)
 	if (WARN_ON_ONCE(CPUID_RANGE(start) != CPUID_RANGE(end)))
 		return;
 
-	__cpuid_scan_cpu_partial(c, start, end);
+	__cpuid_scan_cpu_partial(c, false, start, end);
 }
 
 /**
  * cpuid_refresh_leaf() - Rescan a CPUID table's leaf
  * @c:		CPU capability structure associated with the current CPU
  * @leaf:	Leaf to be re-scanned
+ *
+ * cpuid_scan_cpu_early() must have been called earlier on @c.
  */
 void cpuid_refresh_leaf(struct cpuinfo_x86 *c, u32 leaf)
 {
diff --git a/arch/x86/kernel/cpu/cpuid_parser.h b/arch/x86/kernel/cpu/cpuid_parser.h
index 3e11e13fa76c..a3f7dcc6c03f 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.h
+++ b/arch/x86/kernel/cpu/cpuid_parser.h
@@ -2,6 +2,7 @@
 #ifndef _ARCH_X86_CPUID_PARSER_H
 #define _ARCH_X86_CPUID_PARSER_H
 
+#include <linux/types.h>
 #include <asm/cpuid/types.h>
 
 /*
@@ -109,16 +110,63 @@ struct cpuid_parse_entry {
 	__CPUID_PARSE_ENTRY(_leaf, __cpuid_leaf_first_subleaf(_leaf), n, _reader_fn)
 
 /*
- * CPUID parser table:
+ * CPUID parser tables:
  */
 
-#define CPUID_PARSE_ENTRIES									\
+/*
+ * Early-boot CPUID leaves (to be parsed before x86 vendor detection)
+ *
+ * These leaves must be parsed at early boot to identify the x86 vendor. The
+ * parser treats them as universally valid across all vendors.
+ *
+ * At early boot, only leaves in this table must be parsed.  For all other
+ * leaves, the CPUID parser will assume that "boot_cpu_data.x86_vendor" is
+ * properly set beforehand.
+ *
+ * Note: If these entries are to be modified, please adapt the kernel-doc of
+ * cpuid_scan_cpu_early() accordingly.
+ */
+#define CPUID_EARLY_ENTRIES									\
 	/*			Leaf		Subleaf		Reader function */		\
 	CPUID_PARSE_ENTRY   (	0x0,		0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x1,		0,		generic			),	\
+
+/*
+ * Common CPUID leaves
+ *
+ * These leaves can be parsed once basic x86 vendor detection is in place.
+ * Further vendor-agnostic leaves, which are not needed at early boot, are also
+ * listed here.
+ *
+ * For vendor-specific leaves, a matching entry must be added to the CPUID leaf
+ * vendor table later defined.  Leaves which are here, but without a matching
+ * vendor entry, are treated by the CPUID parser as valid for all x86 vendors.
+ */
+#define CPUID_COMMON_ENTRIES									\
+	/*			Leaf		Subleaf		Reader function */		\
 	CPUID_PARSE_ENTRY   (	0x80000000,	0,		0x80000000		),	\
 	CPUID_PARSE_ENTRY   (	0x80000002,	0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80000003,	0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80000004,	0,		generic			),	\
 
+/*
+ * CPUID leaf vendor table:
+ */
+
+struct cpuid_vendor_entry {
+	unsigned int	leaf;
+	u8		vendors[X86_VENDOR_NUM];
+	u8		nvendors;
+};
+
+#define CPUID_VENDOR_ENTRY(_leaf, ...)							\
+	{										\
+		.leaf		= _leaf,						\
+		.vendors	= { __VA_ARGS__ },					\
+		.nvendors	= (sizeof((u8[]){__VA_ARGS__})/sizeof(u8)),		\
+	}
+
+#define CPUID_VENDOR_ENTRIES								\
+	/*		   Leaf		Vendor list		    */			\
+
 #endif /* _ARCH_X86_CPUID_PARSER_H */
diff --git a/arch/x86/xen/enlighten.c b/arch/x86/xen/enlighten.c
index cf061ed45ce8..b8444fdf77dc 100644
--- a/arch/x86/xen/enlighten.c
+++ b/arch/x86/xen/enlighten.c
@@ -76,7 +76,7 @@ unsigned long xen_released_pages;
 static __ref void xen_get_vendor(void)
 {
 	init_cpu_devs();
-	cpuid_scan_cpu(&boot_cpu_data);
+	cpuid_scan_cpu_early(&boot_cpu_data);
 	cpu_detect(&boot_cpu_data);
 	get_cpu_vendor(&boot_cpu_data);
 }
-- 
2.53.0

