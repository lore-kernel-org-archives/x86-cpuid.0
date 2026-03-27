Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4AC36C0AD
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774578039; cv=none; b=svOeA6AzwmdzYjEKBT1xOM/7ywgFLZgM5VGlaUBLGK5NAnXqVuMBPTmOYganr+VWojVlTbfbV6QoLyYN+XMm7cbzH5Frxsbu7f+s5cDE+tXedKgq10sdTcoEwlhFbewuLzCQmSZa/AH1Wvv2+hSll03TcIjzPOXWU6/ZefWhRVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774578039; c=relaxed/simple;
	bh=GJ0vuQ7qDmqzD6ffQfJTcKI5klRULf7H+l4njbgntPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HLanES7fIcY+/92sIlTaP7589w/y5umcIASIt1QiwD4qYOj78+UYbNkI/IShLYYjby829YqG20a8eTAydZ/Lp0OphkUHRY8DbLB2XRaPnDQ+MbH9zQkH/spPmJ8PfH718XLdf7+yoYP0vDZw4UMrUZIREG+En09pOvCRCzNlLTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TDlqIpuD; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NFXaaFfB; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TDlqIpuD";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NFXaaFfB"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774578037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SUx7k9/1NjiaiiOuk6rPvV52B2BWXioour7tkW29pp8=;
	b=TDlqIpuDg0B32VnW6yw4YEar8uiidzwfsXV+imR/DJzeN2Qfffg+qgwvqBiwRqAyH3emil
	+/iy1V4OPhRqVrvOCcA7mJ5V2mZWLmLWJW2c09dlHCvMpHyBUhLJLK2Gza5oUFok1WF1fJ
	brhAf0Vh3Qang4Vz7oTFp57cFkb3iDpRLQwnYDfnEDZNpmt6X7XSO+hW0KZG2SOnd6KHVQ
	CJmkdttHv5URkCoU5AiEQilffbaGb2y80EB/fbSRLzyAePKW1ZJDErtDJxMbzk6AQl5LtB
	XsEuylZiChkLOWQXvqG/7KF23Ulo287pwTauLuMaI+naMPm4baL+TNkhqx8qlQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774578037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SUx7k9/1NjiaiiOuk6rPvV52B2BWXioour7tkW29pp8=;
	b=NFXaaFfBLP05ZA0ufOjW/Ij/kIS2twodB7HD+YgsVLwGjpj9EZWCNR38OEBHMsNTOgAZHT
	lO99ZTipTxIb+6Bw==
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
Subject: [PATCH v6 53/90] x86/cpu/centaur: Use parsed CPUID(0xa)
Date: Fri, 27 Mar 2026 03:16:07 +0100
Message-ID: <20260327021645.555257-54-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
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
2.53.0

