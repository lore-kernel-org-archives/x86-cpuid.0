Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223703090C1
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774577879; cv=none; b=ThD19psfzBi71ikKpJ6AiIGU92x9MU49vmg1+E/nBSh0YichkPfQyAEcZN0LWfO13IeGWVQ9j1nl1GcdQe4Z4h5LXcJPF6Uzf2bjhlfgShlKZj3JMUpbHzgKONKcBOjF37DwvHONTgKv0PUewSIQ8UWf3xZ9k66dnARwUDN4KlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774577879; c=relaxed/simple;
	bh=3DHM/LBZ8RbQDdmgFQWbIXYODtS/hSJWe0Fgzks1ZX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VRgozAw753IJlvezzjkU66M/N1EvRBPPekjZrvQoQRc5Tzv3uj19YQqNfOxjW8KWZ6ARksq5liC4YvnkwTucfqjzMaQITB/CjlBndJlpk2S1tnfzoyjx5EX1rXNG8xOckRO4DPGYyrpCrgBfk39G43yDCApSURIX7aCT8nlS9WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=XIfeeMeU; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hrpZNfZN; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="XIfeeMeU";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hrpZNfZN"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774577875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=unMQBVaxBEl9RSanDgGvz0+Z+ZzVyz8CIMinxGw3u14=;
	b=XIfeeMeUbfwJvuvxM+Xrvhs9+cqsFUUCE18n8PzFow6NBhjqP1L598Avz/3gD8TSVApy8S
	rwJ8VmzrICGNy2RrY9vu4aLi+/taUvkLx7M3pFRxDzdNPuCoFQx0aXtnZk11JH5BGDXPQP
	rBU716BFD/D9FCa5QLVLFX37ZEVVECc8hvwP1IiDyUnM6DR/rGV7g4dmPpNZrV0PzLgN6P
	co0ha/5nRiZRChS3PzC1QAhss4tK4iTLQiZr7awSq0AVT8mEDXk1fdClewQZzB4qZrPfBc
	n+uhesSjXGDF/MbD+6K7r+ck8qK4FqqwFF8qYDFxLGUECkhqkH7YsRGz60S8nQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774577875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=unMQBVaxBEl9RSanDgGvz0+Z+ZzVyz8CIMinxGw3u14=;
	b=hrpZNfZN90yx0JgW27Y9+/HbJzmRaY+MZ42tgB2K4tg83HeoOAnLb6fIEnPaYiN7Xzzx+C
	IpHF0XEqSO7TzABg==
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
Subject: [PATCH v6 09/90] x86/cpuid: Introduce a centralized CPUID parser
Date: Fri, 27 Mar 2026 03:15:23 +0100
Message-ID: <20260327021645.555257-10-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a CPUID parser for populating the system's CPUID tables.

Since accessing a leaf within the CPUID table requires compile time
tokenization, split the parser into two stages:

  (a) Compile-time macros for tokenizing the leaf/subleaf offsets within
      the CPUID table.

  (b) Generic runtime code to fill the CPUID data, using a parsing table
      which collects these compile-time offsets.

For actual CPUID output parsing, support both generic and leaf-specific
read functions.

To ensure CPUID data early availability, invoke the parser during early
boot, early Xen boot, and at early secondary CPUs bring up.

Provide call site APIs to refresh a single leaf, or a leaf range, within
the CPUID tables.  This is for sites issuing MSR writes that partially
changes the CPU's CPUID layout.  Doing full CPUID table rescans in such
cases will be destructive since the CPUID tables will host all of the
kernel's X86_FEATURE flags at a later stage.

Suggested-by: Thomas Gleixner <tglx@kernel.org>
Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpuid/api.h   |   9 ++
 arch/x86/kernel/cpu/Makefile       |   1 +
 arch/x86/kernel/cpu/common.c       |   5 +-
 arch/x86/kernel/cpu/cpuid_parser.c | 182 +++++++++++++++++++++++++++++
 arch/x86/kernel/cpu/cpuid_parser.h | 120 +++++++++++++++++++
 arch/x86/xen/enlighten.c           |   3 +-
 arch/x86/xen/enlighten_pv.c        |   1 +
 7 files changed, 319 insertions(+), 2 deletions(-)
 create mode 100644 arch/x86/kernel/cpu/cpuid_parser.c
 create mode 100644 arch/x86/kernel/cpu/cpuid_parser.h

diff --git a/arch/x86/include/asm/cpuid/api.h b/arch/x86/include/asm/cpuid/api.h
index b868902dbf5f..82eddfa2347b 100644
--- a/arch/x86/include/asm/cpuid/api.h
+++ b/arch/x86/include/asm/cpuid/api.h
@@ -7,6 +7,7 @@
 #include <linux/build_bug.h>
 #include <linux/types.h>
 
+#include <asm/processor.h>
 #include <asm/string.h>
 
 /*
@@ -527,4 +528,12 @@ static inline bool cpuid_amd_hygon_has_l3_cache(void)
 	__cpuid_table_nr_filled_subleaves(&(_cpuinfo)->cpuid, _leaf, n);	\
 })
 
+/*
+ * CPUID parser exported APIs:
+ */
+
+void cpuid_scan_cpu(struct cpuinfo_x86 *c);
+void cpuid_refresh_leaf(struct cpuinfo_x86 *c, u32 leaf);
+void cpuid_refresh_range(struct cpuinfo_x86 *c, u32 start, u32 end);
+
 #endif /* _ASM_X86_CPUID_API_H */
diff --git a/arch/x86/kernel/cpu/Makefile b/arch/x86/kernel/cpu/Makefile
index 2f8a58ef690e..d2e8a849f180 100644
--- a/arch/x86/kernel/cpu/Makefile
+++ b/arch/x86/kernel/cpu/Makefile
@@ -19,6 +19,7 @@ KCSAN_SANITIZE_common.o := n
 
 obj-y			:= cacheinfo.o scattered.o
 obj-y			+= topology_common.o topology_ext.o topology_amd.o
+obj-y			+= cpuid_parser.o
 obj-y			+= common.o
 obj-y			+= rdrand.o
 obj-y			+= match.o
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index a8ff4376c286..303faa612a6c 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -1775,6 +1775,7 @@ static void __init cpu_parse_early_param(void)
 static void __init early_identify_cpu(struct cpuinfo_x86 *c)
 {
 	memset(&c->x86_capability, 0, sizeof(c->x86_capability));
+	memset(&c->cpuid, 0, sizeof(c->cpuid));
 	c->extended_cpuid_level = 0;
 
 	if (!cpuid_feature())
@@ -1782,6 +1783,7 @@ static void __init early_identify_cpu(struct cpuinfo_x86 *c)
 
 	/* cyrix could have cpuid enabled via c_identify()*/
 	if (cpuid_feature()) {
+		cpuid_scan_cpu(c);
 		cpu_detect(c);
 		get_cpu_vendor(c);
 		intel_unlock_cpuid_leafs(c);
@@ -1954,8 +1956,8 @@ static void generic_identify(struct cpuinfo_x86 *c)
 	if (!cpuid_feature())
 		return;
 
+	cpuid_scan_cpu(c);
 	cpu_detect(c);
-
 	get_cpu_vendor(c);
 	intel_unlock_cpuid_leafs(c);
 	get_cpu_cap(c);
@@ -2007,6 +2009,7 @@ static void identify_cpu(struct cpuinfo_x86 *c)
 #endif
 	c->x86_cache_alignment = c->x86_clflush_size;
 	memset(&c->x86_capability, 0, sizeof(c->x86_capability));
+	memset(&c->cpuid, 0, sizeof(c->cpuid));
 #ifdef CONFIG_X86_VMX_FEATURE_NAMES
 	memset(&c->vmx_capability, 0, sizeof(c->vmx_capability));
 #endif
diff --git a/arch/x86/kernel/cpu/cpuid_parser.c b/arch/x86/kernel/cpu/cpuid_parser.c
new file mode 100644
index 000000000000..898b0c441431
--- /dev/null
+++ b/arch/x86/kernel/cpu/cpuid_parser.c
@@ -0,0 +1,182 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * CPUID parser; for populating the system's CPUID tables.
+ */
+
+#include <linux/kernel.h>
+
+#include <asm/cpuid/api.h>
+#include <asm/processor.h>
+
+#include "cpuid_parser.h"
+
+/* Clear a single CPUID table entry */
+static void cpuid_clear(const struct cpuid_parse_entry *e, const struct cpuid_read_output *output)
+{
+	struct cpuid_regs *regs = output->regs;
+
+	for (int i = 0; i < e->maxcnt; i++, regs++)
+		memset(regs, 0, sizeof(*regs));
+
+	memset(output->info, 0, sizeof(*output->info));
+}
+
+/*
+ * Leaf read functions:
+ */
+
+/*
+ * Default CPUID read function
+ * Satisfies the requirements stated at 'struct cpuid_parse_entry'->read().
+ */
+static void
+cpuid_read_generic(const struct cpuid_parse_entry *e, const struct cpuid_read_output *output)
+{
+	struct cpuid_regs *regs = output->regs;
+
+	for (int i = 0; i < e->maxcnt; i++, regs++, output->info->nr_entries++)
+		cpuid_read_subleaf(e->leaf, e->subleaf + i, regs);
+}
+
+/*
+ * CPUID parser table:
+ */
+
+static const struct cpuid_parse_entry cpuid_parse_entries[] = {
+	CPUID_PARSE_ENTRIES
+};
+
+/*
+ * Leaf-independent parser code:
+ */
+
+static unsigned int cpuid_range_max_leaf(const struct cpuid_table *t, unsigned int range)
+{
+	const struct leaf_0x0_0 *l0 = __cpuid_table_subleaf(t, 0x0, 0);
+
+	switch (range) {
+	case CPUID_BASE_START:	return l0  ?  l0->max_std_leaf : 0;
+	default:		return 0;
+	}
+}
+
+static void
+__cpuid_reset_table(struct cpuid_table *t, const struct cpuid_parse_entry entries[],
+		    unsigned int nr_entries, unsigned int start, unsigned int end, bool fill)
+{
+	const struct cpuid_parse_entry *entry = entries;
+	unsigned int range = CPUID_RANGE(start);
+
+	for (unsigned int i = 0; i < nr_entries; i++, entry++) {
+		struct cpuid_read_output output = {
+			.regs = cpuid_table_regs_p(t, entry->regs_offs),
+			.info = cpuid_table_info_p(t, entry->info_offs),
+		};
+
+		if (entry->leaf < start || entry->leaf > end)
+			continue;
+
+		cpuid_clear(entry, &output);
+
+		/*
+		 * Read the range's anchor leaf unconditionally so that the cached
+		 * maximum valid leaf value is available for the remaining entries.
+		 */
+		if (fill && (entry->leaf == range || entry->leaf <= cpuid_range_max_leaf(t, range)))
+			entry->read(entry, &output);
+	}
+}
+
+/*
+ * Zero all cached CPUID entries within [@start-@end] range.  This is needed when
+ * certain operations like MSR writes induce changes to the CPU's CPUID layout.
+ */
+static void
+__cpuid_zero_table(struct cpuid_table *t, const struct cpuid_parse_entry entries[],
+		   unsigned int nr_entries, unsigned int start, unsigned int end)
+{
+	__cpuid_reset_table(t, entries, nr_entries, start, end, false);
+}
+
+static void
+__cpuid_fill_table(struct cpuid_table *t, const struct cpuid_parse_entry entries[],
+		   unsigned int nr_entries, unsigned int start, unsigned int end)
+{
+	__cpuid_reset_table(t, entries, nr_entries, start, end, true);
+}
+
+static void
+cpuid_fill_table(struct cpuid_table *t, const struct cpuid_parse_entry entries[], unsigned int nr_entries)
+{
+	static const struct {
+		unsigned int start;
+		unsigned int end;
+	} ranges[] = {
+		{ CPUID_BASE_START, CPUID_BASE_END },
+	};
+
+	for (unsigned int i = 0; i < ARRAY_SIZE(ranges); i++)
+		__cpuid_fill_table(t, entries, nr_entries, ranges[i].start, ranges[i].end);
+}
+
+static void __cpuid_scan_cpu_full(struct cpuinfo_x86 *c)
+{
+	unsigned int nr_entries = ARRAY_SIZE(cpuid_parse_entries);
+	struct cpuid_table *table = &c->cpuid;
+
+	cpuid_fill_table(table, cpuid_parse_entries, nr_entries);
+}
+
+static void
+__cpuid_scan_cpu_partial(struct cpuinfo_x86 *c, unsigned int start_leaf, unsigned int end_leaf)
+{
+	unsigned int nr_entries = ARRAY_SIZE(cpuid_parse_entries);
+	struct cpuid_table *table = &c->cpuid;
+
+	__cpuid_zero_table(table, cpuid_parse_entries, nr_entries, start_leaf, end_leaf);
+	__cpuid_fill_table(table, cpuid_parse_entries, nr_entries, start_leaf, end_leaf);
+}
+
+/*
+ * Call-site APIs:
+ */
+
+/**
+ * cpuid_scan_cpu() - Populate current CPU's CPUID table
+ * @c:		CPU capability structure associated with the current CPU
+ *
+ * Populate the CPUID table embedded within @c with parsed CPUID data.  All CPUID
+ * instructions are invoked locally, so this must be called on the CPU associated
+ * with @c.
+ */
+void cpuid_scan_cpu(struct cpuinfo_x86 *c)
+{
+	__cpuid_scan_cpu_full(c);
+}
+
+/**
+ * cpuid_refresh_range() - Rescan a CPUID table's leaf range
+ * @c:		CPU capability structure associated with the current CPU
+ * @start:	Start of leaf range to be re-scanned
+ * @end:	End of leaf range
+ */
+void cpuid_refresh_range(struct cpuinfo_x86 *c, u32 start, u32 end)
+{
+	if (WARN_ON_ONCE(start > end))
+		return;
+
+	if (WARN_ON_ONCE(CPUID_RANGE(start) != CPUID_RANGE(end)))
+		return;
+
+	__cpuid_scan_cpu_partial(c, start, end);
+}
+
+/**
+ * cpuid_refresh_leaf() - Rescan a CPUID table's leaf
+ * @c:		CPU capability structure associated with the current CPU
+ * @leaf:	Leaf to be re-scanned
+ */
+void cpuid_refresh_leaf(struct cpuinfo_x86 *c, u32 leaf)
+{
+	cpuid_refresh_range(c, leaf, leaf);
+}
diff --git a/arch/x86/kernel/cpu/cpuid_parser.h b/arch/x86/kernel/cpu/cpuid_parser.h
new file mode 100644
index 000000000000..df627306cc8c
--- /dev/null
+++ b/arch/x86/kernel/cpu/cpuid_parser.h
@@ -0,0 +1,120 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ARCH_X86_CPUID_PARSER_H
+#define _ARCH_X86_CPUID_PARSER_H
+
+#include <asm/cpuid/types.h>
+
+/*
+ * Since accessing the CPUID leaves at 'struct cpuid_leaves' require compile time
+ * tokenization, split the CPUID parser into two stages: compile time macros for
+ * tokenizing the leaf/subleaf output offsets within the table, and generic runtime
+ * code to write to the relevant CPUID leaves using such offsets.
+ *
+ * The output of the compile time macros is cached by a compile time "parse entry"
+ * table (see 'struct cpuid_parse_entry').  The runtime parser code will utilize
+ * such offsets by passing them to the cpuid_table_*_p() functions.
+ */
+
+/*
+ * Compile time CPUID table offset calculations:
+ *
+ * @_leaf:	CPUID leaf, in 0xN format
+ * @_subleaf:	CPUID subleaf, in decimal format
+ */
+
+#define __cpuid_leaves_regs_offset(_leaf, _subleaf)			\
+	offsetof(struct cpuid_leaves, leaf_ ## _leaf ## _ ## _subleaf)
+
+#define __cpuid_leaves_info_offset(_leaf, _subleaf)			\
+	offsetof(struct cpuid_leaves, leaf_ ## _leaf ## _ ## _subleaf ## _ ## info)
+
+#define __cpuid_leaves_regs_maxcnt(_leaf, _subleaf)			\
+	ARRAY_SIZE(((struct cpuid_leaves *)NULL)->leaf_ ## _leaf ## _ ## _subleaf)
+
+/*
+ * Translation of compile time offsets to generic runtime pointers:
+ */
+
+static inline struct cpuid_regs *
+cpuid_table_regs_p(const struct cpuid_table *t, unsigned long regs_offset)
+{
+	return (struct cpuid_regs *)((unsigned long)(&t->leaves) + regs_offset);
+}
+
+static inline struct leaf_parse_info *
+cpuid_table_info_p(const struct cpuid_table *t, unsigned long info_offset)
+{
+	return (struct leaf_parse_info *)((unsigned long)(&t->leaves) + info_offset);
+}
+
+/**
+ * struct cpuid_read_output - Output of a CPUID read operation
+ * @regs:	Pointer to an array of CPUID outputs, where each array element covers the
+ *		full EAX->EDX output range.
+ * @info:	Pointer to query info; for saving the number of filled elements at @regs.
+ *
+ * A CPUID parser read function like cpuid_read_generic() or cpuid_read_0xN() uses this
+ * structure to save the CPUID query outputs.  Actual storage for @regs and @info is
+ * provided by the read function caller, and is typically within the CPU's CPUID table.
+ *
+ * See struct cpuid_parse_entry.read().
+ */
+struct cpuid_read_output {
+	struct cpuid_regs	*regs;
+	struct leaf_parse_info	*info;
+};
+
+/**
+ * struct cpuid_parse_entry - CPUID parse table entry
+ * @leaf:	Leaf number to be parsed
+ * @subleaf:	Subleaf number to be parsed
+ * @regs_offs:	Offset within 'struct cpuid_leaves' for saving the CPUID query output; to be
+ *		passed to cpuid_table_regs_p().
+ * @info_offs:	Offset within 'struct cpuid_leaves' for saving the CPUID query parse info; to be
+ *		passed to cpuid_table_info_p().
+ * @maxcnt:	Maximum number of output storage entries available for the CPUID query.
+ * @read:	Read function for this entry.  It must save the parsed CPUID output to the passed
+ *		'struct cpuid_read_output'->regs array of size >= @maxcnt.  It must set
+ *		'struct cpuid_read_output'->info.nr_entries to the number of CPUID output entries
+ *		parsed and filled.  A generic implementation is provided at cpuid_read_generic().
+ */
+struct cpuid_parse_entry {
+	unsigned int	leaf;
+	unsigned int	subleaf;
+	unsigned int	regs_offs;
+	unsigned int	info_offs;
+	unsigned int	maxcnt;
+	void		(*read)(const struct cpuid_parse_entry *e, const struct cpuid_read_output *o);
+};
+
+#define __CPUID_PARSE_ENTRY(_leaf, _subleaf, _suffix, _reader_fn)		\
+	{									\
+		.leaf		= _leaf,					\
+		.subleaf	= _subleaf,					\
+		.regs_offs	= __cpuid_leaves_regs_offset(_leaf, _suffix),	\
+		.info_offs	= __cpuid_leaves_info_offset(_leaf, _suffix),	\
+		.maxcnt		= __cpuid_leaves_regs_maxcnt(_leaf, _suffix),	\
+		.read		= cpuid_read_ ## _reader_fn,			\
+	}
+
+/*
+ * CPUID_PARSE_ENTRY_N() is for parsing CPUID leaves with a subleaf range.
+ * Check <asm/cpuid/types.h> __CPUID_LEAF() vs. CPUID_LEAF_N().
+ */
+
+#define CPUID_PARSE_ENTRY(_leaf, _subleaf, _reader_fn)				\
+	__CPUID_PARSE_ENTRY(_leaf, _subleaf, _subleaf, _reader_fn)
+
+#define CPUID_PARSE_ENTRY_N(_leaf, _reader_fn)					\
+	__CPUID_PARSE_ENTRY(_leaf, __cpuid_leaf_first_subleaf(_leaf), n, _reader_fn)
+
+/*
+ * CPUID parser table:
+ */
+
+#define CPUID_PARSE_ENTRIES									\
+	/*			Leaf		Subleaf		Reader function */		\
+	CPUID_PARSE_ENTRY   (	0x0,		0,		generic			),	\
+	CPUID_PARSE_ENTRY   (	0x1,		0,		generic			),	\
+
+#endif /* _ARCH_X86_CPUID_PARSER_H */
diff --git a/arch/x86/xen/enlighten.c b/arch/x86/xen/enlighten.c
index 23b91bf9b663..cf061ed45ce8 100644
--- a/arch/x86/xen/enlighten.c
+++ b/arch/x86/xen/enlighten.c
@@ -17,7 +17,7 @@
 #include <asm/xen/hypercall.h>
 #include <asm/xen/hypervisor.h>
 #include <asm/cpu.h>
-#include <asm/e820/api.h> 
+#include <asm/e820/api.h>
 #include <asm/setup.h>
 
 #include "xen-ops.h"
@@ -76,6 +76,7 @@ unsigned long xen_released_pages;
 static __ref void xen_get_vendor(void)
 {
 	init_cpu_devs();
+	cpuid_scan_cpu(&boot_cpu_data);
 	cpu_detect(&boot_cpu_data);
 	get_cpu_vendor(&boot_cpu_data);
 }
diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index eaad22b47206..033b09714d48 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -1433,6 +1433,7 @@ asmlinkage __visible void __init xen_start_kernel(struct start_info *si)
 	xen_build_dynamic_phys_to_machine();
 
 	/* Work out if we support NX */
+	cpuid_scan_cpu(&boot_cpu_data);
 	get_cpu_cap(&boot_cpu_data);
 	x86_configure_nx();
 
-- 
2.53.0

