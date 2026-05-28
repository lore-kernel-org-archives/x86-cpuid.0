Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8285421F1B
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982912; cv=none; b=gLpVMHge9uRHd/78Vp3G7qGhIMbQaGWYUnB9eWrWIYKzMWyTczsWElk8O5ayCkjWIPWmDBvoqYLklLEWQQmyMERz+l/kVR1jEtBxAlvLFdWm4PelQqaRWyGgq9jRoyb6G91+OGZBXNhIqlD1ttx9z/Mpu6NFSjqlFzHtOHSNeDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982912; c=relaxed/simple;
	bh=u74xiCZHSHXLNvgTjRmIVTA9pWovHlOz8YhmMxVR/qU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PYkUKEpQFfcbT5L50dMy2/gdonQDlGf38Vz90/HIuyi59Stk6SlifjVwkc7sWYZoonvVuluRBh+5/3ev5Jh6wPgDL5i3meVmG3VbErcHeWMjtB1hZQDh8C7zsbSCs6CAAbu8+a6L56idprgprb8/smi+fW8KqdWXB4B2QhRhROQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=E8d14iEq; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bsIY7vN+; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="E8d14iEq";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bsIY7vN+"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u+56/9BbScZtE3iCsmY5n2kRW8Y+J/nkE1ONDKXlgJ0=;
	b=E8d14iEqhrSUucWq0TFexJklOAaVl1Itju9iovFatmcPctdZyv0OdscEVDGkonlDJpZGFR
	U1xisNVoT5/bDUZT65KkyxVjbeX6dRtenJUaQUSYFjCYwz5SJbu5Lsx0il5oSXVV3r+JM4
	OXHGyJljTmymDmk8qPN12AY+/ihxcgXZzZR9jCztw9GWiTM5XPdAHtZPwnv/ZBojYvtgS6
	cFvGJYILgNeERbQlmvtDd6NqVBlnLS2WgVWmZjg4dPpg6Z2YZDOd9F+ogTPXr0gLWaJk5F
	QHpkD+X2R3nZWjEspgMu9dwJC5AoJ/nB2D+mxndw/azLr3PqC7fWEBoe+SWuAA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u+56/9BbScZtE3iCsmY5n2kRW8Y+J/nkE1ONDKXlgJ0=;
	b=bsIY7vN+HUuy+PwtEOA7eK1DrDq+kAeCrtFLllejIwgZT72EwHLOfJ3o9DgUttTkI2oAnO
	D4pVNjS06mVrQ0Aw==
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
Subject: [PATCH v7 038/120] x86/cacheinfo: Use parsed CPUID(0x80000006)
Date: Thu, 28 May 2026 17:38:00 +0200
Message-ID: <20260528153923.403473-39-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For AMD cacheinfo, use parsed CPUID(0x80000006) instead of issuing a direct
CPUID query.

Beside the CPUID parser centralization benefits, this allows using the
auto-generated x86-cpuid-db data types, and their C99 bitfields, instead of
doing ugly bitwise operations on CPUID output.

For enumerating L3 cache availability, check if CPUID(0x80000006).EDX
l3_assoc output is not zero.  Per AMD manuals, an L3 associativity of zero
implies the absence of a CPU L3 cache.

Since cpuid_amd_hygon_has_l3_cache() is now using the CPUID parser APIs,
move its definition under the section: "Convenience leaf-specific functions
(using parsed CPUID)."

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpuid/api.h | 20 +++++++++++---------
 arch/x86/kernel/amd_nb.c         |  3 ++-
 arch/x86/kernel/cpu/cacheinfo.c  |  6 +++---
 3 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/arch/x86/include/asm/cpuid/api.h b/arch/x86/include/asm/cpuid/api.h
index f4bdfe3c9325..611ee8596115 100644
--- a/arch/x86/include/asm/cpuid/api.h
+++ b/arch/x86/include/asm/cpuid/api.h
@@ -212,15 +212,6 @@ static inline u32 cpuid_base_hypervisor(const char *sig, u32 leaves)
 	return 0;
 }
 
-/*
- * CPUID(0x80000006) parsing:
- */
-
-static inline bool cpuid_amd_hygon_has_l3_cache(void)
-{
-	return cpuid_edx(0x80000006);
-}
-
 /*
  * 'struct cpuid_leaves' accessors (without sanity checks):
  *
@@ -502,6 +493,17 @@ static inline bool cpuid_amd_hygon_has_l3_cache(void)
 	     _ptr < &((const union leaf_0x2_regs *)(_regs))->desc[16] && (_desc = &cpuid_0x2_table[*_ptr]);\
 	     _ptr++)
 
+/*
+ * CPUID(0x80000006)
+ */
+
+static inline bool cpuid_amd_hygon_has_l3_cache(struct cpuinfo_x86 *c)
+{
+	const struct leaf_0x80000006_0 *el6 = cpuid_leaf(c, 0x80000006);
+
+	return el6 && el6->l3_assoc;
+}
+
 /*
  * CPUID parser exported APIs:
  */
diff --git a/arch/x86/kernel/amd_nb.c b/arch/x86/kernel/amd_nb.c
index 5d364540673d..06ebbd564945 100644
--- a/arch/x86/kernel/amd_nb.c
+++ b/arch/x86/kernel/amd_nb.c
@@ -16,6 +16,7 @@
 
 #include <asm/amd/nb.h>
 #include <asm/cpuid/api.h>
+#include <asm/processor.h>
 
 static u32 *flush_words;
 
@@ -93,7 +94,7 @@ static int amd_cache_northbridges(void)
 	if (amd_gart_present())
 		amd_northbridges.flags |= AMD_NB_GART;
 
-	if (!cpuid_amd_hygon_has_l3_cache())
+	if (!cpuid_amd_hygon_has_l3_cache(&boot_cpu_data))
 		return 0;
 
 	/*
diff --git a/arch/x86/kernel/cpu/cacheinfo.c b/arch/x86/kernel/cpu/cacheinfo.c
index 7dab0d7152cc..3e40bcca1c3b 100644
--- a/arch/x86/kernel/cpu/cacheinfo.c
+++ b/arch/x86/kernel/cpu/cacheinfo.c
@@ -235,7 +235,7 @@ static unsigned int get_cache_id(u32 apicid, const struct _cpuid4_info *id4)
 
 void cacheinfo_amd_init_llc_id(struct cpuinfo_x86 *c, u16 die_id)
 {
-	if (!cpuid_amd_hygon_has_l3_cache())
+	if (!cpuid_amd_hygon_has_l3_cache(c))
 		return;
 
 	if (c->x86 < 0x17) {
@@ -262,7 +262,7 @@ void cacheinfo_amd_init_llc_id(struct cpuinfo_x86 *c, u16 die_id)
 
 void cacheinfo_hygon_init_llc_id(struct cpuinfo_x86 *c)
 {
-	if (!cpuid_amd_hygon_has_l3_cache())
+	if (!cpuid_amd_hygon_has_l3_cache(c))
 		return;
 
 	/*
@@ -280,7 +280,7 @@ void init_amd_cacheinfo(struct cpuinfo_x86 *c)
 	if (boot_cpu_has(X86_FEATURE_TOPOEXT))
 		ci->num_leaves = cpuid_subleaf_count(c, 0x8000001d);
 	else if (el6)
-		ci->num_leaves = (el6->l3_assoc) ? 4 : 3;
+		ci->num_leaves = cpuid_amd_hygon_has_l3_cache(c) ? 4 : 3;
 }
 
 void init_hygon_cacheinfo(struct cpuinfo_x86 *c)
-- 
2.54.0

