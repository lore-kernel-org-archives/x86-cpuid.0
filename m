Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A587426ADD
	for <x86-cpuid@lists.linux.dev>; Tue,  8 Oct 2024 13:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728395535; cv=none; b=A3UJ5A5VemaKx3aQAkboAMEDvGY0xxcnieTCjb2aagPqa75umNJPfGiC+fBbHCVO+NQ5gfN6XZhK8euXBzDxmdCVDtgR8EiNrGBuqpT+t3WiZUIb/nPXAiAPrcnz1Jtl3nQeozK0V669UVokYEv3PGodBje/UAXJZRlkPxziWz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728395535; c=relaxed/simple;
	bh=NFMIMEJ5FDjPn+fUYAN9R1yRpjM8hb5ejBLgzRRB9IM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nW2eo2hV4gU/nPKbrmPlSKSRxjjfCjYPP8kHqP6ElVciE8KTd81viduaEq+L0a/S6VCLhZaxTu9OS1y5wdHA33aV5+1GP55Q8hjnPFz6+CZG68ERgZXORo+dYAzNvIIA9o2W5rxd7+rYWpKouMGbKFRYVpEm+uJb+QPJ9QM7lKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=qJdGAI6i; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="qJdGAI6i"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a9939f20ca0so502836366b.1
        for <x86-cpuid@lists.linux.dev>; Tue, 08 Oct 2024 06:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728395531; x=1729000331; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+YR/AcfqAwHe7hZLcMhmt2GSYNuGDae390HFbntRbo4=;
        b=qJdGAI6iMwy0ra9Vs1KHpaNnpqkBserLm6ydMc+3HT+GlsJ5OszU9aZbaGH5yrj4RR
         4hlB6biroACy99IgBloYn35+q37pgr4QtuCMZONsgdoHp3/BXJutvkoL6icoygPFLhNr
         Z8We4lQJhMQ4JRhObiZJosWCXWqYWOIe8eVNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728395531; x=1729000331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+YR/AcfqAwHe7hZLcMhmt2GSYNuGDae390HFbntRbo4=;
        b=dQYfzjkXZ5wvriFa0daTiN76iueHp/FPc85ughbBxuJ2COuCTv5+c8MdhhzsUUz/HQ
         +nWxriVcZYIikWi2GwWdrQcjCmBhtpQZBSOthk03SViAeA7TLk/A/ZsMkCAEt34zoBK5
         XyescnYklAhDrLbvzw7FyyY82AhzDk2cpWXU2yJkVxdXlUrmU+O4KG3Hcs7RRg0SvrZu
         OyiHLTjjv72uTfzVC2Ggl/DtCTNUaAvTSgcdUj0Inp7VGRzIghHfQ1OCfVwDsEJ1KhTv
         pvtT11jUSMNI6s8nx3tSfZ7GpkAqwqAqVPAx//MxXpxkh4miWz43JIWmcZF0daIYHsov
         YhQA==
X-Gm-Message-State: AOJu0YxTEgex2fdb9wAFuq01f40DEc9nbBRt5k25AEZxVqIGY9lqX/48
	buL40a3MipL2p/bx4MjJ0tOU2hxajwmQLk4j7B4DEtOxPe3dzprCN7k0u9EGnuMKOb0KCsuf+5I
	RfsA=
X-Google-Smtp-Source: AGHT+IFawg/UYfUFfeEx8b3YaFhD4T1ikWEiUaB6tX6LsAPKmZSPUq94+vxWYomTVI5St/O9VpfX7A==
X-Received: by 2002:a17:907:1c05:b0:a8d:439d:5c3c with SMTP id a640c23a62f3a-a991bce4fe2mr1733209666b.8.1728395531475;
        Tue, 08 Oct 2024 06:52:11 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a995350d522sm281131166b.32.2024.10.08.06.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 06:52:10 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: x86-cpuid@lists.linux.dev
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] db/leaf_1d: Correct XCR0_CET_{U,S} information
Date: Tue,  8 Oct 2024 14:52:08 +0100
Message-Id: <20241008135208.2567502-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The description text itself mixed user and supervisor state.

Furthermore, CET is not an AMD-exclusive feature, nor even AMD's feature; it's
Intel's feature, which AMD implement a subset of.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: x86-cpuid@lists.linux.dev

I have to admit that I'm very confused as to why we have the <vendors> block.
Any vendor can implement a feature, so this block feels like it can only ever
be stale.
---
 db/xml/leaf_0d.xml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/db/xml/leaf_0d.xml b/db/xml/leaf_0d.xml
index d36b36b01198..be34588903fb 100644
--- a/db/xml/leaf_0d.xml
+++ b/db/xml/leaf_0d.xml
@@ -60,13 +60,15 @@
 	  <vendor>AMD</vendor>
 	</vendors>
       </bit9>
-      <bit11 len="1"  id="xcr0_cet_u"              desc="AMD XCR0.CET_U (bit 11) supported (CET supervisor state)">
+      <bit11 len="1"  id="xcr0_cet_u"              desc="XCR0.CET_U (bit 11) supported (CET user state)">
 	<vendors>
+	  <vendor>Intel</vendor>
 	  <vendor>AMD</vendor>
 	</vendors>
       </bit11>
-      <bit12 len="1"  id="xcr0_cet_s"              desc="AMD XCR0.CET_S (bit 12) support (CET user state)">
+      <bit12 len="1"  id="xcr0_cet_s"              desc="XCR0.CET_S (bit 12) supported (CET supervisor state)">
 	<vendors>
+	  <vendor>Intel</vendor>
 	  <vendor>AMD</vendor>
 	</vendors>
       </bit12>

base-commit: ca8056ee7291370e691d04a24d0a045f688f8573
-- 
2.39.5

