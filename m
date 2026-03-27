Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4724F3368A3
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774577920; cv=none; b=hzhlz1S7e9oPwYaxEYYNmWUKqRTvLJd6PtGXpFPrG6s8+I79Ai7WgAmc52NXX//J+2Xjjz5HXwIZVGQ2mtwLtjHtU3BKlQDlVcHv00R4j3xznDw7ILXuYmcmNMixiGxrE/WJ8g+3VE6MsrhLJ3r+/1oRQ4smFjxvPSlwQyV3+F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774577920; c=relaxed/simple;
	bh=3xZcFlNNGXIxppv/7LGQ6GIY6Fg/4a2a1lNmj5YQ+Pc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MN48Ve1/jFYpANrVp5aNIqJfUa2Q0j4RnC8U2ukuVw2IBfhSfkf+1KCgRT0RNc9ev2tfsfJmFtl2UTkRXHQNtQbMWONyl7VEC4uZA6T/GddwOP2S+0Iql82XPBy6QPRcEA7tdB8icaDdisfpRVCbimIAxF21+9KCWBE3YzFugrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xtKlO0re; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=n5Wi17bo; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xtKlO0re";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="n5Wi17bo"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774577917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IfLCDe+ZR0T/yqyn7NUJ0n4OAIa+SwuPIoernc/hbrI=;
	b=xtKlO0reTVktHzPguJgKS9b6WvVPuX2/QMK6iruUliJRjfAdJdOuicUmlFdxc/9GnJ52hx
	5yGhQRFIPH3ldOGbrwvYcceMX6nBCrNjPY+HPY/Er4yfWbJAwsBEp3muMCFnncGdClp+V+
	f6Fe1ERVeUSAeb1zBwhMWVgLLu7Ys989jZr8uzyKe/2dbIw0WI7hIdRakJIJoaSBwrl1vW
	uwjp4uV51w5n/cc45/feToz7koIOCNvbLuvrLIcHW0YOrFTFhJEr4DWdkCEByc7P13tnPS
	cD9q1BaUSq3A+BialgEVO0kRu/udPJX1Z6UOaOf5Vkr8yTVbqj+XHYtZfoxBDg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774577917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IfLCDe+ZR0T/yqyn7NUJ0n4OAIa+SwuPIoernc/hbrI=;
	b=n5Wi17bo56KZqgq6TY0K6PKjc7a5HwXcD7eyTvLnff2eHfMsgKX5H40U1RcHibIjfAur8H
	DB14rQfDc5VE/qCg==
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
Subject: [PATCH v6 22/90] x86/cpuid: Introduce a parser debugfs interface
Date: Fri, 27 Mar 2026 03:15:36 +0100
Message-ID: <20260327021645.555257-23-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce the debugfs files "x86/cpuid/[0-ncpus]" to dump each CPU's cached
CPUID table.  For each cached leaf/subleaf, invoke the CPUID instruction on
the target CPU and compare the hardware result against its cached values.

Mark any mismatched cached CPUID output value with an asterisk.  This
should help with tricky bug reports in the future if the cached CPUID data
get unexpectedly out of sync with actual hardware state.

Note, expose cpuid_phases[] via "cpuid_parser.h" to allow the debugfs code
to traverse and dump parsed CPUID data.

Note, this debugfs interface also simplifies the development and testing of
adding new leaves to the CPUID parser.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/Makefile        |   2 +-
 arch/x86/kernel/cpu/cpuid_debugfs.c | 108 ++++++++++++++++++++++++++++
 arch/x86/kernel/cpu/cpuid_parser.c  |   9 ++-
 arch/x86/kernel/cpu/cpuid_parser.h  |  12 ++++
 4 files changed, 125 insertions(+), 6 deletions(-)
 create mode 100644 arch/x86/kernel/cpu/cpuid_debugfs.c

diff --git a/arch/x86/kernel/cpu/Makefile b/arch/x86/kernel/cpu/Makefile
index d2e8a849f180..d62e2d60a965 100644
--- a/arch/x86/kernel/cpu/Makefile
+++ b/arch/x86/kernel/cpu/Makefile
@@ -62,7 +62,7 @@ obj-$(CONFIG_HYPERVISOR_GUEST)		+= vmware.o hypervisor.o mshyperv.o
 obj-$(CONFIG_BHYVE_GUEST)		+= bhyve.o
 obj-$(CONFIG_ACRN_GUEST)		+= acrn.o
 
-obj-$(CONFIG_DEBUG_FS)			+= debugfs.o
+obj-$(CONFIG_DEBUG_FS)			+= debugfs.o cpuid_debugfs.o
 
 obj-$(CONFIG_X86_BUS_LOCK_DETECT)	+= bus_lock.o
 
diff --git a/arch/x86/kernel/cpu/cpuid_debugfs.c b/arch/x86/kernel/cpu/cpuid_debugfs.c
new file mode 100644
index 000000000000..4bd874bffffc
--- /dev/null
+++ b/arch/x86/kernel/cpu/cpuid_debugfs.c
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * CPUID parser debugfs entries: x86/cpuid/[0-ncpus]
+ *
+ * Dump each CPU's cached CPUID table and compare its values against current
+ * CPUID output on that CPU.  Mark changed entries with an asterisk.
+ */
+
+#include <linux/debugfs.h>
+#include <linux/init.h>
+#include <linux/smp.h>
+#include <linux/types.h>
+
+#include <asm/cpuid/api.h>
+#include <asm/percpu.h>
+#include <asm/processor.h>
+
+#include "cpuid_parser.h"
+
+static void cpuid_this_cpu(void *info)
+{
+	struct cpuid_regs *regs = info;
+
+	__cpuid(&regs->eax, &regs->ebx, &regs->ecx, &regs->edx);
+}
+
+static void
+cpuid_show_leaf(struct seq_file *m, uintptr_t cpu_id, const struct cpuid_parse_entry *entry,
+		const struct leaf_parse_info *info, const struct cpuid_regs *cached)
+{
+	for (int j = 0; j < info->nr_entries; j++) {
+		u32 subleaf = entry->subleaf + j;
+		struct cpuid_regs regs = {
+			.eax = entry->leaf,
+			.ecx = subleaf,
+		};
+		int ret;
+
+		seq_printf(m, "Leaf 0x%08x, subleaf %u:\n", entry->leaf, subleaf);
+
+		ret = smp_call_function_single(cpu_id, cpuid_this_cpu, &regs, true);
+		if (ret) {
+			seq_printf(m, "Failed to invoke CPUID on CPU %lu: %d\n\n", cpu_id, ret);
+			continue;
+		}
+
+		seq_printf(m, "  cached:   %cEAX=0x%08x   %cEBX=0x%08x   %cECX=0x%08x   %cEDX=0x%08x\n",
+			   cached[j].eax == regs.eax ? ' ' : '*', cached[j].eax,
+			   cached[j].ebx == regs.ebx ? ' ' : '*', cached[j].ebx,
+			   cached[j].ecx == regs.ecx ? ' ' : '*', cached[j].ecx,
+			   cached[j].edx == regs.edx ? ' ' : '*', cached[j].edx);
+		seq_printf(m, "  actual:    EAX=0x%08x    EBX=0x%08x    ECX=0x%08x    EDX=0x%08x\n",
+			   regs.eax, regs.ebx, regs.ecx, regs.edx);
+	}
+}
+
+static void __cpuid_debug_show(struct seq_file *m, uintptr_t cpu_id,
+			       const struct cpuid_parse_entry *entry, int nr_entries)
+{
+	const struct cpuinfo_x86 *c = per_cpu_ptr(&cpu_info, cpu_id);
+	const struct cpuid_table *t = &c->cpuid;
+
+	for (int i = 0; i < nr_entries; i++, entry++) {
+		const struct leaf_parse_info *qi = cpuid_table_info_p(t, entry->info_offs);
+		const struct cpuid_regs *qr = cpuid_table_regs_p(t, entry->regs_offs);
+
+		cpuid_show_leaf(m, cpu_id, entry, qi, qr);
+	}
+}
+
+static int cpuid_debug_show(struct seq_file *m, void *p)
+{
+	uintptr_t cpu_id = (uintptr_t)m->private;
+
+	for (int i = 0; i < cpuid_nphases; i++)
+		__cpuid_debug_show(m, cpu_id, cpuid_phases[i].table, cpuid_phases[i].nr_entries);
+
+	return 0;
+}
+
+static int cpuid_debug_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, cpuid_debug_show, inode->i_private);
+}
+
+static const struct file_operations cpuid_ops = {
+	.open		= cpuid_debug_open,
+	.read		= seq_read,
+	.llseek		= seq_lseek,
+	.release	= single_release,
+};
+
+static __init int cpuid_init_debugfs(void)
+{
+	struct dentry *dir;
+	uintptr_t cpu_id;
+	char cpu_name[24];
+
+	dir = debugfs_create_dir("cpuid", arch_debugfs_dir);
+
+	for_each_possible_cpu(cpu_id) {
+		scnprintf(cpu_name, sizeof(cpu_name), "%lu", cpu_id);
+		debugfs_create_file(cpu_name, 0444, dir, (void *)cpu_id, &cpuid_ops);
+	}
+
+	return 0;
+}
+late_initcall(cpuid_init_debugfs);
diff --git a/arch/x86/kernel/cpu/cpuid_parser.c b/arch/x86/kernel/cpu/cpuid_parser.c
index 97b7f296df03..ab736f03051e 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.c
+++ b/arch/x86/kernel/cpu/cpuid_parser.c
@@ -74,14 +74,13 @@ static const struct cpuid_parse_entry cpuid_common_entries[] = {
 	CPUID_COMMON_ENTRIES
 };
 
-static const struct {
-	const struct cpuid_parse_entry	*table;
-	int				nr_entries;
-} cpuid_phases[] = {
+const struct cpuid_phase cpuid_phases[] = {
 	{	cpuid_early_entries,	ARRAY_SIZE(cpuid_early_entries)		},
 	{	cpuid_common_entries,	ARRAY_SIZE(cpuid_common_entries)	},
 };
 
+const int cpuid_nphases = ARRAY_SIZE(cpuid_phases);
+
 /*
  * Leaf-independent parser code:
  */
@@ -189,7 +188,7 @@ cpuid_fill_table(struct cpuid_table *t, const struct cpuid_parse_entry entries[]
 
 static void __cpuid_scan_cpu_full(struct cpuinfo_x86 *c, bool early_boot)
 {
-	int nphases = early_boot ? 1 : ARRAY_SIZE(cpuid_phases);
+	int nphases = early_boot ? 1 : cpuid_nphases;
 	struct cpuid_table *table = &c->cpuid;
 
 	for (int i = 0; i < nphases; i++)
diff --git a/arch/x86/kernel/cpu/cpuid_parser.h b/arch/x86/kernel/cpu/cpuid_parser.h
index a3f7dcc6c03f..8b0d44b745c5 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.h
+++ b/arch/x86/kernel/cpu/cpuid_parser.h
@@ -149,6 +149,18 @@ struct cpuid_parse_entry {
 	CPUID_PARSE_ENTRY   (	0x80000003,	0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80000004,	0,		generic			),	\
 
+/*
+ * CPUID parser phases:
+ */
+
+struct cpuid_phase {
+	const struct cpuid_parse_entry	*table;
+	int				nr_entries;
+};
+
+extern const struct cpuid_phase cpuid_phases[];
+extern const int cpuid_nphases;
+
 /*
  * CPUID leaf vendor table:
  */
-- 
2.53.0

