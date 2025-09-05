Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F893568EB
	for <x86-cpuid@lists.linux.dev>; Fri,  5 Sep 2025 12:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757074585; cv=none; b=TxJ6Fv0IoTiwcgc0CjmeLMf9UQ18slo19juwWXAEtUs5MoQHah/sFNNqPkI9n0cDH3QjyTIGUq9S/dGG15Y5Ferc5Ql8TNlO3joJvkGZ34jn+LL7sMxgTzOZItDGwGa+qFuQGfoSUUAWiZM4gkq90m8cNCnPopXcv++d9OC7Nlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757074585; c=relaxed/simple;
	bh=ntlPdb1E3VZGfmXTiGStFiSqlOoOUklABk5cqk2+URI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IaLiK+izOd8zoz8I7PrvgO+0CbHnU33zlFHvV+F/5FJdYfH9RQjACm0QAwdsqEoqiMqaMrInTKgt+z+bI8vcTjQ9HveEFbtYVpLO1ZICnq7cxuJ0cT2A7S8geygpAaWiolHEQVkvmYGIVQHYoml1cyW2uzkKcmmFxuJqUmW+Ndo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4nbc6ioh; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZWiK/MJZ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4nbc6ioh";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZWiK/MJZ"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1757074582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=csEnnuoXzERtOr+dUZDPP1TtOCri68TRb5ODyXiAXxA=;
	b=4nbc6iohucjxeAKAKxPqO2j3cxCuUPFLCrAT1XpEutPUjLUcOSUrCe6PWlgoRkwS/uwivm
	7beD1eInnnVhK5vr2yB8bjMY+CFKoH4KhIclCo5G2Xm+s6ZUe0zlwCe0b55HnWV4un0xH2
	QsBVtKag365JeUdYXfLwfSbkiubJtuXRDnmcuPGANg8QXFpzWDs0TlqTC9bN2hg3m61Zse
	sISpVkJUm/UkEHOcuLo36jCdwcViaXYBmVHr8yZsZttuxD9VC5g2iDKDAAKdpryzFZQoY/
	Ug/r+fAl4e80yojrKnqIZ+Lz2BvOjXxMMieD725mf0NaV9BzGysORpp6zqAzAQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1757074582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=csEnnuoXzERtOr+dUZDPP1TtOCri68TRb5ODyXiAXxA=;
	b=ZWiK/MJZshNWKRSxjImkhiKy1ApCFjAnKkzA9tmMC1JuSRbgL1ij21+2cKVTNNMIerbpdB
	3f6jNYUMV94novAA==
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
Subject: [PATCH v5 20/35] x86/cpuid: Introduce parsed CPUID(0x2) API
Date: Fri,  5 Sep 2025 14:15:00 +0200
Message-ID: <20250905121515.192792-21-darwi@linutronix.de>
In-Reply-To: <20250905121515.192792-1-darwi@linutronix.de>
References: <20250905121515.192792-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new iterator macro, for_each_parsed_cpuid_0x2_desc(), for
retrieving parsed CPUID(0x2) entries as 1-byte descriptors.

Unlike the existing for_each_cpuid_0x2_desc() macro, which operates on
directly retrieved CPUID data, the new one takes its input from the
centralized CPUID parser.  That is, it is expected to be used as:

    const struct leaf_0x2_table *desc;
    const struct cpuid_regs *regs;
    u8 *ptr;

    regs = cpuid_leaf_raw(c, 0x2);	// Parsed CPUID access
    for_each_parsed_cpuid_0x2_desc(regs, ptr, desc) {
        ...
    }

which should replace the older method:

    const struct leaf_0x2_table *desc;
    union leaf_0x2_regs regs;
    u8 *ptr;

    cpuid_leaf_0x2(&regs);		// Direct CPUID access
    for_each_leaf_0x2_desc(regs, ptr, desc) {
        ...
    }

In the new macro, assert that the passed 'regs' is the same size as a
'union leaf_0x2_regs'.  This is necessary since the macro internally
casts 'regs' to that union in order to iterate over the CPUID(0x2) output
as a 1-byte array.

A size equivalence assert is used, instead of a typeof() check, to give
callers the freedom to either pass a 'struct cpuid_regs' pointer or a
'struct leaf_0x2_0' pointer, both as returned by the parsed CPUID API at
<asm/cpuid/api.h>.  That size comparison matches what other kernel CPUID
APIs do; e.g. cpuid_read() and cpuid_read_subleaf() at <asm/cpuid/api.h>.

Note, put the size equivalence check inside a GNU statement expression,
({..}), so that it can be placed inside the macro's loop initialization.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpuid/api.h | 43 ++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/x86/include/asm/cpuid/api.h b/arch/x86/include/asm/cpuid/api.h
index 7b7951b28105..58f922033ff9 100644
--- a/arch/x86/include/asm/cpuid/api.h
+++ b/arch/x86/include/asm/cpuid/api.h
@@ -564,6 +564,49 @@ static inline bool cpuid_amd_hygon_has_l3_cache(void)
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
+ *	struct cpuid_regs *regs;
+ *	u8 *ptr;
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
+	     _ptr = &((union leaf_0x2_regs *)(_regs))->desc[1];				\
+	     _ptr < &((union leaf_0x2_regs *)(_regs))->desc[16] && (_desc = &cpuid_0x2_table[*_ptr]);\
+	     _ptr++)
+
 /*
  * CPUID parser exported APIs:
  */
-- 
2.50.1

