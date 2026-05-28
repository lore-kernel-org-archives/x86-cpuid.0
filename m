Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A89043DA20
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982991; cv=none; b=GWjA4LTvYn6LW2nRCj1pjrC4TZfAWIAwWJNvYTTPZYOIK4rthJsLwE00tc/FpiEtPOSEV4IDAHXqFNgE23/i4VcaSmXtf0HQATbzB2CTMNJxUKWm7Rf+wrwK4YcYzKo79l4ggtFehYGZjuXDDnNeA3m1EQ4bOX1g88MCmmsID08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982991; c=relaxed/simple;
	bh=uhJjxP2ljnilFAbPDK/cNwgzDiQTgwEof3SscxyDo8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qtde8QJFoRV4VaeHIjx6xzXCyT+VpPOrw38FViwlD+JCU4JH2z0x2CYMtXiEWI8O2E1NrWeOg/RdI3qHNFUXwIelv2PlvVLZ7dCjjwjth1hMECEVF1UYsKwHmB4D5QOyJUlywSCxX8DGMc06OSBBqkVD9wmApiY/igaaG4I5qR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cCUBlJtO; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BGWx+l6O; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cCUBlJtO";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BGWx+l6O"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CRel2xHP5UT8l6ZG5h7n1bmUYlPE1sIeazfmiafXKJE=;
	b=cCUBlJtOLrtstwgj0LuEtJPaoCXPGtJsSOUQc0PbwUUd4IFJmE0d8iG9/d/d1EHEfm/Aus
	R42wjwnZxraoYs7slRChTXRXJSV8IZ4gfZ5daVuQ4gDA4bW5wT/v91/vl1X0G0A0phN7kn
	cv5mJ/j39d/8tZFLHoHVKMFaiasBGt+DOSEDjDLtye0rwat0vY6DOc922N/flITh9+hnSJ
	c8KgdSO6vjMHYXts4Da8hHKKpG+3tWT9NkBbYJfUcH7aOLd6pvLqp9YF/VWy3GTCjeRCtK
	scQQuHvHGtgJDg3gk6Q86qu1DS6auMakj22DYeS0cNcML/H4j7EwPn9f7AYSRQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CRel2xHP5UT8l6ZG5h7n1bmUYlPE1sIeazfmiafXKJE=;
	b=BGWx+l6OdWI6VHo7NEmXHaD3Q6vgD4L6gMLgOZ3+HEtdm9jDMFnytVe9gpL8Iw/Pz8CDNI
	TuptOwnqiE/S63BQ==
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
Subject: [PATCH v7 059/120] x86/cpuid: Parse CPUID(0x5)
Date: Thu, 28 May 2026 17:38:21 +0200
Message-ID: <20260528153923.403473-60-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Parse CPUID(0x5), CPUID_LEAF_MWAIT, so that its call sites can be converted
to the CPUID API next.

Introduce cpuid_mwait_n_substates() since its logic is required by multiple
call sits.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpuid/api.h   | 19 +++++++++++++++++++
 arch/x86/include/asm/cpuid/types.h |  1 +
 arch/x86/kernel/cpu/cpuid_parser.h |  1 +
 3 files changed, 21 insertions(+)

diff --git a/arch/x86/include/asm/cpuid/api.h b/arch/x86/include/asm/cpuid/api.h
index 611ee8596115..540f886a61cd 100644
--- a/arch/x86/include/asm/cpuid/api.h
+++ b/arch/x86/include/asm/cpuid/api.h
@@ -493,6 +493,25 @@ static inline u32 cpuid_base_hypervisor(const char *sig, u32 leaves)
 	     _ptr < &((const union leaf_0x2_regs *)(_regs))->desc[16] && (_desc = &cpuid_0x2_table[*_ptr]);\
 	     _ptr++)
 
+/*
+ * CPUID(0x5)
+ */
+
+static inline unsigned int cpuid_mwait_n_substates(const struct leaf_0x5_0 *l5, unsigned int cstate)
+{
+	switch (cstate) {
+	case 0:		return l5->n_c0_substates;
+	case 1:		return l5->n_c1_substates;
+	case 2:		return l5->n_c2_substates;
+	case 3:		return l5->n_c3_substates;
+	case 4:		return l5->n_c4_substates;
+	case 5:		return l5->n_c5_substates;
+	case 6:		return l5->n_c6_substates;
+	case 7:		return l5->n_c7_substates;
+	default:	return 0;
+	}
+}
+
 /*
  * CPUID(0x80000006)
  */
diff --git a/arch/x86/include/asm/cpuid/types.h b/arch/x86/include/asm/cpuid/types.h
index f50e54bfb514..50156e9883a3 100644
--- a/arch/x86/include/asm/cpuid/types.h
+++ b/arch/x86/include/asm/cpuid/types.h
@@ -212,6 +212,7 @@ struct cpuid_leaves {
 	CPUID_LEAF   (	0x1,		0  );
 	CPUID_LEAF   (  0x2,		0  );
 	CPUID_LEAF_N (  0x4,		8  );
+	CPUID_LEAF   (	0x5,		0  );
 	CPUID_LEAF   (	0x16,		0  );
 	CPUID_LEAF   (  0x80000000,	0  );
 	CPUID_LEAF   (  0x80000002,	0  );
diff --git a/arch/x86/kernel/cpu/cpuid_parser.h b/arch/x86/kernel/cpu/cpuid_parser.h
index ab391de03a92..3a60dad4e861 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.h
+++ b/arch/x86/kernel/cpu/cpuid_parser.h
@@ -146,6 +146,7 @@ struct cpuid_parse_entry {
 	/*			Leaf		Subleaf		Reader function */		\
 	CPUID_PARSE_ENTRY   (	0x2,		0,		0x2			),	\
 	CPUID_PARSE_ENTRY_N (	0x4,				deterministic_cache	),	\
+	CPUID_PARSE_ENTRY   (	0x5,		0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x16,		0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80000000,	0,		0x80000000		),	\
 	CPUID_PARSE_ENTRY   (	0x80000002,	0,		generic			),	\
-- 
2.54.0

