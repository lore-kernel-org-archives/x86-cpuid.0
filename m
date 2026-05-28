Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502E440960A
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982899; cv=none; b=s8VvBGZ0RTy6+Jml4j0EH7ighPEJ6zt7gHnDPPTHO9bsTDOPMJ8nz6Y2bbSk1sFce82KWL1bHCcewYJ4lBpu2DDcM2+0NdWXDJZmdlzk4Hxa8n1rFbNPKtzBZna2TWMKBL4ybF5i+Rgspw7/t2V730dTV6a+/1+PwZ5p1w7Au3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982899; c=relaxed/simple;
	bh=7AYTYMTDZYM4RusPqr/AAR9GqJZtxYrUmF4BOJcTSaI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LWgxAPFkb06+ILGm9jV2+YUT4lZ0VVQ4mqXYNXF+7TbAZ6MyGO6l4SuyF6lRIbGPyx4VtagzfmYMNypQ7O4SaoFzpRWIg4dQwv3Zt2m2RjMRpWuEGqtMC2rmBxoUbCN870aeEJDDqzSbztcXWCV3k6pp/55Mftek/U9wWHdriKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Baa7qsUQ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wUd3iJN1; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Baa7qsUQ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wUd3iJN1"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WpdQ6+hAOM3XilPdWRjoWXgtfgUoW3JKHlz20f2egYc=;
	b=Baa7qsUQGVJOT7c92qBQUrcLgrHyhqqX0BnZEMnKoyI11UtLO/MhesdNQJULO94XwlPqlK
	XWvDGIVdjzLzHJkOkKl47hslCBxSTD2a5FiXjTb75ChKejEfu9Jn5bMUsZHYCYUfk+LBIs
	ZAPKLE70W6fgpCa+xywhEUYrWR1+Wmljg61zRD8Qm1lwcBGDeQ9noukeub7GkizrDHeRfh
	rTg+TD+MshmHNnaFWeGWDyTD2oL2BDcICDGYMtwUX4kPgaHa9rq9iHgvlWBvBJ2/orYnZq
	AhKLzZ5dHfMCZY83PB0LX5/G4lcIRFyJNvC3/qifGj2vljC4RQNJPtbhKmnH+g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WpdQ6+hAOM3XilPdWRjoWXgtfgUoW3JKHlz20f2egYc=;
	b=wUd3iJN1yfcswkYqCjfUJOd4s4n8EZMyUlIDqIWmeTPQOHrrAqDG1Y5SaeAuGtlQM8cgpW
	cImSOT3CnnZcFMAg==
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
Subject: [PATCH v7 033/120] x86/cacheinfo: Use parsed CPUID(0x4)
Date: Thu, 28 May 2026 17:37:55 +0200
Message-ID: <20260528153923.403473-34-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For Intel cacheinfo, use parsed CPUID(0x4) instead of a direct CPUID query.

Use the CPUID API

    cpuid_subleaf_count(c, 0x4)

to determine the number of CPUID(0x4) cache subleaves instead of calling
find_num_cache_leaves().  The latter function internally invokes direct
CPUID(0x4) queries.

Since find_num_cache_leaves() is no longer needed for Intel code paths,
make its name and implementation AMD-specific.  Adjust the AMD code paths
accordingly.

At intel_cacheinfo_0x4(), remove the max CPUID level check since
cpuid_subleaf_count(c, 0x4) will return zero if CPUID(0x4) is not valid.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/cacheinfo.c | 40 ++++++++++++++-------------------
 1 file changed, 17 insertions(+), 23 deletions(-)

diff --git a/arch/x86/kernel/cpu/cacheinfo.c b/arch/x86/kernel/cpu/cacheinfo.c
index 07f7e7b667ed..91020f85c000 100644
--- a/arch/x86/kernel/cpu/cacheinfo.c
+++ b/arch/x86/kernel/cpu/cacheinfo.c
@@ -252,16 +252,17 @@ static int amd_fill_cpuid4_info(int index, struct _cpuid4_info *id4)
 	return cpuid4_info_fill_done(id4, eax, ebx, ecx);
 }
 
-static int intel_fill_cpuid4_info(struct cpuinfo_x86 *unused, int index, struct _cpuid4_info *id4)
+static int intel_fill_cpuid4_info(struct cpuinfo_x86 *c, int index, struct _cpuid4_info *id4)
 {
-	union _cpuid4_leaf_eax eax;
-	union _cpuid4_leaf_ebx ebx;
-	union _cpuid4_leaf_ecx ecx;
-	u32 ignored;
+	const struct cpuid_regs *regs = cpuid_subleaf_n_raw(c, 0x4, index);
 
-	cpuid_count(4, index, &eax.full, &ebx.full, &ecx.full, &ignored);
+	if (!regs)
+		return -EIO;
 
-	return cpuid4_info_fill_done(id4, eax, ebx, ecx);
+	return cpuid4_info_fill_done(id4,
+				     (union _cpuid4_leaf_eax)(regs->eax),
+				     (union _cpuid4_leaf_ebx)(regs->ebx),
+				     (union _cpuid4_leaf_ecx)(regs->ecx));
 }
 
 static int fill_cpuid4_info(struct cpuinfo_x86 *c, int index, struct _cpuid4_info *id4)
@@ -273,17 +274,16 @@ static int fill_cpuid4_info(struct cpuinfo_x86 *c, int index, struct _cpuid4_inf
 		intel_fill_cpuid4_info(c, index, id4);
 }
 
-static int find_num_cache_leaves(struct cpuinfo_x86 *c)
+static int amd_find_num_cache_leaves(struct cpuinfo_x86 *c)
 {
-	unsigned int eax, ebx, ecx, edx, op;
 	union _cpuid4_leaf_eax cache_eax;
+	unsigned int eax, ebx, ecx, edx;
 	int i = -1;
 
-	/* Do a CPUID(op) loop to calculate num_cache_leaves */
-	op = (c->x86_vendor == X86_VENDOR_AMD || c->x86_vendor == X86_VENDOR_HYGON) ? 0x8000001d : 4;
+	/* Do a CPUID(0x8000001d) loop to calculate num_cache_leaves */
 	do {
 		++i;
-		cpuid_count(op, i, &eax, &ebx, &ecx, &edx);
+		cpuid_count(0x8000001d, i, &eax, &ebx, &ecx, &edx);
 		cache_eax.full = eax;
 	} while (cache_eax.split.type != CTYPE_NULL);
 	return i;
@@ -328,7 +328,7 @@ void cacheinfo_amd_init_llc_id(struct cpuinfo_x86 *c, u16 die_id)
 		 * Newer families: LLC ID is calculated from the number
 		 * of threads sharing the L3 cache.
 		 */
-		u32 llc_index = find_num_cache_leaves(c) - 1;
+		u32 llc_index = amd_find_num_cache_leaves(c) - 1;
 		struct _cpuid4_info id4 = {};
 
 		if (!amd_fill_cpuid4_info(llc_index, &id4))
@@ -353,7 +353,7 @@ void init_amd_cacheinfo(struct cpuinfo_x86 *c)
 	struct cpu_cacheinfo *ci = get_cpu_cacheinfo(c->cpu_index);
 
 	if (boot_cpu_has(X86_FEATURE_TOPOEXT))
-		ci->num_leaves = find_num_cache_leaves(c);
+		ci->num_leaves = amd_find_num_cache_leaves(c);
 	else if (c->extended_cpuid_level >= 0x80000006)
 		ci->num_leaves = (cpuid_edx(0x80000006) & 0xf000) ? 4 : 3;
 }
@@ -362,7 +362,7 @@ void init_hygon_cacheinfo(struct cpuinfo_x86 *c)
 {
 	struct cpu_cacheinfo *ci = get_cpu_cacheinfo(c->cpu_index);
 
-	ci->num_leaves = find_num_cache_leaves(c);
+	ci->num_leaves = amd_find_num_cache_leaves(c);
 }
 
 static void intel_cacheinfo_done(struct cpuinfo_x86 *c, unsigned int l3,
@@ -426,15 +426,9 @@ static bool intel_cacheinfo_0x4(struct cpuinfo_x86 *c)
 	unsigned int l2_id = BAD_APICID, l3_id = BAD_APICID;
 	unsigned int l1d = 0, l1i = 0, l2 = 0, l3 = 0;
 
-	if (c->cpuid_level < 4)
-		return false;
-
-	/*
-	 * There should be at least one leaf. A non-zero value means
-	 * that the number of leaves has been previously initialized.
-	 */
+	/* Non-zero means that it has been previously initialized */
 	if (!ci->num_leaves)
-		ci->num_leaves = find_num_cache_leaves(c);
+		ci->num_leaves = cpuid_subleaf_count(c, 0x4);
 
 	if (!ci->num_leaves)
 		return false;
-- 
2.54.0

