Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520FE3FF8AA
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982836; cv=none; b=aF+7dwIdS+K5FOt9rBqPF5I6yDxlAhkjkOspcj48HWTxOVoy6lNZfS0UElD0FLQ/3Se7xlggp2MTa6EGq/5BVQcW3q1rMqe+f4W/V7flGZHLY2X05lYxbBptAfvRB334EKPhdCsDvvQi+gjBairt1IYglt8+WhmNBcXDEIRVuU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982836; c=relaxed/simple;
	bh=egJtEUgAAOv+REXJnPKTatiACh6x5W3wIvM/iV2OfNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q3i/Bh07TMN6r7NEj61SIajGeUAT6sGW87FzTx40zUrvT0z5lWrs6//5c5q0nqo1ND+/quGdMCWjiHb6YtOoJ3dh+muXdYrcXnhCTc7fcnDydoAUthy/K723cj487gA9d4WbMKkbRqF+z9pMbBVrCDgI5I6ExGNQljTZAjNT3So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=11kRacLW; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=EmIfIPQl; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="11kRacLW";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EmIfIPQl"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P1fKBOdy7Ox4wwAyB5ruCggSZ6NrUZ+tCeO0Em2q5Sw=;
	b=11kRacLWTCLWQTVh4HQDLcaPRL/e4wOKIcik4vM9SWqEt6LaeCzT4VLrVa2F2p3FftIucK
	vOq6k5q4ZBls8dTl06a2NqiSfb2qBy+KwDjjZSUAodU4D/nJfl5PLHOQcEgVbuW/GjXuzZ
	E2Zyc9dz66mM/0Q7EUBnrCtluG5Hd3EiCXLcl526W5EjXxwSpbpQjczJkEw9IcxGj7x9ri
	6upCP9it2MO0QUHIeugKsTjuuz1NszWe26O3YNQ0+2oRrGmBx3ZOP0IIOFEP22OzVn++vt
	JGfv6hK+5s6Zskp0UrtmGhC5J00izRV+Fm5xrM/QTMG0OYBRmvCiPMlSdg+2og==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P1fKBOdy7Ox4wwAyB5ruCggSZ6NrUZ+tCeO0Em2q5Sw=;
	b=EmIfIPQlftyVP5hk417TNkCJBUwQ+9su8PlqHcdz2MlLv+U4CAhHCAcSKaylMUJrDlycoJ
	zGeKiz7EGXOkOMDA==
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
Subject: [PATCH v7 015/120] x86/cpu: Use parsed CPUID(0x80000002) to CPUID(0x80000004)
Date: Thu, 28 May 2026 17:37:37 +0200
Message-ID: <20260528153923.403473-16-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For CPU brand string enumeration, use parsed CPUID(0x80000002) to
CPUID(0x80000004) instead of invoking direct CPUID queries.

This centralizes CPUID invocation to the system's CPUID parser.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/common.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 9b05a747161f..3d5b5df544d1 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -826,16 +826,18 @@ static const struct cpu_dev *cpu_devs[X86_VENDOR_NUM] = {};
 
 static void get_model_name(struct cpuinfo_x86 *c)
 {
-	unsigned int *v;
+	const struct leaf_0x80000002_0 *l2 = cpuid_leaf(c, 0x80000002);
+	const struct leaf_0x80000003_0 *l3 = cpuid_leaf(c, 0x80000003);
+	const struct leaf_0x80000004_0 *l4 = cpuid_leaf(c, 0x80000004);
 	char *p, *q, *s;
 
-	if (c->extended_cpuid_level < 0x80000004)
+	if (!l2 || !l3 || !l4)
 		return;
 
-	v = (unsigned int *)c->x86_model_id;
-	cpuid(0x80000002, &v[0], &v[1], &v[2], &v[3]);
-	cpuid(0x80000003, &v[4], &v[5], &v[6], &v[7]);
-	cpuid(0x80000004, &v[8], &v[9], &v[10], &v[11]);
+	*(struct leaf_0x80000002_0 *)&c->x86_model_id[0]  = *l2;
+	*(struct leaf_0x80000003_0 *)&c->x86_model_id[16] = *l3;
+	*(struct leaf_0x80000004_0 *)&c->x86_model_id[32] = *l4;
+
 	c->x86_model_id[48] = 0;
 
 	/* Trim whitespace */
-- 
2.54.0

