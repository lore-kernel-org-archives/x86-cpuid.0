Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A37543C047
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982973; cv=none; b=ExP13o+6G3KVjgnpuUnYdFMtJ1n6pUp6959wtaV86QUkB5592mYh4pjPvuYqZ4A2MqLrXDcTd42ZYHZHaSLPdCz0BeTbyvLZak1JuQfM3dUOZ6TzwtmZBBFjf+0UF50v6fFxM8GBjSTyIbPKU9RrP6mQ2gWri4pgIFhwu65cwL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982973; c=relaxed/simple;
	bh=1ITqrBZMy3NZZZPnFPTp5jm2M3p9SayouHCM7d2b+l8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ThBumvQ8Ku8dxJ4WF9eVjmlf5YnC9Q0OC6dJQxtXRA6MjWbCTZP34rYLOgE2s7qaWA0qfdDxe35cFvZnnpvHO6k3uNPRcTnIl14i8LQGfXcZ+G0kRvDXDgz/LBzObT2MhVHSgKDJNNflmjQQrdS4cr0LPz64GgxomXDwjin3RzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=YVJ6bZmh; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Wxn/MI46; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YVJ6bZmh";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Wxn/MI46"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TBP+DUsQYUpIxnHnXTXZoOg/tXyMJG1c85t1PxQvzXg=;
	b=YVJ6bZmhAg0hwry8lggRx5qlJlSCc80IOUbS3WvEZk5cIcyLrtQZAC/ajZVKRuc4OfAAQl
	06QMau9kCetT9cvHILnVgpa2a+oDk6IjVDbw8DmM3CS4ZAkBQ22EjysORROv5FMl2qgfs8
	aqOCp+CozeRCCEeQvJWaQv7VgzViIZFnssN4vB65OHrsd7x3lJMHKWS/xGnvfCpodPaB/C
	tfaiRQ26vHCer+El1deOtGwwyjvMpJOp1TVO3k/bk8rEa0XqF0PaI4K1Cv+xh8OebPi5Kk
	ZhmVK4sdnO8nTLJT+J6M92UDQ3pFZKuEVPlVdDFhZsCfDB/4+YcmcWdhThFW7w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TBP+DUsQYUpIxnHnXTXZoOg/tXyMJG1c85t1PxQvzXg=;
	b=Wxn/MI46v/dK1dCfrgmncsMj/Yh3Rgig+T6S4MrgDppwZjo7v+7Tbnv61di7ltvr/FWulG
	Wz7Ud42UkeEyDwAg==
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
Subject: [PATCH v7 054/120] x86/xen: Use parsed CPUID(0x1)
Date: Thu, 28 May 2026 17:38:16 +0200
Message-ID: <20260528153923.403473-55-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For Xen init, use parsed CPUID(0x1) instead of manual bitwise operations
and a direct CPUID query.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/xen/enlighten_pv.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 223e9a2eb2d5..4883d6095436 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -369,15 +369,13 @@ static bool __init xen_check_mwait(void)
 
 static bool __init xen_check_xsave(void)
 {
-	unsigned int cx, xsave_mask;
+	const struct leaf_0x1_0 *l1 = cpuid_leaf(&boot_cpu_data, 0x1);
 
-	cx = cpuid_ecx(1);
-
-	xsave_mask = (1 << (X86_FEATURE_XSAVE % 32)) |
-		     (1 << (X86_FEATURE_OSXSAVE % 32));
+	if (!l1)
+		return false;
 
 	/* Xen will set CR4.OSXSAVE if supported and not disabled by force */
-	return (cx & xsave_mask) == xsave_mask;
+	return l1->xsave && l1->osxsave;
 }
 
 static void __init xen_init_capabilities(void)
-- 
2.54.0

