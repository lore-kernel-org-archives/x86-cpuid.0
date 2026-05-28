Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A92B3F888C
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983053; cv=none; b=LIoYYj/wYIBUPJaFqCgfSy8zt1GZW9XCgrt0qabUDyxCU/BXgE+10sh8f9piphHbEjEsJIJ1dOYBCvr2eh2Q6nqCJKPdLwrK2L+eva1WI9A6Jb2stZS8jQrvRrCIqC6+CRo6SW4ILIh3wXGcMdPOO+RZD4dI/AVgCEieIofIrys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983053; c=relaxed/simple;
	bh=LKJOtwG6C8o/leu7Xb5nC4aEkev2kczK7C8K0xwWmj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dynw2E7NF55xGO/YTlw+cK5OSsY2vLsCfCb0nNON3mxWOzGf7usy07qtlfZ8cPV5BXfdnSrGBVehp9uu+6Xi09QS2xcqnp9hpOs1BFAeYtWtoPW6nl2Qm9Sb2zdO/Z8olJ98FtQD6I9ryRggVq+PucXbfHxG8GPflyxaaRQO9wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ETRDO9VM; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tu/5Otrh; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ETRDO9VM";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tu/5Otrh"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EN6slcgnZ1ln8G4qeRj2q9GWg4ufK7GATbksP0bKUfo=;
	b=ETRDO9VMTkWwdQLugJPW2ryH4H7L5Dz1pEPyaCXPZ5K/6nyuBZ8E8fo0Y7nBDeRo5puuZa
	IkAhmupidhwkLosHIJWdSTVmyEGVR83qI26wVQPVAtUEuexlGrvgJUDJ3bM18shpeytm2e
	lKB2qrVEQa93W5/b956WiS5l2mmifKNIOEea90zE01Y+g194CvGG6hHBoRL9rw8hxNeaRR
	kfrZ6JafNsYk7yG/XEk2kJXrODX9e4m8WUZUGV2E8vlRXFvqAT1lS7bEN69KWOPsRWHYi8
	b3uW9TiKHalQq8qKsNef6++mrcfWhbx71nlx8FMZ+ViQiQO3iYjEGRfBrgZDLw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EN6slcgnZ1ln8G4qeRj2q9GWg4ufK7GATbksP0bKUfo=;
	b=tu/5Otrho9eT+c88AbBUm4AE2B95uHfktNuH/wUEv9pUgvy3YbhaRuDensjwjNy8qc0/y9
	8q8DybJzzxCSXvBA==
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
Subject: [PATCH v7 079/120] KVM: VMX: Use standard CPUID(0x12) types
Date: Thu, 28 May 2026 17:38:41 +0200
Message-ID: <20260528153923.403473-80-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For VMX processor compatibility checks, use standard CPUID(0x12) data
types from x86-cpuid-db instead of doing manual bitwise operations.

Do not use parsed CPUID access since mutating X86_FEATURE_SGX1 state
will affect its cached hardware-backed CPUID bit in the future.

Update cpu_has_sgx()'s comment to match current x86 kernel state.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kvm/vmx/vmx.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index ede773ce065a..20d5397436bf 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -2642,14 +2642,21 @@ void vmx_cache_reg(struct kvm_vcpu *vcpu, enum kvm_reg reg)
 }
 
 /*
- * There is no X86_FEATURE for SGX yet, but anyway we need to query CPUID
- * directly instead of going through cpu_has(), to ensure KVM is trapping
- * ENCLS whenever it's supported in hardware.  It does not matter whether
- * the host OS supports or has enabled SGX.
+ * Do a direct CPUID query instead of checking X86_FEATURE_SGX1 or parsed
+ * CPUID access. KVM needs to trap ENCLS whenever SGX is supported in
+ * hardware, regardless of whether the host OS supports or has enabled SGX.
  */
 static bool cpu_has_sgx(void)
 {
-	return cpuid_eax(0) >= 0x12 && (cpuid_eax(0x12) & BIT(0));
+	struct leaf_0x12_0 l12;
+	struct leaf_0x0_0 l0;
+
+	cpuid_read(0, &l0);
+	if (l0.max_std_leaf < 0x12)
+		return false;
+
+	cpuid_read(0x12, &l12);
+	return l12.sgx1;
 }
 
 static int adjust_vmx_controls(u32 ctl_min, u32 ctl_opt, u32 msr, u32 *result)
-- 
2.54.0

