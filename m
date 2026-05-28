Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BE0472774
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983063; cv=none; b=EYsTKP9PU7HYvAw3yr7XSlxjZOwJBtjZT/lBQoqCiUU53hciGTsGpgu4FOC7TYF34i9fpBNSpOViYvpOV+9kqdrUQ8lm+s/BjximTc5oQ6OjzEge8KoQh7mBeAtuGgs/Hd1wqttTeccO4KN66TI3XaQ0PAYzuqoVFV+taEOhO7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983063; c=relaxed/simple;
	bh=XiFxPkLhYbX9QLMJoAg2kwa2wqyT/N1MdE7O2hUjNRs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jqLWJlKN5YX9MwFVXPBygzCY0F8yKL3LWrVknmul6VwH+B/CX7zZTnu9lGVHfTs3kNf2lqdC57zB1oMIaqCxcVt2uCZ6u48Ag5YLBtEXof+n2qvJdsfMW9FVL7FdeHktP3cvYsH2PdTY3s+Ot+ghCU9wYT7OolNDkSwfEE8Zo0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vZkoduRM; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zLqFXrT8; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vZkoduRM";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zLqFXrT8"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H2BSQqdGpNJkQse8VR3+cNBbUKumENGCenMOjs/togw=;
	b=vZkoduRMy6aXrEEIItLDV/B3Us6v63ig2ggONhY1s8K3TKIqquPSE4nq/0Vn3O5CxnBKRz
	tyCea33H0rEubvb8HmW+8h/sGxWyCbyCbfiCaiDG1V8QTWFxXgTH/DUY/U827un/zl4773
	DNBZIpVe+5S3Wnx1B4VeFU9QEyR1EPAjJDO9yvBHH6l2WtOjrrZSIIHxh7+liIotl1jSai
	piIoc/cyN15kapYJkJ9n4RYbDT7owabZnGH0uWfAvKRBVFB1lcwP5C0kUda7Mjumo5r71T
	Dk8r4CU/rqIc/i5oo0584Qecr2QlKItw8IZqAc9c1a947m4NApaiVfAWlEehQQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H2BSQqdGpNJkQse8VR3+cNBbUKumENGCenMOjs/togw=;
	b=zLqFXrT8macK1jOZzMT6JvkT2BBRvJpHQz6MAf8e4v1y2ZRfHm/uTRyOak6fwZyD2Gs78k
	K0XOxTcjMWs/KxCw==
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
Subject: [PATCH v7 082/120] x86/cpu/intel: Use parsed CPUID(0xa)
Date: Thu, 28 May 2026 17:38:44 +0200
Message-ID: <20260528153923.403473-83-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For Intel's PMU enumeration, use parsed CPUID(0xa) instead of a CPUID query
and ugly bitwise operations.

Remove comments; the generated bitfield names already make everything clear.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/intel.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/cpu/intel.c b/arch/x86/kernel/cpu/intel.c
index 51078ffee16c..7ef3ba2eca3a 100644
--- a/arch/x86/kernel/cpu/intel.c
+++ b/arch/x86/kernel/cpu/intel.c
@@ -534,18 +534,16 @@ static const struct x86_cpu_id zmm_exclusion_list[] = {
 
 static void init_intel(struct cpuinfo_x86 *c)
 {
+	const struct leaf_0xa_0 *la = cpuid_leaf(c, 0xa);
+
 	early_init_intel(c);
 
 	intel_workarounds(c);
 
 	init_intel_cacheinfo(c);
 
-	if (c->cpuid_level > 9) {
-		unsigned eax = cpuid_eax(10);
-		/* Check for version and the number of counters */
-		if ((eax & 0xff) && (((eax>>8) & 0xff) > 1))
-			set_cpu_cap(c, X86_FEATURE_ARCH_PERFMON);
-	}
+	if (la && la->pmu_version && la->num_counters_gp > 1)
+		set_cpu_cap(c, X86_FEATURE_ARCH_PERFMON);
 
 	if (cpu_has(c, X86_FEATURE_XMM2))
 		set_cpu_cap(c, X86_FEATURE_LFENCE_RDTSC);
-- 
2.54.0

