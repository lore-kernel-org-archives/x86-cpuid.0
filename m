Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F0A255E49
	for <x86-cpuid@lists.linux.dev>; Wed, 19 Mar 2025 12:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742386933; cv=none; b=uLW63xIiXr+2o+q2WxynMWQjSv/yGGsr7GhmBHvVE1g3vzfR4vmRpnqoKacgzZUHRUlLrGSVSKpAICJGvUBHmq1K0R4fOXf+M7F+RPAoFWlmqzSq+RTS92sU5mBlnx3V2rJBce2UaB7u9FyZ1tSp/XqS6aJazdprKUAnhzuxN08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742386933; c=relaxed/simple;
	bh=GZolcfzm1JnZkKqjVbXM2gj9PLpHcVbDueFdV984WbI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VWLNCPMl8UkW6HLTbRF6DhHm5Eu0om5+/mqcRj+Vq/Xplurw/aq3y3ZZ0khs8SCQWwQYI4YnLg7Isc517fS8hSqNuZC84V6wtoR6JgidTfE54wVjOvVihjEAgQzqtk0/4byZZlQ1Vw8mUwP/OiB2Nn7Ie6Jm4shLK61oNe2surs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=N1gezVie; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=SFpjDIRb; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="N1gezVie";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="SFpjDIRb"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1742386929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7IZo4crAyQCBNwnRyQzdxn5oekpXAzTH9DnGF+58/1U=;
	b=N1gezVieGnwnwclnj1gURR2OHiJZPEMUS9V/hcEtnF/7X/bnHMsTluebKp3IdgjItEPW8G
	ahO6UkLHFsPsoZJBBRPRQui/gY2BWUe43mXZbSKp+pXtCKebRz9pBfxZbO+b8oitAnPwDD
	8i+a9r6qyeLBHpQuWpf8PnSM5USMzoT4rmt5qzMjFCsJz1fsiFsmRSDqgt0VIoP+dvKsqm
	PhToVnrXlAQQ25kgJZnu/fxLNAO4UJ49YzNYkBzzq7kTSLahFSnQZcO7qU2HLXVgYOxiPp
	XqE1MIqA72f+dB6PPQjmEhTQ7Tyqt1Vvgem7BPGs94GanE1COCE2f4Z/yZDuFg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1742386929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7IZo4crAyQCBNwnRyQzdxn5oekpXAzTH9DnGF+58/1U=;
	b=SFpjDIRbYITPtuDTmc5Xh2+4YTXeSM93cn97JbKWw7eZcQRvRCCjg4WT3JSu+qSJUzSEvQ
	5McFjaezAi5rBVDw==
To: Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>,
	x86@kernel.org,
	x86-cpuid@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	"Ahmed S. Darwish" <darwi@linutronix.de>
Subject: [PATCH v3 08/29] x86/cacheinfo: Constify _cpuid4_info_regs instances
Date: Wed, 19 Mar 2025 13:21:16 +0100
Message-ID: <20250319122137.4004-9-darwi@linutronix.de>
In-Reply-To: <20250319122137.4004-1-darwi@linutronix.de>
References: <20250319122137.4004-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

_cpuid4_info_regs instances are passed through a large number of
functions at cacheinfo.c.  For clarity, constify the instance parameters
where _cpuid4_info_regs is only read from.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/cacheinfo.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/cpu/cacheinfo.c b/arch/x86/kernel/cpu/cacheinfo.c
index be9be5e56b44..fc4b49ec42df 100644
--- a/arch/x86/kernel/cpu/cacheinfo.c
+++ b/arch/x86/kernel/cpu/cacheinfo.c
@@ -841,7 +841,7 @@ void init_intel_cacheinfo(struct cpuinfo_x86 *c)
 }
 
 static int __cache_amd_cpumap_setup(unsigned int cpu, int index,
-				    struct _cpuid4_info_regs *base)
+				    const struct _cpuid4_info_regs *base)
 {
 	struct cpu_cacheinfo *this_cpu_ci;
 	struct cacheinfo *ci;
@@ -898,7 +898,7 @@ static int __cache_amd_cpumap_setup(unsigned int cpu, int index,
 }
 
 static void __cache_cpumap_setup(unsigned int cpu, int index,
-				 struct _cpuid4_info_regs *base)
+				 const struct _cpuid4_info_regs *base)
 {
 	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
 	struct cacheinfo *ci, *sibling_ci;
@@ -933,7 +933,8 @@ static void __cache_cpumap_setup(unsigned int cpu, int index,
 		}
 }
 
-static void ci_info_init(struct cacheinfo *ci, struct _cpuid4_info_regs *base)
+static void ci_info_init(struct cacheinfo *ci,
+			 const struct _cpuid4_info_regs *base)
 {
 	ci->id = base->id;
 	ci->attributes = CACHE_ID;
-- 
2.48.1

