Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F09A47AF6A
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983099; cv=none; b=MZ/p5OYqqmHJ5WR5/4/cTkQWFEz8fWXajEHyj4IaterNQMBeHUNRxDF1f/TW7YCYw5dtwOE8qvi/EERGHXGymBEfymAB8nFEi9CZUU91nzFVtGX9EbS8aHnA2EWu+TDgHKyA5Pbbrb5EZjw+/BK5wXMXMT8EsYCC8Jf8yXlSsEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983099; c=relaxed/simple;
	bh=l/ciwg2vMBBaoVG9nus4f97XA4XXtMlzOMYW1wFuT7M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J2SXxmx/Y1Kz07kxpJLHR8U2txuytMNMssnu+aw7ARm4AicMbzzkyNwXLEOFaaaf1hZjsdHXw2i9Dx6wKaQaPSNDKm+ebgOkVPvZee1X7Ndz/xdClTxrQubyTh+v9zaOBGiFDY01kLu9rhxYYuOq1IvQR+IFxqBMg86zg37Pg88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xlKa2QK3; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=P/aDjwPk; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xlKa2QK3";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="P/aDjwPk"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aL0LzMpZRPBlhYur073q9t7Ua/vy+3rD6Ljc4SH0Mp0=;
	b=xlKa2QK3rYgA4TXKsX6G7xdbBfGKoyan2r7hUYuK2ObPn3dJCR3Awasm7HEnnEht7lGkD9
	+8ZYwMzqnH5vGBCi9FG0L35YRMdHddiWap6/+a2hkNBIrkY+u/vm2lNUhVWvVdLT8+d57t
	6j8jEo6y4Y4JpjD0WTfCKwUcZNQFzYKw8Hg6mbwvWtmLYuooS38i96a51zKl3kZb4zOr7Q
	rzSj/7GrG2J5I7YJgCC7rSvXXcmuswClMqxeaGN8EHIvOUpha6QsAEgS0ckQX7OUatG4Hi
	h+gsMGWLaRYx+hGoQW5TY4/EkX8vgetYVZ0nxVmIJAEJLvl+UfZpm/nKXWE3Xg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aL0LzMpZRPBlhYur073q9t7Ua/vy+3rD6Ljc4SH0Mp0=;
	b=P/aDjwPklSHwpQjUAtjzvRRuLEirdG2ualnsjOdBo78gs2Macql72DBYMkgoVl81PVYGG8
	9KnDtpgPgrOxHxCw==
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
Subject: [PATCH v7 092/120] perf/x86/lbr: Remove custom CPUID(0x1c) types
Date: Thu, 28 May 2026 17:38:54 +0200
Message-ID: <20260528153923.403473-93-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
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
index 02f804788daf..6270f4a26a59 100644
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
2.54.0

