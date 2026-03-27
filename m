Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6D33321C1
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774577875; cv=none; b=OOfzAFNoXyHr0umzYPYf1M1Y0pXHBJwzEk8DFJUtZ7fmaK0M9C57+VokTWJFVaWrlegUy/XoSYt6ohb4BvuDNC/nF2/I+U7zlYEbkPYhVfvuVZUUVp7NABhLUwPwQqm1prwhAiHsgNFGoUDdSYEHXiawyt00HeFCvJYRAEIMfVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774577875; c=relaxed/simple;
	bh=rVkTMr5R6Wxj0UbHISjGJ5upTuaHwrJVub/XbqoRaPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eOkWajFbY58JvTv+agplIO038nEqp+RlGe8aCkwca2zjMk7d/4fOPcKp2Jh6FJqVxKdeCe7MWIOYRd8eHDl4q2C3X1xD6wMGrZ7BMIMJxwJYjSp2t3Skk7IuJApj6OgfKMRqamrwWx9FGltbaQxx/R89kTUURuATg8MCQBCIENc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3K/Bn5iA; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OH8he2QV; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3K/Bn5iA";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OH8he2QV"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774577872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uj4FPbxBS5Lzz5HjdLN44Jn3pGE/P3OgaR7oHpwtaqk=;
	b=3K/Bn5iAlC/Cqy8z53zDVxltEbUtFW5dCVlhumBdZAu/qNept1FyYdZ5dCR61BCyQrUY+v
	WMzvlroIEwvSaEZiX+6jJOcArysjoJU7uispYYc19BWfBr+MM0UAf9DobOEnQnLud7u+Np
	TNb/aY1aerAXefcHkGCTNYZkUEYnVmT+hzFU+HS65f0CIeEZVDjQYQAz9KZSMc5OBT/eA9
	33TFnvWhZj1pGg0iViVTwED3v+djwT2J6fIFygot8qrDUvwVyUVwVbah1WckRmKfO2tGjd
	cZFxa0rKpCZF7UGZI1+Jyz3sP5s7FZBD2bxbhxazYJ3I+b9lxg05s45YI+sJjw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774577872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uj4FPbxBS5Lzz5HjdLN44Jn3pGE/P3OgaR7oHpwtaqk=;
	b=OH8he2QVGIMSR9rMIPHCAG5DRgX4WFWuq4h5QJGiYOdrM3TmAgzsBQw86RjyjNbd5vX7ww
	uRdUu5FydJTXtvAg==
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
Subject: [PATCH v6 08/90] x86: Introduce a centralized CPUID data model
Date: Fri, 27 Mar 2026 03:15:22 +0100
Message-ID: <20260327021645.555257-9-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

** Context

The x86-cpuid-db project generates a C header file with full C99 bitfield
listings for all known CPUID leaf/subleaf query outputs.

That header is now merged by parent commits at <asm/cpuid/leaf_types.h>,
and is in the form:

    struct leaf_0x0_0 { /* CPUID(0x0).0 C99 bitfields */ };
    ...
    struct leaf_0x4_n { /* CPUID(0x4).n C99 bitfields */ };
    ...
    struct leaf_0xd_0 { /* CPUID(0xd).0 C99 bitfields */ };
    struct leaf_0xd_1 { /* CPUID(0xd).1 C99 bitfields */ };
    struct leaf_0xd_n { /* CPUID(0xd).n C99 bitfields */ };
    ...

** Goal

Introduce a structured, size-efficient, per-CPU, CPUID data repository.

Use the x86-cpuid-db auto-generated data types, and custom CPUID leaf
parsers, to build that repository.  Given a leaf, subleaf, and index,
provide direct memory access to the parsed and cached per-CPU CPUID output.

** Long-term goal

Remove the need for drivers and other areas in the kernel to invoke direct
CPUID queries.  Only one place in the kernel should be allowed to use the
CPUID instruction: the CPUID parser code.

** Implementation

Introduce CPUID_LEAF()/CPUID_LEAF_N() to build a compact CPUID storage
layout in the form:

    struct leaf_0x0_0		leaf_0x0_0[1];
    struct leaf_parse_info	leaf_0x0_0_info;

    struct leaf_0x1_0		leaf_0x1_0[1];
    struct leaf_parse_info	leaf_0x0_0_info;

    struct leaf_0x4_n		leaf_0x4_n[8];
    struct leaf_parse_info	leaf_0x4_n_info;
    ...

where each CPUID query stores its output at the designated leaf/subleaf
array and has an associated "CPUID query info" structure.

Embed the CPUID tables inside "struct cpuinfo_x86" to ensure early-boot and
per-CPU access through the CPUs capability structures.

Use an array of CPUID output storage entries for each leaf/subleaf
combination to accommodate leaves which produce the same output format for
a large subleaf range.  This is typical for CPUID leaves enumerating
hierarchical objects; e.g. CPUID(0x4) cache topology enumeration,
CPUID(0xd) XSAVE enumeration, and CPUID(0x12) SGX Enclave Page Cache
enumeration.

** New CPUID APIs

Assuming a CPU capability structure 'c', provide macros to access the
parsed and cached CPUID leaf/subleaf output.  These macros resolve to a
compile-time tokenization that ensures type-safety:

    const struct leaf_0x7_0 *l7_0;

    l7_0 = cpuid_subleaf(c, 0x7, 0);
                         |   |   └────────┐
                         |   └─────────┐  |
                         *             *  *
                        &c.cpuid.leaf_0x7_0[0]

For CPUID leaves with multiple subleaves having the same output format,
provide the APIs:

    const struct leaf_0x4_n *l4_0, *l4_1;

    l4_0 = cpuid_subleaf_n(c, 0x4, 0);
                           |   |   └──────────┐
                           |   └─────────┐    |
                           *             *    v
                          &c.cpuid.leaf_0x4_n[0]

    l4_1 = cpuid_subleaf_n(c, 0x4, 1);
                           |   |   └──────────┐
                           |   └─────────┐    |
                           *             *    v
                          &c.cpuid.leaf_0x4_n[1]

where the indices 0, 1, n above can be passed dynamically; e.g., in an
enumeration for loop.

Add a clear rationale on why call sites should use the these new APIs
instead of directly invoking CPUID.

** Next steps

For now, define cached parse entries for CPUID(0x0) and CPUID(0x1).

Generic parser logic to fill the CPUID tables, along with more CPUID leaves
support, will be added next.

Suggested-by: Thomas Gleixner <tglx@kernel.org>		# CPUID data model
Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>	# x86-cpuid-db schema
Suggested-by: Borislav Petkov <bp@alien8.de>		# Early CPUID centralization drafts
Suggested-by: Ingo Molnar <mingo@kernel.org>		# CPUID headers restructuring
Suggested-by: Sean Christopherson <seanjc@google.com>	# cpuid_subleaf_n() APIs
Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
Link: https://lore.kernel.org/lkml/874ixernra.ffs@tglx
Link: https://gitlab.com/x86-cpuid.org/x86-cpuid-db
Link: https://lore.kernel.org/lkml/aBnSgu_JyEi8fvog@gmail.com
Link: https://lore.kernel.org/lkml/aJ9TbaNMgaplKSbH@google.com
---
 arch/x86/include/asm/cpuid/api.h   | 238 +++++++++++++++++++++++++++++
 arch/x86/include/asm/cpuid/types.h |  98 ++++++++++++
 arch/x86/include/asm/processor.h   |   2 +
 3 files changed, 338 insertions(+)

diff --git a/arch/x86/include/asm/cpuid/api.h b/arch/x86/include/asm/cpuid/api.h
index 2b9750cc8a75..b868902dbf5f 100644
--- a/arch/x86/include/asm/cpuid/api.h
+++ b/arch/x86/include/asm/cpuid/api.h
@@ -289,4 +289,242 @@ static inline bool cpuid_amd_hygon_has_l3_cache(void)
 	return cpuid_edx(0x80000006);
 }
 
+/*
+ * 'struct cpuid_leaves' accessors (without sanity checks):
+ *
+ * For internal use by the CPUID parser.
+ */
+
+/* Return constified pointers for all call-site APIs */
+#define __const_ptr(_ptr)							\
+	((const __typeof__(*(_ptr)) *)(_ptr))
+
+#define __cpuid_leaves_subleaf(_leaves, _leaf, _subleaf)			\
+	__const_ptr(&((_leaves)->leaf_ ## _leaf ## _ ## _subleaf)[0])
+
+#define __cpuid_leaves_subleaf_n(_leaves, _leaf, _index)			\
+	__const_ptr(&((_leaves)->leaf_ ## _leaf ## _ ## n)[_index])
+
+#define __cpuid_leaves_subleaf_info(_leaves, _leaf, _subleaf)			\
+	__const_ptr(&((_leaves)->leaf_ ## _leaf ## _ ## _subleaf ## _ ## info))
+
+/*
+ * 'struct cpuid_table' accessors (with sanity checks):
+ *
+ * For internal use by the CPUID parser.
+ */
+
+#define __cpuid_table_nr_filled_subleaves(_table, _leaf, _subleaf)		\
+	__cpuid_leaves_subleaf_info(&((_table)->leaves), _leaf, _subleaf)->nr_entries
+
+#define __cpuid_table_subleaf_range_size(_table, _leaf)				\
+	ARRAY_SIZE((_table)->leaves.leaf_ ## _leaf ## _n)
+
+#define __cpuid_table_invalid_subleaf(_table, _leaf, _subleaf)			\
+	(((_subleaf) < (__cpuid_leaf_first_subleaf(_leaf))) ||			\
+	 ((_subleaf) > (__cpuid_leaf_first_subleaf(_leaf) +			\
+			__cpuid_table_subleaf_range_size(_table, _leaf) - 1)))
+
+/* Return NULL if the parser did not fill that leaf.  Check cpuid_subleaf(). */
+#define __cpuid_table_subleaf(_table, _leaf, _subleaf)						\
+({												\
+	unsigned int ____f = __cpuid_table_nr_filled_subleaves(_table, _leaf, _subleaf);	\
+												\
+	(____f != 1) ? NULL : __cpuid_leaves_subleaf(&((_table)->leaves), _leaf, _subleaf);	\
+})
+
+/*
+ * Return NULL if the CPUID parser did not fill this leaf, or if the given
+ * dynamic subleaf value is out of range.  Check cpuid_subleaf_n().
+ */
+#define __cpuid_table_subleaf_n(_table, _leaf, _subleaf)					\
+({												\
+	unsigned int ____i = (_subleaf) - __cpuid_leaf_first_subleaf(_leaf);			\
+	unsigned int ____f = __cpuid_table_nr_filled_subleaves(_table, _leaf, n);		\
+												\
+	/* CPUID parser might not have filled the entire subleaf range */			\
+	((____i >= ____f) || __cpuid_table_invalid_subleaf(_table, _leaf, _subleaf)) ?		\
+		NULL : __cpuid_leaves_subleaf_n(&((_table)->leaves), _leaf, ____i);		\
+})
+
+/*
+ * Compile-time checks for leaves with a subleaf range:
+ */
+
+#define __cpuid_assert_subleaf_range(_cpuinfo, _leaf)						\
+	static_assert(__cpuid_table_subleaf_range_size(&(_cpuinfo)->cpuid, _leaf) > 1)
+
+#define __cpuid_assert_subleaf_within_range(_cpuinfo, _leaf, _subleaf)				\
+	BUILD_BUG_ON(__builtin_constant_p(_subleaf) &&						\
+		     __cpuid_table_invalid_subleaf(&(_cpuinfo)->cpuid, _leaf, _subleaf))
+
+/*
+ *                     CPUID Parser Call-site APIs
+ *
+ * Call sites should use below APIs instead of invoking direct CPUID queries.
+ *
+ * Benefits include:
+ *
+ * - Return CPUID output as typed C structures that are auto-generated from a
+ *   centralized database (see <asm/cpuid/leaf_types.h).  Such data types have a
+ *   full C99 bitfield layout per CPUID leaf/subleaf combination.  Call sites
+ *   can thus avoid doing ugly and cryptic bitwise operations on raw CPUID data.
+ *
+ * - Return cached, per-CPU, CPUID output.  Below APIs do not invoke any CPUID
+ *   queries, thus avoiding their side effects like serialization and VM exits.
+ *   Call-site-specific hard coded constants and macros for caching CPUID query
+ *   outputs can also be avoided.
+ *
+ * - Return sanitized CPUID data.  Below APIs return NULL if the given CPUID
+ *   leaf/subleaf input is not supported by hardware, or if the hardware CPUID
+ *   output was deemed invalid by the CPUID parser.  This centralizes all CPUID
+ *   data sanitization in one place (the kernel's CPUID parser.)
+ *
+ * - A centralized global view of system CPUID data.  Below APIs will reflect
+ *   any kernel-enforced feature masking or overrides, unlike ad hoc parsing of
+ *   raw CPUID output by drivers and individual call sites.
+ */
+
+/*
+ * Call-site APIs for CPUID leaves with a single subleaf:
+ */
+
+/**
+ * cpuid_subleaf() - Access parsed CPUID
+ * @_cpuinfo:	CPU capability structure reference ('struct cpuinfo_x86')
+ * @_leaf:	CPUID leaf, in compile-time 0xN format; e.g. 0x7, 0xf
+ * @_subleaf:	CPUID subleaf, in compile-time decimal format; e.g. 0, 1, 3
+ *
+ * Returns a pointer to parsed CPUID output, from the CPUID table inside
+ * @_cpuinfo, as a <cpuid/leaf_types.h> data type: 'struct leaf_0xM_N', where
+ * 0xM is the token provided at @_leaf, and N is the token provided at
+ * @_subleaf; e.g. struct leaf_0x7_0.
+ *
+ * Returns NULL if the requested CPUID @_leaf/@_subleaf query output is not
+ * present at the parsed CPUID table inside @_cpuinfo.  This can happen if:
+ *
+ * - The CPUID table inside @_cpuinfo has not yet been populated.
+ * - The CPUID table inside @_cpuinfo was populated, but the CPU does not
+ *   implement the requested CPUID @_leaf/@_subleaf combination.
+ * - The CPUID table inside @_cpuinfo was populated, but the kernel's CPUID
+ *   parser has predetermined that the requested CPUID @_leaf/@_subleaf
+ *   hardware output is invalid or unsupported.
+ *
+ * Example usage::
+ *
+ *	const struct leaf_0x7_0 *l7_0 = cpuid_subleaf(c, 0x7, 0);
+ *	if (!l7_0) {
+ *		// Handle error
+ *	}
+ *
+ *	const struct leaf_0x7_1 *l7_1 = cpuid_subleaf(c, 0x7, 1);
+ *	if (!l7_1) {
+ *		// Handle error
+ *	}
+ */
+#define cpuid_subleaf(_cpuinfo, _leaf, _subleaf)				\
+	__cpuid_table_subleaf(&(_cpuinfo)->cpuid, _leaf, _subleaf)		\
+
+/**
+ * cpuid_leaf() - Access parsed CPUID data
+ * @_cpuinfo:	CPU capability structure reference ('struct cpuinfo_x86')
+ * @_leaf:	CPUID leaf, in compile-time 0xN format; e.g. 0x0, 0x2, 0x80000000
+ *
+ * Similar to cpuid_subleaf(), but with a CPUID subleaf = 0.
+ *
+ * Example usage::
+ *
+ *	const struct leaf_0x0_0 *l0 = cpuid_leaf(c, 0x0);
+ *	if (!l0) {
+ *		// Handle error
+ *	}
+ *
+ *	const struct leaf_0x80000000_0 *el0 = cpuid_leaf(c, 0x80000000);
+ *	if (!el0) {
+ *		// Handle error
+ *	}
+ */
+#define cpuid_leaf(_cpuinfo, _leaf)						\
+	cpuid_subleaf(_cpuinfo, _leaf, 0)
+
+/**
+ * cpuid_leaf_raw() - Access parsed CPUID data in raw format
+ * @_cpuinfo:	CPU capability structure reference ('struct cpuinfo_x86')
+ * @_leaf:	CPUID leaf, in compile-time 0xN format
+ *
+ * Similar to cpuid_leaf(), but returns a raw 'struct cpuid_regs' pointer to
+ * the parsed CPUID data instead of a "typed" <asm/cpuid/leaf_types.h> pointer.
+ */
+#define cpuid_leaf_raw(_cpuinfo, _leaf)						\
+	((const struct cpuid_regs *)(cpuid_leaf(_cpuinfo, _leaf)))
+
+/*
+ * Call-site APIs for CPUID leaves with a subleaf range:
+ */
+
+/**
+ * cpuid_subleaf_n() - Access parsed CPUID data for leaf with a subleaf range
+ * @_cpuinfo:	CPU capability structure reference ('struct cpuinfo_x86')
+ * @_leaf:	CPUID leaf, in compile-time 0xN format; e.g. 0x4, 0x8000001d
+ * @_subleaf:	Subleaf number, which can be passed dynamically.  It must be smaller
+ *		than cpuid_subleaf_count(@_cpuinfo, @_leaf).
+ *
+ * Build-time errors will be emitted in the following cases:
+ *
+ * - @_leaf has no subleaf range.  Leaves with a subleaf range have an '_n' type
+ *   suffix and are listed at <asm/cpuid/types.h> using the CPUID_LEAF_N() macro.
+ *
+ * - @_subleaf is known at compile-time but is out of range.
+ *
+ * Example usage::
+ *
+ *	const struct leaf_0x4_n *l4;
+ *
+ *	for (int i = 0; i < cpuid_subleaf_count(c, 0x4); i++) {
+ *		l4 = cpuid_subleaf_n(c, 0x4, i);
+ *		if (!l4) {
+ *			// Handle error
+ *		}
+ *		...
+ *	}
+ *
+ * Beside the standard error situations detailed at cpuid_subleaf(), this
+ * macro will also return NULL if @_subleaf is out of the leaf's subleaf range.
+ */
+#define cpuid_subleaf_n(_cpuinfo, _leaf, _subleaf)				\
+({										\
+	__cpuid_assert_subleaf_range(_cpuinfo, _leaf);				\
+	__cpuid_assert_subleaf_within_range(_cpuinfo, _leaf, _subleaf);		\
+	__cpuid_table_subleaf_n(&(_cpuinfo)->cpuid, _leaf, _subleaf);		\
+})
+
+/**
+ * cpuid_subleaf_n_raw() - Access parsed CPUID data for leaf with subleaf range
+ * @_cpuinfo:	CPU capability structure reference ('struct cpuinfo_x86')
+ * @_leaf:	CPUID leaf, in compile-time 0xN format; e.g. 0x4, 0x8000001d
+ * @_subleaf:	Subleaf number, which can be passed dynamically.  It must be smaller
+ *		than cpuid_subleaf_count(@_cpuinfo, @_leaf).
+ *
+ * Similar to cpuid_subleaf_n(), but returns a raw 'struct cpuid_regs' pointer to
+ * the parsed CPUID data instead of a "typed" <asm/cpuid/leaf_types.h> pointer.
+ */
+#define cpuid_subleaf_n_raw(_cpuinfo, _leaf, _subleaf)				\
+	((const struct cpuid_regs *)cpuid_subleaf_n(_cpuinfo, _leaf, _subleaf))
+
+/**
+ * cpuid_subleaf_count() - Number of filled subleaves for @_leaf
+ * @_cpuinfo:	CPU capability structure reference ('struct cpuinfo_x86')
+ * @_leaf:	CPUID leaf, in compile-time 0xN format; e.g. 0x4, 0x8000001d
+ *
+ * Return the number of subleaves filled by the CPUID parser for @_leaf.
+ *
+ * @_leaf must have subleaf range.  Leaves with a subleaf range have an '_n' type
+ * suffix and are listed at <asm/cpuid/types.h> using the CPUID_LEAF_N() macro.
+ */
+#define cpuid_subleaf_count(_cpuinfo, _leaf)					\
+({										\
+	__cpuid_assert_subleaf_range(_cpuinfo, _leaf);				\
+	__cpuid_table_nr_filled_subleaves(&(_cpuinfo)->cpuid, _leaf, n);	\
+})
+
 #endif /* _ASM_X86_CPUID_API_H */
diff --git a/arch/x86/include/asm/cpuid/types.h b/arch/x86/include/asm/cpuid/types.h
index 8a00364b79de..3d0e611c97ba 100644
--- a/arch/x86/include/asm/cpuid/types.h
+++ b/arch/x86/include/asm/cpuid/types.h
@@ -5,6 +5,8 @@
 #include <linux/build_bug.h>
 #include <linux/types.h>
 
+#include <asm/cpuid/leaf_types.h>
+
 /*
  * Types for raw CPUID access:
  */
@@ -30,6 +32,12 @@ enum cpuid_regs_idx {
 #define CPUID_LEAF_FREQ		0x16
 #define CPUID_LEAF_TILE		0x1d
 
+#define CPUID_RANGE(idx)	((idx) & 0xffff0000)
+#define CPUID_RANGE_MAX(idx)	(CPUID_RANGE(idx) + 0xffff)
+
+#define CPUID_BASE_START	0x00000000
+#define CPUID_BASE_END		CPUID_RANGE_MAX(CPUID_BASE_START)
+
 /*
  * Types for CPUID(0x2) parsing:
  */
@@ -124,4 +132,94 @@ extern const struct leaf_0x2_table cpuid_0x2_table[256];
  */
 #define TLB_0x63_2M_4M_ENTRIES		32
 
+/*
+ * Types for centralized CPUID tables:
+ *
+ * For internal use by the CPUID parser.
+ */
+
+/**
+ * struct leaf_parse_info - CPUID query parse info
+ * @nr_entries:	Number of valid entries filled by the CPUID parser
+ */
+struct leaf_parse_info {
+	unsigned int		nr_entries;
+};
+
+/**
+ * __CPUID_LEAF() - Define a CPUID output and parse info entry
+ * @_name:	Struct type name of the CPUID leaf/subleaf (e.g. 'leaf_0x7_0'). Such
+ *		types are defined at <cpuid/leaf_types.h> and follow the leaf_0xM_N
+ *		format, where 0xM is the leaf and N is the subleaf.
+ * @_count:	Number of storage entries to allocate for this leaf/subleaf.
+ *
+ * For a given leaf/subleaf, define an array of CPUID storage entries and an associated
+ * query info structure.
+ *
+ * Use an array of storage entries to accommodate CPUID leaves with multiple subleaves
+ * having the same output format.  This is common for hierarchical enumeration; e.g.,
+ * CPUID(0x4), CPUID(0x12), and CPUID(0x8000001d).
+ */
+#define __CPUID_LEAF(_name, _count)				\
+	struct _name		_name[_count];			\
+	struct leaf_parse_info	_name##_info
+
+/**
+ * CPUID_LEAF() - Define a 'struct cpuid_leaves' storage entry
+ * @_leaf:	Leaf number, in compile-time 0xN format
+ * @_subleaf:	Subleaf number, in compile-time decimal format
+ *
+ * Convenience wrapper around __CPUID_LEAF().
+ */
+#define CPUID_LEAF(_leaf, _subleaf)				\
+	__CPUID_LEAF(leaf_ ## _leaf ## _ ## _subleaf, 1)
+
+#define __cpuid_leaf_first_subleaf(_l)				\
+	LEAF_ ## _l ## _ ## SUBLEAF_N_FIRST
+#define __cpuid_leaf_last_subleaf(_l)				\
+	LEAF_ ## _l ## _ ## SUBLEAF_N_LAST
+
+#define __cpuid_leaf_subleaf_count_min(_l)			2
+#define __cpuid_leaf_subleaf_count_max(_l)			\
+	(__cpuid_leaf_last_subleaf(_l) - __cpuid_leaf_first_subleaf(_l) + 1)
+
+/**
+ * CPUID_LEAF_N() - Define a 'struct cpuid_leaves' storage entry
+ * @_leaf:	Leaf number, in compile-time 0xN format
+ * @_count:	Number of storage entries to allocate for that leaf. It must not exceed
+ *		the limits defined at <cpuid/leaf_types.h>.
+ *
+ * Convenience wrapper around __CPUID_LEAF().
+ */
+#define CPUID_LEAF_N(_leaf, _count)					\
+	static_assert(_count >= __cpuid_leaf_subleaf_count_min(_leaf));	\
+	static_assert(_count <= __cpuid_leaf_subleaf_count_max(_leaf));	\
+	__CPUID_LEAF(leaf_ ## _leaf ## _ ## n, _count)
+
+/*
+ * struct cpuid_leaves - Parsed CPUID data
+ */
+struct cpuid_leaves {
+	/*		Leaf		Subleaf number (or max number of subleaves) */
+	CPUID_LEAF   (	0x0,		0  );
+	CPUID_LEAF   (	0x1,		0  );
+};
+
+/*
+ * Types for centralized CPUID tables:
+ *
+ * For external use.
+ */
+
+/**
+ * struct cpuid_table - Per-CPU CPUID data repository
+ * @leaves:	Parsed CPUID queries output and their metadata
+ *
+ * This is to be embedded inside 'struct cpuinfo_x86' to provide parsed and
+ * sanitized CPUID data per CPU.
+ */
+struct cpuid_table {
+	struct cpuid_leaves	leaves;
+};
+
 #endif /* _ASM_X86_CPUID_TYPES_H */
diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
index bea05fea5729..5ee0dcbd548c 100644
--- a/arch/x86/include/asm/processor.h
+++ b/arch/x86/include/asm/processor.h
@@ -16,6 +16,7 @@ struct vm86;
 #include <uapi/asm/sigcontext.h>
 #include <asm/current.h>
 #include <asm/cpufeatures.h>
+#include <asm/cpuid/types.h>
 #include <asm/page.h>
 #include <asm/pgtable_types.h>
 #include <asm/percpu.h>
@@ -164,6 +165,7 @@ struct cpuinfo_x86 {
 	char			x86_vendor_id[16];
 	char			x86_model_id[64];
 	struct cpuinfo_topology	topo;
+	struct cpuid_table	cpuid;
 	/* in KB - valid for CPUS which support this call: */
 	unsigned int		x86_cache_size;
 	int			x86_cache_alignment;	/* In bytes */
-- 
2.53.0

