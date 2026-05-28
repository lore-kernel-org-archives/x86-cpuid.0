Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B4547CC8E
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983113; cv=none; b=P0O9ugCW6J9Ykjb6LDex4v796OL+IQDfsZZXGIYr9TBrts2wXrDiiXpNk2CZTp0dWpaLpx7ZIrgcPFmBqVhNTEmpDQIoGAME5UZdrMeTAg3TyOg/Rz/RQ02B4jMej6PdJM1UE3cZkF/3UmKv4PFDsBqtgIHpV4MjHWY0SZdjUiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983113; c=relaxed/simple;
	bh=AWsNKOvI9804PLzQZcZ51kJawuW7uwDaU9sjxjjRRU8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yod+Cy/ekE6JZ3/AMHHiRqnr3I5NXtI1VRPFZelOA9uiFmWITDhzWBYW+kjJopDx7krkTHMM4LEGE5IlKKfJUYB+bJPs6/tChRY7u8rOrPGqufnZV6IvdaD6y0F83ktuo6gyVS8Jj/dndUJExEw8ksbRKpRkriCmF2i8lZ5uhsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=g7Z6nIho; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nojQCU7w; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="g7Z6nIho";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nojQCU7w"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qelKDVVuZAtL+G162mjH24+v52Ue4liAmxcTECpMT/g=;
	b=g7Z6nIhovybaqG5NJG6//CUuYR4lLrpUY5ulC4Su2J0Pa5vUIkXjXKbVc1HmCgD0aHjxHv
	BVjks7xXWIuPvphXgrno4yAiSaS0CR0LoutvpuCYIe/Ou+B1h/O+mEr+i57dATItGWOHmi
	c1qcjFAyva+ME5nEFRl3fKuK40rGyKoL7ph1NmNfHwn9lTUEoIH1nWpxmuavdeoQaC1LNx
	YF6SYejqnt53OOlMJDbTqLdutCDbAFHULTy7e9XaTso7ioASoAUaYHjo5yTMGWa3L245o9
	QfL/V6fA4e19nfid0wRBWLrEspBgbRat60ATwmqaKMuN4s0kFfey4l8OVOmbYQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qelKDVVuZAtL+G162mjH24+v52Ue4liAmxcTECpMT/g=;
	b=nojQCU7wAcVHaPhrHI7gZNPEeRtkfgnFPk7+KFgxEjPfQPPAJ539d9MsyCwX0xe2LdEwPk
	HUX6694unUkQu/CQ==
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
Subject: [PATCH v7 096/120] x86/cpuid: Parse CPUID(0x80000022)
Date: Thu, 28 May 2026 17:38:58 +0200
Message-ID: <20260528153923.403473-97-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Parse CPUID(0x80000022).

Add AMD and Hygon vendor tags as it is only supported on these CPUs.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpuid/types.h | 1 +
 arch/x86/kernel/cpu/cpuid_parser.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/x86/include/asm/cpuid/types.h b/arch/x86/include/asm/cpuid/types.h
index 08c338909506..a49b3df2bdf8 100644
--- a/arch/x86/include/asm/cpuid/types.h
+++ b/arch/x86/include/asm/cpuid/types.h
@@ -236,6 +236,7 @@ struct cpuid_leaves {
 	CPUID_LEAF   (  0x80000006,	0  );
 	CPUID_LEAF   (  0x80000008,	0  );
 	CPUID_LEAF_N (  0x8000001d,	8  );
+	CPUID_LEAF   (  0x80000022,	0  );
 	CPUID_LEAF   (  0x80860000,	0  );
 	CPUID_LEAF   (  0x80860001,	0  );
 	CPUID_LEAF   (  0x80860002,	0  );
diff --git a/arch/x86/kernel/cpu/cpuid_parser.h b/arch/x86/kernel/cpu/cpuid_parser.h
index 6767923f86d9..2de27a86861d 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.h
+++ b/arch/x86/kernel/cpu/cpuid_parser.h
@@ -170,6 +170,7 @@ struct cpuid_parse_entry {
 	CPUID_PARSE_ENTRY   (	0x80000006,	0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80000008,	0,		generic			),	\
 	CPUID_PARSE_ENTRY_N (	0x8000001d,			deterministic_cache	),	\
+	CPUID_PARSE_ENTRY   (	0x80000022,	0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80860000,	0,		0x80860000		),	\
 	CPUID_PARSE_ENTRY   (	0x80860001,	0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80860002,	0,		generic			),	\
@@ -220,6 +221,7 @@ struct cpuid_vendor_entry {
 	CPUID_VENDOR_ENTRY(0x1c,	X86_VENDOR_INTEL),				\
 	CPUID_VENDOR_ENTRY(0x23,	X86_VENDOR_INTEL),				\
 	CPUID_VENDOR_ENTRY(0x8000001d,	X86_VENDOR_AMD, X86_VENDOR_HYGON),		\
+	CPUID_VENDOR_ENTRY(0x80000022,	X86_VENDOR_AMD, X86_VENDOR_HYGON),		\
 	CPUID_VENDOR_ENTRY(0x80860000,	X86_VENDOR_TRANSMETA),				\
 	CPUID_VENDOR_ENTRY(0x80860001,	X86_VENDOR_TRANSMETA),				\
 	CPUID_VENDOR_ENTRY(0x80860002,	X86_VENDOR_TRANSMETA),				\
-- 
2.54.0

