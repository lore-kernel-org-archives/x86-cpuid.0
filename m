Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4DF35E92A
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774577964; cv=none; b=iqwCdsvn6FPVbIgAVj3Ivn9ZmellFabsKC2fQQfgbUytE+pHC6TdnOxeWcG3nypAj3QtJ57tMI4Ct6QHv/s51MfyO3EZfrRGj8iJabd881qtn6RuuquHwyMr4UAYVksYqZOr0K5MtmmoIae6nly03n5JkggxP7O2wfnEFksrEvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774577964; c=relaxed/simple;
	bh=4UemQ89kiKz0dglcmIm9obRlF5+D8CFqfiq3knbz+0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iJZ+jMg7h/jm37JGudW/CvamvSoA0Wn8V9rUVdtE1Zd3P4snEdWpXxQ6WKpJrOLCp4pNrFQ8nZ1n0NfA4WrK7sBnYInEJIoWCFaubVj78zmgv+Jrhps2F4sGjlPsYYsAP6CHod/E3WSfR9AobYwgQN679H/5cd3y7Ng6JXB89z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NpS8XhQm; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=w0JlEiIK; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NpS8XhQm";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="w0JlEiIK"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774577959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UpC+EMumS+l6xewDpwY/mB4CawTrHBHeNSI5SL9SiQg=;
	b=NpS8XhQmIdVIv1Vvkox6QY0qRHz5Wu/0pfiplFUDXFt7sI9tFx5OdbwUoxRWTKirCQzRjG
	ttGofEDw7sl1eSx5lfJq/RWrhbJZ1CSjW+8NPSDVkkCl7VmsI65iD6F/5RJfFl2OazvmJq
	m0io1QPKGVoDWbfpPtvzAoQA3+1F67kVV/6MnvHpP6Snw23PMP6Wkx9mIoNiuUw/Pcitgo
	r0nHzBiX+tfRAOB6Ni3eA0/5yi9lAieCEQxh34s672Aatt1KCNy+Uw/z70sVU8vAXwNy8I
	ovGA0EiEieafpD6Yop8hIZmKJg0mwn6QvyifRkMiFsmqmWBeaWSHr97fga1Gjw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774577959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UpC+EMumS+l6xewDpwY/mB4CawTrHBHeNSI5SL9SiQg=;
	b=w0JlEiIKzCmia+l9yJtURM+yVUabDmYllIFOdSwD0ixluPCmDLZe97LU6Wh3GBXYJLpS/F
	blA00X8jmcMBOtAg==
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
Subject: [PATCH v6 33/90] x86/cpu: Use parsed CPUID(0x2)
Date: Fri, 27 Mar 2026 03:15:47 +0100
Message-ID: <20260327021645.555257-34-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

At the Intel cacheinfo code, use parsed CPUID(0x2) access instead of a
direct CPUID query.

Remove the "maximum standard CPUID level >= 0x2" check as the parsed
CPUID API output NULL check is equivalent.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/intel.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/cpu/intel.c b/arch/x86/kernel/cpu/intel.c
index 08869fecdf30..cad66ca14ca4 100644
--- a/arch/x86/kernel/cpu/intel.c
+++ b/arch/x86/kernel/cpu/intel.c
@@ -722,14 +722,14 @@ static void intel_tlb_lookup(const struct leaf_0x2_table *desc)
 static void intel_detect_tlb(struct cpuinfo_x86 *c)
 {
 	const struct leaf_0x2_table *desc;
-	union leaf_0x2_regs regs;
-	u8 *ptr;
+	const struct cpuid_regs *regs;
+	const u8 *ptr;
 
-	if (c->cpuid_level < 2)
+	regs = cpuid_leaf_raw(c, 0x2);
+	if (!regs)
 		return;
 
-	cpuid_leaf_0x2(&regs);
-	for_each_cpuid_0x2_desc(regs, ptr, desc)
+	for_each_parsed_cpuid_0x2_desc(regs, ptr, desc)
 		intel_tlb_lookup(desc);
 }
 
-- 
2.53.0

