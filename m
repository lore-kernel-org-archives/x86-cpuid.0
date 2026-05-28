Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BFA40913F
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982876; cv=none; b=oOACNq5nPpCegyd0JErSnP4s4m0wWdwOhS8+dwGqZ3v8Rt05pJF1WdHMZy3nquIdSRQgAQvXUx++b//y6GxPjXWF5q/dZjDoHabN0A/g4qKy9ptAttmwKnRrBWq4GsYz8yNJDfcMHdtoF97XpljnMNbQaWTYop4wk1pvVExrVFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982876; c=relaxed/simple;
	bh=DpgLb1QI5HapytyIpVZZuRmyECFlpNBIFtkJYJhlQMw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uGNWcBf89VHIyNpSTnjECEEa2OYBMIMB65oESeaeLB1XDe5XSp0kgX1cEhG39l2lQbuYLY26/qd83NTj+NyM/jGnGm8C0yLoxoC6khw3T7jPc8ZaGpC5lSCnXjmGmDlu+6ZxJVV55nzoX4WGdwPoISrsGDJukbUnwLYzYOTaqDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lA6O27Hy; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=/5NWM1+N; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lA6O27Hy";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="/5NWM1+N"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EI+dfaFdAQKqy0pHAjqC9zxFU8QxmQJhWZqHplFvRjk=;
	b=lA6O27HyZph/z8gFDC11YAHe/C2fxz+TYAioihKH4YWxBoOSwMqohHx4lIltQkN3I7DcZY
	dWAIq+cjVq0cEeHSff02OFZf9cqGaTJbxZzB2SSGafXjKAnwD3OjamJiyoGKOhYlT8o2mj
	q41NYPR3NWHF66ksJRuYI2wIrwTAGKKbmVpBo3yUUXdEEgtd8InWD6Ob9kNzGIyzIudopi
	WFQhROXazEOCGkdXWpgbGHt7f9si1SoWK022byjk6tHLKTUN2nDnkqRzmd1bG+kgelTcOh
	GshvqHFxKGaG/QKScK3WmH/WcVnv4GbEjOed1YLAOPVbKCNs/q+4sCfFZd+k9g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EI+dfaFdAQKqy0pHAjqC9zxFU8QxmQJhWZqHplFvRjk=;
	b=/5NWM1+NZ4LLQMfePMZK1KDIaOSfjS2kCRXTJfEflgCG2MLEqtuxeblK9FTbPEQQfKUWET
	ssWoFtdJPG0uI7Dg==
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
Subject: [PATCH v7 027/120] x86/cpuid: Introduce parsed CPUID(0x2) API
Date: Thu, 28 May 2026 17:37:49 +0200
Message-ID: <20260528153923.403473-28-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new iterator, for_each_parsed_cpuid_0x2_desc(), for retrieving parsed
CPUID(0x2) entries as 1-byte descriptors.

This new macro is aimed to replace for_each_cpuid_0x2_desc(), which
operates on directly queried CPUID data instead.

Assert that the passed "regs" are the same size as "union leaf_0x2_regs".
Use a size equivalence check, instead of a typeof() check, to give callers
the freedom to either pass a "struct cpuid_regs" pointer or a "struct
leaf_0x2_0" pointer; where both can returned by the parsed CPUID API at
<asm/cpuid/api.h>.  This size comparison matches what other kernel CPUID
APIs do; e.g. cpuid_read() and cpuid_read_subleaf() at <asm/cpuid/api.h>.

Put the size equivalence check inside a GNU statement expression, ({..})
so that it can be placed inside the macro's loop initialization.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpuid/api.h | 43 ++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/x86/include/asm/cpuid/api.h b/arch/x86/include/asm/cpuid/api.h
index 3d5a0d4918cc..a55a28e9f0f6 100644
--- a/arch/x86/include/asm/cpuid/api.h
+++ b/arch/x86/include/asm/cpuid/api.h
@@ -528,6 +528,49 @@ static inline bool cpuid_amd_hygon_has_l3_cache(void)
 	__cpuid_table_nr_filled_subleaves(&(_cpuinfo)->cpuid, _leaf, n);	\
 })
 
+/*
+ * Convenience leaf-specific functions (using parsed CPUID data):
+ */
+
+/*
+ * CPUID(0x2)
+ */
+
+/**
+ * for_each_parsed_cpuid_0x2_desc() - Iterator for parsed CPUID(0x2) descriptors
+ * @_regs:   Leaf 0x2 register output, as returned by cpuid_leaf_raw()
+ * @_ptr:  u8 pointer, for macro internal use only
+ * @_desc:  Pointer to parsed descriptor information at each iteration
+ *
+ * Loop over the 1-byte descriptors in the passed CPUID(0x2) output registers
+ * @_regs.  Provide the parsed information for each descriptor through @_desc.
+ *
+ * To handle cache-specific descriptors, switch on @_desc->c_type.  For TLB
+ * descriptors, switch on @_desc->t_type.
+ *
+ * Example usage for cache descriptors::
+ *
+ *	const struct leaf_0x2_table *desc;
+ *	const struct cpuid_regs *regs;
+ *	const u8 *ptr;
+ *
+ *	regs = cpuid_leaf_raw(c, 0x2);
+ *	if (!regs) {
+ *		// Handle error
+ *	}
+ *
+ *	for_each_parsed_cpuid_0x2_desc(regs, ptr, desc) {
+ *		switch (desc->c_type) {
+ *			...
+ *		}
+ *	}
+ */
+#define for_each_parsed_cpuid_0x2_desc(_regs, _ptr, _desc)				\
+	for (({ static_assert(sizeof(*_regs) == sizeof(union leaf_0x2_regs)); }),	\
+	     _ptr = &((const union leaf_0x2_regs *)(_regs))->desc[1];			\
+	     _ptr < &((const union leaf_0x2_regs *)(_regs))->desc[16] && (_desc = &cpuid_0x2_table[*_ptr]);\
+	     _ptr++)
+
 /*
  * CPUID parser exported APIs:
  */
-- 
2.54.0

