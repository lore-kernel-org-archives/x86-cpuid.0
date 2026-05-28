Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637A6480332
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983169; cv=none; b=s1bKyBsJJbzy+4tE+tbtb+Us0STuEdO9K16ewPzKusm8LFA/eJEELU9YieUXGu64baA8XJG0sj4RftEgKvoPrvDyt9ccm9oUqw4oMpRn5HspLSHOcgDe+u4MC05hB27jHr70WylROR3YRoq8JhKtU017M548IYC2byTuKN4izKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983169; c=relaxed/simple;
	bh=ClYMYMB+DJcuC/0CGYbYjuXf4kU6sUlmszbs30kV5Os=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WZE+zKWtNHAUfMpHqbIyDAJgoTottawYYDIAazSPz6UuMtvr2MpD8Ar6CrAtda3+94EDYaTx0xeM2epNGLH4fL3wNyHN3KSQZGC5xxd5OB3nQEKfA7djkrzJxOIdB/AdCjRNb6/gz0bht4aP8wgo5ujaksepisFynWjOBgv9FFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=FzidPPfr; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qVPlz115; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="FzidPPfr";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qVPlz115"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7nCEbPCdbAbCe5gGNYzmr1UTgO0IgjQS43dsg5YKpDg=;
	b=FzidPPfrrwWf8P/MPgA+B43JZbxhJCMxIl28KHNECTvl0zcihwErsnQczuJ8hNS55nsgDz
	aaSWf9vIkJKgiD7GvbD1Cc7VskjRgKFc2Mf/aCa8ArIRc1dOAoxGxxh1Trzupu626wi5Kh
	gjPmFjKPnAR6oL2dUd9UywL56LlkKjV0x9/pW86FKpjS4TegJ5p470dxZIPyx3PyLQ9klS
	Jhii/B5VT3eiMR9m+F3wOdkMYlypF7HoPEPTjTc3w9tTXqB3KdACguK1eumGhcylGk7HMd
	QSub42TDpJvMdUq4fWA4AtWFEdv3RRHQw8t/N1RtgOmt2Aa9EhP8gOjpiUsn0g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7nCEbPCdbAbCe5gGNYzmr1UTgO0IgjQS43dsg5YKpDg=;
	b=qVPlz1156moMY7uOVF52v/jqZjcoWsWyQaQXblX4AtF+v02Nsx/Cz10DyD7s3VLAB+P/HO
	VdbXC1cxXlGCr+DQ==
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
Subject: [PATCH v7 115/120] x86/cpu: Remove x86_capability[] and x86_power initialization
Date: Thu, 28 May 2026 17:39:17 +0200
Message-ID: <20260528153923.403473-116-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
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
index d6b3550b9f11..08e7c44dbc77 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -1020,70 +1020,12 @@ static void init_speculation_control(struct cpuinfo_x86 *c)
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
2.54.0

