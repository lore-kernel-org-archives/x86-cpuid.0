Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA73740962E
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982890; cv=none; b=ighGio0P+F+fjmLzoZQcCk5+W/UEtYRZfbR5J28hdew1RZUWLhc1BYWsacwGSzgffSmswTolwkyUzDhfIAudeiLL75CNaseVHKb5KU4Z0KE9ZgHa0YJZII8XQ06vCsIhrjWmq/ZBjOWuL4+CPLU58FzvlWsrC5aNcjkiJ/nO5EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982890; c=relaxed/simple;
	bh=gugfPwIVW6Z23h4Zjwchn/ZC84hbXBcCOZsvKdU7KWA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OunMBCEsRHeETk8rKmjT+rlgDo8mnEb329r00s91osDx373x4oZhC03lFcz8ie2Ns+J9S+UxPc23R3toO8unTBghqlghZu4gEx8rkVmQgn5amxBRZ0pb0YXwmePGUgyH/ZrBhEcCkyp2uk8l7KBuRJ74rfpqFAzKrmccWXeCR2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sp6o2zQT; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nzRXI/Xp; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sp6o2zQT";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nzRXI/Xp"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aW/+CALsoqbaO0yECpY9fnloQniYFrOWJkJUj7JZneo=;
	b=sp6o2zQTaIW5tD5GC0yQ4nIyP2og6hJWTPfoPohGtDDQDrKR9eNrvxRc184GtL09Z0X/fj
	hrG18YzoUM9TkOO/iqMcSgnmxcQBCAQD/9eNo1tCKfngkCpZoZDvoOu4bzn7n/5tZ5P+go
	h96nm1j17tHluXdfPZ8Rw/UQ5k90R52HxmpNkn4kuGHdgKPjMELpF8g9CiI2HdOpl4LBKW
	5cTc6PdoeMD6UO5zE8SPzvoTuZ8/yBTWN54jzUud3XOTIGaM/at/Fm18BwXfEK52raT960
	+FBLWjCEjDUSvpomHMT98OCY2FmQh4gaAjjMRhIMlMRJt+6OS75KYpp74OGMkw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aW/+CALsoqbaO0yECpY9fnloQniYFrOWJkJUj7JZneo=;
	b=nzRXI/XpsQ5S+nu/XvyqxpKPc1eYyDNMYgszm+/pu7CJvlWgtsVjD401Rnrbdohqwj0+E6
	BqmVgfptdY9092Ag==
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
Subject: [PATCH v7 031/120] x86/cpuid: Parse deterministic cache parameters CPUID leaves
Date: Thu, 28 May 2026 17:37:53 +0200
Message-ID: <20260528153923.403473-32-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
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
 arch/x86/kernel/cpu/cpuid_parser.c | 40 ++++++++++++++++++++++--------
 arch/x86/kernel/cpu/cpuid_parser.h |  4 +++
 3 files changed, 36 insertions(+), 10 deletions(-)

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
index bddd9937bb2b..ee34894c79ef 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.c
+++ b/arch/x86/kernel/cpu/cpuid_parser.c
@@ -31,19 +31,33 @@ static const struct cpuid_vendor_entry cpuid_vendor_entries[] = {
  * Leaf read functions:
  */
 
-/*
- * Default CPUID read function
- * Satisfies the requirements stated at 'struct cpuid_parse_entry'->read().
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
  */
-static void
-cpuid_read_generic(const struct cpuid_parse_entry *e, const struct cpuid_read_output *output)
-{
-	struct cpuid_regs *regs = output->regs;
-
-	for (int i = 0; i < e->maxcnt; i++, regs++, output->info->nr_entries++)
-		cpuid_read_subleaf(e->leaf, e->subleaf + i, regs);
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
 }
 
+/* cpuid_read_generic() */
+define_cpuid_read_function(generic, cpuid_regs, ignored, false);
+
 static void
 cpuid_read_0x2(const struct cpuid_parse_entry *e, const struct cpuid_read_output *output)
 {
@@ -83,6 +97,12 @@ cpuid_read_0x2(const struct cpuid_parse_entry *e, const struct cpuid_read_output
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
2.54.0

