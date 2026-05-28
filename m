Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409CB441036
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983014; cv=none; b=jWO3F3wEDA0xrWaPS1IEOijSpMTsaKOYl59/Z4VvuE7927WCXd4dDRMrwH/Hzjlk/jnsyxx0bYSoTdUe00sxo8TbgozudXdMICF3+R9J0EPmCI9yvC53r6CV6BkPGZ09vjhoG2YZv4Q+5xxhm0FZATj/pbMB387GA+Sa9KZWuF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983014; c=relaxed/simple;
	bh=uF8Eykkg9lSIwPeMksAZ4aD/pH6c/vTY6DN7kYGk07Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TeYHRcS6bEkbm6vGEVU9aWFhwTwO4fLuLp3xXfDhMehrwxSSTfiBmizR4VNTTk9kN+ZAZoOUhLlu0TUvDPhguauuheGCC1zXVC/xqP3w7sKAg12MtEVxpm3W0PWdVtxcs09FTezfWlSWGHNMHxGus1xnRJAVwvdwGjkxfy2SatE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Dsno1Zym; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZRrFl/G3; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Dsno1Zym";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZRrFl/G3"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZiFXoaO6qqBLy37324cJNlU+dL5PUYM73cbVmeRGrHk=;
	b=Dsno1Zym2KE9X9CTeN31YNL8sM0gd37oTX0SX7QwZLC1/ZGxbn0rC7Bobj8NA7IbYCVQlM
	QDWAQahs/F0feCwUEcD4s4mHDhM1/ekfSpdEusmPAvblydlbzghM1fVcnjzN6u45jeVM5i
	+qA0zEywQSthkeqbYEPJNPJwydVM9K/R/iApGgQvhKVRh7CXysJOmY9J91ZvtxjgvcrCrD
	HEtTlwZJqdR/eebHyd+c6IKpyZcfpXXkvYDvMG+DYw5OS5aTH0n6yLiumELaKFPNcZT4oz
	Qn/Ck4PySQTsm0V1lU6mpFCAuMJVpBmwfTfxGq29mnoMPbUwI4HKlVe09lGe1g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZiFXoaO6qqBLy37324cJNlU+dL5PUYM73cbVmeRGrHk=;
	b=ZRrFl/G3BNufOFEHhlcBK+N1oRA8sG3Op6ikac5/SGq2V17v1SVi6r9EPJmIWPHd3MZQFk
	yI3f1PfR4NGZ1EAA==
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
Subject: [PATCH v7 065/120] x86/hpet: Use parsed CPUID(0x5)
Date: Thu, 28 May 2026 17:38:27 +0200
Message-ID: <20260528153923.403473-66-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use parsed CPUID(0x5) instead of doing ugly bitwise operations and a direct
CPUID query.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/hpet.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kernel/hpet.c b/arch/x86/kernel/hpet.c
index 8dc7b710e125..6f6f4e5072f2 100644
--- a/arch/x86/kernel/hpet.c
+++ b/arch/x86/kernel/hpet.c
@@ -11,7 +11,6 @@
 #include <asm/irq_remapping.h>
 #include <asm/hpet.h>
 #include <asm/time.h>
-#include <asm/mwait.h>
 #include <asm/msr.h>
 
 #undef  pr_fmt
@@ -913,19 +912,15 @@ static bool __init hpet_counting(void)
 
 static bool __init mwait_pc10_supported(void)
 {
-	unsigned int eax, ebx, ecx, mwait_substates;
+	const struct leaf_0x5_0 *l5 = cpuid_leaf(&boot_cpu_data, 0x5);
 
 	if (boot_cpu_data.x86_vendor != X86_VENDOR_INTEL)
 		return false;
 
-	if (!cpu_feature_enabled(X86_FEATURE_MWAIT))
+	if (!l5 || !cpu_feature_enabled(X86_FEATURE_MWAIT))
 		return false;
 
-	cpuid(CPUID_LEAF_MWAIT, &eax, &ebx, &ecx, &mwait_substates);
-
-	return (ecx & CPUID5_ECX_EXTENSIONS_SUPPORTED) &&
-	       (ecx & CPUID5_ECX_INTERRUPT_BREAK) &&
-	       (mwait_substates & (0xF << 28));
+	return l5->mwait_ext && l5->mwait_irq_break && l5->n_c7_substates;
 }
 
 /*
-- 
2.54.0

