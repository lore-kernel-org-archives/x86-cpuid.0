Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AA0346A18
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774577976; cv=none; b=hwnWj6E7lFKDrRC0vZJwPC/XIBtTw2t8LmsM5yCYYpoglmu0H6p+qYIgCG9vYqaIfMeUggirVpRLuJeAyZ+FFlvfkPZNmF5f7WLhB8stMvycG6u3OdStTpsWS+5FIe1gYXYr9NLEdskvj9EJN4Y1Kf+X+8/B4AH8fTt18fSKAgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774577976; c=relaxed/simple;
	bh=oeciX+xBFkxDl/G66xC21Z8DU7GitMDFvGoSzbk8aXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JV5Hpobff0llEOuKt7akJBWixnw/lQuendcmy0EqstnyAuIhHj6ZvmJUdg7JMxcDgjJ8k4U1OZb/26a/3LW/cUsGZKz2fRkEtJXdywiqA7x9BuMwYPVzyeBEfn4U7Lo4+yZgyosKJqFZLmRN8PzOAUacdRM5seCVBtQMq/XQtro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=L2ug+vcl; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=WUYzDQop; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="L2ug+vcl";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="WUYzDQop"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774577973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wIp/2ZkPm/U1GI00oPM0wnWLAnjRVCa3B8aMnqLPaqc=;
	b=L2ug+vclbljoeI3XgpwllF/Do2kkqqZ6TDXnJp/KEDrmUoNc7dO8X6G3q8pyO6W1rYHSsS
	kCfP29CHJr5RaA4QkCr9ul4qsbGlIHkthSj4sBlKvg8Pj4vtQ2NOWUw9U1AqGQB1QGIrPx
	AM8D5sPsS0T8dYiXrQM8J2kotv/ag6ovL+YgiM1/oPCZEvLm+oth7cyzCZ2j8dW0Q+8xV7
	CenDE6vAc1UK5cN9X391J74xdJHfl9JvNKqoak68MBF8huho48Cf6mhTraN/UZBUsGToJq
	krU+hxWKJFqVCpsAHynULH08DfehsNp6CQBIIzYfzZDMjEyIDTHyPJ0Ft0jUcg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774577973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wIp/2ZkPm/U1GI00oPM0wnWLAnjRVCa3B8aMnqLPaqc=;
	b=WUYzDQopumAb/GpHFUvhq52+Kq2rYM/kShyB8KlP9q87QyIh5Jax5dyU7Ds8gUBIYeIXtn
	11ooid4kbX1MsFDA==
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
Subject: [PATCH v6 37/90] x86/cacheinfo: Pass a 'struct cpuinfo_x86' refrence to CPUID(0x4) code
Date: Fri, 27 Mar 2026 03:15:51 +0100
Message-ID: <20260327021645.555257-38-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prepare the CPUID(0x4) cache topology code for using the parsed CPUID API
instead of invoking direct CPUID queries.

Since the CPUID API requires a 'struct cpuinfo_x86' reference, trickle it
from <linux/cacheinfo.h>'s populate_cache_leaves() x86 implementation down
to fill_cpuid4_info() and its Intel-specific CPUID(0x4) code.

No functional change intended.

Suggested-by: Ingo Molnar <mingo@kernel.org>
Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
Link: https://lore.kernel.org/lkml/aBnEBbDATdE2LTGU@gmail.com
---
 arch/x86/kernel/cpu/cacheinfo.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/cpu/cacheinfo.c b/arch/x86/kernel/cpu/cacheinfo.c
index d933d58a5a61..07f7e7b667ed 100644
--- a/arch/x86/kernel/cpu/cacheinfo.c
+++ b/arch/x86/kernel/cpu/cacheinfo.c
@@ -252,7 +252,7 @@ static int amd_fill_cpuid4_info(int index, struct _cpuid4_info *id4)
 	return cpuid4_info_fill_done(id4, eax, ebx, ecx);
 }
 
-static int intel_fill_cpuid4_info(int index, struct _cpuid4_info *id4)
+static int intel_fill_cpuid4_info(struct cpuinfo_x86 *unused, int index, struct _cpuid4_info *id4)
 {
 	union _cpuid4_leaf_eax eax;
 	union _cpuid4_leaf_ebx ebx;
@@ -264,13 +264,13 @@ static int intel_fill_cpuid4_info(int index, struct _cpuid4_info *id4)
 	return cpuid4_info_fill_done(id4, eax, ebx, ecx);
 }
 
-static int fill_cpuid4_info(int index, struct _cpuid4_info *id4)
+static int fill_cpuid4_info(struct cpuinfo_x86 *c, int index, struct _cpuid4_info *id4)
 {
 	u8 cpu_vendor = boot_cpu_data.x86_vendor;
 
 	return (cpu_vendor == X86_VENDOR_AMD || cpu_vendor == X86_VENDOR_HYGON) ?
 		amd_fill_cpuid4_info(index, id4) :
-		intel_fill_cpuid4_info(index, id4);
+		intel_fill_cpuid4_info(c, index, id4);
 }
 
 static int find_num_cache_leaves(struct cpuinfo_x86 *c)
@@ -443,7 +443,7 @@ static bool intel_cacheinfo_0x4(struct cpuinfo_x86 *c)
 		struct _cpuid4_info id4 = {};
 		int ret;
 
-		ret = intel_fill_cpuid4_info(i, &id4);
+		ret = intel_fill_cpuid4_info(c, i, &id4);
 		if (ret < 0)
 			continue;
 
@@ -612,17 +612,17 @@ int populate_cache_leaves(unsigned int cpu)
 	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
 	struct cacheinfo *ci = this_cpu_ci->info_list;
 	u8 cpu_vendor = boot_cpu_data.x86_vendor;
-	u32 apicid = cpu_data(cpu).topo.apicid;
+	struct cpuinfo_x86 *c = &cpu_data(cpu);
 	struct amd_northbridge *nb = NULL;
 	struct _cpuid4_info id4 = {};
 	int idx, ret;
 
 	for (idx = 0; idx < this_cpu_ci->num_leaves; idx++) {
-		ret = fill_cpuid4_info(idx, &id4);
+		ret = fill_cpuid4_info(c, idx, &id4);
 		if (ret)
 			return ret;
 
-		id4.id = get_cache_id(apicid, &id4);
+		id4.id = get_cache_id(c->topo.apicid, &id4);
 
 		if (cpu_vendor == X86_VENDOR_AMD || cpu_vendor == X86_VENDOR_HYGON)
 			nb = amd_init_l3_cache(idx);
-- 
2.53.0

