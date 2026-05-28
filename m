Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8463F0745
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982791; cv=none; b=s9rT2alLgzdzcYKdswUCn/h7Uh1opHnRsCgRkN4x9Rjp5D+19XwXVV816V94KLsK27raMVlH+J4ou+G/k7yKvNh4XnXawQw3zSM78EA8rlFehukdZPpTl5tKcHhtjeW4dxWp8/LBsIym20MbDUG6pNIKVdQSiME05O26t9JsTg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982791; c=relaxed/simple;
	bh=5MNiV//yLnTfWQdKAEIU0TaOYqq4CvGA1IxNYDd1uoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sdP+BGZoCz5xn3CcaKFMGKYnK2CTou0p4WKrG2n8+Sy0vNCDj8DABm+dVDGlK+lFhA3NjpskJ/3IbYzZjCa8SWkrBSiHqd/b10eMIcpR3ZjAQIhbEbAGJ8AzAGRhMF42GhPL9ulsJ981a94WPEvadA11XW2tVPJVIajSQ7+Jov8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=QcxhrseW; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Rz1Y8ilj; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QcxhrseW";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Rz1Y8ilj"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PM1swt867eWt9MTI12IENI13z/LP2kaeLFO5PfqEbPs=;
	b=QcxhrseWIKAvw8NVEXY1WfU8vqXgjbooVNHKut4oAsEIiT81zu6GbUHOAmGMoUDJGZ+2cb
	b/BBvkWMOUPs2TD7cBi0SfFeYi0F1Uo21EZcHPbEOcceVcO5HhLGy2kTmN5XS6opxh6Lgv
	gBg45dcDafuLpB/Iff5+wMFYJ4ghir6q+f7HS6CbSwfXSK1/Yn30yHKj+J5Cf/PLAWVzPG
	pwlq3pbwDHgNawXtIGwahfgrQ9okxOeTSB3udL9dXErbSuraKb+efqAkVjAlm+J8BsOKBb
	YlIq5QvdzKce8iM9DZcqEQQpBGPmCZspiIOEAJvOaL53oXgmb+6nhQrID4VtBw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PM1swt867eWt9MTI12IENI13z/LP2kaeLFO5PfqEbPs=;
	b=Rz1Y8ilj9kkRiGfCf0pSmyT1b0/okxR/6PtJH4qf4i6wdUwksSwBl/hKQ15Hr4xG7M4WRv
	poFNuDJIebwX2YCA==
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
Subject: [PATCH v7 003/120] x86/cpuid: Rename cpuid_leaf()/cpuid_subleaf() APIs
Date: Thu, 28 May 2026 17:37:25 +0200
Message-ID: <20260528153923.403473-4-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A new CPUID model will be added where its APIs will be designated as the
official CPUID API.  Free the cpuid_leaf() and cpuid_subleaf() function
names for that API.  Rename them accordingly to cpuid_read() and
cpuid_read_subleaf().

For kernel/cpuid.c, rename its local file operations read function from
cpuid_read() to cpuid_read_f() so that it does not conflict with the new
API.

No functional change.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Link: https://lore.kernel.org/20260327021645.555257-1-darwi@linutronix.de
---
 arch/x86/include/asm/cpuid/api.h   | 6 +++---
 arch/x86/kernel/cpu/topology_amd.c | 2 +-
 arch/x86/kernel/cpu/topology_ext.c | 2 +-
 arch/x86/kernel/cpuid.c            | 5 ++---
 4 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/arch/x86/include/asm/cpuid/api.h b/arch/x86/include/asm/cpuid/api.h
index 44fa82e1267c..2b9750cc8a75 100644
--- a/arch/x86/include/asm/cpuid/api.h
+++ b/arch/x86/include/asm/cpuid/api.h
@@ -131,12 +131,12 @@ static inline void __cpuid_read(u32 leaf, u32 subleaf, u32 *regs)
 	__cpuid(regs + CPUID_EAX, regs + CPUID_EBX, regs + CPUID_ECX, regs + CPUID_EDX);
 }
 
-#define cpuid_subleaf(leaf, subleaf, regs) {		\
+#define cpuid_read_subleaf(leaf, subleaf, regs) {	\
 	static_assert(sizeof(*(regs)) == 16);		\
 	__cpuid_read(leaf, subleaf, (u32 *)(regs));	\
 }
 
-#define cpuid_leaf(leaf, regs) {			\
+#define cpuid_read(leaf, regs) {			\
 	static_assert(sizeof(*(regs)) == 16);		\
 	__cpuid_read(leaf, 0, (u32 *)(regs));		\
 }
@@ -228,7 +228,7 @@ static inline u32 cpuid_base_hypervisor(const char *sig, u32 leaves)
  */
 static inline void cpuid_leaf_0x2(union leaf_0x2_regs *regs)
 {
-	cpuid_leaf(0x2, regs);
+	cpuid_read(0x2, regs);
 
 	/*
 	 * All Intel CPUs must report an iteration count of 1.	In case
diff --git a/arch/x86/kernel/cpu/topology_amd.c b/arch/x86/kernel/cpu/topology_amd.c
index cc103c85b96d..da080d732e10 100644
--- a/arch/x86/kernel/cpu/topology_amd.c
+++ b/arch/x86/kernel/cpu/topology_amd.c
@@ -80,7 +80,7 @@ static bool parse_8000_001e(struct topo_scan *tscan)
 	if (!boot_cpu_has(X86_FEATURE_TOPOEXT))
 		return false;
 
-	cpuid_leaf(0x8000001e, &leaf);
+	cpuid_read(0x8000001e, &leaf);
 
 	/*
 	 * If leaf 0xb/0x26 is available, then the APIC ID and the domain
diff --git a/arch/x86/kernel/cpu/topology_ext.c b/arch/x86/kernel/cpu/topology_ext.c
index eb915c73895f..60dfaa02ffd0 100644
--- a/arch/x86/kernel/cpu/topology_ext.c
+++ b/arch/x86/kernel/cpu/topology_ext.c
@@ -71,7 +71,7 @@ static inline bool topo_subleaf(struct topo_scan *tscan, u32 leaf, u32 subleaf,
 	default: return false;
 	}
 
-	cpuid_subleaf(leaf, subleaf, &sl);
+	cpuid_read_subleaf(leaf, subleaf, &sl);
 
 	if (!sl.num_processors || sl.type == INVALID_TYPE)
 		return false;
diff --git a/arch/x86/kernel/cpuid.c b/arch/x86/kernel/cpuid.c
index cbd04b677fd1..b55fe9c7359a 100644
--- a/arch/x86/kernel/cpuid.c
+++ b/arch/x86/kernel/cpuid.c
@@ -59,8 +59,7 @@ static void cpuid_smp_cpuid(void *cmd_block)
 	complete(&cmd->done);
 }
 
-static ssize_t cpuid_read(struct file *file, char __user *buf,
-			  size_t count, loff_t *ppos)
+static ssize_t cpuid_read_f(struct file *file, char __user *buf, size_t count, loff_t *ppos)
 {
 	char __user *tmp = buf;
 	struct cpuid_regs_done cmd;
@@ -120,7 +119,7 @@ static int cpuid_open(struct inode *inode, struct file *file)
 static const struct file_operations cpuid_fops = {
 	.owner = THIS_MODULE,
 	.llseek = no_seek_end_llseek,
-	.read = cpuid_read,
+	.read = cpuid_read_f,
 	.open = cpuid_open,
 };
 
-- 
2.54.0

