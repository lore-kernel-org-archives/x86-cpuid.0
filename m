Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BD33783D3
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774578074; cv=none; b=PUMtLm0N4Oif4Q5Q1IPZuyW2RcKQ1njLUrO0z+twCxYQWeH0IunOBD2VgS4hbdJcITQ2Qzb1KuS6e3tSi+fKWpnedqfuC09nVg0dW+dWoI/6W5KO2fd3G/RNclDoEnMiH+12ob/31mA2ICw4OL9Zh/5vpdp3vaAEnyk3prIsOGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774578074; c=relaxed/simple;
	bh=tW/ye2TBeMZi7c6e3HS6fnB8SzvWqScXJI8Vhy63PcA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iBOheUh9m9wjzElnD7MBy+S7qp2geon7WeIgMhbwRRWCQULNx+btPrdfoGe6gCZJftdPjxFc5eQMJaBnqMP0Pdisnf+v1byPK5URnuVKYXhpB18UK5KLloxMI4IY6LbmaIjinz0kzqcYVzBe7vATNcC8d59XDLXMbLDWYhU7SJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fV+nRaBH; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DUxyMIrB; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fV+nRaBH";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DUxyMIrB"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774578071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X3dI8J71LJ843q3U4uIyu1o3PcnILttF5OS2RDvZ59c=;
	b=fV+nRaBH1cOoM3h3VoMD2IMIs3IMYiOJfZ3njlNWAFMAKldYDZgN0Wsa6X09zN18yGu7Ex
	aZXnTj9qpTh78jmgzZb6PBf2+6zj+ecsIsRwMZ4XzBgBOaWkLKH/rKOOQpJU7RMcF/dr2V
	PphaM0ZjFjaBF5syyWjtPDyL6aF/vXhu7osnL0ZLtRZrB9fnr13HBxeDgy9vxZyEwKbwu+
	rfG2fEQT/EyGkYb1mLXLqtmgRWzWYhQg7hi/SztDOauT/wUfqdJ5s7sEBmtK75cpPAp5Y4
	qpgUEhqLYfU30fQ5E1YDbliLe+Uaf0mFszKjM2k4L08wwLegKJcaM8Kd04hDjg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774578071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X3dI8J71LJ843q3U4uIyu1o3PcnILttF5OS2RDvZ59c=;
	b=DUxyMIrBTAUYKpyWiVDI1hC3AyGqV+B9NJxEsWaTIb65yfElxslaR/aHYnjE/v1mfsYCBp
	kIsx63f/LU1Y9zDA==
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
Subject: [PATCH v6 63/90] x86/cpuid: Parse CPUID(0x23)
Date: Fri, 27 Mar 2026 03:16:17 +0100
Message-ID: <20260327021645.555257-64-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Parse Intel PMU CPUID(0x23), and all its known subleaves.

This allows converting their call sites to the CPUID API next.

Note, for all subleaves, make sure that subleaf 0 declares their support
beforehand.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpuid/types.h |  6 +++++
 arch/x86/kernel/cpu/cpuid_parser.c | 37 ++++++++++++++++++++++++++++++
 arch/x86/kernel/cpu/cpuid_parser.h |  7 ++++++
 3 files changed, 50 insertions(+)

diff --git a/arch/x86/include/asm/cpuid/types.h b/arch/x86/include/asm/cpuid/types.h
index 128898d4434b..70ccd52a6848 100644
--- a/arch/x86/include/asm/cpuid/types.h
+++ b/arch/x86/include/asm/cpuid/types.h
@@ -215,6 +215,12 @@ struct cpuid_leaves {
 	CPUID_LEAF   (  0xa,		0  );
 	CPUID_LEAF   (  0x1c,		0  );
 	CPUID_LEAF   (	0x16,		0  );
+	CPUID_LEAF   (  0x23,		0  );
+	CPUID_LEAF   (  0x23,		1  );
+	CPUID_LEAF   (  0x23,		2  );
+	CPUID_LEAF   (  0x23,		3  );
+	CPUID_LEAF   (  0x23,		4  );
+	CPUID_LEAF   (  0x23,		5  );
 	CPUID_LEAF   (  0x80000000,	0  );
 	CPUID_LEAF   (  0x80000002,	0  );
 	CPUID_LEAF   (  0x80000003,	0  );
diff --git a/arch/x86/kernel/cpu/cpuid_parser.c b/arch/x86/kernel/cpu/cpuid_parser.c
index 99507e99d8d9..de11fb4116f2 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.c
+++ b/arch/x86/kernel/cpu/cpuid_parser.c
@@ -105,6 +105,43 @@ cpuid_read_0x2(const struct cpuid_parse_entry *e, const struct cpuid_read_output
  */
 define_cpuid_read_function(deterministic_cache, leaf_0x4_n, l, l->cache_type == 0);
 
+static bool cpuid_0x23_has_subleaf(u32 subleaf)
+{
+	struct leaf_0x23_0 l;
+
+	cpuid_read_subleaf(0x23, 0, &l);
+
+	if (subleaf == 1)
+		return l.counters_subleaf;
+	if (subleaf == 2)
+		return l.acr_subleaf;
+	if (subleaf == 3)
+		return l.events_subleaf;
+	if (subleaf == 4)
+		return l.pebs_caps_subleaf;
+	if (subleaf == 5)
+		return l.pebs_subleaf;
+
+	return false;
+}
+
+#define define_cpuid_0x23_subleaf_read_function(subl)						\
+static void											\
+cpuid_read_0x23_##subl(const struct cpuid_parse_entry *e, const struct cpuid_read_output *output) \
+{												\
+	if (!cpuid_0x23_has_subleaf(subl))							\
+		return;										\
+												\
+	cpuid_read_subleaf(e->leaf, e->subleaf, output->regs);					\
+	output->info->nr_entries = 1;								\
+}
+
+define_cpuid_0x23_subleaf_read_function(1);
+define_cpuid_0x23_subleaf_read_function(2);
+define_cpuid_0x23_subleaf_read_function(3);
+define_cpuid_0x23_subleaf_read_function(4);
+define_cpuid_0x23_subleaf_read_function(5);
+
 /*
  * Define an extended range CPUID read function
  *
diff --git a/arch/x86/kernel/cpu/cpuid_parser.h b/arch/x86/kernel/cpu/cpuid_parser.h
index 8e147e7223e0..46f06792afb1 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.h
+++ b/arch/x86/kernel/cpu/cpuid_parser.h
@@ -149,6 +149,12 @@ struct cpuid_parse_entry {
 	CPUID_PARSE_ENTRY   (	0xa,		0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x1c,		0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x16,		0,		generic			),	\
+	CPUID_PARSE_ENTRY   (	0x23,		0,		generic			),	\
+	CPUID_PARSE_ENTRY   (	0x23,		1,		0x23_1			),	\
+	CPUID_PARSE_ENTRY   (	0x23,		2,		0x23_2			),	\
+	CPUID_PARSE_ENTRY   (	0x23,		3,		0x23_3			),	\
+	CPUID_PARSE_ENTRY   (	0x23,		4,		0x23_4			),	\
+	CPUID_PARSE_ENTRY   (	0x23,		5,		0x23_5			),	\
 	CPUID_PARSE_ENTRY   (	0x80000000,	0,		0x80000000		),	\
 	CPUID_PARSE_ENTRY   (	0x80000002,	0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80000003,	0,		generic			),	\
@@ -203,6 +209,7 @@ struct cpuid_vendor_entry {
 	CPUID_VENDOR_ENTRY(0xa,		X86_VENDOR_INTEL, X86_VENDOR_CENTAUR, X86_VENDOR_ZHAOXIN),\
 	CPUID_VENDOR_ENTRY(0x16,	X86_VENDOR_INTEL),				\
 	CPUID_VENDOR_ENTRY(0x1c,	X86_VENDOR_INTEL),				\
+	CPUID_VENDOR_ENTRY(0x23,	X86_VENDOR_INTEL),				\
 	CPUID_VENDOR_ENTRY(0x8000001d,	X86_VENDOR_AMD, X86_VENDOR_HYGON),		\
 	CPUID_VENDOR_ENTRY(0x80860000,	X86_VENDOR_TRANSMETA),				\
 	CPUID_VENDOR_ENTRY(0x80860001,	X86_VENDOR_TRANSMETA),				\
-- 
2.53.0

