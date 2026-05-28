Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E921240FDA2
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982894; cv=none; b=eZ1JI1gsw6TfIep0tqAmdXnruQiV2gLjvt8XeZNN4RfKpb57Q/3v1RexLhv0St8A2wUmUkBbn2asuDT/D++h8lZ/77GcOIr5ig/T9lez2qz1TXU+PeJHbuz0PQbDaAXZ8ajAXJdZHiiKGrfiul++yfUEK4f7FWRq9BkmVykrPqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982894; c=relaxed/simple;
	bh=asmsKTgbHE9koFljta6pJaueSFWxw/PmAgxd4HYmcy0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WyeOrA9odzQJVA1L+tNduKzAhPIR/TRjvqfG0UEoaJno6HxE55bXtDlwXUtQcghWoDxLlItYnc/myb3IxgvuxflPx285V1y2aF3In5CKkhv9af20AF+e1E9MAi5aNTfvtQa+i5i/R/WrvWEaxSWHhb3hvjw4C7ZVCocIkRFciEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sZpJr3ft; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JwLYCOA1; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sZpJr3ft";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JwLYCOA1"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fc7etnUnxpviEWTMshgDDXsfeYrPyAO6HhpCwUqQOG0=;
	b=sZpJr3ft5V6BHcTuwrkMHib1GfrtNgs1v3vgNYI/U99x4awDTupHJcG7tabgQdINahyA+b
	KQx4qhwQFkxzC1evWnLjBpjs5aqJVjB5uxFe/qQczc3l+1eDDSZXRWQnmFBLjowqjRQirC
	/xai0NovCTBsvYxWFa5EIk4pplJiT4KmhgYnVgQPKQJFNSaEH2yrR4JdcKAsxdYBfmudLZ
	b4W86XlfeIS5VzP2XjgQVU4Bt7MnTHcWSLdBgypZwFkbuHrqj9AUAEO8k4u5Zj0U2N8MR9
	+7T/8tEILTbxsemsPmjnw2YLVFgXo5UKmD/tU/+m+lBN9HNRzsjm7+Ceif/81g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fc7etnUnxpviEWTMshgDDXsfeYrPyAO6HhpCwUqQOG0=;
	b=JwLYCOA11dyrkoP1ebbzfjuDQ98ic3xEbyiCuV9nb2d6eVeMHXdTb6FYZs9MCjPfkllFaw
	eHZiBnge118OhZBA==
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
Subject: [PATCH v7 032/120] x86/cacheinfo: Pass a 'struct cpuinfo_x86' reference to CPUID(0x4) code
Date: Thu, 28 May 2026 17:37:54 +0200
Message-ID: <20260528153923.403473-33-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
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
2.54.0

