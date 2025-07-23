Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28092367AC
	for <x86-cpuid@lists.linux.dev>; Wed, 23 Jul 2025 17:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753292215; cv=none; b=khCyBYwoVE3MKNXZeUGk7LuVWP+7tYeBtJHl6Dn01wCunhgrvg/jLnTC4SZCkBxlcnJHr31IIJybIWgcxWdfUuZBnWTftF6fPiISfwxGp1AsAGlpXmZ0ViRe1Jw51DM7lhNeNfVoyQFBXuB4EkngltkVZMSeSrbT7AYnJlxKkPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753292215; c=relaxed/simple;
	bh=SYRZmFM3Ioa0y0H9EeRaz2/V19DLQSJh6KQlg7ks8hM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nvsz3ehLLxgQGIoPgW1zo7zN7NviJrQFZzSJfiQaWzT33rqr95ddD9zV85e5tsj6p9lY8JrKyPoe10UbCAzLdSYKo8uCv/GI3z4lQ9behOOEfUvdJET21t7fxkqZ4nfN+HMjzeXDKk0Dk7LhTdyUOpc0G6H5q+AVvFU5lYwYKeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MLKsqjGz; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sJGtJphd; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MLKsqjGz";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sJGtJphd"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1753292210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d8Xp1mFPuuaOTq+ytYDakiRoJMAib8ShAL5vVh6jiIQ=;
	b=MLKsqjGz7dv4F3dGHFGcvMIpn4ph8VkSnRwmYGXvIL8bb0YZJiLtfARFFH/Yyn6BO/tZeq
	D8JwaU17tFvNs4VVhG5SOidsOCzIIG/NBJLtWtjrQwXHjMGC11aVEGBhnh2nmaCJ88P0vZ
	vS5YoR0yzHnoe6gGAq/ODhqNBYbtwSQwOsaABv7VuYXFoUBAVmf35dJbQLGvt0wyDzxFZC
	5xgJpdNndsE1kid6i76AxDefBWiJROWrtn3Gycf+uMZkI0hOaJdnNYx22tTtMb2CMyVj6t
	CzizYZd4OCtcy0tBDy14YpdyJF9XSU9KlAJXRkvxaw0hS4i1QusaNE0++6Kt7Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1753292210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d8Xp1mFPuuaOTq+ytYDakiRoJMAib8ShAL5vVh6jiIQ=;
	b=sJGtJphdJHSQ330EyRl6dwk+HIMhgOLRNNLP5nyEGAkUvzGQoJly+53bKOs5OZSpSnmEmg
	bijFHTo6AhFkV0CQ==
To: Borislav Petkov <bp@alien8.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	John Ogness <john.ogness@linutronix.de>,
	x86@kernel.org,
	kvm@vger.kernel.org,
	x86-cpuid@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	"Ahmed S. Darwish" <darwi@linutronix.de>
Subject: [PATCH v4 1/4] x86/cpuid: Remove transitional <asm/cpuid.h> header
Date: Wed, 23 Jul 2025 19:36:40 +0200
Message-ID: <20250723173644.33568-2-darwi@linutronix.de>
In-Reply-To: <20250723173644.33568-1-darwi@linutronix.de>
References: <20250723173644.33568-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All CPUID call sites were updated at commit:

    968e30006807 ("x86/cpuid: Set <asm/cpuid/api.h> as the main CPUID header")

to include <asm/cpuid/api.h> instead of <asm/cpuid.h>.

The <asm/cpuid.h> header was still retained as a wrapper, just in case
some new code in -next started using it.  Now that everything is merged
to Linus' tree, remove the header.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpuid.h | 8 --------
 1 file changed, 8 deletions(-)
 delete mode 100644 arch/x86/include/asm/cpuid.h

diff --git a/arch/x86/include/asm/cpuid.h b/arch/x86/include/asm/cpuid.h
deleted file mode 100644
index d5749b25fa10..000000000000
--- a/arch/x86/include/asm/cpuid.h
+++ /dev/null
@@ -1,8 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-
-#ifndef _ASM_X86_CPUID_H
-#define _ASM_X86_CPUID_H
-
-#include <asm/cpuid/api.h>
-
-#endif /* _ASM_X86_CPUID_H */
-- 
2.50.1

