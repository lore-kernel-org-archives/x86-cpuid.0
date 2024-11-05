Received: from cmccmta1.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D853818028
	for <x86-cpuid@lists.linux.dev>; Tue,  5 Nov 2024 01:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730770034; cv=none; b=VDw+zpd3VaRFw5yCzHwuUXvG7e5KHecGusndXH278Q5wOrthOqFsVWH43radFj6V6UFXWWtACYnGwG3wCbTQOMw0eRvLpxtb7+enqadDYveRO0ePwRErE4LFKpVsSV3jDdZtEsLlc63I9OQcwmfgY+aJ+XqfQgkAwic1XJ88RNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730770034; c=relaxed/simple;
	bh=lN2uE1K9qAc18/gduVxEJq69tYljSyoL2t5EPfd36XM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZzrhCw7ylO3kqcQEtXKL9uxUydUX30JCoJt2aFkJhH9BRfB/DTLf1VsORi/Tmm27oFfvEwTR1/ejz71OVLXi2YCVPWQTqwYcwHGMDtUgaOGLrM9wWfa6XHBZMaErb8s9ToDRe14gML27+UIY+FctrkVXLv/I6WA9Z/xCVDCnWmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; arc=none smtp.client-ip=111.22.67.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee1672973b085e-a0170;
	Tue, 05 Nov 2024 09:24:01 +0800 (CST)
X-RM-TRANSID:2ee1672973b085e-a0170
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.localdomain (unknown[223.108.79.103])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee9672973b0c69-c9c3b;
	Tue, 05 Nov 2024 09:24:01 +0800 (CST)
X-RM-TRANSID:2ee9672973b0c69-c9c3b
From: Luo Yifan <luoyifan@cmss.chinamobile.com>
To: bp@alien8.de,
	tglx@linutronix.de,
	x86@kernel.org,
	darwi@linutronix.de
Cc: x86-cpuid@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	trivial@kernel.org,
	Luo Yifan <luoyifan@cmss.chinamobile.com>
Subject: [PATCH] tools/x86/kcpuid: Fix the wrong format specifier
Date: Tue,  5 Nov 2024 09:23:47 +0800
Message-Id: <20241105012347.201782-1-luoyifan@cmss.chinamobile.com>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use '%u' instead of '%d' for unsigned int.

Signed-off-by: Luo Yifan <luoyifan@cmss.chinamobile.com>
---
 tools/arch/x86/kcpuid/kcpuid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/arch/x86/kcpuid/kcpuid.c b/tools/arch/x86/kcpuid/kcpuid.c
index 1b25c0a95..b94071ec0 100644
--- a/tools/arch/x86/kcpuid/kcpuid.c
+++ b/tools/arch/x86/kcpuid/kcpuid.c
@@ -117,7 +117,7 @@ static void leaf_print_raw(struct subleaf *leaf)
 		if (leaf->sub == 0)
 			printf("0x%08x: subleafs:\n", leaf->index);
 
-		printf(" %2d: EAX=0x%08x, EBX=0x%08x, ECX=0x%08x, EDX=0x%08x\n",
+		printf(" %2u: EAX=0x%08x, EBX=0x%08x, ECX=0x%08x, EDX=0x%08x\n",
 			leaf->sub, leaf->eax, leaf->ebx, leaf->ecx, leaf->edx);
 	} else {
 		printf("0x%08x: EAX=0x%08x, EBX=0x%08x, ECX=0x%08x, EDX=0x%08x\n",
-- 
2.27.0



