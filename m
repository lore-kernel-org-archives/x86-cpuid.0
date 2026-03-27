Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB6234A788
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774577913; cv=none; b=LahqPdFSb8VqZf5s7P4nCNO8n6F/o/2kxNk73xmdNtPUVWfh90ocGnXr4I1YIz/C70eaJzOqfv1vIha2Ylpt/hn7hHqZL0n37aHcSpByeh9W1oyWBfFLMqv3ydHc8kldjzzBPKnyzJ0mgmRBRzVYVAKcJClXBH9LirAY+mDw1N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774577913; c=relaxed/simple;
	bh=OV4pfzqO9+fpQt7J+eXW03IAfiZ39Un3jA1qCHSPi+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GjJNOuGvxBOSM02RDfM2+gaNSc+4iu8JCe5j0a7FV6X7sOw5NIPn5U3/6yTB1vYUemBQugRYtEDv5Dm+ACorC7dL1mZVL+GoHWq9X0ZZvJRIfF9osk0+gIUuq1s0QZj8brC0fIEdgyNgWRWpEKyl6f9WPi9hBlj6A2waq5U3LNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BonxuzFP; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Xvo2vK2j; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BonxuzFP";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Xvo2vK2j"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774577910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GLLP2mpYmnTic7kZE+aFg8O9kaD4OqkN1SAEQ6Iq528=;
	b=BonxuzFP4vOgI7GUZuaucPPYpa9aKA/fqdA92CXZLPgoy7olLNGAbvnGbv07pQ6wucUbYH
	YrTsmdSYpGeukG3UDKA/9b2RdWrTd20P0NPliMkE1zwStqf6ir0IZJ3Sz/pvTJjPwsgAw6
	x9Y5q3//d4517BCxynyK0lv7VWcOszlgikMlLkeDwnhBDtHD4DSP3vYxkg0pwQwKC6y5a/
	g0iRnTsqTiKahVCV/J0psi6P+AS7DwfLg8HeLbGB+fFgp1Gd7kKZpHJ9vElXVrFifbkYCx
	HQl6SVYEzSZr2oA70XMkCjq5A/cbe2Y+OWEOoMQ0mjc6PdB9cC3fWK0MyHElLQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774577910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GLLP2mpYmnTic7kZE+aFg8O9kaD4OqkN1SAEQ6Iq528=;
	b=Xvo2vK2jyUroFovXm4S0kwUuOFi+AzfTN/gZlSeobl3JwDTcNfSabr0cHe8ZElTJvLsZPH
	nCjgyr8ddTJC1CAw==
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
Subject: [PATCH v6 20/90] x86/cpu: Use parsed CPUID(0x80000002) to CPUID(0x80000004)
Date: Fri, 27 Mar 2026 03:15:34 +0100
Message-ID: <20260327021645.555257-21-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For CPU brand string enumeration, use parsed CPUID(0x80000002) to
CPUID(0x80000004) instead of invoking direct CPUID queries.

This centralizes CPUID invocation to the system's CPUID parser.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/common.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 204c1f65f265..060f69ab3739 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -824,16 +824,18 @@ static const struct cpu_dev *cpu_devs[X86_VENDOR_NUM] = {};
 
 static void get_model_name(struct cpuinfo_x86 *c)
 {
-	unsigned int *v;
+	const struct leaf_0x80000002_0 *l2 = cpuid_leaf(c, 0x80000002);
+	const struct leaf_0x80000003_0 *l3 = cpuid_leaf(c, 0x80000003);
+	const struct leaf_0x80000004_0 *l4 = cpuid_leaf(c, 0x80000004);
 	char *p, *q, *s;
 
-	if (c->extended_cpuid_level < 0x80000004)
+	if (!l2 || !l3 || !l4)
 		return;
 
-	v = (unsigned int *)c->x86_model_id;
-	cpuid(0x80000002, &v[0], &v[1], &v[2], &v[3]);
-	cpuid(0x80000003, &v[4], &v[5], &v[6], &v[7]);
-	cpuid(0x80000004, &v[8], &v[9], &v[10], &v[11]);
+	*(struct leaf_0x80000002_0 *)&c->x86_model_id[0]  = *l2;
+	*(struct leaf_0x80000003_0 *)&c->x86_model_id[16] = *l3;
+	*(struct leaf_0x80000004_0 *)&c->x86_model_id[32] = *l4;
+
 	c->x86_model_id[48] = 0;
 
 	/* Trim whitespace */
-- 
2.53.0

