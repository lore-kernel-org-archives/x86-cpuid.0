Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2E1426685
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982946; cv=none; b=bWSmiwiMk+fBxGU95vF3kVP1CbNyUzpj+LAzks8UbTDOEEW8Z2MNYSdBd4bgJM0RxCnzfdZOjwLJ/k4Xeh+eSaEW++CprvUcURkwVyjuRbHE/dA9YeKHWQl5+eHLeAVmyU8bk91F6ODPn7Xo99WTI6Q4fhUmjQUZ4dnYis2SJYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982946; c=relaxed/simple;
	bh=+24yF5ZuVAL93pZG4RtA1ttuWoIDj3wBRSaFyrhMEKk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s5LxxykfmTNAcMRbDZg2rzpQt0IfUJ1gbEDW8T1WRRSRPdebJCwTIU6nojWL6e3vV26wc2Pj8QZZKKNRHBOERm3iYutc+XsGF+hZD+VtakexYjMdN9AV1LmOwXNNxNPZ2HDqWXpSB8szDeL+rBPVqCnlK2xcnotUOal2woIhs8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=WUx69PB4; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=8PnyZwxe; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="WUx69PB4";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="8PnyZwxe"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ccCjOCYWJxzcOWh9aDfzlst+Yr7nfMsCk5H+Xgm695U=;
	b=WUx69PB4F6T7HaOmtI9MLi6q9XjAAEEZZ05yhGy4/wctc9RkOjhp9oEgLiJLbrxkFz/Zbi
	QEdBDSdkDekHOGNgy+27fgRlFny5a52Q3sDOF077AeSOVGCYu5mOxS+TESPX919c9XlMSs
	vMU6LPp66MVh2Gej9N1STG4iUv3GfjMa4IqrMwtwOy5tmUNjNeL3olC+DXB65YmMVf0sdF
	L2CZ9V72D2dd6lR1gSQBMM6stAXz6aiG1jin5jzGK/n2YZ8QeKR/ZomJE32MdGj6IqodAP
	ZzX6g1xhIWVKnqeJhZGr16/o6zc2idc7KQkJsNadRIRA8oDNVRmxQtVZfEapIw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ccCjOCYWJxzcOWh9aDfzlst+Yr7nfMsCk5H+Xgm695U=;
	b=8PnyZwxezFdFczzjk53mq3syQqKEuaUBZbQ+i0BTrgQTQegb2AajzvsRT4vXK7Mre3mjDV
	XERRP+MA1z/vsSBw==
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
Subject: [PATCH v7 048/120] x86/mce: core: Use parsed CPUID(0x1)
Date: Thu, 28 May 2026 17:38:10 +0200
Message-ID: <20260528153923.403473-49-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For MCE record preparation, use parsed CPUID(0x1) instead of a direct CPUID
query.

Keep storing the raw EAX output into struct mce.  As documented within
__print_mce(), the raw value is parsed by external tools.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/mce/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index eebc60342cd6..821cac467c9f 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -120,7 +120,7 @@ BLOCKING_NOTIFIER_HEAD(x86_mce_decoder_chain);
 
 void mce_prep_record_common(struct mce *m)
 {
-	m->cpuid	= cpuid_eax(1);
+	m->cpuid	= cpuid_leaf_raw(&boot_cpu_data, 0x1)->eax;
 	m->cpuvendor	= boot_cpu_data.x86_vendor;
 	m->mcgcap	= native_rdmsrq(MSR_IA32_MCG_CAP);
 	/* need the internal __ version to avoid deadlocks */
-- 
2.54.0

