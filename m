Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EB147ECD4
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983158; cv=none; b=JQtCPZgzLLLlBmpvf7EvGXtX9EySlLHkWS2Pi7SzjhmMlV+wdW6xkDmlAeu4GvVMFaYFtyK3RUdU00CQF4DsYb81ZA9zlxnSGggcpZy4qJrdbH4HgLpE0briLlgWd9By+slJVu8pBNGrvF+EIU8Wjo2gmHWfeVq+NAFO/GkXxUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983158; c=relaxed/simple;
	bh=CrixgFgtmFg1mHoLKm5+K6Zcps4vf0dZAyqszPxBEbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cbq4AcMK42eNyaqn6OvV39Gff3WBu/9ngJcHipXFsHbPAlg3Udk7Ic0fv4hfDlEVsYoJW18M7hx3JMSWTpfFCzuuWboh4bGp7nLjfRym2NS3EPb3cNsctaQdlpKTTbQLuFNnqFNtu+LziQmPI8ArVVLNkcIWxhqBwsKioq9SHjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TGV1ik+y; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JQ/1TW+V; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TGV1ik+y";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JQ/1TW+V"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lP6ersgMpmH4epNlmF/TFLHGTSSP8tAphSitkWlaXQ0=;
	b=TGV1ik+yaKz8VbcQVZJx75Mv+S6YdpyzK401ciVwnqATtCG2s2sSyzR+n8WrF28eyBtNMR
	b9pRw7EBwfrzOxTCYy+4QK9CXoWU9ffwaoiMrPC4pGfAcP1qP76XOQ7KaXmlcOTd26cpr/
	TTUCNmlHcnQE1NkUhFPwLxog2sO858hdsxPWSDh0taeF/5vJntSu12SsYIsgE4ZdfYU2/d
	xG3NYqLQCHiShnR0rE8nLfOHt0/AQfrt8oKoCa9NtQ56YBTTzzzpODHgcC3QzfdwebPVch
	GdDVavGw80G9gVT+BTIBvKzzEgMa0IVsCCvuuigmxb9o25HI/NEuct+jVqzPKA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lP6ersgMpmH4epNlmF/TFLHGTSSP8tAphSitkWlaXQ0=;
	b=JQ/1TW+V42xx6yyy/xL515whPZ0XJsy/xzt3agSDLfeo04MvA/cx7yTsQB/DkDt7wiPNtn
	nfi1+u+wC1VP3pCg==
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
Subject: [PATCH v7 110/120] x86/cpuid: Introduce X86_FEATURE and CPUID word APIs
Date: Thu, 28 May 2026 17:39:12 +0200
Message-ID: <20260528153923.403473-111-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce helper APIs to translate:

  - X86_FEATURE symbols from <asm/cpufeatures.h>
  - CPUID word indices from <asm/cpufeature.h>

into offsets within the cached CPUID tables.

These helpers will be used to route all X86_FEATURE and CPUID word querying
into the centralized CPUID tables, instead of their current routing to
cpuinfo_x86::x86_capability[].  Thus removing the latter from the kernel.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpuid/api.h | 125 +++++++++++++++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/arch/x86/include/asm/cpuid/api.h b/arch/x86/include/asm/cpuid/api.h
index 1c0bb7ed4d45..efa1e924d6d3 100644
--- a/arch/x86/include/asm/cpuid/api.h
+++ b/arch/x86/include/asm/cpuid/api.h
@@ -535,6 +535,131 @@ static inline bool cpuid_amd_hygon_has_l3_cache(struct cpuinfo_x86 *c)
 	return el6 && el6->l3_assoc;
 }
 
+/*
+ * X86_FEATURE mapping:
+ *
+ * These macros are for the internal <asm/cpufeature.h> X86_FEATURE querying.
+ * Do everything at compile-time to preserve that header's query optimizations.
+ *
+ * @_feature: <asm/cpufeatures.h> X86_FEATURE symbol
+ */
+
+#define __feature_word(_feature)	((_feature) / 32)
+#define __feature_word_bit(_feature)	((_feature) % 32)
+
+/*
+ * Return cached CPUID output offset for @_feature; within 'struct cpuid_leaves'.
+ */
+#define __feature_byte_offset(_feature)						\
+({										\
+	struct cpuid_cpufeature ____map[] = CPUID_FEATURE_WORDS_MAP;		\
+	unsigned int ____word = __feature_word(_feature);			\
+										\
+	____map[____word].leaves_offset;					\
+})
+
+/*
+ * Return CPUID output register for @_feature; i.e., CPUID_EAX -> CPUID_EDX.
+ */
+#define __feature_register(_feature)						\
+({										\
+	struct cpuid_cpufeature ____map[] = CPUID_FEATURE_WORDS_MAP;		\
+	unsigned int ____word = __feature_word(_feature);			\
+										\
+	____map[____word].cpuid_reg;						\
+})
+
+/*
+ * Return bit offset for @_feature.  This is for bitops, where the offset is
+ * relative to ((u8 *)&cpuid_leaves + __feature_byte_offset(@_feature)).
+ */
+#define __feature_bit_offset(_feature)						\
+({										\
+	32 * __feature_register(_feature) + __feature_word_bit(_feature);	\
+})
+
+/**
+ * cpuid_feature_byte_offset() - Return X86_FEATURE byte offset
+ * @_feature:	X86_FEATURE symbol from <asm/cpufeatures.h>
+ *
+ * Return CPUID table 'struct cpuid_leaves' byte offset, for @_feature.
+ */
+#define cpuid_feature_byte_offset(_feature)	__feature_byte_offset(_feature)
+
+/**
+ * cpuid_feature_bitmap() - Return X86_FEATURE bitmap
+ * @_cpuinfo:	CPU capability structure ('struct cpuinfo_x86')
+ * @_feature:	X86_FEATURE symbol from <asm/cpufeatures.h>
+ *
+ * Return CPUID table bitmap, within @_cpuinfo, for @_feature.  The returned
+ * bitmap is unsigned long aligned, for bitops access.
+ */
+#define cpuid_feature_bitmap(_cpuinfo, _feature)				\
+	(unsigned long *)((u8 *)&(_cpuinfo)->cpuid.leaves + __feature_byte_offset(_feature))
+
+/**
+ * cpuid_feature_bit_offset()
+ * @_feature:	X86_FEATURE symbol from <asm/cpufeatures.h>
+ *
+ * Return CPUID table bit offset, for @_feature, within the bitmap returned by
+ * cpuid_feature_bitmap().
+ */
+#define cpuid_feature_bit_offset(_feature)	__feature_bit_offset(_feature)
+
+/*
+ * CPUID word mapping:
+ */
+
+static inline u32 *__cpuid_word_address(struct cpuinfo_x86 *c, u16 word)
+{
+	u16 feature = word * 32;
+
+	return (u32 *)cpuid_feature_bitmap(c, feature) + __feature_register(feature);
+}
+
+/**
+ * cpuid_word() - Return the CPUID word's raw u32 value
+ * @c:		CPU capability structure ('struct cpuinfo_x86')
+ * @word:	CPUID word number as defined at "enum cpuid_leafs"
+ */
+static inline u32 cpuid_word(struct cpuinfo_x86 *c, u16 word)
+{
+	return *__cpuid_word_address(c, word);
+}
+
+/**
+ * cpuid_word_set() - Set the CPUID word's raw u32 value
+ * @c:		CPU capability structure ('struct cpuinfo_x86')
+ * @word:	CPUID word number as defined at "enum cpuid_leafs"
+ * @val:	Raw u32 value to set the word to
+ */
+static inline void cpuid_word_set(struct cpuinfo_x86 *c, u16 word, u32 val)
+{
+	*__cpuid_word_address(c, word) = val;
+}
+
+/**
+ * cpuid_word_set_bits() - Set bits at CPUID word according to passed map
+ * @c:		CPU capability structure ('struct cpuinfo_x86')
+ * @word:	CPUID word number as defined at "enum cpuid_leafs"
+ * @map:	Map of bits to be set
+ */
+static inline void cpuid_word_set_bits(struct cpuinfo_x86 *c, u16 word, u32 map)
+{
+	*__cpuid_word_address(c, word) |= map;
+}
+
+/**
+ * cpuid_word_clear_bits() - Clear bits at CPUID word according to passed map
+ * @c:		CPU capability structure ('struct cpuinfo_x86')
+ * @word:	CPUID word number as defined at "enum cpuid_leafs"
+ * @map:	Map of bits to be cleared
+ */
+static inline void cpuid_word_clear_bits(struct cpuinfo_x86 *c, u16 word, u32 map)
+{
+	*__cpuid_word_address(c, word) &= ~map;
+}
+
 /*
  * CPUID parser exported APIs:
  */
-- 
2.54.0

