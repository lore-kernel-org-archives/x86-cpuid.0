Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8901C3314C5
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774577848; cv=none; b=jrg1RxdBXvuNU0ZfQ+42tgUbG8suxhcap/eGQ5SMK2aD4oXAg/zuGEZ8bEg+z9mFj4taZpJcnFg6isshJV4l8z+lkxHDBAO0n/PLdRXRhHHTc+1kqLZ/Q/cGT7vO+A7KRLJxZpt29oRGnbxmtju3BwgX/YGxTzApoYtJOgGuoSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774577848; c=relaxed/simple;
	bh=f+/iJHeyDwYH3sBCvhNNFtLCIBZtC3JZoaVR7r/mweU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eqvuqlKfOppEDB66fA0JkaXMnHNVreeVek7/N6i+JSeE5N4hRK6X5XUSERhj2l1+i8498m4+sBf/hOrr039DCF+bWFWzykUSpDUKjgslaDnoBSU8MVIcwCSIMl+kCPWa3+GimxbOzE2EGj5PTNfllJ1qXqzkJ+wfOJcRVGteXPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=B2hs0m9t; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ush0OZai; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="B2hs0m9t";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ush0OZai"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774577846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mrl8XmJ7o7sgBcCDvX+j3CF0YEVIJIsLch2G1f2gE5o=;
	b=B2hs0m9tJM54bUwBQMd4fwHZemVx3mtfZnvwNQncjg/D/Emg55G+RFLzHuAwOSIj8YBJn4
	6GF0q9qQ1MgkUaBfILtUgNP8gzow2IJrWHXMKCz0f1InTZ17h0ioKoxTxu5HwSaA239Vue
	4Jp8Bx/UYYCRHPhwDiSNoGgMHD7XwiMzsODQMslgEiK9VHXHvX1GbxtkCK/mKsUa57YKnj
	X7D9Ytt9ASGHj8DSjKH88KHcN85A5yQsLdsJ5Po88II3YpU/KtBcyib9X2TwvyrCaYVa5W
	Mh+ABE97/DmAhlbx0dcKDIkN4MbW4edHBJ32JT0M9+QjAEk86MShO2caMkLuow==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774577846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mrl8XmJ7o7sgBcCDvX+j3CF0YEVIJIsLch2G1f2gE5o=;
	b=ush0OZaiZ+DjWux+fuUy4iQpQPI5NCWi3f0UPck7dLzy8MwHGqEPSfbLKe8Tv6XVGW0wqS
	cw2R99Vb41SN9TDQ==
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
Subject: [PATCH v6 02/90] ASoC: Intel: avs: Include CPUID header at file scope
Date: Fri, 27 Mar 2026 03:15:16 +0100
Message-ID: <20260327021645.555257-3-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit

    cbe37a4d2b3c ("ASoC: Intel: avs: Configure basefw on TGL-based platforms")

includes the main CPUID header from within a C function.  This works by
luck and forbids valid refactorings inside that header.

Include the CPUID header at file scope instead.

Remove the COMPILE_TEST build flag so that the CONFIG_X86 conditionals can
be removed.  The driver gets enough compilation testing already on x86.

For clarity, refactor the CPUID(0x15) code into its own function without
changing any of the driver's logic.

Suggested-by: Borislav Petkov <bp@alien8.de>		# CONFIG_X86 removal
Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
Fixes: cbe37a4d2b3c ("ASoC: Intel: avs: Configure basefw on TGL-based platforms")
References: 47a1886a610a ("ASoC: Intel: avs: Enable AVS driver only on x86 platforms")
Link: https://lore.kernel.org/r/20251016105514.GCaPDPEu016XyDocfY@fat_crate.local
Link: https://lore.kernel.org/r/da5bf77b-5bdb-440f-92b5-db35d8687987@intel.com
---
 sound/soc/intel/Kconfig   |  2 +-
 sound/soc/intel/avs/tgl.c | 37 ++++++++++++++++++++++++-------------
 2 files changed, 25 insertions(+), 14 deletions(-)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index 412555e626b8..63367364916a 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -95,7 +95,7 @@ config SND_SOC_INTEL_KEEMBAY
 
 config SND_SOC_INTEL_AVS
 	tristate "Intel AVS driver"
-	depends on X86 || COMPILE_TEST
+	depends on X86
 	depends on PCI
 	depends on COMMON_CLK
 	select ACPI_NHLT if ACPI
diff --git a/sound/soc/intel/avs/tgl.c b/sound/soc/intel/avs/tgl.c
index 4649d749b41e..a7123639de43 100644
--- a/sound/soc/intel/avs/tgl.c
+++ b/sound/soc/intel/avs/tgl.c
@@ -7,6 +7,7 @@
 //
 
 #include <linux/pci.h>
+#include <asm/cpuid/api.h>
 #include "avs.h"
 #include "debug.h"
 #include "messages.h"
@@ -38,28 +39,38 @@ static int avs_tgl_dsp_core_stall(struct avs_dev *adev, u32 core_mask, bool stal
 	return avs_dsp_core_stall(adev, core_mask, stall);
 }
 
-static int avs_tgl_config_basefw(struct avs_dev *adev)
+/*
+ * Succeed if CPUID(0x15) is not available, or if the nominal core crystal clock
+ * frequency cannot be enumerated from it.  There is nothing to do in both cases.
+ */
+static int avs_tgl_set_xtal_freq(struct avs_dev *adev)
 {
-	struct pci_dev *pci = adev->base.pci;
-	struct avs_bus_hwid hwid;
+	unsigned int freq;
 	int ret;
-#ifdef CONFIG_X86
-	unsigned int ecx;
-
-#include <asm/cpuid/api.h>
 
 	if (boot_cpu_data.cpuid_level < CPUID_LEAF_TSC)
-		goto no_cpuid;
+		return 0;
 
-	ecx = cpuid_ecx(CPUID_LEAF_TSC);
-	if (ecx) {
-		ret = avs_ipc_set_fw_config(adev, 1, AVS_FW_CFG_XTAL_FREQ_HZ, sizeof(ecx), &ecx);
+	freq = cpuid_ecx(CPUID_LEAF_TSC);
+	if (freq) {
+		ret = avs_ipc_set_fw_config(adev, 1, AVS_FW_CFG_XTAL_FREQ_HZ, sizeof(freq), &freq);
 		if (ret)
 			return AVS_IPC_RET(ret);
 	}
-#endif
 
-no_cpuid:
+	return 0;
+}
+
+static int avs_tgl_config_basefw(struct avs_dev *adev)
+{
+	struct pci_dev *pci = adev->base.pci;
+	struct avs_bus_hwid hwid;
+	int ret;
+
+	ret = avs_tgl_set_xtal_freq(adev);
+	if (ret)
+		return ret;
+
 	hwid.device = pci->device;
 	hwid.subsystem = pci->subsystem_vendor | (pci->subsystem_device << 16);
 	hwid.revision = pci->revision;
-- 
2.53.0

