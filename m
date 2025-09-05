Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4C8350842
	for <x86-cpuid@lists.linux.dev>; Fri,  5 Sep 2025 12:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757074551; cv=none; b=ez/pS8NXWH7bSAa/bm7C32/N1RRZcRiDa5YVpGChdZwe70dPDDB5/+ovCyStGDsEavAP+Tm6MDC+8NvbdbhCq6KkguClrW0fM6MHxKFf1zCGbFJYY0JGSOGMdxMUZpGQNWlRXeCKLyMxBJpY+fzVRkPxLC/DdiF1vgrr+l0tFTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757074551; c=relaxed/simple;
	bh=GZR8RHQZex4Pd9dmQhrZYFm58mezVjJewpqZgR2DRr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RTBtnsBumA03u7RPfozWJtIyuDkWmyFyrCVCpSw4wAixn5dsFBLvrH8hrzyHG/Z7IJIyYe/WHycxNP/7hZsh0shPF7vLVDmVH79qb32sO9yW8ZdMJHQEdhLQuo0CXDLjMJYdsbDi8gfjRmAHemHFvSUeZF6V2uzrP8M5bCZNeIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sA6wyUrS; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dw9LI+fH; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sA6wyUrS";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dw9LI+fH"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1757074548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1FmzRFTeoeh2phfMhf2hDpLbShwrkipDxrnDX8PpCbU=;
	b=sA6wyUrSGqUQaMf+xZvg+C9z8TaT+WN9wlFkDXofdBWPPKfdvOL5aWluNH1RiCeEex0RRo
	ra5BCLjhXlQqSQP6VXK0Mv/8pSo/znJ+ph6yJeRO3OX3qrXjRvPxVwy6s1Kfo2SvPiV6by
	Vr9dIEge9Mku/k8X7IazK3w1SQUOp9aARzyWv2jl5a/uctTv5eMsUzXy9oZbW9Q3pPyiGL
	NFu4FlURrrx/7UCvcmvKYWCYObCUxzA02DklbJi/Di3QFDxDur+7YilRdvCbqgD2n5+wJF
	RWnjKyA7X6CSgoF0MkHNohoz4cXmrCrVcrsAfha5rUJL8cbhGnPhgiF6bZ/Upg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1757074548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1FmzRFTeoeh2phfMhf2hDpLbShwrkipDxrnDX8PpCbU=;
	b=dw9LI+fHlZKkjRPDRVTxpvup1masJHL9QDi91AuHTLc+AXcE4ZRCWWo/ixE8GJ1lBvyK9d
	Q/QyGuraQ6nX8ZCw==
To: Borislav Petkov <bp@alien8.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Sean Christopherson <seanjc@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>,
	x86@kernel.org,
	x86-cpuid@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	"Ahmed S. Darwish" <darwi@linutronix.de>
Subject: [PATCH v5 09/35] x86/cpu: Use parsed CPUID(0x0)
Date: Fri,  5 Sep 2025 14:14:49 +0200
Message-ID: <20250905121515.192792-10-darwi@linutronix.de>
In-Reply-To: <20250905121515.192792-1-darwi@linutronix.de>
References: <20250905121515.192792-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use parsed CPUID(0x0) access instead of a direct CPUID query.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/common.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 43582d7e167d..e081f92ddfe9 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -896,11 +896,12 @@ void get_cpu_vendor(struct cpuinfo_x86 *c)
 
 void cpu_detect(struct cpuinfo_x86 *c)
 {
-	/* Get vendor name */
-	cpuid(0x00000000, (unsigned int *)&c->cpuid_level,
-	      (unsigned int *)&c->x86_vendor_id[0],
-	      (unsigned int *)&c->x86_vendor_id[8],
-	      (unsigned int *)&c->x86_vendor_id[4]);
+	const struct leaf_0x0_0 *l0 = cpuid_leaf(c, 0x0);
+
+	c->cpuid_level = l0->max_std_leaf;
+	*(u32 *)&c->x86_vendor_id[0] = l0->cpu_vendorid_0;
+	*(u32 *)&c->x86_vendor_id[4] = l0->cpu_vendorid_1;
+	*(u32 *)&c->x86_vendor_id[8] = l0->cpu_vendorid_2;
 
 	c->x86 = 4;
 	/* Intel-defined flags: level 0x00000001 */
-- 
2.50.1

