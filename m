Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CC0477985
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983066; cv=none; b=lG9db4+LOQhyZmnc6bPzplGhrZMoCpddAjSR9Nn/G69CQrI8Rhi8Z7LnKLQC2b2mKcmNf7i2ldIr8JcBJx1L3sw7AqKijNUjhOVwKP3m0VBLSyNtzcqM3b/hTuXcluookTGQ+TAKblSJYGOFV3Sc36WxN4pwlXuJIGkAbVVtats=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983066; c=relaxed/simple;
	bh=yHW9V1A2BQR4bDofDcUzcs8oedumY+JMCo6rYr49hRk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rQ7xE8KVT6a3OdWtRJiDnn3aFs8eyXl4AGqA90woDr/a8gzrtVdPqREgrxaWbo0VFBs236Op0baQsfkYxTsKBlHVt2wlPXMOCEwS9CB9Brb460afyIV2Xjf0UilfHeqnk4IbVThDPDjLqRWK3FJ/IbfbYn3f/okiRtEc7Y2bq88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=eoTKXB2H; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0B70BZpT; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="eoTKXB2H";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0B70BZpT"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x1+DpAEONFohVtaQVhJCcQ6qez7fy7CNdepuo79ZG7Y=;
	b=eoTKXB2Hl9u+ZSomzoOJUZDE72dQAl+J70uLjGemb2t27B//wRTIfGvrKgPYvtk/aYRekx
	m2/trEzwS5umyarUR0Fhgu+Qf/xTyWXRUc4r84rSGWxqwru9XYmYaIVv6TXdll5ixriMUJ
	8UbxnT7PCMNDaf1CbRxMCy/f2/OQzG26YTMx8QSLDUiwdoVjAQhHErUBOokK6HOsFal7O3
	hFHlU9mXp8gFqd8CCmSoRT/7U+MlPuIbp3CBBtkX9yCK9zvxzpmnaKgAyjiqxlO19vQqJI
	siRy267Y77eXG1LdBquBOQPGpL0qw77UkQJneoO5Z3/cb3MKKa4YUp8q8LKBhg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x1+DpAEONFohVtaQVhJCcQ6qez7fy7CNdepuo79ZG7Y=;
	b=0B70BZpThKdtjXtlPVla/b0/Yjw/TveWXkL8hCgFpFqqg1+ygp+PFybUvf9wMNFFQmDToW
	i/zUXrFz+j5WKPCQ==
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
Subject: [PATCH v7 083/120] x86/cpu/centaur: Use parsed CPUID(0xa)
Date: Thu, 28 May 2026 17:38:45 +0200
Message-ID: <20260528153923.403473-84-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For Centaur's PMU enumeration, use parsed CPUID(0xa) instead of a direct
CPUID query and ugly bitwise operations.

Remove comments; the generated bitfield names already make everything clear.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/centaur.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kernel/cpu/centaur.c b/arch/x86/kernel/cpu/centaur.c
index 895cf00919d3..86cbe4427453 100644
--- a/arch/x86/kernel/cpu/centaur.c
+++ b/arch/x86/kernel/cpu/centaur.c
@@ -106,6 +106,7 @@ static void early_init_centaur(struct cpuinfo_x86 *c)
 
 static void init_centaur(struct cpuinfo_x86 *c)
 {
+	const struct leaf_0xa_0 *la = cpuid_leaf(c, 0xa);
 #ifdef CONFIG_X86_32
 	const struct leaf_0x80000005_0 *el5 = cpuid_leaf(c, 0x80000005);
 	u32  lo, hi, newlo;
@@ -116,17 +117,8 @@ static void init_centaur(struct cpuinfo_x86 *c)
 	early_init_centaur(c);
 	init_intel_cacheinfo(c);
 
-	if (c->cpuid_level > 9) {
-		unsigned int eax = cpuid_eax(10);
-
-		/*
-		 * Check for version and the number of counters
-		 * Version(eax[7:0]) can't be 0;
-		 * Counters(eax[15:8]) should be greater than 1;
-		 */
-		if ((eax & 0xff) && (((eax >> 8) & 0xff) > 1))
-			set_cpu_cap(c, X86_FEATURE_ARCH_PERFMON);
-	}
+	if (la && la->pmu_version && la->num_counters_gp > 1)
+		set_cpu_cap(c, X86_FEATURE_ARCH_PERFMON);
 
 #ifdef CONFIG_X86_32
 	if (c->x86 == 5) {
-- 
2.54.0

