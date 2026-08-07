Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D410D34B669
	for <x86-cpuid@lists.linux.dev>; Fri,  7 Aug 2026 11:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786101382; cv=none; b=YTlpKvV2XTrghPy9F+ivgd5tPZmnjXVivalRHHMVgKtoGYOguyWy/oAMD/8aBcTGiIg8i+0e8pBxOxfj8cGqe9aI/b8bAIiIoBTlncMp97CJXLriM2XJ1E27EUOj0tdXQeU9pqnm+aLeVd2ptBe41YG3Z8dgW/l+3rerdf+lLAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786101382; c=relaxed/simple;
	bh=KwK921A7FV9t04iw1qDPxM5FJ/Z/FtZNQFg6QFAdGGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=eEKRtd1U/pJ27DIJrEwujFhdNt5gjpoJOUH/1YPx8P0JYpqtXQ79+vyCo/8W/U5OuWRDImJCdPLQu2Z++0pV8qjCCmZC3SA1A3Nm38DxbqN2n04/XSv7oPKdERwn/nZRXlEs1YqREf8V6xmZDbB9Rs49Ftzn3P6YtL/6AZaPaYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B9mHuSS5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B9mHuSS5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786101379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T3cG2Xmvg68h1YquWXZNZSiuB3H11tT/tk3zVynWlfw=;
	b=B9mHuSS5m2QSbtjoazalFn0P5CtwDOGtrxe5n+sS5TGbbQr+3kfmBPFT1FVnJQqfv4l2/a
	H1j1lsPVMO6VU+LcNApjfpFhH9rc9nb1W2wKtlKsvM72uicFzzKtv4gtFPqmWW0Ad9SDu6
	5Yj464ZhzggwUIk2xdnO+VThGS5+wZ8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-SHpqPFKWNGKz8pwDFFvLbg-1; Fri, 07 Aug 2026 07:16:06 -0400
X-MC-Unique: SHpqPFKWNGKz8pwDFFvLbg-1
X-Mimecast-MFC-AGG-ID: SHpqPFKWNGKz8pwDFFvLbg_1786101365
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-47f83450a8eso2744076f8f.0
        for <x86-cpuid@lists.linux.dev>; Fri, 07 Aug 2026 04:16:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786101365; x=1786706165;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T3cG2Xmvg68h1YquWXZNZSiuB3H11tT/tk3zVynWlfw=;
        b=Mqt9Q8GV2HJ6gmkRhxJdWjporOGzOWOHvDSJzxKsW2F6fdurT1USLEQbJucmsK5IQx
         98le4SqIG6oO3FmpdwlbIEOIb9Czgz50qvwBgnmd98q7JoSdBLeXbKqAfD5D2b6Hu0fV
         NAXGVwIBQGdhQL6zSu1kKlUD23IylxcyJaFidwNEgqZVT8VCH3bCWDcI5FoKNFkKN8sl
         hoAXl7uC7xI6WMMDsDqMTr9jo6r3D9H6sRj6IJG0bPJi+hD2yEWhRcvs6Agl6D4AFwef
         f6APVKzinfQ5IHgrFBvrUT2pS7wuNAImfHv3/0yvFlV/xZiacO1qnLJl5R6lpYwEcAH2
         nOlQ==
X-Gm-Message-State: AOJu0Yyzy7m2A3JTU6d9pofx52IMJUrLIV8zaRQ35/tEKUtz85ce7AL3
	/3y5n45lyIO7omcp1D2VFFq3MSUktmUB14qQTJvDLD0JSm5RcqveGTsd3u8JWLm/XnvbqRydwqi
	92Mth60SVxzjiQ23yKdZeWQiFLYkb8CFfYw7ar+OTL7pm7ZJaUbPgI1YXjqWcqQ==
X-Gm-Gg: AR+sD12EMdyeOuMhX/PYD1ujhZz/ELiMWLDVx7pybW6HLym5sfGQqYW6/XvMJ59WaHo
	St6337r0kR2BtFsCdAVW4MjX5/9yzyU1Ud+UzXRFiou5cjC69EzsQgxfT1yq56cyPOzCydo1QSz
	h0FstEJQj/18U2t16hycbM/avc++agS584fsOSBtP9/T59gdSy2Jp+lNH7lmej2pGOVrw6vIEfr
	Tqhjuxzwmr7sX6jRyoguc8cVj6cE46y7xvk5jnoDScVSG4j/y4ZRd7/ZsDvLdEyX/6SC0R0OcQO
	mq+glVHER6ffsDljTKz/L7P8ELj4O2XuDyr5rr41o0ON0m9MDGnHiHO4emJIAPUBiKv4Mv5gOuU
	08K2hHAvAq20mKu7DYflyVvMz3ymuKu8etZ3Ia5MjjkIGsI7iN4CCijxZo3plAynuWHTjJE7HMJ
	M4Wpc0ww==
X-Received: by 2002:a5d:6ad0:0:b0:47f:7129:6e2d with SMTP id ffacd0b85a97d-47fec51fcbemr28460470f8f.17.1786101365011;
        Fri, 07 Aug 2026 04:16:05 -0700 (PDT)
X-Received: by 2002:a5d:6ad0:0:b0:47f:7129:6e2d with SMTP id ffacd0b85a97d-47fec51fcbemr28460416f8f.17.1786101364643;
        Fri, 07 Aug 2026 04:16:04 -0700 (PDT)
Received: from leonardi-redhat (host-79-26-33-207.retail.telecomitalia.it. [79.26.33.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48002145a2bsm4700660f8f.4.2026.08.07.04.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 04:16:03 -0700 (PDT)
Date: Fri, 7 Aug 2026 13:15:59 +0200
From: Luigi Leonardi <leonardi@redhat.com>
To: Tanish Desai <tanishdesai37@gmail.com>
Cc: x86-cpuid@lists.linux.dev, darwi@linutronix.de
Subject: Re: [PATCH] db: add Hyper-V leaf 0x40000001
Message-ID: <anW5m3Mb-Puk5hBu@leonardi-redhat>
References: <20260721173159.46494-1-tanishdesai37@gmail.com>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260721173159.46494-1-tanishdesai37@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eoG72AzzWgU5dnrj1V98EnXY0KlVAIgHLXCLnPJeUpQ_1786101365
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

Hi Tanish,

On Tue, Jul 21, 2026 at 11:01:59PM +0530, Tanish Desai wrote:
>This patch adds CPUID.40000001:EAX, the vendor-neutral Hyper-V
>interface signature ("Hv#1"). It is used by COCONUT SVSM for
>Hyper-V host detection before enabling Hyper-V specific paths.
>
>Signed-off-by: Tanish Desai <tanishdesai37@gmail.com>
>Link: https://learn.microsoft.com/en-us/virtualization/hyper-v-on-windows/tlfs/feature-discovery
>---
> db/xml/leaf_40000001.xml | 29 +++++++++++++++++++++++++++++
> 1 file changed, 29 insertions(+)
> create mode 100644 db/xml/leaf_40000001.xml
>
>diff --git a/db/xml/leaf_40000001.xml b/db/xml/leaf_40000001.xml
>new file mode 100644
>index 0000000..c37bb90
>--- /dev/null
>+++ b/db/xml/leaf_40000001.xml
>@@ -0,0 +1,29 @@
>+<!--
>+*** SPDX-FileCopyrightText: 2026 Linutronix GmbH
>+*** SPDX-License-Identifier: GPL-2.0-only
>+-->
>+<leaf id="0x40000001">
>+  <desc>Hypervisor interface signature</desc>
>+  <text>
>+    Vendor-neutral hypervisor interface identification.  This determines the
>+    semantics of leaves 0x40000002 through 0x400000ff.  Software should base
>+    compatibility decisions on this signature rather than the vendor ID from
>+    leaf 0x40000000.
>+  </text>
>+  <hypervisors>
>+    <hypervisor>Hyperv</hypervisor>
>+  </hypervisors>

looking at the leaf_40000001 `hypervisors` are put in the subleaf section. Not an
expert, I just noted this. I'll leave to maintainers to decide if it
makes sense to change this or not.

>+  <subleaf id="0">
>+    <eax>
>+      <bit0  len="32" id="hyp_interface"           desc="Hypervisor interface signature">
>+        <text>
>+          Hypervisors conforming to the Microsoft hypervisor interface return
>+          the ASCII signature "Hv#1" (0x31237648) in this field.
>+        </text>
>+        <values>
>+          <value      id="0x31237648"              desc="Hv#1" />
>+        </values>
>+      </bit0>
>+    </eax>
>+  </subleaf>
>+</leaf>
>-- 
>2.15.0
>

Thanks for the patch, this would be very useful for SVSM!

Luigi

