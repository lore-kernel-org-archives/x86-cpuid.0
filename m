Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AE5428841
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982942; cv=none; b=A1PerrSfKRQoOwumxgtIDQJwpnqAyUQwp5j+Y6oJ+uIxrmMCEOZJ2UbrdDMX+1U+L7YF0uAYNMFV8J9uGpX7CwAF1m3dqCK754WVhhH3Vvdd0r5c0C4PTj1uepYEQHbTT0N6EDINSIBy5+M6/ekdOjxvNx22vG3z7dtdktL8PrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982942; c=relaxed/simple;
	bh=f9/sxAse2Ljjii9UG6fNUelSBBwUXFLcb+EWyBounsU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UzvLAlc/Tyr5bEtvkU59hCZFc9vJW+2X/zHan3hj7OL8jOunZJCJQut3SySTv2pJlKcqUExbxQIu3w0OaPQbKJd0HCaswKiG6Rq+FCAV5Y/mH3MbNxpNXizE7BkrQ7XXQwzWf+ag4Ky+rFUFD3oOnea/YSoDRyj7tmw/Yyxw3bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HYzICl6v; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=N+jDQjd4; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HYzICl6v";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="N+jDQjd4"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8vPV5cBhASNOsauOImhCjtz8dudxfhPoXcQ1YNmmcyE=;
	b=HYzICl6v1jwQUQoj4u5o01Sdxoe+DbN45gC9iqEwQlYxKvJ9H1KZHafsIIT11rFjzYe3Ec
	cM31Kl4pw9haS8OdOlFfvI7nIml5E1ZM5DpA76QY9tIg4dHCOuYWSSOBqQTsXNi76IBs2a
	1oOIVCm/e+40Vv6F45bK5ZtR1jb112s4zgIP+Cbfb7qw6RgStX2hgZvEpxEEzcC1t9Icxg
	rkknIT2yDPGG4/wCeEAbQnO38DgxfFIburr1znjrsoA8pC3YXfGpVtFP0LvfywLNR4IHhK
	gd3Ywa4RbHGogcAzhyvHIXWkPaSZfKcyk1tLMVDMFwnpfhAs6GIs+jiGBJPolw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8vPV5cBhASNOsauOImhCjtz8dudxfhPoXcQ1YNmmcyE=;
	b=N+jDQjd4Iwvt4LxJcTyXyt84MXNf5ipEJ/xJiWG9uhlvtecyNOK9Nevx8yfMi7cS4r+L/j
	uIZE/eIX6pLyxYAg==
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
Subject: [PATCH v7 045/120] x86/cpu: Use parsed CPUID(0x80000008)
Date: Thu, 28 May 2026 17:38:07 +0200
Message-ID: <20260528153923.403473-46-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use parsed CPUID(0x80000008) instead of issuing a direct CPUID query and
doing ugly bitwise operations.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/common.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index d8e46eb0f5c5..d78063e4e665 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -1102,10 +1102,9 @@ void get_cpu_cap(struct cpuinfo_x86 *c)
 
 void get_cpu_address_sizes(struct cpuinfo_x86 *c)
 {
-	u32 eax, ebx, ecx, edx;
+	const struct leaf_0x80000008_0 *el8 = cpuid_leaf(c, 0x80000008);
 
-	if (!cpu_has(c, X86_FEATURE_CPUID) ||
-	    (c->extended_cpuid_level < 0x80000008)) {
+	if (!cpu_has(c, X86_FEATURE_CPUID) || !el8) {
 		if (IS_ENABLED(CONFIG_X86_64)) {
 			c->x86_clflush_size = 64;
 			c->x86_phys_bits = 36;
@@ -1120,10 +1119,8 @@ void get_cpu_address_sizes(struct cpuinfo_x86 *c)
 				c->x86_phys_bits = 36;
 		}
 	} else {
-		cpuid(0x80000008, &eax, &ebx, &ecx, &edx);
-
-		c->x86_virt_bits = (eax >> 8) & 0xff;
-		c->x86_phys_bits = eax & 0xff;
+		c->x86_virt_bits = el8->virt_addr_bits;
+		c->x86_phys_bits = el8->phys_addr_bits;
 
 		/* Provide a sane default if not enumerated: */
 		if (!c->x86_clflush_size)
-- 
2.54.0

