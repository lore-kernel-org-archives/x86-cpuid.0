Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FF947DFAC
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983134; cv=none; b=KSVrOou5P7myDbfTGfUZ9MZpx3Ph8jzt5yh9OlWadzry1R8FVLFxLimA3MzJBmxgu/k9uhIJzlCqOUAIaWlneHLgaTOfYU+n3iClk6pNjiiRiHCGNsXrtcPt55pS4E5tBntVtX8eqYlNNeE2j+OlzBkjrod9ovylDD4QxL9CExU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983134; c=relaxed/simple;
	bh=+9GqzYCneIMUGG6+8LnjxX+VIZvFOunAdboY3sOnz0o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JvMB23KanRlYZhbuJ6R9CTSnT1lC0ijnMUEfqhUxamzvnN5X8IgAZT5WhSNVQVmRyDzdDI2hAADkRQXO9uI3RY5KJM2jz9VISnqnijZnZxF0qigUy0qLBre1H3J2OHH5yFTNaFpLwoTbLNmn3Vhfj0Q68wJqPFjFO5WDA+UdlGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=d/J1biVt; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tjTezFPH; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="d/J1biVt";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tjTezFPH"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OwjloHBK6gIX0SpDJctI4hTTjjQ1Z/VZ2N2dXQU/+GE=;
	b=d/J1biVtj14d20YG9QDxeLIejhvRsbfnORsMQ+fLmvalkfPlK94QWezaQl19CMR1/bW57H
	/Ffp3Mrdjk6KCG7gyHimEeYnN4wMPRjBlgNVUKqSlDCBE61jU2KlO8Om/tcGvUtxHeR8y/
	5kdn+SHSXypnhFLyAJJWrvakpyYIsVM9f4DLOwsFR+vWb+2SDFZ1VPVhB1TLFpbtxuMDXr
	0zdtV/n192tsyToMdtLENaH6K8aJtEWBVWM0qZ9mIe7+ehw3jHDXkF9DdQ9z7mP5s7OK3U
	LbGN5SJp7dC8YS5hSzdz/bAWv1C+U9czA7QodzeYQygWDfgCP5R4WD4S2+rYZw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OwjloHBK6gIX0SpDJctI4hTTjjQ1Z/VZ2N2dXQU/+GE=;
	b=tjTezFPHZ5Qw3ZasBKaML/6M48Y7JX/1nbLoiRK+4gcWFDa81l+3huevEIk+989H75ANuE
	oULtEGmPHbL4XaAw==
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
Subject: [PATCH v7 103/120] x86/cpu: amd/hygon: Use parsed CPUID(0x80000007)
Date: Thu, 28 May 2026 17:39:05 +0200
Message-ID: <20260528153923.403473-104-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use parsed CPUID(0x80000007) instead of doing ugly bitwise operations on
cpuinfo_x86::x86_power.  The latter is backed by a direct CPUID query and
will be later removed.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/amd.c   | 25 +++++++++++--------------
 arch/x86/kernel/cpu/hygon.c | 25 +++++++++++--------------
 2 files changed, 22 insertions(+), 28 deletions(-)

diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
index 5f885fafa238..0b5d8d0c3d29 100644
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -612,6 +612,7 @@ static void early_detect_mem_encrypt(struct cpuinfo_x86 *c)
 
 static void early_init_amd(struct cpuinfo_x86 *c)
 {
+	const struct leaf_0x80000007_0 *el7 = cpuid_leaf(c, 0x80000007);
 	u32 dummy;
 
 	if (c->x86 >= 0xf)
@@ -619,22 +620,18 @@ static void early_init_amd(struct cpuinfo_x86 *c)
 
 	rdmsr_safe(MSR_AMD64_PATCH_LEVEL, &c->microcode, &dummy);
 
-	/*
-	 * c->x86_power is 8000_0007 edx. Bit 8 is TSC runs at constant rate
-	 * with P/T states and does not stop in deep C-states
-	 */
-	if (c->x86_power & (1 << 8)) {
-		set_cpu_cap(c, X86_FEATURE_CONSTANT_TSC);
-		set_cpu_cap(c, X86_FEATURE_NONSTOP_TSC);
-	}
+	if (el7) {
+		if (el7->constant_tsc) {
+			set_cpu_cap(c, X86_FEATURE_CONSTANT_TSC);
+			set_cpu_cap(c, X86_FEATURE_NONSTOP_TSC);
+		}
 
-	/* Bit 12 of 8000_0007 edx is accumulated power mechanism. */
-	if (c->x86_power & BIT(12))
-		set_cpu_cap(c, X86_FEATURE_ACC_POWER);
+		if (el7->proc_power_reporting)
+			set_cpu_cap(c, X86_FEATURE_ACC_POWER);
 
-	/* Bit 14 indicates the Runtime Average Power Limit interface. */
-	if (c->x86_power & BIT(14))
-		set_cpu_cap(c, X86_FEATURE_RAPL);
+		if (el7->rapl_interface)
+			set_cpu_cap(c, X86_FEATURE_RAPL);
+	}
 
 #ifdef CONFIG_X86_64
 	set_cpu_cap(c, X86_FEATURE_SYSCALL32);
diff --git a/arch/x86/kernel/cpu/hygon.c b/arch/x86/kernel/cpu/hygon.c
index 4a63538c2b3f..8f31005bc802 100644
--- a/arch/x86/kernel/cpu/hygon.c
+++ b/arch/x86/kernel/cpu/hygon.c
@@ -125,28 +125,25 @@ static void bsp_init_hygon(struct cpuinfo_x86 *c)
 
 static void early_init_hygon(struct cpuinfo_x86 *c)
 {
+	const struct leaf_0x80000007_0 *el7 = cpuid_leaf(c, 0x80000007);
 	u32 dummy;
 
 	set_cpu_cap(c, X86_FEATURE_K8);
 
 	rdmsr_safe(MSR_AMD64_PATCH_LEVEL, &c->microcode, &dummy);
 
-	/*
-	 * c->x86_power is 8000_0007 edx. Bit 8 is TSC runs at constant rate
-	 * with P/T states and does not stop in deep C-states
-	 */
-	if (c->x86_power & (1 << 8)) {
-		set_cpu_cap(c, X86_FEATURE_CONSTANT_TSC);
-		set_cpu_cap(c, X86_FEATURE_NONSTOP_TSC);
-	}
+	if (el7) {
+		if (el7->constant_tsc) {
+			set_cpu_cap(c, X86_FEATURE_CONSTANT_TSC);
+			set_cpu_cap(c, X86_FEATURE_NONSTOP_TSC);
+		}
 
-	/* Bit 12 of 8000_0007 edx is accumulated power mechanism. */
-	if (c->x86_power & BIT(12))
-		set_cpu_cap(c, X86_FEATURE_ACC_POWER);
+		if (el7->proc_power_reporting)
+			set_cpu_cap(c, X86_FEATURE_ACC_POWER);
 
-	/* Bit 14 indicates the Runtime Average Power Limit interface. */
-	if (c->x86_power & BIT(14))
-		set_cpu_cap(c, X86_FEATURE_RAPL);
+		if (el7->rapl_interface)
+			set_cpu_cap(c, X86_FEATURE_RAPL);
+	}
 
 #ifdef CONFIG_X86_64
 	set_cpu_cap(c, X86_FEATURE_SYSCALL32);
-- 
2.54.0

