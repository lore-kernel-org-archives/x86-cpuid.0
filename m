Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E51F36B060
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774578036; cv=none; b=ju/WN79i+Tj0uAM87MVFpAXz5xFQnWfDWF1HYw7DRH3EdWFx4hQJ6HmQvYalS0KZ+I0wvEa6WGxcp41dhrulEZZBiKCgeWboO8ijw5PdOUYX+k9XOiEwGvrqWGrUC6nf3VvjN44eLFfkJUgms56CHD3b9oL+i236MfwaOhu0qzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774578036; c=relaxed/simple;
	bh=5Qn7JTrQX1zgrCMOJmSHkg3rN59PTKEm6r51iNmKYM4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GajlUsA3eCCHiV+o+mvXqATwT2jE7e3yvhWj5VZXfC+ZTzEVY4FB78AlIhpsfZtGCxwWpxiWdW0+RaWVKZaUMjBPaPd7TiwzZPjWEnifv/u+Jc4z85V8bDiTgbnK34aG2UK6AqJrIqj4UQoxPwUYUcqm/jHZJdb4uySdiEfbYto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=es8xllZX; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=+nT+7LJ0; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="es8xllZX";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="+nT+7LJ0"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774578032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iht5mEjzhrYTARHxYbj6POkN9dM0/zZilLNyR9zhoMA=;
	b=es8xllZX3xHzDjKBuIuB6CRmVE3jpf2WPGYH8yUv9lvKx7aaZKSPJRhiwqNt3Q16MkH0wx
	8dxe4b7/le0nwj29BbK1CHbV1tBHZbKGFWUVVA7PLTtBjCOYCy+H180w89QVxRkHdnh5n4
	0oEojcTX2Ui++nWnveiV+201xs/LDC6Wq58WGUqPlMs3IN9OWnpqUfbK6AVsxRqAm0fy8T
	TecD6aSOnzu2tKirsCMafFxzO8Pd4TYHCEGGwXmKAz+uvZ9QDD1OtmDJYzDL+zkeJ3lJSb
	QoFxOOFvgykoqtJUD1hGprl0e7WsO+NPnhsBHGrQW19Xab97YELsVHK8O+tQwA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774578032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iht5mEjzhrYTARHxYbj6POkN9dM0/zZilLNyR9zhoMA=;
	b=+nT+7LJ0i6TKCJooCkmOZrGsZw7XPqkF3Kc6NYchplJHXHOREbkxyTNZVRDIYMqCS4hOy8
	Ueukp+alBtzp8yAA==
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
Subject: [PATCH v6 52/90] x86/cpu/intel: Use parsed CPUID(0xa)
Date: Fri, 27 Mar 2026 03:16:06 +0100
Message-ID: <20260327021645.555257-53-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
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
index 615e3a4872b7..7f186c68d701 100644
--- a/arch/x86/kernel/cpu/intel.c
+++ b/arch/x86/kernel/cpu/intel.c
@@ -547,18 +547,16 @@ static const struct x86_cpu_id zmm_exclusion_list[] = {
 
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
2.53.0

