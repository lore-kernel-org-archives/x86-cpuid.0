Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C685E3F929C
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983179; cv=none; b=MV5YuBPisVOxr3GF0K8ks46/8qvEgFepXhrQ4DSpuY4DoQV+WKjh24YbGoC1eawgjvIQ2H99GnAh1XBn0J159cxB/fFF9ype6I9p0JRJSL09oBPipj69PfCd2FNdPf80RLL+/79Vh3g6JSUA8pNGs3fl1A6GnQr2dkQSgwtDSVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983179; c=relaxed/simple;
	bh=iBRRLiUxWodNmlPKVM5/jYN886wgy2LwpLWXU0ifRSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NGgjO9Q52Amk17N0xeD3k46+iB3YXhyq37gw8yj4nPDj3/ysgYOxUIEMk2/gxoAT7Ow4EDPi25V63mMLFhNP2Mf+QB8WFxNPD5WEZ5kmrp3gky1qoh0rEgJ9FPNYm2VtTtPe6ELyc5Z01qdUXMdpqFLZo2AKH4GTh5tdQ7RZKNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vGmZyLJj; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xT2z9PGG; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vGmZyLJj";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xT2z9PGG"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JFmlmvv63iXFQkrPpyanL5QtPWMBp2U8gW/uj5jrdfU=;
	b=vGmZyLJjV1unDtDjk3ZoVZ0621jxGpIxwLwMnuqSRb7qweDPjxqv9zfayl+1n+bxD8AmlC
	qmURXeVJK/DUKlf0DdD5B2YQmis2qxIxVYoB6RvWJGcEEZXXPPy1922AnsoKJrMnzqf/Pd
	0ymcpw5cjObliOZAE4/NfTYPZqgzTmNzMGFQVWqK8XYpEqscGoxAr0vZwO44Ne520q2gDo
	hfUY1r3lZA/6CVF1rNNf2KtlJACIlwchaAsZNklrRgpLXG7T/AU19CY0CMQ334OQlwl+bU
	2qaz5Rgb6vLCow7k3aW9+VRsas4IlfGR8glu/Eu/mh7OY9AJgU2pifXNCwNObA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JFmlmvv63iXFQkrPpyanL5QtPWMBp2U8gW/uj5jrdfU=;
	b=xT2z9PGGBz0zNM3bSRDRwNp1eOdxelws7dcvGeDiRFwEIIiwNFL5/99YZLxNhUlsU3Z09n
	QVeSaRutU6lzMFAw==
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
Subject: [PATCH v7 118/120] KVM: x86: Remove BUILD_BUG_ON() x86_capability[] check
Date: Thu, 28 May 2026 17:39:20 +0200
Message-ID: <20260528153923.403473-119-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

KVM's direct access to cpuinfo_x86::x86_capability[] has been replaced with
the cpuid_word_*() APIs.  The former is getting removed from the kernel.

Adjust the kvm_cpu_caps[] alignment comment accordingly.

Remove BUILD_BUG_ON() related to x86_capability[] as it does not matte
anymore.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kvm/cpuid.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
index 018cd3078306..5ed45353802b 100644
--- a/arch/x86/kvm/cpuid.c
+++ b/arch/x86/kvm/cpuid.c
@@ -30,8 +30,8 @@
 #include "xen.h"
 
 /*
- * Unlike "struct cpuinfo_x86.x86_capability", kvm_cpu_caps doesn't need to be
- * aligned to sizeof(unsigned long) because it's not accessed via bitops.
+ * No unsigned long alignment is needed.  The CPUID tables X86_FEATURE
+ * words are accessed by bitops, but this table is not.
  */
 u32 kvm_cpu_caps[NR_KVM_CPU_CAPS] __read_mostly;
 EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_cpu_caps);
@@ -838,9 +838,6 @@ void kvm_initialize_cpu_caps(void)
 	WARN_ON_ONCE(kvm_is_configuring_cpu_caps);
 	kvm_is_configuring_cpu_caps = true;
 
-	BUILD_BUG_ON(sizeof(kvm_cpu_caps) - (NKVMCAPINTS * sizeof(*kvm_cpu_caps)) >
-		     sizeof(boot_cpu_data.x86_capability));
-
 	kvm_cpu_cap_init(CPUID_1_ECX,
 		F(XMM3),
 		F(PCLMULQDQ),
-- 
2.54.0

