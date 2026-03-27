Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4C3342539
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774577959; cv=none; b=oVTYdWc2nWr+ZT6ROR3HZoSFADsMMwzU9/H0TfhetNVaqXMJHGSy8hvixWV4+M37PzayTNFKXTcsOeiR/bQS3L3rw7k6iEgMa7cTZsuD0WL9hdRMFtdYngV4WniDzeakX/dB25ok1s2qJkPqnrgFLWJn0xrP2Wxr6FXFPZffUdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774577959; c=relaxed/simple;
	bh=iQjlFScldU4IMStGVabPqPh0nbFX6tJCbXqWGmKN9Qc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iNtwob82wFuQF1Frhx+WocO1Wk+k1A0FxFvZF8zag+/cr20LCQiUysNAwToNfus2yi8Z9HfeAxY+B2ym9l4HDKakKH5AK5xdiy+8AN/NjHbBtXLscUpayUbfIiKWPVuopZV0tpIQgbpnBwC3EIQKdoQ6wSUwKWUNcKexfKYnBek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TytpIgaT; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=WOcaf13i; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TytpIgaT";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="WOcaf13i"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774577956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mvSRQqnY5eJAqQpd/YqUJyBnYGcpW3VxWZgxDKn0twk=;
	b=TytpIgaTGr31yV13RErPw/0ioN952Z6BrJyjqrl+n+WfSGKdbCR45jyXjnwM+fuwrvCL54
	Qsj0fb5l72uUltULSKdidjQJeAFZIRDxyl01LzN0atIuuwiiUtgHtLw6FZ1ysjg2aIzbLy
	x++1FSlJG1h3F41bLI74qJviP0RB3yEE8++8553IE9R73fTNS6BaHQRYm+fruMuzcvWRL3
	1mVuzgJR9O+RKlITvV11C7Eh78uOj+lJaqYmHT9O1aKbZITlhAJ7SpBBTxM4WNwcwIylRO
	bREvOgVw2QsstKDkCaMuUE87QAiaAmMabF8XRA2iqu3QJw/oLwnzDKggmoDtMg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774577956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mvSRQqnY5eJAqQpd/YqUJyBnYGcpW3VxWZgxDKn0twk=;
	b=WOcaf13iORy1nyYlWUF2RWgfcInhx8JCTCey9ABrr45KOh9W2LQTGSI9eX9ypTAMmEOxyg
	eDiH/P1te94ag4CQ==
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
Subject: [PATCH v6 32/90] x86/cpuid: Introduce parsed CPUID(0x2) API
Date: Fri, 27 Mar 2026 03:15:46 +0100
Message-ID: <20260327021645.555257-33-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
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
2.53.0

