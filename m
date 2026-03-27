Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CAE3932DA
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774578160; cv=none; b=RsHjJPhAzux99IRksRL+zOgfxobVQi1ABfhqB9NEZo0MiMYX+zVx5qpXFpB00jp6Y7J1DjSTh+1Hvtq0EmL7NhFOWWInoj9NWAcLCZw/bmWYpkqqvD0ROW+SXottVeN1NAKJGFtVCRk0AXAeRrjtNpl0H3MxbAMZogR4zvnGHGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774578160; c=relaxed/simple;
	bh=oLu12pslI3diZk7qLpjI51uc3xRnsaHx0471coV8pQk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AEe9n/QsGaW/5rYFvFLo51WBRB/kxVIG9rjQa0cbxhYowmtqaxPhXVs7tRx1LgqnxoCnL0FMyfBuQ219emz9PBIzesp27Ad9yPQPwaZNqHb4H8aFJOHq3kNjJHE/YW/zrTeWyQoFzM8e0Sn+hkvEL7TqN29REGGv81IpVCSgFu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TSUyG/Uo; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lQoBK2Do; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TSUyG/Uo";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lQoBK2Do"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774578157;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LftgPTXKl4qmU4BeuavS76vMB5Umy9LKzMATlo8gpA4=;
	b=TSUyG/UozkOWk9nKMhDDKV97O+qgoke9Ba4SisWmpiFngW9RQ3XB7eUWr1l3BxF1Sk+KV5
	8vuE9iHgybKwfG0Dhct7dpuVxmQt/tIK2hoH6jQtFpcXyS42gz0EGPIVqqi0OfjKt4YbVY
	i933KNYGCy1oMT9hrmFb/8WGt2AFvLF7T6rNR23Ebstc+/6lLevSNjU8/OQV1LjtLm7j+P
	HGIFqOjfbGX8A+sKfZhSjhAS9UehHfNEt9wVm3FbN+GmDc/sZ71ysrEz43TEP6eP11+OMx
	MxvpNnrJg8Rhbsw6puQCMYLN2P/P62Kn8VEL+dmCobjQP7WEW5TPvAakFxbeDQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774578157;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LftgPTXKl4qmU4BeuavS76vMB5Umy9LKzMATlo8gpA4=;
	b=lQoBK2DoAkFz5vp9jKrFZpE1XjShTv/dqvw4fUcIkjmFsl3uvJDdr35o0EC8av33z2JwZI
	I/ZReWD6MoVTN5Cg==
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
Subject: [PATCH v6 88/90] KVM: x86: Remove BUILD_BUG_ON() x86_capability[] check
Date: Fri, 27 Mar 2026 03:16:42 +0100
Message-ID: <20260327021645.555257-89-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
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
index 161fa2b23bdb..dac12dfdf47a 100644
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
2.53.0

