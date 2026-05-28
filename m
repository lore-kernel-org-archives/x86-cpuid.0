Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D769A47DD6A
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983125; cv=none; b=jFdJOfbDHcIAY8WRF0NlN8iBdt3Pr8lb93xr9Ob6buapzqJabxUtxu5pmX8YsLcNK3fRGeTRTluK/H8PShJhcge8S1290m1V80sT4aXFO+vJm8oHVO/W/6koiF7uNSvmFeIIq6VVjYXDr+TSlmpu7tTEmIsdog7JrvCgF4+5YtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983125; c=relaxed/simple;
	bh=EIflR/OndVkpsRYn0nON167x8TX21su2tmH91K2IdEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XkvADqrN6MPE2BJKsfVP2bam9Sy4s6FSXIYcSf3AXuUqR5C3faX9HjMZeFHCULBHZpK6rSRw2t0gn3RQ624VzMiaAu67hE1phgoGSHxIMbVDzS8C9B1ryAowftgtafBlsqWI09DOhaMzUAM9CxZGsPAD/feg5Kn/4A2/vZ8o+R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=t0rq+ucZ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Tkc9sMMU; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="t0rq+ucZ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Tkc9sMMU"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2SiZ39qOQKRlJAtxJKPYuPxnFDXfsI3Arxg15wPbFOU=;
	b=t0rq+ucZiss351YFzyKNg5lMMqY3QHdAlvu377F7ot3PixEzhvICE+Q35RqeNaXSRSo32h
	70JZZ1MO6hF0DbOYsT/g5HwKlLRFYfjtGAOfkbP9W16ZWxf8geGPk9lBnapYvQJNf8ltG1
	icjy07Sxc4KrBqpIZTs50a3dPTh49PZitLIwoCOl7MdErZo3a+58cMpw/GlHLo7rOBTXTJ
	JqujbeeIc3RBXN4MX87FmbMeboN8tZQrZsssxSxrE7Z6Yt2/4V3GHu8kWMCx4Wrf3B8Z5z
	XiFR109q59ONtVWkzaEWTG5rxNF8D/aqbIbOsJKqS46ptd7IVuzYl88ZKbLj6g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2SiZ39qOQKRlJAtxJKPYuPxnFDXfsI3Arxg15wPbFOU=;
	b=Tkc9sMMU1L2mLdy2F6qntZMrazpZRpKljLD09wwX6k1B/chEW4RkLLL970Alg+h2Z+vTot
	XW6MjYAjUStlhqAg==
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
Subject: [PATCH v7 101/120] x86/cpuid: Parse CPUID(0x80000007)
Date: Thu, 28 May 2026 17:39:03 +0200
Message-ID: <20260528153923.403473-102-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Parse CPUID(0x80000007).

This allows the cpuinfo_x86::x86_power call sites to be converted to the
CPUID APIs next.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpuid/types.h | 1 +
 arch/x86/kernel/cpu/cpuid_parser.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/x86/include/asm/cpuid/types.h b/arch/x86/include/asm/cpuid/types.h
index a49b3df2bdf8..7671f8d24014 100644
--- a/arch/x86/include/asm/cpuid/types.h
+++ b/arch/x86/include/asm/cpuid/types.h
@@ -234,6 +234,7 @@ struct cpuid_leaves {
 	CPUID_LEAF   (  0x80000004,	0  );
 	CPUID_LEAF   (  0x80000005,	0  );
 	CPUID_LEAF   (  0x80000006,	0  );
+	CPUID_LEAF   (  0x80000007,	0  );
 	CPUID_LEAF   (  0x80000008,	0  );
 	CPUID_LEAF_N (  0x8000001d,	8  );
 	CPUID_LEAF   (  0x80000022,	0  );
diff --git a/arch/x86/kernel/cpu/cpuid_parser.h b/arch/x86/kernel/cpu/cpuid_parser.h
index 2de27a86861d..799714300bfb 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.h
+++ b/arch/x86/kernel/cpu/cpuid_parser.h
@@ -168,6 +168,7 @@ struct cpuid_parse_entry {
 	CPUID_PARSE_ENTRY   (	0x80000004,	0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80000005,	0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80000006,	0,		generic			),	\
+	CPUID_PARSE_ENTRY   (	0x80000007,	0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80000008,	0,		generic			),	\
 	CPUID_PARSE_ENTRY_N (	0x8000001d,			deterministic_cache	),	\
 	CPUID_PARSE_ENTRY   (	0x80000022,	0,		generic			),	\
-- 
2.54.0

