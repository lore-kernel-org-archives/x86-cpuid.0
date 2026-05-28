Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C970C400DE0
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982847; cv=none; b=Q8aPq6aonuVe8pzyWhTM9ifvZID4+Pi57QfvlIDgd+lhM4vbdN1BWycp23lccIXYu/zjxv9lOI6D0GqVU8r0buvVBLAEPDqERFArAEITrbFDnvJ7FLjBPnbDhirzk97EQLDJUq4CdxBAlFO3j7b5uYxSoy2xBN4NyZHALUwd1VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982847; c=relaxed/simple;
	bh=bckdrD49L2/AZ2tkSWSTKN7QRStl712WfL/vLsR5dxw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WUFR1KD0NscXVfSNAYrYrud9sgdHYnwCNPyWAhGVJ/Onjv5BAj9jJtjuJbO9RMJcQ/VVq9OVLIKLb9N082lfJ6kB1rFU0V5g0HmREJleLOWYOsmIxv7axSnE/teE7lUBT2wL7okP50YWcqZaQXBAkQVG1n2FlWNZTSKHakwbSoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=FRONDEpL; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RA7jm6D3; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="FRONDEpL";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="RA7jm6D3"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/QukyByt1lrRdMx1M1JtApj2ylPv5Ge00pO+icphAoM=;
	b=FRONDEpLpDyzHRJHP9S6YHr9GLSZWW8lPsN03T8PbrQD3pbPRC5sgPl8X54MX+4p5tCRvh
	aUE8zlf4m5ZmyXzKC1lR3WWNpzR9duwuoIC8u80AbRVoVBGvGNWwDSjm4RGPLjRr1fwSR9
	KhztaLqHzykxNJhMG+KtyTTWNLqn2+FfJuQ1g0Mp0iAAiV3jX6wkAvl1kEsnTfFNvpBwy6
	iL8rFaiR6w/PgaV0uWGVfs8M0kmogiR/g3xnyKdPrOsVgeIMQJtGMopfm5g1p02UAJ6eDr
	LxKdzhL7yRqy6keX1mOBSfjGvT2CAiyVgbeqbspU2FYatC89uDlWyl+TdHnkTQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/QukyByt1lrRdMx1M1JtApj2ylPv5Ge00pO+icphAoM=;
	b=RA7jm6D3Zjve7ve9ovEPXMheES0P2n03wC5FuuVNhqIMPKvyeJJCScAI/sjOGEmVD9Gcgh
	kgx5Or4x5u2DKiDg==
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
Subject: [PATCH v7 018/120] x86/cpuid: Parse CPUID(0x16)
Date: Thu, 28 May 2026 17:37:40 +0200
Message-ID: <20260528153923.403473-19-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
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
2.54.0

