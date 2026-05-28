Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5394028DF
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983150; cv=none; b=BM4it7Hp9SsZCuCmD/JXO45C+pn5nAkcXFe4UTBQcDcRLOaAUiK3ObQCtCgPU19c2SzinitQPVzmtFybk+P4zTJbm3ma6jWdA9CCNpC7VKYz2BTTdJO8/eRS6K52UNfD2yygEx/qtnw4ACr16Cqu5A8HSVOejI8JYoOXdBcrQmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983150; c=relaxed/simple;
	bh=4e/ycHyhl59Yen795SWx+clPiEad3zpokLdJKcnH7WI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rd79ZQa0tScMLvodNFXCaoOTv/yhi1y+fhzcgwb/YvoObt18oNX4z0c3aKrKkLkPGrbfRMIgRNYv4q4PbbKAq2ohV6uLWt8fPSa7SlN14Q4Ui4SYpQr55gAHrPwjea46Xff89XAhcgYwY6575OjNlX/CHqzaNCTe/wI8nMcpxBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3LS9k7n6; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=FBiPnDux; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3LS9k7n6";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="FBiPnDux"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fxc3eKqY1kuYFpAu6wDUMdUMxCxj1SRDS61RwcuM8Ms=;
	b=3LS9k7n6KnAE4GpVPop7kxvvfasm0+pOjELpFLyFcggqTtBH454vxhgZeFRNeaNZTR7xDm
	rSllb9gbyL68LbQImPy143pkzw/WTMBpJtziMPeh/eEGXgxX6030isQJ1I6KViqkFDD3ve
	dGPtUbjCW3mtflcgg+9RCGuubdlH9ssl2NFBuzzkNgEHXokr/xlvIvF/CpIYiaPwAy1KT0
	C6OP8v9M7jEzCnbN2KEk+L9TsLk7swEaYKyIoC4LdcwDVdSC6RPmv4IaEPpj/r9lv9G4S3
	pBmAloYGgLArbmrcCPxd138LcMAKeXTumHqae62oJbMsiwMNYuz3eGu/Sb9grw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fxc3eKqY1kuYFpAu6wDUMdUMxCxj1SRDS61RwcuM8Ms=;
	b=FBiPnDuxyQPriJHXpw/WQ2OWgR+hB1qtZJ4HCQWN121kTRfGtnNPv39i/F/+eO8pm4+krb
	0ITLwUjEugcPUYAA==
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
Subject: [PATCH v7 108/120] x86/cpuid: Parse Linux synthetic CPUID leaves
Date: Thu, 28 May 2026 17:39:10 +0200
Message-ID: <20260528153923.403473-109-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
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
index 1de66781cb5c..27bcf4eea8dc 100644
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
@@ -231,6 +233,9 @@ struct cpuid_leaves {
 	CPUID_LEAF   (	0x23,		3  );
 	CPUID_LEAF   (	0x23,		4  );
 	CPUID_LEAF   (	0x23,		5  );
+	CPUID_LEAF   (	0x4c780001,	0  );
+	CPUID_LEAF   (	0x4c780001,	1  );
+	CPUID_LEAF   (	0x4c780002,	0  );
 	CPUID_LEAF   (  0x80000000,	0  );
 	CPUID_LEAF   (  0x80000001,	0  );
 	CPUID_LEAF   (  0x80000002,	0  );
diff --git a/arch/x86/kernel/cpu/cpuid_debugfs.c b/arch/x86/kernel/cpu/cpuid_debugfs.c
index 0cafe0afefdd..65d68728157d 100644
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
index 1655e35b6310..848b9f772232 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.c
+++ b/arch/x86/kernel/cpu/cpuid_parser.c
@@ -175,6 +175,21 @@ cpuid_read_0x12(const struct cpuid_parse_entry *e, const struct cpuid_read_outpu
 
 define_cpuid_read_function(sgx_epc_sections, leaf_0x12_n, l, l->subleaf_type == 0);
 
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
@@ -262,6 +277,7 @@ static unsigned int cpuid_range_max_leaf(const struct cpuid_table *t, unsigned i
 	case CPUID_EXT_START:	return el0 ? el0->max_ext_leaf  : 0;
 	case CPUID_TMX_START:	return tl0 ? tl0->max_tra_leaf  : 0;
 	case CPUID_CTR_START:	return cl0 ? cl0->max_cntr_leaf : 0;
+	case CPUID_LNX_START:	return CPUID_LNX_END;
 	default:		return 0;
 	}
 }
@@ -325,6 +341,7 @@ cpuid_fill_table(struct cpuid_table *t, const struct cpuid_parse_entry entries[]
 		{ CPUID_EXT_START,  CPUID_EXT_END  },
 		{ CPUID_TMX_START,  CPUID_TMX_END  },
 		{ CPUID_CTR_START,  CPUID_CTR_END  },
+		{ CPUID_LNX_START,  CPUID_LNX_END  },
 	};
 
 	for (unsigned int i = 0; i < ARRAY_SIZE(ranges); i++)
diff --git a/arch/x86/kernel/cpu/cpuid_parser.h b/arch/x86/kernel/cpu/cpuid_parser.h
index 123433a4b210..22903701b8fe 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.h
+++ b/arch/x86/kernel/cpu/cpuid_parser.h
@@ -165,6 +165,9 @@ struct cpuid_parse_entry {
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
2.54.0

