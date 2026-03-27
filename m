Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06812394499
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774578166; cv=none; b=kTwJEjdIA9wHsaTPQk1/OtVqMS5MnL5+lY+3MZfW6dYltfNScfUYzpejBqnl9Y47Z6ZEdHYPWvG3pCLHI21EkC6+LKN935HbWYXD2BmfYqLuyhzbm6T2OGqUObjjmEg61SKVQHhhzAbgI7gRjJy6qt5uYWL+KBTSObOn8d4w8gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774578166; c=relaxed/simple;
	bh=V37j0rs4TGKyYARlAleKL5dHag3KfmGVe/rCYIBvz2U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y3XlWvFCQTMUnwCC3l7vUOmkfcF3jtKrGpySuDwbArn5MVBeQ0i9/6PEQCfHI7+JPonxnD5661rm95a8jxGo2usoBQv/iVhfrG+3wUapC0WnUP0IHsp1AG9o3R9Fp9eZ5cjyS6XZz7G8EFVd1EaBsFmD7ECu2s1ZXP+pf7hoCHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fslI8Zh+; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=/AWgwIc7; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fslI8Zh+";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="/AWgwIc7"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774578163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xz4rtZX3T1lJccTw4y5rkf/qvGVIdVtkoE0691sXqKk=;
	b=fslI8Zh+RqX+jY/5afvQ6zHSmgTqLj7vaaa6OmsQrvrHGOD6wr+HLKXGucLjqgKy0TizIG
	b4Q2HqjR6bs8CyR7UYET4JmdUg3/LbdFSynE/KXGS1yrF0YDxIHtCGxYfNu4+9ayrRh0k6
	BHZ+KyB7IJ+XDkSwWg8pCPjgS5Jka39ZraD3+K4b8jEbgt8WmnhUnDwgBrn+9OqBJVQbI8
	aGLXwlIq9uwvFVCBIgS2HeG4gF1LjIxLLHt7QrbPnsU2YTIPW8sevpa7NCyfU+GaC91k+W
	SWLYLqhFmxNlFOw6LkRi0kYOfJwj4iDudEZG0YQqwrK72a0wVhBi2zkaPaD8vA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774578163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xz4rtZX3T1lJccTw4y5rkf/qvGVIdVtkoE0691sXqKk=;
	b=/AWgwIc7/StkReSUSN/760KWG4aofwSG/uezPYTcmygxEXwWW6cm3pU+Wo6v2w7lcYX2Xh
	BgSIjhR62ZSd71AA==
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
Subject: [PATCH v6 90/90] MAINTAINERS: Extend x86 CPUID DATABASE file coverage
Date: Fri, 27 Mar 2026 03:16:44 +0100
Message-ID: <20260327021645.555257-91-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add

    arch/x86/include/asm/cpuid/

to the x86 CPUID DATABASE entry since the newly-added CPUID APIs are now at
<asm/cpuid/types.h> and <asm/cpuid/api.h>.  The auto generated x86-cpuid-db
CPUID C99 bitfields header is also under that added folder.

Add

    arch/x86/include/asm/cpufeature.h

since it has the X86_FEATURE word names listing, along with the X86_FEATURE
APIs, which are now both routed to the CPUID tables.

Add

    arch/x86/include/asm/cpufeatures.h

since it has the X86_FEATURE bit listings, where by now new feature bits
should only be appended to; never modified in-place.

Adding these files ensures that myself and the x86-cpuid mailing list are
CCed on related patches.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8cb3b9fcface..6cd8d0e4fb99 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28564,7 +28564,8 @@ R:	Ahmed S. Darwish <darwi@linutronix.de>
 L:	x86-cpuid@lists.linux.dev
 S:	Maintained
 W:	https://x86-cpuid.org
-F:	arch/x86/include/asm/cpuid/leaf_types.h
+F:	arch/x86/include/asm/cpufeature*.h
+F:	arch/x86/include/asm/cpuid/
 F:	tools/arch/x86/kcpuid/
 
 X86 ENTRY CODE
-- 
2.53.0

