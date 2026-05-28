Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147AA426685
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982919; cv=none; b=rsD/uV4XIByuXlZhpBPa4Qc0OdGoD4CrT6eu8v8MoO2lmsGw8wTfq4uzsDLy4nlzn85GcM3EEjNrvY6G5Y4J4ShXouuhC1Y6WgsZVDXPuf1cuH6tXujjusVdOrVGZGgvp+16zih2tbhjEP6Y5+anKe2A+p2/uWoKh1IfYZ3HIzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982919; c=relaxed/simple;
	bh=GzAUVyIogj6AouCFNHtpIwBgpkyL9Xs+cgNMrHo2xTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M7DCzEKw4x2ypuGQx1A0ohBpuAFjPo+702Zo4yqY2xePXvFS9bPXjoEOiACUCXEvIcLEwYCnv/L3kXhLGMoHPcKhF2cSfcE2ruIeCEbQfX/ANI/vzWsx+ozKcQENGu6jaVt+Y7btaB0GXxVVRp3sY9GdTZ4PIlLOZe10GK+ndH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VSKnHeHg; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cwup18nL; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VSKnHeHg";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cwup18nL"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0x06ll8spNqNNsBVO/bvbZgTxlsANK8gWX8aScs9QVE=;
	b=VSKnHeHgp2Rj6J8M6gKtZ2aDUDzmeEuc5rPbX8yAGvazxkigK7mUKjPvE4vSB7p1bDYVQK
	ZT1zIYi/UBNxxevWGos7Ejgn7uvP2j7syvsi7qRrP+mz1qK7QyP061AkxIDNGz8qqdX7Mn
	zRCNXc7uou+a7Hwm1GlpEEC2SD5JXjl+gxHeJe4JnIDh3eMKjQDaDbf/IRqkwn/2PM+fB9
	y0GP9WY0zmbL6gT6N7l/iXMONJF5KG3cxl4A6ZRZNiSG3sb9I6Dh7W+teDQVEEtfmjxhrG
	hu5q1oT66PnQV1NGBEdM2M8cPPFg/XeAt3KzFoCBJZcrYIlk0IQHN9qwshU2Iw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0x06ll8spNqNNsBVO/bvbZgTxlsANK8gWX8aScs9QVE=;
	b=cwup18nLv7fJdMbAtA6ED7TWsblPNHHHcmcWGMIGWH2jH1MXusUe3yTFtITNbfike3Tdqz
	eBpsm1peP0qbuQBw==
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
Subject: [PATCH v7 040/120] x86/cpu/amd: Use parsed CPUID(0x80000005)
Date: Thu, 28 May 2026 17:38:02 +0200
Message-ID: <20260528153923.403473-41-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For AMD BSP init, use parsed CPUID(0x80000005) instead of issuing a direct
CPUID query and doing ugly bitwise operations.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/amd.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
index 62f74a7f2f8d..4fa16f2fd402 100644
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -4,6 +4,7 @@
 #include <linux/dmi.h>
 #include <linux/elf.h>
 #include <linux/mm.h>
+#include <linux/sizes.h>
 #include <linux/kvm_types.h>
 #include <linux/io.h>
 #include <linux/sched.h>
@@ -422,6 +423,8 @@ static void tsa_init(struct cpuinfo_x86 *c)
 
 static void bsp_init_amd(struct cpuinfo_x86 *c)
 {
+	const struct leaf_0x80000005_0 *el5 = cpuid_leaf(c, 0x80000005);
+
 	if (cpu_has(c, X86_FEATURE_CONSTANT_TSC)) {
 
 		if (c->x86 > 0x10 ||
@@ -434,13 +437,8 @@ static void bsp_init_amd(struct cpuinfo_x86 *c)
 		}
 	}
 
-	if (c->x86 == 0x15) {
-		unsigned long upperbit;
-		u32 cpuid, assoc;
-
-		cpuid	 = cpuid_edx(0x80000005);
-		assoc	 = cpuid >> 16 & 0xff;
-		upperbit = ((cpuid >> 24) << 10) / assoc;
+	if (c->x86 == 0x15 && el5) {
+		unsigned long upperbit = (el5->l1_icache_size_kb * SZ_1K) / el5->l1_icache_assoc;
 
 		va_align.mask	  = (upperbit - 1) & PAGE_MASK;
 		va_align.flags    = ALIGN_VA_32 | ALIGN_VA_64;
-- 
2.54.0

