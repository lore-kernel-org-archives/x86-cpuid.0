Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE1E39184D
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774578147; cv=none; b=fVRqFNSZN6V8Ca0tlUvD+j2/gQ03iyXbNClmhytprk+3VVgLg1T3WCNXREX678jUBpGDO9oqqVuNh3tecouNuteOcyTr8JtSv8Gysa9erwG+P/difll/mZpV9peePiIKIEPldmQQ77wlDniOXbYNDlDD1nNeS9b+GV0wgccqRHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774578147; c=relaxed/simple;
	bh=ZC6cayXPQB++VGU7lbfwTnlHNRagvHsVZIHkEwJvNow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r9DIYOMakEBPTuurfQgT+sbcwMyAIv7+n+0lqzmEKl3ynmgBpdo6cUgIJoNumQ0cn97ZNqEKSwSKxUCteE+xy7cZtg73lowF0bvJQ+4hQVSpTpptahius87YCmV6sCK2TnR9Hg3Neqlm3Ldt87QefSzdS17+eMHnKsRxhal//+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=IAt71GAd; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=9XUEPOQh; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IAt71GAd";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="9XUEPOQh"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774578144;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=29BHdsmcC1HkjHvSYOV5p+PktPO/Lj1IRStMOz+HANo=;
	b=IAt71GAdMC5Mosk6wjOYlZHDxhBWMFw1mmx5wzPjzMtMXH0qht5ZYU4VHh4SiupCOEvwF/
	2PmsfkwxsHioM+gUWLCCYLhBbRwVd/sM846d0BXpU6hU3h53WKqSJWSL05SGYEhdwBfts3
	XGly2dlySP/2GdJf54Ks/V6jsTffXohXfzyOpNz6PPHj8LTy/UOf+i9v+3ZLqH39TDEGg4
	5QQvdbKcZaGnALqFy0x/viNwLmw2PDrnmN7Ky5MZoVYvdmZcmQmBPF3c9u/YXG6C6lbJnI
	a2+Huw5zKs+oAVhv8tlh/5CP2pzpWZEssvjVjDre6TgEoOuu1KhtZcNTnyYymA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774578144;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=29BHdsmcC1HkjHvSYOV5p+PktPO/Lj1IRStMOz+HANo=;
	b=9XUEPOQhdScxHBTXM7dU0V5do0W5J6gcnmox1UmmwT37008/mmuZW7KKWBp0RlUssRnP6R
	a2VgM4GnXSe4bADA==
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
Subject: [PATCH v6 84/90] x86: Route all feature queries to the CPUID tables
Date: Fri, 27 Mar 2026 03:16:38 +0100
Message-ID: <20260327021645.555257-85-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the CPUID API's cpuid_feature_*() and cpuid_word_*() helpers to route
all feature querying to the CPUID tables instead of to x86_capability[].

This allows the CPUID tables to act as a single source of truth for x86
feature state; both hardware-backed and synthetic.

Do this routing in one shot, not to fragment x86 state tracking between
CPUID tables and x86_capability[].  The latter will be fully removed.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpufeature.h | 12 ++++++---
 arch/x86/include/asm/elf.h        |  2 +-
 arch/x86/kernel/cpu/common.c      | 41 +++++++++++++++++--------------
 arch/x86/kernel/cpu/cpuid-deps.c  |  2 +-
 arch/x86/kernel/mpparse.c         |  2 +-
 arch/x86/kvm/cpuid.c              |  3 +--
 6 files changed, 34 insertions(+), 28 deletions(-)

diff --git a/arch/x86/include/asm/cpufeature.h b/arch/x86/include/asm/cpufeature.h
index 48643b4b1e24..58d5e4f3891c 100644
--- a/arch/x86/include/asm/cpufeature.h
+++ b/arch/x86/include/asm/cpufeature.h
@@ -10,6 +10,7 @@
 #include <linux/bitops.h>
 #include <asm/alternative.h>
 #include <asm/cpufeaturemasks.h>
+#include <asm/cpuid/api.h>
 
 enum cpuid_leafs
 {
@@ -48,7 +49,7 @@ extern const char * const x86_bug_flags[NBUGINTS*32];
 #define x86_bug_flag(flag) x86_bug_flags[flag]
 
 #define test_cpu_cap(c, bit)						\
-	 arch_test_bit(bit, (unsigned long *)((c)->x86_capability))
+	arch_test_bit(cpuid_feature_bit_offset(bit), cpuid_feature_bitmap(c, bit))
 
 #define cpu_has(c, bit)							\
 	(__builtin_constant_p(bit) && REQUIRED_MASK_BIT_SET(bit) ? 1 :	\
@@ -56,7 +57,7 @@ extern const char * const x86_bug_flags[NBUGINTS*32];
 
 #define this_cpu_has(bit)						\
 	(__builtin_constant_p(bit) && REQUIRED_MASK_BIT_SET(bit) ? 1 :	\
-	 x86_this_cpu_test_bit(bit, cpu_info.x86_capability, 0))
+	 x86_this_cpu_test_bit(cpuid_feature_bit_offset(bit), cpu_info.cpuid.leaves, cpuid_feature_byte_offset(bit)))
 
 /*
  * This is the default CPU features testing macro to use in code.
@@ -72,7 +73,8 @@ extern const char * const x86_bug_flags[NBUGINTS*32];
 
 #define boot_cpu_has(bit)	cpu_has(&boot_cpu_data, bit)
 
-#define set_cpu_cap(c, bit)	set_bit(bit, (unsigned long *)((c)->x86_capability))
+#define set_cpu_cap(c, bit)						\
+	set_bit(cpuid_feature_bit_offset(bit), cpuid_feature_bitmap(c, bit))
 
 extern void setup_clear_cpu_cap(unsigned int bit);
 extern void clear_cpu_cap(struct cpuinfo_x86 *c, unsigned int bit);
@@ -116,7 +118,9 @@ void check_cpufeature_deps(struct cpuinfo_x86 *c);
 
 static __always_inline bool _static_cpu_has(u16 bit)
 {
-	__static_cpu_has(bit, &boot_cpu_data.x86_capability, bit);
+	__static_cpu_has(bit,
+			 cpuid_feature_bitmap(&boot_cpu_data, bit),
+			 cpuid_feature_bit_offset(bit));
 }
 
 #define static_cpu_has(bit)					\
diff --git a/arch/x86/include/asm/elf.h b/arch/x86/include/asm/elf.h
index 2ba5f166e58f..33deebdde48a 100644
--- a/arch/x86/include/asm/elf.h
+++ b/arch/x86/include/asm/elf.h
@@ -239,7 +239,7 @@ extern int force_personality32;
    instruction set this CPU supports.  This could be done in user space,
    but it's not easy, and we've already done it here.  */
 
-#define ELF_HWCAP		(boot_cpu_data.x86_capability[CPUID_1_EDX])
+#define ELF_HWCAP		cpuid_word(&boot_cpu_data, CPUID_1_EDX)
 
 extern u32 elf_hwcap2;
 
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index ece5a59124f5..98e53f5aa41d 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -968,11 +968,9 @@ void cpu_detect(struct cpuinfo_x86 *c)
 
 static void apply_forced_caps(struct cpuinfo_x86 *c)
 {
-	int i;
-
-	for (i = 0; i < NCAPINTS + NBUGINTS; i++) {
-		c->x86_capability[i] &= ~cpu_caps_cleared[i];
-		c->x86_capability[i] |= cpu_caps_set[i];
+	for (int i = 0; i < NCAPINTS + NBUGINTS; i++) {
+		cpuid_word_clear_bits(c, i, cpu_caps_cleared[i]);
+		cpuid_word_set_bits(c, i, cpu_caps_set[i]);
 	}
 }
 
@@ -2002,8 +2000,6 @@ static void generic_identify(struct cpuinfo_x86 *c)
  */
 static void identify_cpu(struct cpuinfo_x86 *c)
 {
-	int i;
-
 	c->loops_per_jiffy = loops_per_jiffy;
 	c->x86_cache_size = 0;
 	c->x86_vendor = X86_VENDOR_UNKNOWN;
@@ -2112,13 +2108,13 @@ static void identify_cpu(struct cpuinfo_x86 *c)
 	 * executed, c == &boot_cpu_data.
 	 */
 	if (c != &boot_cpu_data) {
-		/* AND the already accumulated flags with these */
-		for (i = 0; i < NCAPINTS; i++)
-			boot_cpu_data.x86_capability[i] &= c->x86_capability[i];
+		/* Clear boot_cpu_data features that are not on this CPU */
+		for (int i = 0; i < NCAPINTS; i++)
+			cpuid_word_clear_bits(&boot_cpu_data, i, ~cpuid_word(c, i));
 
-		/* OR, i.e. replicate the bug flags */
-		for (i = NCAPINTS; i < NCAPINTS + NBUGINTS; i++)
-			c->x86_capability[i] |= boot_cpu_data.x86_capability[i];
+		/* Replicate boot_cpu_data's bug flags to this CPU */
+		for (int i = NCAPINTS; i < NCAPINTS + NBUGINTS; i++)
+			cpuid_word_set_bits(c, i, cpuid_word(&boot_cpu_data, i));
 	}
 
 	ppin_init(c);
@@ -2521,12 +2517,17 @@ void cpu_init(void)
  */
 void store_cpu_caps(struct cpuinfo_x86 *curr_info)
 {
+	const struct leaf_0x0_0 *l0;
+
 	/* Reload CPUID max function as it might've changed. */
-	curr_info->cpuid_level = cpuid_eax(0);
+	cpuid_refresh_leaf(curr_info, 0x0);
+	l0 = cpuid_leaf(curr_info, 0x0);
+	if (l0)
+		curr_info->cpuid_level = l0->max_std_leaf;
 
 	/* Copy all capability leafs and pick up the synthetic ones. */
-	memcpy(&curr_info->x86_capability, &boot_cpu_data.x86_capability,
-	       sizeof(curr_info->x86_capability));
+	for (int i = 0; i < NCAPINTS + NBUGINTS; i++)
+		cpuid_word_set(curr_info, i, cpuid_word(&boot_cpu_data, i));
 
 	/* Get the hardware CPUID leafs */
 	get_cpu_cap(curr_info);
@@ -2556,10 +2557,12 @@ void microcode_check(struct cpuinfo_x86 *prev_info)
 
 	store_cpu_caps(curr_info);
 
-	if (!memcmp(&prev_info->x86_capability, &curr_info->x86_capability,
-		    sizeof(prev_info->x86_capability)))
-		return;
+	for (int i = 0; i < NCAPINTS + NBUGINTS; i++)
+		if (cpuid_word(prev_info, i) != cpuid_word(curr_info, i))
+			goto err;
 
+	return;
+err:
 	pr_warn("x86/CPU: CPU features have changed after loading microcode, but might not take effect.\n");
 	pr_warn("x86/CPU: Please consider either early loading through initrd/built-in or a potential BIOS update.\n");
 }
diff --git a/arch/x86/kernel/cpu/cpuid-deps.c b/arch/x86/kernel/cpu/cpuid-deps.c
index 146f6f8b0650..78374450374a 100644
--- a/arch/x86/kernel/cpu/cpuid-deps.c
+++ b/arch/x86/kernel/cpu/cpuid-deps.c
@@ -106,7 +106,7 @@ static inline void clear_feature(struct cpuinfo_x86 *c, unsigned int feature)
 		clear_cpu_cap(&boot_cpu_data, feature);
 		set_bit(feature, (unsigned long *)cpu_caps_cleared);
 	} else {
-		clear_bit(feature, (unsigned long *)c->x86_capability);
+		clear_bit(cpuid_feature_bit_offset(feature), cpuid_feature_bitmap(c, feature));
 	}
 }
 
diff --git a/arch/x86/kernel/mpparse.c b/arch/x86/kernel/mpparse.c
index 4a1b1b28abf9..a66f22db640f 100644
--- a/arch/x86/kernel/mpparse.c
+++ b/arch/x86/kernel/mpparse.c
@@ -384,7 +384,7 @@ static inline void __init construct_default_ISA_mptable(int mpc_default_type)
 	processor.cpuflag = CPU_ENABLED;
 	processor.cpufeature = (boot_cpu_data.x86 << 8) |
 	    (boot_cpu_data.x86_model << 4) | boot_cpu_data.x86_stepping;
-	processor.featureflag = boot_cpu_data.x86_capability[CPUID_1_EDX];
+	processor.featureflag = cpuid_word(&boot_cpu_data, CPUID_1_EDX);
 	processor.reserved[0] = 0;
 	processor.reserved[1] = 0;
 	for (i = 0; i < 2; i++) {
diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
index efc155e1da10..161fa2b23bdb 100644
--- a/arch/x86/kvm/cpuid.c
+++ b/arch/x86/kvm/cpuid.c
@@ -704,7 +704,6 @@ static __always_inline u32 raw_cpuid_get(struct cpuid_reg cpuid)
 do {									\
 	const struct cpuid_reg cpuid = x86_feature_cpuid(leaf * 32);	\
 	const u32 __maybe_unused kvm_cpu_cap_init_in_progress = leaf;	\
-	const u32 *kernel_cpu_caps = boot_cpu_data.x86_capability;	\
 	u32 kvm_cpu_cap_passthrough = 0;				\
 	u32 kvm_cpu_cap_synthesized = 0;				\
 	u32 kvm_cpu_cap_emulated = 0;					\
@@ -715,7 +714,7 @@ do {									\
 	kvm_cpu_caps[leaf] = kvm_cpu_cap_features;			\
 									\
 	if (leaf < NCAPINTS)						\
-		kvm_cpu_caps[leaf] &= kernel_cpu_caps[leaf];		\
+		kvm_cpu_caps[leaf] &= cpuid_word(&boot_cpu_data, leaf);\
 									\
 	kvm_cpu_caps[leaf] |= kvm_cpu_cap_passthrough;			\
 	kvm_cpu_caps[leaf] &= (raw_cpuid_get(cpuid) |			\
-- 
2.53.0

