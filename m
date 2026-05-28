Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A137480333
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983164; cv=none; b=koUIy2cLeZDpM5cKl0FQLNTJwYajVyxKZwNVWKa0UPRWIxkJkKBizYXJ9dnUQ9p9g45R41uyehpwEfx4/HylxWwoUJ4ph0syQdDFLQLlTYMhfXpc2xalsi/9e8/dLBgovQTfm5idx89U1zyCdgFTzyd7RqmTgXBr+Ne7KuLCq2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983164; c=relaxed/simple;
	bh=v5dEQN/5OtFimdbi2W5aWc3hjPbjR04LM+TQb5t8uWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nwjadx7ykH5wovTNijMTeiYhvnvp4lmRzUN7T60Bcju+vZfB+s+ZfKYM5PuyXNokkcUips8Ffg8t3TEP62XsPkbn4CHn92ZtF31Q6P8mhOrS97V3lgSlLiHi1FfrTsiIeBKGFAUobGf/rm3YwWatTaTwSH/9I8/zl2K5TC1TLGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xDnt6ySv; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=QgssBaBn; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xDnt6ySv";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QgssBaBn"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983159;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VoTSC6BEeBdJZhx5ZUeoYzL3q1EhGIOH0U60+M3kJmk=;
	b=xDnt6ySvdDAHIGPGUaiPHyCtqOEHraWEI8j5VYjBi7uyKnhwNdzgPjljfDN9Za0LRWmf5T
	U+Rknat25CvdkP4oqt9DJqrty5WO5rKsjeBQH2dIZMfq1Mpya0eyiaAhoWj9HwFeadN/pu
	HUB1LKyvzC23ZbBnbrgwxBZRPcJcYLZv8k6N24LSphULL6WOzV44fyITDYxpsR+F6xis/3
	APHgZNStP+Shpz6moigAZ2HW/ekEGj3XIdOyLZvb/o2fOL8jgqIypTRpPD6HQMfNm2nht1
	U6u5im4N3bWsc8uaC3YdfGgjZMoAldxFveQHKEGNBIfizPISgo4Hq12CixomBA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983159;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VoTSC6BEeBdJZhx5ZUeoYzL3q1EhGIOH0U60+M3kJmk=;
	b=QgssBaBnNYG790nxeoSyKAYt+RdeIgWxyRHgobwh9kXiuxwXKosrhOJ0k8ybRCFo2I9FBN
	phxTyoflDjXVBJAA==
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
Subject: [PATCH v7 113/120] x86/asm/32: Cache CPUID(0x1).EDX in cpuid_table
Date: Thu, 28 May 2026 17:39:15 +0200
Message-ID: <20260528153923.403473-114-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
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
index 5171cb746444..9c96fdf66aa9 100644
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
2.54.0

