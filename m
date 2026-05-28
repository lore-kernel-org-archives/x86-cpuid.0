Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC3F481236
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983185; cv=none; b=jWD35UxB3ieGugsTpXDV/up3t6yBDyQKYwkj5KDRLoQNA+64SJE6td/Kge0V1wNWJaxYNanXh6pQnPNUq60baxw0gsFqUiW1oLjsz9RdNJBHmbR4TxZVTYKD0XJuINKI8+OjOqECYUlExlxRrd4cFgg7tf4E9Si4kp+u3IVtPXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983185; c=relaxed/simple;
	bh=8Dysoy4GcAk7pdX2Dppk+9sUkzCkm3WjcIV7eAxf77c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IK7TpqyCcaFX480jhEc8FTxFkjUeTEDQIaR/A+mSCQ0j4pou/YYK4DvkFEi3rohmeFuw76qlv00XMY1JH41d35hmYiPm6rKJnDqjuR3uA8xEN12TWFLl+3FVu2hQKA4q8vWYcbDVSaTBe5a+ycwJoDMDgKVm0XnR6ETKeSWW8RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VsECp1uS; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=+4BjLC8G; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VsECp1uS";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="+4BjLC8G"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g0uBWGq3OqkcYh6bkNnYpZN2OjwIrkUnZ89AV24E6zw=;
	b=VsECp1uSBT8S+VBFVm242FpeJsn58PtuCQrCI5Q5YY4tQiXXRy44dZfiDsumaZvbN1BI76
	JRqtMPSfn8V0Yv4surX8EcnLikCvIPaPVdwgOVTAJBLTyo0fAK4mhf2ULt6/Sd30hJ2MOQ
	nv6S4Ku7HctzfI+v/r2MorLplinj3/NEy/yCl7IQgy7A76HjnWsaj1uHztwD2GJM7VAPKl
	+i/4k3/Kak3Ay684zFUnVXozIA2Ck07uuC0Yg0lU7r9XuKq+81T5u26VHsfN0R7QX3xxe3
	K63hkVMDX6S7/85cIysXUMWMWtRzdPiEXkW/+MT84AlVB+ryC1Q7gLvviVP1iw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g0uBWGq3OqkcYh6bkNnYpZN2OjwIrkUnZ89AV24E6zw=;
	b=+4BjLC8GtBlxzaBcp4KzGJfnRyVJoyuFVLk/ezwNinqvOjg2hlMUOPobYsjsdCM2Fi0O61
	HhbEQFcfd8JjqAAA==
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
Subject: [PATCH v7 120/120] MAINTAINERS: Extend x86 CPUID DATABASE file coverage
Date: Thu, 28 May 2026 17:39:22 +0200
Message-ID: <20260528153923.403473-121-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add

    arch/x86/include/asm/cpuid/

since the new CPUID APIs are now at <asm/cpuid/types.h> and
<asm/cpuid/api.h>.  The x86-cpuid-db C99 bitfields header is also under
that folder.

Add

    arch/x86/include/asm/cpufeature.h

since it has the X86_FEATURE word names listing, along with the X86_FEATURE
APIs, which are now both routed to the CPUID API.

Add

    arch/x86/include/asm/cpufeatures.h

since it has the X86_FEATURE bit listings, where by now new feature bits
should only be appended to; never modified in-place.

Add

    arch/x86/kernel/cpu/cpuid_parser.{c,h}

since they have the CPUID parser implementation.

Adding these files ensures that myself and the x86-cpuid mailing list are
CCed on related patches.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 MAINTAINERS | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a0137a898927..5fe7150a542e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28869,7 +28869,9 @@ R:	Ahmed S. Darwish <darwi@linutronix.de>
 L:	x86-cpuid@lists.linux.dev
 S:	Maintained
 W:	https://x86-cpuid.org
-F:	arch/x86/include/asm/cpuid/leaf_types.h
+F:	arch/x86/include/asm/cpufeature*.h
+F:	arch/x86/include/asm/cpuid/
+F:	arch/x86/kernel/cpu/cpuid_parser.*
 F:	tools/arch/x86/kcpuid/
 
 X86 ENTRY CODE
-- 
2.54.0

