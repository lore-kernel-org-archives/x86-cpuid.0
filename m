Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C08D35C1AC
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774578087; cv=none; b=EF9Rynta5LbexMBRnYm0Wu1qEt5HSnUqGXat3UPPkNAcLGFMjVcnNoBa2f9twQ0A5JPqsVZDo/0D3/ULn6VVm5Tx7UYsxkfnHyE99uItlMAEnF2rgBlJWVUU76EhH/6x4zYwJDyK+4b3fN2lferav95LaK4ZIlZON64Pm0JSAJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774578087; c=relaxed/simple;
	bh=WNmKYoGGoPfX72KFu74LUhADohB7bAZtY3qMpGuIF3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PqH0hMRh5TMARy4QdhvHdBHhFsyrpxe0qTMIKVg0VCIqlR4ob+jLqemzva6GwS1aC6XKOwUrddAS0+I46oNYkZllDEgvqfzhuAmabEEq5YK5bjXBAiRtPTToxzcjyJeqzQ+Mb2Rd4JMJhE6hrMJ4yQcFT382i4WodCY0nn/MQRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=L0nRVqyO; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2iOZ7lmQ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="L0nRVqyO";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2iOZ7lmQ"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774578084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dkD/CBmTA4DS7GEldcH6eyTvx2dawK8VgeuDCIh2ZeA=;
	b=L0nRVqyOG348X8A1b9tXahvrWwNzW/SVNeWpK67GPa+2eLttMJDfrGMpa7YtRG33dXDNQ0
	qwiGjPSEGMO6mBLojcNBvjO1tUj1dcRhnlbsVHA4KMG1RUgSpV98TBoIFktsAYKlxuPDSx
	xY+/EmTDGkdo1urBCOARgCo/ImEf7GJu97OStwoKC5DpZyH7LCQZh6ExBJ1vsmrmAJNh9r
	HdsSmbC+oHhzVtHyNlzZhacGEmymdpFFFV6LPzlU1o3nyxayJM7AO6nKkWt/yrt/qzc8Bg
	2aOjKC+cQNF0Lpt2Ax4LCXFxsIPfXrjXBoAAIAB+JPDfy5h2tGSK2E9+uw64RA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774578084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dkD/CBmTA4DS7GEldcH6eyTvx2dawK8VgeuDCIh2ZeA=;
	b=2iOZ7lmQyl9TIDES0vPSUVUr1hhMZBtLoBeBteqnx8apr3HzNVICQyzDk6ggHEbuE0/rFC
	u8M+Pvv3V+G2A0BQ==
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
Subject: [PATCH v6 67/90] perf/x86/amd/lbr: Use parsed CPUID(0x80000022)
Date: Fri, 27 Mar 2026 03:16:21 +0100
Message-ID: <20260327021645.555257-68-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For AMD LBR, use parsed CPUID(0x80000022) instead of a direct CPUID query
and custom perf data types.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/events/amd/lbr.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/x86/events/amd/lbr.c b/arch/x86/events/amd/lbr.c
index 5b437dc8e4ce..e5a16266545f 100644
--- a/arch/x86/events/amd/lbr.c
+++ b/arch/x86/events/amd/lbr.c
@@ -423,14 +423,13 @@ void amd_pmu_lbr_disable_all(void)
 
 __init int amd_pmu_lbr_init(void)
 {
-	union cpuid_0x80000022_ebx ebx;
+	const struct leaf_0x80000022_0 *l = cpuid_leaf(&boot_cpu_data, 0x80000022);
 
-	if (x86_pmu.version < 2 || !boot_cpu_has(X86_FEATURE_AMD_LBR_V2))
+	if (!l || x86_pmu.version < 2 || !boot_cpu_has(X86_FEATURE_AMD_LBR_V2))
 		return -EOPNOTSUPP;
 
 	/* Set number of entries */
-	ebx.full = cpuid_ebx(EXT_PERFMON_DEBUG_FEATURES);
-	x86_pmu.lbr_nr = ebx.split.lbr_v2_stack_sz;
+	x86_pmu.lbr_nr = l->lbr_v2_stack_size;
 
 	pr_cont("%d-deep LBR, ", x86_pmu.lbr_nr);
 
-- 
2.53.0

