Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D903ED3A5
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982787; cv=none; b=g2ObZ3DYsrN1sbPyY3coItWGHM4haQESZY3tYV1IxaKnhICNQJGAxxi5z+VAJjfbi8aYV3wnI+SYhDJytcWr0i6z5zGuCJEoSaRAhUQJYrKfGwQOr5NfQilfWXKCxN+qUa0uDUbsk+NVQ8HYBbUtBcSBjJyu/0oQmNLD/ylPe/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982787; c=relaxed/simple;
	bh=+brV3ZQPPQ2cCxlKjcdbgUKWMovVZ8rQth391vdm4jk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iOGnPrR8kvnDjfDqWFedgLSdZ2oFDTM8/CzIXhPfHXt+Uj/hLZiPFDgI/Zmk1fW6wi1jvXQtJqWHWmo+qXqM40atv8VUhO4XV/Ry002LvIfX9n3rnRdchNqJQlN/xFrXUe6T2OpoEvt/Tbn44iSRGvJO/3IdW7UWwUc2l135V4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=l5/LzA7b; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=S9elNFfz; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="l5/LzA7b";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="S9elNFfz"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mgMZSbnt4GCgcZiHfWFL2Y/XXryRB498L+LKgmIGuNs=;
	b=l5/LzA7bGCJUeUlwPh66uMPYKFJlape+NdeLLpkhdLm55okdRIzp/OhNkMhTdKv/l2VNgn
	Zqj/jZ+nYAORONPPJf6nWvho+RVx5OYteQRKwFHhrlaCiSuF5tCGVSZbZPOhe4JKXky+YV
	pdF7RYObHibhKPi2Njo+azFPtBxwVEzb8kPcTvBH4HjZ5M2/0uMm8i+CDekBwjpA9iVhDo
	QcY7iPWEMAknCTZnl9c1Uy54ZgRIyliMZXbEgicktEyhHtTAsZzuI1w0pQOXsFQmEfsFhB
	DRED10pC6oWkby95/XV6h4mIfOXYFka+dkAWmqKeXJxvS3UFAuAZPp26S2lodw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mgMZSbnt4GCgcZiHfWFL2Y/XXryRB498L+LKgmIGuNs=;
	b=S9elNFfzV2/xT7gcZfqXDs3JBF7NhxNj+pfWokyJ1uPHpT7WUWy/uByE7qYFqYq3W4kpxR
	Z/pOeLyyxbL7RBDw==
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
Subject: [PATCH v7 002/120] x86/cpu: <asm/processor.h>: Do not include the CPUID API header
Date: Thu, 28 May 2026 17:37:24 +0200
Message-ID: <20260528153923.403473-3-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

<asm/processor.h> includes <asm/cpuid/api.h> but it does not need it.

Remove the include.

This allows the CPUID APIs header to include <asm/processor.h> at a later
step without introducing a circular dependency.

Note, all call sites which implicitly included the CPUID API through
<asm/processor.h> have been modified to explicitly include the CPUID APIs
instead.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/processor.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
index 10b5355b323e..4f4356b13158 100644
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
2.54.0

