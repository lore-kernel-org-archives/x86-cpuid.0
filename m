Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F0133D4EE
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774577934; cv=none; b=SAVo5IO3DLJIwZDQdm5mj/Mr/QzTx4YXlpHdvxjdtzspxmKK3CAj1RzMoZb7eNoyzlamy+3Er/tqB1any9fGMWGb7odrAgLsL7K0u5i1xDc6E0WIYVxiBRRRYDoylywfv7D0aOfIX5HryQMP0o/apZfsxsszx2RT8qcb5iHp5zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774577934; c=relaxed/simple;
	bh=wRcuftV1npV2j+2TX6o5z7QUSArBVonRJszU42XfvT8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y509fk80r+4xpwiHl1QzoM7VN7BAo34AfNf/9LZZY9a4IymF8hMdqxqzd1eEyhUdV2WqPDwGBZ2eV/2dftsJBG6IUVC2GsoCegd+rHc/wc8F+L3WMiE4QIyyK2dc8ztQ3iAFZSS4yy3l0phkOhn02H+/o3eFhC2KFrA+N+Z4HkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cKf3bgei; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Q2h7pSWy; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cKf3bgei";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Q2h7pSWy"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774577932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HIvVkXscnC8hnZxvl25NcJNOn/r3wHzaILQLs0FR6Nk=;
	b=cKf3bgeii9+RjP58CdeteFDE8KfKwpC8oSKJQMx3zOZqTedUkyeZxxJwo50WG2JeajDLBo
	ZRfnxc7Dskq9fdcqDXGdKZ7EcvgRI/ceZYHvOUCn00GAdl3YCzzA4PhU5GmT1wbmxDcL2J
	lPVDTL/L3xJE7kolusTK02lkHAd7FFQj1fwqlzo/F16dTLqMHG+LtuFmiF0raPZjDirBsh
	CPMYnXHbb6dN05z8zUYkiMr2eb5cD8fY8dhxmEj4s3GzMpUr4l3AQig309LllCOxDoRAhg
	bZXC7QrqgQfpnD0YYIgbWuYf5k7Mbafm/obznb2UR3RaHGQZhpJVnmNr0jYnsg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774577932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HIvVkXscnC8hnZxvl25NcJNOn/r3wHzaILQLs0FR6Nk=;
	b=Q2h7pSWyVazmTAgFShv8LdMyZ5G45VfLsTjtomegFHqvkDRsl9CeKRxhLQHAjI2TcRIaO9
	h8TvGAAbn929IHBQ==
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
Subject: [PATCH v6 26/90] x86/cpu: transmeta: Use parsed CPUID(0x80860000)->CPUID(0x80860006)
Date: Fri, 27 Mar 2026 03:15:40 +0100
Message-ID: <20260327021645.555257-27-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use parsed CPUID(0x80860000) to CPUID(0x80860006).

Beside the CPUID parser centralization benefits, this allows using the
auto-generated x86-cpuid-db data types, and their full C99 bitfields,
instead of doing ugly bitwise operations on the CPUID output.

Keep the x86_capability[] CPUID(0x80860001).EDX assignment.  It will be
removed when X86_FEATURE translation is integrated into the CPUID table.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/transmeta.c | 102 ++++++++++++++------------------
 1 file changed, 44 insertions(+), 58 deletions(-)

diff --git a/arch/x86/kernel/cpu/transmeta.c b/arch/x86/kernel/cpu/transmeta.c
index d9e0edb379b8..4b77dc1a7d9e 100644
--- a/arch/x86/kernel/cpu/transmeta.c
+++ b/arch/x86/kernel/cpu/transmeta.c
@@ -12,77 +12,63 @@
 
 static void early_init_transmeta(struct cpuinfo_x86 *c)
 {
-	u32 xlvl;
+	const struct leaf_0x80860000_0 *l = cpuid_leaf(c, 0x80860000);
 
-	/* Transmeta-defined flags: level 0x80860001 */
-	xlvl = cpuid_eax(0x80860000);
-	if ((xlvl & 0xffff0000) == 0x80860000) {
-		if (xlvl >= 0x80860001)
-			c->x86_capability[CPUID_8086_0001_EDX] = cpuid_edx(0x80860001);
-	}
+	if (l && l->max_tra_leaf >= 0x80860001)
+		c->x86_capability[CPUID_8086_0001_EDX] = cpuid_edx(0x80860001);
+}
+
+/*
+ * If CPU revision is 0x02000000, then CPUID(0x80860002) should be used instead.
+ */
+static bool is_legacy_revision(const struct leaf_0x80860001_0 *l1)
+{
+	return !(l1->cpu_rev_major == 2 && l1->cpu_rev_minor == 0 &&
+		 l1->cpu_rev_mask_major == 0 && l1->cpu_rev_mask_minor == 0);
 }
 
 static void init_transmeta(struct cpuinfo_x86 *c)
 {
-	unsigned int cap_mask, uk, max, dummy;
-	unsigned int cms_rev1, cms_rev2;
-	unsigned int cpu_rev, cpu_freq = 0, cpu_flags, new_cpu_rev;
-	char cpu_info[65];
+	const struct leaf_0x80860001_0 *l1 = cpuid_leaf(c, 0x80860001);
+	const struct leaf_0x80860002_0 *l2 = cpuid_leaf(c, 0x80860002);
+	const struct leaf_0x80860003_0 *l3 = cpuid_leaf(c, 0x80860003);
+	const struct leaf_0x80860004_0 *l4 = cpuid_leaf(c, 0x80860004);
+	const struct leaf_0x80860005_0 *l5 = cpuid_leaf(c, 0x80860005);
+	const struct leaf_0x80860006_0 *l6 = cpuid_leaf(c, 0x80860006);
+	unsigned int cap_mask, uk;
 
 	early_init_transmeta(c);
 
 	cpu_detect_cache_sizes(c);
 
-	/* Print CMS and CPU revision */
-	max = cpuid_eax(0x80860000);
-	cpu_rev = 0;
-	if (max >= 0x80860001) {
-		cpuid(0x80860001, &dummy, &cpu_rev, &cpu_freq, &cpu_flags);
-		if (cpu_rev != 0x02000000) {
-			pr_info("CPU: Processor revision %u.%u.%u.%u, %u MHz\n",
-				(cpu_rev >> 24) & 0xff,
-				(cpu_rev >> 16) & 0xff,
-				(cpu_rev >> 8) & 0xff,
-				cpu_rev & 0xff,
-				cpu_freq);
-		}
+	if (l1 && is_legacy_revision(l1)) {
+		pr_info("CPU: Processor revision %u.%u.%u.%u, %u MHz\n",
+			l1->cpu_rev_major, l1->cpu_rev_minor,
+			l1->cpu_rev_mask_major, l1->cpu_rev_mask_minor,
+			l1->cpu_base_mhz);
 	}
-	if (max >= 0x80860002) {
-		cpuid(0x80860002, &new_cpu_rev, &cms_rev1, &cms_rev2, &dummy);
-		if (cpu_rev == 0x02000000) {
-			pr_info("CPU: Processor revision %08X, %u MHz\n",
-				new_cpu_rev, cpu_freq);
-		}
+
+	if (l1 && l2 && !is_legacy_revision(l1)) {
+		pr_info("CPU: Processor revision %08X, %u MHz\n",
+			l2->cpu_rev_id, l1->cpu_base_mhz);
+	}
+
+	if (l2) {
 		pr_info("CPU: Code Morphing Software revision %u.%u.%u-%u-%u\n",
-		       (cms_rev1 >> 24) & 0xff,
-		       (cms_rev1 >> 16) & 0xff,
-		       (cms_rev1 >> 8) & 0xff,
-		       cms_rev1 & 0xff,
-		       cms_rev2);
+			l2->cms_rev_major, l2->cms_rev_minor,
+			l2->cms_rev_mask_1, l2->cms_rev_mask_2,
+			l2->cms_rev_mask_3);
 	}
-	if (max >= 0x80860006) {
-		cpuid(0x80860003,
-		      (void *)&cpu_info[0],
-		      (void *)&cpu_info[4],
-		      (void *)&cpu_info[8],
-		      (void *)&cpu_info[12]);
-		cpuid(0x80860004,
-		      (void *)&cpu_info[16],
-		      (void *)&cpu_info[20],
-		      (void *)&cpu_info[24],
-		      (void *)&cpu_info[28]);
-		cpuid(0x80860005,
-		      (void *)&cpu_info[32],
-		      (void *)&cpu_info[36],
-		      (void *)&cpu_info[40],
-		      (void *)&cpu_info[44]);
-		cpuid(0x80860006,
-		      (void *)&cpu_info[48],
-		      (void *)&cpu_info[52],
-		      (void *)&cpu_info[56],
-		      (void *)&cpu_info[60]);
-		cpu_info[64] = '\0';
-		pr_info("CPU: %s\n", cpu_info);
+
+	if (l3 && l4 && l5 && l6) {
+		u32 info[] = {
+			l3->cpu_info_0,  l3->cpu_info_1,  l3->cpu_info_2,  l3->cpu_info_3,
+			l4->cpu_info_4,  l4->cpu_info_5,  l4->cpu_info_6,  l4->cpu_info_7,
+			l5->cpu_info_8,  l5->cpu_info_9,  l5->cpu_info_10, l5->cpu_info_11,
+			l6->cpu_info_12, l6->cpu_info_13, l6->cpu_info_14, l6->cpu_info_15,
+			0 /* Null terminator */,
+		};
+		pr_info("CPU: %s\n", (char *)info);
 	}
 
 	/* Unhide possibly hidden capability flags */
-- 
2.53.0

