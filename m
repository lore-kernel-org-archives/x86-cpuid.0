Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E3B392C5A
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774578157; cv=none; b=siohQlQDrSKTNy84PgL0n6+afMwAzQPIH2Bi30dvM0Et+ABhkA9T+XTid3cJ5tcGagIdCN1tqnmTOaf34wDJEVIX7vestWnv2iOddeIveqI198Tt5EDeIBwJA4YRHFMCaVLBewhqxUGc3q5QhOSqEV8tC3AFxs8nwqEKGdgFcBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774578157; c=relaxed/simple;
	bh=O1DUzfl/y2F/gnNIzuI8mbSsD1Ph8MwszabFmfGynUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sY2ZO43Pfl6PsG6sUKsvC13oeizEoQcPY7a0dy6boKyn+Dbdfnh57NU+inyFsncMqEyhcftNudlQbdFQFcyENpeiu/HuHAPaFJ74U0tiVD8gjlHEaoZqgTfuXh04LIqTsOl4ymmbodAOMnwE3S8e/IEJNAG8ZPMenmZkWAgKUmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=m5A1Kb2X; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MePTuquC; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="m5A1Kb2X";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MePTuquC"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774578154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OAqQxD4w7NdN72ZHq9rATOZSGwIFSb4iHHdAnOHx8ho=;
	b=m5A1Kb2XVdmwknze8+2os1nMctvpR555izg7F+nZzLWpaLpZ8sU7rL/ByKKisG2+UEinKs
	zYLLdh20q+taFQNF/QO5CS7JkYtBzBK2hl0kgkVZ2GmpVCnF/wo5rD0j2O0nbMdvXJ+1NN
	94IJubFX2O7B5TVXKZ5NZafKxGvgxEkIfk/N4CG6LsfMFQg/HUwcMZQc50iYpbNbbLrlOD
	Xuo5ShDMuH+ZBRhYlA3soqQ4mcL2G13pPUmcExtgzj0OcxtQokmaVkdN/eEnyMfi4tpCW2
	NorFuFHEloyYT6lMHMOfGA9+g0VtXaqfKeB9UXIQBpZ71cQfhalgmS36QCPV4g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774578154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OAqQxD4w7NdN72ZHq9rATOZSGwIFSb4iHHdAnOHx8ho=;
	b=MePTuquCidQxnMp2f64seZvlxcVGBdcCnpu4qluUSnSZgIXa/UUHf6yV1n2Aggu3LM8WJ3
	rdagW16/oONAAEBw==
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
Subject: [PATCH v6 87/90] x86/cpu: centaur/zhaoxin: Remove x86_capability[] initialization
Date: Fri, 27 Mar 2026 03:16:41 +0100
Message-ID: <20260327021645.555257-88-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
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
2.53.0

