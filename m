Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F69A43C061
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982975; cv=none; b=u3WE5ifDCGc1ZG5WTDk2mesw+z3ORdqLVJ0mr1Gf8EghL1Cs+9dwiWFBOFtz6As/2ptsu1vc+aqDSX0PmCYhikm9iI6sBxvOqbWrLsizyRkFvgwoVjiC49nUREN34wPykXlPhyydp6dqkYUs/p+xuKd7IZtFSrGgjh0Yce4j7os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982975; c=relaxed/simple;
	bh=M1FfwpmHGvkUWxsr3uPbna8zV//R1dZn4K/pzKppGTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lpIxNuqAJ46MWUskAenqneWExXCgy57yMrKLKfkLvCQBi4+PzVExIhdB3A3qtzeTuGNu+/UBw46JtmxZNiI1K9505CoOlLUhm3uTStVjJLkKpxECvsyTusq72VvvSRi6WHfG9+MdDBzTOIKYKZEUL1QJZLAa0vUX8Z9jcl8oMFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jWIQjF3L; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=oMfvtdtW; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jWIQjF3L";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="oMfvtdtW"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xKAWjziCCTKGcDvNT4l2z03TJf8ssVK695haTJMaG3A=;
	b=jWIQjF3L2RcYQEtwYbj1ytlzdMaTsC7jidsWSJ3yHGjdjtkUEPIrVrUzyCuJ+vAr4bOXUe
	67+iBQBqzlwLI37fI8vftE7tSbxFWrhTjJoWgbwJ9vgVTRWey4AsIjReyOlNBurPKITsMe
	g4TeDkQZRd3gwBiAq7vkRBl2NXhXHS09gemM7zxEpv+m7Gk5J9xnVkNm0fW4JthhLq+ZNX
	CaR45RfqU/6tJfinZD9YLn3OUlBi39X+di9hOagLhtkmc/0lV8VK57VBk3dmMNZs2BVs6d
	AdVaHyWBHNac9y+SSCR3NBCsautz2NNOUdqM1yHZKXpgBeAeLxqZGfSMoPyiAQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xKAWjziCCTKGcDvNT4l2z03TJf8ssVK695haTJMaG3A=;
	b=oMfvtdtW5iwvgsMlxWwhrs92K/ELk+Tnz4ZpjCl/6jH4eKTf8LCTdwI7XzQXeP6NHp/UuC
	ljh/T7X61grvsCAQ==
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
Subject: [PATCH v7 055/120] x86/xen: Use standard CPUID(0x1) types
Date: Thu, 28 May 2026 17:38:17 +0200
Message-ID: <20260528153923.403473-56-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For early Xen init code, use x86-cpuid-db's CPUID(0x1) C99 data types
instead of doing manual bitwise operations.

Note, CPUID APIs like cpuid_leaf() cannot be used here since the CPUID
tables are filled using paravirt __cpuid() instead of native CPUID.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/xen/enlighten_pv.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 4883d6095436..3f9e90d3784e 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -303,9 +303,14 @@ static bool __init xen_check_mwait(void)
 		.u.set_pminfo.id	= -1,
 		.u.set_pminfo.type	= XEN_PM_PDC,
 	};
-	uint32_t buf[3];
 	unsigned int ax, bx, cx, dx;
-	unsigned int mwait_mask;
+	union {
+		struct cpuid_regs	r;
+		struct leaf_0x1_0	l;
+	} c1 = {
+		.r.eax = 1,
+	};
+	uint32_t buf[3];
 
 	/* We need to determine whether it is OK to expose the MWAIT
 	 * capability to the kernel to harvest deeper than C3 states from ACPI
@@ -325,15 +330,8 @@ static bool __init xen_check_mwait(void)
 	if (!xen_running_on_version_or_later(4, 2))
 		return false;
 
-	ax = 1;
-	cx = 0;
-
-	native_cpuid(&ax, &bx, &cx, &dx);
-
-	mwait_mask = (1 << (X86_FEATURE_EST % 32)) |
-		     (1 << (X86_FEATURE_MWAIT % 32));
-
-	if ((cx & mwait_mask) != mwait_mask)
+	native_cpuid(&c1.r.eax, &c1.r.ebx, &c1.r.ecx, &c1.r.edx);
+	if (!c1.l.est || !c1.l.monitor)
 		return false;
 
 	/* We need to emulate the MWAIT_LEAF and for that we need both
-- 
2.54.0

