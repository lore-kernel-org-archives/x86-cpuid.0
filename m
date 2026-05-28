Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3483FF1CB
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982830; cv=none; b=OGOLBkF2so0NOeyYNZzbHF/KNWadZN3tLxinBC68p9nP6avZ9QmE/B6ZiQ+VjNT14651UkprIxPzIKE6kIiv3JR3pDlPZMcHKuL9abELUU+Elb4Ytxva7sGWnPgojNfS5/hICqxYECMCC+bdzb+EneD7fqOlLGo1Rnx2DELwtmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982830; c=relaxed/simple;
	bh=1HCZ5l9RxCU3IUPSCzTHfvMvvUidzbrY6BQsFnBw3Dc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MdAwevMb+wKCX4lbWUD1Gd4Pg8FqMf+/zcEzq2MCZeODgjyJp9dyh49XFva0Dq0Gw1ohHdbQ3gdL+s+aLQYE9d7lr5lqwRee1lih5/U2XYKK3q4kdW3ckQMsC10wbiSUmSDOMkKsHb3a8uB8b6zoSwg+pAoPf4YQCJnMRrxCyXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=QQBE3Izy; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GsnZ4KZb; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QQBE3Izy";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GsnZ4KZb"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Enkiw++N0BixPy49r1hKo68/Y20Z8aSvogyYQ0bhJhE=;
	b=QQBE3IzyKnPRTAM+AxAdP6A6QLd6E1Y95N8R2iPs6CS3oHqFeWpM7Z0XLcQUZ0qklJ0oxN
	jrwzT5VdO/J3vFFZMNCVyfDXoTrVgNIyK5EzMz5o6oKClpMwcunOHhYrVFNkFAI9MCc5JN
	qY5xJREmTHRRwUTOf9TnAWaefrN1zrP9Gze59pVlR8QUB7PVIAdd0yD4lYAA11dqnZSmCW
	OpiJLlJSXSQv/CmITyRu/Ny9+JpXvPYCGSr8gnN1PchPs4O643lqVGmkae43x/X/vNFrCT
	VClPNfPJ84CBFClqgyJZ3oRHlPXtlhsJGJs2azMXiAgrPYWpR5uf8DtfZY7kjQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Enkiw++N0BixPy49r1hKo68/Y20Z8aSvogyYQ0bhJhE=;
	b=GsnZ4KZbl+0ukePd6N8CuBirzDBaFBDBldRxwBGCuI3xHwNu+JRPl8honR8GQRbVJ7B3J3
	QVnwE5gTTWqaI6Aw==
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
Subject: [PATCH v7 014/120] x86/cpuid: Parse CPUID(0x80000002) to CPUID(0x80000004)
Date: Thu, 28 May 2026 17:37:36 +0200
Message-ID: <20260528153923.403473-15-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add CPUID(0x80000002) => CPUID(0x80000004) support to the CPUID parser.

This allows converting their call sites to the CPUID API next.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpuid/types.h | 3 +++
 arch/x86/kernel/cpu/cpuid_parser.h | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/arch/x86/include/asm/cpuid/types.h b/arch/x86/include/asm/cpuid/types.h
index c020fb8fed59..8be2c2ba874a 100644
--- a/arch/x86/include/asm/cpuid/types.h
+++ b/arch/x86/include/asm/cpuid/types.h
@@ -207,6 +207,9 @@ struct cpuid_leaves {
 	CPUID_LEAF   (	0x0,		0  );
 	CPUID_LEAF   (	0x1,		0  );
 	CPUID_LEAF   (  0x80000000,	0  );
+	CPUID_LEAF   (  0x80000002,	0  );
+	CPUID_LEAF   (  0x80000003,	0  );
+	CPUID_LEAF   (  0x80000004,	0  );
 };
 
 /*
diff --git a/arch/x86/kernel/cpu/cpuid_parser.h b/arch/x86/kernel/cpu/cpuid_parser.h
index 7d41bde0c0ec..3e11e13fa76c 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.h
+++ b/arch/x86/kernel/cpu/cpuid_parser.h
@@ -117,5 +117,8 @@ struct cpuid_parse_entry {
 	CPUID_PARSE_ENTRY   (	0x0,		0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x1,		0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80000000,	0,		0x80000000		),	\
+	CPUID_PARSE_ENTRY   (	0x80000002,	0,		generic			),	\
+	CPUID_PARSE_ENTRY   (	0x80000003,	0,		generic			),	\
+	CPUID_PARSE_ENTRY   (	0x80000004,	0,		generic			),	\
 
 #endif /* _ARCH_X86_CPUID_PARSER_H */
-- 
2.54.0

