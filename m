Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15BF449EC2
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983021; cv=none; b=P3PEYFAWyfrXItEonBxF8UgZSIW/F3uIS7DsaILRIKQVBwAN2QMbCTkot8LUdinL0diLWtYXj72u6UdIqcY27qlqy2xbpkulQT2Fx1gGtPOMStz21i7z56EwXQBD5zaDotOvhXjZQkaicOZ30dSYoIQoT1HXSoC3NHrj1WQRrK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983021; c=relaxed/simple;
	bh=LfTIHOhdzKz6hHYy5kzhI50FlFLOCljxHq5Yu5JM58g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JqhycU1chNeAiBvFrcihEy6+m6AsGdvLubvLDEailefEf/x4h/91bYCLhKI18ErvoW1/FQPLG2ZsJq5zgm7RsY8rZ4m4HxuCxQ0sHPgTBHxRcDz7rjJedslCfiFnwdaQxdGT/N8DJY3ILbAOYlZqZe6/myYwtZB9TlphAZRf6Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=aZGCxeD7; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=6ZYHMh5z; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="aZGCxeD7";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="6ZYHMh5z"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Zff6XG4XO2ypjJhAunZCDvk8Njw4n25Y2L6J5oUGrs=;
	b=aZGCxeD7ozmOtriXZJuZuivTuH0WiyV1ypkTYwmI2Cj6ZCRs4SAYHf2txXJCH3I1PqB6u0
	JIFWhAhj4vBE7rB7lIo9V9b+X5NjiiAfpGQSAY+HqTupG9VJZr8sZ+BJ9hORvZGcH63TAE
	Bpg74i3yMbYS6h5aoe1haJCG+s2Aw+apUJKYJSU6yQFYK4cyGkv8swA4JwSt5OxePpAcmW
	BumYqMDoskDh2dWeymb+Y4ESAwrOP3HWs2w2d6036dLRn8unyD8vk03FHtfdKTX1dsMqgj
	bt5HLiamaEV4ZwB82nh/7KHPIgYX7jc9ij+S80kkGou8Wu/l1xbkVZEgcUuOTA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Zff6XG4XO2ypjJhAunZCDvk8Njw4n25Y2L6J5oUGrs=;
	b=6ZYHMh5zEiCHR20JgzkaS1qmkjx1pSM8aDZPZijmb2DxKrk8+54g48S+RzkgFUAKcGIBvi
	es3fhdhFebjfX5Cw==
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
Subject: [PATCH v7 068/120] x86/idle: Remove unused CPUID(0x5) symbols
Date: Thu, 28 May 2026 17:38:30 +0200
Message-ID: <20260528153923.403473-69-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All CPUID(0x5) call sites have been converted to the CPUID API, where
x86-cpuid-db data types with full C99 bitfields are returned.

Remove the no longer used CPUID(0x5).ECX bitmasks.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/mwait.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/x86/include/asm/mwait.h b/arch/x86/include/asm/mwait.h
index 40c827e7929e..ef400fa6343f 100644
--- a/arch/x86/include/asm/mwait.h
+++ b/arch/x86/include/asm/mwait.h
@@ -14,9 +14,6 @@
 #define MWAIT_HINT2CSTATE(hint)		(((hint) >> MWAIT_SUBSTATE_SIZE) & MWAIT_CSTATE_MASK)
 #define MWAIT_HINT2SUBSTATE(hint)	((hint) & MWAIT_CSTATE_MASK)
 
-#define CPUID5_ECX_EXTENSIONS_SUPPORTED 0x1
-#define CPUID5_ECX_INTERRUPT_BREAK	0x2
-
 #define MWAIT_ECX_INTERRUPT_BREAK	0x1
 #define MWAITX_ECX_TIMER_ENABLE		BIT(1)
 #define MWAITX_MAX_WAIT_CYCLES		UINT_MAX
-- 
2.54.0

