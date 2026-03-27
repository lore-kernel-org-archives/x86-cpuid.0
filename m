Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A5334E754
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774577922; cv=none; b=EqMRVmxjhMD3c7reAUsCQutgjYQNGhqX4UvRN0uGKVJvBe2BX96x8pmqmIjAdfC362SpFymFhBbwlhA+G1X685+RYeBGCMU7d5Cc0NeK7Q+A/1NTawsqcT0y0aOgQvoFhaxlfOTRz3mAIiaL7aYr1LyqAfQ/SgdK+E+iU7UwNcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774577922; c=relaxed/simple;
	bh=Ph8E/0SqHd0svolJKtL4halF+epl6iCeDICWLxbyi6o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l1GUpz8/TRU7U+ImH38AR9WVPKBC2xhc1v6c8woth28qk/+KHXeB+1CiVi8C9humRa7GMx8nkb36VHL17JqiwJDC9duoXtpqxFCzR1+DfrabNLv0lldPj6EzsraUo1LzvtyiNVhvSZhuWmzqaRGHw+zGcFWowwLVxM/1Us642ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yWfON21q; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=/GELOVqZ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yWfON21q";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="/GELOVqZ"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774577920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2rEfSCr6pyRWs6ETh8NgXQZmTOcSNqT174FYbcQF+Bo=;
	b=yWfON21q325scRczbuOGkGKAo8npj5bXBI98smGd2gsW92GvCjdRIz+Skc0Aa4Ht9smjgq
	ZB03Jb3EqahmLhKc/kSc1jq11AISi4H/Z7XpWdZQEtV6vayDiAvEm0zwmmjyFYFmPL+jSj
	m+DC4Ge8oAK3q25yo21PeBTVMaxu+6nh/j/6JhWjrXYIKa2/u2CRPcg3JB1YxDPTJhXhvA
	exT8MTRqW39l/TaABUj/Gw7+DLvIfaoTsDncK3iszeV5OBCiOk9/9nOUQ6LxWkJMsVHhXz
	F4HR4ZoN+lH9aDyR4uvCkDdUeb1SxRiRQRynxwKemGu4+tYVOr4mR+S9GkxrJw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774577920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2rEfSCr6pyRWs6ETh8NgXQZmTOcSNqT174FYbcQF+Bo=;
	b=/GELOVqZ6QrmDmiLQhpJ0CMb8QtGR3umB3paVNLNrp/67E1yaDpDr/twq9y+66E8ZW/18u
	UB5qDqylI52rG9Bw==
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
Subject: [PATCH v6 23/90] x86/cpuid: Parse CPUID(0x16)
Date: Fri, 27 Mar 2026 03:15:37 +0100
Message-ID: <20260327021645.555257-24-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add CPUID(0x16) support to the CPUID parser.  The leaf enumerates the
CPU's frequency information and is only supported on Intel machines.

This allows converting CPUID(0x16) call sites to the CPUID APIs next.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpuid/types.h | 1 +
 arch/x86/kernel/cpu/cpuid_parser.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/x86/include/asm/cpuid/types.h b/arch/x86/include/asm/cpuid/types.h
index 8be2c2ba874a..2939ad095f6c 100644
--- a/arch/x86/include/asm/cpuid/types.h
+++ b/arch/x86/include/asm/cpuid/types.h
@@ -206,6 +206,7 @@ struct cpuid_leaves {
 	/*		Leaf		Subleaf number (or max number of subleaves) */
 	CPUID_LEAF   (	0x0,		0  );
 	CPUID_LEAF   (	0x1,		0  );
+	CPUID_LEAF   (	0x16,		0  );
 	CPUID_LEAF   (  0x80000000,	0  );
 	CPUID_LEAF   (  0x80000002,	0  );
 	CPUID_LEAF   (  0x80000003,	0  );
diff --git a/arch/x86/kernel/cpu/cpuid_parser.h b/arch/x86/kernel/cpu/cpuid_parser.h
index 8b0d44b745c5..ee1958f3d369 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.h
+++ b/arch/x86/kernel/cpu/cpuid_parser.h
@@ -144,6 +144,7 @@ struct cpuid_parse_entry {
  */
 #define CPUID_COMMON_ENTRIES									\
 	/*			Leaf		Subleaf		Reader function */		\
+	CPUID_PARSE_ENTRY   (	0x16,		0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80000000,	0,		0x80000000		),	\
 	CPUID_PARSE_ENTRY   (	0x80000002,	0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80000003,	0,		generic			),	\
@@ -180,5 +181,6 @@ struct cpuid_vendor_entry {
 
 #define CPUID_VENDOR_ENTRIES								\
 	/*		   Leaf		Vendor list		    */			\
+	CPUID_VENDOR_ENTRY(0x16,	X86_VENDOR_INTEL),				\
 
 #endif /* _ARCH_X86_CPUID_PARSER_H */
-- 
2.53.0

