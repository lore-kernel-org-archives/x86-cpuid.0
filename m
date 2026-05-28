Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75344409630
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982884; cv=none; b=cvTw/zqnMbENqhB0TCV4kzKp4UiS5g9EJPtppwqufdpIgOPNuKmBf4+OLsiSnlPqs74VehPqYlj3YdIBV+et1MuOnE+Bc4hLlfAbKm1I82ZgKKozWCVYoqHopnW2BtJ3zaFoDv6kjOXFPtMEwZqaGxc4T+aJI1NiA2UnCKdQJ28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982884; c=relaxed/simple;
	bh=mJ93X1ivE2oqgltkL//rGGTPFa8WKLjw+oBgw2R5aw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pgzmqK2UjTQrP/k00mT8eKnkBY1WT5+vsTCRjYrR25exb8qsK2Bv+2fULjZnmByQdcJJHjxdzgVoy/CM52GNgQG43dSQVw9N02RqKD7Pmy+oXtBqLbXPc3S1QemLz97bCaur7x8Rs6dlYBL7rRzFnbxlsZof4N4rGTZYqBMpHeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xlKi0myS; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Vbvlo/54; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xlKi0myS";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Vbvlo/54"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AzDWHxSccHBy86sBlw6tGBt2CNdcE0O8iEr9zpIE3Uc=;
	b=xlKi0mySQW+abV1H4YNhFjbGVg6RWMC6yhDeQXBiGuxL9VDSwmtgYpHCjTfC5ODuA9aynk
	firQfd60qMT0BZV3ZyxrUAriVrMv7+uOofoXjrW47qsAUITn7p/M6GZVNsuD1FfYqCXMA9
	5koa0+BhV40D6KwYJJ+DRQfM1LgCwZAbNuniCzQyciKITBu7hxHiFGwMoOoHJPvTCIC5xS
	dQpucnYebncE2lYBnwO5ojgdhV64YIl11kk0uGfYsgfeUxV2BoY+4kS2JlkmELg+PIaoKZ
	VN4lYjdC5ok+ngJpE4XrVq0OZztjh3mgusJiybObOzK0O8fJljmWT3ByOrfMag==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AzDWHxSccHBy86sBlw6tGBt2CNdcE0O8iEr9zpIE3Uc=;
	b=Vbvlo/54zLc3H0QUcSbI7XlbwRJ8owrHgdKDg1YdUrcQ6Mz16Omuwp4L3QkbjUaV3YpIUN
	tZHYV00sJnaRLeCg==
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
Subject: [PATCH v7 029/120] x86/cacheinfo: Use parsed CPUID(0x2)
Date: Thu, 28 May 2026 17:37:51 +0200
Message-ID: <20260528153923.403473-30-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For Intel cacheinfo, use parsed CPUID(0x2) instead of a direct CPUID query.

Remove the maximum CPUID level check since the CPUID API's NULL check is
equivalent.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/cacheinfo.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/cpu/cacheinfo.c b/arch/x86/kernel/cpu/cacheinfo.c
index 51a95b07831f..6fded356f2ee 100644
--- a/arch/x86/kernel/cpu/cacheinfo.c
+++ b/arch/x86/kernel/cpu/cacheinfo.c
@@ -391,14 +391,14 @@ static void intel_cacheinfo_0x2(struct cpuinfo_x86 *c)
 {
 	unsigned int l1i = 0, l1d = 0, l2 = 0, l3 = 0;
 	const struct leaf_0x2_table *desc;
-	union leaf_0x2_regs regs;
-	u8 *ptr;
+	const struct cpuid_regs *regs;
+	const u8 *ptr;
 
-	if (c->cpuid_level < 2)
+	regs = cpuid_leaf_raw(c, 0x2);
+	if (!regs)
 		return;
 
-	cpuid_leaf_0x2(&regs);
-	for_each_cpuid_0x2_desc(regs, ptr, desc) {
+	for_each_parsed_cpuid_0x2_desc(regs, ptr, desc) {
 		switch (desc->c_type) {
 		case CACHE_L1_INST:	l1i += desc->c_size; break;
 		case CACHE_L1_DATA:	l1d += desc->c_size; break;
-- 
2.54.0

