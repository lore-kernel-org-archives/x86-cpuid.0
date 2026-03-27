Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A93331218
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774577868; cv=none; b=f6656rF+OIRY+DOKN0Xo3/SzLfoswVPo0Bo9hC2h0iIKOmodYMpaVNZd+I4pCcKUxbAoZSIbJLeh/RntCbyZ0sDKEmsQuJaHq4NLyzn4B9ijyDy2ElUoT0S5UDTe1Y70yXDURh8QmuQ4fxNW5bZ9LNmEyXdyOQf8JPUerr7S6do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774577868; c=relaxed/simple;
	bh=EsBHQYK6+5al2u+eK+rXHdnfCVMU0JWkDjtPoocw2Ac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CpvOULwFJny0SveHAqqD0nF/nCAV4pindpwyigt1ZDT1uWzPueUzZ0zfaWlhbpQ75Ri+EAcUJm5PXrG0Iq/KAOhuxTpirg/IJuus4/GMgZKDHtlrfheYI/tDJBwBx3Rw4EKZ9eWeHX8FxMMAKoQNETIFk35Knuny+1lyb0ClFJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zaEE313e; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=8NWbH8RP; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zaEE313e";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="8NWbH8RP"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774577865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9tjJwbIpAvJLZM6ERmV+GrAOiDL8jHN5NYfWYPm7crU=;
	b=zaEE313eO71lF5IJuAEz9461isge04JNn3JPt2NVFPAClpJ7vYgdXiklzhR41vscwZgBX0
	dERaZ7j0hWuzofQROoArN0jQhTRbQyvSOGaqT8+zFi50gKvjS1kHp/QSm1B7RRSo0KpG1S
	ly3YgSOwW22dHO84nkDVCB73l0z4RYejkjVqvg46DdL/bL0HXeE4nOgn8XwrUpYHdzm9W+
	dwBDtKyyYS9HbtRdXlQL43PNfghPV7XeHLRclYZ4jBVKRa1mwHOOGhXH8PLCTDGXWZKrR+
	7CFZaBx1wznWS8ZsP8Ds8OmaaekER9ysA/UOkdx06lqIXYJhnOhIxfl7TROJoA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774577865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9tjJwbIpAvJLZM6ERmV+GrAOiDL8jHN5NYfWYPm7crU=;
	b=8NWbH8RP3UcuVBkTDob1LU4ozPv5/6e29ZSLS4mezLDZ6D24FXU+N1QMJbWRHezGgdSprA
	JAbxBxGsxmR7RRAg==
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
Subject: [PATCH v6 06/90] x86/cpuid: Rename cpuid_leaf()/cpuid_subleaf() APIs
Date: Fri, 27 Mar 2026 03:15:20 +0100
Message-ID: <20260327021645.555257-7-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
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
2.53.0

