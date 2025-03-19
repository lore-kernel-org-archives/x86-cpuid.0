Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0047A2571C9
	for <x86-cpuid@lists.linux.dev>; Wed, 19 Mar 2025 12:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742386967; cv=none; b=fuJFoHX2g30dyDACV/XizkL5Tb6dxlopuPQWZCaGXiMKN5WYGLyOeHILkWJVJjexYS8DG6Nv/brPexCUr/gvctyFApypxGZjrPG5KulFDAcp8WvZXt5m5An5bXckIwPYWZNlJRZ3zo0ML88bSBN4aMafG/VDhDZZ71HbLnVoQsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742386967; c=relaxed/simple;
	bh=qpujk5hg4CvNJIdMcwYSj/OpC+5m48G6K2q4yWyS4wc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u5FuzhYikronIr8Cc4mU3GBL0d2/8R251D0NxGxEm3242O43zFehmhz3cwYr5QclabYWIwb/dh0NnqhU6dkWFf+Oy1dVE9isoE+lQ+BazrgHQTFgYet8GILSGgu0+JqlFAFHyivrdU8CsUxTRBevL/Fv4s6t49HJTLGik8mOKOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=w8nNf2u7; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kN2WZISo; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="w8nNf2u7";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kN2WZISo"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1742386962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LzZb8QZvQtSwW+L1cshEDC7N7oXLYfPopw4pUfO7Ik4=;
	b=w8nNf2u7bHj4s/hvZTQrKXtAgwVThkrHBBmdm1bm5d7yMQHB4CXfvpXGTqLQOQyxWckYTA
	WXKBbc3m0UHstWgFUdFd7E6EgAE2XC8j/qbnpfufMdoyoTs7To/gOue2p4WBDTcRonz8Gx
	ZHJoGJjtv4S2La76FayeBfxNk3WWMjXrBzAyQjtnNqRhRATptlTz6IKRq5EaV3CCYbUdgy
	GwT+Id/RQl/lPASO8i0hNRhXUt4PLoQzUL029FbDIOBWNrAg85Vckws5nwtfLd3yy/o7+1
	9VnaHDvCJQn4+sCjEFVCPa/eCvjD9Wc4KrrKzRc4NGvLCL1daxV4J0cVcCiE+w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1742386962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LzZb8QZvQtSwW+L1cshEDC7N7oXLYfPopw4pUfO7Ik4=;
	b=kN2WZISoUs3KkRtuXHxK8tCNw8d+IfQMRjMnDZO/NPnuIQQO+Ga3MYpBiFYbWiaCtOW4Qz
	s/zZ+10tJjNxZUDA==
To: Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>,
	x86@kernel.org,
	x86-cpuid@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	"Ahmed S. Darwish" <darwi@linutronix.de>
Subject: [PATCH v3 19/29] x86/cpu: Use enums for TLB descriptor types
Date: Wed, 19 Mar 2025 13:21:27 +0100
Message-ID: <20250319122137.4004-20-darwi@linutronix.de>
In-Reply-To: <20250319122137.4004-1-darwi@linutronix.de>
References: <20250319122137.4004-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The leaf 0x2 one-byte TLB descriptor types:

	TLB_INST_4K
	TLB_INST_4M
	TLB_INST_2M_4M
	...

are just discriminators to be used within the intel_tlb_table[] mapping.
Their specific values are irrelevant.

Use enums for such types.

Make the enum packed and static assert that its values remain within a
single byte so that the intel_tlb_table[] size do not go out of hand.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpuid/types.h | 29 +++++++++++++++++++++++++++++
 arch/x86/kernel/cpu/intel.c        | 28 +++-------------------------
 2 files changed, 32 insertions(+), 25 deletions(-)

diff --git a/arch/x86/include/asm/cpuid/types.h b/arch/x86/include/asm/cpuid/types.h
index bbbd0bccfce5..0c07df192749 100644
--- a/arch/x86/include/asm/cpuid/types.h
+++ b/arch/x86/include/asm/cpuid/types.h
@@ -58,4 +58,33 @@ enum _cache_table_type {
 } __packed;
 static_assert(sizeof(enum _cache_table_type) == 1);
 
+/*
+ * Leaf 0x2 1-byte descriptors' TLB types
+ * To be used for their mappings at intel_tlb_table[]
+ *
+ * Start at 1 since type 0 is reserved for HW byte descriptors which are
+ * not recognized by the kernel; i.e., those without an explicit mapping.
+ */
+enum _tlb_table_type {
+	TLB_INST_4K		= 1,
+	TLB_INST_4M,
+	TLB_INST_2M_4M,
+	TLB_INST_ALL,
+
+	TLB_DATA_4K,
+	TLB_DATA_4M,
+	TLB_DATA_2M_4M,
+	TLB_DATA_4K_4M,
+	TLB_DATA_1G,
+	TLB_DATA_1G_2M_4M,
+
+	TLB_DATA0_4K,
+	TLB_DATA0_4M,
+	TLB_DATA0_2M_4M,
+
+	STLB_4K,
+	STLB_4K_2M,
+} __packed;
+static_assert(sizeof(enum _tlb_table_type) == 1);
+
 #endif /* _ASM_X86_CPUID_TYPES_H */
diff --git a/arch/x86/kernel/cpu/intel.c b/arch/x86/kernel/cpu/intel.c
index aeb7d6d48379..def433e0081f 100644
--- a/arch/x86/kernel/cpu/intel.c
+++ b/arch/x86/kernel/cpu/intel.c
@@ -626,28 +626,6 @@ static unsigned int intel_size_cache(struct cpuinfo_x86 *c, unsigned int size)
 }
 #endif
 
-#define TLB_INST_4K		0x01
-#define TLB_INST_4M		0x02
-#define TLB_INST_2M_4M		0x03
-
-#define TLB_INST_ALL		0x05
-#define TLB_INST_1G		0x06
-
-#define TLB_DATA_4K		0x11
-#define TLB_DATA_4M		0x12
-#define TLB_DATA_2M_4M		0x13
-#define TLB_DATA_4K_4M		0x14
-
-#define TLB_DATA_1G		0x16
-#define TLB_DATA_1G_2M_4M	0x17
-
-#define TLB_DATA0_4K		0x21
-#define TLB_DATA0_4M		0x22
-#define TLB_DATA0_2M_4M		0x23
-
-#define STLB_4K			0x41
-#define STLB_4K_2M		0x42
-
 /*
  * All of leaf 0x2's one-byte TLB descriptors implies the same number of
  * entries for their respective TLB types.  The 0x63 descriptor is an
@@ -660,7 +638,7 @@ static unsigned int intel_size_cache(struct cpuinfo_x86 *c, unsigned int size)
 
 struct _tlb_table {
 	unsigned char descriptor;
-	char tlb_type;
+	enum _tlb_table_type type;
 	unsigned int entries;
 };
 
@@ -718,11 +696,11 @@ static void intel_tlb_lookup(const unsigned char desc)
 	     intel_tlb_table[k].descriptor != 0; k++)
 		;
 
-	if (intel_tlb_table[k].tlb_type == 0)
+	if (intel_tlb_table[k].type == 0)
 		return;
 
 	entries = intel_tlb_table[k].entries;
-	switch (intel_tlb_table[k].tlb_type) {
+	switch (intel_tlb_table[k].type) {
 	case STLB_4K:
 		tlb_lli_4k = max(tlb_lli_4k, entries);
 		tlb_lld_4k = max(tlb_lld_4k, entries);
-- 
2.48.1

