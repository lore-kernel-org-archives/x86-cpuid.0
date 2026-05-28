Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090D044BCAF
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983026; cv=none; b=lCeMB64Mjy02S+1hPA1ilJaFdKSdRU5ipp4cFk3fq3GbBQK46qay0++KCmnEmNPqTCKWXVZYNvkntxlMW7duixFVEV7k5KzqALy/9H874A5qquIXt6JmsHAazE973lPrRPRXuXMmnRtQTlfLJMhhJTeX+GCsp55b3yNGfNWJwXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983026; c=relaxed/simple;
	bh=OKbnhTkPhgK6INNjtjCVeg1lJtYM2Yiq1vQD/tf6zzg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XV1YgfOWHS9ASKIordsbpq+2F11kzsMnF/vckYp7vXr46EXDfAVX77nNZ2GpD7DJIuQmRlU8XxsScDxhGomQVB+pafxuXctvTMiqAWbcxBaWSVs1r5ZvQuBac+8m5+OaIggR8jvPhB+0mKjHoRGDZn/gvc7i/BmujC7hP7QKHXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=uVLakavx; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=7SvJ6a8d; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="uVLakavx";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="7SvJ6a8d"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i8HZRhvQnYXxWvoFsDDlVx2lpylcfTxeUNOZlofeZaE=;
	b=uVLakavxIz6oFdCaW1lrUSNRmBcoYgUyGANvJF3J6ZZ7c7ERLGDduFVwpED20YXvYV9lU2
	5/UBIqt9yrc9eB1lCUk76RoYlVSu1ipn2hggAQ20O48geCQ+8iMzgc89jevaNBcv8gXAFy
	6idWEM5V0SNGd1sBfEvmAgvq7frubIie3FId76m56BfEfdcH6i2LDxAxB5Nhywy3oNHI7z
	/Pg349mrLNKSj2xBFwHIKhaqVGTSHHcQrSRtq+hjTrF+0ZJuWKYUChQ7vlIvWAMEjj/6bu
	D5sPH/NhxezBnxZmdIFwMW4AdHJ8O+leNDQt0LTIZqQ5Q15AP5II8C+yFnXc5g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i8HZRhvQnYXxWvoFsDDlVx2lpylcfTxeUNOZlofeZaE=;
	b=7SvJ6a8dcdlp+2AVRtxVNVbq2dvta0BiUSV6fCnqYdvQMzvzXg91yPjpZ7Cb2GJ83uT3TR
	+oTBM/3JObLgbsDQ==
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
Subject: [PATCH v7 070/120] thermal: intel: hfi: Use parsed CPUID(0x6)
Date: Thu, 28 May 2026 17:38:32 +0200
Message-ID: <20260528153923.403473-71-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use parsed CPUID(0x6) instead of direct CPUID queries and custom data
types.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 drivers/thermal/intel/intel_hfi.c | 62 ++++++++++---------------------
 1 file changed, 20 insertions(+), 42 deletions(-)

diff --git a/drivers/thermal/intel/intel_hfi.c b/drivers/thermal/intel/intel_hfi.c
index 3273b8fe3d4d..4f0cb157b5d8 100644
--- a/drivers/thermal/intel/intel_hfi.c
+++ b/drivers/thermal/intel/intel_hfi.c
@@ -53,29 +53,6 @@
 #define HW_FEEDBACK_PTR_VALID_BIT		BIT(0)
 #define HW_FEEDBACK_CONFIG_HFI_ENABLE_BIT	BIT(0)
 
-/* CPUID detection and enumeration definitions for HFI */
-
-#define CPUID_HFI_LEAF 6
-
-union hfi_capabilities {
-	struct {
-		u8	performance:1;
-		u8	energy_efficiency:1;
-		u8	__reserved:6;
-	} split;
-	u8 bits;
-};
-
-union cpuid6_edx {
-	struct {
-		union hfi_capabilities	capabilities;
-		u32			table_pages:4;
-		u32			__reserved:4;
-		s32			index:16;
-	} split;
-	u32 full;
-};
-
 /**
  * struct hfi_cpu_data - HFI capabilities per CPU
  * @perf_cap:		Performance capability
@@ -326,16 +303,20 @@ void intel_hfi_process_event(__u64 pkg_therm_status_msr_val)
 			   msecs_to_jiffies(HFI_UPDATE_DELAY_MS));
 }
 
-static void init_hfi_cpu_index(struct hfi_cpu_info *info)
+static bool init_hfi_cpu_index(struct hfi_cpu_info *info, int cpu)
 {
-	union cpuid6_edx edx;
+	const struct leaf_0x6_0 *l6 = cpuid_leaf(&cpu_data(cpu), 0x6);
 
 	/* Do not re-read @cpu's index if it has already been initialized. */
 	if (info->index > -1)
-		return;
+		return true;
+
+	/* Cannot do anything if CPUID(0x6) is missing */
+	if (!l6)
+		return false;
 
-	edx.full = cpuid_edx(CPUID_HFI_LEAF);
-	info->index = edx.split.index;
+	info->index = l6->this_lcpu_hwfdbk_idx;
+	return true;
 }
 
 /*
@@ -436,7 +417,8 @@ void intel_hfi_online(unsigned int cpu)
 		info->hfi_instance = hfi_instance;
 	}
 
-	init_hfi_cpu_index(info);
+	if (!init_hfi_cpu_index(info, cpu))
+		return;
 
 	/*
 	 * Now check if the HFI instance of the package of @cpu has been
@@ -535,19 +517,13 @@ void intel_hfi_offline(unsigned int cpu)
 
 static __init int hfi_parse_features(void)
 {
-	unsigned int nr_capabilities;
-	union cpuid6_edx edx;
+	const struct leaf_0x6_0 *l6 = cpuid_leaf(&boot_cpu_data, 0x6);
+	unsigned int nr_capabilities = 0;
 
-	if (!boot_cpu_has(X86_FEATURE_HFI))
+	if (!boot_cpu_has(X86_FEATURE_HFI) || !l6)
 		return -ENODEV;
 
-	/*
-	 * If we are here we know that CPUID_HFI_LEAF exists. Parse the
-	 * supported capabilities and the size of the HFI table.
-	 */
-	edx.full = cpuid_edx(CPUID_HFI_LEAF);
-
-	if (!edx.split.capabilities.split.performance) {
+	if (!l6->perfcap_reporting) {
 		pr_debug("Performance reporting not supported! Not using HFI\n");
 		return -ENODEV;
 	}
@@ -556,11 +532,13 @@ static __init int hfi_parse_features(void)
 	 * The number of supported capabilities determines the number of
 	 * columns in the HFI table. Exclude the reserved bits.
 	 */
-	edx.split.capabilities.split.__reserved = 0;
-	nr_capabilities = hweight8(edx.split.capabilities.bits);
+	if (l6->perfcap_reporting)
+		nr_capabilities++;
+	if (l6->encap_reporting)
+		nr_capabilities++;
 
 	/* The number of 4KB pages required by the table */
-	hfi_features.nr_table_pages = edx.split.table_pages + 1;
+	hfi_features.nr_table_pages = l6->feedback_sz + 1;
 
 	/*
 	 * The header contains change indications for each supported feature.
-- 
2.54.0

