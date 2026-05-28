Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A808245BD6F
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983045; cv=none; b=RsZ1Q5hOQdTFVYqtaz+EbtZSaCwh82ldDYJ8jULkc8m6i1SyrQOL33EY/jWS5AhN6GIYwXV0Yc9Jrkug0U5L7Oap0BZNP2yGUmaLBSCy/WCOeq3BYc/tycYlFvkycHaFPtgWuPxX6HBLQdBhevh5R5eVUTHLHTed9a8Gwo6UHfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983045; c=relaxed/simple;
	bh=ruz7+nd3k7vLPBLCqHGmdk0F9FtgvWgcb2HIiBa47+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ek1G7IMC7jbhz0jiP/Oi0QVtX6HifHdPSHwvk4k/Wh73fwsRr8+lxOAgHEcLnDI7Q/f4i2IGJG9/a/vC3X4IzHJr7e32bBWDUq34bc6zBld3/4q65Rx5tnrw5Db2CR72kkeVIIM+QQayeTmGNmRNwDgJQM5tKMYDkPrDcKIU4J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sg0dp2r1; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=/VxUAi1h; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sg0dp2r1";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="/VxUAi1h"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+UoFtz68Y7oDHlqIDp2/1Ccnc/PAMoFWCAbKpUAVw2o=;
	b=sg0dp2r1MjWiWYt9MYauTBeAi/k4wn4tlT7VUx25a2Iw8jWGisNQ5qKVHf/E5F2mVj9k3x
	EhKVTwWYBPsWy9i0atXLKPn0hcUJtRmdLeje6P9RpY4uRwguXCtykaTIdvOC++eZtdJ/Re
	v8BGga4HF5A18oDz0vLnfudjEbHnUoXRxOMfcW3R0fAAb76epRFyL76noWn7xE24BYVb6e
	BVptIwjpmEaIEPT2Teat74g1YNzank4T5KeQCIlC88r7Ypq6/7we3f09p0E45+lX0MOPzr
	FJPrB29NlHHzXqu3DY+PA1NvNPoqpHwcKItltY2OLQtcEwGeiccrYZ/Z279M6w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+UoFtz68Y7oDHlqIDp2/1Ccnc/PAMoFWCAbKpUAVw2o=;
	b=/VxUAi1hpS9/IEYWTD0Rje47cQV6ZDtaearvRJB0cFSeS3bD+3HWXd7eZnxl9aG/0xINH0
	kXETDTisvS4EE6Cg==
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
Subject: [PATCH v7 076/120] x86/sgx/driver: Use parsed CPUID(0x12)
Date: Thu, 28 May 2026 17:38:38 +0200
Message-ID: <20260528153923.403473-77-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use parsed CPUID(0x12).0 and CPUID(0x12).1 instead of doing bitwise
operations and direct CPUID queries.

Since SGX feature availablility mandates the existence of both
CPUID(0x12).0 and CPUID(0x12).1, exit the driver early in case any one of
them is not available.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/sgx/driver.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kernel/cpu/sgx/driver.c b/arch/x86/kernel/cpu/sgx/driver.c
index 9268289cd9f9..c5bc3f85ad97 100644
--- a/arch/x86/kernel/cpu/sgx/driver.c
+++ b/arch/x86/kernel/cpu/sgx/driver.c
@@ -165,32 +165,33 @@ static struct miscdevice sgx_dev_enclave = {
 
 int __init sgx_drv_init(void)
 {
-	unsigned int eax, ebx, ecx, edx;
+	const struct leaf_0x12_0 *l0 = cpuid_leaf(&boot_cpu_data, 0x12);
+	const struct cpuid_regs *l0r = cpuid_leaf_raw(&boot_cpu_data, 0x12);
+	const struct cpuid_regs *l1r = cpuid_subleaf_raw(&boot_cpu_data, 0x12, 1);
 	u64 attr_mask;
 	u64 xfrm_mask;
 	int ret;
 
+	if (!l0 || !l0r || !l1r)
+		return -ENODEV;
+
 	if (!cpu_feature_enabled(X86_FEATURE_SGX_LC)) {
 		pr_info("SGX disabled: SGX launch control CPU feature is not available, /dev/sgx_enclave disabled.\n");
 		return -ENODEV;
 	}
 
-	cpuid_count(SGX_CPUID, 0, &eax, &ebx, &ecx, &edx);
-
-	if (!(eax & 1))  {
+	if (!l0->sgx1) {
 		pr_info("SGX disabled: SGX1 instruction support not available, /dev/sgx_enclave disabled.\n");
 		return -ENODEV;
 	}
 
-	sgx_misc_reserved_mask = ~ebx | SGX_MISC_RESERVED_MASK;
-
-	cpuid_count(SGX_CPUID, 1, &eax, &ebx, &ecx, &edx);
+	sgx_misc_reserved_mask = ~l0r->ebx | SGX_MISC_RESERVED_MASK;
 
-	attr_mask = (((u64)ebx) << 32) + (u64)eax;
+	attr_mask = (((u64)l1r->ebx) << 32) + (u64)l1r->eax;
 	sgx_attributes_reserved_mask = ~attr_mask | SGX_ATTR_RESERVED_MASK;
 
 	if (cpu_feature_enabled(X86_FEATURE_OSXSAVE)) {
-		xfrm_mask = (((u64)edx) << 32) + (u64)ecx;
+		xfrm_mask = (((u64)l1r->edx) << 32) + (u64)l1r->ecx;
 		sgx_xfrm_reserved_mask = ~xfrm_mask;
 	}
 
-- 
2.54.0

