Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076A2352078
	for <x86-cpuid@lists.linux.dev>; Fri,  5 Sep 2025 12:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757074637; cv=none; b=uvhvb/TnR9o2NmYe3wA12PfGgWIUEIcoipEVbe4JcSXm2wX9tbC8dkFSoBJ6+MfCxGtjHIi5iZLL96/HxUlZGejU/RihEG7hXl9kJ3oKcjAfXVIWEzy2+VmiOu5hDBEcYZxsXmLFu0WxRXkxY0cBLO+Hoij3796VofH+pOyWcgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757074637; c=relaxed/simple;
	bh=B3ZOlRo5fFMzuD6Qx3/JQeHJfzMqR2rUoUm1Q5YXFnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mJ/XWI35CEUq4G7pqjBgK3MvDOhQG9bqWcMeAKxqCbumxZN9KpreaRW8+j+LQLAHvPZ+NmSX8YmfJPnkRYCJ7f4an3+W/2pcLnyIMY2OFcHUwuxQVyjufzABGbk+a6EpPgRMOF/FiR4+XTVSwgbqIobL0IyvQeNZ9fXwRDJD78k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=c8SLcA2V; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=L1RCRtHz; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="c8SLcA2V";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="L1RCRtHz"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1757074634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vFQOkiSbm6SnH6/fp3VlStcp8A1xYIN8Z2bDzSRzyo4=;
	b=c8SLcA2Vn9yihbdUw60SyqeJlr1JqXU93P990YRorlQUH6x/PEP5cl9f6QRAjJQ7LV3Nij
	O/sfVfFhb1A/IGex0xLpeIjzaruPghA7bBMRUQCM0ux/cAjfQYJ/PR5/gnnrPL4WgfQV0n
	6GLP71TCMchXOkzEQciO0SIdqDnWQ/FxPKMUc4dB8epby1GqRl2p6xCZp8ZrEXozTTxEeW
	MWG6hHrxHJ6iLEv1VCo7LAu43VokWg2q0VMvBLzV8cndGB4VKo6a9HG1b6K9dMxZfa8Y9d
	ULxsf4do12dNVWBzqeG8oBIHg+AnVw0a8mXX7Pb7yIX5e4tuAhw8eXIKSApepw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1757074634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vFQOkiSbm6SnH6/fp3VlStcp8A1xYIN8Z2bDzSRzyo4=;
	b=L1RCRtHzyW3JS7gfq28BtVFfhOQwiQw+G6r+jsC+R2nAyuVRJJVKlCss0chC811ZcsxqR0
	i4k+ecvkbGjgMaCw==
To: Borislav Petkov <bp@alien8.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Sean Christopherson <seanjc@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>,
	x86@kernel.org,
	x86-cpuid@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	"Ahmed S. Darwish" <darwi@linutronix.de>
Subject: [PATCH v5 34/35] x86/cpuid: Parse CPUID(0x16)
Date: Fri,  5 Sep 2025 14:15:14 +0200
Message-ID: <20250905121515.192792-35-darwi@linutronix.de>
In-Reply-To: <20250905121515.192792-1-darwi@linutronix.de>
References: <20250905121515.192792-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add CPUID(0x16) support to the CPUID parser.  It enumerates processor
frequency information.  Query the leaf only for Intel machines, as this
is where it is supported.

This allows converting CPUID(0x16) call sites to the new CPUID parser
APIs next.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpuid/types.h | 1 +
 arch/x86/kernel/cpu/cpuid_parser.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/x86/include/asm/cpuid/types.h b/arch/x86/include/asm/cpuid/types.h
index 5a3a365044ce..00aca54ff293 100644
--- a/arch/x86/include/asm/cpuid/types.h
+++ b/arch/x86/include/asm/cpuid/types.h
@@ -238,6 +238,7 @@ struct cpuid_leaves {
 	CPUID_LEAF   (	0x1,		0  );
 	CPUID_LEAF   (  0x2,		0  );
 	CPUID_LEAF_N (  0x4,		8  );
+	CPUID_LEAF   (	0x16,		0  );
 	CPUID_LEAF   (  0x80000000,	0  );
 	CPUID_LEAF   (  0x80000002,	0  );
 	CPUID_LEAF   (  0x80000003,	0  );
diff --git a/arch/x86/kernel/cpu/cpuid_parser.h b/arch/x86/kernel/cpu/cpuid_parser.h
index 44a056a5a321..e64ff57e08be 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.h
+++ b/arch/x86/kernel/cpu/cpuid_parser.h
@@ -141,6 +141,7 @@ struct cpuid_parse_entry {
 	/*			Leaf		Static subleaf	Reader function */		\
 	CPUID_PARSE_ENTRY   (	0x2,		0,		0x2			),	\
 	CPUID_PARSE_ENTRY_N (	0x4,				deterministic_cache	),	\
+	CPUID_PARSE_ENTRY   (	0x16,		0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80000000,	0,		0x80000000		),	\
 	CPUID_PARSE_ENTRY   (	0x80000002,	0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80000003,	0,		generic			),	\
@@ -182,6 +183,7 @@ struct cpuid_vendor_entry {
 	/*		   Leaf		Vendor list		    */			\
 	CPUID_VENDOR_ENTRY(0x2,		X86_VENDOR_INTEL, X86_VENDOR_CENTAUR, X86_VENDOR_ZHAOXIN),\
 	CPUID_VENDOR_ENTRY(0x4,		X86_VENDOR_INTEL, X86_VENDOR_CENTAUR, X86_VENDOR_ZHAOXIN),\
+	CPUID_VENDOR_ENTRY(0x16,	X86_VENDOR_INTEL),				\
 	CPUID_VENDOR_ENTRY(0x8000001d,	X86_VENDOR_AMD, X86_VENDOR_HYGON),		\
 
 #endif /* _ARCH_X86_CPUID_PARSER_H */
-- 
2.50.1

