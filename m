Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380C33624C6
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774577983; cv=none; b=gKjs5/qh81EHcXzWUkYXvWNt8lVvfqNTgc32meJk4varHiXN4Mp9yEIPRa7ZxvBvIN09faQiIuTzJ1Gk9Nb788XfZEcn0Au8f1h3WRal8+S0VFMcr3cgBdGCfbXR1UEsK+RyfOemyIgTScuCGYYigf4UuSVQEOo6FzJjReVVDwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774577983; c=relaxed/simple;
	bh=+W8t9MbaCWeef3NcK6ju2iq4pIm/CcMbPvUthPR09K8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pbGGT4hC/N/51/Z/i7PdN9vod6qpwmAgkdPi3uT59MhZkLdE9Ba5JI/kCAHpiYzsaiutJKboZnm7tq9qGWaLRiUMD8urWyX6lA1xrkZRHk+JRu5FjkpPBjwybsgbnIEqihMvEtT87HFfruoWLn2qNQ0O4e65unVjt5lReW+MCtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Xjx2tWop; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=XKSdKuIg; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Xjx2tWop";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="XKSdKuIg"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774577980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AmGDXH4djNB2zb29lHnG3L22XKvURrEeZsQJFjV31DA=;
	b=Xjx2tWopI8WzLL2dlxGbUMqWg/nUVGfZ1maadnynjy4EIHPthWGIgyYHaEOhYS6z2dyUOA
	dKd8IAERl7ugirask1XxZBSivuMso1xXDH3U4b//j6QDT8odSgw4gVbuBHyoRqSB959mWi
	vBD4+BXvTX/Gs7pCG2ShSlBaAZSOJkGyp1c97SGGtmhetIlf9ZohAYzZY9LVhnUcOz9P88
	mb3k3i65JoZJVs/qe7iaRlRSao9PQabLnUoa8DVhmEB7KvzPDCssW/sjCOjsE4woG5hc/D
	BmbkLTlwDPGkNKM/fg1goX8Ed+2R4aXtsWMqzXk2rYBZmrvodJEmpWz/SRr23g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774577980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AmGDXH4djNB2zb29lHnG3L22XKvURrEeZsQJFjV31DA=;
	b=XKSdKuIgfdPAQjCoDH/1ISdnpbcilacoAKSuOGrgwyZB7VKzTOeudA5wbp7bYNKa8Qvp3y
	/kXRgL3w8L9KBECg==
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
Subject: [PATCH v6 39/90] x86/cacheinfo: Use parsed CPUID(0x8000001d)
Date: Fri, 27 Mar 2026 03:15:53 +0100
Message-ID: <20260327021645.555257-40-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For AMD cacheinfo, use parsed CPUID(0x8000001d) instead of CPUID queries.

Beside the CPUID parser centralization benefits, this allows using the
auto-generated x86-cpuid-db data types, and their C99 bitfields, instead of
doing ugly bitwise operations on the CPUID output.

Trickle down a 'struct cpuinfo_x86' reference to the relevant functions as
the CPUID APIs require it.

Use the parsed CPUID API

    cpuid_subleaf_count(c, 0x8000001d)

instead of calling amd_find_num_cache_leaves() and its direct CPUID
queries.  Remove the latter function as it is no longer used.

Keep using the 'union _cpuid4_leaf_eax/ebx/ecx' data types as they are
required by the AMD CPUID(0x4) emulation code.  A follow up commit will
replace them with their auto-generated x86-cpuid-db equivalents.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/cacheinfo.c | 41 +++++++++++++--------------------
 1 file changed, 16 insertions(+), 25 deletions(-)

diff --git a/arch/x86/kernel/cpu/cacheinfo.c b/arch/x86/kernel/cpu/cacheinfo.c
index 91020f85c000..86a8e1dad935 100644
--- a/arch/x86/kernel/cpu/cacheinfo.c
+++ b/arch/x86/kernel/cpu/cacheinfo.c
@@ -237,16 +237,22 @@ static int cpuid4_info_fill_done(struct _cpuid4_info *id4, union _cpuid4_leaf_ea
 	return 0;
 }
 
-static int amd_fill_cpuid4_info(int index, struct _cpuid4_info *id4)
+static int amd_fill_cpuid4_info(struct cpuinfo_x86 *c, int index, struct _cpuid4_info *id4)
 {
 	union _cpuid4_leaf_eax eax;
 	union _cpuid4_leaf_ebx ebx;
 	union _cpuid4_leaf_ecx ecx;
-	u32 ignored;
 
-	if (boot_cpu_has(X86_FEATURE_TOPOEXT) || boot_cpu_data.x86_vendor == X86_VENDOR_HYGON)
-		cpuid_count(0x8000001d, index, &eax.full, &ebx.full, &ecx.full, &ignored);
-	else
+	if (boot_cpu_has(X86_FEATURE_TOPOEXT) || boot_cpu_data.x86_vendor == X86_VENDOR_HYGON) {
+		const struct cpuid_regs *regs = cpuid_subleaf_n_raw(c, 0x8000001d, index);
+
+		if (!regs)
+			return -EIO;
+
+		eax.full = regs->eax;
+		ebx.full = regs->ebx;
+		ecx.full = regs->ecx;
+	} else
 		legacy_amd_cpuid4(index, &eax, &ebx, &ecx);
 
 	return cpuid4_info_fill_done(id4, eax, ebx, ecx);
@@ -270,25 +276,10 @@ static int fill_cpuid4_info(struct cpuinfo_x86 *c, int index, struct _cpuid4_inf
 	u8 cpu_vendor = boot_cpu_data.x86_vendor;
 
 	return (cpu_vendor == X86_VENDOR_AMD || cpu_vendor == X86_VENDOR_HYGON) ?
-		amd_fill_cpuid4_info(index, id4) :
+		amd_fill_cpuid4_info(c, index, id4) :
 		intel_fill_cpuid4_info(c, index, id4);
 }
 
-static int amd_find_num_cache_leaves(struct cpuinfo_x86 *c)
-{
-	union _cpuid4_leaf_eax cache_eax;
-	unsigned int eax, ebx, ecx, edx;
-	int i = -1;
-
-	/* Do a CPUID(0x8000001d) loop to calculate num_cache_leaves */
-	do {
-		++i;
-		cpuid_count(0x8000001d, i, &eax, &ebx, &ecx, &edx);
-		cache_eax.full = eax;
-	} while (cache_eax.split.type != CTYPE_NULL);
-	return i;
-}
-
 /*
  * The max shared threads number comes from CPUID(0x4) EAX[25-14] with input
  * ECX as cache index. Then right shift apicid by the number's order to get
@@ -328,10 +319,10 @@ void cacheinfo_amd_init_llc_id(struct cpuinfo_x86 *c, u16 die_id)
 		 * Newer families: LLC ID is calculated from the number
 		 * of threads sharing the L3 cache.
 		 */
-		u32 llc_index = amd_find_num_cache_leaves(c) - 1;
+		u32 llc_index = cpuid_subleaf_count(c, 0x8000001d) - 1;
 		struct _cpuid4_info id4 = {};
 
-		if (!amd_fill_cpuid4_info(llc_index, &id4))
+		if (!amd_fill_cpuid4_info(c, llc_index, &id4))
 			c->topo.llc_id = get_cache_id(c->topo.apicid, &id4);
 	}
 }
@@ -353,7 +344,7 @@ void init_amd_cacheinfo(struct cpuinfo_x86 *c)
 	struct cpu_cacheinfo *ci = get_cpu_cacheinfo(c->cpu_index);
 
 	if (boot_cpu_has(X86_FEATURE_TOPOEXT))
-		ci->num_leaves = amd_find_num_cache_leaves(c);
+		ci->num_leaves = cpuid_subleaf_count(c, 0x8000001d);
 	else if (c->extended_cpuid_level >= 0x80000006)
 		ci->num_leaves = (cpuid_edx(0x80000006) & 0xf000) ? 4 : 3;
 }
@@ -362,7 +353,7 @@ void init_hygon_cacheinfo(struct cpuinfo_x86 *c)
 {
 	struct cpu_cacheinfo *ci = get_cpu_cacheinfo(c->cpu_index);
 
-	ci->num_leaves = amd_find_num_cache_leaves(c);
+	ci->num_leaves = cpuid_subleaf_count(c, 0x8000001d);
 }
 
 static void intel_cacheinfo_done(struct cpuinfo_x86 *c, unsigned int l3,
-- 
2.53.0

