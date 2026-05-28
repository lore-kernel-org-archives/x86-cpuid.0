Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E373C3F926F
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982805; cv=none; b=oAhGRA2195DsUK9FZupXUmh4OGP4jyoEg/hb1GQTGhbxcN8X9lVqRZLKrR6qFz8KvtRqlwC8B3M1KHsjX02i/KermVWlKY67/gRnSDzlwL070xtGS24CMmD/prROQuzjf8AZQEF3Bzt2c/CzjD6hQwHrQ5UEbpP058zRObebCBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982805; c=relaxed/simple;
	bh=s5spO4YsKmrxHCvSzKfWWzJ+KMRBpjtwvYcStZyCIls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZIekoMguSWZonecATQjT1xXKUfBzsC6vGe5nxMZLYIUlLUsYoPHxatAHPzNukWIPTRHeAs8hKmUhn8iqmH+/rXG3oDEbYp3qtlhgzVwQPJ9P4AvHzHojo2Y7niBHWkHv95ToCXgy32zBWeAHEGOkHPXlgvf6AZ1+k6lt25tzDhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Agq9jjrP; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Z0WtzJ9c; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Agq9jjrP";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Z0WtzJ9c"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y7NOvfnNl63vEh6Rxxpapu432IoxwbHBeaGZYezXAto=;
	b=Agq9jjrP0Ukk3pMxDJVwFWGDMWjV1fqiVYYHRhAMZDHLKm3Nez1Ws5tkvdSRgbWtBADO9A
	8X3kUFnAiBNHu0C5RR16PUQK8q1pqPH67iIFsr457LnWV4nOLEoCi1QGdH3EU4qapJ1LgH
	Iruk7U4bBd0kRr+8ZLyll51h31exMgtK+odarULem21eVj/Zebm4QExG22tCeOEWDp26Rk
	2mJLLnlJuuu6ariV/FGU9bHXt+1eQVIncMSX/Cuql9uKD+1F/K96Y2KqPen2L2jZSMNTLt
	Vkm2LF5aqQFjkLsWaOLgfECiDQoBz+VmWjGWsHec3jwuXJRJWSy4SEvvQ7UyBQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y7NOvfnNl63vEh6Rxxpapu432IoxwbHBeaGZYezXAto=;
	b=Z0WtzJ9cYB1QUDVSCuYtQTlwH5+lciCwVgYOLKWg8DzHd9CSfvSMJItdZd1P4za+/gRTP8
	m+0FSNVLbdFBjSDw==
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
Subject: [PATCH v7 007/120] x86/cpu: centaur/zhaoxin: Rescan CPUID(0xc0000001) after MSR writes
Date: Thu, 28 May 2026 17:37:29 +0200
Message-ID: <20260528153923.403473-8-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Force-enabling Centaur/Zhaoxin CPU features through MSR writes leads to the
CPUID(0xc0000001) EDX feature flags getting changed.

Rescan CPUID(0xc0000001) in that case.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/centaur.c | 6 ++++--
 arch/x86/kernel/cpu/zhaoxin.c | 5 +++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/cpu/centaur.c b/arch/x86/kernel/cpu/centaur.c
index 681d2da49341..a97e38fa6a9f 100644
--- a/arch/x86/kernel/cpu/centaur.c
+++ b/arch/x86/kernel/cpu/centaur.c
@@ -44,9 +44,11 @@ static void init_c3(struct cpuinfo_x86 *c)
 			pr_info("CPU: Enabled h/w RNG\n");
 		}
 
-		/* store Centaur Extended Feature Flags as
-		 * word 5 of the CPU capability bit array
+		/*
+		 * Force-enabling CPU features affects the CPUID(0xc0000001)
+		 * EDX feature bits.  Refresh the leaf.
 		 */
+		cpuid_refresh_leaf(c, 0xc0000001);
 		c->x86_capability[CPUID_C000_0001_EDX] = cpuid_edx(0xC0000001);
 	}
 #ifdef CONFIG_X86_32
diff --git a/arch/x86/kernel/cpu/zhaoxin.c b/arch/x86/kernel/cpu/zhaoxin.c
index 761aef5590ac..55bc656aaa95 100644
--- a/arch/x86/kernel/cpu/zhaoxin.c
+++ b/arch/x86/kernel/cpu/zhaoxin.c
@@ -46,9 +46,10 @@ static void init_zhaoxin_cap(struct cpuinfo_x86 *c)
 		}
 
 		/*
-		 * Store Extended Feature Flags as word 5 of the CPU
-		 * capability bit array
+		 * Force-enabling CPU features affects the CPUID(0xc0000001)
+		 * EDX feature bits.  Refresh the leaf.
 		 */
+		cpuid_refresh_leaf(c, 0xc0000001);
 		c->x86_capability[CPUID_C000_0001_EDX] = cpuid_edx(0xC0000001);
 	}
 
-- 
2.54.0

