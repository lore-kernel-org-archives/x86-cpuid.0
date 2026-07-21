Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0173346A61E
	for <x86-cpuid@lists.linux.dev>; Tue, 21 Jul 2026 17:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784655137; cv=none; b=UMymjc73c34fLXkhh13saA6TQOvbxfQbCipRJLtb1n+ZTQH2/Cri7Rp+nLiyigPKtqDUNlyIxxBA+PAGkArgRx/v4kOHjfev9XIFahcpOUIqEsa3E4ENjs7YfP5Hl6iPrOWSnXoYPVxtgE/SusfeBta9pY6vQuDZ/gvH9Wroj20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784655137; c=relaxed/simple;
	bh=RD0z+MyG3N6GXHAObHDQppz8VM89ey7+cChkr9EFtzU=;
	h=From:To:Cc:Subject:Date:Message-Id; b=PVLAzrfESPU0fvYkqVk/aebXseBv43YMq+odz9ar+QccqmdDl/Bo9nZBQTaLg59/M5LNWPUsh/wgeoGMos80R9cnCAK8ec5cxCmiuTXP/uOHuOLq0UnPVQFGWcB5+FIpfFZi5taCfxvwH+CzCsZlv7hUqvbLuV0ovN/9+SY814U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DmT3+es6; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DmT3+es6"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-ca12086c06eso9667827a12.0
        for <x86-cpuid@lists.linux.dev>; Tue, 21 Jul 2026 10:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784655135; x=1785259935; darn=lists.linux.dev;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ifsb14vt7S886sWfez5ztBNhWipPdlLa5blNsl2SPgc=;
        b=DmT3+es6SwYFqWq8wqTzWqsBlZVMqDt7WynU84s8zJO0460tYq8a9DZFOoclOo9kdS
         njbH1w3MToDKl30ybVc2d7LbM3tqneplUzCRtYzlM1pr/75mICNzab9td8kNhlj6jkSh
         X1Z/aKGYoUzPp96tHdY1AsYs/pxr9YSf3bLnswFHvZagRbTkHCUWAkjsVzfZTstdd08Q
         5GMF539UnHXYWp7yT2Et77POCMKY4eT7dWiPv5FGxJXKQVKxlGLc7FeD41crqCwp2G6l
         ttInJI3d8jMjDyX2aFEVHw0xnkR2kecSiEaiFt+I2iqv02H/lAyaTZGSEpTI5eFCaiWS
         umOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784655135; x=1785259935;
        h=message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ifsb14vt7S886sWfez5ztBNhWipPdlLa5blNsl2SPgc=;
        b=YEWqB5S9jdaeramvYX5JaGTvlmLjwRiSPu9ZCYMsCF5IIkD0bOTalFOqg6G1VnVMQd
         RoXZa+Z7RuNBmfY6YddPJ9ER9c4SVIC7rEgGX1ejlCHnqGOauB3DyL88t0t/ENP9M5Ln
         7W7JimEaBxmnkEGi/ePDWjGs+Lohu/NQrCowya7wD3XuIcSG2LcERu2Pd1iL5DdNGPCX
         Fe+LdaCYkV4eCOBxrflUu00iWXMsrXwBXYKp4BU8gYRESR9MgOdi5LxvFwYAAYYFXH2e
         WJtH/YC4Y+7e/lPRmLcRakoaPY2T+0cXUnxqkWc3jll29fiITvHgMxCUciNeMdndNXU8
         +3ZQ==
X-Gm-Message-State: AOJu0Ywa22CipCXIm32i+H58gN7qNOYRxn2hBaovUc9XtIQ/XzD9Gg4T
	DyQpzi+0Utk2ayGKJnDm1tiswH+sbpWEfHNm2AKc+SBzqOaHcFoue7xuvx2h1Q==
X-Gm-Gg: AR+sD10vA8vFYDbK6VJ+wq4C4L5rTTab5eIankgjqWgpgm7wLwkXhDeXKGNbzEonzu3
	U1c+QgAQfw5kK4WsGWihdLRHmBsgVGSoLaKVX7SZ/Og+kAMivViFy8Gos1nAlLYNsmDVF0lfagW
	22fPeexAd04lVrx7P1QhrFLwCm2d5/4qqY48QWo3YJNORFQFGBfhCjIk7DzV2mC7CL5TgKAkznQ
	ifl9XSGM31BnHcR109qTWrhtVqoAYYFBTxeC+HODyUpkk8D42o8ASvdcGoKDN8WHP/J416/XQUv
	Sc7SFdv5I2tjIXGRKAakKPejAGyWu6wwOET3scTTePNOiA3vlUklBfEKqP6a4VYC8vzitRTkTl4
	4PN+iJYTOvXRsDn9NmvJ77XIijIZwj0NAqPtuUXADBEhAaoPXBjJfIPdQxP+1Pud2hbTt01sLjo
	k0fad29gyAgQXOs0iUizsEGQusTZT1eT1CP+1FdiIRVFNagZph2jSPTAFJmTNHfIDTlg==
X-Received: by 2002:a05:6a21:7111:b0:3bf:6c08:fb93 with SMTP id adf61e73a8af0-3c3ada33bf3mr20413439637.53.1784655135087;
        Tue, 21 Jul 2026 10:32:15 -0700 (PDT)
Received: from localhost.localdomain ([106.51.210.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc193f8sm2096043eec.1.2026.07.21.10.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 10:32:14 -0700 (PDT)
From: Tanish Desai <tanishdesai37@gmail.com>
To: x86-cpuid@lists.linux.dev
Cc: leonardi@redhat.com,
	darwi@linutronix.de,
	Tanish Desai <tanishdesai37@gmail.com>
Subject: [PATCH] db: add Hyper-V leaf 0x40000001
Date: Tue, 21 Jul 2026 23:01:59 +0530
Message-Id: <20260721173159.46494-1-tanishdesai37@gmail.com>
X-Mailer: git-send-email 2.15.0
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>

This patch adds CPUID.40000001:EAX, the vendor-neutral Hyper-V
interface signature ("Hv#1"). It is used by COCONUT SVSM for
Hyper-V host detection before enabling Hyper-V specific paths.

Signed-off-by: Tanish Desai <tanishdesai37@gmail.com>
Link: https://learn.microsoft.com/en-us/virtualization/hyper-v-on-windows/tlfs/feature-discovery
---
 db/xml/leaf_40000001.xml | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 db/xml/leaf_40000001.xml

diff --git a/db/xml/leaf_40000001.xml b/db/xml/leaf_40000001.xml
new file mode 100644
index 0000000..c37bb90
--- /dev/null
+++ b/db/xml/leaf_40000001.xml
@@ -0,0 +1,29 @@
+<!--
+*** SPDX-FileCopyrightText: 2026 Linutronix GmbH
+*** SPDX-License-Identifier: GPL-2.0-only
+-->
+<leaf id="0x40000001">
+  <desc>Hypervisor interface signature</desc>
+  <text>
+    Vendor-neutral hypervisor interface identification.  This determines the
+    semantics of leaves 0x40000002 through 0x400000ff.  Software should base
+    compatibility decisions on this signature rather than the vendor ID from
+    leaf 0x40000000.
+  </text>
+  <hypervisors>
+    <hypervisor>Hyperv</hypervisor>
+  </hypervisors>
+  <subleaf id="0">
+    <eax>
+      <bit0  len="32" id="hyp_interface"           desc="Hypervisor interface signature">
+        <text>
+          Hypervisors conforming to the Microsoft hypervisor interface return
+          the ASCII signature "Hv#1" (0x31237648) in this field.
+        </text>
+        <values>
+          <value      id="0x31237648"              desc="Hv#1" />
+        </values>
+      </bit0>
+    </eax>
+  </subleaf>
+</leaf>
-- 
2.15.0

