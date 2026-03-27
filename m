Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1D333D4E9
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774577889; cv=none; b=kCi7X8FEfNIMZVQIsbIOfX7n+xE90k9TBOSAtdm7lw3nyDVpIRG5qMhLUGqXHvxtsYcGwr3UThIOGnI1hhY/Go7C+33Lj3iHjT1562e1+y607lk+lyzxZceGo1PIjNellNg3fyBtLchlkATsVqWDpaMafc4BHFtW4933IHGR+N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774577889; c=relaxed/simple;
	bh=vS1LWMmypAy8nihrfer1FMBqTVZgK2kYFbyeCeGwTSo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YuOl+H1HhP7oNED96t0KDAwEqPBoabz+E/1lsn2Msnnc3r55hIicrJGzB21FXsZrxf2qr/PGsrYufWVJMI3aZRhSW2Wk41w5GALCDB79HrbgByI37EXkhZqs/0Ck566hYPakJVZkKa3j4Je1LGf6dMJWUI+YIBZRSMMbiIL6wJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Xb8Ppheh; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1Ka4FE2g; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Xb8Ppheh";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1Ka4FE2g"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774577885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IAp+kfoshU4h8p4hqAmtOn1a7SUaBK7HvvMUmE8dfwc=;
	b=Xb8PphehIJ1qyZe/4TxIu4pqR5UHIzSlFT366NmPYVRLGVMW6fzxxkCsfl+t2paOQY1kW+
	N2ooCkDRH47fB46A+ZysmpRsNuUy6M0xDtE5+dT+bGf1uoZhMf0+fUmurexcm2AvyLGyNr
	7cUcispYTBesZ6C+sLkfJ2W5iZLB3wVOizAYHKxUc4dOGyLNX+6KWsbUsLUs1QRMk3SZiS
	i1jyJI8sTYExOCqar7bKBp5/XLBECFqiC1a+4kmlFu0AHjAROFTZFeQ08CDf8KUvXrX0+Y
	wKSV2jC86LtTTAaVFN78fabjOA62d5D9NsMIF8L5TuZhzY4LlF8cr8tfp2eKAQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774577885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IAp+kfoshU4h8p4hqAmtOn1a7SUaBK7HvvMUmE8dfwc=;
	b=1Ka4FE2gxsrtjKWvhBsCl2T+T2TMyrLvdNDpcnRBEQUShk/VGeqgl+WNFiISWff3/24O5d
	MtqBN75c8RXcLLBA==
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
Subject: [PATCH v6 12/90] x86/cpu/transmeta: Rescan CPUID(0x1) after capability unhide
Date: Fri, 27 Mar 2026 03:15:26 +0100
Message-ID: <20260327021645.555257-13-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Transmeta CPUs allow masking CPUID(0x1).EDX feature flags via MSR writes.
If a bit is cleared in the 0x80860004 MSR, its corresponding feature flag
is not reported by CPUID.

Refresh the CPUID parser's CPUID(0x1) cache while all of that MSR bits are
unmasked.

Note, the MSR 0x80860004 semantics are documented at the "BIOS Programmer's
Guide: Transmeta Crusoe Processor", dated June 14, 2002.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/transmeta.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/kernel/cpu/transmeta.c b/arch/x86/kernel/cpu/transmeta.c
index 1fdcd69c625c..d9e0edb379b8 100644
--- a/arch/x86/kernel/cpu/transmeta.c
+++ b/arch/x86/kernel/cpu/transmeta.c
@@ -88,6 +88,7 @@ static void init_transmeta(struct cpuinfo_x86 *c)
 	/* Unhide possibly hidden capability flags */
 	rdmsr(0x80860004, cap_mask, uk);
 	wrmsr(0x80860004, ~0, uk);
+	cpuid_refresh_leaf(c, 0x1);
 	c->x86_capability[CPUID_1_EDX] = cpuid_edx(0x00000001);
 	wrmsr(0x80860004, cap_mask, uk);
 
-- 
2.53.0

