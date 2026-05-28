Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5835647D937
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983117; cv=none; b=XJIbchPCkDhKBuWBHGex2m61nkgurOW3QotFEHVWmcdWsdw2dCJ7SDntvAqQrHGVGkdd3c2N7dPt/4vmkoiblbksi17n/OCkQSCZil4Od+kKQpJ6s5aNJUWNNOUO0V4a/r+jPbZBmcvwB8e+ZSXo9Ybbpw9G0sxmE0sYN+TG+Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983117; c=relaxed/simple;
	bh=rNb/T4Zus7JiWIXVpMiWHgHM40BoYPMiYqxWRz6Z7ko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fVdRRXb1NzI4HAbPBWM6V/qHKOXvMTko94jRYKA2n8/lL9I9rEx04yQEa6ec3RSt1Pn0ZkfCQuTtLK85ePopD/R+ehzWJoUga3MyFFEOAsHdBfrfCM6AeDe6KZXajpC6CCqO2eN5UWWbsasvTE9FADxmg4OamAXmm5hy2AWnmlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zNOTUJUe; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2z7fGsDr; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zNOTUJUe";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2z7fGsDr"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CC3FPCkBych/Q9MupCJVqCJWZ9FNhKO3UOw+uDEYWCc=;
	b=zNOTUJUeW4HWVSKIiPcq4ZP2PtKPD1bg4M+3l3TWAzL9qWxd9j3+Y37P9Bn5gVuqbSUYlv
	vagNC2E7odwnSTeoehJTjrRGdwXhCWCzAh12YS6GFhDCWuiObaJTPgWk65f71a9hNjzqhR
	V1EiVj+cUtcBpEAx86iSIh6rdaUWRDXaOPdtZQDbhTQGxxjCfkzsYuGgA/4tPm1ZYL+aF3
	V5zDORMu4Ohh/DrmFV2VbEtHbXgIPuErOxT8w7wzX8LZhqwUFzITP/PUfCX9LQZOclFSQm
	8PpkLoOlc/OBpoIn326yWCMo7929B1rMK49ULlxnvxTP5qsjaLi4NzbdUNM0ZA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CC3FPCkBych/Q9MupCJVqCJWZ9FNhKO3UOw+uDEYWCc=;
	b=2z7fGsDrgbkeuAoEhqqux/A8H0l5VuYvCwpQhNszuOE3hAq4CANxyTvTLupkFS9vG0hEtB
	uCjVFShFe9sWMoBQ==
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
Subject: [PATCH v7 097/120] perf/x86/amd/lbr: Use parsed CPUID(0x80000022)
Date: Thu, 28 May 2026 17:38:59 +0200
Message-ID: <20260528153923.403473-98-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For AMD LBR, use parsed CPUID(0x80000022) instead of a direct CPUID query
and custom perf data types.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/events/amd/lbr.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/x86/events/amd/lbr.c b/arch/x86/events/amd/lbr.c
index 5b437dc8e4ce..e5a16266545f 100644
--- a/arch/x86/events/amd/lbr.c
+++ b/arch/x86/events/amd/lbr.c
@@ -423,14 +423,13 @@ void amd_pmu_lbr_disable_all(void)
 
 __init int amd_pmu_lbr_init(void)
 {
-	union cpuid_0x80000022_ebx ebx;
+	const struct leaf_0x80000022_0 *l = cpuid_leaf(&boot_cpu_data, 0x80000022);
 
-	if (x86_pmu.version < 2 || !boot_cpu_has(X86_FEATURE_AMD_LBR_V2))
+	if (!l || x86_pmu.version < 2 || !boot_cpu_has(X86_FEATURE_AMD_LBR_V2))
 		return -EOPNOTSUPP;
 
 	/* Set number of entries */
-	ebx.full = cpuid_ebx(EXT_PERFMON_DEBUG_FEATURES);
-	x86_pmu.lbr_nr = ebx.split.lbr_v2_stack_sz;
+	x86_pmu.lbr_nr = l->lbr_v2_stack_size;
 
 	pr_cont("%d-deep LBR, ", x86_pmu.lbr_nr);
 
-- 
2.54.0

