Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F9F33345A
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774578028; cv=none; b=Ef7KpqRcHJu6yt4Fh6eJZaUrxqdGjUh1m/ShfN5/8G43Lx3B7tX6WAIwrHxZOk2EaZNB6YKSAvLhCikXpDDDJ06+0uS5Pb461EwknehxZBch/VjMXpeZ8XQhuxZiJW8K6bBrbokdVAYJSnrVVO+hdVLYIYRGyPG9VRTYunS/J1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774578028; c=relaxed/simple;
	bh=16KudRD4xR2hDuMCTu815ecnor3Dwv8sz2KEEY3i4Sg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HQUNO0jBo8KQkHuUig3kGw22vlXXiU0RXI0eZLL9/23hl/IDlUfMwFINcfufAt/G6/N4IiEGts/9r9m6iTGBBpVg8ZBOyik/ui5ckZYOqL3HnwmLgyBOAoxP/1Q2V7MTQcdxY/8Y4i8q3mnpfs65Jd6FgPbMwzWbGpf752i9mk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xxjwCVbh; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=R5FFRGFn; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xxjwCVbh";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="R5FFRGFn"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774578025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5+dt6vCApc+TRaDZDLAElGQpnpBiXb1iUO9Z1xisk/8=;
	b=xxjwCVbhoEaBi/wa/ApEK98qe+yaZCe+NPAZipBOBEjtiAzBqvGsXmmw+hQ+7kcsZiMb6s
	0s8KEHeSrTd5YfMcQybdB+Uv5q3hyRgerfl8k+Du3m7bJ9nvlfLxA4NmUBWZCwvqMw2Lpd
	Hx6qEw2to4GNHYxxy1uzsPV9YeQjTxWNvkd/ruPDoINL5T2Hf5yuwe2cqDTwqI9VYhspqe
	lWrMcz1oQI35QVlez1XrQGnbYadVY0X0YfbuWDSmLP+Qb3H4aLs/TThY10nXA54redpo5V
	zc92iMmh1vLvgCzAoFGxX//jvfSOIie21oASi/TCdaBFlOrbnF0HEINOSNvwfQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774578025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5+dt6vCApc+TRaDZDLAElGQpnpBiXb1iUO9Z1xisk/8=;
	b=R5FFRGFndSzrxV8IXKJIAMWx6LowduVKkGGcVoHqpKj4Uup5z2C1vAY0/lg0DgsYwTaxq5
	8pnVXjMRs/83QaCg==
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
Subject: [PATCH v6 50/90] x86/cpu: Use parsed CPUID(0x80000008)
Date: Fri, 27 Mar 2026 03:16:04 +0100
Message-ID: <20260327021645.555257-51-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
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
index 5fa5463686ac..2beb53f6bed7 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -1100,10 +1100,9 @@ void get_cpu_cap(struct cpuinfo_x86 *c)
 
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
@@ -1118,10 +1117,8 @@ void get_cpu_address_sizes(struct cpuinfo_x86 *c)
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
2.53.0

