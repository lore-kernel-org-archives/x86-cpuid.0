Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769C6410D15
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982900; cv=none; b=qVIB8rCOTey1AmgMLPikmm+vs0QAou2gRUtOxgEmBAC1mDVAnsR5WmtFX/NtG52UDu11DRVQTlHJClCtkusKzSPKJToYvkN7fx/Dm0zXVhiHuP+bXH/Kp97lFWBJTDeMG826bnBTW2QaiEx11y6uVEg/ytCoKnvVrerMPi1HUwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982900; c=relaxed/simple;
	bh=TZKkHujQONFQLhuZLzxCw4a2HlymLOLTsRGBFY/DRD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T3dkw+s2WSKN36Jc0spQ+mR3kS/uZZdYsNOkl6Cjtp2yBmPsv5QZI1IY6vzArn6OEHFvHNOGzGNqeMSusXjzTe0rqruvrsxw2XBmBizz+WR3mvpceyOD1Hel4P2yB2I8/jH/p1XJYfMlRY+/pqRsthYupZ/cY5fqkXADszcpba8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dEG4j2DE; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dK4kaTgA; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dEG4j2DE";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dK4kaTgA"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rf+QrdhYaX5GSWMv+3qrA1ngrG48lPw0VwDzeiVlk3Y=;
	b=dEG4j2DEJEi2dUvJOSX4lYv9BqjPab/jxMHFtIIIYtNjK7BcZhhhp7R82GHCEr8EOEutoR
	jKhqr0ogSDfoI5lmSO0/7e7J+MVYCZvEYQEvYc4RvLlB70xsqC+nxpCOL4pUDl8kbF3gkX
	jQUpRQQ1is4YFT/89cng4zvtFeAQO7vlqujGgQ61LlszBGNdsLfZ77uggRMbB0e+2sE4vV
	6zwXoPFTuM+9wvOUnBc8pwN5dpXC4Q38/B8CnOiIYzBtzo+M2dQqojfITlH+CMk+fXnaor
	s5lBwaY8qXYuiRcfwrJKAFKxnIYwTOes4o2Lt+hM9cWi9PAwMPjnTNksQRrgjA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rf+QrdhYaX5GSWMv+3qrA1ngrG48lPw0VwDzeiVlk3Y=;
	b=dK4kaTgAESXy1sn2B7xxbiQM0JDi9zjREF5oi4T4D0xjUzgdeo8iU1ZdoX/TNOtVxCn/wz
	m3oygv8evhoxE5Bw==
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
Subject: [PATCH v7 034/120] x86/cacheinfo: Use parsed CPUID(0x8000001d)
Date: Thu, 28 May 2026 17:37:56 +0200
Message-ID: <20260528153923.403473-35-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
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
2.54.0

