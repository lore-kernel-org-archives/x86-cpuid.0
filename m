Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A459524DCE8
	for <x86-cpuid@lists.linux.dev>; Wed,  9 Jul 2025 20:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752093062; cv=none; b=GO4k/01N7MWGmrb0kJj100kKYMM24SXQw1xTyII949gFmlhF0R1Ic2EwFz6lJV5wMt4TRX+NL9iKRaTedtO4WVpXnAKQPn/mVfgI961oJmeEPt9uK6cOVuX+mpsHTvXPwWMPK6t/7PW3A5jthXtGLDb5cIApYBApspIocK27AxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752093062; c=relaxed/simple;
	bh=ZdY+cMju7XjfyLPGquSDZy/E5RM93XsArXwgZNl5ar8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rZwpPg1guo26WJ1Z5EFvYxLCC6qLhzdtcjfPPy31l9g4RgxdOxtozRAWDCZemL8a6nBUbUaH1Z5+PZYy+pMT3RYMLqHJY3svmzN5fOUWh//BRjnGRJ08KY6aRhq+oS8k/k4tGNQOLnEYAQtqVSgFVm7+uE2+wny05ooVTxinU2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ujUZpUgO; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Zsga0Zjt; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ujUZpUgO";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Zsga0Zjt"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1752093058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LKia7v+pqE/QvyMWvuUTMQRfRRiIr8Kp1yEYerm0uTo=;
	b=ujUZpUgOnflpd6BGwyE4f4xyeXGRYeh4kUzLZIyi6UAE2LUaVgS7o55l8vkHYFhPtnzOJv
	Q+uXX0IU7YugYG9YfgtW1P9oPRd46G8I52SUzM7hwU69lLMoIjvFGll9mfFdwwFRldBsDK
	DJ+Lm7SxHdBmXT7RjM4pN6UAJOghr7A21tYRDYyef0fZ1D86g4D+qEg1g3ZBMOH+/YwzlQ
	Sca5/UxjFmhyCih9LEx8zSZCZvX41Al/bCMgsD5nACfzikFBv+NiPmgJiR5tualix95x2S
	b4WlzKfJY9OXXCQ9d4HnH6sX6996DkeRWtA1WKZjAXc6S8cezSI7bMgoJCMgcQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1752093058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LKia7v+pqE/QvyMWvuUTMQRfRRiIr8Kp1yEYerm0uTo=;
	b=Zsga0ZjtgdAE7IR11dlYghbsLN0KgnCJuHcz9GAAPl5wUB2jxTCWj+fXZEr23ACyZn10PM
	MLTw/Hh6j3IRFoAA==
To: Borislav Petkov <bp@alien8.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	John Ogness <john.ogness@linutronix.de>,
	x86@kernel.org,
	x86-cpuid@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	"Ahmed S. Darwish" <darwi@linutronix.de>
Subject: [PATCH v2 6/6] x86/cpu: <asm/processor.h>: Do not include CPUID API header
Date: Wed,  9 Jul 2025 22:30:32 +0200
Message-ID: <20250709203033.90125-7-darwi@linutronix.de>
In-Reply-To: <20250709203033.90125-1-darwi@linutronix.de>
References: <20250709170454.74854-1-darwi@linutronix.de>
 <20250709203033.90125-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

<asm/processor.h> includes the CPUID API header <asm/cpuid/api.h> but it
does not need it.

Remove the CPUID API header include.

This allows the CPUID API header to include <asm/processor.h> without
introducing a circular dependency, which is needed for the upcoming CPUID
model and parser.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/processor.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
index bde58f6510ac..910e36b0c00d 100644
--- a/arch/x86/include/asm/processor.h
+++ b/arch/x86/include/asm/processor.h
@@ -16,7 +16,6 @@ struct vm86;
 #include <uapi/asm/sigcontext.h>
 #include <asm/current.h>
 #include <asm/cpufeatures.h>
-#include <asm/cpuid/api.h>
 #include <asm/page.h>
 #include <asm/pgtable_types.h>
 #include <asm/percpu.h>
-- 
2.49.0

