Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609FD361DB6
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774578131; cv=none; b=mkYPnU87tFLdkqqCk/R6k6owi6kGQyQ/VDBUXSJt0uxzb+5MJYbPgnIACAkTaezvORVnDIUSXg9vIeSyoWbb2LaL0UrQtPdYzJIA/99Rmuzf0Kdg3IhDwpzk1pzD/ZHOwS8fwRlmYXj8G9vS0+CpFDiDuextFSmwR4Ga/5APAow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774578131; c=relaxed/simple;
	bh=NWJxhTrPyemmaLJBtzm7jBfm9qCsSL8Zg5nZ3NFouI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EuTHyM2mqL7Wf+3dOyO7Ca+80eywTLViCMh579CRWMWHQBsxAUsLbkOxor1C7vzDyiVfvInZNOHQJZfMCGuXPEFdLBTFwkbHh7SED2981IcxiBu7637bqkxVm5vlwFG3n5WkGN1SMA+IFj0ZjOUT8BGVZs3ARBicD3o33htm7Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jNCl66Dg; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BdTBr9QK; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jNCl66Dg";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BdTBr9QK"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774578129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LDLNRpHDyvch9f35CIYfvvYvKFQXjZknY9odVNm73dI=;
	b=jNCl66DgVCqvTzvvp7q/TGn4UOSMllBcvEBfRTTFdKZP62BSpMHKzsUohYufdMpeIxxIbk
	6enQDvZf3PVQug19XJSwGsM0c7KP+k88os0/X4Jc/zyEdvvVkDBo9k8uG/eKIu+I82Psj5
	PjbLTTRwCcyDxC76SHgIsss52213atiqLM6sSh41lzuHoqtJssuXXHzh/1pgIlQcSWiVAw
	dulFx0fUYfXMwbiVCj0O/gQBgbBGThw9LkQr/OkX9wl72TZZb5OZefc6d9A0qp0cihs+m4
	KUvPNDj5IMM4aQ6mXTA/q/JpbIV9X/Yu384zxNC0o7VBPr01S18V9/jawh3Lyw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774578129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LDLNRpHDyvch9f35CIYfvvYvKFQXjZknY9odVNm73dI=;
	b=BdTBr9QKAz6XrvxwZLJxmZ7xz4dnrU96BVzY6dKSo1+CCSG7B4PpPiReadBmQStQktpUo9
	tkHiq7q/Rqy9haDA==
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
Subject: [PATCH v6 79/90] x86/cpuid: Introduce a compile-time X86_FEATURE word map
Date: Fri, 27 Mar 2026 03:16:33 +0100
Message-ID: <20260327021645.555257-80-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
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
index 263e82e89f70..6b0790408b85 100644
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
@@ -267,9 +270,61 @@ struct cpuid_leaves {
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
2.53.0

