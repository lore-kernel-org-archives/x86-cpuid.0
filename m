Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87DF46AF34
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983059; cv=none; b=XldAEw+g/wYANqbMXNuwjYoIYWm6TB0qrMAa5Hj+7krsqc1P3xoDmnee+OSGxIJGteRMrC5c1dgKFdv6EGAZpwQ8DsK3lh5NZXQQvbq1fOuoVBLgFnRcTVCbtxunJ0zBWBRQnTc/du1xBnWsi84dVu+ixmqR95cvKi6wKByc/AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983059; c=relaxed/simple;
	bh=atExEPaQj5VXLbdz4SrCXstPUfhb09Qy2BnQQU7ah/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uBoZCnB1DznZPzSviyqbZSXw9KV2e1dWlekh/mqoMIau516K/ItDiRxmID93yTRshBElXwKjkXyxmmPiFrIBON2bA8G3r9KWjYsK6R8sUZw/YWaqWpk3pPP73C/1QPAFIo7rbN5lMgJ8A0X1IrwyZkZ46epsuIem75A8/VVO2Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=EyqrT+dq; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=aXINI3gb; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EyqrT+dq";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="aXINI3gb"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N9JR8+Kh5H+k9Y6c85wbZ8l/7PBM9jCXslxVh27Smj0=;
	b=EyqrT+dqj7oTb60EEz2qLN/bNR6ESTVOVqIjOlBhPo14aq0xpJxanTbz0YdzsKr6wRasv6
	Qj0T1deHXQJvokaQYiIjFQKbua6z4GgjbKgbpDUz+BNJ1GeOY0kDYMI1/rnVLD8yo47HRp
	kBX+hM9YQKuRNCwrPWuWXXupj9/oivjYntx0VbzRQeR8wrsRYrSwsV/c6TpdgC1jI6fGR4
	iHRhOkKrVP7iEKsHfHa3n6Lw1sm8xnMpGp4sLAnivrNflT51oXQP/oVTk61CpJSrYAiQlm
	To0PC5Q6AR0rjBrx7ZPyfbfRFyFN3oiZtZyoD8V/LfLzWrBzQogvF59vZbaevA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N9JR8+Kh5H+k9Y6c85wbZ8l/7PBM9jCXslxVh27Smj0=;
	b=aXINI3gbkfcXEBsVDAGMG71GAeT1y9fq7SzpOczoey20UaSiP0gAkYQ72+nj84iRCgiGSz
	0KeP8+TfHup1BKAw==
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
Subject: [PATCH v7 081/120] x86/cpuid: Parse CPUID(0xa) and CPUID(0x1c)
Date: Thu, 28 May 2026 17:38:43 +0200
Message-ID: <20260528153923.403473-82-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Parse CPUID(0xa) and CPUID(0x1c).

This allows their call sites to be converted to the CPUID APIs next.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpuid/types.h | 2 ++
 arch/x86/kernel/cpu/cpuid_parser.h | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/arch/x86/include/asm/cpuid/types.h b/arch/x86/include/asm/cpuid/types.h
index 91ed4dd3c6c2..81a84483297c 100644
--- a/arch/x86/include/asm/cpuid/types.h
+++ b/arch/x86/include/asm/cpuid/types.h
@@ -215,11 +215,13 @@ struct cpuid_leaves {
 	CPUID_LEAF   (	0x5,		0  );
 	CPUID_LEAF   (	0x6,		0  );
 	CPUID_LEAF   (	0x9,		0  );
+	CPUID_LEAF   (  0xa,		0  );
 	CPUID_LEAF   (	0x12,		0  );
 	CPUID_LEAF   (	0x12,		1  );
 	CPUID_LEAF_N (	0x12,		8  );
 	CPUID_LEAF   (  0x15,		0  );
 	CPUID_LEAF   (	0x16,		0  );
+	CPUID_LEAF   (  0x1c,		0  );
 	CPUID_LEAF   (  0x80000000,	0  );
 	CPUID_LEAF   (  0x80000002,	0  );
 	CPUID_LEAF   (  0x80000003,	0  );
diff --git a/arch/x86/kernel/cpu/cpuid_parser.h b/arch/x86/kernel/cpu/cpuid_parser.h
index d12d1c2b459b..bd3c99cb985c 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.h
+++ b/arch/x86/kernel/cpu/cpuid_parser.h
@@ -149,11 +149,13 @@ struct cpuid_parse_entry {
 	CPUID_PARSE_ENTRY   (	0x5,		0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x6,		0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x9,		0,		0x9			),	\
+	CPUID_PARSE_ENTRY   (	0xa,		0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x12,		0,		0x12			),	\
 	CPUID_PARSE_ENTRY   (	0x12,		1,		0x12			),	\
 	CPUID_PARSE_ENTRY_N (	0x12,				sgx_epc_sections	),	\
 	CPUID_PARSE_ENTRY   (	0x15,		0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x16,		0,		generic			),	\
+	CPUID_PARSE_ENTRY   (	0x1c,		0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80000000,	0,		0x80000000		),	\
 	CPUID_PARSE_ENTRY   (	0x80000002,	0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80000003,	0,		generic			),	\
@@ -205,9 +207,11 @@ struct cpuid_vendor_entry {
 	/*		   Leaf		Vendor list		    */			\
 	CPUID_VENDOR_ENTRY(0x2,		X86_VENDOR_INTEL, X86_VENDOR_CENTAUR, X86_VENDOR_ZHAOXIN),\
 	CPUID_VENDOR_ENTRY(0x4,		X86_VENDOR_INTEL, X86_VENDOR_CENTAUR, X86_VENDOR_ZHAOXIN),\
+	CPUID_VENDOR_ENTRY(0xa,		X86_VENDOR_INTEL, X86_VENDOR_CENTAUR, X86_VENDOR_ZHAOXIN),\
 	CPUID_VENDOR_ENTRY(0x12,	X86_VENDOR_INTEL),				\
 	CPUID_VENDOR_ENTRY(0x15,	X86_VENDOR_INTEL, X86_VENDOR_CENTAUR, X86_VENDOR_ZHAOXIN),\
 	CPUID_VENDOR_ENTRY(0x16,	X86_VENDOR_INTEL),				\
+	CPUID_VENDOR_ENTRY(0x1c,	X86_VENDOR_INTEL),				\
 	CPUID_VENDOR_ENTRY(0x8000001d,	X86_VENDOR_AMD, X86_VENDOR_HYGON),		\
 	CPUID_VENDOR_ENTRY(0x80860000,	X86_VENDOR_TRANSMETA),				\
 	CPUID_VENDOR_ENTRY(0x80860001,	X86_VENDOR_TRANSMETA),				\
-- 
2.54.0

