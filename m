Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2139437EFE9
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774578103; cv=none; b=K1DINb7ofrCjSpeITx/6mwFk3sL6nWWltgUTsXybsXxmS5M8T+Gvf3+xh5WZXqfE2si8EirwXdx6T0pcj0JIL/cnI3QfcPyBKZyqU3zctsfHmzNErvQvksFI16ON0l1Gfe2nQ12jjcoR6WuUAf0fqgacT3OllLiaez+39MfIe8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774578103; c=relaxed/simple;
	bh=HEeHRVVrEuUUbRpSfoa+QXNVD9dpzMDbgiomQdcXspc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OQ+a3CNPAA3JimNMdNwdEyY0WSAPPxFou1eEgBF04F6jWGVm0gB97cIYxbRAeb03c7VhYFXe1os/rPLfWLTMgDI2Rh7WGOpnRBHkSZKbzevf/LXcEK7OfJWKRPsXk1uZ7RIg9UYBa8xx3ZSknF6QXZOIaNxq/TxOVJR+ygOn4z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NWqlJSDr; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0htWTfxF; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NWqlJSDr";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0htWTfxF"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774578099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AN0roFz7loLCdTE0vAo5+uzFEyfGPxcURyW1aCQlNRY=;
	b=NWqlJSDrfgnwhzX8quin6l3/Y84e+vwD2VLKaQPmZXtTsLUpGTNQi+gR7zcdryQ98mLggC
	qrEPtiXKuns3v+MryrkWecheLRNFcNHO9uqdxKBh9GwCz8RlUTDcAxv0XRr46e5SHKrANC
	STdHa5rCW4jDAvgJtQA+0fd7BeA2BqhGZ/57pySJn1ar7CjuM3X+9j2EiTra0+ogiO8Sz2
	PdG+eYATMASK/3qV7SLrCZ/Q+mAF01mFJerJOcSToTTXvzTs1qRjeeiDvzbkSN4rECzl+m
	HeivV3AGSTqGIfU85AIEhmznBbYkxE+KZMr4qHauLXPh3iJAc4fzLmCtNhkd4Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774578099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AN0roFz7loLCdTE0vAo5+uzFEyfGPxcURyW1aCQlNRY=;
	b=0htWTfxFT9GNNBcYeiTm00cwS5r5ykvt+ZtO6BqfiQSUROfw5BcziNaVb6XIU7YKWTgJ3+
	AnkemAYQiLjCgMAg==
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
Subject: [PATCH v6 71/90] x86/cpuid: Parse CPUID(0x80000007)
Date: Fri, 27 Mar 2026 03:16:25 +0100
Message-ID: <20260327021645.555257-72-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
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
index deddb534486a..6180acd35f59 100644
--- a/arch/x86/include/asm/cpuid/types.h
+++ b/arch/x86/include/asm/cpuid/types.h
@@ -227,6 +227,7 @@ struct cpuid_leaves {
 	CPUID_LEAF   (  0x80000004,	0  );
 	CPUID_LEAF   (  0x80000005,	0  );
 	CPUID_LEAF   (  0x80000006,	0  );
+	CPUID_LEAF   (  0x80000007,	0  );
 	CPUID_LEAF   (  0x80000008,	0  );
 	CPUID_LEAF_N (  0x8000001d,	8  );
 	CPUID_LEAF   (  0x80000022,	0  );
diff --git a/arch/x86/kernel/cpu/cpuid_parser.h b/arch/x86/kernel/cpu/cpuid_parser.h
index 59a4d562320a..c81f76c1c077 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.h
+++ b/arch/x86/kernel/cpu/cpuid_parser.h
@@ -161,6 +161,7 @@ struct cpuid_parse_entry {
 	CPUID_PARSE_ENTRY   (	0x80000004,	0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80000005,	0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80000006,	0,		generic			),	\
+	CPUID_PARSE_ENTRY   (	0x80000007,	0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80000008,	0,		generic			),	\
 	CPUID_PARSE_ENTRY_N (	0x8000001d,			deterministic_cache	),	\
 	CPUID_PARSE_ENTRY   (	0x80000022,	0,		generic			),	\
-- 
2.53.0

