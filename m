Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F113B2FFE
	for <x86-cpuid@lists.linux.dev>; Fri, 20 Mar 2026 12:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774010433; cv=none; b=KfI/KQ5kUlnB5vKUTivemx4Pp41gKSqnWXAZJcsmHbOvmZTNcPvvvFWg/k/okftz7wB5tffW0LnUtfMBV2t4jQVfVAgZSlM5zgzMmPqGteymAL0ZQXzByVhjCV1i+fwTO0t6jaDcl6FvbS2RZaEkid6Zy08USPXbnozwm5RfAi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774010433; c=relaxed/simple;
	bh=ZTGEIsVM3/8r1G8RoNn1FFNiDNsYhKxHk5r7z0K69T4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fjvTe18oAzIFXuSH4P6iQw9HuDwuRwRlAEGX35mujGU9FrWHUhlA0Vh3abPsTuo8TmSJQ4W/5MD4pRk5xiubKYoD0NgnHKZVaY/ySEAGvNUNOn20hfoA6HlgEAfqEG39TwlaMA/617ecyi8Bn41C/z72dLRWIKnPB6cjBJJQh90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=QlB9yfWg; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="QlB9yfWg"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 7AF7540E024F;
	Fri, 20 Mar 2026 12:40:22 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id a9ILveiLVzmY; Fri, 20 Mar 2026 12:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1774010417; bh=e9BcErOyq0fJ6YF6iDjKE/Yd8dCYuME6JbqZGMe8AJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QlB9yfWgCShTnAmMPAQVD6njD68r72+HUks3GzgYP3cy+/kvwxBHExtFhE6uxUmvt
	 1VC0aABu3NI+6VchrBKpgYYCMQ2g6Z/Xm+OQ7dxVOyr/Sd9NlI5rVmZRPCXZP/FiRI
	 hFKAwxX6rcc86H8lXWrf70jdSDhuX/JMrO/dHherGmJydXgDWYIImtBFD2P+yZfWAm
	 FVlMEYgzldSaYgUpM3KSeRXa572yhfoLYcBKz3y/ukyg8LzYmjClHEsqAi1fdK+3TF
	 DLHUiH7NDVZhKKna3umqV7qee3lBdIjtaQa4R2fXkQi2DloN/myuZFF7OsBEDWpMyd
	 sIzHIAjGsOc85256HP68hb6FPQY77DdRNqAaTIqTtT3rdJ/4tSzc0Vcl5j8FdCEwZi
	 30JcuVg4VzQ3Jg4ApbM88Qai0mLDxduCfIoY7nh0LQ5YVZztKY89FMa+o83gY4C2NF
	 z7iP/AGFqEPmp/2Dcu/FnQ5D5JDbrmjlV8N+/2eSsaxSgsfxUrCX0A0LiYi9vXh5hl
	 R3aBvoaCzt4SwLhEvuYjJDFC/dftl7GvmqVKh+dS0+9BPizICZ4sBI194HOdsY9RoK
	 3IsMdTK40qLVlicC7SIkVy4hv2ghhkgARrFwN8ksOcMg630OexCZila13AP6+8Ifav
	 JiU1gDYY4kJFteA+lDoDxfvg=
Received: from zn.tnic (p5de8e020.dip0.t-ipconnect.de [93.232.224.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 42A4440E01A9;
	Fri, 20 Mar 2026 12:40:01 +0000 (UTC)
Date: Fri, 20 Mar 2026 13:39:54 +0100
From: Borislav Petkov <bp@alien8.de>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Sean Christopherson <seanjc@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v5 01/35] ASoC: Intel: avs: Include CPUID header at file
 scope
Message-ID: <20260320123954.GXab1AGpBUv2Arxenv@fat_crate.local>
References: <20250905121515.192792-1-darwi@linutronix.de>
 <20250905121515.192792-2-darwi@linutronix.de>
 <20251016105514.GCaPDPEu016XyDocfY@fat_crate.local>
 <aPFFtvFwgkPCdw-_@lx-t490>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aPFFtvFwgkPCdw-_@lx-t490>

On Thu, Oct 16, 2025 at 09:21:26PM +0200, Ahmed S. Darwish wrote:
> On Thu, 16 Oct 2025, Borislav Petkov wrote:
> >
> > Why are we even bothering with !CONFIG_X86?
> >
> > Because this thing has || COMPILE_TEST in Kconfig.
> >
> > But this thing gets enough compile testing on x86 already so why not
> > simply drop the whole unnecessary gunk?
> >
> 
> Makes sense; will do.

I'll queue the below soon, if no one complains:

---

From 65453ddafe5d7cf715266f7d32356c42965f2f86 Mon Sep 17 00:00:00 2001
From: "Ahmed S. Darwish" <darwi@linutronix.de>
Date: Fri, 5 Sep 2025 14:14:41 +0200
Subject: [PATCH] ASoC: Intel: avs: Include CPUID header at file scope

Commit

    cbe37a4d2b3c ("ASoC: Intel: avs: Configure basefw on TGL-based platforms")

includes the main CPUID header from within a C function.  This works by
sheer luck and forbids further refactoring inside the CPUID header.

Include the CPUID header at file scope instead.

Note, for the CPUID(0x15) leaf number, use CPUID_LEAF_TSC instead of
defining a custom local macro for it.

  [ bp: Massage, zap the CONFIG_X86 ifdeffery and dependency on
    COMPILE_TEST because this driver gets enough compile testing on x86
    alone already. ]

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Link: https://patch.msgid.link/20250905121515.192792-2-darwi@linutronix.de
---
 sound/soc/intel/Kconfig   |  2 +-
 sound/soc/intel/avs/tgl.c | 18 ++++++------------
 2 files changed, 7 insertions(+), 13 deletions(-)

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
index afb066516101..ba4831f4de5a 100644
--- a/sound/soc/intel/avs/tgl.c
+++ b/sound/soc/intel/avs/tgl.c
@@ -7,12 +7,12 @@
 //
 
 #include <linux/pci.h>
+#include <asm/cpuid/api.h>
+
 #include "avs.h"
 #include "debug.h"
 #include "messages.h"
 
-#define CPUID_TSC_LEAF 0x15
-
 static int avs_tgl_dsp_core_power(struct avs_dev *adev, u32 core_mask, bool power)
 {
 	core_mask &= AVS_MAIN_CORE_MASK;
@@ -42,20 +42,14 @@ static int avs_tgl_dsp_core_stall(struct avs_dev *adev, u32 core_mask, bool stal
 
 static int avs_tgl_config_basefw(struct avs_dev *adev)
 {
+	unsigned int freq = cpuid_ecx(CPUID_LEAF_TSC);
 	struct pci_dev *pci = adev->base.pci;
 	struct avs_bus_hwid hwid;
 	int ret;
-#ifdef CONFIG_X86
-	unsigned int ecx;
 
-#include <asm/cpuid/api.h>
-	ecx = cpuid_ecx(CPUID_TSC_LEAF);
-	if (ecx) {
-		ret = avs_ipc_set_fw_config(adev, 1, AVS_FW_CFG_XTAL_FREQ_HZ, sizeof(ecx), &ecx);
-		if (ret)
-			return AVS_IPC_RET(ret);
-	}
-#endif
+	ret = avs_ipc_set_fw_config(adev, 1, AVS_FW_CFG_XTAL_FREQ_HZ, sizeof(freq), &freq);
+	if (ret)
+		return AVS_IPC_RET(ret);
 
 	hwid.device = pci->device;
 	hwid.subsystem = pci->subsystem_vendor | (pci->subsystem_device << 16);
-- 
2.51.0

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
