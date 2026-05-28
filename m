Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38E43FFAD7
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982851; cv=none; b=Lxok7ag4e0SYtwn+I+RuOnKQ38dlg6zwT5jJbL969kwxh2Bt+g8NuBCtsA09LBCSnvE8Ws6Q5zGThtOp2lOx51Q7hqX7urmedptT+BnpP9PnRlUlkrlmN/RnqscpZyvh/ibup4m5gnkKD5bLQxTJUlhexp+QcHzmP5S6ed3QNtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982851; c=relaxed/simple;
	bh=m0DY/le5OA+z21u8MoM2o4qd3b0XSKW/pJSo4SWhVYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LnWOZrV+LSUMZ+8y2HodK05uFXMPA+bK0i43eT651/EVY3v4YmB6Ql1eXBFxDTEAh2wS4u/GLDaz4yGPECSZXKFxPAsZ8RXa0P8MZgw8lOmMp749VzCW9/HBUzrx6VCGpbCiGuAA3SVJ2OmfUyOQHCSmhDVa4pMBuJ7qWGLY5Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=19QcD0nm; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cy1a+sti; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="19QcD0nm";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cy1a+sti"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HJHgOflxzKxO02RFGmkZqr9sbCX1DNem7jOTKTHQ2bs=;
	b=19QcD0nmZtLWg37apEfVdLPc5Oxu6xWEpyj80eINnr8UwZu5j72PLL+zzMeu/w7cbk2rt3
	o4H0X5wIIfRDxY2FRpxQfGaRFDNN0Ifx7Odofh7U7gcfMQpuEXAVboHx35m0aa8CYi8B2T
	CNhJl948cWwgsS6iHgeNVaAvNmdpsX3KB3LgWCjc3rgNjZx1312IsYgPOXOnt3hyq8zHJX
	7HqmWDlvoEFNoTMoqHTiV70G9LzFN7/7fGIXvlcPsurF+OE6QsSjEga1RLLgpSzUwpESjU
	LAFOdQSOgW9/V55ZR3WcyWSKpYWNJByo7pGh4NlrHpWlejEKVsVvl1/ZZAXUhw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HJHgOflxzKxO02RFGmkZqr9sbCX1DNem7jOTKTHQ2bs=;
	b=cy1a+sti1WisHtbly03ntSi0ujk27nmCfLs4R4Bm8wB7BUQfJvRU/bXJWnk6QmJuhCMfSZ
	lEFHl3BzZFP0hCBw==
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
Subject: [PATCH v7 019/120] x86/tsc: Use parsed CPUID(0x16)
Date: Thu, 28 May 2026 17:37:41 +0200
Message-ID: <20260528153923.403473-20-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

At the x86 timestamp counter code, use parsed CPUID(0x16) access instead of
a direct CPUID query.

Beside the CPUID parser centralization benefits, this allows using the
auto-generated <asm/cpuid/leaf_types.h> data types, and their full C99
bitfields, instead of doing ugly bitwise operations on CPUID output.

Remove the "max standard level >= CPUID_LEVEL_FREQ" check since the CPUID
parser API's NULL check is equivalent.

Remove the Intel vendor check since the CPUID parser does a similar check
before caching CPUID(0x16) output.  Thus the CPUID API's NULL check is also
equivalent.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/tsc.c | 24 +++++-------------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index c5110eb554bc..0043ed398578 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -664,6 +664,7 @@ static unsigned long quick_pit_calibrate(void)
  */
 unsigned long native_calibrate_tsc(void)
 {
+	const struct leaf_0x16_0 *l16 = cpuid_leaf(&boot_cpu_data, 0x16);
 	unsigned int eax_denominator, ebx_numerator, ecx_hz, edx;
 	unsigned int crystal_khz;
 
@@ -705,13 +706,8 @@ unsigned long native_calibrate_tsc(void)
 	 * clock, but we can easily calculate it to a high degree of accuracy
 	 * by considering the crystal ratio and the CPU speed.
 	 */
-	if (crystal_khz == 0 && boot_cpu_data.cpuid_level >= CPUID_LEAF_FREQ) {
-		unsigned int eax_base_mhz, ebx, ecx, edx;
-
-		cpuid(CPUID_LEAF_FREQ, &eax_base_mhz, &ebx, &ecx, &edx);
-		crystal_khz = eax_base_mhz * 1000 *
-			eax_denominator / ebx_numerator;
-	}
+	if (crystal_khz == 0 && l16)
+		crystal_khz = l16->cpu_base_mhz * 1000 * eax_denominator / ebx_numerator;
 
 	if (crystal_khz == 0)
 		return 0;
@@ -738,19 +734,9 @@ unsigned long native_calibrate_tsc(void)
 
 static unsigned long cpu_khz_from_cpuid(void)
 {
-	unsigned int eax_base_mhz, ebx_max_mhz, ecx_bus_mhz, edx;
-
-	if (boot_cpu_data.x86_vendor != X86_VENDOR_INTEL)
-		return 0;
-
-	if (boot_cpu_data.cpuid_level < CPUID_LEAF_FREQ)
-		return 0;
-
-	eax_base_mhz = ebx_max_mhz = ecx_bus_mhz = edx = 0;
-
-	cpuid(CPUID_LEAF_FREQ, &eax_base_mhz, &ebx_max_mhz, &ecx_bus_mhz, &edx);
+	const struct leaf_0x16_0 *l16 = cpuid_leaf(&boot_cpu_data, 0x16);
 
-	return eax_base_mhz * 1000;
+	return l16 ? (l16->cpu_base_mhz * 1000) : 0;
 }
 
 /*
-- 
2.54.0

