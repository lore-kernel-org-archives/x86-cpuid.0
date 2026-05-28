Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A31F47ECF6
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983145; cv=none; b=TrBNtN/nEpUzcepeYhJ2L/N6ObdkgLpO74ajKzd7WV6j361io3sQ/1onsjvJk63DKxJQ8lbtUYrmaLrM00H6knpkslSPUEIMhSF47t9e+cLeyGvj574ffLUfyrISdHzz5Q1CttjtSUmnkpVT3YjvQcLrMiduIweJNBV9ThAyoWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983145; c=relaxed/simple;
	bh=++kGsxBKtBMWqK3YV56MhYqTJHTslZ01lEwYiJyFqto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=od+Hxwmh/MPAg1Rb1sJVrGUMe7/Ar8769UeYq1iO0pi0fvMniBMpz1VGa34AItPwe8X/QmrnOssGWM6b0vdOosiGpFpcfv6EWpHMbU5pA6peKl71MGid/nBp/G2h6q5eLxqXyiIFxmRVe96UHGtcATKphLpdIYlJiN55WBZjF9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3uh2g05K; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kiIy0jQj; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3uh2g05K";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kiIy0jQj"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983140;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OCGi1hP7Dp3SyKS4KD3q6tJT6BNNpYDbXg3XI7OwFwE=;
	b=3uh2g05KSsE9KQaJC8iOAjr4QpufOSOPKhn1RtTBN5QCqzTPgIym6OM15rFBWkn/k1qu/l
	q2wjokzG9GVSbgdrNzWBZZvhWfcNox1dpsYyC/JqVR3tRbodNVQratKTXToY4+izP7hxvW
	6HitI+Wkb1NTPO+S8DGhmCmms1RW1LBkLQo6lVL0U5PFXyiOlzAhixw3zDBwbeXaVRq4Qq
	fiL47lIE3Vspqy7XcJ9w2sDeOeiS8Pw+BnPXaC+1+Wxvk0dFQKDcsiXuAb4u3G5LqAmbnN
	gAE4Yqp8d9vr2dRnRvL9OWZBpvTKpNz3/Qj7Ljw1lvWC4VYmO86DltcXMQsSGQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983140;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OCGi1hP7Dp3SyKS4KD3q6tJT6BNNpYDbXg3XI7OwFwE=;
	b=kiIy0jQjrAX8Ylccq6FezRl6f/lAhwwVOAHSY1/AGA13aev6MtS6uC4RjfCiTcY27T4MpD
	7c/8CPop1b2MGtDg==
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
Subject: [PATCH v7 107/120] x86/cpuid: Parse leaves backing X86_FEATURE words
Date: Thu, 28 May 2026 17:39:09 +0200
Message-ID: <20260528153923.403473-108-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add CPUID parser support for:

    CPUID(0x7)
    CPUID(0x7).1
    CPUID(0xd).1
    CPUID(0x80000001)
    CPUID(0x8000000a)
    CPUID(0x8000001f)
    CPUID(0x80000021)

where one or more of these leaves output registers back the X86_FEATURE
words at <asm/cpufeatures.h>.

Handle CPUID(0x7).1 via a custom reader.  Its availability depends on the
subleaf count reported by CPUID(0x7).0, so check that first.

Do not use a custom reader for CPUID(0xd).1.  Per the Intel SDM regarding
CPUID(0xd)'s subleaf availability: "sub-leafs 0 and 1 are always valid".

Note, this prepares for later changes that will route X86_FEATURE queries
from cpuinfo_x86::x86_capability[] to the system's CPUID tables.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpuid/types.h |  7 +++++++
 arch/x86/kernel/cpu/cpuid_parser.c | 13 +++++++++++++
 arch/x86/kernel/cpu/cpuid_parser.h |  7 +++++++
 3 files changed, 27 insertions(+)

diff --git a/arch/x86/include/asm/cpuid/types.h b/arch/x86/include/asm/cpuid/types.h
index 7671f8d24014..1de66781cb5c 100644
--- a/arch/x86/include/asm/cpuid/types.h
+++ b/arch/x86/include/asm/cpuid/types.h
@@ -214,8 +214,11 @@ struct cpuid_leaves {
 	CPUID_LEAF_N (  0x4,		8  );
 	CPUID_LEAF   (	0x5,		0  );
 	CPUID_LEAF   (	0x6,		0  );
+	CPUID_LEAF   (  0x7,		0  );
+	CPUID_LEAF   (  0x7,		1  );
 	CPUID_LEAF   (	0x9,		0  );
 	CPUID_LEAF   (  0xa,		0  );
+	CPUID_LEAF   (  0xd,		1  );
 	CPUID_LEAF   (	0x12,		0  );
 	CPUID_LEAF   (	0x12,		1  );
 	CPUID_LEAF_N (	0x12,		8  );
@@ -229,6 +232,7 @@ struct cpuid_leaves {
 	CPUID_LEAF   (	0x23,		4  );
 	CPUID_LEAF   (	0x23,		5  );
 	CPUID_LEAF   (  0x80000000,	0  );
+	CPUID_LEAF   (  0x80000001,	0  );
 	CPUID_LEAF   (  0x80000002,	0  );
 	CPUID_LEAF   (  0x80000003,	0  );
 	CPUID_LEAF   (  0x80000004,	0  );
@@ -236,7 +240,10 @@ struct cpuid_leaves {
 	CPUID_LEAF   (  0x80000006,	0  );
 	CPUID_LEAF   (  0x80000007,	0  );
 	CPUID_LEAF   (  0x80000008,	0  );
+	CPUID_LEAF   (  0x8000000a,	0  );
 	CPUID_LEAF_N (  0x8000001d,	8  );
+	CPUID_LEAF   (  0x8000001f,	0  );
+	CPUID_LEAF   (  0x80000021,	0  );
 	CPUID_LEAF   (  0x80000022,	0  );
 	CPUID_LEAF   (  0x80860000,	0  );
 	CPUID_LEAF   (  0x80860001,	0  );
diff --git a/arch/x86/kernel/cpu/cpuid_parser.c b/arch/x86/kernel/cpu/cpuid_parser.c
index 452b5b317e4d..1655e35b6310 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.c
+++ b/arch/x86/kernel/cpu/cpuid_parser.c
@@ -130,6 +130,19 @@ define_cpuid_0x23_subleaf_read_function(3);
 define_cpuid_0x23_subleaf_read_function(4);
 define_cpuid_0x23_subleaf_read_function(5);
 
+static void
+cpuid_read_0x7_1(const struct cpuid_parse_entry *e, const struct cpuid_read_output *output)
+{
+	struct leaf_0x7_0 l7;
+
+	cpuid_read_subleaf(0x7, 0, &l7);
+	if (l7.leaf7_n_subleaves == 0)
+		return;
+
+	cpuid_read_subleaf(e->leaf, e->subleaf, output->regs);
+	output->info->nr_entries = 1;
+}
+
 /*
  * Shared read function for Intel CPUID(0x4) and AMD CPUID(0x8000001d), as both have
  * the same subleaf enumeration logic and register output format.
diff --git a/arch/x86/kernel/cpu/cpuid_parser.h b/arch/x86/kernel/cpu/cpuid_parser.h
index 799714300bfb..123433a4b210 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.h
+++ b/arch/x86/kernel/cpu/cpuid_parser.h
@@ -149,7 +149,10 @@ struct cpuid_parse_entry {
 	CPUID_PARSE_ENTRY   (	0x5,		0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x6,		0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x9,		0,		0x9			),	\
+	CPUID_PARSE_ENTRY   (	0x7,		0,		generic			),	\
+	CPUID_PARSE_ENTRY   (	0x7,		1,		0x7_1			),	\
 	CPUID_PARSE_ENTRY   (	0xa,		0,		generic			),	\
+	CPUID_PARSE_ENTRY   (	0xd,		1,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x12,		0,		0x12			),	\
 	CPUID_PARSE_ENTRY   (	0x12,		1,		0x12			),	\
 	CPUID_PARSE_ENTRY_N (	0x12,				sgx_epc_sections	),	\
@@ -163,6 +166,7 @@ struct cpuid_parse_entry {
 	CPUID_PARSE_ENTRY   (	0x23,		4,		0x23_4			),	\
 	CPUID_PARSE_ENTRY   (	0x23,		5,		0x23_5			),	\
 	CPUID_PARSE_ENTRY   (	0x80000000,	0,		0x80000000		),	\
+	CPUID_PARSE_ENTRY   (	0x80000001,	0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80000002,	0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80000003,	0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80000004,	0,		generic			),	\
@@ -170,7 +174,10 @@ struct cpuid_parse_entry {
 	CPUID_PARSE_ENTRY   (	0x80000006,	0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80000007,	0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80000008,	0,		generic			),	\
+	CPUID_PARSE_ENTRY   (	0x8000000a,	0,		generic			),	\
 	CPUID_PARSE_ENTRY_N (	0x8000001d,			deterministic_cache	),	\
+	CPUID_PARSE_ENTRY   (	0x8000001f,	0,		generic			),	\
+	CPUID_PARSE_ENTRY   (	0x80000021,	0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80000022,	0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80860000,	0,		0x80860000		),	\
 	CPUID_PARSE_ENTRY   (	0x80860001,	0,		generic			),	\
-- 
2.54.0

