Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B10D43E9CB
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983007; cv=none; b=em2EMRQ0fRhTg/N1KQOvQTUYnRwbMq5LXCm2iXTvbDpz38vQ2KzkXpFkF1BzQmLat42xzvhiep/dhnl3kXY4fWbemuaj43mDnC4Q4EFnghVTkJxVY+vZ+0JEUOCkQEd9OBFm76U1hwfV0wDxfHk+c+DhTagdYbME03ZfAUtKajQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983007; c=relaxed/simple;
	bh=GK/v5tNIQdJYpJzvLfMQhao5u3flgWTkR/U4OysxEZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u/0sLapD/iSo/vagdq/RLaWERNJqSHsG9NWoD7fzqchvT3z2JbpYukUKuQKieHB4wnxtVkwZtT/aVJ4XtCxFVsifMmo1lnidJE+yt11FZXnOUoTG3+hvXvR0GPHIVjPAhgPMRAqp0NENTzxQqU3bR3JDQy585IwdQmaM23uFUJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yYa1ZMUA; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RkTsHTyg; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yYa1ZMUA";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="RkTsHTyg"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/TKCqzKq0KxicgXb/jFmqiHdFtBTUVE0X364IodOqok=;
	b=yYa1ZMUAT9SDPodYlwGGprmV67ZgzKv1pcZp9PwnBqF7CPhUYg9oN2gPCZSWJ+2ToidjjE
	L/rkD7kXAazh8ykGnEM/Hrf2fwdI0m3JdrnaDVcwcnZtrmhblxLEerZUQCfWXzXVx1TXYy
	dHdvrfQoNCw2nnxqG2+8ZuE13zaVaU4OKAU6SCbT4Zlkk4n1yFX2r1MsyMUeinpF2Y0lDR
	lOPGxn+XUALU2BbPGQOqqE2He+w0OoAdMCRhNKtrvzdrIqDluKxkJP8prihHYbidrTG43Y
	QeyyXuvJPaqe7zCrm4K3/zWBO5ymrwczeowd16/YVBqJldNvAWVBqvE92O9apw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/TKCqzKq0KxicgXb/jFmqiHdFtBTUVE0X364IodOqok=;
	b=RkTsHTygQSQyHXZPpcW+Wync+4KK8BZLO4IBdHo0ysEOgJdJu5NpZJffsTIg2FZn2KPq4j
	+4R/MSSyo07570Cg==
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
Subject: [PATCH v7 063/120] x86/acpi: Use parsed CPUID(0x5)
Date: Thu, 28 May 2026 17:38:25 +0200
Message-ID: <20260528153923.403473-64-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use parsed CPUID(0x5), plus CPUID(0x5) APIs, instead of doing ugly bitwise
operations and a direct CPUID query.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/acpi/cstate.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kernel/acpi/cstate.c b/arch/x86/kernel/acpi/cstate.c
index 4e7142d977c8..75db968473e8 100644
--- a/arch/x86/kernel/acpi/cstate.c
+++ b/arch/x86/kernel/acpi/cstate.c
@@ -123,18 +123,18 @@ static short mwait_supported[ACPI_PROCESSOR_MAX_POWER];
 
 static long acpi_processor_ffh_cstate_probe_cpu(void *_cx)
 {
+	struct cpuinfo_x86 *c = &cpu_data(smp_processor_id());
+	const struct leaf_0x5_0 *l5 = cpuid_leaf(c, 0x5);
 	struct acpi_processor_cx *cx = _cx;
-	unsigned int eax, ebx, ecx, edx;
-	unsigned int edx_part;
 	unsigned int cstate_type; /* C-state type and not ACPI C-state type */
 	unsigned int num_cstate_subtype;
 
-	cpuid(CPUID_LEAF_MWAIT, &eax, &ebx, &ecx, &edx);
+	if (!l5)
+		return -1;
 
 	/* Check whether this particular cx_type (in CST) is supported or not */
 	cstate_type = (MWAIT_HINT2CSTATE(cx->address) + 1) & MWAIT_CSTATE_MASK;
-	edx_part = edx >> (cstate_type * MWAIT_SUBSTATE_SIZE);
-	num_cstate_subtype = edx_part & MWAIT_SUBSTATE_MASK;
+	num_cstate_subtype = cpuid_mwait_n_substates(l5, cstate_type);
 
 	/* If the HW does not support any sub-states in this C-state */
 	if (num_cstate_subtype == 0) {
@@ -144,7 +144,7 @@ static long acpi_processor_ffh_cstate_probe_cpu(void *_cx)
 	}
 
 	/* mwait ecx extensions INTERRUPT_BREAK should be supported for C2/C3 */
-	if (!(ecx & CPUID5_ECX_EXTENSIONS_SUPPORTED) || !(ecx & CPUID5_ECX_INTERRUPT_BREAK))
+	if (!l5->mwait_ext || !l5->mwait_irq_break)
 		return -1;
 
 	if (!mwait_supported[cstate_type]) {
@@ -163,11 +163,13 @@ static long acpi_processor_ffh_cstate_probe_cpu(void *_cx)
 int acpi_processor_ffh_cstate_probe(unsigned int cpu,
 		struct acpi_processor_cx *cx, struct acpi_power_register *reg)
 {
-	struct cstate_entry *percpu_entry;
 	struct cpuinfo_x86 *c = &cpu_data(cpu);
+	struct cstate_entry *percpu_entry;
+	const struct leaf_0x5_0 *l5;
 	long retval;
 
-	if (!cpu_cstate_entry || c->cpuid_level < CPUID_LEAF_MWAIT)
+	l5 = cpuid_leaf(c, 0x5);
+	if (!cpu_cstate_entry || !l5)
 		return -1;
 
 	if (reg->bit_offset != NATIVE_CSTATE_BEYOND_HALT)
-- 
2.54.0

