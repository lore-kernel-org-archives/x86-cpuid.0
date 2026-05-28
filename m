Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63D447F2EB
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983156; cv=none; b=pfkYgnh0iQwOqT2n1/m+x/5eht5YL5xcawbKbtoBfg2RD9a0fuIGdnOyqyVVIBXH/gv3W2SC97R7SHD8TywIGxtLd5bpzqQbB91aZER0MStRZg4s/MyxPZ4Gw5bdVe3sNruOkw9ynC1EZWXEywuVHOr49XcTHGZ421KqpFPHy7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983156; c=relaxed/simple;
	bh=n4YCaxov80zZp1g8PIvOdTArsJf7jqweWh34brIBbJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BgfLDWyoYRmMU8z+J/0dMQYoinbC3/5C0l4nR6G/42KcsE6/ubg8poKG71IVTb1dUe8dwcqrNcgjjG8OTnscnzE8IZ7mX5nkEzzk3vjG5pqMyY5KqNncNrGPQQ1frHBMVU+q4Q44NgHtb6A64YJiKH2Jw479MtRQyavf0uhMcrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=C1LidY6r; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=eC1nzp43; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="C1LidY6r";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="eC1nzp43"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jYByR6a/NDdJzlNCvjaDl47BEyIrYg5KyzzduISgnRw=;
	b=C1LidY6rDPxvvmAB1BpewA2EvPyC6SVPG9hFqt11YSTLRAmbzX6b7qFH5ckKnpsHG0VipL
	8o+3qzW1rivZHZ+cJJxl9lvEZdfHzgXkyv1vEpN0unvaCnUeqepB08LVtp95lhotYNcEY9
	IenEP0upJ64WMxEEXXqwtQ6M85Ubh+lDFUdqIT7aIceboozdiu0O+VSSeGGs7AzoU9voBY
	61lJwegvrnK0GTRLrsI8Gg9GCSMu5VfO7MVAbXHRSpFSwpbJZ46rViqb+VLHZAnpflXqs4
	oTH73V71p1pCJw36y/n9mKb0CuLSDJSAlHpOUK/i8lJGgFpHxljjuN5sp3Nt1g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jYByR6a/NDdJzlNCvjaDl47BEyIrYg5KyzzduISgnRw=;
	b=eC1nzp43Ywhe7x68/gO3DNb+MiQJX7+3LQvTwbr2FEOKB2Z6DxAoB8yyC2A4RO9Io+10QV
	nRB63pAmwwpo61DQ==
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
Subject: [PATCH v7 109/120] x86/cpuid: Introduce a compile-time X86_FEATURE word map
Date: Thu, 28 May 2026 17:39:11 +0200
Message-ID: <20260528153923.403473-110-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prepare for routing X86_FEATURE queries to the CPUID tables instead of to
cpuinfo_x86::x86_capability[].  The latter will be later removed to make
the CPUID tables a "single source of Truth" for all x86 feature state.

Build a compile time map from an <asm/cpufeatures.h> X86_FEATURE word to
its cached CPUID leaf/subleaf register output.

Use a compile time table to preserve the feature querying optimizations at
<asm/cpufeature.h>.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpuid/types.h | 59 +++++++++++++++++++++++++++++-
 1 file changed, 57 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/cpuid/types.h b/arch/x86/include/asm/cpuid/types.h
index 27bcf4eea8dc..85be453834fd 100644
--- a/arch/x86/include/asm/cpuid/types.h
+++ b/arch/x86/include/asm/cpuid/types.h
@@ -168,9 +168,12 @@ struct leaf_parse_info {
  * Use an array of storage entries to accommodate CPUID leaves with multiple subleaves
  * having the same output format.  This is common for hierarchical enumeration; e.g.,
  * CPUID(0x4), CPUID(0x12), and CPUID(0x8000001d).
+ *
+ * Align all CPUID outputs to unsigned long.  They're passed to bitops for X86_FEATURE
+ * queries, which require the alignment.
  */
 #define __CPUID_LEAF(_name, _count)				\
-	struct _name		_name[_count];			\
+	struct _name		_name[_count] __aligned(sizeof(unsigned long));\
 	struct leaf_parse_info	_name##_info
 
 /**
@@ -273,9 +276,61 @@ struct cpuid_leaves {
  *
  * This is to be embedded inside 'struct cpuinfo_x86' to provide parsed and
  * sanitized CPUID data per CPU.
+ *
+ * Align the leaves to unsigned long since their elements are passed to bitops
+ * for X86_FEATURE querying.
  */
 struct cpuid_table {
-	struct cpuid_leaves	leaves;
+	struct cpuid_leaves	leaves __aligned(sizeof(unsigned long));
+};
+
+/*
+ * X86_FEATURE word mappings:
+ *
+ * Build a compile-time mapping table from an <asm/cpufeatures.h> X86_FEATURE
+ * word to its corresponding cached entry in a CPUID table.
+ */
+
+#define __BUG(n)	(NCAPINTS + (n))
+
+struct cpuid_cpufeature {
+	unsigned int	leaves_offset;	/* Offset from a struct cpuid_leaves instance */
+	unsigned int	cpuid_reg;	/* Output register: CPUID_EAX -> CPUID_EDX */
 };
 
+#define __cpu_feature_word(_word, _leaf, _subleaf, _reg)				\
+	[_word] = {									\
+		.leaves_offset	= offsetof(struct cpuid_leaves, leaf_##_leaf##_##_subleaf),\
+		.cpuid_reg	= _reg,							\
+	}
+
+#define CPUID_FEATURE_WORDS_MAP								\
+{											\
+	/*   X86_FEATURE word,		Leaf,		Subleaf,	Output reg */	\
+	__cpu_feature_word(0,		0x1,		0,		CPUID_EDX),	\
+	__cpu_feature_word(1,		0x80000001,	0,		CPUID_EDX),	\
+	__cpu_feature_word(2,		0x80860001,	0,		CPUID_EDX),	\
+	__cpu_feature_word(3,		0x4c780001,	0,		CPUID_EAX),	\
+	__cpu_feature_word(4,		0x1,		0,		CPUID_ECX),	\
+	__cpu_feature_word(5,		0xc0000001,	0,		CPUID_EDX),	\
+	__cpu_feature_word(6,		0x80000001,	0,		CPUID_ECX),	\
+	__cpu_feature_word(7,		0x4c780001,	0,		CPUID_EBX),	\
+	__cpu_feature_word(8,		0x4c780001,	0,		CPUID_ECX),	\
+	__cpu_feature_word(9,		0x7,		0,		CPUID_EBX),	\
+	__cpu_feature_word(10,		0xd,		1,		CPUID_EAX),	\
+	__cpu_feature_word(11,		0x4c780001,	0,		CPUID_EDX),	\
+	__cpu_feature_word(12,		0x7,		1,		CPUID_EAX),	\
+	__cpu_feature_word(13,		0x80000008,	0,		CPUID_EBX),	\
+	__cpu_feature_word(14,		0x6,		0,		CPUID_EAX),	\
+	__cpu_feature_word(15,		0x8000000a,	0,		CPUID_EDX),	\
+	__cpu_feature_word(16,		0x7,		0,		CPUID_ECX),	\
+	__cpu_feature_word(17,		0x4c780001,	1,		CPUID_EAX),	\
+	__cpu_feature_word(18,		0x7,		0,		CPUID_EDX),	\
+	__cpu_feature_word(19,		0x8000001f,	0,		CPUID_EAX),	\
+	__cpu_feature_word(20,		0x80000021,	0,		CPUID_EAX),	\
+	__cpu_feature_word(21,		0x4c780001,	1,		CPUID_EBX),	\
+	__cpu_feature_word(__BUG(0),	0x4c780002,	0,		CPUID_EAX),	\
+	__cpu_feature_word(__BUG(1),	0x4c780002,	0,		CPUID_EBX),	\
+}
+
 #endif /* _ASM_X86_CPUID_TYPES_H */
-- 
2.54.0

