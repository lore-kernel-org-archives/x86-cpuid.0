Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52B037703A
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774578071; cv=none; b=Hf3t4Oh41JDvu4Xk6mj4L9iT2GwclfCUwz52nVlERRqDe8JI9/7F6WCYatQTq778l86fQ34QNxXf8kLlzRgMPd7S4MSc8IIwBNZfNKNoaISOhvEu1Bo1YLZjbe/mggFrvAzhZNfyeA015qGJrckIYU7wL6bJzSxaEmuej6w+a84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774578071; c=relaxed/simple;
	bh=/vmDMB+L3FRPtQ4smBMI2MOUa7QWhvNRgCd/t0kYw9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uNZ3yqxpWaUv5xKxg2dYRlkxPE2MUlYSbDTI5/m3owi5+fBwwtXf1kp1Gvc0mSkGOaaamC1bQiBC1XlDMp+g8exFvjVuRC7C+0oFRJYYUmTumUY9rytBYEwhNkfhKjVeu0xT/M/UB12/9Oj/HvKNsRIQ9o0aZBznll+jjPO3eKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PlUjyTUR; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=KfRgFMOs; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PlUjyTUR";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KfRgFMOs"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774578067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5NWyRVRvUH7gWmoFCLBiZjxEncoEsNggR0XVPdkNM7E=;
	b=PlUjyTUR3SXL+keg+FwwO+scXXwSU+Sn/fFJ0u/LKvtGqJcyQD4ha/glABARJC40iIzn+r
	LaADSUgc/8cOn6BKFT7VuJuo0Bm5ieCa+kKpT1OLVXfDPyy/JV825I4FgMi4Aola02/KId
	1XIowq51veOrPCX64O43Op5wXpaCgjoMseambRcBHiTo334bXCa+BQnZiYadFCz2Bi/aGm
	TqPhGSNaxsoGLrff8twW86iCMzOfDEcwt/353rDqZ1WaaHdvUmDUmbm+SOMAPYYh3tsk3Y
	9N6bpn0IDtzOfYQIypluxdt2hKEm+YQPi4oESc51f2lfz/i4QXq4dv6LIfgvmQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774578067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5NWyRVRvUH7gWmoFCLBiZjxEncoEsNggR0XVPdkNM7E=;
	b=KfRgFMOsiZ6mXMUjOTsxlVCYrrrRICGAK50x/g05XxnlL0GRWNj8YJPlpSOUSlQSwbhtGM
	TR6pZ0tsa5/Kh5Ag==
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
Subject: [PATCH v6 62/90] perf/x86/lbr: Remove custom CPUID(0x1c) types
Date: Fri, 27 Mar 2026 03:16:16 +0100
Message-ID: <20260327021645.555257-63-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All CPUID(0x1c) call sites have been converted from direct CPUID queries to
the CPUID API and its x86-cpuid-db auto generated types.

Remove the custom CPUID(0x1c) types from <asm/perf_event.h>.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/perf_event.h | 43 -------------------------------
 1 file changed, 43 deletions(-)

diff --git a/arch/x86/include/asm/perf_event.h b/arch/x86/include/asm/perf_event.h
index 23caaba1e104..c57e6c9231aa 100644
--- a/arch/x86/include/asm/perf_event.h
+++ b/arch/x86/include/asm/perf_event.h
@@ -197,49 +197,6 @@ union cpuid35_ebx {
 	unsigned int            full;
 };
 
-/*
- * Intel Architectural LBR CPUID detection/enumeration details:
- */
-union cpuid28_eax {
-	struct {
-		/* Supported LBR depth values */
-		unsigned int	lbr_depth_mask:8;
-		unsigned int	reserved:22;
-		/* Deep C-state Reset */
-		unsigned int	lbr_deep_c_reset:1;
-		/* IP values contain LIP */
-		unsigned int	lbr_lip:1;
-	} split;
-	unsigned int		full;
-};
-
-union cpuid28_ebx {
-	struct {
-		/* CPL Filtering Supported */
-		unsigned int    lbr_cpl:1;
-		/* Branch Filtering Supported */
-		unsigned int    lbr_filter:1;
-		/* Call-stack Mode Supported */
-		unsigned int    lbr_call_stack:1;
-	} split;
-	unsigned int            full;
-};
-
-union cpuid28_ecx {
-	struct {
-		/* Mispredict Bit Supported */
-		unsigned int    lbr_mispred:1;
-		/* Timed LBRs Supported */
-		unsigned int    lbr_timed_lbr:1;
-		/* Branch Type Field Supported */
-		unsigned int    lbr_br_type:1;
-		unsigned int	reserved:13;
-		/* Branch counters (Event Logging) Supported */
-		unsigned int	lbr_counters:4;
-	} split;
-	unsigned int            full;
-};
-
 /*
  * AMD "Extended Performance Monitoring and Debug" CPUID
  * detection/enumeration details:
-- 
2.53.0

