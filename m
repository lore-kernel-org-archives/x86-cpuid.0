Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2873835F5E8
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774577971; cv=none; b=gmxUQvJZrN/DrU2RTmTszxpnB/4MmbzEuGkl8H54FIa3ccfAwFggGKZvQm5cDAvWUvv7NrwOrrw4Z8oVOclyg/RTGx1EO2jpmYc9oKw0ssloVClMmN9nxcaurpTyQfp2dUf/rTkle2P1QgYrC27xZiqvx9LytpjJ5ZEKc16XnWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774577971; c=relaxed/simple;
	bh=RULpbLxbNlVq+EeoLY3yYwrqWKJmNS5WOIz/wcF3fm0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b2D4EJAow4YJL9mRslpeDzdySnkULNJxUyM6iHABTdA1ixpp8i9PUhGJrzs006RWME3GiY6wWCJQheVqO4CjXmTQ/ilC2xPChdR8i/B9We5sGxbzCNoY9cV342oJXRTgjlpswDE1TcbgbEaiRRsZxqoyEsifFLtWLvHfSIqRGh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nUtVKlUQ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OrnsmqDZ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nUtVKlUQ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OrnsmqDZ"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774577967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sHpJLAcOnOF0ZFw62U1gI+XJHrjztCQBbGrsdL17gw8=;
	b=nUtVKlUQ2uyrZUmJTZdiZ9H1+Yzou0pSn+rs74P6cYnTDudd1v3BdM+FoaK0YZXkCPxAad
	ahu7XF+uijRocMSGVm4QEcYiyDTFkWWYsnJG5+NQBv92JZzoz0DLTacTPr7XSkBt4sTAHU
	2kIU9dfWBYwhxXmKwVJqIvb7Zc8mQDaROPNiV4inYhGSfUUBKXYJA0d60Uh/RYeDYDdKQU
	4IdPMuc3JPZAwGjgwM0dRPRXoq+ArDfft6tY4IKYVBIVA08YCt12BmEU1LpniGpy02nBrI
	6kTp2dZbSiG6M+pibPK6jEZMVaYf9W6bQJrNhr35fapuz8ewf8ohRsJ8+wzHEg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774577967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sHpJLAcOnOF0ZFw62U1gI+XJHrjztCQBbGrsdL17gw8=;
	b=OrnsmqDZb8qoBfqmz1MuF4eSc85Zl1DsVk6AuRRij+o0WoHGmmGPv9jlcKMLrvL9wV4hsh
	aNQGNVaHX+gePfCg==
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
Subject: [PATCH v6 35/90] x86/cpuid: Remove direct CPUID(0x2) query helpers
Date: Fri, 27 Mar 2026 03:15:49 +0100
Message-ID: <20260327021645.555257-36-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All call sites at x86/cpu and x86/cacheinfo have been converted from
directly invoking CPUID(0x2) queries to parsed CPUID access.

Remove the direct CPUID(0x2) query helpers

    cpuid_leaf_0x2()
    for_each_cpuid_0x2_desc()

And rename the parsed CPUID(0x2) iterator macro

    for_each_parsed_cpuid_0x2_desc()

back to

    for_each_cpuid_0x2_desc()

since by now only parsed CPUID(0x2) access is allowed.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpuid/api.h | 75 ++------------------------------
 arch/x86/kernel/cpu/cacheinfo.c  |  2 +-
 arch/x86/kernel/cpu/intel.c      |  2 +-
 3 files changed, 5 insertions(+), 74 deletions(-)

diff --git a/arch/x86/include/asm/cpuid/api.h b/arch/x86/include/asm/cpuid/api.h
index a55a28e9f0f6..f4bdfe3c9325 100644
--- a/arch/x86/include/asm/cpuid/api.h
+++ b/arch/x86/include/asm/cpuid/api.h
@@ -212,75 +212,6 @@ static inline u32 cpuid_base_hypervisor(const char *sig, u32 leaves)
 	return 0;
 }
 
-/*
- * CPUID(0x2) parsing:
- */
-
-/**
- * cpuid_leaf_0x2() - Return sanitized CPUID(0x2) register output
- * @regs:	Output parameter
- *
- * Query CPUID(0x2) and store its output in @regs.  Force set any
- * invalid 1-byte descriptor returned by the hardware to zero (the NULL
- * cache/TLB descriptor) before returning it to the caller.
- *
- * Use for_each_cpuid_0x2_desc() to iterate over the register output in
- * parsed form.
- */
-static inline void cpuid_leaf_0x2(union leaf_0x2_regs *regs)
-{
-	cpuid_read(0x2, regs);
-
-	/*
-	 * All Intel CPUs must report an iteration count of 1.	In case
-	 * of bogus hardware, treat all returned descriptors as NULL.
-	 */
-	if (regs->desc[0] != 0x01) {
-		for (int i = 0; i < 4; i++)
-			regs->regv[i] = 0;
-		return;
-	}
-
-	/*
-	 * The most significant bit (MSB) of each register must be clear.
-	 * If a register is invalid, replace its descriptors with NULL.
-	 */
-	for (int i = 0; i < 4; i++) {
-		if (regs->reg[i].invalid)
-			regs->regv[i] = 0;
-	}
-}
-
-/**
- * for_each_cpuid_0x2_desc() - Iterator for parsed CPUID(0x2) descriptors
- * @_regs:	CPUID(0x2) register output, as returned by cpuid_leaf_0x2()
- * @_ptr:	u8 pointer, for macro internal use only
- * @_desc:	Pointer to the parsed CPUID(0x2) descriptor at each iteration
- *
- * Loop over the 1-byte descriptors in the passed CPUID(0x2) output registers
- * @_regs.  Provide the parsed information for each descriptor through @_desc.
- *
- * To handle cache-specific descriptors, switch on @_desc->c_type.  For TLB
- * descriptors, switch on @_desc->t_type.
- *
- * Example usage for cache descriptors::
- *
- *	const struct leaf_0x2_table *desc;
- *	union leaf_0x2_regs regs;
- *	u8 *ptr;
- *
- *	cpuid_leaf_0x2(&regs);
- *	for_each_cpuid_0x2_desc(regs, ptr, desc) {
- *		switch (desc->c_type) {
- *			...
- *		}
- *	}
- */
-#define for_each_cpuid_0x2_desc(_regs, _ptr, _desc)				\
-	for (_ptr = &(_regs).desc[1];						\
-	     _ptr < &(_regs).desc[16] && (_desc = &cpuid_0x2_table[*_ptr]);	\
-	     _ptr++)
-
 /*
  * CPUID(0x80000006) parsing:
  */
@@ -537,7 +468,7 @@ static inline bool cpuid_amd_hygon_has_l3_cache(void)
  */
 
 /**
- * for_each_parsed_cpuid_0x2_desc() - Iterator for parsed CPUID(0x2) descriptors
+ * for_each_cpuid_0x2_desc() - Iterator for parsed CPUID(0x2) descriptors
  * @_regs:   Leaf 0x2 register output, as returned by cpuid_leaf_raw()
  * @_ptr:  u8 pointer, for macro internal use only
  * @_desc:  Pointer to parsed descriptor information at each iteration
@@ -559,13 +490,13 @@ static inline bool cpuid_amd_hygon_has_l3_cache(void)
  *		// Handle error
  *	}
  *
- *	for_each_parsed_cpuid_0x2_desc(regs, ptr, desc) {
+ *	for_each_cpuid_0x2_desc(regs, ptr, desc) {
  *		switch (desc->c_type) {
  *			...
  *		}
  *	}
  */
-#define for_each_parsed_cpuid_0x2_desc(_regs, _ptr, _desc)				\
+#define for_each_cpuid_0x2_desc(_regs, _ptr, _desc)					\
 	for (({ static_assert(sizeof(*_regs) == sizeof(union leaf_0x2_regs)); }),	\
 	     _ptr = &((const union leaf_0x2_regs *)(_regs))->desc[1];			\
 	     _ptr < &((const union leaf_0x2_regs *)(_regs))->desc[16] && (_desc = &cpuid_0x2_table[*_ptr]);\
diff --git a/arch/x86/kernel/cpu/cacheinfo.c b/arch/x86/kernel/cpu/cacheinfo.c
index 6fded356f2ee..d933d58a5a61 100644
--- a/arch/x86/kernel/cpu/cacheinfo.c
+++ b/arch/x86/kernel/cpu/cacheinfo.c
@@ -398,7 +398,7 @@ static void intel_cacheinfo_0x2(struct cpuinfo_x86 *c)
 	if (!regs)
 		return;
 
-	for_each_parsed_cpuid_0x2_desc(regs, ptr, desc) {
+	for_each_cpuid_0x2_desc(regs, ptr, desc) {
 		switch (desc->c_type) {
 		case CACHE_L1_INST:	l1i += desc->c_size; break;
 		case CACHE_L1_DATA:	l1d += desc->c_size; break;
diff --git a/arch/x86/kernel/cpu/intel.c b/arch/x86/kernel/cpu/intel.c
index cad66ca14ca4..615e3a4872b7 100644
--- a/arch/x86/kernel/cpu/intel.c
+++ b/arch/x86/kernel/cpu/intel.c
@@ -729,7 +729,7 @@ static void intel_detect_tlb(struct cpuinfo_x86 *c)
 	if (!regs)
 		return;
 
-	for_each_parsed_cpuid_0x2_desc(regs, ptr, desc)
+	for_each_cpuid_0x2_desc(regs, ptr, desc)
 		intel_tlb_lookup(desc);
 }
 
-- 
2.53.0

