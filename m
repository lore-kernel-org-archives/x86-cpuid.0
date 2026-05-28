Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0553C43DA3C
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983005; cv=none; b=VaWZBFNDV+3QqzbYlv37K3LLCizAKjH08wuW9mFAZyvn6CqujwpB/swERvw9cPRdfawlkk0pDZ2yvhase8atFD9J7eJLfEWCHYMY9IUDW/NVzCnf62zHIcex79YjHLce+zdoC+Gx1s5SBlx+U3LWyR7doluXHpgBjP5ecIjLvsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983005; c=relaxed/simple;
	bh=T86cZtGPufTmePBb6EYD8QONTl3jM5ym9m6Ty8wWFMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YpIv+6qvhb77m8nto1+x3jWD6TJOg7S3IAXXe6/yCYM/3x3AMyOCwQivfyQb+MAvaA5m3joYXQ4nqjb8yQVQ607mqd2cg6WyIeSxDxTD8iopG4uHhJeSm4pg2vQBn1bDAG0cJDKiYlr8qF3IKVMLDGBYP2BT8GcTDedwANUpjdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=AJnlj0jJ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=XNEoQvSR; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="AJnlj0jJ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="XNEoQvSR"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C+hCepVpmdllDQi9UGntbSGdJI5SWxWNRWhxaHafejY=;
	b=AJnlj0jJgRP+to9DkZoY90IhAMLqXExvOT+y/SkAqD1MBSKtSIrrJVRTV4FIQqnUs4nTRN
	qIBrGmvvMhPnQB8L1SAohUhbmVZLK5dzfCQ8RII4VhSbgBRIjYqDcXaQTe9qwuGpNtXVgx
	za9i+cth0tEV0XhasSk/Pp3Etm7nqPAj86JvApa31obaTfOjWvnfzORdggYKEGzP0nilsw
	Et6fPAukpYyrzdGmSY5rn3YAKO1Y122CELPirOKtaXH5AaxeqrjCtONaQ7dMXDnrR/yUnP
	cwy43zceAm22Pv1uy+bDyCWKrw4UEHmvw0Sn+glSzZPJDcqSWbOyR8fUG8G8DQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C+hCepVpmdllDQi9UGntbSGdJI5SWxWNRWhxaHafejY=;
	b=XNEoQvSRhojqUe+gQKojDwBavthFuyaXqiTrbUtdfxiTdjnOxUoLr+mBXTxwJVh0FJcoji
	28jTQtUo5+3fNJCw==
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
Subject: [PATCH v7 062/120] x86/acpi/cstate: Use MWAIT helper macros
Date: Thu, 28 May 2026 17:38:24 +0200
Message-ID: <20260528153923.403473-63-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use <asm/mwait.h> MWAIT_HINT2CSTATE() instead of open-coding its logic.

No functional change.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/acpi/cstate.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/x86/kernel/acpi/cstate.c b/arch/x86/kernel/acpi/cstate.c
index dbdacfbf53bd..4e7142d977c8 100644
--- a/arch/x86/kernel/acpi/cstate.c
+++ b/arch/x86/kernel/acpi/cstate.c
@@ -132,8 +132,7 @@ static long acpi_processor_ffh_cstate_probe_cpu(void *_cx)
 	cpuid(CPUID_LEAF_MWAIT, &eax, &ebx, &ecx, &edx);
 
 	/* Check whether this particular cx_type (in CST) is supported or not */
-	cstate_type = (((cx->address >> MWAIT_SUBSTATE_SIZE) &
-			MWAIT_CSTATE_MASK) + 1) & MWAIT_CSTATE_MASK;
+	cstate_type = (MWAIT_HINT2CSTATE(cx->address) + 1) & MWAIT_CSTATE_MASK;
 	edx_part = edx >> (cstate_type * MWAIT_SUBSTATE_SIZE);
 	num_cstate_subtype = edx_part & MWAIT_SUBSTATE_MASK;
 
-- 
2.54.0

