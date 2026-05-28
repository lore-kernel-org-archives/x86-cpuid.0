Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD51F4657EA
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983048; cv=none; b=KGBXJ0aulwJJAReUYUFilvVGvMRDc0HdhHsaeY4Dj5mtMyeLZfoUVmIfEJAmL0ORYs3eAbZc42MsMVNP41BnuMU7uX3YFncef98K/rrlinn8EOYlx6sCsXQEyFhi4tmJ+VDFYFb6n7b59KliHtVwUCQ1+yv6G0htuGc29bBUijI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983048; c=relaxed/simple;
	bh=Cqmkc6ziRX8vTg6v0K8RgdcbLnAEsdHv9VQ25MHatBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tPSocUvswcwWqcl4uqkmdR09xqMIgk59PtS0LWQCZk69LOAjGMmrNPllRNRQqzDaQ90ikI1JK9uQmyShI3OsDx3qdZs7u9d+h9HYD0WilOr5BqNMwHCJj/pkgUHip9+Qw3y2y4SPKRr5nI970NwN8pt8dBCwYk8gjj0yzci7hGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=S5VbDWP4; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0sVDdLEe; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="S5VbDWP4";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0sVDdLEe"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=io8uJI5ZUXWYShYYxjsQoGaewBoR08MQe30r4f4klSQ=;
	b=S5VbDWP47fs4JaqE+zl0ttQ7l2/HCK5TmjNtsT47W2vufME6nl+dH95XTeECPTJUMYWVGI
	lGnRHmuOT7NAEiWDfiN1/GJd/f/wpPQKTLkZg3Uvry9x4opT1wmvz6imcN9FxtrlY25HX8
	vpBRRDoGC4cky5ExkX+1Rrf278uQIoro0sTvW7FXXfxlAUgA20ySXUtmworcY5ihhgsECb
	ngmei1FH0E3Ifl8+P9ZHpzN6Cw1xefGQXwSZal14CVvUjXd5uyUD91/O5GQY6+vcP7dP86
	fbEPzm7Ra6NR9HWNS2OSHmzevUfugHlC0jBHndMZIH/TFgfjX3IcKJNJ3fcGMA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=io8uJI5ZUXWYShYYxjsQoGaewBoR08MQe30r4f4klSQ=;
	b=0sVDdLEeA7h58HjjNT7bt+PKlNahdpD6bl5wh/dHuf/3LGF7WAtVO98fNQgc/szAKBcZYN
	xddHVb8YUNErN+CA==
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
Subject: [PATCH v7 077/120] x86/sgx: Use parsed CPUID(0x12)
Date: Thu, 28 May 2026 17:38:39 +0200
Message-ID: <20260528153923.403473-78-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use parsed CPUID(0x12) instead of doing direct CPUID queries and manually
extracting the fields with bitwise operations.

Remove the subleaf's SGX_CPUID_EPC_INVALID type check since this is already
done by the parser's CPUID(0x12).n read function.  cpuid_subleaf_n() just
returns NULL in that case.

Rework sgx_calc_section_metric() to build-up the SGX metric directly from
the passed fields.  There is no need for extracting them with GENMASK
operations as this is already handled by the C99 bitfields.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/sgx/main.c | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/arch/x86/kernel/cpu/sgx/main.c b/arch/x86/kernel/cpu/sgx/main.c
index 4505f808af5e..071f034f8b2c 100644
--- a/arch/x86/kernel/cpu/sgx/main.c
+++ b/arch/x86/kernel/cpu/sgx/main.c
@@ -742,14 +742,12 @@ int arch_memory_failure(unsigned long pfn, int flags)
 }
 
 /*
- * A section metric is concatenated in a way that @low bits 12-31 define the
- * bits 12-31 of the metric and @high bits 0-19 define the bits 32-51 of the
- * metric.
+ * A section metric is concatenated in a way that @low bits define the bits
+ * 12-31 of the metric and @high bits define the bits 32-51 of the metric.
  */
-static inline u64 __init sgx_calc_section_metric(u64 low, u64 high)
+static inline u64 __init sgx_calc_section_metric(u32 low, u32 high)
 {
-	return (low & GENMASK_ULL(31, 12)) +
-	       ((high & GENMASK_ULL(19, 0)) << 32);
+	return ((u64)high << 32) | (low << 12);
 }
 
 #ifdef CONFIG_NUMA
@@ -796,29 +794,28 @@ static void __init arch_update_sysfs_visibility(int nid) {}
 
 static bool __init sgx_page_cache_init(void)
 {
-	u32 eax, ebx, ecx, edx, type;
+	const struct leaf_0x12_n *sl;
 	u64 pa, size;
 	int nid;
-	int i;
 
 	sgx_numa_nodes = kmalloc_objs(*sgx_numa_nodes, num_possible_nodes());
 	if (!sgx_numa_nodes)
 		return false;
 
-	for (i = 0; i < ARRAY_SIZE(sgx_epc_sections); i++) {
-		cpuid_count(SGX_CPUID, i + SGX_CPUID_EPC, &eax, &ebx, &ecx, &edx);
+	for (int i = 0; i < ARRAY_SIZE(sgx_epc_sections); i++) {
+		u32 subleaf = SGX_CPUID_EPC + i;
 
-		type = eax & SGX_CPUID_EPC_MASK;
-		if (type == SGX_CPUID_EPC_INVALID)
+		sl = cpuid_subleaf_n(&boot_cpu_data, 0x12, subleaf);
+		if (!sl)
 			break;
 
-		if (type != SGX_CPUID_EPC_SECTION) {
-			pr_err_once("Unknown EPC section type: %u\n", type);
+		if (sl->subleaf_type != SGX_CPUID_EPC_SECTION) {
+			pr_err_once("Unknown EPC section type: %u\n", sl->subleaf_type);
 			break;
 		}
 
-		pa   = sgx_calc_section_metric(eax, ebx);
-		size = sgx_calc_section_metric(ecx, edx);
+		pa   = sgx_calc_section_metric(sl->epc_sec_base_addr_0, sl->epc_sec_base_addr_1);
+		size = sgx_calc_section_metric(sl->epc_sec_size_0, sl->epc_sec_size_1);
 
 		pr_info("EPC section 0x%llx-0x%llx\n", pa, pa + size - 1);
 
-- 
2.54.0

