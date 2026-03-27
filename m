Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A4737647E
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774578064; cv=none; b=eksT5nbkWrJSdJOMm1DmQX0iUthB/wlgqzfX+kk4S7Ib4BVtKpN2/hgynZ1bsw/Z9rBqQZDIW7t0IuXwpuOPBguSM9p2/zn0LcRED4EGJ/IxbT407Q2PiBf5+E7joBy6gH5XOG397+EDKkK66MmpxuJU0d3ARBOn38jic4ryvrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774578064; c=relaxed/simple;
	bh=awt4vDKLa+dZzD0JnYQUd+M29kbqPaZBhBkngUKqw3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UnuL1BDM9Myl6JaJFMm31DdFr1yWbpHdXq9m2gE9i+c/4OsucVBGyebfjmBGvSWbPVv8El97nxCoKGnSyVOo55Bbg34kQkcc5zCJ3tyThxM05hjfawBwt1e+4+5dXpCn24Ou1lI1jIcZ2zciA5BI+6KLoSH5kPj1KKYDpuu0GAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tAwC5V8D; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dxEENZ3d; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tAwC5V8D";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dxEENZ3d"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774578061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+jZw9ggKxdfGR6G92KBvWwxNqVjS1wEIWq4sUfAWwxo=;
	b=tAwC5V8DFUd8g1pZaeO1zQ3zIhlsDr5mqPOx4zNmaT+5XFX0pDaW/d4y15jOWxvSC1edUH
	BpZvFFu5NAmtj9OSZqTswYbzaNWNBWV2BCMeKZryKaLXe2KQLxSu9La5W8JCabBX9clhNd
	J0FM19Ch+Vb4MV0r0zOs0eoPMrkFYA1pd69ovbnxWdgHSJI+1OruwDmoRK3pQQ9QaJEqCq
	tvDl6zMfDy3STbpxN8DQA0eYZeaPy68nFT8IGeov8+1btxI52r0NETBZH0peN1xN9LBUz9
	MD8U6ZAE4UNbM+BGFp/1LDLyEr9CRm3fIa3bQgpR+h8iMz5z8fx1vFg739ibQQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774578061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+jZw9ggKxdfGR6G92KBvWwxNqVjS1wEIWq4sUfAWwxo=;
	b=dxEENZ3d8HrkT8MbLszr5n1n75EGU0r4qkmdhjNic1nbZp+2hoCtXnwe6be3UhhxrV6ehv
	2UF6OK78hpic4iCw==
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
Subject: [PATCH v6 60/90] perf/x86: Remove custom CPUID(0xa) types
Date: Fri, 27 Mar 2026 03:16:14 +0100
Message-ID: <20260327021645.555257-61-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All CPUID(0xa) sites have been transformed from direct CPUID queries to the
CPUID parser APIs.

Pure users of perf's custom CPUID(0xa) types have also been converted to
the auto generated x86-cpuid-db data types.

Remove the now-unused CPUID(0xa) types from <asm/perf_event.h>.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/perf_event.h | 38 -------------------------------
 1 file changed, 38 deletions(-)

diff --git a/arch/x86/include/asm/perf_event.h b/arch/x86/include/asm/perf_event.h
index ff5acb8b199b..23caaba1e104 100644
--- a/arch/x86/include/asm/perf_event.h
+++ b/arch/x86/include/asm/perf_event.h
@@ -157,44 +157,6 @@
 /* Steal the highest bit of pebs_data_cfg for SW usage */
 #define PEBS_UPDATE_DS_SW	BIT_ULL(63)
 
-/*
- * Intel "Architectural Performance Monitoring" CPUID
- * detection/enumeration details:
- */
-union cpuid10_eax {
-	struct {
-		unsigned int version_id:8;
-		unsigned int num_counters:8;
-		unsigned int bit_width:8;
-		unsigned int mask_length:8;
-	} split;
-	unsigned int full;
-};
-
-union cpuid10_ebx {
-	struct {
-		unsigned int no_unhalted_core_cycles:1;
-		unsigned int no_instructions_retired:1;
-		unsigned int no_unhalted_reference_cycles:1;
-		unsigned int no_llc_reference:1;
-		unsigned int no_llc_misses:1;
-		unsigned int no_branch_instruction_retired:1;
-		unsigned int no_branch_misses_retired:1;
-	} split;
-	unsigned int full;
-};
-
-union cpuid10_edx {
-	struct {
-		unsigned int num_counters_fixed:5;
-		unsigned int bit_width_fixed:8;
-		unsigned int reserved1:2;
-		unsigned int anythread_deprecated:1;
-		unsigned int reserved2:16;
-	} split;
-	unsigned int full;
-};
-
 /*
  * Intel "Architectural Performance Monitoring extension" CPUID
  * detection/enumeration details:
-- 
2.53.0

