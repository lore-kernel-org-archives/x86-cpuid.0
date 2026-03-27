Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EA1342C8B
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774577897; cv=none; b=lReZhdfc+yPePT7tzQt+jwG/T3IYVUQIvWqcJYth/42Bof+Dhkcso/jYxkCZf49tFWheQ2bLlu70WwWm9YHuVM+PBVtekXOs//Dku4cy5WIkfgLbJpxbFHuXEU1aYfMRO0792ky+miRyWJh9tMz6aF6pXU/esOUrTvnx1CgLdwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774577897; c=relaxed/simple;
	bh=P9YAUtYdj5urdN9dPUySA2hAuE79JDJMW2NoYiUCg9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LVWLE7LqJ4mGRBbOSqbqxH9KIjepX1RMpW8ECUXm5TWibsZ2XgKPdZBpgToyvPgCHsFA9fadYx5YKg/0fV8jn/6Nhu1ySHRU8fg3pdsa+nXoAvI+bD8GpwBSZpPp+tJMrFS4R8nNwUmJJAzfi8GoFpDxzwJzjNYGUKFt65g5jA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CP2XDUOg; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=mti8DVLv; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CP2XDUOg";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mti8DVLv"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774577895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7roSgOj05IZXWacocQOMFvbLhRshT9TcVnmRsVuI+UY=;
	b=CP2XDUOg9MXmzne8JX8ORCLPUN3K651F07txE7VM3nWQizSNraO461CbBvNGDoi6WexFTQ
	ZZkkZgiYRA4dG+9srbbSUnrzwoYZBx+kbCuK3PZMaybNMYwEWX4WIeg0SGUPyV081/y2eV
	HgfEm+FS06JHg/hKBQtX4ZmyrubCK0pRvzIKLDKrnh3ulQd7b3WODvev9Dzl8/pBzfRod9
	HuURtj0kzt+80ZON37t3VFrAHf496mrihCY7RClpN/mZywdodXFWe8ARD9MfIapuluw57j
	Bj6T3CBEsoJKRVGa1RIQPpgPAnyZpbSqiUyUX166zUVy/W+om/JBL84ReGgw0Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774577895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7roSgOj05IZXWacocQOMFvbLhRshT9TcVnmRsVuI+UY=;
	b=mti8DVLvj6Crzl75nkJExY8qjFeBGXcWuNw5FbKmUZtYlSR1tMwQqGR1UybUpGX/HrNQJM
	uQ0AeVSp7drFKcBg==
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
Subject: [PATCH v6 15/90] x86/lib: Add CPUID(0x1) family and model calculation
Date: Fri, 27 Mar 2026 03:15:29 +0100
Message-ID: <20260327021645.555257-16-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The x86 library provides x86_family() and x86_model().  They take raw
CPUID(0x1) register output and calculate the CPU family and model from it.

In follow-up work, the x86 subsystem will use parsed CPUID APIs instead of
invoking direct CPUID queries.  These new APIs force using the auto
generated leaf data types at <asm/cpuid/leaf_types.h>.

Introduce x86 family and model calculation functions that take these
auto-generated data types.  Refactor the original code so that no logic is
duplicated.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpu.h |  6 +++++
 arch/x86/lib/cpu.c         | 45 ++++++++++++++++++++++++--------------
 2 files changed, 35 insertions(+), 16 deletions(-)

diff --git a/arch/x86/include/asm/cpu.h b/arch/x86/include/asm/cpu.h
index ad235dda1ded..90902cd91335 100644
--- a/arch/x86/include/asm/cpu.h
+++ b/arch/x86/include/asm/cpu.h
@@ -7,7 +7,9 @@
 #include <linux/topology.h>
 #include <linux/nodemask.h>
 #include <linux/percpu.h>
+
 #include <asm/ibt.h>
+#include <asm/cpuid/leaf_types.h>
 
 #ifndef CONFIG_SMP
 #define cpu_physical_id(cpu)			boot_cpu_physical_apicid
@@ -25,6 +27,10 @@ int mwait_usable(const struct cpuinfo_x86 *);
 unsigned int x86_family(unsigned int sig);
 unsigned int x86_model(unsigned int sig);
 unsigned int x86_stepping(unsigned int sig);
+
+unsigned int cpuid_family(const struct leaf_0x1_0 *l);
+unsigned int cpuid_model(const struct leaf_0x1_0 *l);
+
 #ifdef CONFIG_X86_BUS_LOCK_DETECT
 extern void __init sld_setup(struct cpuinfo_x86 *c);
 extern bool handle_user_split_lock(struct pt_regs *regs, long error_code);
diff --git a/arch/x86/lib/cpu.c b/arch/x86/lib/cpu.c
index 7ad68917a51e..4d0beeeb4885 100644
--- a/arch/x86/lib/cpu.c
+++ b/arch/x86/lib/cpu.c
@@ -1,33 +1,36 @@
 // SPDX-License-Identifier: GPL-2.0-only
 #include <linux/types.h>
 #include <linux/export.h>
+
 #include <asm/cpu.h>
+#include <asm/cpuid/leaf_types.h>
 
-unsigned int x86_family(unsigned int sig)
+static unsigned int __x86_family(unsigned int base_fam, unsigned int ext_fam)
 {
-	unsigned int x86;
+	if (base_fam == 0xf)
+		base_fam += ext_fam;
 
-	x86 = (sig >> 8) & 0xf;
+	return base_fam;
+}
 
-	if (x86 == 0xf)
-		x86 += (sig >> 20) & 0xff;
+static unsigned int
+__x86_model(unsigned int family, unsigned int base_model, unsigned int ext_model)
+{
+	if (family >= 0x6)
+		base_model |= ext_model << 4;
 
-	return x86;
+	return base_model;
+}
+
+unsigned int x86_family(unsigned int sig)
+{
+	return __x86_family((sig >> 8) & 0xf, (sig >> 20) & 0xff);
 }
 EXPORT_SYMBOL_GPL(x86_family);
 
 unsigned int x86_model(unsigned int sig)
 {
-	unsigned int fam, model;
-
-	fam = x86_family(sig);
-
-	model = (sig >> 4) & 0xf;
-
-	if (fam >= 0x6)
-		model += ((sig >> 16) & 0xf) << 4;
-
-	return model;
+	return __x86_model(x86_family(sig), (sig >> 4) & 0xf, (sig >> 16) & 0xf);
 }
 EXPORT_SYMBOL_GPL(x86_model);
 
@@ -36,3 +39,13 @@ unsigned int x86_stepping(unsigned int sig)
 	return sig & 0xf;
 }
 EXPORT_SYMBOL_GPL(x86_stepping);
+
+unsigned int cpuid_family(const struct leaf_0x1_0 *l)
+{
+	return __x86_family(l->base_family_id, l->ext_family);
+}
+
+unsigned int cpuid_model(const struct leaf_0x1_0 *l)
+{
+	return __x86_model(cpuid_family(l), l->base_model, l->ext_model);
+}
-- 
2.53.0

