Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F096B3921D2
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774578150; cv=none; b=ZP54cVngJ3DsSVluhg5anbkXV5plZkOGr5JkWhmqq72ujPOit1tEuFEzlk7H2RFqz3qO7dDBA9xwNIzIDmTcuyEYiGzqFqrWFIrFgbCzU2V5KJS3FZgCLwvH9MvJGjeWsKdYt2tTrQV/S2mm+xf3v0LEjhQNZcbwUbZ+YBjuc6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774578150; c=relaxed/simple;
	bh=NcyHq7OCmwiFaPHG91BMY6vz5YdXWgJNRJb1ugfFLkw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IVo5YtisETlvcD3hIdrNNAX0AJcbIEoBwwNO8ws/Z07AHCkxn0M61KX8FyMfYA1t5yy/oq4Mq2cx/M4oXjTqTp7u45k40RLlsut2mYIzaeboG3O18vP96RmSwVfKC5+3ZPoVuja0zgyCqRBIncgRM2bH7l7pU8oviZwLuyKaYO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CPb6kTPa; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=5s7+3XQZ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CPb6kTPa";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="5s7+3XQZ"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774578147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eVM/2a8qsyfJPHaCxnwzGObirqjcz/jVYuSOKlyUg48=;
	b=CPb6kTPaRCRNyhGCnUwVoBMYCBSrzurpQjhU412CXiTZXBmQD3OTrW2ZYmKiO/5jmy0QQI
	DPgpf1+QNzUYhl9ZK/u2f+RzD7J8SbulBn46Hb19fd5+97r8jZl2DBSRiWxwcp2WSxGE0q
	BJ+usOuJaqDZgVOUrGhT7zOn+J9O6KD/Pw3yJvqNilueLELCBac10ERje1WcpgouSUstxw
	DiI87r0mxGqC3NbxAqptbk/vla6kPd/2g/6OqpPMTv3OMGPPAqxeGq1u8888+Oh6Mus2cp
	Tue9//CLBhbOY9SR+7Kcoh54e2V+U1/SHw+qlPAyFnZn56mmvwAohdABvPp1VQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774578147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eVM/2a8qsyfJPHaCxnwzGObirqjcz/jVYuSOKlyUg48=;
	b=5s7+3XQZ5lwG1Czyfvi+cvMel8m9Wk5SIBWSb2nGgPYY4Pnz057FXbdAZiuh06ERGo6Z6E
	n1ZCQDNSzBMiWuBg==
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
Subject: [PATCH v6 85/90] x86/cpu: Remove x86_capability[] and x86_power initialization
Date: Fri, 27 Mar 2026 03:16:39 +0100
Message-ID: <20260327021645.555257-86-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

X86_FEATURE queries are now routed to the CPUID tables instead of to
x86_capability[].

x86_power call sites have all been converted to parsed CPUID(0x80000007)
access.

Remove all direct CPUID queries which populate x86_capability[] and
x86_power.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/common.c | 58 ------------------------------------
 1 file changed, 58 deletions(-)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 98e53f5aa41d..4c2739f31e3d 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -1018,70 +1018,12 @@ static void init_speculation_control(struct cpuinfo_x86 *c)
 void get_cpu_cap(struct cpuinfo_x86 *c)
 {
 	const struct leaf_0x80000000_0 *el0;
-	u32 eax, ebx, ecx, edx;
 
 	cpuid_scan_cpu(c);
 
-	/* Intel-defined flags: level 0x00000001 */
-	if (c->cpuid_level >= 0x00000001) {
-		cpuid(0x00000001, &eax, &ebx, &ecx, &edx);
-
-		c->x86_capability[CPUID_1_ECX] = ecx;
-		c->x86_capability[CPUID_1_EDX] = edx;
-	}
-
-	/* Thermal and Power Management Leaf: level 0x00000006 (eax) */
-	if (c->cpuid_level >= 0x00000006)
-		c->x86_capability[CPUID_6_EAX] = cpuid_eax(0x00000006);
-
-	/* Additional Intel-defined flags: level 0x00000007 */
-	if (c->cpuid_level >= 0x00000007) {
-		cpuid_count(0x00000007, 0, &eax, &ebx, &ecx, &edx);
-		c->x86_capability[CPUID_7_0_EBX] = ebx;
-		c->x86_capability[CPUID_7_ECX] = ecx;
-		c->x86_capability[CPUID_7_EDX] = edx;
-
-		/* Check valid sub-leaf index before accessing it */
-		if (eax >= 1) {
-			cpuid_count(0x00000007, 1, &eax, &ebx, &ecx, &edx);
-			c->x86_capability[CPUID_7_1_EAX] = eax;
-		}
-	}
-
-	/* Extended state features: level 0x0000000d */
-	if (c->cpuid_level >= 0x0000000d) {
-		cpuid_count(0x0000000d, 1, &eax, &ebx, &ecx, &edx);
-
-		c->x86_capability[CPUID_D_1_EAX] = eax;
-	}
-
 	el0 = cpuid_leaf(c, 0x80000000);
 	c->extended_cpuid_level = el0 ? el0->max_ext_leaf : 0;
 
-	if (c->extended_cpuid_level >= 0x80000001) {
-		cpuid(0x80000001, &eax, &ebx, &ecx, &edx);
-
-		c->x86_capability[CPUID_8000_0001_ECX] = ecx;
-		c->x86_capability[CPUID_8000_0001_EDX] = edx;
-	}
-
-	if (c->extended_cpuid_level >= 0x80000007)
-		c->x86_power = cpuid_edx(0x80000007);
-
-	if (c->extended_cpuid_level >= 0x80000008) {
-		cpuid(0x80000008, &eax, &ebx, &ecx, &edx);
-		c->x86_capability[CPUID_8000_0008_EBX] = ebx;
-	}
-
-	if (c->extended_cpuid_level >= 0x8000000a)
-		c->x86_capability[CPUID_8000_000A_EDX] = cpuid_edx(0x8000000a);
-
-	if (c->extended_cpuid_level >= 0x8000001f)
-		c->x86_capability[CPUID_8000_001F_EAX] = cpuid_eax(0x8000001f);
-
-	if (c->extended_cpuid_level >= 0x80000021)
-		c->x86_capability[CPUID_8000_0021_EAX] = cpuid_eax(0x80000021);
-
 	init_scattered_cpuid_features(c);
 	init_speculation_control(c);
 
-- 
2.53.0

