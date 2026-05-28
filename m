Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32ED44A71E
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983024; cv=none; b=VNRMlKQbU64DD+W17gRpOk8HTKncZtsJNGZMZ2V8PTY/8uEp0Br3ZDLMRZqTkZXOewwquUSqbWOMAc+QN35IXfSIjrSc4JKyomOEPtPjdiXm6PriwGIfhx6IIV811sJ3ACT+D0Qvg+OxA40sbRFH/tio3iJewc50bGfHvDqs8d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983024; c=relaxed/simple;
	bh=KTcG/XTJOlno6t2yjiGRtG11hsuByuAw3l0qI3DHej0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l3yAnEDPCoFtpkBkw8KX6EK5WlZKKTnHOhICVSLJNTjkBLGHiIpLkinMVdmrz8Jrkc7xSirTIuAG9tv8X0j+HJGG1Dgtx2E2zv6hMya9uK2XWGFu5wG4pOP/1ZlzdcthNw7JNaW5L5PmfRlVupxu51Hmg0/WmNf77Lh2AZZQfyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wTzRBTFX; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jKSOz7TP; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wTzRBTFX";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jKSOz7TP"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2VRNlbpKam19rn3Wb8IoFcn9Eb9LWbfddMmh/eVXZ7A=;
	b=wTzRBTFX/V2uctLXA92hZTzAO2Tsz9qDybPDGUYi4Hfav1AoCpFTFUHQCfEt8/aQ1O8mHw
	r3ivFjnZ//BMIMzKMRqMxsi+BaiyPKlfYdlZ4Bel3i9HJ7bBaRcuqYfLnr/2BBkAARaS6E
	quBn1DVOMIjyDFgO2lFSh5jLrrLj61PO3ok4MtcXBYo83lJkM8KALNWVbhqmLJUMSMKnLm
	gUI3JF1xvJHN5zzVjr+GUEmdtAqTq51PgKY9Ok/Plzap6YVtzClEBdUtuanhGr47T64toc
	KU8x6NZ1MLYNkVKysIuLhLhN02GAYbEOUjqwj1PFZyivW+cxiCEfqJBjRpOpKA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2VRNlbpKam19rn3Wb8IoFcn9Eb9LWbfddMmh/eVXZ7A=;
	b=jKSOz7TPCHMjWslEZIuSUI1eEtgMB8JKW1Ogk+VYm1A2IGrmKPPZL+AqYL4IKzClu+rd5s
	/T/O7IJKLhdpCYCg==
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
Subject: [PATCH v7 069/120] x86/cpuid: Parse CPUID(0x6), CPUID(0x9), and CPUID(0x15)
Date: Thu, 28 May 2026 17:38:31 +0200
Message-ID: <20260528153923.403473-70-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Parse CPUID(0x6), CPUID(0x9), and CPUID(0x15).  Their call sites will be
converted next.

For HFI CPUID(0x6), do not add an Intel vendor tag.  It is architecturally
defined for AMD, even though the kernel only uses it on Intel boxes so far.

For DCA CPUID(0x9), per the hardware manuals, check the CPUID(0x1).ECX.DCA
bit before declaring the leaf as valid.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpuid/types.h |  3 +++
 arch/x86/kernel/cpu/cpuid_parser.c | 12 ++++++++++++
 arch/x86/kernel/cpu/cpuid_parser.h |  4 ++++
 3 files changed, 19 insertions(+)

diff --git a/arch/x86/include/asm/cpuid/types.h b/arch/x86/include/asm/cpuid/types.h
index 50156e9883a3..2949584e85cc 100644
--- a/arch/x86/include/asm/cpuid/types.h
+++ b/arch/x86/include/asm/cpuid/types.h
@@ -213,6 +213,9 @@ struct cpuid_leaves {
 	CPUID_LEAF   (  0x2,		0  );
 	CPUID_LEAF_N (  0x4,		8  );
 	CPUID_LEAF   (	0x5,		0  );
+	CPUID_LEAF   (	0x6,		0  );
+	CPUID_LEAF   (	0x9,		0  );
+	CPUID_LEAF   (  0x15,		0  );
 	CPUID_LEAF   (	0x16,		0  );
 	CPUID_LEAF   (  0x80000000,	0  );
 	CPUID_LEAF   (  0x80000002,	0  );
diff --git a/arch/x86/kernel/cpu/cpuid_parser.c b/arch/x86/kernel/cpu/cpuid_parser.c
index ee34894c79ef..f563834a082e 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.c
+++ b/arch/x86/kernel/cpu/cpuid_parser.c
@@ -103,6 +103,18 @@ cpuid_read_0x2(const struct cpuid_parse_entry *e, const struct cpuid_read_output
  */
 define_cpuid_read_function(deterministic_cache, leaf_0x4_n, l, l->cache_type == 0);
 
+static void
+cpuid_read_0x9(const struct cpuid_parse_entry *e, const struct cpuid_read_output *output)
+{
+	struct leaf_0x1_0 l1;
+
+	cpuid_read(0x1, &l1);
+	if (!l1.dca)
+		return;
+
+	cpuid_read_generic(e, output);
+}
+
 /*
  * Define an extended range CPUID read function
  *
diff --git a/arch/x86/kernel/cpu/cpuid_parser.h b/arch/x86/kernel/cpu/cpuid_parser.h
index 3a60dad4e861..800a7bd6dca2 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.h
+++ b/arch/x86/kernel/cpu/cpuid_parser.h
@@ -147,6 +147,9 @@ struct cpuid_parse_entry {
 	CPUID_PARSE_ENTRY   (	0x2,		0,		0x2			),	\
 	CPUID_PARSE_ENTRY_N (	0x4,				deterministic_cache	),	\
 	CPUID_PARSE_ENTRY   (	0x5,		0,		generic			),	\
+	CPUID_PARSE_ENTRY   (	0x6,		0,		generic			),	\
+	CPUID_PARSE_ENTRY   (	0x9,		0,		0x9			),	\
+	CPUID_PARSE_ENTRY   (	0x15,		0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x16,		0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80000000,	0,		0x80000000		),	\
 	CPUID_PARSE_ENTRY   (	0x80000002,	0,		generic			),	\
@@ -199,6 +202,7 @@ struct cpuid_vendor_entry {
 	/*		   Leaf		Vendor list		    */			\
 	CPUID_VENDOR_ENTRY(0x2,		X86_VENDOR_INTEL, X86_VENDOR_CENTAUR, X86_VENDOR_ZHAOXIN),\
 	CPUID_VENDOR_ENTRY(0x4,		X86_VENDOR_INTEL, X86_VENDOR_CENTAUR, X86_VENDOR_ZHAOXIN),\
+	CPUID_VENDOR_ENTRY(0x15,	X86_VENDOR_INTEL, X86_VENDOR_CENTAUR, X86_VENDOR_ZHAOXIN),\
 	CPUID_VENDOR_ENTRY(0x16,	X86_VENDOR_INTEL),				\
 	CPUID_VENDOR_ENTRY(0x8000001d,	X86_VENDOR_AMD, X86_VENDOR_HYGON),		\
 	CPUID_VENDOR_ENTRY(0x80860000,	X86_VENDOR_TRANSMETA),				\
-- 
2.54.0

