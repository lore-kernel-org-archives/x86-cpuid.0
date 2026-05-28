Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57473480335
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983162; cv=none; b=U3Ods9S9gh/PWmBJi+icOEjHk57RT8/Mfm0EGVEsWNKE2ZWJ+HJmbkbPcI9GMggGsdDz9trnp8a0vc4fcxjrT1tFl3vE09yDoeLbq4y/uyxDu+bvShgqc9igUpEXTRaxCuDecaO6/JaE0HlVpVpEQXhroF6Dn2I4e9MQbX4IPWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983162; c=relaxed/simple;
	bh=K9j2/WlVWhjCqAJmD0adWgGGyqwMcXKARxbjL9bDzGw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H8BqvSP6s35O0gbHaE98tpbDfyhaBRTnf7tn+NuH0W8kgK9H56bxJ8NNi3bmLOQHDQ1g58jQTtEQCfuqTItPqqN6SlDeMAwjS3rTrKP9JI/qs9udpqqM6f6PiZaFUYVeqD1vUqCuadX2Nd50YbWKLCf5lYmZlh2OQg83likkzJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PisIygss; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TFxIEvly; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PisIygss";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TFxIEvly"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f45qYuzQRP0FuT9KNF1JajDuu9b/pV8A8JURH7HJwvA=;
	b=PisIygssCdMMzz3gDJLoUfc0gON0pjwr5x8eZKBT64iUiHd+efSHRBzK3ijCnByxAsLM54
	Pvfe97bcWe0fvfmLNbIOTOgjUyr3bvuCYcp1AxFcpOObK24gOFx1S4h7fDNV7n0O14CRx0
	q9h3+yzNzx+R05rmGxiau7O9niZ+9wBAAK7sW6JMS/ZAA8rv3uMrwV5KVgNJYchwHb2u5Z
	IGmV6eOORf4e6RmI4AIpsNNNihUlSkULebMVBKAg9i4ewD1vGg6brwFsr1+F3h8siAn0aa
	rYzab2tHQbtuiybraucVEs/W6+MFlHfggFLCHJDHqFBpwjht7oStDG9Mh4PM0Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f45qYuzQRP0FuT9KNF1JajDuu9b/pV8A8JURH7HJwvA=;
	b=TFxIEvly4hv5UefRbrMABCbW+dYQLuJYhqYowUd64sm4/rKhdw8m00XqP3225tuqwnNxUs
	IY9zVR8nCHCZo6CA==
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
Subject: [PATCH v7 112/120] x86/cpufeature: Factor out a __static_cpu_has() helper
Date: Thu, 28 May 2026 17:39:14 +0200
Message-ID: <20260528153923.403473-113-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Later changes will route X86_FEATURE querying to centralized CPUID tables.
In that case, the X86_FEATURE's bit value from <asm/cpufeatures.h> is
different from the bitmap's own bit value to be checked by the fallback
capability-byte "testb" check.

Factor the asm goto fallback code out of _static_cpu_has() and into
__static_cpu_has().  Pass the X86_FEATURE bit, and the bitmap offset bit,
separately.

No functional change intended.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpufeature.h | 44 +++++++++++++++++--------------
 1 file changed, 24 insertions(+), 20 deletions(-)

diff --git a/arch/x86/include/asm/cpufeature.h b/arch/x86/include/asm/cpufeature.h
index b12bde4986b5..48643b4b1e24 100644
--- a/arch/x86/include/asm/cpufeature.h
+++ b/arch/x86/include/asm/cpufeature.h
@@ -90,29 +90,33 @@ void check_cpufeature_deps(struct cpuinfo_x86 *c);
 #define setup_force_cpu_bug(bit) setup_force_cpu_cap(bit)
 
 /*
- * Do not use an "m" constraint for [cap_byte] here: gcc doesn't know
- * that this is only used on a fallback path and will sometimes cause
- * it to manifest the address of boot_cpu_data in a register, fouling
- * the mainline (post-initialization) code.
+ * Helper macro for CPU feature detection with alternative instructions.
+ *
+ * Do not use an "m" constraint for [cap_byte]: GCC does not know that this is
+ * only used on a fallback path and will sometimes manifest the address of
+ * boot_cpu_data in a register, fouling the mainline post-initialization code.
  */
+#define __static_cpu_has(_feature_bit, _bitmap, _bitmap_bit)			\
+	asm goto(ALTERNATIVE_TERNARY("jmp 6f", %c[feature], "", "jmp %l[t_no]")	\
+		".pushsection .altinstr_aux,\"ax\"\n"				\
+		"6:\n"								\
+		ANNOTATE_DATA_SPECIAL "\n"					\
+		" testb %[bitnum], %a[cap_byte]\n"				\
+		" jnz %l[t_yes]\n"						\
+		" jmp %l[t_no]\n"						\
+		".popsection\n"							\
+		 : : [feature]	"i" (_feature_bit),				\
+		     [bitnum]	"i" (1 << ((_bitmap_bit) & 7)),			\
+		     [cap_byte] "i" (&((const char *)(_bitmap))[(_bitmap_bit) >> 3]) \
+		 : : t_yes, t_no);						\
+	t_yes:									\
+		return true;							\
+	t_no:									\
+		return false							\
+
 static __always_inline bool _static_cpu_has(u16 bit)
 {
-	asm goto(ALTERNATIVE_TERNARY("jmp 6f", %c[feature], "", "jmp %l[t_no]")
-		".pushsection .altinstr_aux,\"ax\"\n"
-		"6:\n"
-		ANNOTATE_DATA_SPECIAL "\n"
-		" testb %[bitnum], %a[cap_byte]\n"
-		" jnz %l[t_yes]\n"
-		" jmp %l[t_no]\n"
-		".popsection\n"
-		 : : [feature]  "i" (bit),
-		     [bitnum]   "i" (1 << (bit & 7)),
-		     [cap_byte] "i" (&((const char *)boot_cpu_data.x86_capability)[bit >> 3])
-		 : : t_yes, t_no);
-t_yes:
-	return true;
-t_no:
-	return false;
+	__static_cpu_has(bit, &boot_cpu_data.x86_capability, bit);
 }
 
 #define static_cpu_has(bit)					\
-- 
2.54.0

