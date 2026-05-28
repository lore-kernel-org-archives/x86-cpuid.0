Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290933FF8BE
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982841; cv=none; b=KmVOgdshp7r5s8wKrucrx5tJwTsHHCVymYBewGWop7ABkJXtKGFTnzuSLIdK0C8bUak8+oZDKnkv4UOnaupvWhWhpIyGER8ZiiyJfgbA3Q++tPQMsuy3fy2KPumfu+DxX5igQ4zYDWClcNFAhAGDnm4xdyIkpEszfa8g7bRKtn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982841; c=relaxed/simple;
	bh=x0H7EDQSQDzozuBi6yY8P63753NIyQjB7Ye44PRzOYg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nI+FlIYrJJGbJDUFz37xyJ3Nth8vjYt6DKGL8l5zcBlrw7oS6O5LZD4aAyWPv+pxKm6lY+ihZu/MZ/DRbUkYzzd9vQ3tUou4cq4VScWBVPCrnLka8DgmDOkPgaQqB2WdHkZumwAh+40hlY6JXMkXhREhDD9nAUQLwYB/cRAAkq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GrB3SrzM; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=aXPYHqmx; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GrB3SrzM";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="aXPYHqmx"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lhvXydeK4qGnjCuLdcKfLEXDwg2fe5aKCCDZ/2rwZpo=;
	b=GrB3SrzM+CH7xbmh8VzJZn7mzHyR2GhwgWJScTJyW/cuOSaMXbBG/zyenyaCS4y8FiGvyY
	d9FsU1VE6PfEZY+DNVsuA+f7PnvTJoiT7EMJ8NwOqKUaUezB6jQUdTNbEOhZrDLAy8E0eI
	qVEjNteJAVfekdGd0YR+uOt42eWMSoDhWMgSu2E8saY+RiVi7SYFbkuf5v+BXpTaK/qDNr
	htqaShp7+k+EaBRxNrQHf1vnwBHSQsM3pB7i3BhhY+yXCyXFNcdkWYERQfiQTDG+wsVFP/
	cpM1Q/hihBu2kTh2dM5Hum9Pz75MkGd9b7e1jm/aIJYYSJPKa+cAXko5EjgEtw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lhvXydeK4qGnjCuLdcKfLEXDwg2fe5aKCCDZ/2rwZpo=;
	b=aXPYHqmxvcrArwVPL7dDvsLJ9gFDwbBfMd1R32Vu09+pI3S4aknqSpuRLsFdY4ABPdpmLN
	MOCZ7e3uFdGD04Cg==
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
Subject: [PATCH v7 016/120] x86/cpuid: Split parser tables and add vendor-qualified parsing
Date: Thu, 28 May 2026 17:37:38 +0200
Message-ID: <20260528153923.403473-17-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
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
index 3d5b5df544d1..67dd2c5b9680 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -1021,9 +1021,11 @@ static void init_speculation_control(struct cpuinfo_x86 *c)
 
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
@@ -1057,6 +1059,7 @@ void get_cpu_cap(struct cpuinfo_x86 *c)
 		c->x86_capability[CPUID_D_1_EAX] = eax;
 	}
 
+	el0 = cpuid_leaf(c, 0x80000000);
 	c->extended_cpuid_level = el0 ? el0->max_ext_leaf : 0;
 
 	if (c->extended_cpuid_level >= 0x80000001) {
@@ -1798,7 +1801,7 @@ static void __init early_identify_cpu(struct cpuinfo_x86 *c)
 
 	/* cyrix could have cpuid enabled via c_identify()*/
 	if (cpuid_feature()) {
-		cpuid_scan_cpu(c);
+		cpuid_scan_cpu_early(c);
 		cpu_detect(c);
 		get_cpu_vendor(c);
 		intel_unlock_cpuid_leafs(c);
@@ -1971,7 +1974,7 @@ static void generic_identify(struct cpuinfo_x86 *c)
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
2.54.0

