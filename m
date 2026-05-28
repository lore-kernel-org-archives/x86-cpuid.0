Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F01478E5F
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983095; cv=none; b=Ceivep9EMKCUX5NNrUgychszRgn9GTuVgY15ug2elIw2tkvuVVfJaW2yHUrVLobz0ReBkleeUyrBXpYw1qxE+YygnHTk5TRq5TvK5LloHfrZ8x0eVulVe2fKQ9PaAnITdkzFus6ieIM6xIkYY6A4PY0OXjD31keOrh11xJc+S7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983095; c=relaxed/simple;
	bh=H9pCmISX3Q0c0zjOfqm6CssmNdVASdSJLCL6CRM7xJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O0AL3Lqo8DveWQyCbeP3OiFNOFw1xKrfMIG2JokExVU6o3X8AfhOiNjnyUsjpxVE8ENeVgjisblS6intrR/t/RUukGSfdwrQ5bQIjU/tDiBacQQ15vbzeoVZRjqFIwhWr7JncCp1MImmT/vtrboLjTX8erHp7TCz/KRezM2byD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=EKuT6dsS; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=iUVceLvq; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EKuT6dsS";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="iUVceLvq"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BdCO+X3DDz9sv2KnfeZGJWy7WRmJro+j+/GrBftBzUc=;
	b=EKuT6dsSXPO8OAEqjs1M2P6ohJRzCc6Mry2KkhmoXbOo89KvgiTjIwikC5C+mZ0HjQbyEd
	svEp3tfSjyKPUGHnV1foSDNh1zZF0lb1ooQbY4oKIIsmjLBZNWesbOC0j/oLhvNh0nVWHE
	xyKb+XwkCWW9TCdxFcftj33+UOgiU1lAFqQ6R/SVtT+q1QfOj0/JKCVkeT9iTR+78RHZMc
	FsUQ9GPRgwNGhEU0JhrB0nv04odQvfL9uWINVbC9x+cG9JVPQUuhgdJAerCx64PSn16WAg
	Vb2PcvoTwyCz/Jb4NslI9OPfYpH6rmPoL05MbIGatA5dYbEqSkyJyaN3cEcmrA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BdCO+X3DDz9sv2KnfeZGJWy7WRmJro+j+/GrBftBzUc=;
	b=iUVceLvqyIeErOyGf7Tj3S7+G178L2Gme6TZ0nytLOwQuxyq8S5j6JHaiVnKYhb62pMKb+
	FjmPhUc2IYseK2CA==
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
Subject: [PATCH v7 090/120] perf/x86: Remove custom CPUID(0xa) types
Date: Thu, 28 May 2026 17:38:52 +0200
Message-ID: <20260528153923.403473-91-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
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
index 752cb319d5ea..02f804788daf 100644
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
2.54.0

