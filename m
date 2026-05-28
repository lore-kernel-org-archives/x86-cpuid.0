Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6880480DE7
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983175; cv=none; b=kVPJRBKD0L+LUY4AokEtGhArbXUl7ku51vWEVoDflOqjHItyPS9GsN55L0Dnp5CJqkZ4Qzt2p7p6x7XgGHzPv5/utGKgAYnXrwcN/uEWc0VVjlcNFbWBoVRP+oxRMbRciJlpbMnJ04r1YCrf87KcDkcWKlCUI6qOHuM7XvvZrqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983175; c=relaxed/simple;
	bh=eiTjC6XdxxaMaG+n0lN+zFGQdX7SOF0LgoSLd8xT8MI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dJNrchLSmFY+yr/8oxTi8+aS995a0xK4mZc7Xkrrq9BVxWh/yL7LUqidw1lbdKacfoFrCIHoydV5pjVIz6Jwns9Je02GDeJdMcD9QGJxo2uMm34/5f0ghp6SrxykosLb77eehdQK2kMjgk7CQ5B0EYSdXJCT3fzr3d2l6Aosb7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=oRVtuhl5; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=QgykNngS; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="oRVtuhl5";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QgykNngS"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1yP+ZMRXDKqNHlIBM5skecC+OJMl24gnBBEp9hL2E2M=;
	b=oRVtuhl5gz4oSFGqv1qiICoL5wXhEH1GGypl3UVlf0RyYnKqEH/EHbZOajw06aV21vT/3r
	h/XL0hmjVfU+9S0au+Ub29Rywap3VvHmmlj87caNXykyZFUcFAOAsas2aenIoQiSj4v702
	4dIIq8N810JfLZdrUiHw2wBDiPN5EIgrmnWksLU9rsNROSqCSSexFoDvMLBsEwQ7p3d00/
	zExs9jqsJ0EpC1f1TIkyDTV1vyPHJmH1lBsmZnTMNiTxyCOy/VejJGQH+G/VG0roJeAzkx
	I3DXTcEUtPOGZslfm2Uzw4TNkjntJozjhy4iRuwNAyegLF1puqdviPZ83rsNXQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1yP+ZMRXDKqNHlIBM5skecC+OJMl24gnBBEp9hL2E2M=;
	b=QgykNngS9pCx8kvQ5SpaBK9cZskQ3p/OINwkO7NPYs818obwFbtc3eSpcblMw7HeMi9fMH
	3FGXI1+LX+SMaoDQ==
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
Subject: [PATCH v7 117/120] x86/cpu: centaur/zhaoxin: Remove x86_capability[] initialization
Date: Thu, 28 May 2026 17:39:19 +0200
Message-ID: <20260528153923.403473-118-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

X86_FEATURE queries are now routed to the CPUID tables instead of to
x86_capability[].

Remove all direct CPUID queries which populate x86_capability[].

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/centaur.c | 1 -
 arch/x86/kernel/cpu/zhaoxin.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/centaur.c b/arch/x86/kernel/cpu/centaur.c
index 29688aec2231..8f614003d82c 100644
--- a/arch/x86/kernel/cpu/centaur.c
+++ b/arch/x86/kernel/cpu/centaur.c
@@ -42,7 +42,6 @@ static void init_c3(struct cpuinfo_x86 *c)
 		 * EDX feature bits.  Refresh the leaf.
 		 */
 		cpuid_refresh_leaf(c, 0xc0000001);
-		c->x86_capability[CPUID_C000_0001_EDX] = cpuid_edx(0xC0000001);
 	}
 #ifdef CONFIG_X86_32
 	/* Cyrix III family needs CX8 & PGE explicitly enabled. */
diff --git a/arch/x86/kernel/cpu/zhaoxin.c b/arch/x86/kernel/cpu/zhaoxin.c
index 5918f9387c87..7f576f0296b7 100644
--- a/arch/x86/kernel/cpu/zhaoxin.c
+++ b/arch/x86/kernel/cpu/zhaoxin.c
@@ -41,7 +41,6 @@ static void init_zhaoxin_cap(struct cpuinfo_x86 *c)
 		 * EDX feature bits.  Refresh the leaf.
 		 */
 		cpuid_refresh_leaf(c, 0xc0000001);
-		c->x86_capability[CPUID_C000_0001_EDX] = cpuid_edx(0xC0000001);
 	}
 
 	if (c->x86 >= 0x6)
-- 
2.54.0

