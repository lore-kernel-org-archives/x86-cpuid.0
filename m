Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A683FE664
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982994; cv=none; b=l73ixL73PfxEOEeVaPzCMgg7k+6tORI3fZCrFDpQoUoMS+xyQ9bG2Z5+gPgxlm3eKMQZ5/Qba9ZX/xGT7/vDvxatg3l7id+dt0HWCcs9610AwcujUde/h/LTd8xPy59RdxRmskpeWwjf9YZqjmTXyjKvDb1Z+KyLP6eDfaReFFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982994; c=relaxed/simple;
	bh=iVDWm1TtnXk/T6tJCLOV8wgq9OCpsSx5iq7QQh1/eNo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZejCSxumgWSmkK3IohZMsNjUkMOaBl28jlIOPeUJL8h8VYNXsybpkneeJLGYORkPJQRLafkSPXkW61S/dW9dn2Nrac57QaTQG7snoXZKpDVhBM60IZGTQts9pwhonUswopdWiGC3dXNwkGY4o3Ts45T16iP/KE1GbrN2BikOkqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=iMhQvazS; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Wg6s7nFz; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="iMhQvazS";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Wg6s7nFz"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O945PT5mgFGGsD+3CsmT7+wcn/pRG5zNHz1p7UPjKAY=;
	b=iMhQvazSLdF5xNkc4yLYjThhfhcvUy6fxxpC4R5FlV2orFPCew+zgbaMD4VDQmFYskmFyD
	T22fdtcyLJKfpp5/oaPFTeSe4z74mQXpWVm8xqmgErHg12SM2/Jo4rLBPBq5OZUKH6taHk
	ADP5yOznoOpDYHAnIsRMsBpOdKZGBEDb7kWrRL00yuOqcnRXJTkS4LYd6/q5+fhiTg4U5j
	Y6b6fOVfFY7JPh7U1E9ba281dJOJeMPjvgGAt4t+Qq7mJvB1+UmgfD6sLwz4IRaDuOLARc
	M0eH4YdazlW6bCsyNpUuvKZ6gjcNnoyjKY+Ggb1YrGzoaUaRJ+1dfRJxrcLeDQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O945PT5mgFGGsD+3CsmT7+wcn/pRG5zNHz1p7UPjKAY=;
	b=Wg6s7nFzZOxZxDLnYPTiVyTB6poS8vkGGsQb6uBTOlsq3fmN6g2Cou6G780w+UNau9OBvh
	kwgloChiRnJPBZBA==
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
Subject: [PATCH v7 060/120] x86/acpi/cstate: Remove superfluous retval logic
Date: Thu, 28 May 2026 17:38:22 +0200
Message-ID: <20260528153923.403473-61-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Just return the error or success state directly.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/acpi/cstate.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kernel/acpi/cstate.c b/arch/x86/kernel/acpi/cstate.c
index 0281703da5e2..f6bd7214fec4 100644
--- a/arch/x86/kernel/acpi/cstate.c
+++ b/arch/x86/kernel/acpi/cstate.c
@@ -124,7 +124,6 @@ static short mwait_supported[ACPI_PROCESSOR_MAX_POWER];
 static long acpi_processor_ffh_cstate_probe_cpu(void *_cx)
 {
 	struct acpi_processor_cx *cx = _cx;
-	long retval;
 	unsigned int eax, ebx, ecx, edx;
 	unsigned int edx_part;
 	unsigned int cstate_type; /* C-state type and not ACPI C-state type */
@@ -138,21 +137,16 @@ static long acpi_processor_ffh_cstate_probe_cpu(void *_cx)
 	edx_part = edx >> (cstate_type * MWAIT_SUBSTATE_SIZE);
 	num_cstate_subtype = edx_part & MWAIT_SUBSTATE_MASK;
 
-	retval = 0;
 	/* If the HW does not support any sub-states in this C-state */
 	if (num_cstate_subtype == 0) {
 		pr_warn(FW_BUG "ACPI MWAIT C-state 0x%x not supported by HW (0x%x)\n",
 				cx->address, edx_part);
-		retval = -1;
-		goto out;
+		return -1;
 	}
 
 	/* mwait ecx extensions INTERRUPT_BREAK should be supported for C2/C3 */
-	if (!(ecx & CPUID5_ECX_EXTENSIONS_SUPPORTED) ||
-	    !(ecx & CPUID5_ECX_INTERRUPT_BREAK)) {
-		retval = -1;
-		goto out;
-	}
+	if (!(ecx & CPUID5_ECX_EXTENSIONS_SUPPORTED) || !(ecx & CPUID5_ECX_INTERRUPT_BREAK))
+		return -1;
 
 	if (!mwait_supported[cstate_type]) {
 		mwait_supported[cstate_type] = 1;
@@ -163,8 +157,8 @@ static long acpi_processor_ffh_cstate_probe_cpu(void *_cx)
 	snprintf(cx->desc,
 			ACPI_CX_DESC_LEN, "ACPI FFH MWAIT 0x%x",
 			cx->address);
-out:
-	return retval;
+
+	return 0;
 }
 
 int acpi_processor_ffh_cstate_probe(unsigned int cpu,
-- 
2.54.0

