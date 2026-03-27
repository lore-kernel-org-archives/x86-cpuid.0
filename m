Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2093836A038
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774578032; cv=none; b=EUb8y0jJvSttVQoogv9Nufi87fMlhcgR/WjrG4hB0BXwR6ALIG4HOlJjRZMbN19QldEpd9ypF5qR9hzOGuseni/RsfOmJgPZ3Ht1zdKhenM/hZqdlRPPHNd4mycYX681jzMG1GsyFmRdo5pSerPcyKg6r8LEkHk5LHnY+3QRJN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774578032; c=relaxed/simple;
	bh=VwUXreGC+Vi/5vw/JdCrvXHwp38HQ3xfg4TP3WOd4F4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lXjGOipnkPhnpuuD5WVbaJuHxhziNf3pz401J6DE46R3c9KE0OQabZTDnKlawTIPSBH43tvcMnoKSqG67IeDjG8SJhcrH6x4bDiycLO0YEXOipHC2WxeUrelzUOnZi+CLIpDIxBaQ51+SqXl8MuDSLXJscdwV5z42OUFxO1joRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=R8gHiAbv; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=gwPIIB3g; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="R8gHiAbv";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gwPIIB3g"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774578029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9wbrrWIKKy8b9r6cx2Q/XHB/2YYtXWkLu3VJHGg4bxI=;
	b=R8gHiAbvMlUHHEYwlTZH11WCwLBRWIi20SCy9DMKEMK1VIrKkrv/oXpP4n1lewSzBKuWeA
	k70Ngh5od7OfhsXtHknLYew1ExjLWrukUyu42zYoEH6iFh4P5G0J2C226U1LjhFunaGi/N
	Aaht0uekoLEoxfp/vOMzz/tWMWlLgKaW8z/WgzFt3qcfQsomgQY1QCGpY0WU9pmSDZ0wPU
	6hS/nOPIF6y32OxBPqgD3+54ghFf+95wtgnZsdypFOz+QIjYmkygig8+HgAoKmCF0/NNv2
	poZpOj86Fcldp/HtnqHDpao+K0Se5zrVIFnDXaVzdeMJYgHnU87tyTcdOrcR4Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774578029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9wbrrWIKKy8b9r6cx2Q/XHB/2YYtXWkLu3VJHGg4bxI=;
	b=gwPIIB3gdBOyY65oT6TnI8lAfoyjt0lGNaxjGffoZvql4kvMGG5984Gu2HA1vEazFaOa7v
	w9HOPO5gWpDhfSDg==
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
Subject: [PATCH v6 51/90] x86/cpuid: Parse CPUID(0xa) and CPUID(0x1c)
Date: Fri, 27 Mar 2026 03:16:05 +0100
Message-ID: <20260327021645.555257-52-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Parse CPUID(0xa) and CPUID(0x1c).

This allows their call sites to be converted to the CPUID APIs next.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpuid/types.h | 2 ++
 arch/x86/kernel/cpu/cpuid_parser.h | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/arch/x86/include/asm/cpuid/types.h b/arch/x86/include/asm/cpuid/types.h
index f50e54bfb514..128898d4434b 100644
--- a/arch/x86/include/asm/cpuid/types.h
+++ b/arch/x86/include/asm/cpuid/types.h
@@ -212,6 +212,8 @@ struct cpuid_leaves {
 	CPUID_LEAF   (	0x1,		0  );
 	CPUID_LEAF   (  0x2,		0  );
 	CPUID_LEAF_N (  0x4,		8  );
+	CPUID_LEAF   (  0xa,		0  );
+	CPUID_LEAF   (  0x1c,		0  );
 	CPUID_LEAF   (	0x16,		0  );
 	CPUID_LEAF   (  0x80000000,	0  );
 	CPUID_LEAF   (  0x80000002,	0  );
diff --git a/arch/x86/kernel/cpu/cpuid_parser.h b/arch/x86/kernel/cpu/cpuid_parser.h
index ab391de03a92..8e147e7223e0 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.h
+++ b/arch/x86/kernel/cpu/cpuid_parser.h
@@ -146,6 +146,8 @@ struct cpuid_parse_entry {
 	/*			Leaf		Subleaf		Reader function */		\
 	CPUID_PARSE_ENTRY   (	0x2,		0,		0x2			),	\
 	CPUID_PARSE_ENTRY_N (	0x4,				deterministic_cache	),	\
+	CPUID_PARSE_ENTRY   (	0xa,		0,		generic			),	\
+	CPUID_PARSE_ENTRY   (	0x1c,		0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x16,		0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80000000,	0,		0x80000000		),	\
 	CPUID_PARSE_ENTRY   (	0x80000002,	0,		generic			),	\
@@ -198,7 +200,9 @@ struct cpuid_vendor_entry {
 	/*		   Leaf		Vendor list		    */			\
 	CPUID_VENDOR_ENTRY(0x2,		X86_VENDOR_INTEL, X86_VENDOR_CENTAUR, X86_VENDOR_ZHAOXIN),\
 	CPUID_VENDOR_ENTRY(0x4,		X86_VENDOR_INTEL, X86_VENDOR_CENTAUR, X86_VENDOR_ZHAOXIN),\
+	CPUID_VENDOR_ENTRY(0xa,		X86_VENDOR_INTEL, X86_VENDOR_CENTAUR, X86_VENDOR_ZHAOXIN),\
 	CPUID_VENDOR_ENTRY(0x16,	X86_VENDOR_INTEL),				\
+	CPUID_VENDOR_ENTRY(0x1c,	X86_VENDOR_INTEL),				\
 	CPUID_VENDOR_ENTRY(0x8000001d,	X86_VENDOR_AMD, X86_VENDOR_HYGON),		\
 	CPUID_VENDOR_ENTRY(0x80860000,	X86_VENDOR_TRANSMETA),				\
 	CPUID_VENDOR_ENTRY(0x80860001,	X86_VENDOR_TRANSMETA),				\
-- 
2.53.0

