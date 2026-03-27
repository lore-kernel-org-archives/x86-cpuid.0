Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C0E3328E3
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774577928; cv=none; b=C/8s9HfYVWj4KXt3Zu/QrBcCGVdAgWFpbSdWXoZEwHm3wsbU3IG3UULW8dQqG2vznLSlrnORKBUmbeNfFWYf1ic+pz13qLO4GLuX00MmVuTIBI/PuwreurI9AeLAyIT/BlCTfjVzgOcFuFUg5RjG9gyH0a+dBzfHYqFra9dl/NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774577928; c=relaxed/simple;
	bh=zAcpzQAnyMaPTodNtCzk42xC54CY5UVyljN8ExORnZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sp4x4Ohx5186Ih/f/dcMZL8KzAuteZNFKjx0HR3ntBJMM1r8PtNCD9emwPmNxrnLwpXbZowIrNDYTqz7g3Cgm7qy4WCUiqLwWqXAiQyVc2AB8FBdmkLtKPRgYUkERQ8PY7H5/Oa3T5md9qxt5c+rlaHkW6Sw3d8rBhsYX9FdKPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jdM5UPZs; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=98TxSn6n; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jdM5UPZs";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="98TxSn6n"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774577923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jfYVBQoce66nz4LJfS/86I1RI8IDv/X/UZeCKN4jjTg=;
	b=jdM5UPZsVrYnJQPZQmlRkWO+0TL+IPHX3PLSpmGDtkhdc0SpJxm726cMLU+Na4j6Y1sEBh
	FZxJraEayZAMFNsakpVkcx8SacvnZM1YskJyIYSplg6/pOenQS8y+kyzgdhJNxGU5/Jkz8
	QRz6QnRuUlGklcWVqXldWg0wQBRNc7/+4+tkDL5PM7/tMT3dN42Y40hZGQRTVRl6MLYict
	F1HjTikJ3Kwn+z335/TvmvTnDAPntBNT7q1ifljLW8dHPBLQSqopCfQMHqXFu6d6lefP0K
	apc6ZlKaam9rz6sf7DmmcgonPL17P+nQpqR0YKgzzBBQdX2Atz0WThxvmqEXnA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774577923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jfYVBQoce66nz4LJfS/86I1RI8IDv/X/UZeCKN4jjTg=;
	b=98TxSn6n8L5O9wg6GUBMfjgl5afOmS8kw1D1Aac5O+5YIhosTCWxyI0CrJt+JCBiQoZZFJ
	k2UvLWC/Cs/i4bCg==
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
Subject: [PATCH v6 24/90] x86/tsc: Use parsed CPUID(0x16)
Date: Fri, 27 Mar 2026 03:15:38 +0100
Message-ID: <20260327021645.555257-25-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
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
index d9aa694e43f3..bc2838d69b19 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -671,6 +671,7 @@ static unsigned long quick_pit_calibrate(void)
  */
 unsigned long native_calibrate_tsc(void)
 {
+	const struct leaf_0x16_0 *l16 = cpuid_leaf(&boot_cpu_data, 0x16);
 	unsigned int eax_denominator, ebx_numerator, ecx_hz, edx;
 	unsigned int crystal_khz;
 
@@ -712,13 +713,8 @@ unsigned long native_calibrate_tsc(void)
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
@@ -745,19 +741,9 @@ unsigned long native_calibrate_tsc(void)
 
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
2.53.0

