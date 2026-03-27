Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9473368B9
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774577881; cv=none; b=qbysjqCt/2FfJjui7O40tBRFHqigkA3V9Sc+USObYLmEz+yV77TSZfJURpyjfhR5JvElQnzWYVPJ6a1ibyjn2pdiuh1xX4cVUA45Syosa/oW38d96LEZHaEvhnGjpMyl8SMiQTv2yV/FiXKJMxD1O7DCO3H/HiRf2OpgrJMnpbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774577881; c=relaxed/simple;
	bh=jHpSDCkzZ+YS/XwpSke6UM5tl7cnzN3YqQW6FkxZ7Kg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QosmvieFqyzQmYY27PULUPyoIWE1cqdMfgKc3J1IezS7QWJ54KUMRhoFsu54tcNIw6mCVDyAhKSOpNoWg5KgfvF9zmjdbwM4aE7A0q2Z44y/+owaamxod4Suw4v5ORU84cIvoMnpdUPU7M7mOplPHt7zMjumHvCv404POmUcRI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=EH5+RYpI; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=t4wjpd9W; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EH5+RYpI";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="t4wjpd9W"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774577878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+LbBgZnLJZy22gGEEaQmFxt6EbKenQxGFTaae9eknmU=;
	b=EH5+RYpICMl+V/4yDLzXSPdmvKqwO3gKy5eCZYKmjsFl3JSwvNA04aUHRNjnyWT7V/qfAA
	dL9kmz6nTEwh8KLE5xTMkBVnyBnPbligU2tpvcY5hIVCTiHgU5vf2KBCaiRtihAGIG9Yqn
	6OjDI9SlUkUK0agJtFnU2mrIrUuv1VWj86EDB2ADo0MkT+zfzX+hlNgy+2qakE1VlrsMfA
	VH5fuFgemb95ZhCHC4O46xgxc+/P7NonkC1ohJ0oHz06Lem+FC+qtoRB5cDEuC7hiGYZOv
	kqaHENdLNYaXV4o4VyZ/AXALfHtURxwZcZ9I1jnq1zPspywRL/hJVf5pLXLR4g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774577878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+LbBgZnLJZy22gGEEaQmFxt6EbKenQxGFTaae9eknmU=;
	b=t4wjpd9WJNTBkJyaniI3a+22ZZG1HCA4MfMH0RIvWzigN+pmkR/r8ZFodCztZFEvMOK6HB
	ZNfl909DjOnXx1DQ==
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
Subject: [PATCH v6 10/90] x86/cpu: Rescan CPUID table after disabling PSN
Date: Fri, 27 Mar 2026 03:15:24 +0100
Message-ID: <20260327021645.555257-11-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Pentium-III and Transmeta CPUs, disabling the CPUID(0x3) Processor
Serial Number (PSN) can affect the maximum valid CPUID standard leaf.

Rescan the CPU's CPUID table in that case not to have stale cached data.
Rescan only the changed CPUID leaves, not to override any of the kernel's
previously force-set or unset cached CPUID bits.

Rename squash_the_stupid_serial_number() to disable_cpu_serial_number() and
explain the rationale behind disabling the CPU's PSN.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/common.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 303faa612a6c..8fd7d2f480bf 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -336,15 +336,19 @@ bool cpuid_feature(void)
 	return flag_is_changeable_p(X86_EFLAGS_ID);
 }
 
-static void squash_the_stupid_serial_number(struct cpuinfo_x86 *c)
+/*
+ * For privacy concerns, disable legacy Intel and Transmeta CPUID(0x3)
+ * feature, Processor Serial Number, by default.
+ */
+static void disable_cpu_serial_number(struct cpuinfo_x86 *c)
 {
+	const struct leaf_0x0_0 *l0;
+	unsigned int rescan_from;
 	unsigned long lo, hi;
 
 	if (!cpu_has(c, X86_FEATURE_PN) || !disable_x86_serial_nr)
 		return;
 
-	/* Disable processor serial number: */
-
 	rdmsr(MSR_IA32_BBL_CR_CTL, lo, hi);
 	lo |= 0x200000;
 	wrmsr(MSR_IA32_BBL_CR_CTL, lo, hi);
@@ -352,8 +356,18 @@ static void squash_the_stupid_serial_number(struct cpuinfo_x86 *c)
 	pr_notice("CPU serial number disabled.\n");
 	clear_cpu_cap(c, X86_FEATURE_PN);
 
-	/* Disabling the serial number may affect the cpuid level */
-	c->cpuid_level = cpuid_eax(0);
+	/*
+	 * Disabling CPUID(0x3) can change the maximum standard CPUID level
+	 */
+
+	cpuid_refresh_leaf(c, 0x0);
+	l0 = cpuid_leaf(c, 0x0);
+	if (!l0)
+		return;
+
+	rescan_from = min_t(int, l0->max_std_leaf, c->cpuid_level) + 1;
+	cpuid_refresh_range(c, rescan_from, CPUID_BASE_END);
+	c->cpuid_level = l0->max_std_leaf;
 }
 
 static int __init x86_serial_nr_setup(char *s)
@@ -363,7 +377,7 @@ static int __init x86_serial_nr_setup(char *s)
 }
 __setup("serialnumber", x86_serial_nr_setup);
 #else
-static inline void squash_the_stupid_serial_number(struct cpuinfo_x86 *c)
+static inline void disable_cpu_serial_number(struct cpuinfo_x86 *c)
 {
 }
 #endif
@@ -2046,7 +2060,7 @@ static void identify_cpu(struct cpuinfo_x86 *c)
 	bus_lock_init();
 
 	/* Disable the PN if appropriate */
-	squash_the_stupid_serial_number(c);
+	disable_cpu_serial_number(c);
 
 	setup_smep(c);
 	setup_smap(c);
-- 
2.53.0

