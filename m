Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6673C40800F
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982869; cv=none; b=sTKE4wFEK9yTWoQBCHWSzQnuiLJTpE5VQ9YKE0UFSSglSKlL7r7U2KXB8b0Sl8H2rT6trWbjIGr+I/lBeO3EGPVokRtrhr3fpbWauqlQ72PaWKn/lByFgxukQfJXA6J5DoPoVZx1itIiU8SVhOQqexJa2oKy8UqtPfBTPVHfkxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982869; c=relaxed/simple;
	bh=tBeu2Ko24X82EtlnhU6jCsXdM8G44EzwA24PXzun26I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SJux4ovuFMk/Or7C00FCOqeE/0/z21aeT3KvH3y0KQOd3Sl4jpPbPFsHsVQRqH1Kj6aKF5quHOhYqxmRbG9HARw5DFh47QId9cePY+S2izOa4Ogfb9+tPdlmnY5nAZTwBr6iTvjHdQ35NktIkvvUzEoqci85X5Y7X3XxPfrfMEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bqwUo18m; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=KbdcERy7; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bqwUo18m";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KbdcERy7"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wi4VM8vMO7tNjuxY9IdYcZ9dRCqO598/xFz1Lsgn8Tc=;
	b=bqwUo18mYfOVH+91cUiFMgT1gWYD1CREGc0vDHcHUExULQKwqowK909xkX/G1lg24SQyU0
	qCncfBnaBbDz7f6FwWFtnVOfFSrwW9hQHusxSChZzOe6DZ+7yXbYq3N9hYcv1XcNFTIMUb
	R6n63x9nORIih7h86pJZ1gYxmdAIn9fQsljZUWg81PhwPRi2R5zMIcm0I/CK4ZpUJh3xHV
	e60UrYTJRMvPHqE71gUSsGGV67Ir+Ncx/qWMcZXE4ODdfz2gqBZKF448BQReQ2OQuky1m7
	U1wvZjApNp8VBgY/75ZQGzFflHkgWo0F8ZmLJhPM5zdXpCS9ReDSUEdGU3tUJw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wi4VM8vMO7tNjuxY9IdYcZ9dRCqO598/xFz1Lsgn8Tc=;
	b=KbdcERy7HC/BGK3xWQY8uSCRX0FJcaVcAPeDjbhmjcKsc+H25VYz4CXZ4Gp6wWXHyrD8x9
	q/11fiiLDtg/6wCA==
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
Subject: [PATCH v7 025/120] x86/cpuid: Parse CPUID(0x2)
Date: Thu, 28 May 2026 17:37:47 +0200
Message-ID: <20260528153923.403473-26-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Parse CPUID(0x2).

Query it only for Intel, Centaur, and Zhaoxin, given that

    kernel/cpu/cacheinfo.c :: init_intel_cacheinfo()

is called by:

    kernel/cpu/intel.c		cpu_dev.c_x86_vendor = X86_VENDOR_INTEL
    kernel/cpu/centaur.c	cpu_dev.c_x86_vendor = X86_VENDOR_CENTAUR
    kernel/cpu/zhaoxin.c	cpu_dev.c_x86_vendor = X86_VENDOR_ZHAOXIN

At the CPUID tables, keep CPUID(0x2) marked as invalid if the whole leaf,
or all of its output registers separately, were malformed.

Note, cpuid_leaf_0x2() at <asm/cpuid/api.h> will be removed once all call
sites are transformed to new CPUID APIs.

References: fe78079ec07f ("x86/cpu: Introduce and use CPUID leaf 0x2 parsing helpers")
Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpuid/types.h |  1 +
 arch/x86/kernel/cpu/cpuid_parser.c | 36 ++++++++++++++++++++++++++++++
 arch/x86/kernel/cpu/cpuid_parser.h |  2 ++
 3 files changed, 39 insertions(+)

diff --git a/arch/x86/include/asm/cpuid/types.h b/arch/x86/include/asm/cpuid/types.h
index 8cc9f81e9526..c35de721f652 100644
--- a/arch/x86/include/asm/cpuid/types.h
+++ b/arch/x86/include/asm/cpuid/types.h
@@ -210,6 +210,7 @@ struct cpuid_leaves {
 	/*		Leaf		Subleaf number (or max number of subleaves) */
 	CPUID_LEAF   (	0x0,		0  );
 	CPUID_LEAF   (	0x1,		0  );
+	CPUID_LEAF   (  0x2,		0  );
 	CPUID_LEAF   (	0x16,		0  );
 	CPUID_LEAF   (  0x80000000,	0  );
 	CPUID_LEAF   (  0x80000002,	0  );
diff --git a/arch/x86/kernel/cpu/cpuid_parser.c b/arch/x86/kernel/cpu/cpuid_parser.c
index a7e6692f767b..be340b202182 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.c
+++ b/arch/x86/kernel/cpu/cpuid_parser.c
@@ -42,6 +42,42 @@ cpuid_read_generic(const struct cpuid_parse_entry *e, const struct cpuid_read_ou
 		cpuid_read_subleaf(e->leaf, e->subleaf + i, regs);
 }
 
+static void
+cpuid_read_0x2(const struct cpuid_parse_entry *e, const struct cpuid_read_output *output)
+{
+	union leaf_0x2_regs *regs = (union leaf_0x2_regs *)output->regs;
+	struct leaf_0x2_0 *l = (struct leaf_0x2_0 *)output->regs;
+	int invalid_regs = 0;
+
+	/*
+	 * All Intel CPUs must report an iteration count of 1.	For broken hardware,
+	 * keep the leaf marked as invalid at the CPUID table.
+	 */
+	cpuid_read_subleaf(e->leaf, e->subleaf, l);
+	if (l->iteration_count != 0x01)
+		return;
+
+	/*
+	 * The most significant bit (MSB) of each CPUID(0x2) register must be clear.
+	 * If a register is malformed, replace its 1-byte descriptors with NULL.
+	 */
+	for (int i = 0; i < 4; i++) {
+		if (regs->reg[i].invalid) {
+			regs->regv[i] = 0;
+			invalid_regs++;
+		}
+	}
+
+	/*
+	 * If all of the CPUID(0x2) output registers were malformed, keep the leaf
+	 * marked as invalid at the CPUID table.
+	 */
+	if (invalid_regs == 4)
+		return;
+
+	output->info->nr_entries = 1;
+}
+
 /*
  * Define an extended range CPUID read function
  *
diff --git a/arch/x86/kernel/cpu/cpuid_parser.h b/arch/x86/kernel/cpu/cpuid_parser.h
index 76a87a71b430..1de239370652 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.h
+++ b/arch/x86/kernel/cpu/cpuid_parser.h
@@ -144,6 +144,7 @@ struct cpuid_parse_entry {
  */
 #define CPUID_COMMON_ENTRIES									\
 	/*			Leaf		Subleaf		Reader function */		\
+	CPUID_PARSE_ENTRY   (	0x2,		0,		0x2			),	\
 	CPUID_PARSE_ENTRY   (	0x16,		0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80000000,	0,		0x80000000		),	\
 	CPUID_PARSE_ENTRY   (	0x80000002,	0,		generic			),	\
@@ -190,6 +191,7 @@ struct cpuid_vendor_entry {
 
 #define CPUID_VENDOR_ENTRIES								\
 	/*		   Leaf		Vendor list		    */			\
+	CPUID_VENDOR_ENTRY(0x2,		X86_VENDOR_INTEL, X86_VENDOR_CENTAUR, X86_VENDOR_ZHAOXIN),\
 	CPUID_VENDOR_ENTRY(0x16,	X86_VENDOR_INTEL),				\
 	CPUID_VENDOR_ENTRY(0x80860000,	X86_VENDOR_TRANSMETA),				\
 	CPUID_VENDOR_ENTRY(0x80860001,	X86_VENDOR_TRANSMETA),				\
-- 
2.54.0

