Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E18844D685
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983037; cv=none; b=YY4NtA4LoecDL+wf7MAsenKSeh5GqDmvQeenniUkClAFsXIMgozgVIcwS0zEQ2yG1QmJHVwgqR4GuE6TFQv4VOGvDFsAH966hC3ejik1RBThDUMlsBwq8CPv0WFyuZ0NnVKXBoQgUfqSgcUTcfv+QkLjplTz8paPlyHmeeCFvG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983037; c=relaxed/simple;
	bh=Ff4+FiBGIpxPXnvfl1uOHJ3saZhN1E2po0LrA0eWVdI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f4TuRDQLITICAoT+Ouz6v5qbsUVF2R1VOei4pilRS2S/WtLOgiVlRzP+MW7FpDymblvMDBKiCchEKaVb4uEibR+0FokSt+URv5b38hMVGIn+XCdQ/Erp4b6VZLZ/y4rSwsiAbhHBF1ZVdwhhq7vljV1Cx3YXyPKZulWarL9Htb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BamogDXM; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=x5tTn38E; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BamogDXM";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="x5tTn38E"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KBr1jJ+QjArFOXCK3XemCt5rGp0KR7bzprPyXJ0oU9w=;
	b=BamogDXMejdixo5gJNEG2X1BU81jpzHPx2+fTX6qyCE9G8krryGSzRhuuPoKlfXD89/+R8
	oh+uRFzU3Q8NDOwrqXNXXbk7JnZubIaumdf4cj7Lg7GhHxpcTdBlJwEZWOwplDf4p0GfBR
	HkEvV91r3ddRMnMqpOaF7gaXoMKuMmxCucDQSbW99ss19YRfAqpUxPIqa57Gf/BPT9ec25
	6d6JG48HxafGnCs3xPJyWEpmBV0cXjbUFZlzMTHBEpd6xj/1aoE/HB/n19zTy2bMkpEGy8
	Oi9co27OEO5AvmjdHLiumapHYyAFWkSKdeZMhpj5VewWHpEeVhzZasiAwSj9uw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KBr1jJ+QjArFOXCK3XemCt5rGp0KR7bzprPyXJ0oU9w=;
	b=x5tTn38EQEBN5mYbmPY/qiSQPaK5y8FO7pSQmbWf9P1kXCNIUCxJoujwV34iH6DwTf3Iui
	HzPRVtofRX1CuTAA==
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
Subject: [PATCH v7 074/120] x86/cpuid: Introduce cpuid_subleaf_raw()
Date: Thu, 28 May 2026 17:38:36 +0200
Message-ID: <20260528153923.403473-75-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is required for the conversion of SGX CPUID(0x12) call sites to the
parsed CPUI API.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpuid/api.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/x86/include/asm/cpuid/api.h b/arch/x86/include/asm/cpuid/api.h
index 540f886a61cd..1c0bb7ed4d45 100644
--- a/arch/x86/include/asm/cpuid/api.h
+++ b/arch/x86/include/asm/cpuid/api.h
@@ -381,6 +381,18 @@ static inline u32 cpuid_base_hypervisor(const char *sig, u32 leaves)
 #define cpuid_leaf_raw(_cpuinfo, _leaf)						\
 	((const struct cpuid_regs *)(cpuid_leaf(_cpuinfo, _leaf)))
 
+/**
+ * cpuid_subleaf_raw() - Access parsed CPUID data in raw format
+ * @_cpuinfo:	CPU capability structure reference ('struct cpuinfo_x86')
+ * @_leaf:	CPUID leaf, in compile-time 0xN format
+ * @_subleaf:	CPUID subleaf, in compile-time decimal format
+ *
+ * Similar to cpuid_subleaf(), but returns a raw 'struct cpuid_regs' pointer to
+ * the parsed CPUID data instead of a "typed" <asm/cpuid/leaf_types.h> pointer.
+ */
+#define cpuid_subleaf_raw(_cpuinfo, _leaf, _subleaf)				\
+	((const struct cpuid_regs *)(cpuid_subleaf(_cpuinfo, _leaf, _subleaf)))
+
 /*
  * Call-site APIs for CPUID leaves with a subleaf range:
  */
-- 
2.54.0

