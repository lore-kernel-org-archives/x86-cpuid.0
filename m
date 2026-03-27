Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36C438B7BD
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774578128; cv=none; b=FpLW9s/Zx3pNiKuWr0f746p5fKkOMzbXUIURDQE96dcNaM7dpAxcKCkpzjsdCK01O7oEQVVn/kD0qO0VuTN4zWUWtG3/r2CzgKu1NuSMUqFu/Gxphgxj6u8xLTEkySDXzviemu0bQL3tMXYJ3Cghf8lotuV7FpCvGzcH1Le9ReY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774578128; c=relaxed/simple;
	bh=JYvv8/9X9FrDcwpPrlZA/T4Iw34dmf7om+EeiNYm52c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sj6lwICFNozJo323iovAgCRnXpPlyIvoXNveM4bFiH8pjahzV6gyAHeIyzx6EQin3g9xx1ckgQbdyIS1DF8Gz+5/BQAglxFrM1Rwrlp3K3ewDXIABjYfrmQbPH/mdCfZfyxtWZyUmYQci5Dlqi/6z8p1zEEn9G1ORn6Oatf5nDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=k0KcPtOK; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=EltMKYWr; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="k0KcPtOK";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EltMKYWr"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774578125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B+fk+/TuRwEZZ2ihuSM8rA4eRhVclgy/Iky91vo+GTg=;
	b=k0KcPtOK/hZ9AUFYJO6RMTz0dqOw7JuAHAlc01Ecg0Xr2PsPKE3ZfZvld0rYGD5JvPCXhd
	2fxhwcynjsKAhmxGk6wUhuTkJJ7Wm3ZcDubQG1SVd97ghgb2Q9YExWPynOPzYV+h+5lgrA
	aegDSHzKvUkxdseotjhT7JHRFO/R5Jw20BzbGEeyO3HOOn9K6C+s8BvfYExk8aQ9vLNtt2
	JYUgUePW8yKKiXW8WhjT1yuV2qPT13h0iuKX0bgQZSYPYl/zJIdQjWbwdhtjJ+mdg3JvPd
	X7CCsKf1O3bNN0kVcehKCPxDaCfOyWtSU6TuPIAEtUvjlXPvJW59UdhfIO2vlA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774578125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B+fk+/TuRwEZZ2ihuSM8rA4eRhVclgy/Iky91vo+GTg=;
	b=EltMKYWrYA1HU5AKK/ryztolpl8+mo/X9y3sky5rofrSmbnY9dWAwVLfdpq5+u0UVQWWt/
	Q5ZGmCygj4ocHJCQ==
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
Subject: [PATCH v6 78/90] x86/cpuid: Parse Linux synthetic CPUID leaves
Date: Fri, 27 Mar 2026 03:16:32 +0100
Message-ID: <20260327021645.555257-79-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The X86_FEATURE words at <asm/cpufeatures.h> contain both hardware-defined
CPUID register bits and Linux-defined synthetic bits.

The hardware-defined bits already map naturally into the parsed CPUID
tables, but the synthetic bits do not.  This gets feature enumeration split
between the CPUID parser and the <asm/cpufeature.h> feature APIs.

For this, the x86-cpuid-db project provides a 1:1 bitfield mapping for the
synthetic X86_FEATURE words using the CPUID range 0x4c780000.  The range
prefix 0x4c78 is for Linux in its shorthand ASCII form Lx, where Linux
becomes a virtual vendor mirroring hardware vendors like AMD and Intel.

Cover all the synthetic feature and bug words by parsing CPUID(0x4c780001),
CPUID(0x4c780001).1, and CPUID(0x4c780002).

Skip these synthetic CPUID leaves in the debugfs code which compares each
cached CPUID value against its actual hardware backing.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
Link: https://lore.kernel.org/lkml/874ixernra.ffs@tglx
Link: https://gitlab.com/x86-cpuid.org/x86-cpuid-db/-/blob/v3.0/CHANGELOG.rst
---
 arch/x86/include/asm/cpuid/types.h  |  5 +++++
 arch/x86/kernel/cpu/cpuid_debugfs.c |  4 ++++
 arch/x86/kernel/cpu/cpuid_parser.c  | 17 +++++++++++++++++
 arch/x86/kernel/cpu/cpuid_parser.h  |  3 +++
 4 files changed, 29 insertions(+)

diff --git a/arch/x86/include/asm/cpuid/types.h b/arch/x86/include/asm/cpuid/types.h
index 204d6277c8cd..263e82e89f70 100644
--- a/arch/x86/include/asm/cpuid/types.h
+++ b/arch/x86/include/asm/cpuid/types.h
@@ -39,11 +39,13 @@ enum cpuid_regs_idx {
 #define CPUID_EXT_START		0x80000000
 #define CPUID_TMX_START		0x80860000
 #define CPUID_CTR_START		0xc0000000
+#define CPUID_LNX_START		0x4c780000
 
 #define CPUID_BASE_END		CPUID_RANGE_MAX(CPUID_BASE_START)
 #define CPUID_EXT_END		CPUID_RANGE_MAX(CPUID_EXT_START)
 #define CPUID_TMX_END		CPUID_RANGE_MAX(CPUID_TMX_START)
 #define CPUID_CTR_END		CPUID_RANGE_MAX(CPUID_CTR_START)
+#define CPUID_LNX_END		CPUID_RANGE_MAX(CPUID_LNX_START)
 
 /*
  * Types for CPUID(0x2) parsing:
@@ -225,6 +227,9 @@ struct cpuid_leaves {
 	CPUID_LEAF   (  0x23,		3  );
 	CPUID_LEAF   (  0x23,		4  );
 	CPUID_LEAF   (  0x23,		5  );
+	CPUID_LEAF   (	0x4c780001,	0  );
+	CPUID_LEAF   (	0x4c780001,	1  );
+	CPUID_LEAF   (	0x4c780002,	0  );
 	CPUID_LEAF   (  0x80000000,	0  );
 	CPUID_LEAF   (  0x80000001,	0  );
 	CPUID_LEAF   (  0x80000002,	0  );
diff --git a/arch/x86/kernel/cpu/cpuid_debugfs.c b/arch/x86/kernel/cpu/cpuid_debugfs.c
index 4bd874bffffc..c1ae9d7449cc 100644
--- a/arch/x86/kernel/cpu/cpuid_debugfs.c
+++ b/arch/x86/kernel/cpu/cpuid_debugfs.c
@@ -36,6 +36,10 @@ cpuid_show_leaf(struct seq_file *m, uintptr_t cpu_id, const struct cpuid_parse_e
 		};
 		int ret;
 
+		/* Ignore synthetic ranges as they have no hardware backing */
+		if (CPUID_RANGE(entry->leaf) == CPUID_LNX_START)
+			continue;
+
 		seq_printf(m, "Leaf 0x%08x, subleaf %u:\n", entry->leaf, subleaf);
 
 		ret = smp_call_function_single(cpu_id, cpuid_this_cpu, &regs, true);
diff --git a/arch/x86/kernel/cpu/cpuid_parser.c b/arch/x86/kernel/cpu/cpuid_parser.c
index b3bf4141db15..9e22081f649d 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.c
+++ b/arch/x86/kernel/cpu/cpuid_parser.c
@@ -155,6 +155,21 @@ define_cpuid_0x23_subleaf_read_function(3);
 define_cpuid_0x23_subleaf_read_function(4);
 define_cpuid_0x23_subleaf_read_function(5);
 
+/*
+ * Synthetic CPUID leaves read function
+ *
+ * These leaves do not exist in hardware.  They reserve slots in the per-CPU
+ * CPUID tables for the synthetic Linux-defined X86_FEATURE and X86_BUG words.
+ *
+ * Always mark the read as successful; the actual bits will be populated via
+ * the X86_FEATURE bit update helpers at <asm/cpufeature.h>.
+ */
+static void
+cpuid_read_synthetic(const struct cpuid_parse_entry *e, const struct cpuid_read_output *output)
+{
+	output->info->nr_entries = 1;
+}
+
 /*
  * Define an extended range CPUID read function
  *
@@ -242,6 +257,7 @@ static unsigned int cpuid_range_max_leaf(const struct cpuid_table *t, unsigned i
 	case CPUID_EXT_START:	return el0 ? el0->max_ext_leaf  : 0;
 	case CPUID_TMX_START:	return tl0 ? tl0->max_tra_leaf  : 0;
 	case CPUID_CTR_START:	return cl0 ? cl0->max_cntr_leaf : 0;
+	case CPUID_LNX_START:	return CPUID_LNX_END;
 	default:		return 0;
 	}
 }
@@ -305,6 +321,7 @@ cpuid_fill_table(struct cpuid_table *t, const struct cpuid_parse_entry entries[]
 		{ CPUID_EXT_START,  CPUID_EXT_END  },
 		{ CPUID_TMX_START,  CPUID_TMX_END  },
 		{ CPUID_CTR_START,  CPUID_CTR_END  },
+		{ CPUID_LNX_START,  CPUID_LNX_END  },
 	};
 
 	for (unsigned int i = 0; i < ARRAY_SIZE(ranges); i++)
diff --git a/arch/x86/kernel/cpu/cpuid_parser.h b/arch/x86/kernel/cpu/cpuid_parser.h
index f6a620a03312..e7c07346452e 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.h
+++ b/arch/x86/kernel/cpu/cpuid_parser.h
@@ -159,6 +159,9 @@ struct cpuid_parse_entry {
 	CPUID_PARSE_ENTRY   (	0x23,		3,		0x23_3			),	\
 	CPUID_PARSE_ENTRY   (	0x23,		4,		0x23_4			),	\
 	CPUID_PARSE_ENTRY   (	0x23,		5,		0x23_5			),	\
+	CPUID_PARSE_ENTRY   (	0x4c780001,	0,		synthetic		),	\
+	CPUID_PARSE_ENTRY   (	0x4c780001,	1,		synthetic		),	\
+	CPUID_PARSE_ENTRY   (	0x4c780002,	0,		synthetic		),	\
 	CPUID_PARSE_ENTRY   (	0x80000000,	0,		0x80000000		),	\
 	CPUID_PARSE_ENTRY   (	0x80000001,	0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80000002,	0,		generic			),	\
-- 
2.53.0

