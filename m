Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04242346E56
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774577910; cv=none; b=aWCeeYkuEjPJyFruBxJU+yhLfukypgVmzg7oCROkxRkWttP/2UXtovcHgn2MvJfOsC5M2qMajN4LcNFjLxCnVqCg7A+i3Jc7ANNr4BPpLxQ+OWqkYDWsEEn0TAk+o2+3hSTMoEFjvgi8yguTBVyXpIMd/0n1sRzFAyEBXJXanoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774577910; c=relaxed/simple;
	bh=ID92Knkf/wN2SnLzgspp/Cdht8W8Llqc2r1TF1tHcDc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CTT+r+tHa457vO6VZzRo3yqXHgpW60ZTkP0NpKVCvyC3SKhzHi/eY03VjITNCJ9tTVDSwYYp8mq7QPCThzT6+gJJFho2hc1zxBDXH/1F6lC92rH5+EvQ3OGN+4WCz3Vz79ziqVq30N0+NT0yfpVk+GKYrUQp2Zx4Zdl6CZCf59Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=LR28O06L; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=8GCcw8D8; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LR28O06L";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="8GCcw8D8"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774577907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=esKyGB1szws7rUQF8I59OLe+1fzvbCvnBNUO1TVbrzo=;
	b=LR28O06LdeQaGwr2AIZF0sT+hUjWEAPv/QTiewXz4z32Huxhr7NocEGCSbwaCS3kLGXtHZ
	v0dGCyuWaN6cYJTBqVO1Qu80Q9+K5M1JDcJ1PkHq4y/Zqf758i+RIlUOR8bTY89Jd6/eUm
	FLDD0qr2GZ8wKZ8xPmSEnNeRoxYm6VpDrAhqhTk+B3TkbXJNP/9FgEur/hjecyZUICwReZ
	rKuAjje5Jcp7i4aNsY+E8EgWk4SUI17VUS6b9ZFIDPnl3KJXQqybhIZe6iPplfd9Dxnr54
	OaAoe5c5dL/cGGI80kEc7gVLuoYcTu54uburiv/IK4Vn5LWl8DEN2ubhlBwjkA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774577907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=esKyGB1szws7rUQF8I59OLe+1fzvbCvnBNUO1TVbrzo=;
	b=8GCcw8D8AFP5XvfIs3opYx0q9GGCuY+EnSH1KaZDXdzh0euT/mmMFReFy3cViMQbzRED9u
	tEEP+V0MpXuZt2Aw==
To: Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Sean Christopherson <seanjc@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Christian Ludloff <ludloff@gmail.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>,
	x86@kernel.org,
	x86-cpuid@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	"Ahmed S. Darwish" <darwi@linutronix.de>
Subject: [PATCH v6 19/90] x86/cpuid: Parse CPUID(0x80000002) to CPUID(0x80000004)
Date: Fri, 27 Mar 2026 03:15:33 +0100
Message-ID: <20260327021645.555257-20-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add CPUID(0x80000002) => CPUID(0x80000004) support to the CPUID parser.

This allows converting their call sites to the CPUID API next.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpuid/types.h | 3 +++
 arch/x86/kernel/cpu/cpuid_parser.h | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/arch/x86/include/asm/cpuid/types.h b/arch/x86/include/asm/cpuid/types.h
index c020fb8fed59..8be2c2ba874a 100644
--- a/arch/x86/include/asm/cpuid/types.h
+++ b/arch/x86/include/asm/cpuid/types.h
@@ -207,6 +207,9 @@ struct cpuid_leaves {
 	CPUID_LEAF   (	0x0,		0  );
 	CPUID_LEAF   (	0x1,		0  );
 	CPUID_LEAF   (  0x80000000,	0  );
+	CPUID_LEAF   (  0x80000002,	0  );
+	CPUID_LEAF   (  0x80000003,	0  );
+	CPUID_LEAF   (  0x80000004,	0  );
 };
 
 /*
diff --git a/arch/x86/kernel/cpu/cpuid_parser.h b/arch/x86/kernel/cpu/cpuid_parser.h
index 7d41bde0c0ec..3e11e13fa76c 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.h
+++ b/arch/x86/kernel/cpu/cpuid_parser.h
@@ -117,5 +117,8 @@ struct cpuid_parse_entry {
 	CPUID_PARSE_ENTRY   (	0x0,		0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x1,		0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80000000,	0,		0x80000000		),	\
+	CPUID_PARSE_ENTRY   (	0x80000002,	0,		generic			),	\
+	CPUID_PARSE_ENTRY   (	0x80000003,	0,		generic			),	\
+	CPUID_PARSE_ENTRY   (	0x80000004,	0,		generic			),	\
 
 #endif /* _ARCH_X86_CPUID_PARSER_H */
-- 
2.53.0

