Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4465478E5F
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983103; cv=none; b=TQYZaq4NQMyK1ZOkQqsEBhsZYbbcyBA1qgysabC0gJ2u9gL46RlUABSLhtgWfCHTprDWVioWlz/7bhD3o/yfeU9+4KASFIXpklysteiYc+Y39rsgWAGNh/n6LlvGEEzu3zQ7fc/vvy1kj4qcU8uqOheH6y+SeihgrvD3qeXRQ6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983103; c=relaxed/simple;
	bh=FtQXGMWuayRy+bH81gjDzv0tv82WzJJKn4w1Ltqp8cA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VCMw2R218nnzu3DVe3nSDkO7oIKlrqQ3gO5rakRtC6AFRvXN1aVWHRZL7krVdMkWZOSXr4mdlnPSRQ/0O+oZ4vViFHUcanFiMtWzMmE8g5z0Ae085/ugo7vAWl/u1cr1ighdZ1LeKGsxyjbU1jFLkSGSu44PxyhwipLvdGVQMAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Z1w+fIs9; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ep3BOmzc; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Z1w+fIs9";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ep3BOmzc"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7pNKAnFAGPXZWg5tzGB+nUpY+CLlCRNx39ezJ3W05Lw=;
	b=Z1w+fIs9Fk/ws4eapDknklO05NuKVGjLhDTHNJNY0eczMDaB3FbBX+iAYPGyvUtt7WIn3s
	AgRdgciIznILJZAn3Mg6DLIzcx9PiqYt1E78fAyDa1Wk/aw6fq/NdsqNCnZ0vZ+HHpW3XM
	9jbZIzeiwdO7Ogy7F1jribT+eamWJ3fdpmDfTmoHvNLRWafYBYbfXGpyAbVZzdGkYMXbO0
	WEhwy70Jwp7n2VRHemB81hU28TR3f2Dd4foa9vAKlYEM5Sw21D3yZWA2zaRReThOga0YqZ
	y7f7EnIgTr4wbdYOrqfHneA0DwW/NfG/lHME1we//KohAF7d37PsMrNfGQ/gIA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7pNKAnFAGPXZWg5tzGB+nUpY+CLlCRNx39ezJ3W05Lw=;
	b=ep3BOmzcG4IqhqrWxtA6Gj+NEq+EC4fKBPMw4k1ApljCRvOisC4UgnLjz+HDMAw2R1EV4t
	/B5I+3q/RkmXoqCw==
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
Subject: [PATCH v7 093/120] x86/cpuid: Parse CPUID(0x23)
Date: Thu, 28 May 2026 17:38:55 +0200
Message-ID: <20260528153923.403473-94-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
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
 arch/x86/include/asm/cpuid/types.h |  6 ++++++
 arch/x86/kernel/cpu/cpuid_parser.c | 33 ++++++++++++++++++++++++++++++
 arch/x86/kernel/cpu/cpuid_parser.h |  7 +++++++
 3 files changed, 46 insertions(+)

diff --git a/arch/x86/include/asm/cpuid/types.h b/arch/x86/include/asm/cpuid/types.h
index 81a84483297c..08c338909506 100644
--- a/arch/x86/include/asm/cpuid/types.h
+++ b/arch/x86/include/asm/cpuid/types.h
@@ -222,6 +222,12 @@ struct cpuid_leaves {
 	CPUID_LEAF   (  0x15,		0  );
 	CPUID_LEAF   (	0x16,		0  );
 	CPUID_LEAF   (  0x1c,		0  );
+	CPUID_LEAF   (	0x23,		0  );
+	CPUID_LEAF   (	0x23,		1  );
+	CPUID_LEAF   (	0x23,		2  );
+	CPUID_LEAF   (	0x23,		3  );
+	CPUID_LEAF   (	0x23,		4  );
+	CPUID_LEAF   (	0x23,		5  );
 	CPUID_LEAF   (  0x80000000,	0  );
 	CPUID_LEAF   (  0x80000002,	0  );
 	CPUID_LEAF   (  0x80000003,	0  );
diff --git a/arch/x86/kernel/cpu/cpuid_parser.c b/arch/x86/kernel/cpu/cpuid_parser.c
index 7ab4e01c6c33..452b5b317e4d 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.c
+++ b/arch/x86/kernel/cpu/cpuid_parser.c
@@ -97,6 +97,39 @@ cpuid_read_0x2(const struct cpuid_parse_entry *e, const struct cpuid_read_output
 	output->info->nr_entries = 1;
 }
 
+static bool cpuid_0x23_has_subleaf(u32 subleaf)
+{
+	struct leaf_0x23_0 l;
+
+	cpuid_read_subleaf(0x23, 0, &l);
+
+	switch (subleaf) {
+	case 0:		return l.subleaf_0;
+	case 1:		return l.counters_subleaf;
+	case 2:		return l.acr_subleaf;
+	case 3:		return l.events_subleaf;
+	case 4:		return l.pebs_caps_subleaf;
+	case 5:		return l.pebs_subleaf;
+	default:	return false;
+	}
+}
+
+#define define_cpuid_0x23_subleaf_read_function(subl)						\
+static void											\
+cpuid_read_0x23_##subl(const struct cpuid_parse_entry *e, const struct cpuid_read_output *output) \
+{												\
+	if (!cpuid_0x23_has_subleaf(subl))							\
+		return;										\
+												\
+	cpuid_read_generic(e, output);								\
+}
+
+define_cpuid_0x23_subleaf_read_function(1);
+define_cpuid_0x23_subleaf_read_function(2);
+define_cpuid_0x23_subleaf_read_function(3);
+define_cpuid_0x23_subleaf_read_function(4);
+define_cpuid_0x23_subleaf_read_function(5);
+
 /*
  * Shared read function for Intel CPUID(0x4) and AMD CPUID(0x8000001d), as both have
  * the same subleaf enumeration logic and register output format.
diff --git a/arch/x86/kernel/cpu/cpuid_parser.h b/arch/x86/kernel/cpu/cpuid_parser.h
index bd3c99cb985c..6767923f86d9 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.h
+++ b/arch/x86/kernel/cpu/cpuid_parser.h
@@ -156,6 +156,12 @@ struct cpuid_parse_entry {
 	CPUID_PARSE_ENTRY   (	0x15,		0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x16,		0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x1c,		0,		generic			),	\
+	CPUID_PARSE_ENTRY   (	0x23,		0,		generic			),	\
+	CPUID_PARSE_ENTRY   (	0x23,		1,		0x23_1			),	\
+	CPUID_PARSE_ENTRY   (	0x23,		2,		0x23_2			),	\
+	CPUID_PARSE_ENTRY   (	0x23,		3,		0x23_3			),	\
+	CPUID_PARSE_ENTRY   (	0x23,		4,		0x23_4			),	\
+	CPUID_PARSE_ENTRY   (	0x23,		5,		0x23_5			),	\
 	CPUID_PARSE_ENTRY   (	0x80000000,	0,		0x80000000		),	\
 	CPUID_PARSE_ENTRY   (	0x80000002,	0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80000003,	0,		generic			),	\
@@ -212,6 +218,7 @@ struct cpuid_vendor_entry {
 	CPUID_VENDOR_ENTRY(0x15,	X86_VENDOR_INTEL, X86_VENDOR_CENTAUR, X86_VENDOR_ZHAOXIN),\
 	CPUID_VENDOR_ENTRY(0x16,	X86_VENDOR_INTEL),				\
 	CPUID_VENDOR_ENTRY(0x1c,	X86_VENDOR_INTEL),				\
+	CPUID_VENDOR_ENTRY(0x23,	X86_VENDOR_INTEL),				\
 	CPUID_VENDOR_ENTRY(0x8000001d,	X86_VENDOR_AMD, X86_VENDOR_HYGON),		\
 	CPUID_VENDOR_ENTRY(0x80860000,	X86_VENDOR_TRANSMETA),				\
 	CPUID_VENDOR_ENTRY(0x80860001,	X86_VENDOR_TRANSMETA),				\
-- 
2.54.0

