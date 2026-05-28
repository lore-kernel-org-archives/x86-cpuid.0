Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2769D44CF29
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983028; cv=none; b=ut6ANadzzNAXSmfOz/pu8Ek37pTqPAVS3RddulHhbe+HDsCtdYbMLhqVRyNZCyFaT43pVnUgofpSmK1ToTHxmiG+ZNU4o+LxbsOJ4y+2aenTxp6heznRlF5dYbUqvmZpYl12nuv/bE2SQLdOLUNnK639+8x8V3fh16fptaRkmJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983028; c=relaxed/simple;
	bh=WOab32jdw8sm3GN0zq/J40YE7QiEgeUG+RH8k1O31hM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sDIds47EfVChz31UMNs8Oc6pharoEwRyFy3MC9sLHlmUTCItMb6UvtIZMCQG6yuQPh3ethnppvUqVB41wFHMBj0ReNFq26fJ9fRkgLqHbFet5tsoISDwFuQh1+cHPmEzFkHlEiNdEy7NR8eZX4Q523w4NMYSSk7dtJrVUHvLvZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2wCkSEk5; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=/jbF0Mo6; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2wCkSEk5";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="/jbF0Mo6"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Vz6EhzOUrUOcHq6+oVxPxYasPkNQRCkfShP6hvtt90=;
	b=2wCkSEk5PtdtywAeiyhRI97lBRjezZk4oq5NN8tEmXC0DQ1eAMz+gnAoy1gU9U4w1me4Kd
	ti2f7IUmftiUBajfHhDXM6qgHXqPbMd5RjLncO04a7+tvKYHtoxOoyyJKb0gB3SQ1Yzntl
	QYn4RHZ1YgeLN4h+jsrqdyleS3TUxfnQwSGStpFWvwDmisbs+npMbEjTv/66RhsMNCbc5d
	WEM9DViMfxjRvQOoDCQu8qXxM7boh9sE5jYbjGr8t5o0E+3TTOB+pjxM604905/X/xPQzK
	FHVzCk9cxvxd7pKiTgkkCNJ89Jbu0r6+lR920IigzqyDeFgdrsSg1AM6AtSH2g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Vz6EhzOUrUOcHq6+oVxPxYasPkNQRCkfShP6hvtt90=;
	b=/jbF0Mo6u4RZXljtJJPWNqiGsFsbX0XOrvOfSAmtweqrSCNLPxNlZ/RjgfBGim/E0kRSGx
	l/IGEaorh+LGT1BQ==
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
Subject: [PATCH v7 071/120] dmaengine: ioatdma: Use parsed CPUID(0x9)
Date: Thu, 28 May 2026 17:38:33 +0200
Message-ID: <20260528153923.403473-72-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use parsed CPUID(0x9) instead of manual bitwise operations and a direct
CPUID query.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 drivers/dma/ioat/dca.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/dma/ioat/dca.c b/drivers/dma/ioat/dca.c
index 07c977bef5f8..5e9b43b0b6dc 100644
--- a/drivers/dma/ioat/dca.c
+++ b/drivers/dma/ioat/dca.c
@@ -52,25 +52,12 @@ static inline u16 dcaid_from_pcidev(struct pci_dev *pci)
 	return pci_dev_id(pci);
 }
 
-static int dca_enabled_in_bios(struct pci_dev *pdev)
-{
-	/* CPUID level 9 returns DCA configuration */
-	/* Bit 0 indicates DCA enabled by the BIOS */
-	u32 eax;
-	int res;
-
-	eax = cpuid_eax(CPUID_LEAF_DCA);
-	res = eax & BIT(0);
-	if (!res)
-		dev_dbg(&pdev->dev, "DCA is disabled in BIOS\n");
-
-	return res;
-}
-
 int system_has_dca_enabled(struct pci_dev *pdev)
 {
-	if (boot_cpu_has(X86_FEATURE_DCA))
-		return dca_enabled_in_bios(pdev);
+	const struct leaf_0x9_0 *l9 = cpuid_leaf(&boot_cpu_data, 0x9);
+
+	if (l9 && boot_cpu_has(X86_FEATURE_DCA))
+		return l9->dca_enabled_in_bios;
 
 	dev_dbg(&pdev->dev, "boot cpu doesn't have X86_FEATURE_DCA\n");
 	return 0;
-- 
2.54.0

