Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461753368B6
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774577989; cv=none; b=m0pVWh5v7XkKUL20RWXY9rQuXJEKp0HJJSAvzLCj8kYANS3UDxnptgoLXJO1eWDbygfG8VJiRhRS4IHsKMyM9RBxyMd7zU9Lw2ZOWj5viPHhHW0nGvzdXWEPk+jjOs4aCZtvwPm459hvUrIr2TkVJRkYGEvjr5V3T5fpuCTQ3Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774577989; c=relaxed/simple;
	bh=Mg0312Sjj5B5aPUD/dSROadTJqH74lwwxx90Wx2mCfY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cQI6H62okLJ1cW0wAWNj/jIU58Uo1kt6D+8F9ujgoylQCfComaNu0MhiBFvQjPHuAl04q65SlHXgGWWjjM2Z2IYACChy2e0ctVRz5kIS0IV5NrONxMHuP+hXiCReak65oOetgZvCI8aKWUzrCTobdVlmXCzXIcIZd6Ce+XbajSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JWzY/xgL; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=77/Uhcdw; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JWzY/xgL";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="77/Uhcdw"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774577984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+hBF4aTTymr1LkEYzIGvqtd26Y7rGj/7KtDZu4O/d/U=;
	b=JWzY/xgLDGTtdRrVQUEnJKftMyxjsYeWtSDq33e0QhrZub+KoDw1G1mAHF5btY+IbYX9D9
	dqBr/6FCEbrVDiXl4uvo2vqosa/5quwO5WePVeUAXp0c1oWZlCkquS1dwnrepBVWFdPqqm
	O91RiLrHBUg5U7q8jogXzrcRDu7FxXniTN4o5nbsOdVDOr4ErM1PtpHkze7j3Au9ZXFixs
	/24CcdQ+PYBCJVi/nKgBMLZfe/zVBrk7wJ8iSFvNhpNG60YqVRipE1LGosFEh2knb6DN0Q
	ICWonyrZb7VBvfj38SeaN/SWMbkA+7XfEAALx819BaBckG7wStVKoQASrEmzYA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774577984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+hBF4aTTymr1LkEYzIGvqtd26Y7rGj/7KtDZu4O/d/U=;
	b=77/UhcdwctMpCtopo3xrWB1mzb5Qwh1JrNlF8hYFvv2bC2L1lrk4erzmLzJp6u+Pq+bXsU
	QToe87pFAzuMXCDg==
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
Subject: [PATCH v6 40/90] x86/cpuid: Parse CPUID(0x80000005), CPUID(0x80000006), CPUID(0x80000008)
Date: Fri, 27 Mar 2026 03:15:54 +0100
Message-ID: <20260327021645.555257-41-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Parse AMD cacheinfo CPUID(0x80000005) and CPUID(0x80000006).

Also parse the CPU capacity parameters at CPUID(0x80000008).

This allows converting their call sites to parsed CPUID access instead of
issuing CPUID queries.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpuid/types.h | 3 +++
 arch/x86/kernel/cpu/cpuid_parser.h | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/arch/x86/include/asm/cpuid/types.h b/arch/x86/include/asm/cpuid/types.h
index f77659303569..f50e54bfb514 100644
--- a/arch/x86/include/asm/cpuid/types.h
+++ b/arch/x86/include/asm/cpuid/types.h
@@ -217,6 +217,9 @@ struct cpuid_leaves {
 	CPUID_LEAF   (  0x80000002,	0  );
 	CPUID_LEAF   (  0x80000003,	0  );
 	CPUID_LEAF   (  0x80000004,	0  );
+	CPUID_LEAF   (  0x80000005,	0  );
+	CPUID_LEAF   (  0x80000006,	0  );
+	CPUID_LEAF   (  0x80000008,	0  );
 	CPUID_LEAF_N (  0x8000001d,	8  );
 	CPUID_LEAF   (  0x80860000,	0  );
 	CPUID_LEAF   (  0x80860001,	0  );
diff --git a/arch/x86/kernel/cpu/cpuid_parser.h b/arch/x86/kernel/cpu/cpuid_parser.h
index 25ca9b19e8cf..ab391de03a92 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.h
+++ b/arch/x86/kernel/cpu/cpuid_parser.h
@@ -151,6 +151,9 @@ struct cpuid_parse_entry {
 	CPUID_PARSE_ENTRY   (	0x80000002,	0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80000003,	0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80000004,	0,		generic			),	\
+	CPUID_PARSE_ENTRY   (	0x80000005,	0,		generic			),	\
+	CPUID_PARSE_ENTRY   (	0x80000006,	0,		generic			),	\
+	CPUID_PARSE_ENTRY   (	0x80000008,	0,		generic			),	\
 	CPUID_PARSE_ENTRY_N (	0x8000001d,			deterministic_cache	),	\
 	CPUID_PARSE_ENTRY   (	0x80860000,	0,		0x80860000		),	\
 	CPUID_PARSE_ENTRY   (	0x80860001,	0,		generic			),	\
-- 
2.53.0

