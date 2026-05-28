Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BE13F9265
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982866; cv=none; b=GQXJReEbgDsz39DaWHr9I4T/QKBD69Xqr7vQUaN/FkxkiC+kIUxEuV/hSaSsV8nsPlpUxk7kHI8B4CoEAul9YEDQ1owTxb5VN8ygA9hb+dRz/0PjMlx3fvcDhELenO2RsKhIzEJqCi8UFH5DMJL6Ip++aTXT38ku4h5Q7skY6aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982866; c=relaxed/simple;
	bh=K8l+CMt1nhsrtKmoUFIE9d1CJpJ/ZoJUHTFsX4Iuclc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FHAcsnuHGDslHJYn7I8ObwZcrMIPNVHOWluUQBXeuWdIsIeErG14rJyQNdnCXojtSCzFTut+vWNf6btAQS96981RZVbYc39MRrNXnPuc1qlC+80/zPcSXPMRoUwdmYXIX2C9fciJKacJU4HQZKfSkaL0wNx0cTKXhMFrWjmVooU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=U60MAgr9; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MsL7VmDf; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="U60MAgr9";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MsL7VmDf"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a6l2gTcdCR+q7YNOUBkwn1Odim7pWnPFKOhf0ZGlErA=;
	b=U60MAgr9rpv+85Qym3p1r4F6YBl0jWZKOQgiyqEfagmtG0x7HbGJHJskVeMEf/qLJEu5Dk
	IKEsA3yp6m1jeeM00rlwe55MV3uearqphVVk8+vrCqU3U2Zyey64xwjfHNvp5ZU2lI2dlO
	2+eMhu7c8Z8TClTLoUFhYdjsmx+cbQDGm6N34wxPw2zarJfue7jEhKrQJJGOUh0QVPdHj5
	UYiMs9D4/kSIkSXcZIjYzf1DQEczPMKqEvfP3+Gn31oFD8APQ3O1vYYjVdlDV6MPSNdjMD
	sLjWlrZ4m8kNsh0cukQTs9RU6TdRzsRoTyRRD7wqVq9UKuVKDXejyRshA4Kvlw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a6l2gTcdCR+q7YNOUBkwn1Odim7pWnPFKOhf0ZGlErA=;
	b=MsL7VmDfP1O9JsIUqI6vRga7lwODsrr6NuqhqEXCb9lWpKRAaO+0yeoyJ+typT7x5ZouSf
	0uqhfnEG25TE7gBg==
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
Subject: [PATCH v7 024/120] x86/cpu/zhaoxin: Use parsed CPUID(0xc0000001)
Date: Thu, 28 May 2026 17:37:46 +0200
Message-ID: <20260528153923.403473-25-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use parsed CPUID(0xc0000001).

Beside the CPUID parser centralization benefits, this allows using the
auto-generated x86-cpuid-db data types, and their full C99 bitfields,
instead of doing ugly bitwise operations on the CPUID output.

Keep the x86_capability[] CPUID(0xc0000001).EDX assignment.  It will be
removed once X86_FEATURE translation is integrated into the CPUID model.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/zhaoxin.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/arch/x86/kernel/cpu/zhaoxin.c b/arch/x86/kernel/cpu/zhaoxin.c
index 55bc656aaa95..ea76e9594453 100644
--- a/arch/x86/kernel/cpu/zhaoxin.c
+++ b/arch/x86/kernel/cpu/zhaoxin.c
@@ -11,35 +11,26 @@
 
 #define MSR_ZHAOXIN_FCR57 0x00001257
 
-#define ACE_PRESENT	(1 << 6)
-#define ACE_ENABLED	(1 << 7)
 #define ACE_FCR		(1 << 7)	/* MSR_ZHAOXIN_FCR */
-
-#define RNG_PRESENT	(1 << 2)
-#define RNG_ENABLED	(1 << 3)
 #define RNG_ENABLE	(1 << 8)	/* MSR_ZHAOXIN_RNG */
 
 static void init_zhaoxin_cap(struct cpuinfo_x86 *c)
 {
-	u32  lo, hi;
-
-	/* Test for Extended Feature Flags presence */
-	if (cpuid_eax(0xC0000000) >= 0xC0000001) {
-		u32 tmp = cpuid_edx(0xC0000001);
+	const struct leaf_0xc0000001_0 *l1 = cpuid_leaf(c, 0xc0000001);
+	u32 lo, hi;
 
+	if (l1) {
 		/* Enable ACE unit, if present and disabled */
-		if ((tmp & (ACE_PRESENT | ACE_ENABLED)) == ACE_PRESENT) {
+		if (l1->ace && !l1->ace_en) {
 			rdmsr(MSR_ZHAOXIN_FCR57, lo, hi);
-			/* Enable ACE unit */
 			lo |= ACE_FCR;
 			wrmsr(MSR_ZHAOXIN_FCR57, lo, hi);
 			pr_info("CPU: Enabled ACE h/w crypto\n");
 		}
 
 		/* Enable RNG unit, if present and disabled */
-		if ((tmp & (RNG_PRESENT | RNG_ENABLED)) == RNG_PRESENT) {
+		if (l1->rng && !l1->rng_en) {
 			rdmsr(MSR_ZHAOXIN_FCR57, lo, hi);
-			/* Enable RNG unit */
 			lo |= RNG_ENABLE;
 			wrmsr(MSR_ZHAOXIN_FCR57, lo, hi);
 			pr_info("CPU: Enabled h/w RNG\n");
-- 
2.54.0

