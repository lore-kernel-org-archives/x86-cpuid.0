Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8483F44EC
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982809; cv=none; b=T7FriHv32Wf0sR5J08rdWgo0PAnWk2DTAaHO3P3tesP0ljr1jbv0sS73dIDDsDaFgIzwva/gvLOwk3Qk9LzDBzQn4qB5Bk/syKel+cFlMX+WMrMaCg6xroJGn3JTHRYwH/DorRq3Jl5aibiUs932Elk9e2Ghe0bB9+7LZ/3Tg3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982809; c=relaxed/simple;
	bh=tXyMvxn4UMBT3PCejOr6UJi6Lo7MqYMdOc9grr9tpUg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tBUZ1sNONaByPnu4zTj7LqVSwX04Omf67HrXTGhDy9xKleNmEx2coH8rEz7lHTCiiBDQWPLPVKi0AUwFq4+mx9bH/kpT2nvMlGeKK+5VJbHSaFE0gVdXAKE9UxvFGBCUaUsHVMk8D2nGIynwdkDoLfjPLl2fFlkNsfG8+XqtvR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OVzdZVNJ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=mAM2TRQy; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OVzdZVNJ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mAM2TRQy"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zHfWDOXFp5/ApvTNX+Xe8ELUIriZCivm0dp52YbxHnI=;
	b=OVzdZVNJ93boXYRlkNU3BguuhWB1tBbe37c44kHYCyiyihkkUt9F46G654gxW7dfjncemR
	++dK2imssAevlFJcm8+tE98SF6LJ+mdD9gzBR7vawI/RWMQNisT8OmgX7YOg4d72rRH4qq
	T7HLqfWS3g0tnKRWhuxkp9JwpU3R8DS5WWt25idDgQB3abt1dNkMh2liASW1mr4FrAeGXR
	g82d9S5KITy0l6VvuR+rEcHW7L4febpQZN6O0zYBaOFqSSruw/1V6qx7y7NgJcEFh7BUDx
	aksAdy1ByeK2nLeL7yXoc8xx0FSa/G1A+hnfoIIZPH4easovJ4tVzIg67WGDlg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zHfWDOXFp5/ApvTNX+Xe8ELUIriZCivm0dp52YbxHnI=;
	b=mAM2TRQybHG4/sgt2QM1rl/wFuO0pv0vFY0PrL4qyazvGXE4eN/vrdpTscExGVFOO3H/UU
	37crqLAa6LP4kYDA==
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
Subject: [PATCH v7 008/120] x86/cpu/transmeta: Rescan CPUID(0x1) after capability unhide
Date: Thu, 28 May 2026 17:37:30 +0200
Message-ID: <20260528153923.403473-9-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
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
2.54.0

