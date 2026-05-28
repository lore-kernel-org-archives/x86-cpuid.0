Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B866403146
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983137; cv=none; b=XXr8UVx6s1si3AZQJfeKCUO8n/EVIYYb2oYmMGTItxq3HWS2lEx3nmLkEoO7D15jTWfzCnkFkIvJmBHBUCKysvjXh22X5KKUG9KIQLdOPGp6rU3lL1dMhWf+uHmAPdC2/DSRALInuLD/PYczIJykvuGGUYQNDVQ/TVVBjCXYYS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983137; c=relaxed/simple;
	bh=/QDeZBNG1vI/bEqqo25VNTa0+Z0FhCZyA7SYTEW+LmU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lV0LIxd/uVJHmrTpYw/2erY7WJhZH3Ns0c/y8/eFI4rmkVzKB7er8SFlSWbeY8GzabvFlhtFmAh501j6gzcZn5c55U+kACP/X2TATY+q+FaM++WOo6HtR385zYc9yo0zzhv0xUSiv5cgUvQ45nrFg/ElWTjY5sGQt/59FZEc0l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=XJj8WYzo; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=QOnoumIA; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="XJj8WYzo";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QOnoumIA"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CJexGsf+qYIlnM1vpHMPn4lQHsp+Bjthkuhk9PQKOWo=;
	b=XJj8WYzovJrT9emT+tgJhBTGOhNHesrhGFa0rk3gwFUobx7s0qgAqWgUXiCzkAvD+n+eC4
	LO1CgPmOboecRbNWD6ejg3rTvr47z4HL7MV2vZxmqwOvsOpfwCEXWUfFzaD5M1je6z16SM
	ZzNK3cICdPJ4ONyERzR6mI1LeTJNjCe3bD9+V5k5LoNrh1/24vJeNgeFdvGbNY0ztal6AW
	VpV0SetBA3fTC/w/qMGDFxENaHwxteahVZRH4XBW+U0MoA++7GGtiHx5egawQ0QUfPhhwz
	9uPgCQ/ZT7+WiWoeEG8ScNkbdFZ87PHe4NH2hNAjOGqOmlg0WdwSzCbl3IykDA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CJexGsf+qYIlnM1vpHMPn4lQHsp+Bjthkuhk9PQKOWo=;
	b=QOnoumIAI20W22oKuPd4hoe5fGOQllmjm6g0j9lLBvr0xeu/AmHlSkPQFbc8N7KeNf1MOR
	LHDXcGtSftfnpJDw==
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
Subject: [PATCH v7 104/120] x86/cpu: cpuinfo: Use parsed CPUID(0x80000007)
Date: Thu, 28 May 2026 17:39:06 +0200
Message-ID: <20260528153923.403473-105-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For /proc/cpuinfo "power management" line, use parsed CPUID(0x80000007)
instead of poking at cpuinfo_x86::x86_power.  The latter is backed by a
direct CPUID query and will be later removed.

Remove the x86_power_flags[] strings table as it has no more users.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpufeature.h |  1 -
 arch/x86/kernel/cpu/Makefile      |  2 +-
 arch/x86/kernel/cpu/powerflags.c  | 24 ------------
 arch/x86/kernel/cpu/proc.c        | 61 ++++++++++++++++++++++++-------
 4 files changed, 49 insertions(+), 39 deletions(-)
 delete mode 100644 arch/x86/kernel/cpu/powerflags.c

diff --git a/arch/x86/include/asm/cpufeature.h b/arch/x86/include/asm/cpufeature.h
index 3ddc1d33399b..520949560138 100644
--- a/arch/x86/include/asm/cpufeature.h
+++ b/arch/x86/include/asm/cpufeature.h
@@ -39,7 +39,6 @@ enum cpuid_leafs
 };
 
 extern const char * const x86_cap_flags[NCAPINTS*32];
-extern const char * const x86_power_flags[32];
 
 /*
  * In order to save room, we index into this array by doing
diff --git a/arch/x86/kernel/cpu/Makefile b/arch/x86/kernel/cpu/Makefile
index d62e2d60a965..5c091d9fc9ee 100644
--- a/arch/x86/kernel/cpu/Makefile
+++ b/arch/x86/kernel/cpu/Makefile
@@ -27,7 +27,7 @@ obj-y			+= bugs.o
 obj-y			+= aperfmperf.o
 obj-y			+= cpuid-deps.o cpuid_0x2_table.o
 obj-y			+= umwait.o
-obj-y 			+= capflags.o powerflags.o
+obj-y 			+= capflags.o
 
 obj-$(CONFIG_X86_LOCAL_APIC)		+= topology.o
 
diff --git a/arch/x86/kernel/cpu/powerflags.c b/arch/x86/kernel/cpu/powerflags.c
deleted file mode 100644
index fd6ec2aa0303..000000000000
--- a/arch/x86/kernel/cpu/powerflags.c
+++ /dev/null
@@ -1,24 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Strings for the various x86 power flags
- *
- * This file must not contain any executable code.
- */
-
-#include <asm/cpufeature.h>
-
-const char *const x86_power_flags[32] = {
-	"ts",	/* temperature sensor */
-	"fid",  /* frequency id control */
-	"vid",  /* voltage id control */
-	"ttp",  /* thermal trip */
-	"tm",	/* hardware thermal control */
-	"stc",	/* software thermal control */
-	"100mhzsteps", /* 100 MHz multiplier control */
-	"hwpstate", /* hardware P-state control */
-	"",	/* tsc invariant mapped to constant_tsc */
-	"cpb",  /* core performance boost */
-	"eff_freq_ro", /* Readonly aperf/mperf */
-	"proc_feedback", /* processor feedback interface */
-	"acc_power", /* accumulated power mechanism */
-};
diff --git a/arch/x86/kernel/cpu/proc.c b/arch/x86/kernel/cpu/proc.c
index 6571d432cbe3..89471bcfcc32 100644
--- a/arch/x86/kernel/cpu/proc.c
+++ b/arch/x86/kernel/cpu/proc.c
@@ -4,9 +4,11 @@
 #include <linux/string.h>
 #include <linux/seq_file.h>
 #include <linux/cpufreq.h>
-#include <asm/prctl.h>
 #include <linux/proc_fs.h>
 
+#include <asm/cpuid/api.h>
+#include <asm/prctl.h>
+
 #include "cpu.h"
 
 #ifdef CONFIG_X86_VMX_FEATURE_NAMES
@@ -60,6 +62,50 @@ static void show_cpuinfo_misc(struct seq_file *m, struct cpuinfo_x86 *c)
 }
 #endif
 
+static void show_cpuinfo_power(struct cpuinfo_x86 *c, struct seq_file *m)
+{
+	const struct cpuid_regs *el7_regs = cpuid_leaf_raw(c, 0x80000007);
+	const struct leaf_0x80000007_0 *el7 = cpuid_leaf(c, 0x80000007);
+
+	seq_puts(m, "power management:");
+
+	if (!el7_regs || !el7)
+		return;
+
+	if (el7->digital_temp)
+		seq_puts(m, " ts");
+	if (el7->powernow_freq_id)
+		seq_puts(m, " fid");
+	if (el7->powernow_volt_id)
+		seq_puts(m, " vid");
+	if (el7->thermal_trip)
+		seq_puts(m, " ttp");
+	if (el7->hw_thermal_control)
+		seq_puts(m, " tm");
+	if (el7->sw_thermal_control)
+		seq_puts(m, " stc");
+	if (el7->_100mhz_steps)
+		seq_puts(m, " 100mhzsteps");
+	if (el7->hw_pstate)
+		seq_puts(m, " hwpstate");
+
+	/* Keep constant_tsc off the power management line */
+
+	if (el7->core_perf_boost)
+		seq_puts(m, " cpb");
+	if (el7->eff_freq_ro)
+		seq_puts(m, " eff_freq_ro");
+	if (el7->proc_feedback)
+		seq_puts(m, " proc_feedback");
+	if (el7->proc_power_reporting)
+		seq_puts(m, " acc_power");
+
+	/* Afterwards, just output the offsets of set bits */
+	for (int i = 13; i < 32; i++)
+		if (el7_regs->edx & BIT(i))
+			seq_printf(m, " [%d]", i);
+}
+
 static int show_cpuinfo(struct seq_file *m, void *v)
 {
 	struct cpuinfo_x86 *c = v;
@@ -138,18 +184,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 	seq_printf(m, "address sizes\t: %u bits physical, %u bits virtual\n",
 		   c->x86_phys_bits, c->x86_virt_bits);
 
-	seq_puts(m, "power management:");
-	for (i = 0; i < 32; i++) {
-		if (c->x86_power & (1 << i)) {
-			if (i < ARRAY_SIZE(x86_power_flags) &&
-			    x86_power_flags[i])
-				seq_printf(m, "%s%s",
-					   x86_power_flags[i][0] ? " " : "",
-					   x86_power_flags[i]);
-			else
-				seq_printf(m, " [%d]", i);
-		}
-	}
+	show_cpuinfo_power(c, m);
 
 	seq_puts(m, "\n\n");
 
-- 
2.54.0

