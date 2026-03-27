Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7566390234
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774578144; cv=none; b=tBVcbHmvAXGsK/gRRuFgarjtfxOnuKALSMaQ3gV1QfLY/msZ540pqwFd0TvhiM41sH/JSVFDvaKrmJlg/wsDek8PSHXIkzKgVEiOjMuooUuc7R+Or9joXF2K0ajlrWv1slNMqoee3D0FEdhePPtuAteOobWMya2z7czrwk+oOSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774578144; c=relaxed/simple;
	bh=6u56gGqiFSlQULYqPbCpUcByvv1U0v2TQGZ0PDDjEPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d+/4PX2OxEX3OZfLON7fg9+X3M3BSTL4HWvWAuya9CscwyJ6ukKFSrX/N9kNcdArDlwkF0wVUgCv7IiJbkMeGVLHrhD8Tt/yBBckQoOSDYnZSTe1NWlBS/cK1kEEqLrW17ug19FfC0FEeyU7Br0bSIzZsMbgJCiEMem5crOLqO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Tc9hRJhR; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GZqaPIE8; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Tc9hRJhR";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GZqaPIE8"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774578141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nogm5q6qL3g3b88oQZo4xUElLYtXMg5vbQCEYRgKNiI=;
	b=Tc9hRJhR01hcAKRMeJRY8fGLhRCe+qR5JItwl/zCWHY1RAf9EzWLIvpp2+RdT2mo7osZOq
	Uq3l+kQ8eIWcQSzmPn+/Lc6MRfIIk1kdMmk3udP6mi5xTPsbxd/ynXZZNEF6PvUtBMRN8P
	tc/jU2/wXgEUaqfn0lT1vcY3dr0GltjzZZON8oeOX93humuFX33rlLuybW1xejuYovL9AH
	WGn4HNZkgbZ/hN75oQKWItO41L4TwH3D8RIILM67shXmg4yD104+dh+IMD+/rIgmCAhy61
	IXH6yIf4+beRd4qDzzxfqVuq3WJ5gWG2x4tmiAV6LSGpdPb+WB3vjarcRqsuwg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774578141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nogm5q6qL3g3b88oQZo4xUElLYtXMg5vbQCEYRgKNiI=;
	b=GZqaPIE8SnDvpT30ORPZFMoVvrtMcBfZ12Qb6qeeDCse9kZQ5O+CH6fKxISDS9WXwH3T6I
	lCVFNK5twNdhYlBQ==
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
Subject: [PATCH v6 83/90] x86/asm/32: Cache CPUID(0x1).EDX in cpuid_table
Date: Fri, 27 Mar 2026 03:16:37 +0100
Message-ID: <20260327021645.555257-84-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The x86-32 early boot code initializes new_cpu_data from the boot CPU and
stores CPUID(0x1).EDX in cpuinfo_x86::x86_capability[].

Introduce the CPUINFO_CPUID_0x1_EDX asm-offset, and store %edx in the
cached CPUID table entry for new_cpu_data.  This prepares for the removal
of cpuinfo_x86::x86_capability[].

Note that the definition of CPUINFO_CPUID_0x1_EDX is much more complex than
X86_CAPABILITY, even though both are used as:

    movl $1,%eax
    cpuid
    ...
    movl %edx,X86_CAPABILITY
    movl %edx,CPUINFO_CPUID_0x1_EDX

This is because CPUID(0x1).EDX is conveniently the first word of
cpuinfo_x86::x86_capability[], but not of cpuinfo_x86::cpuid_table.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/asm-offsets.c | 5 +++++
 arch/x86/kernel/head_32.S     | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/arch/x86/kernel/asm-offsets.c b/arch/x86/kernel/asm-offsets.c
index 081816888f7a..0bc36d617801 100644
--- a/arch/x86/kernel/asm-offsets.c
+++ b/arch/x86/kernel/asm-offsets.c
@@ -40,6 +40,11 @@ static void __used common(void)
 	OFFSET(CPUINFO_cpuid_level, cpuinfo_x86, cpuid_level);
 	OFFSET(CPUINFO_x86_capability, cpuinfo_x86, x86_capability);
 	OFFSET(CPUINFO_x86_vendor_id, cpuinfo_x86, x86_vendor_id);
+	DEFINE(CPUINFO_CPUID_0x1_EDX,
+	       offsetof(struct cpuinfo_x86, cpuid)		+
+	       offsetof(struct cpuid_table, leaves)		+
+	       offsetof(struct cpuid_leaves, leaf_0x1_0)	+
+	       offsetof(struct cpuid_regs, edx));
 
 	BLANK();
 	OFFSET(TASK_threadsp, task_struct, thread.sp);
diff --git a/arch/x86/kernel/head_32.S b/arch/x86/kernel/head_32.S
index 80ef5d386b03..6dcc27014641 100644
--- a/arch/x86/kernel/head_32.S
+++ b/arch/x86/kernel/head_32.S
@@ -43,6 +43,7 @@
 #define X86_CPUID	new_cpu_data+CPUINFO_cpuid_level
 #define X86_CAPABILITY	new_cpu_data+CPUINFO_x86_capability
 #define X86_VENDOR_ID	new_cpu_data+CPUINFO_x86_vendor_id
+#define X86_FEATUREFLAG	new_cpu_data+CPUINFO_CPUID_0x1_EDX
 
 /*
  * Worst-case size of the kernel mapping we need to make:
@@ -263,6 +264,7 @@ SYM_FUNC_START(startup_32_smp)
 	andb $0x0f,%cl		# mask mask revision
 	movb %cl,X86_STEPPING
 	movl %edx,X86_CAPABILITY
+	movl %edx,X86_FEATUREFLAG
 
 .Lis486:
 	movl $0x50022,%ecx	# set AM, WP, NE and MP
-- 
2.53.0

