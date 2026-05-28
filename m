Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155653FB060
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982812; cv=none; b=OywYaUdqAsNKVwzZQe88PJOtYIHcGOrQYIyFwM715+HeCbLR5YpS37LmRyH8l4O3VNWs3e8EIS9rcwia6hykbxzc4rLTvpAgPGACjM0LCDbDh0RKoKAFyotjTc2heQxTasN8/ImRHvnxg8jFPQsVFyclLyK9upGCfKHjMT5jh6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982812; c=relaxed/simple;
	bh=l9ot3O6NqYhKS+hmIUpBl2Ce7dmNkP6NLp0oGF/D5FY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GG4fSYDdJFjfiGcol+XG1eNcrrCvOzl4GsG1waazDQU7x3tZWmxM6cwp8ijjoEBQ/PNMZPIGIlPxB1S7xMRbgmCsmIMd3Rx7t158NJjcBXeMzFw1fhLv7LgqWZ2rp+aULCkIYjtsjPvIAk2U+89XsvFDYGYZCoz5PU5CyApk4b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Nr41vQjS; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NLNGuIV4; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Nr41vQjS";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NLNGuIV4"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BNvmMQEZWmBYKIETeBYYEEai3qIMsPFTzSyzSDJnFJo=;
	b=Nr41vQjS5KdLJGpWN8RmyP1yB7dcfzGH4MznwZBD96o0GACNDq6g5cYpCJH7OVUFUeqr7X
	pcplIyHwHIlNV/V09Pm3Ld7ikvo9GZUrFM8ggHUQlj6UPsn6eWoJOUIr66d9Y66SMir5L4
	F2CTwEtzheyc1SVb28l9q+NJE9QdQNkFlfI9c6/75QaMKn1DwOXQDoEYBsJ6Q0b4o5afUG
	Za1YHjVNb7e1lcwRYmVbrj0wajJ8LbmklNQcLuVNNeZ9fSsEO9j2L70agHMuy8HHPaVpSH
	+u6K6oKNTqG4LuCxe5RvPUVDeVWggm+MG949kzqgnzFxKzrMCtzZMd0PmM1Fag==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BNvmMQEZWmBYKIETeBYYEEai3qIMsPFTzSyzSDJnFJo=;
	b=NLNGuIV4M7d+1PRVVnPhagyR7IBa9cOGnmz4ypSWCkc+gr2DDO9rY/xNwv9bYuMM3CXSPh
	IqmFKetVt2hcAuCw==
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
Subject: [PATCH v7 009/120] x86/cpu: Use parsed CPUID(0x0)
Date: Thu, 28 May 2026 17:37:31 +0200
Message-ID: <20260528153923.403473-10-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use parsed CPUID(0x0) instead of a direct CPUID query.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/common.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 5cae6c48dd25..281dc591ea79 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -942,11 +942,15 @@ void get_cpu_vendor(struct cpuinfo_x86 *c)
 
 void cpu_detect(struct cpuinfo_x86 *c)
 {
-	/* Get vendor name */
-	cpuid(0x00000000, (unsigned int *)&c->cpuid_level,
-	      (unsigned int *)&c->x86_vendor_id[0],
-	      (unsigned int *)&c->x86_vendor_id[8],
-	      (unsigned int *)&c->x86_vendor_id[4]);
+	const struct leaf_0x0_0 *l0 = cpuid_leaf(c, 0x0);
+
+	if (!l0)
+		return;
+
+	c->cpuid_level = l0->max_std_leaf;
+	*(u32 *)&c->x86_vendor_id[0] = l0->cpu_vendorid_0;
+	*(u32 *)&c->x86_vendor_id[4] = l0->cpu_vendorid_1;
+	*(u32 *)&c->x86_vendor_id[8] = l0->cpu_vendorid_2;
 
 	c->x86 = 4;
 	/* Intel-defined flags: level 0x00000001 */
-- 
2.54.0

