Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DB63101B6
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774577845; cv=none; b=Gz7P8ozd+MBsAXjcUPUAcR/nfkG9aitDmqy5e/XnvKmeZVSGBM944lVw41CXSNtaYcUPkjM2ZmBA6ygq4L4jXMBVokSosLkjkj1KZ7NPCWv87XxRU/MoTKQqp3uuBUrMstgfKYHYXD8VTJqQAKzU/C0FTqutLB2bM0osjix8ntY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774577845; c=relaxed/simple;
	bh=ih2nxDk2dwtWmrvO2nQ/VdnvKPJKjCoQJoK5xF1/Ecs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d9K3LLYHZ88JeGdxyEhuN/Qp9Q/735nhUC+IY2WJ615rgnNzNGymk+gbQD29FZtr4Xil4cghWG2kgvz4c0llxSZkY2k5qUeYun7UPWwQEjivTwZ8ThmJjHnOeyB3EeN1dgLRieVoy3Tdzf+644WqyN0F5LBaN2aI309DiNB9icY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bJ81nGEX; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=svrTCv9i; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bJ81nGEX";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="svrTCv9i"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774577842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vJq6K4+bcb3KelCrkP8+8wkoczV5o5s+TfbA+fjW2nQ=;
	b=bJ81nGEXfUDW8Cq5qyIThDlEgmpChdfVdupT+JP8srRdszZxO4w9/i8QhvSFbyUe6Enezl
	/m7nWjA5FisATqjEjY8IudZAi6bYXd1WpRTmclXEibDML/qGmL1sF4XRICT3hqCQyO1FJt
	YEwD4xaBcDhTeAAlwa6fb8xIfpij3KbK0yi+PVu8rzULUnuqZcSkPKaHa37/+e5waYCAZ3
	4SFBSi7FEPBQ9P7fhxWDoWMs2a0Mz/v/rgDH1SOv59XEltNwuCr/sg/zWI/REznOzot0Bu
	2XjO0uythBoGdkvjxthbXu+DiT+JqFwayzicpQNI7TsieDeVi+EuWSKZsqw9gQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774577842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vJq6K4+bcb3KelCrkP8+8wkoczV5o5s+TfbA+fjW2nQ=;
	b=svrTCv9iBPfUHjYTv/qp1SE8qsqoEUntQAVjDJg8pdgcYjPgo23ZNvzHcZ6rWDUc2OHLeE
	d7zt9dn7fCS/qGCQ==
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
Subject: [PATCH v6 01/90] ASoC: Intel: avs: Check maximum valid CPUID leaf
Date: Fri, 27 Mar 2026 03:15:15 +0100
Message-ID: <20260327021645.555257-2-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Intel AVS driver queries CPUID(0x15) before checking if the CPUID leaf
is available.  Check the maximum-valid CPU standard leaf beforehand.

Use the CPUID_LEAF_TSC macro instead of defining a custom local one for the
CPUID(0x15) leaf number.

Note, the inclusion of a header file from within a C function will be fixed
in a separate commit next.

Fixes: cbe37a4d2b3c ("ASoC: Intel: avs: Configure basefw on TGL-based platforms")
Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 sound/soc/intel/avs/tgl.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/avs/tgl.c b/sound/soc/intel/avs/tgl.c
index afb066516101..4649d749b41e 100644
--- a/sound/soc/intel/avs/tgl.c
+++ b/sound/soc/intel/avs/tgl.c
@@ -11,8 +11,6 @@
 #include "debug.h"
 #include "messages.h"
 
-#define CPUID_TSC_LEAF 0x15
-
 static int avs_tgl_dsp_core_power(struct avs_dev *adev, u32 core_mask, bool power)
 {
 	core_mask &= AVS_MAIN_CORE_MASK;
@@ -49,7 +47,11 @@ static int avs_tgl_config_basefw(struct avs_dev *adev)
 	unsigned int ecx;
 
 #include <asm/cpuid/api.h>
-	ecx = cpuid_ecx(CPUID_TSC_LEAF);
+
+	if (boot_cpu_data.cpuid_level < CPUID_LEAF_TSC)
+		goto no_cpuid;
+
+	ecx = cpuid_ecx(CPUID_LEAF_TSC);
 	if (ecx) {
 		ret = avs_ipc_set_fw_config(adev, 1, AVS_FW_CFG_XTAL_FREQ_HZ, sizeof(ecx), &ecx);
 		if (ret)
@@ -57,6 +59,7 @@ static int avs_tgl_config_basefw(struct avs_dev *adev)
 	}
 #endif
 
+no_cpuid:
 	hwid.device = pci->device;
 	hwid.subsystem = pci->subsystem_vendor | (pci->subsystem_device << 16);
 	hwid.revision = pci->revision;
-- 
2.53.0

