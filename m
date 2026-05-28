Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DDC478851
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983085; cv=none; b=GmcDy2YG5+F37iMZwXc4vXEefhEbEwF5caoUiKoR2lSYV9A9wiSqys4c/8zQfwJeVmLozsIE7iV27TIbeLzUamHfFBiqn7cVtZYzod2cqhhNjkFh5Tyi4fG+oOGmzoQAbRtkdksgBCjPqr1Eo3cc8UZcPxTHRZbzSQH6xL+R4Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983085; c=relaxed/simple;
	bh=NnO7/noqKNFe+3JsdizDXVc5KUWBSnOHU7OfJH/J9Ng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HLFZZU6yhcnLygIkpA2YEaKpIeLthFSEVND3R3saxkBjFVaQdj7j83FayvLINWX8a45ISZrLoNDpGgqKl1Nn+ZIFIa5NzpXTCZgLKEDO6HMiEO4JT2FDlTRI7zV5zH1w0hwgZLGpOwYUeRKGToqtECY3Nx0xo9g65+bsR/myNQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zOpQFxOk; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=c2wQATmv; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zOpQFxOk";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="c2wQATmv"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oweeJd31OFo+A+nUfcK3yCZwyXozLa5TrlFjLLvORW4=;
	b=zOpQFxOkqPdhe9Rv5bUL/jtRaYrRGqL+/NmC1URu4Qy+LbPH2UzWgkMEai8aY+pzwbcQGF
	Q5amHCXxi3XNm7VtYBMgNapJMQqsbubIy5rN4Uoavos4aJ/L2q6x04QKSQLjGPo1hMQtWu
	oDv1kj7cL6Mf+KiAY0QOeYa737WmyvvLcTYkdWA1vj8EPeoIdlWDbu7o5XCRT/JGBZCXRw
	RYk+SttVy38lnY35WQyW+Ler9elswLQndgDFHK8fcs8yK7uzKR6H1+dFtcGlz3VIL226wn
	MQcM75msiPnYc65MJMgn1BpXQEow7nHUWxne1yzpDU2b8ChQ5rim5Ky/vtu4qA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oweeJd31OFo+A+nUfcK3yCZwyXozLa5TrlFjLLvORW4=;
	b=c2wQATmvusWD/N6PP5zpP8c0m+r5F2yn+2CWqD48eVz2il4rppm+3FGWR+JG6FLcoK+d9g
	/1FNmTwkKekzmYDQ==
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
Subject: [PATCH v7 088/120] KVM: x86: Use standard CPUID(0xa) types
Date: Thu, 28 May 2026 17:38:50 +0200
Message-ID: <20260528153923.403473-89-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For KVM guest CPUID build-up, use the auto-generated CPUID(0xa) types from
x86-cpuid-db instead of relying on the custom perf types.

The latter types are in process of getting removed from the kernel.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kvm/cpuid.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
index e69156b54cff..706903ad6628 100644
--- a/arch/x86/kvm/cpuid.c
+++ b/arch/x86/kvm/cpuid.c
@@ -1504,28 +1504,28 @@ static inline int __do_cpuid_func(struct kvm_cpuid_array *array, u32 function)
 		}
 		break;
 	case 0xa: { /* Architectural Performance Monitoring */
-		union cpuid10_eax eax = { };
-		union cpuid10_edx edx = { };
+		struct leaf_0xa_0 l = { };
+		struct cpuid_regs *regs = (struct cpuid_regs *)&l;
 
 		if (!enable_pmu || !static_cpu_has(X86_FEATURE_ARCH_PERFMON)) {
 			entry->eax = entry->ebx = entry->ecx = entry->edx = 0;
 			break;
 		}
 
-		eax.split.version_id = kvm_pmu_cap.version;
-		eax.split.num_counters = kvm_pmu_cap.num_counters_gp;
-		eax.split.bit_width = kvm_pmu_cap.bit_width_gp;
-		eax.split.mask_length = kvm_pmu_cap.events_mask_len;
-		edx.split.num_counters_fixed = kvm_pmu_cap.num_counters_fixed;
-		edx.split.bit_width_fixed = kvm_pmu_cap.bit_width_fixed;
+		l.pmu_version		= kvm_pmu_cap.version;
+		l.num_counters_gp	= kvm_pmu_cap.num_counters_gp;
+		l.bit_width_gp		= kvm_pmu_cap.bit_width_gp;
+		l.events_mask_len	= kvm_pmu_cap.events_mask_len;
+		l.num_counters_fixed	= kvm_pmu_cap.num_counters_fixed;
+		l.bitwidth_fixed	= kvm_pmu_cap.bit_width_fixed;
 
 		if (kvm_pmu_cap.version)
-			edx.split.anythread_deprecated = 1;
+			l.anythread_deprecation = 1;
 
-		entry->eax = eax.full;
+		entry->eax = regs->eax;
 		entry->ebx = kvm_pmu_cap.events_mask;
 		entry->ecx = 0;
-		entry->edx = edx.full;
+		entry->edx = regs->edx;
 		break;
 	}
 	case 0x1f:
-- 
2.54.0

