Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607673793A4
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774578080; cv=none; b=FtQBvW4EHglT/tqQCzMrxpalGbcDDQmgNCPRWybzSTzXNZUuq1Fgb/JXE7So/pIfy0jes++NkNwJH96KrWL+ichZlSjt5roDPARMT53TWlI9VvvTBJL0skbi/xdICkqODSz1BbyolyKNARPC4wGfA3YXK/jIIndDLJakO66/fww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774578080; c=relaxed/simple;
	bh=8ndB3DIFPKBfBfZP2miEw/UAtOu/NCJBk3wQ78WJPxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J+6QSKnCXnmEm1vqp9GV42FQ260w+Qc8mUj0uIFBIxkVLmB+4/7d5bdjAGVHfulyNI0/efNJ5Cz+H2TV00jg2e9OJ6FrQ65jIKsxQqPX8qgFh9mRIjeNU9f0gAYM9OU6tcg1QEyAQEKzj8xO8FrLIiYs0/EMEra1V5HPVBpf6g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wnkfb0yW; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Tzeho6t0; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wnkfb0yW";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Tzeho6t0"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774578078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pr0cNu6rZmuw9gMObI8KBiaV8/2gOXHSOkaRxwPz7dM=;
	b=wnkfb0yWx/AUKCELwUGwON8wPGi7Dzoye7W1qZGl2wtcWzzo5dg8BSM/TLAraj2d39rRIa
	x0x33xI/mA0Igo8cd3G3tT6R6WYTGZUFI/QUAcxEr4OTbWh7jt5NOKKq8XM6/tvdhwAv7C
	35GzQLOTnw43skUit5t1jJ7UmoQvDaC0Z4lXP7ob/+rt49LlsjrdWKEEjxTERpdO864FQU
	aR8vAIje3kyjpgPVwtTOHb8ko4G06IqM9VhyU7EkvtcdH4jj4L7Z4iEQhMoty0drD61/wE
	Z1I1zpuJB3goijxPwMVFFUDbDLysSpq6g67lZVQbk64Ke6w3askt2sSjc81nVg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774578078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pr0cNu6rZmuw9gMObI8KBiaV8/2gOXHSOkaRxwPz7dM=;
	b=Tzeho6t0rWIZDvjkavr9WK1DRJs0XNBdRz9GdkqHQ95njCJkxsZX3eVGuerMDOOcXhhiUP
	SrJD7Ph6m8+N3rAw==
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
Subject: [PATCH v6 65/90] perf/x86/intel: Remove custom CPUID(0x23) types
Date: Fri, 27 Mar 2026 03:16:19 +0100
Message-ID: <20260327021645.555257-66-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All CPUID(0x23) call sites have been converted to the CPUID API and its
auto generated x86-cpuid-db data types.

Remove the custom CPUID(0x23) types from perf.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/perf_event.h | 38 +------------------------------
 1 file changed, 1 insertion(+), 37 deletions(-)

diff --git a/arch/x86/include/asm/perf_event.h b/arch/x86/include/asm/perf_event.h
index c57e6c9231aa..5aa07710af12 100644
--- a/arch/x86/include/asm/perf_event.h
+++ b/arch/x86/include/asm/perf_event.h
@@ -157,46 +157,10 @@
 /* Steal the highest bit of pebs_data_cfg for SW usage */
 #define PEBS_UPDATE_DS_SW	BIT_ULL(63)
 
-/*
- * Intel "Architectural Performance Monitoring extension" CPUID
- * detection/enumeration details:
- */
-#define ARCH_PERFMON_EXT_LEAF			0x00000023
-#define ARCH_PERFMON_NUM_COUNTER_LEAF		0x1
-#define ARCH_PERFMON_ACR_LEAF			0x2
+// _CPUID_TODO_: Remove subleaf 4 and 5 after defining them
 #define ARCH_PERFMON_PEBS_CAP_LEAF		0x4
 #define ARCH_PERFMON_PEBS_COUNTER_LEAF		0x5
 
-union cpuid35_eax {
-	struct {
-		unsigned int	leaf0:1;
-		/* Counters Sub-Leaf */
-		unsigned int    cntr_subleaf:1;
-		/* Auto Counter Reload Sub-Leaf */
-		unsigned int    acr_subleaf:1;
-		/* Events Sub-Leaf */
-		unsigned int    events_subleaf:1;
-		/* arch-PEBS Sub-Leaves */
-		unsigned int	pebs_caps_subleaf:1;
-		unsigned int	pebs_cnts_subleaf:1;
-		unsigned int	reserved:26;
-	} split;
-	unsigned int            full;
-};
-
-union cpuid35_ebx {
-	struct {
-		/* UnitMask2 Supported */
-		unsigned int    umask2:1;
-		/* EQ-bit Supported */
-		unsigned int    eq:1;
-		/* rdpmc user disable Supported */
-		unsigned int    rdpmc_user_disable:1;
-		unsigned int	reserved:29;
-	} split;
-	unsigned int            full;
-};
-
 /*
  * AMD "Extended Performance Monitoring and Debug" CPUID
  * detection/enumeration details:
-- 
2.53.0

