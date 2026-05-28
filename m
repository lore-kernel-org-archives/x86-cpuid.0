Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB033F7ABB
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982970; cv=none; b=lCeeyw5GjGGXGQbZynSY/wolmu40vxSIIjm+lCBzfak6XTpjJ9IsRcAqjjilgqBv49XiO19deUWn8AvS5oYjNVYXox8zlwj+S7XFkcCD5LhnbxjoS9Wp6oPrVKehnfIshTpn7/k4l4QL/cSqH2xIdyeeah5EDhMWYowgAqzikAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982970; c=relaxed/simple;
	bh=6xUL5WMCAhMH7AxwEc+7wIL9NBviw4BJq67doOtj318=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SCPtFjifwWn2oUJjd3jb3Nk7zHL1uyMzxnt5om5sLKkw60hP69/sIrcgUIRjNcJ2/qMf51RdONNlddD5vSCDOIM5Cn76HBKnixX26AelDgPYaOiffF9j5CepU1JcIYoXMh5lIyROkolSQ7Pql6ppspu2JWG2amWbNss+oeJC4Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=IDAQZzuF; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xk91rWWi; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IDAQZzuF";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xk91rWWi"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Z/vIg9LVX8/DLgPonJDlTDUj6Wxqd64AUvq7JbaCko=;
	b=IDAQZzuFW6QPQkx94CnrqRinyLf7tUd10fdmT5FJQMjEkMwPRP15dIprimj/D44Hv2FgQm
	XIO7bSObPe2k801rvtpIuPYLJlyxO1uA5qz3wGR9RxjUk5QiaSooPCu+bRljqjoj4gpCNy
	1CQ5HNfsohVL3zz24cdHU8M9Z0UxfVteYMSk3eBIuxXEx82MEC2Y8TanqKFHDYiPBdmbgz
	eMZQJPlbsgciUEVO6NbMgxqjKe4crCjpUGLOv7jPMBbF/q/29KP9kkNkoQ8STcBGrJVZqE
	f5l2/CgxyaKkpTseP9Y+nMvdOeXevR6iCC1bIRaCYEWhOAXOFHgwTt5Y+MT+5g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Z/vIg9LVX8/DLgPonJDlTDUj6Wxqd64AUvq7JbaCko=;
	b=xk91rWWipOXb2hEVyySYF1KGMAsRdjm5IsyOf1EiYs6Zl26sTjEyhRdScNQ4JVVRID676k
	zoO1NuSYo9bftACQ==
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
Subject: [PATCH v7 053/120] x86/mm/pti: Use standard CPUID(0x1) types
Date: Thu, 28 May 2026 17:38:15 +0200
Message-ID: <20260528153923.403473-54-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use standard CPUID(0x1) types from x86-cpuid-db instead of a manual bitwise
operation.

Note, keep issuing a direct CPUID query since disabling a feature bit like
X86_FEATURE_PCID will disable its backing cached CPUID bit in the future.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/mm/pti.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/x86/mm/pti.c b/arch/x86/mm/pti.c
index 598f553cc871..1f0a5e84cdca 100644
--- a/arch/x86/mm/pti.c
+++ b/arch/x86/mm/pti.c
@@ -631,13 +631,16 @@ void __init pti_init(void)
 	pr_info("enabled\n");
 
 #ifdef CONFIG_X86_32
+	struct leaf_0x1_0 l1;
+
 	/*
 	 * We check for X86_FEATURE_PCID here. But the init-code will
 	 * clear the feature flag on 32 bit because the feature is not
 	 * supported on 32 bit anyway. To print the warning we need to
 	 * check with cpuid directly again.
 	 */
-	if (cpuid_ecx(0x1) & BIT(17)) {
+	cpuid_read(0x1, &l1);
+	if (l1.pcid) {
 		/* Use printk to work around pr_fmt() */
 		printk(KERN_WARNING "\n");
 		printk(KERN_WARNING "************************************************************\n");
-- 
2.54.0

