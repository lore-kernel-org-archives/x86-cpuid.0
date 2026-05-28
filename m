Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2E83FB060
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982819; cv=none; b=qmVFz+ODpbBkIafq1gspEonjh6DrWOA62flK6+E4boPhkVO3sfwXINWSxVFz432Wga27nUmVvFXAVW5B50ZdZlwZ6XFAKp7WopvCkTb6GeSBZPmyVoggVd2G9BNituyeH9mUbAZxIrqkTmQOT5dlIVdgurX1cHUbHZoqK0ftjak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982819; c=relaxed/simple;
	bh=qIPi3ZCZvU7QCQVGe1Zitd1V/S/Wf3QdHZV6GRCHH8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aHNoa2YY8hi+B4n0qklKmAwTtSCPR0p1yJq3418kchEfxwDwb8syDkDe1b0fh6bQVVsXXNnhgjYRj6lXlxTMKs3qMzRkPd6RobuG1GTq29PLmKPPeZNcOki5uzvXjzuAFk8ENvXsfdm8J3M0RX13W8Czr1UMNVeFMv/njyhGNKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=X0rXGVON; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2Z2Y1XeA; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="X0rXGVON";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2Z2Y1XeA"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jGguF42oBDJHVXC2ASPZX9r/bkhMUjBRb7A9QBXOkRM=;
	b=X0rXGVONca15CXP2vp/TzB+nbBlwQpunNE030ZhGBVKQOLp2dcCofBb0YUBSrgO8y53AKv
	/iMK1r/WrtYuTqkFtdf3/gsylB69XWDMpL4S5bUYwmNwjKfOnGVIGgRE5YIYF5DKtogjvD
	O2eFlUROMRYSXwvN2WOqrFr1wmp2kR7sqv55stKDtpJ13Lsaiqsk9r4stGhVP5uydtgylW
	lzXaDBhxzuXhSAnUwcxH/AUEf/JRQi9L0CeUtUCdXxwvZVb9Qu7X3KegIIVXeVT994dn2M
	slLqDqk9Fyw1LtK/7lIaohktGj8Xd3sEqop61iPPGnpPnEEn+6KJ80I7mYaZaA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jGguF42oBDJHVXC2ASPZX9r/bkhMUjBRb7A9QBXOkRM=;
	b=2Z2Y1XeAEv5AXRsqh8vEYuYlQh89sKFGnBwSP0E7Leuqf6dl+nfUYFR+BUyc7j59q0W6He
	dU2v42A2oDZ69yAA==
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
Subject: [PATCH v7 011/120] x86/cpu: Use parsed CPUID(0x1)
Date: Thu, 28 May 2026 17:37:33 +0200
Message-ID: <20260528153923.403473-12-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On early boot CPU detection, use parsed CPUID(0x1) instead of a direct
CPUID query.

Beside the parser's centralization benefits, this allows using the auto
generated CPUID data types, and their C99 bitfields, instead of doing ugly
bitwise operations.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/common.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 281dc591ea79..257808609ef5 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -943,6 +943,7 @@ void get_cpu_vendor(struct cpuinfo_x86 *c)
 void cpu_detect(struct cpuinfo_x86 *c)
 {
 	const struct leaf_0x0_0 *l0 = cpuid_leaf(c, 0x0);
+	const struct leaf_0x1_0 *l1 = cpuid_leaf(c, 0x1);
 
 	if (!l0)
 		return;
@@ -953,17 +954,13 @@ void cpu_detect(struct cpuinfo_x86 *c)
 	*(u32 *)&c->x86_vendor_id[8] = l0->cpu_vendorid_2;
 
 	c->x86 = 4;
-	/* Intel-defined flags: level 0x00000001 */
-	if (c->cpuid_level >= 0x00000001) {
-		u32 junk, tfms, cap0, misc;
-
-		cpuid(0x00000001, &tfms, &misc, &junk, &cap0);
-		c->x86		= x86_family(tfms);
-		c->x86_model	= x86_model(tfms);
-		c->x86_stepping	= x86_stepping(tfms);
+	if (l1) {
+		c->x86		= cpuid_family(l1);
+		c->x86_model	= cpuid_model(l1);
+		c->x86_stepping	= l1->stepping;
 
-		if (cap0 & (1<<19)) {
-			c->x86_clflush_size = ((misc >> 8) & 0xff) * 8;
+		if (l1->clflush) {
+			c->x86_clflush_size = l1->clflush_size * 8;
 			c->x86_cache_alignment = c->x86_clflush_size;
 		}
 	}
-- 
2.54.0

