Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825622F3C3C
	for <x86-cpuid@lists.linux.dev>; Fri, 15 Aug 2025 07:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755241600; cv=none; b=btqIHN64KfcyRBrhJO1/Xc6+lGuQAfNSh51qUZ9jMUL0GFcm+SXyC0u3HEidWRmXYU6JAKz0c4YHWgmGRo1ggnvu7wt8dRygApBPEEbQN+6/Af67in5FN+sjRh/tIN5GsKQyn3Hk310rAY7M4og5yWl+uY9XOfjwUTcOinVMA7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755241600; c=relaxed/simple;
	bh=WKaUMiTigG+J8bPwvdvUyuQgyZRABi8qx0MrNSsQ4S8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HLCxxwJDy5lpKDpINWEoQz5A6hx7d9DxrMghdgc/3qEjRjh3Id1TRORKVjkoNPKkyHwTmDENxea1d0SZoeaLb0Sg79nuVRq8JKieh+0pdLqYorF/c9p5btDDtWf20QNBuJryC/fPzkKcFnonboZx5tpoM1TismgL7sl2k0ZvbbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xtXiwRaB; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OS4JaMiV; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xtXiwRaB";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OS4JaMiV"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1755241596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hvQSPU2GWE3krGWR+5dgO5UBBPuHLqJgUzdr77dHPXY=;
	b=xtXiwRaBruWkp3G8QsYjaG55INIfejtAO9Fi8sIAMwUUfFRPH16PoG6RRNO/3jcS7+qs2K
	bukNvKrjSznoPU5etVqV7Zrl+Ih55WPKnsUu3JpGOInwpDV2Vw7f4Ema3x33NPJKK7Lb7B
	DnFsf/grLON3OtvRsdewsFHQGDeSHpuTFlVylmzaqfMgUbO7fqn/gJdXxCbq71uR93Ch9A
	PhvoUCJsJUY/i7kfbnz+u8FLvWR8jrGp6luv8CbGbmjL/vUXddLVs0QO0jO+sSnL/Lzofi
	3Qdyt4Vcdrx2C3uweXe3yW7eE+EqbrHRytsCSchY6x6Ow2YH1hR6uOG2tqhn9A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1755241596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hvQSPU2GWE3krGWR+5dgO5UBBPuHLqJgUzdr77dHPXY=;
	b=OS4JaMiVAzh7yXU+vwtYqnJa5iIYFhomU1/wQXrS1L6tQaBPtu1XHlBDGuewu9XEBQ1riz
	i3yaydWEMjeNNhCQ==
To: Borislav Petkov <bp@alien8.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Sean Christopherson <seanjc@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>,
	x86@kernel.org,
	x86-cpuid@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	"Ahmed S. Darwish" <darwi@linutronix.de>
Subject: [PATCH v4 29/34] x86/amd_nb: Trickle down 'struct cpuinfo_x86' reference
Date: Fri, 15 Aug 2025 09:02:22 +0200
Message-ID: <20250815070227.19981-30-darwi@linutronix.de>
In-Reply-To: <20250815070227.19981-1-darwi@linutronix.de>
References: <20250815070227.19981-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prepare cpuid_amd_hygon_has_l3_cache(), which is internally a
CPUID(0x80000006) call site, for using the parsed CPUID API instead of
invoking direct CPUID queries.

Since such an API requires a 'struct cpuinfo_x86' reference, trickle it
down from the start of the amd_nb initcall.

Note, accessing the CPUID tables at initcall_5 using this_cpu_ptr()
should be safe, since the 'struct cpuinfo_x86' per-CPU presentation is
finalized at arch/x86/kernel/cpu/common.c :: arch_cpu_finalize_init().
Meanwhile, at kernel init/main.c, do_initcalls() are done much later.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/amd_nb.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/amd_nb.c b/arch/x86/kernel/amd_nb.c
index c1acead6227a..a8809778b208 100644
--- a/arch/x86/kernel/amd_nb.c
+++ b/arch/x86/kernel/amd_nb.c
@@ -16,6 +16,7 @@
 
 #include <asm/amd/nb.h>
 #include <asm/cpuid/api.h>
+#include <asm/processor.h>
 
 static u32 *flush_words;
 
@@ -58,7 +59,7 @@ struct amd_northbridge *node_to_amd_nb(int node)
 }
 EXPORT_SYMBOL_GPL(node_to_amd_nb);
 
-static int amd_cache_northbridges(void)
+static int amd_cache_northbridges(struct cpuinfo_x86 *c)
 {
 	struct amd_northbridge *nb;
 	u16 i;
@@ -315,11 +316,13 @@ static __init void fix_erratum_688(void)
 
 static __init int init_amd_nbs(void)
 {
+	struct cpuinfo_x86 *c = this_cpu_ptr(&cpu_info);
+
 	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD &&
 	    boot_cpu_data.x86_vendor != X86_VENDOR_HYGON)
 		return 0;
 
-	amd_cache_northbridges();
+	amd_cache_northbridges(c);
 	amd_cache_gart();
 
 	fix_erratum_688();
-- 
2.50.1

