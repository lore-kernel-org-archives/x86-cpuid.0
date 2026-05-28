Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F7D3FC5C9
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982946; cv=none; b=PV0uGu28dllW2aZ0nwVdo6c29qwucOFN4BlARFnn6qspRcIu3gR1dxMERPrhsKYlCmRIQ2jtPSwynS1Yb6o7zmFt/+LIi0++YBuWdqnul8HwmPGW4p/brxSlk90EyDVv1YapM8dyDuj8wZuAJg1/5ks0eeJKS+taPIfinmH5RtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982946; c=relaxed/simple;
	bh=g6FzSkK406zdlUICG0D3qkRD1Baoy9YqOnHbXtIBrCI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=noFluR0wHNfdn7bF+Pmrm9a/EbILqTb5YSEGhl66vhzcdpOpAFBpau1lQulW4vFExUAlN+eUQ0kRaeybW9CQH6atm/HUKp4aQHtOIXF6s2Cw4s+3uuraG8xF2L4QV2JTrsvGujxt20k/7dV2VL+1L2KMMAdbL7cFqUosb6gCgYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2VXHSVeM; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=gpv354aW; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2VXHSVeM";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gpv354aW"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4+CE+siywCqRIvJ4ysTV7EQuPL252QrJxvsb/WCBpzo=;
	b=2VXHSVeMHAwo3d2Wb8Kcwf8bE5DOUCbSsVvDhC3NPsZyzJCl7hPrVjHUYbIioRtTChVhde
	sCMIUPzcTazHo7CEJ8Snl/Lmlbmr1oYJvNiIarjUQkjIFzJEGJrDj+WNNbEKKZPR+GY7+S
	SPAac1S+EQQTiUk6nUsywBJv6ioH7i2yJKz9GElw2n+dNyAaTrhp4pU2h5bt4+bFBbimPU
	bKOL8c0oE/pAj1Kz11Ldybv1ZIkpO5KnUw0erOMhlgQAnKoEurwwgAS1quPAA82caIaN4u
	MYFPJ3BZQ0Vg3Fc2ZCNAXD/JtK8tsKPEaedKrUpyhXS4Z+NeFyIqFljUNvKBHA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4+CE+siywCqRIvJ4ysTV7EQuPL252QrJxvsb/WCBpzo=;
	b=gpv354aWm3paYQ0r80VrQklqP8pN6j6+jIog0FGAcrSQ+zuK0ugOu2CthwKboPmgQuQiwQ
	Q81hBiD1YiyNAvDw==
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
Subject: [PATCH v7 047/120] x86/cpu/amd: Refactor CPUID(0x1) level calculation
Date: Thu, 28 May 2026 17:38:09 +0200
Message-ID: <20260528153923.403473-48-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

AMD K8 init code has the cryptic CPUID(0x1).EAX level check:

    (level >= 0x0f48 && level < 0x0f50) || level >= 0x0f58

Given that:

    EAX[0:3] is the CPU stepping
    EAX[4:7] is the CPU base model
    EAX[8:11] is the base family ID, with 0xf as the largest
    EAX[16:19] is the CPU extended model

then "level >= 0x0f58" translates to:

    model > 5 || (model == 5 && stepping >= 8)

and "level >= 0x0f48 && level < 0x0f50" translates to:

    model == 4 && stepping >= 8

The two expressions can then be combined as:

    model > 5 || ((model == 0x4 || model == 0x5) && stepping >= 0x8)

and further combined as:

    model > 5 || (model >= 4 && stepping >= 8)

where "model" in all translations above is the decoded CPUID model:

    base_model | (ext_model << 4)

Using all the information above, convert that CPUID(0x1).EAX level check
into a more readable form.

Avoid a direct CPUID query by using the already cached CPU model and
stepping values at struct cpuinfo_x86.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/amd.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
index 50bbf9f33501..0e077a4f2646 100644
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -691,12 +691,10 @@ static void early_init_amd(struct cpuinfo_x86 *c)
 
 static void init_amd_k8(struct cpuinfo_x86 *c)
 {
-	u32 level;
 	u64 value;
 
 	/* On C+ stepping K8 rep microcode works well for copy/memset */
-	level = cpuid_eax(1);
-	if ((level >= 0x0f48 && level < 0x0f50) || level >= 0x0f58)
+	if (c->x86_model > 5 || (c->x86_model >= 4 && c->x86_stepping >= 8))
 		set_cpu_cap(c, X86_FEATURE_REP_GOOD);
 
 	/*
-- 
2.54.0

