Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDC833688A
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774577901; cv=none; b=Hbii+NjxVVx9NQaJWG9O5XCPDHbwbQO4r2leZN8zmoMNBRuMC1saTwb8eNPsuOGmVYtIBvHgle+bozbIvn8x0bjdXMAshhhC/QFGVIHTAzjgUrfKJrc6K2PMRhVO87lCGCkRzBurS0vVcrulI2sObNDBe+ZZETNOa7KuovhuCUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774577901; c=relaxed/simple;
	bh=yZO3oyNgwkBjST8DL5nHJzVtgcaS/J5bZ4XGO4xatOg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KIAa0//dtfLeufhFI+JtACVmjHlKoX9i6oEORQGkppEepeagARpLrA9Qk1fahcIyBHXdjjmGYL7Quz9o9kCSDmUUtmNSZM6nvIrfNFyAnXNRohLy/Ozkyf38YWPZF3IBnlksgMSCjxBunNpl2Nw9CloQqsdQTTX2U+AENH5wDt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=d67wuFpk; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=oXOjZiRp; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="d67wuFpk";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="oXOjZiRp"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774577898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ooFMpDZikzJTmqCKLxnHYNVV/Cyv2iG4aFci2pBjaQw=;
	b=d67wuFpk7rKNa+dlvkILauEcsc5nIUcqheqe/0TILFUy5FRji3+w8w8Urhv6FGSOEE7kw/
	V1QQkNSzQ0zdiG4RNEWdcWqwcuvaO7uZIFp113INDtGncvKLMca16i7RuChoM2E7ZIWnm4
	livzXpULmyxurFIYgBZRX6f4BnbCcOIvEXDXZz6cuwMqXvbxNcM12/OAMG/XycC0AaO1eW
	j/3A0B7xrjw/mFZz/fu3tQ69ePHH1LVUlZhpBy7MMdF9yRg0qTWOoNn6WBEnkJPkWc1D0G
	2YrXejVFtbOCooOC+ED2ejoBAF7hkG+60xXmHcBWnfLVXxxz1yWNDa2TCI9cjw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774577898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ooFMpDZikzJTmqCKLxnHYNVV/Cyv2iG4aFci2pBjaQw=;
	b=oXOjZiRpK+hxE/hmGgcy5O+LincDm1wmpauY9ZxGa86zWBbe+c0QGohCpv5EihnJRdTIZV
	6Q/bki5NlE+aqiAw==
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
Subject: [PATCH v6 16/90] x86/cpu: Use parsed CPUID(0x1)
Date: Fri, 27 Mar 2026 03:15:30 +0100
Message-ID: <20260327021645.555257-17-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On early boot CPU detection, use parsed CPUID(0x1) instead of a direct
CPUID query.

Beside the parser's centralization benefits, this allows using the auto
generated CPUID data types, and their C99 bitfields, instead of doing ugly
bitwise operations.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/common.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 882754f10a4f..f31746c216c9 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -941,6 +941,7 @@ void get_cpu_vendor(struct cpuinfo_x86 *c)
 void cpu_detect(struct cpuinfo_x86 *c)
 {
 	const struct leaf_0x0_0 *l0 = cpuid_leaf(c, 0x0);
+	const struct leaf_0x1_0 *l1 = cpuid_leaf(c, 0x1);
 
 	if (!l0)
 		return;
@@ -951,17 +952,13 @@ void cpu_detect(struct cpuinfo_x86 *c)
 	*(u32 *)&c->x86_vendor_id[8] = l0->cpu_vendorid_2;
 
 	c->x86 = 4;
-	/* Intel-defined flags: level 0x00000001 */
-	if (c->cpuid_level >= 0x00000001) {
-		u32 junk, tfms, cap0, misc;
-
-		cpuid(0x00000001, &tfms, &misc, &junk, &cap0);
-		c->x86		= x86_family(tfms);
-		c->x86_model	= x86_model(tfms);
-		c->x86_stepping	= x86_stepping(tfms);
+	if (l1) {
+		c->x86		= cpuid_family(l1);
+		c->x86_model	= cpuid_model(l1);
+		c->x86_stepping	= l1->stepping;
 
-		if (cap0 & (1<<19)) {
-			c->x86_clflush_size = ((misc >> 8) & 0xff) * 8;
+		if (l1->clflush) {
+			c->x86_clflush_size = l1->clflush_size * 8;
 			c->x86_cache_alignment = c->x86_clflush_size;
 		}
 	}
-- 
2.53.0

