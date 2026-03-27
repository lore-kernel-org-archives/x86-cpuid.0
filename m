Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FEDB35A927
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774577947; cv=none; b=F2sZYvqUP9Z2a8fF9nKjVcbBz2GutKtDVdQx4xB/lXiEhV1ff6xq/zDMRtRG7lfXmjpBu6EooWgVGxHO02WhvDKCOPbgFd4ZIxydX0VryfsrDDaXRJDFqrFtPFNOIBI4iDnG83McvCj2EdXAmqDwfoYJ8j7C9g90SunhIXOEzlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774577947; c=relaxed/simple;
	bh=IgI6mqDx6hhkfh2ojGvQfk9B8G/7cl48dQ2Q6H6JkKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RaG/180cY5pBVNR6GvA/kKjBqRHSx1e+/dTyen1pDH5xIB8ly831uPHz8g2oNbGPVqjLbHkkuw8r8C7mbzGSZtkByZTwHPj9U8Mu+LiupE8N4lU3QHpl/anOrkCN4iKrC8NQ1rXqx+RjWD2ok8ZvngQe6shrYbQj4Uvt6PuAZdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VeXj0Qha; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3wXPN0i1; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VeXj0Qha";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3wXPN0i1"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774577944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x5TbfFLlOH7lWdPUYQq4CSUrTzKjrQx+hcGKkgKvmXM=;
	b=VeXj0QhaMaQu8+1tz052iTkK30iBSi5mwVek199T0DRa4kbpsx1YhLp7io3VMqNcq5rczg
	u6blk4fP7LlG7rTNf9oFsetmZoROp8QTx2VS9AuAnxSeM7wSim2jqhVTTVCY4n5ovhnSnm
	gTf4iSxboWyFSxi2NviTU2xCD/ll3dVt/uI+dAAZsiu1gmlzrSbL4hbK5yNzDYHSpdT0JK
	bhQC+HQ2LbXPKxmSG1Mo4z7S3txeD5anxBPgM1Em3/AZ3hCisOiTGxpXDTh+pnA4rNcxDD
	kQq+CscBxQkzCpIYBoYyNAKDnoOiOgGGXXoEm5TB+NyUlJMYFoaAEBSk3jNA8Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774577944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x5TbfFLlOH7lWdPUYQq4CSUrTzKjrQx+hcGKkgKvmXM=;
	b=3wXPN0i1EnOWiBVNfH72V6B6aLCSwOryM9FJBw7gEY65i35f4JM6kROFu152CjA3yZz0qV
	QVdpZRp9J6jqhWAA==
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
Subject: [PATCH v6 29/90] x86/cpu: zhaoxin: Use parsed CPUID(0xc0000001)
Date: Fri, 27 Mar 2026 03:15:43 +0100
Message-ID: <20260327021645.555257-30-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use parsed CPUID(0xc0000001).

Beside the CPUID parser centralization benefits, this allows using the
auto-generated x86-cpuid-db data types, and their full C99 bitfields,
instead of doing ugly bitwise operations on the CPUID output.

Keep the x86_capability[] CPUID(0xc0000001).EDX assignment.  It will be
removed once X86_FEATURE translation is integrated into the CPUID model.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/zhaoxin.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/arch/x86/kernel/cpu/zhaoxin.c b/arch/x86/kernel/cpu/zhaoxin.c
index 55bc656aaa95..ea76e9594453 100644
--- a/arch/x86/kernel/cpu/zhaoxin.c
+++ b/arch/x86/kernel/cpu/zhaoxin.c
@@ -11,35 +11,26 @@
 
 #define MSR_ZHAOXIN_FCR57 0x00001257
 
-#define ACE_PRESENT	(1 << 6)
-#define ACE_ENABLED	(1 << 7)
 #define ACE_FCR		(1 << 7)	/* MSR_ZHAOXIN_FCR */
-
-#define RNG_PRESENT	(1 << 2)
-#define RNG_ENABLED	(1 << 3)
 #define RNG_ENABLE	(1 << 8)	/* MSR_ZHAOXIN_RNG */
 
 static void init_zhaoxin_cap(struct cpuinfo_x86 *c)
 {
-	u32  lo, hi;
-
-	/* Test for Extended Feature Flags presence */
-	if (cpuid_eax(0xC0000000) >= 0xC0000001) {
-		u32 tmp = cpuid_edx(0xC0000001);
+	const struct leaf_0xc0000001_0 *l1 = cpuid_leaf(c, 0xc0000001);
+	u32 lo, hi;
 
+	if (l1) {
 		/* Enable ACE unit, if present and disabled */
-		if ((tmp & (ACE_PRESENT | ACE_ENABLED)) == ACE_PRESENT) {
+		if (l1->ace && !l1->ace_en) {
 			rdmsr(MSR_ZHAOXIN_FCR57, lo, hi);
-			/* Enable ACE unit */
 			lo |= ACE_FCR;
 			wrmsr(MSR_ZHAOXIN_FCR57, lo, hi);
 			pr_info("CPU: Enabled ACE h/w crypto\n");
 		}
 
 		/* Enable RNG unit, if present and disabled */
-		if ((tmp & (RNG_PRESENT | RNG_ENABLED)) == RNG_PRESENT) {
+		if (l1->rng && !l1->rng_en) {
 			rdmsr(MSR_ZHAOXIN_FCR57, lo, hi);
-			/* Enable RNG unit */
 			lo |= RNG_ENABLE;
 			wrmsr(MSR_ZHAOXIN_FCR57, lo, hi);
 			pr_info("CPU: Enabled h/w RNG\n");
-- 
2.53.0

