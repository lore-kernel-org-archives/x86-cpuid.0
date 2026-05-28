Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D26744D685
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983042; cv=none; b=lv7z9Fbg4AR64lRlHhY5vjQ++Kg5wpKsk8/UehOZyOrdTxcdAK1ucFiGOBUo2pgTihcV4PkrI+qRcWa3EbqwLosGWwBHuRzLGvRVPTb5ewCOw06qpQNRg+C/JHbM70gPkwfYVgRDiSkCo4e7uuBDkZ6yFv1a9+p7j/4kZ+CtMa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983042; c=relaxed/simple;
	bh=cze5oUt3gf8JtJvTP11YbawmBVVqStzReMp+ECeiR+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jo0ib3fhZzSUw+UdCKjqM7SBdI67V/Ftn7BlDmyJiNRBonUhfR5OFiTdbBr9s+1CBM9CSVu02FTUK+WGjFnsd1+t5Q3QQpNtpoYl/jOZ63zvF4QqlQkYLgD4XYH85XO5hB1cFhgsBnHbhb/6iD7wGMZbkZrFlgLbeJdY+EuggY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=YVyj2GTa; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DESAXgDX; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YVyj2GTa";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DESAXgDX"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iQ2/RpNiehvCL9CFQsul8ZFVhED1qVLMWTHYTxMGsuc=;
	b=YVyj2GTaCyRYq4yrVxtSAr4e2ewwI5AMYjglykfFUisGIE7J1Hnw9S1sBVHTjeN0zapUGM
	/ndb/b7s7MZogPN2TQ7cWAF5UDX59vrRTc34E4EP35mN7Eboubcc7eTyJFOrc1AMTPyKdn
	Y+Zclmy/29jL/pblU5bmt6Ojaq8mMvlnT9pE2R9zVwVvA7ccecaLDr1x6iF3qxG6QapcGR
	X1ISJxPD9ZnQIejRWsXZttFYbMGc1gTQTlGbWuTvJUTx2bVbQGO1Z2ncPk+plBWsrR+Adh
	dqeA7tlRYHmK0mShqNBWIDpZp3dWzNsfkj6RKyjQTioimOSa9rqkCJ/SRY2Z6g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iQ2/RpNiehvCL9CFQsul8ZFVhED1qVLMWTHYTxMGsuc=;
	b=DESAXgDXpoWPYdVCjokoByzmy1xgDge3xKmkxin5izDdZXR3w636m78GPYDpLavJ7Rz1VT
	liVunyoj+5Q04eAA==
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
Subject: [PATCH v7 075/120] x86/cpuid: Parse CPUID(0x12)
Date: Thu, 28 May 2026 17:38:37 +0200
Message-ID: <20260528153923.403473-76-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Parse CPUID(0x12).0, CPUID(0x12).1, and CPUID(0x12).n so that their call
sites can be converted to the CPUID API next.

Parse 8 subleaves for CPUID(0x12).n to match SGX_MAX_EPC_SECTIONS
definition at kernel/cpu/sgx/sgx.h.

Limit CPUID parsing to Intel x86 machines.

As stated in the hardware manuals, CPUID(0x12).0 and CPUID(0x12).1 are
valid only if CPUID(0x7).EBX.SGX is true.  Ensure that their CPUID parser
read functions follow this.

Introduce cpuid_read_sgx_epc_sections() for CPUID(0x12).n parsing where an
EPC section type of 0 (SGX_CPUID_EPC_INVALID) means an invalid EPC section
subleaf.  This matches the hardware manuals and the existing subleaf
iteration logic at kernel/cpu/sgx/main.c::sgx_page_cache_init().

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpuid/types.h |  3 +++
 arch/x86/kernel/cpu/cpuid_parser.c | 14 ++++++++++++++
 arch/x86/kernel/cpu/cpuid_parser.h |  4 ++++
 3 files changed, 21 insertions(+)

diff --git a/arch/x86/include/asm/cpuid/types.h b/arch/x86/include/asm/cpuid/types.h
index 2949584e85cc..91ed4dd3c6c2 100644
--- a/arch/x86/include/asm/cpuid/types.h
+++ b/arch/x86/include/asm/cpuid/types.h
@@ -215,6 +215,9 @@ struct cpuid_leaves {
 	CPUID_LEAF   (	0x5,		0  );
 	CPUID_LEAF   (	0x6,		0  );
 	CPUID_LEAF   (	0x9,		0  );
+	CPUID_LEAF   (	0x12,		0  );
+	CPUID_LEAF   (	0x12,		1  );
+	CPUID_LEAF_N (	0x12,		8  );
 	CPUID_LEAF   (  0x15,		0  );
 	CPUID_LEAF   (	0x16,		0  );
 	CPUID_LEAF   (  0x80000000,	0  );
diff --git a/arch/x86/kernel/cpu/cpuid_parser.c b/arch/x86/kernel/cpu/cpuid_parser.c
index f563834a082e..7ab4e01c6c33 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.c
+++ b/arch/x86/kernel/cpu/cpuid_parser.c
@@ -115,6 +115,20 @@ cpuid_read_0x9(const struct cpuid_parse_entry *e, const struct cpuid_read_output
 	cpuid_read_generic(e, output);
 }
 
+static void
+cpuid_read_0x12(const struct cpuid_parse_entry *e, const struct cpuid_read_output *output)
+{
+	struct leaf_0x7_0 l7;
+
+	cpuid_read(0x7, &l7);
+	if (!l7.sgx)
+		return;
+
+	cpuid_read_generic(e, output);
+}
+
+define_cpuid_read_function(sgx_epc_sections, leaf_0x12_n, l, l->subleaf_type == 0);
+
 /*
  * Define an extended range CPUID read function
  *
diff --git a/arch/x86/kernel/cpu/cpuid_parser.h b/arch/x86/kernel/cpu/cpuid_parser.h
index 800a7bd6dca2..d12d1c2b459b 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.h
+++ b/arch/x86/kernel/cpu/cpuid_parser.h
@@ -149,6 +149,9 @@ struct cpuid_parse_entry {
 	CPUID_PARSE_ENTRY   (	0x5,		0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x6,		0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x9,		0,		0x9			),	\
+	CPUID_PARSE_ENTRY   (	0x12,		0,		0x12			),	\
+	CPUID_PARSE_ENTRY   (	0x12,		1,		0x12			),	\
+	CPUID_PARSE_ENTRY_N (	0x12,				sgx_epc_sections	),	\
 	CPUID_PARSE_ENTRY   (	0x15,		0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x16,		0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80000000,	0,		0x80000000		),	\
@@ -202,6 +205,7 @@ struct cpuid_vendor_entry {
 	/*		   Leaf		Vendor list		    */			\
 	CPUID_VENDOR_ENTRY(0x2,		X86_VENDOR_INTEL, X86_VENDOR_CENTAUR, X86_VENDOR_ZHAOXIN),\
 	CPUID_VENDOR_ENTRY(0x4,		X86_VENDOR_INTEL, X86_VENDOR_CENTAUR, X86_VENDOR_ZHAOXIN),\
+	CPUID_VENDOR_ENTRY(0x12,	X86_VENDOR_INTEL),				\
 	CPUID_VENDOR_ENTRY(0x15,	X86_VENDOR_INTEL, X86_VENDOR_CENTAUR, X86_VENDOR_ZHAOXIN),\
 	CPUID_VENDOR_ENTRY(0x16,	X86_VENDOR_INTEL),				\
 	CPUID_VENDOR_ENTRY(0x8000001d,	X86_VENDOR_AMD, X86_VENDOR_HYGON),		\
-- 
2.54.0

