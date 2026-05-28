Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523B1409624
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982881; cv=none; b=kMuuQu/oy8COZ0e/1Liff5jLNPnbb8CgvFhyDR2wp1Lmv+kzygMx5ukpCbaiXDSU2QWbLsVBtO1CW+4N8aMFM8SYgtBvwWawn9vzNkzSYEbhNeu4iOZskT4RsRSOTDrCLrhBclxWV/aLjk3akKqMWH6cYJoBMP5pHEgQA8J9mas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982881; c=relaxed/simple;
	bh=Z98TVhkH6+aGiydyxHKpCGX/azCbJ65l/IXIELgxR+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e2W75sfDkHoJvjEidmWAa2pjGfM/8nTFUB8f1WAIxhTkAh7YQHgcXKhwBhBEVoNFAzqsjnTcqvtj2mC9LDmlBzsCeQyR9nRIUuk29Kn0xZW2lT3f6GVhroq8lrJ0rrWU0DxWT1pJu5bLFLIGuuX5NwY9CjSIgPqvRlX5RsCJyhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ODPoJu8X; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=YoiwBOyS; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ODPoJu8X";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YoiwBOyS"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c9Ql/vXzqLMu77lSwsIR2ztTMeL1uBfD+VHcsu7CIx0=;
	b=ODPoJu8XZ0aVw+aV1o9CmCPj59vr9eH91q1m+ngRtjAnZd6KhC5dRAPDVbt1O7hBoy6rJI
	F9nDesXmQWBYF4cZvxyCIQrKEWaZICv/ss9/C+vKwAvwAfpVePqafQgpZGpyRwSB5fz8jr
	XeKXH6isePUcHNd7gmZWKqsZ20GYQPtInJuSE/YLIJZAre9x1h/o3TxpqIuqb5sMCh2v8O
	i1obw2e0tT/7Bh5nrmAjO2TOYAk19/7gfDFiTT0jcBJQxzcorCWmoZTvWfOGYXOGrYoPPM
	CnJD/6qj9D9uSyN/DnM8qrVsyQ4bIMrMCHHVLZXxMvOXmh3EKma2ZBXekgD0xg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c9Ql/vXzqLMu77lSwsIR2ztTMeL1uBfD+VHcsu7CIx0=;
	b=YoiwBOySm3THu8/9vw8Uoc0cSREYHlGaVmJq1pz7MqtD2upVp1NNbjBHnT2LFdhkojrhAm
	rgSMgiA+xLVZmkBw==
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
Subject: [PATCH v7 028/120] x86/cpu: Use parsed CPUID(0x2)
Date: Thu, 28 May 2026 17:37:50 +0200
Message-ID: <20260528153923.403473-29-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For Intel TLB detection, use parsed CPUID(0x2) instead of a direct CPUID
query.

Remove the maximum CPUID level check since the CPUID API's NULL check is
equivalent.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/intel.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/cpu/intel.c b/arch/x86/kernel/cpu/intel.c
index f28c0efb7c8f..4d190dd64e95 100644
--- a/arch/x86/kernel/cpu/intel.c
+++ b/arch/x86/kernel/cpu/intel.c
@@ -709,14 +709,14 @@ static void intel_tlb_lookup(const struct leaf_0x2_table *desc)
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
2.54.0

