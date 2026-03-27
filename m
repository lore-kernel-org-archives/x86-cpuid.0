Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FA736C5B1
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774578042; cv=none; b=iQsruJSWagb6MZ4QMCglEw0mvH+59pMAdIRHgYWly1yLO6p964ZM3TMknqeI4Cy9lqGKP0LBMTkdQCM/P1Kmv7ZkvTdIXD4HzepwAPSvJCk1XCy9eWpP2TEL0/z6eXeaf5rH3SeMaR1JGp2xo6vnXceuFUHO4vHNJg3CDoigGbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774578042; c=relaxed/simple;
	bh=S6PdoKoVK1RAbiChDpJafvEQ+U++BXqbd5oCCTs8c+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KechwZ7xN2Ha7K2TzHliKQt8QaSefh0B9HNG7Wo09dQegU7puXundkBXXHxHSuRQgRtW0k4VWVX+uYO7hHdUX0MJK0VGN6PgEQrYcLZPs3pDT5g+2ioCQd4c9gJ0Inz/+AZDsiSAUj44gpB+FSpl8Qyl7u/rivtGoOgNwGKOgUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nJyy3Xin; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DyrMb3MF; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nJyy3Xin";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DyrMb3MF"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774578040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6hfHK0atlkGoTf9BZSRTtqLiajpxo/GIUMScwkux0MY=;
	b=nJyy3Xin8us5g9fqitsiA2nt/6Y59ELs44iGIwyCFhgRUu0rGo1pwuNTZg9Ipl4g3mSMCt
	9n/kc6BOdyfWYWrgDvbefW3+OLEfqCwgaj0R/DpE+aq5dTj827069UPmxOYIho5hU9QQxM
	cpo7RGcfthBo65H4/2tXpjtNum93xPc7OOS3MqtTAS65f8XAJbwgksoN1TEUHT8R4rtM47
	0cFPoIM+oOWq/+Kqoc05yUK3B1i5HS2T8CRqkbdOauUaYFXhLUZYg5x2wwgOANXl11qJDJ
	2bDYbCf+H8nvSseAr4Lk32GjT6d2JVemPM+kwc7SEqSGB4ETGmViU7YLrEgb/Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774578040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6hfHK0atlkGoTf9BZSRTtqLiajpxo/GIUMScwkux0MY=;
	b=DyrMb3MF0PBXZi6vYTVgR0FUSDQF97dJYEacoyKek/n2fuGcIcQAJKXegDJNI2GgQrAJnz
	lx+y+eXKZm3E65Bg==
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
Subject: [PATCH v6 54/90] x86/cpu/zhaoxin: Use parsed CPUID(0xa)
Date: Fri, 27 Mar 2026 03:16:08 +0100
Message-ID: <20260327021645.555257-55-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For Zhaoxin's PMU enumeration, use parsed CPUID(0xa) instead of a direct
CPUID query and ugly bitwise operations.

Remove comments; the generated bitfield names already make everything clear.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/zhaoxin.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kernel/cpu/zhaoxin.c b/arch/x86/kernel/cpu/zhaoxin.c
index ea76e9594453..b068922efed9 100644
--- a/arch/x86/kernel/cpu/zhaoxin.c
+++ b/arch/x86/kernel/cpu/zhaoxin.c
@@ -61,20 +61,13 @@ static void early_init_zhaoxin(struct cpuinfo_x86 *c)
 
 static void init_zhaoxin(struct cpuinfo_x86 *c)
 {
+	const struct leaf_0xa_0 *la = cpuid_leaf(c, 0xa);
+
 	early_init_zhaoxin(c);
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
 
 	if (c->x86 >= 0x6)
 		init_zhaoxin_cap(c);
-- 
2.53.0

