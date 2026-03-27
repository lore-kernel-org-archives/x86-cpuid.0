Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73783806D9
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774578107; cv=none; b=hWmk3XGURTg9IKXTdxh0sYI4QLiGcGvIX2HAc+h2HlWpRwFjRTyei2Wl5v4MtDhv81SG5gz33lFAUO+NGM//j+n9bR6bc8Q4yK2uLyZci8tx7Fl+BzFKjbmtLWEOR/qMAo05vN4I3brHW3+DaQxFCgS6NdY/Zpmc+MdqOdsCoVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774578107; c=relaxed/simple;
	bh=e+MD6ty8wZ8eXxKciAGHSIOudpMchrw7xhC0CyM2pj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SiKuyCbfYQeLmATVgZeKfXKBi8hnJzyhje3d7vvRnGTt1JVTjVy6ugi4PltX4PqHrd4msJFQzHtsyJefLGXPrHp/0C6oh8azF7i1cUbJPQuHt6i9Kivl8fBTsHhIOoLay6AXB+EY4WHtAVnyUnC2m/DjA3CGjkpw/HdEp1f7fwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=gA4s3k74; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=IYnd99zf; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gA4s3k74";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IYnd99zf"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774578103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AAvn3qOEM3Vwm1f30Pnr1M3ypziLQ66JJBfFkFAQwUk=;
	b=gA4s3k74so7G6qcgUbYVcmVn1b/loSp00pbqx+Fg83DHGRreqiG/hfSXAxLtHdAEU2ECpE
	xCvnPxxi5c9TWnVRRJ+m3PBewJtjA7JA2B0wIiRKrWhvRy3N8lNJqtYnYEprQjYLBW3UqB
	gl1htlswRa84f+k9g00H5hIEvKWpoua0mBO8/Jae3X5qoys2vQwgl61dOhmuk6N16PUsTj
	e+Zb5MnJ1jb+jwhMhuntmvb0P+gPZKnKJpN/XBsayUodB4/UbuWVyAWor0lgDOujDdz2/p
	EaUexuOf7z9W/PTGYGXcE89rssJHwEnp85FO570jH3+tI4YO5VO01ifcZ1MVwg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774578103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AAvn3qOEM3Vwm1f30Pnr1M3ypziLQ66JJBfFkFAQwUk=;
	b=IYnd99zfFihdtioVnMI61uNbVKy584cBN2cA0sG9OmVfjV1lA+2oDI0YTdby4rdyVMCFUV
	QefCnvAulwBwR2CQ==
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
Subject: [PATCH v6 72/90] x86/cpu: Use parsed CPUID(0x80000007)
Date: Fri, 27 Mar 2026 03:16:26 +0100
Message-ID: <20260327021645.555257-73-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
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
index 7f186c68d701..e84042d1bbca 100644
--- a/arch/x86/kernel/cpu/intel.c
+++ b/arch/x86/kernel/cpu/intel.c
@@ -215,6 +215,7 @@ void intel_unlock_cpuid_leafs(struct cpuinfo_x86 *c)
 
 static void early_init_intel(struct cpuinfo_x86 *c)
 {
+	const struct leaf_0x80000007_0 *el7 = cpuid_leaf(c, 0x80000007);
 	u64 misc_enable;
 
 	if (c->x86 >= 6 && !cpu_has(c, X86_FEATURE_IA64))
@@ -262,16 +263,16 @@ static void early_init_intel(struct cpuinfo_x86 *c)
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
2.53.0

