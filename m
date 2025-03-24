Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A1C261565
	for <x86-cpuid@lists.linux.dev>; Mon, 24 Mar 2025 14:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742826067; cv=none; b=fiMr4Twrt/bIvB99l9ww3IbfrgEXf0w4ni9TS8tAfgmQF7kriVHRTWgJI25gTpOxKiwInxf7YPBHoJvZ6gL9UAWNGizveSbgZhzBopvUgstZneYzuthCMMVsV/OcIgAblc869DbEOJvMZiKeZZaD+U6efKpNXi/4XXxalJmc630=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742826067; c=relaxed/simple;
	bh=Ushz4JR4gBXwlY3rF7uYB5PnO6rgziwqmj7rQX1GkQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pLsxVNBfWjOqtdmnBzn/C09qpS8Kp2w4ObVpxkuGWABOyWoYjG/5O9OLaOpuNlc+S56plqKnHc7MajgIFyTN0WQ02ZlyKfVVnW9OnEUOY1+2bgaeG4876HNA5I0nqJfBxWKcr9NgjvTiMfiJ0Zor/p0ATMLse+QBPgUE2qeTgCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=QoSagH/J; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=r8vrE73v; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QoSagH/J";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="r8vrE73v"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1742826064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6aVpvhv/pT52r13e6wll8TyOiNsXUS27/wMFfsB28/g=;
	b=QoSagH/JK2scReYVNHEH86huVoOXEw2kvSWIPd2zmW8YYsSwUCfVNSHspATuIZryxzXTcp
	zeSp8f/S+DhH6yTVbQn78e5NOswTEaE3ldYBce8BMt8PjARaQDDImwfMw8ZhgdrnJ5GlPj
	7gsh7FdMhjketvL1bhwrbYaTfYFAdDivkhkTRWndkZp0COjJaU7Cf8BUsYc2oyFPk04PYo
	u9/BmwbgluddHea536ZT6OYnSbpjAAsFy9YiZsRJ4S8hKsVq8Ng840PAY/t6+Rh+Yptd3e
	e7/WcjqDbtQYQxpCyxl8o2qh7hu4JtJ3caNstS21Gqo0f9rrjwhr0x/dUdMsFQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1742826064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6aVpvhv/pT52r13e6wll8TyOiNsXUS27/wMFfsB28/g=;
	b=r8vrE73v2MKfpOJsLjsdsR6pyFxjlys1eHeYar5/Z2G+WENFeNQwsCSSMMNeuqgrkdHfUj
	qyPHZz1xAzkx05Dg==
To: Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>,
	x86@kernel.org,
	x86-cpuid@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	"Ahmed S. Darwish" <darwi@linutronix.de>
Subject: [PATCH v3 06/20] tools/x86/kcpuid: Remove unused local variable
Date: Mon, 24 Mar 2025 15:20:27 +0100
Message-ID: <20250324142042.29010-7-darwi@linutronix.de>
In-Reply-To: <20250324142042.29010-1-darwi@linutronix.de>
References: <20250324142042.29010-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The local variable "index" is written to, but is not read from
anywhere.  Remove it.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 tools/arch/x86/kcpuid/kcpuid.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tools/arch/x86/kcpuid/kcpuid.c b/tools/arch/x86/kcpuid/kcpuid.c
index d518a13e4386..a89da2af98e9 100644
--- a/tools/arch/x86/kcpuid/kcpuid.c
+++ b/tools/arch/x86/kcpuid/kcpuid.c
@@ -181,10 +181,6 @@ static void raw_dump_range(struct cpuid_range *range)
 
 	for (f = 0; (int)f < range->nr; f++) {
 		struct cpuid_func *func = &range->funcs[f];
-		u32 index = f;
-
-		if (range->is_ext)
-			index += 0x80000000;
 
 		/* Skip leaf without valid items */
 		if (!func->nr)
-- 
2.48.1

