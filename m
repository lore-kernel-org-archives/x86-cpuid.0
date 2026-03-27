Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F143815E7
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774578111; cv=none; b=Nrw21dDr6clo5/IQiMH9U5pCNCFWlt3JW7c4a4s4XxyVNFCtFt57qpVuvKj+fPXwuL1668uqw/bnRqmevpt5PGjV8IXwX29mk86wIUnCI+Ru1WuWX3Fkc1yoy/LlpYm3qa4jS8H2/shbKuiMwBDIPR7Tvfn25cFuK3KxxJfGFhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774578111; c=relaxed/simple;
	bh=3ip9D8kjLufcOqX9eQBZGeqe4HxRgtZuOovV0z6vdc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lP06WY+Pbuq5iTxqVawJHhthNCjwpc8WyqxinVLBx3QvGNey8+8BAeY8oe0gmhXtveo1Q90GyDiut+kOBEebezj4BE0uyT2szvcDli2MPtELLT+aEAmIii/wJU6ttdBGvnOTFZPMMZmhjhWyNSCYUyIc1pSrOJGfjaqHXHwSzzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cAbrlM3H; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=KvkYHOBM; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cAbrlM3H";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KvkYHOBM"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774578107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KZb6rUOqZFUm49ucvlNo4kBgTsALtw578lYF4qGbRAM=;
	b=cAbrlM3Hxk6D63eWVIQpT/+91rUxNgpy4nKzRCAvuOOUhoX8QwCg4HfqHhKrKLrgJKDfmb
	c5wVfbiqO29XNHZyXkI4s1Qre3MqnUiFm02/h8Dnn/KzQ+3OQ9WJJI+aVbFgninh4hEKK9
	sHkEFMYy/hETKv449i/YeDyE/HTVWz/5uEYPVDdd57KKPhnFJy8F5MepHRVWYJhpKSQniH
	xPt49iZDBHKHVJWl4ivSlZe8pnbInHjb0uS3SYRdnngA12U++OSA3hVOjt6qM7gDMZj10E
	NPjDevZplNmkH9YAkddcN0h6IR7ZW1c4mK9ev93r0xg2xp88+e3u/Pw6ura5Lw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774578107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KZb6rUOqZFUm49ucvlNo4kBgTsALtw578lYF4qGbRAM=;
	b=KvkYHOBM/Pa2qa21JFvPYDTQavflrdHn2ftrfW+Cc2yhmMqlrCd7WktDeOFmrVEQcYP1fv
	20RrKLueKeXodiAQ==
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
Subject: [PATCH v6 73/90] x86/cpu: amd/hygon: Use parsed CPUID(0x80000007)
Date: Fri, 27 Mar 2026 03:16:27 +0100
Message-ID: <20260327021645.555257-74-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
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
index 5fd7f34fa284..96b67b8b694c 100644
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -611,6 +611,7 @@ static void early_detect_mem_encrypt(struct cpuinfo_x86 *c)
 
 static void early_init_amd(struct cpuinfo_x86 *c)
 {
+	const struct leaf_0x80000007_0 *el7 = cpuid_leaf(c, 0x80000007);
 	u32 dummy;
 
 	if (c->x86 >= 0xf)
@@ -618,22 +619,18 @@ static void early_init_amd(struct cpuinfo_x86 *c)
 
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
2.53.0

