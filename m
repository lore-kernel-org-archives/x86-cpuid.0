Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223ED3603D4
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774577973; cv=none; b=CMmuETPeH3lRVfnaxpenQZDm09HjASqJydu7x5CJAbJz6ImdNdF7YfD8K/StThhEbfPQIEoHbeSYirGzj/geA3DOgnyhy3kWBsScZ35ilFYMvIUDq+TRaPV9e+e5XpJ1Lnu9vbC+xR3Pia9/VKk43U+oJawIAIdF58wEBG5CNZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774577973; c=relaxed/simple;
	bh=UI1ZimJbjEMLHwr4UDp7Hv3AfqPqElFAYKVIRZOWOLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X0GBFnWevt03trceyWhZYQYl7Uv0ZiDy9a2082s6u4ZX/E7rL/CkQpEN4Ay9Dnur/lbnE3K7GWe/ZQ35gjnBlyjNZv750NzXoBs7yn6Omr2GpiojFhIjStS4h7CB7Iry2HJ8sf6G+vKCkeqpM96cS/j9pIS1xoje67z+5R816WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=FzdtuYMG; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yM1zulr3; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="FzdtuYMG";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yM1zulr3"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774577970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZLBwHVoHoGi6f0Xxmk8tkpKmkAoxCT8HbQBo5YmiRX4=;
	b=FzdtuYMGaU9JvJBsHwLiO0w8IG6lO2XuMEr0xzK8/xfB86BariBxmHXoCTB32jG5Mv55n2
	MD6/BKoacZxYlyweWsbgbPKWAgHn9rgImJ9BTmV7NhYKhffFwdnKV1KnjDvizIXpj63CMu
	rP48jNm1TyU0SIknA20ccxd8WtW8o5pViMGAiQK2ztVn6ZUrzGnRxMcJS9kjkWsW9Sxfvz
	Tv4VfnfhSRLGRKQ02H7p8q5so+u59XPVLZ0uaP0rz9DCKj2Rnmzx04UfykaO3U49ow6MNb
	XJJltclm8AJrI7pohy2dVqgH5tLTfp2VPFzCI+B6p+w5EU8FGIO7P5eGIZudlg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774577970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZLBwHVoHoGi6f0Xxmk8tkpKmkAoxCT8HbQBo5YmiRX4=;
	b=yM1zulr3rZRYIq7hlK8yNFy9KEGlY5niS+fM5BUCRlc8OQtQsXEl6VFJlze+AEOPnsUlTe
	oVhJY3wq3lhGFGAw==
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
Subject: [PATCH v6 36/90] x86/cpuid: Parse deterministic cache parameters CPUID leaves
Date: Fri, 27 Mar 2026 03:15:50 +0100
Message-ID: <20260327021645.555257-37-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Parse CPUID(0x4) and CPUID(0x8000001d).

Query CPUID(0x4) only for Intel, Centaur, and Zhaoxin as these are the x86
vendors where it is supported.  Query CPUID(0x8000001d) for AMD and Hygon.

Define a single CPUID parser read function for both leaves, as they have
the same subleaf cache enumeration logic.

Introduce the macro

    define_cpuid_read_function()

to avoid code duplication between the CPUID parser default read function,
cpuid_read_generic(), and the new CPUID(0x4)/CPUID(0x8000001d) logic.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpuid/types.h |  2 ++
 arch/x86/kernel/cpu/cpuid_parser.c | 40 +++++++++++++++++++++++-------
 arch/x86/kernel/cpu/cpuid_parser.h |  4 +++
 3 files changed, 37 insertions(+), 9 deletions(-)

diff --git a/arch/x86/include/asm/cpuid/types.h b/arch/x86/include/asm/cpuid/types.h
index c35de721f652..f77659303569 100644
--- a/arch/x86/include/asm/cpuid/types.h
+++ b/arch/x86/include/asm/cpuid/types.h
@@ -211,11 +211,13 @@ struct cpuid_leaves {
 	CPUID_LEAF   (	0x0,		0  );
 	CPUID_LEAF   (	0x1,		0  );
 	CPUID_LEAF   (  0x2,		0  );
+	CPUID_LEAF_N (  0x4,		8  );
 	CPUID_LEAF   (	0x16,		0  );
 	CPUID_LEAF   (  0x80000000,	0  );
 	CPUID_LEAF   (  0x80000002,	0  );
 	CPUID_LEAF   (  0x80000003,	0  );
 	CPUID_LEAF   (  0x80000004,	0  );
+	CPUID_LEAF_N (  0x8000001d,	8  );
 	CPUID_LEAF   (  0x80860000,	0  );
 	CPUID_LEAF   (  0x80860001,	0  );
 	CPUID_LEAF   (  0x80860002,	0  );
diff --git a/arch/x86/kernel/cpu/cpuid_parser.c b/arch/x86/kernel/cpu/cpuid_parser.c
index bddd9937bb2b..99507e99d8d9 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.c
+++ b/arch/x86/kernel/cpu/cpuid_parser.c
@@ -31,18 +31,34 @@ static const struct cpuid_vendor_entry cpuid_vendor_entries[] = {
  * Leaf read functions:
  */
 
+/**
+ * define_cpuid_read_function() - Generate a CPUID parser read function
+ * @suffix:	Generated function name suffix (full name becomes: cpuid_read_@suffix())
+ * @_leaf_t:	Type to cast the CPUID output storage pointer
+ * @_leaf:	Name of the CPUID output storage pointer
+ * @_break_c:	Condition to break the CPUID parsing loop, which may reference @_leaf,
+ *		and where @_leaf stores each iteration's CPUID output.
+ *
+ * Define a CPUID parser read function according to the requirements stated at
+ * 'struct cpuid_parse_entry'->read().
+ */
+#define define_cpuid_read_function(suffix, _leaf_t, _leaf, _break_c)				\
+static void											\
+cpuid_read_##suffix(const struct cpuid_parse_entry *e, const struct cpuid_read_output *output)	\
+{												\
+	struct _leaf_t *_leaf = (struct _leaf_t *)output->regs;					\
+												\
+	for (int i = 0; i < e->maxcnt; i++, _leaf++, output->info->nr_entries++) {		\
+		cpuid_read_subleaf(e->leaf, e->subleaf + i, _leaf);				\
+		if (_break_c)									\
+			break;									\
+	}											\
+}
+
 /*
  * Default CPUID read function
- * Satisfies the requirements stated at 'struct cpuid_parse_entry'->read().
  */
-static void
-cpuid_read_generic(const struct cpuid_parse_entry *e, const struct cpuid_read_output *output)
-{
-	struct cpuid_regs *regs = output->regs;
-
-	for (int i = 0; i < e->maxcnt; i++, regs++, output->info->nr_entries++)
-		cpuid_read_subleaf(e->leaf, e->subleaf + i, regs);
-}
+define_cpuid_read_function(generic, cpuid_regs, ignored, false);
 
 static void
 cpuid_read_0x2(const struct cpuid_parse_entry *e, const struct cpuid_read_output *output)
@@ -83,6 +99,12 @@ cpuid_read_0x2(const struct cpuid_parse_entry *e, const struct cpuid_read_output
 	output->info->nr_entries = 1;
 }
 
+/*
+ * Shared read function for Intel CPUID(0x4) and AMD CPUID(0x8000001d), as both have
+ * the same subleaf enumeration logic and register output format.
+ */
+define_cpuid_read_function(deterministic_cache, leaf_0x4_n, l, l->cache_type == 0);
+
 /*
  * Define an extended range CPUID read function
  *
diff --git a/arch/x86/kernel/cpu/cpuid_parser.h b/arch/x86/kernel/cpu/cpuid_parser.h
index 1de239370652..25ca9b19e8cf 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.h
+++ b/arch/x86/kernel/cpu/cpuid_parser.h
@@ -145,11 +145,13 @@ struct cpuid_parse_entry {
 #define CPUID_COMMON_ENTRIES									\
 	/*			Leaf		Subleaf		Reader function */		\
 	CPUID_PARSE_ENTRY   (	0x2,		0,		0x2			),	\
+	CPUID_PARSE_ENTRY_N (	0x4,				deterministic_cache	),	\
 	CPUID_PARSE_ENTRY   (	0x16,		0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80000000,	0,		0x80000000		),	\
 	CPUID_PARSE_ENTRY   (	0x80000002,	0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80000003,	0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80000004,	0,		generic			),	\
+	CPUID_PARSE_ENTRY_N (	0x8000001d,			deterministic_cache	),	\
 	CPUID_PARSE_ENTRY   (	0x80860000,	0,		0x80860000		),	\
 	CPUID_PARSE_ENTRY   (	0x80860001,	0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80860002,	0,		generic			),	\
@@ -192,7 +194,9 @@ struct cpuid_vendor_entry {
 #define CPUID_VENDOR_ENTRIES								\
 	/*		   Leaf		Vendor list		    */			\
 	CPUID_VENDOR_ENTRY(0x2,		X86_VENDOR_INTEL, X86_VENDOR_CENTAUR, X86_VENDOR_ZHAOXIN),\
+	CPUID_VENDOR_ENTRY(0x4,		X86_VENDOR_INTEL, X86_VENDOR_CENTAUR, X86_VENDOR_ZHAOXIN),\
 	CPUID_VENDOR_ENTRY(0x16,	X86_VENDOR_INTEL),				\
+	CPUID_VENDOR_ENTRY(0x8000001d,	X86_VENDOR_AMD, X86_VENDOR_HYGON),		\
 	CPUID_VENDOR_ENTRY(0x80860000,	X86_VENDOR_TRANSMETA),				\
 	CPUID_VENDOR_ENTRY(0x80860001,	X86_VENDOR_TRANSMETA),				\
 	CPUID_VENDOR_ENTRY(0x80860002,	X86_VENDOR_TRANSMETA),				\
-- 
2.53.0

