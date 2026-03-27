Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDD9372EDF
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774578058; cv=none; b=Xe+2gid6gMKke5+yA1MwpNmDCdUqTPhkNu+H22BE63NL8gV9+4BLtjOsCK4A/m/Y0GzoM7Ylb8xTRDMjckexB4AnUMmso3oikOoWDs4ljHm6NPEclqyv8hrGrvPQq52Pgbkv4W3PxxrMWu/ODxw3I1lrlQRq4BcWL5dyk3sq3G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774578058; c=relaxed/simple;
	bh=PsTllU6sNA+kea6As9e7l++xqbcFkRXHRpyiRFTUg+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fBKqpn+muvzt+K5vo5kPneFSWzsMBudCBXFMzpUIa30sXsbpzZ0wlyCR7NKr0YClBWl5IUv3ta+8EtAGLPxguLkLQvs/pUJod9ICFc7TY8JFBIveR7ZO/nXEqIqRQR8SbZpeO/sSmVf7VdX0lwIy0agTBBVUGDsHgbaGu6ouJeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wBP8Eb9e; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Yy+Tlxvt; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wBP8Eb9e";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Yy+Tlxvt"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774578055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kO+BQ4fERUyR/doqb1nb45u/9n2WJ1LYDd/Hl6t97Hk=;
	b=wBP8Eb9ecI+9s/BizsyIP4HiSolbZMxVm0DoOWiwaXhWmOanzedBXihOAUZ3m+vV2Vh47I
	ulOv/gzoVyGqVpQ1hqnUiLCMjo+JuMANptvvYjdbWf1g4QjXUTCdNMqbVPzNMq2tOUgTIr
	UF1FbFXb1JGX4kpXdYCqn2tgrLLEY/+56wAhyTpqYBQZKrP7as5J7zRrtqCYclh/zSTdtX
	fUpp+LreZVwtC4eeClbGTDzBKkw+lTuBuHu8wpfFjHU26ZgaR58rKLvOpnqCejGCHJ3BiT
	S4+jo3F/kPSvYb7qRxJQE7hBPGA65jWB7gZGPFF4ZkWf66D8cGM1Co/tIndrwg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774578055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kO+BQ4fERUyR/doqb1nb45u/9n2WJ1LYDd/Hl6t97Hk=;
	b=Yy+TlxvtvVbku4q4FrQjwnMkMG0ya20jprYizkoE/HEpA+Vlf017WZosiRZPg1FhFGsFCw
	p9S15RHd+zBU9OCg==
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
Subject: [PATCH v6 58/90] KVM: x86: Use standard CPUID(0xa) types
Date: Fri, 27 Mar 2026 03:16:12 +0100
Message-ID: <20260327021645.555257-59-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
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
index 8137927e7387..16ed4c001c79 100644
--- a/arch/x86/kvm/cpuid.c
+++ b/arch/x86/kvm/cpuid.c
@@ -1503,28 +1503,28 @@ static inline int __do_cpuid_func(struct kvm_cpuid_array *array, u32 function)
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
2.53.0

