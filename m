Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F4734107A
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774577955; cv=none; b=RYLN2Gkm5SLtopfUYiKhdqGRDjt5f0FJZRouYkZ/CgL1sT8WPUYfsQewoThGjusHKQCyfSgOcmAtpoRRMPjobWpnZwjEoDXskOmsH+g6o7pVrwOess33vzrnXh8K4OIy9fRZUwxZsVkfIbR+aCr3cYpNg4rpCdJ1EFTEU25SATU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774577955; c=relaxed/simple;
	bh=hwVcyDnhYE9Ew8mWfAAdg/BA04xn7srypYUGwIGNpvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BGYwAzFS2+l8XdGOAC3xhY9XuCe6AbaOJ5P1JiLaEecvIO8KFmIDcQWzxSI/06sT44jzRVLi2q2OAfmjHW0miWY9akJy81usolzEoKOLR8jzJt9eeXoakdtXpHtghKanThVENcPA7ZvgNqTAQwMR9IHKpghisWpMxoNkGFCsTD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=KF2d8+i5; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=YqnH6KaH; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KF2d8+i5";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YqnH6KaH"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774577952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UUQ76hlD26YEpumyfNSfOXMLQXNffvEAUoB8LCX9+mM=;
	b=KF2d8+i5QLjXQptX4EN17Ya8ckBvdX5XITYRTqSm/5axap/fb7ETx1dxoOnWw0qwgAjZcI
	1DoCoRfTlcCqQreuJZXE4lughRLHYFOnrQQwldKJevzYhrdDYDNA1cAIIiRDtiUaCNEGOc
	3VMNxfkF4FDiR21x00EMXyeS3Dm4eu8aQEYE/VtCVdykTTxFEQrE0FSyYURsMHbNLcZOGU
	1FA+GJx/0YR4yLPtuizm5cJtEN+HvbRZzPU7wMGNfmCkapL9n1gumRpIoVdrDy1UIar48A
	+fITjgA2bZDuASzHhbEa7r+OIZ32uRlEAVFVVFcRa9OoKjhZ+WKT1TX217LiZw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774577952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UUQ76hlD26YEpumyfNSfOXMLQXNffvEAUoB8LCX9+mM=;
	b=YqnH6KaHeatTKx3JxQtPYcXF4kIusu1F3+YI1U3OB4wxNdfVTWzoaqJWdxDh7ePuzxasCD
	tJEPyWLZh8YqOhBg==
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
Subject: [PATCH v6 31/90] x86/cpuid: Warn once on invalid CPUID(0x2) iteration count
Date: Fri, 27 Mar 2026 03:15:45 +0100
Message-ID: <20260327021645.555257-32-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
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
2.53.0

