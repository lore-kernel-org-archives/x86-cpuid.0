Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172A8403E81
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983128; cv=none; b=Z1vly7BpAisROTgwBBshNqH1qOwitFlL+L+eDQ2BdIC3esv1KhHnBdOv3/gnfHni3OY0Za+/cPLDS8hW3LI2gMgbl5SHg8DZ/9rmX1uquPsZKVHuxXt+OL9e5NS7hon9RrCoefCSNxO3tEyEIJUTrNwdHKXoM32ZS6d0x0V+M+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983128; c=relaxed/simple;
	bh=BHWsYoAm4KFcpsaQEBxWbKAXPBaLIGGTiI+pbY1P3bY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=keyEzIDybdSRFuf23jD+bgtCRZulSM9l68Pd6l6Myp/pAE8Upf7qu16/lE01SFxBLIAETDmJY/GWUuIb4dyw+kUv8hqbYnuCX9kDcNHHlCNFiUB+JessTq3AQvHfBJztR+Xo+4+gsh6W1oIAlpMz/HcqKWDue5/KGF9l2QIcrRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Ui7PlsNV; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=X23cuzdH; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Ui7PlsNV";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="X23cuzdH"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983123;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wRcDGGOVZ1LZ25yuMoSMO7ckXFHBDPeZI42oxlLlIKU=;
	b=Ui7PlsNV56drEEmh+07ctPKSZlBfJX9OK2R04ig2NHOtpUpNXbhljtCPDsK4Tm3NhS/Xrh
	8kqAbt4T/XD116R+k3JpjGYw/PLQpm23O7T7DIxJvloIYUaeT8sfXtKTik/w9vIa/OM7gg
	mW2dAw6RET2qJNQadwJfgnMIhKG70h7PIuikpkRrDU8Ep26sSgiUJVMo4Ipdj9eHTSGrnz
	5yo58h5kZ7zdPo76oL6ShRhrfOn+VuUNOpAI0tV5NK4Dgwx67x37/pRn+B5gP9FNgnZGxr
	RggshhXrBcVjAc2TpxDce3NM25BhfG0LttDaZ7ohdjo+deXVwVUeWKaM+bQ4eA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983123;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wRcDGGOVZ1LZ25yuMoSMO7ckXFHBDPeZI42oxlLlIKU=;
	b=X23cuzdHS7NKhSjUMH8bp273LLN5pPVIvwm/v1Bht5cXD6j7ChtAoBGnU5QQeCBbj0oYOU
	I7nd8u+XvXSN8HBg==
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
Subject: [PATCH v7 102/120] x86/cpu: Use parsed CPUID(0x80000007)
Date: Thu, 28 May 2026 17:39:04 +0200
Message-ID: <20260528153923.403473-103-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For Intel, Centar, and Zhaoxin early init, use parsed CPUID(0x80000007)
instead of doing ugly bitwise operations on cpuinfo_x86::x86_power.

The latter is backed by a direct CPUID query and will be later removed.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/centaur.c |  4 +++-
 arch/x86/kernel/cpu/intel.c   | 13 +++++++------
 arch/x86/kernel/cpu/zhaoxin.c |  4 +++-
 3 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kernel/cpu/centaur.c b/arch/x86/kernel/cpu/centaur.c
index 86cbe4427453..29688aec2231 100644
--- a/arch/x86/kernel/cpu/centaur.c
+++ b/arch/x86/kernel/cpu/centaur.c
@@ -89,6 +89,8 @@ enum {
 
 static void early_init_centaur(struct cpuinfo_x86 *c)
 {
+	const struct leaf_0x80000007_0 *el7 = cpuid_leaf(c, 0x80000007);
+
 #ifdef CONFIG_X86_32
 	/* Emulate MTRRs using Centaur's MCR. */
 	if (c->x86 == 5)
@@ -98,7 +100,7 @@ static void early_init_centaur(struct cpuinfo_x86 *c)
 	    (c->x86 >= 7))
 		set_cpu_cap(c, X86_FEATURE_CONSTANT_TSC);
 
-	if (c->x86_power & (1 << 8)) {
+	if (el7 && el7->constant_tsc) {
 		set_cpu_cap(c, X86_FEATURE_CONSTANT_TSC);
 		set_cpu_cap(c, X86_FEATURE_NONSTOP_TSC);
 	}
diff --git a/arch/x86/kernel/cpu/intel.c b/arch/x86/kernel/cpu/intel.c
index 7ef3ba2eca3a..7b1944260004 100644
--- a/arch/x86/kernel/cpu/intel.c
+++ b/arch/x86/kernel/cpu/intel.c
@@ -201,6 +201,7 @@ void intel_unlock_cpuid_leafs(struct cpuinfo_x86 *c)
 
 static void early_init_intel(struct cpuinfo_x86 *c)
 {
+	const struct leaf_0x80000007_0 *el7 = cpuid_leaf(c, 0x80000007);
 	u64 misc_enable;
 
 	if (c->x86 >= 6 && !cpu_has(c, X86_FEATURE_IA64))
@@ -249,16 +250,16 @@ static void early_init_intel(struct cpuinfo_x86 *c)
 		c->x86_phys_bits = 36;
 
 	/*
-	 * c->x86_power is 8000_0007 edx. Bit 8 is TSC runs at constant rate
-	 * with P/T states and does not stop in deep C-states.
+	 * CPUID(0x80000007).constant_tsc implies that TSC runs at constant
+	 * rate with P/T states and does not stop in deep C-states
 	 *
-	 * It is also reliable across cores and sockets. (but not across
-	 * cabinets - we turn it off in that case explicitly.)
+	 * It is also reliable across cores and sockets, but not across
+	 * cabinets; disable it explicitly in that case.
 	 *
 	 * Use a model-specific check for some older CPUs that have invariant
-	 * TSC but may not report it architecturally via 8000_0007.
+	 * TSC but may not report it architecturally via CPUID(0x80000007).
 	 */
-	if (c->x86_power & (1 << 8)) {
+	if (el7 && el7->constant_tsc) {
 		set_cpu_cap(c, X86_FEATURE_CONSTANT_TSC);
 		set_cpu_cap(c, X86_FEATURE_NONSTOP_TSC);
 	} else if ((c->x86_vfm >= INTEL_P4_PRESCOTT && c->x86_vfm <= INTEL_P4_CEDARMILL) ||
diff --git a/arch/x86/kernel/cpu/zhaoxin.c b/arch/x86/kernel/cpu/zhaoxin.c
index b068922efed9..5918f9387c87 100644
--- a/arch/x86/kernel/cpu/zhaoxin.c
+++ b/arch/x86/kernel/cpu/zhaoxin.c
@@ -50,10 +50,12 @@ static void init_zhaoxin_cap(struct cpuinfo_x86 *c)
 
 static void early_init_zhaoxin(struct cpuinfo_x86 *c)
 {
+	const struct leaf_0x80000007_0 *el7 = cpuid_leaf(c, 0x80000007);
+
 	if (c->x86 >= 0x6)
 		set_cpu_cap(c, X86_FEATURE_CONSTANT_TSC);
 
-	if (c->x86_power & (1 << 8)) {
+	if (el7 && el7->constant_tsc) {
 		set_cpu_cap(c, X86_FEATURE_CONSTANT_TSC);
 		set_cpu_cap(c, X86_FEATURE_NONSTOP_TSC);
 	}
-- 
2.54.0

