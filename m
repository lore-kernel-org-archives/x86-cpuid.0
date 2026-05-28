Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BEF408038
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982872; cv=none; b=Q6WrNQE9NECMFFC7U1Eo/OTlkNTTPvRq6KFzZ7Pt6RLp8CSG3HAxxNgoEVSuTjXwb7lYU6gqYSsZRZf6pHIAH6h4jwJX2r7yb9u0PPjNcgVNvsyKdvFO+oqFU5JxV7jr61fYBUDkHWdQhpEg39HwYsNfahokd9Xq1SlhI2eGmAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982872; c=relaxed/simple;
	bh=xXpYSPGnl9wGRjVPGtJ7eD41YmoGyyY8TKActvqc1qc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UcYc7FT2vBvTwawb5l2WYKC45pizgwiVE9a/k/9MVQNfKIGFG0UieYQwGYWQjQJ2xN8k87q0+DlszCZlRicn34IvjT8bdPeISXmYdACKIGYQJqG1BwwgjPjo94nTbZjhu/i1xMYU8KDzYuzhO0GiofFxmTnZHm2P8+L4m7vu9Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=s5ysqe0/; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=65MPGMF+; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="s5ysqe0/";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="65MPGMF+"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O9FO+vvb9UphE4+7KwO+yOpwkc4NCAq8vBqHWXdky1M=;
	b=s5ysqe0/Gt+aBMLbDUFlJ59YhV/i1bZon9RVkGrnm99rc1wRltjF8e4MizLiKQzDEkHx6B
	EYM9iZXwlxWBfc53ZtIU2gDHldi44LY5yhWDsB4JUYavj9R+0sgS7n/Ho2HYj3PbcTksCA
	bzvo2YkMtPheZueG15NbOih9GSf5muKGUpqZDmLeA0UKPRIjoKjdu2X/8p3/9SPs+zCTOI
	V2YPNo2a9HoirFoSlBd6oOe4cQFQ5dAaHjmA0FjrcHfh/Wv0bz5k6aTSuqbh1wLPniPXl8
	db+BU0p2WmmoMvp0n/dTUmvugQ4NS02a06kF6aVIeVordE7102l9RejWn9/uRQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O9FO+vvb9UphE4+7KwO+yOpwkc4NCAq8vBqHWXdky1M=;
	b=65MPGMF+VEsv2jInfscC3tZzJGbGWh6sPPWSUZdQEvK6pvR5Ea1un7eg+gQroy+N1nxKq1
	nFTREnEaj1L9viAQ==
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
Subject: [PATCH v7 026/120] x86/cpuid: Warn once on invalid CPUID(0x2) iteration count
Date: Thu, 28 May 2026 17:37:48 +0200
Message-ID: <20260528153923.403473-27-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CPUID(0x2) output includes a "query count" byte.  That byte was supposed to
specify the number of repeated CPUID(0x2) subleaf 0 queries needed to
extract all of the CPU's cache and TLB descriptors.

Per current Intel manuals, all CPUs supporting this leaf "will always"
return an iteration count of 1.

Since the CPUID parser ignores any CPUID(0x2) output with an invalid
iteration count, lightly warn about this once in the kernel log.

Do not emit a warning if some of the CPUID(0x2) output registers, or even
all of them, are invalid.  This is an architecturally-defined response.

Suggested-by: Ingo Molnar <mingo@kernel.org>
Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
References: b5969494c8d8 ("x86/cpu: Remove CPUID leaf 0x2 parsing loop")
Link: https://lore.kernel.org/lkml/aBnmy_Bmf-H0wxqz@gmail.com
---
 arch/x86/kernel/cpu/cpuid_parser.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/cpuid_parser.c b/arch/x86/kernel/cpu/cpuid_parser.c
index be340b202182..bddd9937bb2b 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.c
+++ b/arch/x86/kernel/cpu/cpuid_parser.c
@@ -3,6 +3,8 @@
  * CPUID parser; for populating the system's CPUID tables.
  */
 
+#define pr_fmt(fmt) "x86/cpuid: " fmt
+
 #include <linux/kernel.h>
 
 #include <asm/cpuid/api.h>
@@ -54,8 +56,11 @@ cpuid_read_0x2(const struct cpuid_parse_entry *e, const struct cpuid_read_output
 	 * keep the leaf marked as invalid at the CPUID table.
 	 */
 	cpuid_read_subleaf(e->leaf, e->subleaf, l);
-	if (l->iteration_count != 0x01)
+	if (l->iteration_count != 0x01) {
+		pr_warn_once("Ignoring CPUID(0x2) due to invalid iteration count = %d",
+			     l->iteration_count);
 		return;
+	}
 
 	/*
 	 * The most significant bit (MSB) of each CPUID(0x2) register must be clear.
-- 
2.54.0

