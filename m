Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2DD384224
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774578118; cv=none; b=P8TG6YqC7K2L0G58C9oz29rfh1Sp53A52iDl3oWV5E8Nk/AIF2/RFH00hP+ME4CMcQQzMsS1H3g8paK3L4yZZaAnqkPkHD8PDDs4RSMWSnMY0fPcIn23O7nRP4N3/MaIz3OUoKY629Qwxqu5wW0cXm9AoR5VClfk5mUJgRhjIpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774578118; c=relaxed/simple;
	bh=SEtDelFttYyAA1iLr5xwi84uQX0GCqD4IZPsVMstLzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EhiOv+gGVrtRBa0N3w4G7QaYpPbNwFrvtkG3kS4vS+BDY8SrZMbKwuMX/nI2NGbhfJYd+oLsJVBOmYZf89pzO3eWLco8QJkMJ9O5sR4biXXllDz4xSUDWM6aIEeuq+3qFemR0NB0pc7MTMB0A5OXNxvxLbAuhBX0G0Vq/6jmokc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GLLQk54U; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wpXoDH6b; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GLLQk54U";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wpXoDH6b"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774578116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PTytj0c/pOIVc9pkW7N1t83k4hUe0CQ5kKeoKqauLhg=;
	b=GLLQk54UcMIiS9PNtgJDlig2O58IHOvnkhZvF8qrpBQeww8ensxmV+MbLIs6tIp7mt+/WC
	d0FNHGBR4fdjuneI/PKd+ncKpLN9TIsP3NI2IGmMHuOheb5IbvuYkCM3ZdtVnk7z1mhyX7
	ioDnV1dt9l5bABydSJmHFW7yLakRH2ilWEPJSOVXba7hLzPj5W2qUbQyLoeTDsAivxnST6
	Jm4ujTGKCOil8aNJMIHVG01CoSQIkf2vnEBrtCii6H9fkVMV1cXoJyu7yPhM8yEN1E6IFa
	JXBpPSnx1+G4tpqoOASOBOZdn/LpdqWx14AbfwZw1yVrlF07fggoFvzO3I16ew==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774578116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PTytj0c/pOIVc9pkW7N1t83k4hUe0CQ5kKeoKqauLhg=;
	b=wpXoDH6b/eCJiYWPlivvT3FRLkxEMTu67xRayDyx7R004jCm1bxJb6FMMhKcf5kMsg7FK8
	8Z7Ghh/TNj2tjoBw==
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
Subject: [PATCH v6 75/90] KVM: x86: Use parsed CPUID(0x80000007)
Date: Fri, 27 Mar 2026 03:16:29 +0100
Message-ID: <20260327021645.555257-76-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For KVM cpuid, use parsed CPUID(0x80000007) instead of poking at x86_power.

The latter is backed by a direct CPUID query and will be removed later.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kvm/cpuid.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
index ca769e390e62..efc155e1da10 100644
--- a/arch/x86/kvm/cpuid.c
+++ b/arch/x86/kvm/cpuid.c
@@ -1763,13 +1763,18 @@ static inline int __do_cpuid_func(struct kvm_cpuid_array *array, u32 function)
 		/* Drop reserved bits, pass host L2 cache and TLB info. */
 		entry->edx &= ~GENMASK(17, 16);
 		break;
-	case 0x80000007: /* Advanced power management */
+	case 0x80000007: { /* Advanced power management */
+		const struct cpuid_regs *el7 = cpuid_leaf_raw(&boot_cpu_data, 0x80000007);
+
 		cpuid_entry_override(entry, CPUID_8000_0007_EDX);
 
-		/* mask against host */
-		entry->edx &= boot_cpu_data.x86_power;
+		/* Mask against host */
+		if (el7)
+			entry->edx &= el7->edx;
+
 		entry->eax = entry->ebx = entry->ecx = 0;
 		break;
+	}
 	case 0x80000008: {
 		/*
 		 * GuestPhysAddrSize (EAX[23:16]) is intended for software
-- 
2.53.0

