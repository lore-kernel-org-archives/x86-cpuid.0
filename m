Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C113FDC04
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982822; cv=none; b=F5HQ2hGhy58FLCdZokB5zI2T+HNoBQfp/UXnwm00HuxPMbwc73V84oYWHSuFQ5a0se4LZJ3LbFj5K0Mj7eYzEYJdH2g9llSsWLnyieaKxO0BVv16d5wbp9HX/eBqAyUV/gyj8CXi4gFiWCYoP8ygz7LdRm4iD5WEpEsVFF52dJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982822; c=relaxed/simple;
	bh=wBpDZ8ZYwQZs5UPZpt2jKk/ecqdBJL5Cz6NIBSpEz/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TY4q1FhSndWtBneDim8KdO66mZAi93dlTS1TUoroClx++1xqvXOvnzxDQCrBWpu3UWpMR6y7iqkbhjM3zJ+NibeF0oSlBXayYEgijOk7m+IIuHeREITXCya4bjIyyDxonx6Q9l62Bx/TLL9sIsdqjbGvvyggw8cOuC7NET+a7is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BJJlw/mN; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MfiIHljX; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BJJlw/mN";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MfiIHljX"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b1pJKumQpKk9xRz20NXWO08mDN5NfovKWNISL2IUrh8=;
	b=BJJlw/mNRTttX1q5Zb6F+ziFgxK80Gn8LrNAsE96vmKJ5WCpa909/B2Be8qUUYKtBZIknO
	/RDqYbvakfdv0vBbXDpP4LqkD6Dz1SwLLmFLIKS3HSyPqB5CpeZCyXVQeOIxLL8HbIIeFW
	RgmRKatgMuP41KADBwBsVIlZvs4ogl3PZUqNlpOZOgl0Q/8bCi48fba+oRHENBXGkT8oK6
	v+kLSNd4KmPM8mm7h2gWZCTjRgyoMEbEoF+6F1cfxTw0Hi7ftt0Z7fZLYg7/O/5DGKjKe/
	V7ImhD9Qs9gRFnVorZnTopeE1/3wObLZNNepm4KC0JBDB1Co5y7G5J0rnor09w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b1pJKumQpKk9xRz20NXWO08mDN5NfovKWNISL2IUrh8=;
	b=MfiIHljXBdT+gTBpTmFtrz3v3CPsH5C2s9om19FDZ6ClsIfXYvuaS5lKW4ZmSdP5v6LUD/
	LFHtDUhPlgKX3eDQ==
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
Subject: [PATCH v7 012/120] x86/cpuid: Parse CPUID(0x80000000)
Date: Thu, 28 May 2026 17:37:34 +0200
Message-ID: <20260528153923.403473-13-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add CPUID parser logic for CPUID(0x80000000).

Verify the CPUID output since legacy Intel machines without an extended
range will repeat the highest standard CPUID leaf output instead.

This verification is similar to what is done at arch/x86/kernel/head_32.S
and arch/x86/kernel/cpu/common.c.

References: 8a50e5135af0 ("x86-32: Use symbolic constants, safer CPUID when enabling EFER.NX")
References: 67ad24e6d39c ("- pre5:    - Rasmus Andersen: add proper...")  # Historical git
Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Link: https://lore.kernel.org/r/d4fcfd91-cc92-4b3c-9dd2-56ecd754cecc@citrix.com
---
 arch/x86/include/asm/cpuid/types.h |  4 ++++
 arch/x86/kernel/cpu/cpuid_parser.c | 21 +++++++++++++++++++++
 arch/x86/kernel/cpu/cpuid_parser.h |  1 +
 3 files changed, 26 insertions(+)

diff --git a/arch/x86/include/asm/cpuid/types.h b/arch/x86/include/asm/cpuid/types.h
index 3d0e611c97ba..c020fb8fed59 100644
--- a/arch/x86/include/asm/cpuid/types.h
+++ b/arch/x86/include/asm/cpuid/types.h
@@ -36,7 +36,10 @@ enum cpuid_regs_idx {
 #define CPUID_RANGE_MAX(idx)	(CPUID_RANGE(idx) + 0xffff)
 
 #define CPUID_BASE_START	0x00000000
+#define CPUID_EXT_START		0x80000000
+
 #define CPUID_BASE_END		CPUID_RANGE_MAX(CPUID_BASE_START)
+#define CPUID_EXT_END		CPUID_RANGE_MAX(CPUID_EXT_START)
 
 /*
  * Types for CPUID(0x2) parsing:
@@ -203,6 +206,7 @@ struct cpuid_leaves {
 	/*		Leaf		Subleaf number (or max number of subleaves) */
 	CPUID_LEAF   (	0x0,		0  );
 	CPUID_LEAF   (	0x1,		0  );
+	CPUID_LEAF   (  0x80000000,	0  );
 };
 
 /*
diff --git a/arch/x86/kernel/cpu/cpuid_parser.c b/arch/x86/kernel/cpu/cpuid_parser.c
index 898b0c441431..2cebe15f75d4 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.c
+++ b/arch/x86/kernel/cpu/cpuid_parser.c
@@ -38,6 +38,24 @@ cpuid_read_generic(const struct cpuid_parse_entry *e, const struct cpuid_read_ou
 		cpuid_read_subleaf(e->leaf, e->subleaf + i, regs);
 }
 
+static void
+cpuid_read_0x80000000(const struct cpuid_parse_entry *e, const struct cpuid_read_output *output)
+{
+	struct leaf_0x80000000_0 *el0 = (struct leaf_0x80000000_0 *)output->regs;
+
+	cpuid_read_subleaf(e->leaf, e->subleaf, el0);
+
+	/*
+	 * Protect against Intel 32-bit CPUs lacking an extended CPUID range.  A
+	 * CPUID(0x80000000) query on such machines will repeat the output of the
+	 * highest standard CPUID leaf instead.
+	 */
+	if (CPUID_RANGE(el0->max_ext_leaf) != CPUID_EXT_START)
+		return;
+
+	output->info->nr_entries = 1;
+}
+
 /*
  * CPUID parser table:
  */
@@ -53,9 +71,11 @@ static const struct cpuid_parse_entry cpuid_parse_entries[] = {
 static unsigned int cpuid_range_max_leaf(const struct cpuid_table *t, unsigned int range)
 {
 	const struct leaf_0x0_0 *l0 = __cpuid_table_subleaf(t, 0x0, 0);
+	const struct leaf_0x80000000_0 *el0 = __cpuid_table_subleaf(t, 0x80000000, 0);
 
 	switch (range) {
 	case CPUID_BASE_START:	return l0  ?  l0->max_std_leaf : 0;
+	case CPUID_EXT_START:	return el0 ? el0->max_ext_leaf : 0;
 	default:		return 0;
 	}
 }
@@ -113,6 +133,7 @@ cpuid_fill_table(struct cpuid_table *t, const struct cpuid_parse_entry entries[]
 		unsigned int end;
 	} ranges[] = {
 		{ CPUID_BASE_START, CPUID_BASE_END },
+		{ CPUID_EXT_START,  CPUID_EXT_END  },
 	};
 
 	for (unsigned int i = 0; i < ARRAY_SIZE(ranges); i++)
diff --git a/arch/x86/kernel/cpu/cpuid_parser.h b/arch/x86/kernel/cpu/cpuid_parser.h
index df627306cc8c..7d41bde0c0ec 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.h
+++ b/arch/x86/kernel/cpu/cpuid_parser.h
@@ -116,5 +116,6 @@ struct cpuid_parse_entry {
 	/*			Leaf		Subleaf		Reader function */		\
 	CPUID_PARSE_ENTRY   (	0x0,		0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x1,		0,		generic			),	\
+	CPUID_PARSE_ENTRY   (	0x80000000,	0,		0x80000000		),	\
 
 #endif /* _ARCH_X86_CPUID_PARSER_H */
-- 
2.54.0

