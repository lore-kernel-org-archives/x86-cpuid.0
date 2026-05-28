Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D6A42EEC8
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982956; cv=none; b=Y3bO+EhxcMqkNALwMXtDPQTgi/OOGiJ/igh2vcB7LsaS4gWIIQ8oh8i7y5nSHosbgVHVWHT99l0kLzUrgNJvXeURU46Ci6Bevn1FCTrsXHGi9Czqe1hMuA8no+jmwY5vjQGpeIoFJzcxZQMYz9TavhwVsWuq4Ui7eNCLcgEO9+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982956; c=relaxed/simple;
	bh=tjuZ+0GD4eBIUAXvjxE4ebmDt3Q1LWU6wnHhkzwkeDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=El75ZdHQtJ6bHrery370Qy4NBVELBe/UHTD4NIpjhoQMff2IJzjVfYkU2m0vEG+j9nFm/KCqw/Itd6BzKQxXfIEn2shMNRukZxQnJu7k8642JAyvlY1aCeumUNM3drRMkC4arIiQBavYjO2jdTa6bFxbAVGdUJf2hO9HVbcwTTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=gyM2cGfO; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yt4Xa4aG; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gyM2cGfO";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yt4Xa4aG"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M3Xp7NTc9XgPz0DKWH7ntegGmM3R2oGxlKaZ/aijIIg=;
	b=gyM2cGfOG5gqAoS/jLNkUM0+v6pj0+LJNPtLrqiRoUn9PLlEkPKW1hEqDgES4Iw797oegU
	tZcxCcb9mZ4RRC7Ljov+TGOEhR9dPVEG54wDV6O2bRmA/qQEWJvln5Bfqbf24emjUF6y3r
	Zq4Ee8zX4wrUD49T/LwzSZ2kdDS1MnpKpOMPa2GGRjK7C+SNYvrZQSfXQy7vghrxmLSMCY
	FE6eNGqKSWz8bIh9lHgDcFFOW/ys9eDYq9IBXLayqgUzLhn6yGyCoviLVtv05N2wt7soo+
	mzAc5pYXrn5YFsH5bXCZvmmuGkq5GVtAkIJodnSOgS2K/67WRCau9rt7tmaDKw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M3Xp7NTc9XgPz0DKWH7ntegGmM3R2oGxlKaZ/aijIIg=;
	b=yt4Xa4aG2H52FGUPtc/GI4CSDiV2LPPPqLAn8UbC4Cp0LTobEhy4F98iEtMzAiSu4QsY8i
	UfG5h7LZSIi+XkCw==
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
Subject: [PATCH v7 050/120] x86/microcode/amd: Use standard CPUID(0x1) types
Date: Thu, 28 May 2026 17:38:12 +0200
Message-ID: <20260528153923.403473-51-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use standard CPUID(0x1) data types from x86-cpuid-db instead of defining
and using custom ones.

Remove the local union cpuid_1_eax since it has no more users.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/microcode/amd.c | 106 +++++++++++++---------------
 1 file changed, 49 insertions(+), 57 deletions(-)

diff --git a/arch/x86/kernel/cpu/microcode/amd.c b/arch/x86/kernel/cpu/microcode/amd.c
index 874b5b70c0d2..f609645f1254 100644
--- a/arch/x86/kernel/cpu/microcode/amd.c
+++ b/arch/x86/kernel/cpu/microcode/amd.c
@@ -107,19 +107,6 @@ union zen_patch_rev {
 	__u32 ucode_rev;
 };
 
-union cpuid_1_eax {
-	struct {
-		__u32 stepping    : 4,
-		      model	  : 4,
-		      family	  : 4,
-		      __reserved0 : 4,
-		      ext_model   : 4,
-		      ext_fam     : 8,
-		      __reserved1 : 4;
-	};
-	__u32 full;
-};
-
 /*
  * This points to the current valid container of microcode patches which we will
  * save from the initrd/builtin before jettisoning its contents. @mc is the
@@ -148,7 +135,7 @@ ucode_path[] __maybe_unused = "kernel/x86/microcode/AuthenticAMD.bin";
  *    already contains the f/m/s for which the microcode is destined
  *    for.
  */
-static u32 bsp_cpuid_1_eax __ro_after_init;
+static struct leaf_0x1_0 leaf1 __ro_after_init;
 
 static bool sha_check = true;
 
@@ -159,6 +146,11 @@ struct patch_digest {
 
 #include "amd_shas.c"
 
+static u32 __eax(const struct leaf_0x1_0 *l)
+{
+	return ((const struct cpuid_regs *)l)->eax;
+}
+
 static int cmp_id(const void *key, const void *elem)
 {
 	struct patch_digest *pd = (struct patch_digest *)elem;
@@ -172,17 +164,14 @@ static int cmp_id(const void *key, const void *elem)
 		return 1;
 }
 
-static u32 cpuid_to_ucode_rev(unsigned int val)
+static u32 cpuid_to_ucode_rev(const struct leaf_0x1_0 *l)
 {
 	union zen_patch_rev p = {};
-	union cpuid_1_eax c;
-
-	c.full = val;
 
-	p.stepping  = c.stepping;
-	p.model     = c.model;
-	p.ext_model = c.ext_model;
-	p.ext_fam   = c.ext_fam;
+	p.stepping  = l->stepping;
+	p.model     = l->base_model;
+	p.ext_model = l->ext_model;
+	p.ext_fam   = l->ext_family;
 
 	return p.ucode_rev;
 }
@@ -235,7 +224,7 @@ static bool need_sha_check(u32 cur_rev)
 	u32 cutoff;
 
 	if (!cur_rev) {
-		cur_rev = cpuid_to_ucode_rev(bsp_cpuid_1_eax);
+		cur_rev = cpuid_to_ucode_rev(&leaf1);
 		pr_info_once("No current revision, generating the lowest one: 0x%x\n", cur_rev);
 	}
 
@@ -244,14 +233,14 @@ static bool need_sha_check(u32 cur_rev)
 		return cur_rev <= cutoff;
 
 	pr_info("You should not be seeing this. Please send the following couple of lines to x86-<at>-kernel.org\n");
-	pr_info("CPUID(1).EAX: 0x%x, current revision: 0x%x\n", bsp_cpuid_1_eax, cur_rev);
+	pr_info("CPUID(1).EAX: 0x%x, current revision: 0x%x\n", __eax(&leaf1), cur_rev);
 	return true;
 }
 
 static bool cpu_has_entrysign(void)
 {
-	unsigned int fam   = x86_family(bsp_cpuid_1_eax);
-	unsigned int model = x86_model(bsp_cpuid_1_eax);
+	unsigned int fam   = cpuid_family(&leaf1);
+	unsigned int model = cpuid_model(&leaf1);
 
 	if (fam == 0x17 || fam == 0x19)
 		return true;
@@ -302,21 +291,20 @@ static bool verify_sha256_digest(u32 patch_id, u32 cur_rev, const u8 *data, unsi
 	return true;
 }
 
-static union cpuid_1_eax ucode_rev_to_cpuid(unsigned int val)
+static struct leaf_0x1_0 ucode_rev_to_cpuid(unsigned int val)
 {
+	struct leaf_0x1_0 leaf = { };
 	union zen_patch_rev p;
-	union cpuid_1_eax c;
 
 	p.ucode_rev = val;
-	c.full = 0;
 
-	c.stepping  = p.stepping;
-	c.model     = p.model;
-	c.ext_model = p.ext_model;
-	c.family    = 0xf;
-	c.ext_fam   = p.ext_fam;
+	leaf.stepping		= p.stepping;
+	leaf.base_model		= p.model;
+	leaf.ext_model		= p.ext_model;
+	leaf.base_family_id	= 0xf;
+	leaf.ext_family		= p.ext_fam;
 
-	return c;
+	return leaf;
 }
 
 static u32 get_patch_level(void)
@@ -328,7 +316,7 @@ static u32 get_patch_level(void)
 
 		if (!microcode_rev[cpu]) {
 			if (!base_rev)
-				base_rev = cpuid_to_ucode_rev(bsp_cpuid_1_eax);
+				base_rev = cpuid_to_ucode_rev(&leaf1);
 
 			microcode_rev[cpu] = base_rev;
 
@@ -348,7 +336,7 @@ static u16 find_equiv_id(struct equiv_cpu_table *et, u32 sig)
 	unsigned int i;
 
 	/* Zen and newer do not need an equivalence table. */
-	if (x86_family(bsp_cpuid_1_eax) >= 0x17)
+	if (cpuid_family(&leaf1) >= 0x17)
 		return 0;
 
 	if (!et || !et->num_entries)
@@ -398,7 +386,7 @@ static bool verify_equivalence_table(const u8 *buf, size_t buf_size)
 		return false;
 
 	/* Zen and newer do not need an equivalence table. */
-	if (x86_family(bsp_cpuid_1_eax) >= 0x17)
+	if (cpuid_family(&leaf1) >= 0x17)
 		return true;
 
 	cont_type = hdr[1];
@@ -465,7 +453,7 @@ static bool __verify_patch_section(const u8 *buf, size_t buf_size, u32 *sh_psize
  */
 static bool __verify_patch_size(u32 sh_psize, size_t buf_size)
 {
-	u8 family = x86_family(bsp_cpuid_1_eax);
+	u8 family = cpuid_family(&leaf1);
 	u32 max_size;
 
 	if (family >= 0x15)
@@ -504,7 +492,7 @@ static bool __verify_patch_size(u32 sh_psize, size_t buf_size)
  */
 static int verify_patch(const u8 *buf, size_t buf_size, u32 *patch_size)
 {
-	u8 family = x86_family(bsp_cpuid_1_eax);
+	u8 family = cpuid_family(&leaf1);
 	struct microcode_header_amd *mc_hdr;
 	u32 cur_rev, cutoff, patch_rev;
 	u32 sh_psize;
@@ -578,10 +566,13 @@ static int verify_patch(const u8 *buf, size_t buf_size, u32 *patch_size)
 static bool mc_patch_matches(struct microcode_amd *mc, u16 eq_id)
 {
 	/* Zen and newer do not need an equivalence table. */
-	if (x86_family(bsp_cpuid_1_eax) >= 0x17)
-		return ucode_rev_to_cpuid(mc->hdr.patch_id).full == bsp_cpuid_1_eax;
-	else
+	if (cpuid_family(&leaf1) >= 0x17) {
+		struct leaf_0x1_0 l = ucode_rev_to_cpuid(mc->hdr.patch_id);
+
+		return __eax(&l) == __eax(&leaf1);
+	} else {
 		return eq_id == mc->hdr.processor_rev_id;
+	}
 }
 
 /*
@@ -612,7 +603,7 @@ static size_t parse_container(u8 *ucode, size_t size, struct cont_desc *desc)
 	 * doesn't contain a patch for the CPU, scan through the whole container
 	 * so that it can be skipped in case there are other containers appended.
 	 */
-	eq_id = find_equiv_id(&table, bsp_cpuid_1_eax);
+	eq_id = find_equiv_id(&table, __eax(&leaf1));
 
 	buf  += hdr[2] + CONTAINER_HDR_SZ;
 	size -= hdr[2] + CONTAINER_HDR_SZ;
@@ -702,7 +693,7 @@ static bool __apply_microcode_amd(struct microcode_amd *mc, u32 *cur_rev,
 
 	native_wrmsrq(MSR_AMD64_PATCH_LOADER, p_addr);
 
-	if (x86_family(bsp_cpuid_1_eax) == 0x17) {
+	if (cpuid_family(&leaf1) == 0x17) {
 		unsigned long p_addr_end = p_addr + psize - 1;
 
 		invlpg(p_addr);
@@ -732,7 +723,7 @@ static bool __apply_microcode_amd(struct microcode_amd *mc, u32 *cur_rev,
 static bool get_builtin_microcode(struct cpio_data *cp)
 {
 	char fw_name[36] = "amd-ucode/microcode_amd.bin";
-	u8 family = x86_family(bsp_cpuid_1_eax);
+	u8 family = cpuid_family(&leaf1);
 	struct firmware fw;
 
 	if (IS_ENABLED(CONFIG_X86_32))
@@ -777,6 +768,7 @@ static bool __init find_blobs_in_containers(struct cpio_data *ret)
  */
 void __init load_ucode_amd_bsp(struct early_load_data *ed, unsigned int cpuid_1_eax)
 {
+	struct cpuid_regs *leaf1_regs = (struct cpuid_regs *)&leaf1;
 	struct cont_desc desc = { };
 	struct microcode_amd *mc;
 	struct cpio_data cp = { };
@@ -791,7 +783,7 @@ void __init load_ucode_amd_bsp(struct early_load_data *ed, unsigned int cpuid_1_
 		}
 	}
 
-	bsp_cpuid_1_eax = cpuid_1_eax;
+	leaf1_regs->eax = cpuid_1_eax;
 
 	rev = get_patch_level();
 	ed->old_rev = rev;
@@ -825,16 +817,16 @@ static inline bool patch_cpus_equivalent(struct ucode_patch *p,
 					 bool ignore_stepping)
 {
 	/* Zen and newer hardcode the f/m/s in the patch ID */
-        if (x86_family(bsp_cpuid_1_eax) >= 0x17) {
-		union cpuid_1_eax p_cid = ucode_rev_to_cpuid(p->patch_id);
-		union cpuid_1_eax n_cid = ucode_rev_to_cpuid(n->patch_id);
+	if (cpuid_family(&leaf1) >= 0x17) {
+		struct leaf_0x1_0 p_leaf = ucode_rev_to_cpuid(p->patch_id);
+		struct leaf_0x1_0 n_leaf = ucode_rev_to_cpuid(n->patch_id);
 
 		if (ignore_stepping) {
-			p_cid.stepping = 0;
-			n_cid.stepping = 0;
+			p_leaf.stepping = 0;
+			n_leaf.stepping = 0;
 		}
 
-		return p_cid.full == n_cid.full;
+		return __eax(&p_leaf) == __eax(&n_leaf);
 	} else {
 		return p->equiv_cpu == n->equiv_cpu;
 	}
@@ -861,7 +853,7 @@ static struct ucode_patch *cache_find_patch(struct ucode_cpu_info *uci, u16 equi
 static inline int patch_newer(struct ucode_patch *p, struct ucode_patch *n)
 {
 	/* Zen and newer hardcode the f/m/s in the patch ID */
-        if (x86_family(bsp_cpuid_1_eax) >= 0x17) {
+	if (cpuid_family(&leaf1) >= 0x17) {
 		union zen_patch_rev zp, zn;
 
 		zp.ucode_rev = p->patch_id;
@@ -921,7 +913,7 @@ static struct ucode_patch *find_patch(unsigned int cpu)
 
 	uci->cpu_sig.rev = get_patch_level();
 
-	if (x86_family(bsp_cpuid_1_eax) < 0x17) {
+	if (cpuid_family(&leaf1) < 0x17) {
 		equiv_id = find_equiv_id(&equiv_table, uci->cpu_sig.sig);
 		if (!equiv_id)
 			return NULL;
@@ -1036,7 +1028,7 @@ static size_t install_equiv_cpu_table(const u8 *buf, size_t buf_size)
 	equiv_tbl_len = hdr[2];
 
 	/* Zen and newer do not need an equivalence table. */
-	if (x86_family(bsp_cpuid_1_eax) >= 0x17)
+	if (cpuid_family(&leaf1) >= 0x17)
 		goto out;
 
 	equiv_table.entry = vmalloc(equiv_tbl_len);
@@ -1055,7 +1047,7 @@ static size_t install_equiv_cpu_table(const u8 *buf, size_t buf_size)
 
 static void free_equiv_cpu_table(void)
 {
-	if (x86_family(bsp_cpuid_1_eax) >= 0x17)
+	if (cpuid_family(&leaf1) >= 0x17)
 		return;
 
 	vfree(equiv_table.entry);
-- 
2.54.0

