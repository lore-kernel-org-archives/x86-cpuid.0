Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF298347C6
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982950; cv=none; b=nsYdfZGWVNjfNE4dVztDskBuWbaeFBo/diksb/CqRSjn/6edGFRh+raWXnssRhOdoIpFSFDWQIm3CGxBRzylEKe9jLF0zjCR8gRWt/4VGe4QAHL7c/k244z3PnafnFDf6Qdi/IXlFbXwhBNdefoGzWLE+6hFcQzOWGJmmKLxVXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982950; c=relaxed/simple;
	bh=IlUpfz34PwuSRIS0hkELKWJYU5OlYjvc/aXYrGwIFek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t1NkrPfZumSeqNDkU6x+yVBjCUCQmcyYUUdkFpjR4mm/c/b9yAWgl1VJ61iJruuPSiYALik5QMdtjV2whG2v1C9r5zpDYcfM1M7SAUiWqEIiG7xOsj5/vUzVw98wNhSWdBYwbZRDr9Le/Xo1FDc9+1orrCs671vfevnr2XeTWaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GqpOIIik; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=aN25URfl; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GqpOIIik";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="aN25URfl"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FVnCG2+9w9VOS4Pd7LNuPbFVDSk+dhXSqDBYDFECFV0=;
	b=GqpOIIikaY8nBIV/gj9LEz3/CTQlzYMW2+e04ql6a0I6j8/1ZPjt3s1WHudgmasYrEq+3x
	sD+Q44j9L3BVTgr2LFFSMOAl/Gf02xR7GSfvbkENZVhaopNBsMVP6SPxGGChwVM1kMPtHS
	HM5QbD5hb9SadrrIUipoZKUY2d4nCWwzPsXLxfN0lpcJcQmc9xpOrDOQLpaE2/gO+hi1uq
	ztnCg3DIVaYMPrhnqCzF1z0GGSyiLN1zetLsr9QtkWyVL1WtnT6ky8OGU21joRwHmFvYcW
	y1zC58JUSBoA5UaEkBLtraHxTdJfv2iuZh0cxed0blKLdOL8zaD0ro+2DtxnNQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FVnCG2+9w9VOS4Pd7LNuPbFVDSk+dhXSqDBYDFECFV0=;
	b=aN25URflo/KhNTTi7L0LMWQB8/DtDRQUARQ+O4lnMedJ/t+p0p8Yj/65DwhR6YF5HN7Jl/
	BOJCCJgUwuBlmKAw==
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
Subject: [PATCH v7 049/120] x86/mce: inject: Use parsed CPUID(0x1)
Date: Thu, 28 May 2026 17:38:11 +0200
Message-ID: <20260528153923.403473-50-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For MCE injection, use parsed CPUID(0x1) instead of a direct CPUID query.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/mce/inject.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/mce/inject.c b/arch/x86/kernel/cpu/mce/inject.c
index 42c82c14c48a..10fe9bdd62d1 100644
--- a/arch/x86/kernel/cpu/mce/inject.c
+++ b/arch/x86/kernel/cpu/mce/inject.c
@@ -120,7 +120,7 @@ static void setup_inj_struct(struct mce *m)
 
 	m->cpuvendor = boot_cpu_data.x86_vendor;
 	m->time	     = ktime_get_real_seconds();
-	m->cpuid     = cpuid_eax(1);
+	m->cpuid     = cpuid_leaf_raw(&boot_cpu_data, 0x1)->eax;
 	m->microcode = boot_cpu_data.microcode;
 }
 
-- 
2.54.0

