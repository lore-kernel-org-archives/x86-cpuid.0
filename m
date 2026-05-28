Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E252FE591
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982903; cv=none; b=qNPUWmOTO4K3aecvklChJLSEEwg/cnEFQjvoMd6u9O/CPp/Y11uffdHMorzlc7jR+aVbLOgb30nR5Nrcnm4LBkpRkrXrGf0E0HZTExONYpYVoFYYXuErM9INS+d/bTzLk4rXLqGVDJ5sNzSTMKxSEtPSnI1W1575FoQ+i9TICZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982903; c=relaxed/simple;
	bh=+5160CUx3bMjP4MFYfjyT2v5byZbBbmfyOYp9Lf055I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=luLhNjQY6ExYkOKyPzSYn4DJ+zVbO9DbRrZTb87hzsxaM5sOh5idz78bSqtUw4M6a+GzL4g6KQcuLTACYoOMc/HeGWmulkhuEuvPpPOY2T/STTABgWl61YNNCMI4qSfzrD8fU6jZP6lho4xdqKy55OpmtIcgCDSKJrP+yfSwIgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Wb37Qe/I; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=06Zpshhe; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Wb37Qe/I";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="06Zpshhe"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MeqQN/cTZey7eZJe3LuSGFfFoxDqcsiyXuwKpw5Zhek=;
	b=Wb37Qe/ISU/mqCjpr13Ze8HJh9Q3gywjndrwjlUsJxOGptfdAWaoWT7g4KnEcMj+UGJQL+
	BjDZs6Jz7xNRzVjX9bL6HO5FgL62pWWHBiq3epXyhvDGAP17FRvK7ptZMTCRjxskp39iTB
	TvkF5Fj4yNag72gHG4X5S03hD3P4gkkH8/qwjyrZhY/sChhLjCQ8Rny7ozo/Na/vit+kqM
	G5TI+JpN9T9dbm6b4LjYFnachNEZJMg9G+VfhKPHjeIHPues/9XzgI6pCEdZdvkOlEK40E
	nnVU+zFmeuVeIQ6gkM1QaW1eCPVDYwHd7Y79OKiUu0GvfbVLLzsRWlNnKjl8qA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MeqQN/cTZey7eZJe3LuSGFfFoxDqcsiyXuwKpw5Zhek=;
	b=06Zpshhe7gRi9gEGXFa9PS/Wtn+YEXVBbs7T8kMiErbaU2utY6ZwCVcgbWB6gyiiUWSIxh
	Ywj76hVFcf9csvCQ==
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
Subject: [PATCH v7 035/120] x86/cpuid: Parse CPUID(0x80000005), CPUID(0x80000006), CPUID(0x80000008)
Date: Thu, 28 May 2026 17:37:57 +0200
Message-ID: <20260528153923.403473-36-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Parse AMD cacheinfo CPUID(0x80000005) and CPUID(0x80000006).

Also parse the CPU capacity parameters at CPUID(0x80000008).

This allows converting their call sites to parsed CPUID access instead of
issuing CPUID queries.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpuid/types.h | 3 +++
 arch/x86/kernel/cpu/cpuid_parser.h | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/arch/x86/include/asm/cpuid/types.h b/arch/x86/include/asm/cpuid/types.h
index f77659303569..f50e54bfb514 100644
--- a/arch/x86/include/asm/cpuid/types.h
+++ b/arch/x86/include/asm/cpuid/types.h
@@ -217,6 +217,9 @@ struct cpuid_leaves {
 	CPUID_LEAF   (  0x80000002,	0  );
 	CPUID_LEAF   (  0x80000003,	0  );
 	CPUID_LEAF   (  0x80000004,	0  );
+	CPUID_LEAF   (  0x80000005,	0  );
+	CPUID_LEAF   (  0x80000006,	0  );
+	CPUID_LEAF   (  0x80000008,	0  );
 	CPUID_LEAF_N (  0x8000001d,	8  );
 	CPUID_LEAF   (  0x80860000,	0  );
 	CPUID_LEAF   (  0x80860001,	0  );
diff --git a/arch/x86/kernel/cpu/cpuid_parser.h b/arch/x86/kernel/cpu/cpuid_parser.h
index 25ca9b19e8cf..ab391de03a92 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.h
+++ b/arch/x86/kernel/cpu/cpuid_parser.h
@@ -151,6 +151,9 @@ struct cpuid_parse_entry {
 	CPUID_PARSE_ENTRY   (	0x80000002,	0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80000003,	0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80000004,	0,		generic			),	\
+	CPUID_PARSE_ENTRY   (	0x80000005,	0,		generic			),	\
+	CPUID_PARSE_ENTRY   (	0x80000006,	0,		generic			),	\
+	CPUID_PARSE_ENTRY   (	0x80000008,	0,		generic			),	\
 	CPUID_PARSE_ENTRY_N (	0x8000001d,			deterministic_cache	),	\
 	CPUID_PARSE_ENTRY   (	0x80860000,	0,		0x80860000		),	\
 	CPUID_PARSE_ENTRY   (	0x80860001,	0,		generic			),	\
-- 
2.54.0

