Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABE92F39D7
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774577863; cv=none; b=bYJIA+8m/ikYYj1dvgXNFhIcvzQ6wpkFnTATd/ehOp4Kim4TRa45ZIVEwtWzYyURIlNmq5/tc+RlgsqTR3KuCxwZ3deUI8IWaUqLf41M49+MxSmuV5KFo5pl6DnWLadsXtj/f6KZJF8UixhIjNpYpLMQd8E5bUvmlD3KFfW4C3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774577863; c=relaxed/simple;
	bh=PHiuUI8ygI/fGsOSbc1oAUrX2GWyR2LqizwOE4do5/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H8fYb6cGsTA+oKYh3PT4HoPUwn4z5/BFdZ9Bhy3vudv+K8V4tUr8zwMXMMZltsmYRgY34mJgVOqJjf9SN4bEIT0zMUiWuAnxqDrzxEAdWbL9P5lZ13RTmw2eJnOOOKOUXQnyzajQN4iWRdeE1ckRMEdjwKFMIn+d4jhzs2P0eTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pMghAKgr; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=A5rr+rZC; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pMghAKgr";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="A5rr+rZC"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774577858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ClhGL1Qj+1hQGi03TAIFHJIVTqrhdd0telfDWrJ95vE=;
	b=pMghAKgrVoZDfdETN3MFEe6UVBASJqVsCwGE1Y40cIHeg8Pv4wpOA10PXBRTpod/jFl+VU
	nNz4GRwnW5AbISo2A+fjmRfpNJo/8dYJdZzfq2zTMDDPp1gUjrOm4n/Ai5e9Fom2BDydRF
	lUAb1Y1sQ3hNdkwSe3jTMe5G02QkaqgzRCL7w5/WLa/G5zMprmSDC8kGzHF/YU+cq+MYgz
	pl+azGVhc5Kceuv2YE96VJIORIF3g0+2XuMuCAWW28hvbMMX5+cvwo+GARbv2+PeAqBrCB
	njd90i9GlgJAwFgBZ3uBcW8BhiYdv0f6EtbLORlJqxbSCSC+LRRfuxNITSQ6mA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774577858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ClhGL1Qj+1hQGi03TAIFHJIVTqrhdd0telfDWrJ95vE=;
	b=A5rr+rZC3vwI3DvipvHADPvmUfI9ti37hvY9U4yaCu/db7xbgrdHOfARC28L2JxB539oyS
	LqNZUhb+xnWIVrAg==
To: Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Sean Christopherson <seanjc@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Christian Ludloff <ludloff@gmail.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>,
	x86@kernel.org,
	x86-cpuid@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	"Ahmed S. Darwish" <darwi@linutronix.de>
Subject: [PATCH v6 05/90] x86/cpu: <asm/processor.h>: Do not include the CPUID API header
Date: Fri, 27 Mar 2026 03:15:19 +0100
Message-ID: <20260327021645.555257-6-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
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
index a24c7805acdb..bea05fea5729 100644
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
2.53.0

