Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D73B2F690F
	for <x86-cpuid@lists.linux.dev>; Sat,  2 May 2026 22:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777759837; cv=none; b=rLlQktppY399GD7UCC/tEQqLBTVGWr5fi3lg2/Uvh8trz4LH0Q3IxD7TREhGG0nT6kufATV4814r0cA8gL7/dDHPSTKtSnp+Co1JGPqllu2PUaWsqV44sT037yS11O08gT2gvsUa0SeK+o66DUK3oc8ybl/d7oCoprl0E2ZVIYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777759837; c=relaxed/simple;
	bh=wEmaTSfAAmqLY0e5lzZCFR1s2aWwPm5zfhxxiUCw4tY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tDOYTGy58ymAeJrRlTzkN4B7YZ81+Ljle0xUg8PjsbKXG8CNc2lj4fxb1B7IHulDU/csLT4C37ah7pq8N6Hy2lPaerSIF2uSZXWW5hFA/Sv7iCXgvxVwFcFe231ezeO1iPG0+uOaS/K3gtENYzKkzlhFnbHxC9rqWE0RxXcAQ5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C0eE+BgR; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C0eE+BgR"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7b6ae2ea4a1so27371517b3.2
        for <x86-cpuid@lists.linux.dev>; Sat, 02 May 2026 15:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777759835; x=1778364635; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BtyC2HwxjEku3oE5Tx+mZC+Fd1YZppncyqkwce1J8qU=;
        b=C0eE+BgRWoG3wAOt3Jr2bz1/O9Ob/31ehQ7UAM0c1oUWHlpZlmlTZIDtWek2bZRT+1
         qHzgM6cYLSQNoa0caoUS0PUL8LMGRe9GnlIJnYwVUhdOksptQTlNDB5QRdH5wGiqbURI
         Vid09yJUhB1UyT4nGTy/AFo3OzrAHEMQMBElxyuhBEdYIPOWOpPHlZ08HOfGYINafKem
         s2sWl2lAztZReW4V164dY8i3+HLa0vlVP532i0OT4eHNHDFWAheaQ5uiaIq9zpgDdvDc
         61PDJk0/7tB0PNqmYJhdsl+XnnpXBAEkUpcyw7ARp4G0E300Is0Jw1zZg/zxUEpYuYrN
         JuSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777759835; x=1778364635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BtyC2HwxjEku3oE5Tx+mZC+Fd1YZppncyqkwce1J8qU=;
        b=lfsNI5gmQAmdHX/gS1yuKibXIGSKdy1n4B2wNoHJFcsrCbEhqJJyaYlS45kyNGWRet
         CgOxbQaEx5tAsOmJXOctLjheKsUFCCiDysecmW3DxnmAkXdkFYslLoWjroE73PgQBzUT
         fJO3lZL0G0aNXGrvA+QYQ6ND1Gnu2ObM96nYvd2OP24zXZpTbc5Bf5yXqmRB7E5WKkWz
         ha1tPaNe0TLT6g4V6j5pMOmjq0IL32mkIQkjVc9TVVk6y9dTTfWbUi9W4uTnkHfwveWU
         Q/ypdNownNhQAzQzvCswg9xDpQm4pNdzwPPAjGr9mLmbc7sByzUN5yGI7QUYDRz3EAMw
         fm7w==
X-Forwarded-Encrypted: i=1; AFNElJ+iDVbnBZ2/wFCpFjj2pdFROGKjs1AkAV1xfnrJYe92ssEQICHADVMeIReATMB3cGR2M2de3YFNThM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyBD4rWTCYaac/AoZQ0UeJduvwCBFUDD8TTgloNlpuK1urqktzL
	31DjZm5k3M6lmtkMGBnHYrrWkiD/46S71Fv2CAsn34yaB0oqKXRqBiF4
X-Gm-Gg: AeBDiet//3PuI+5i2yhjr87fg8aChkMUL7LBh25z3YwGHzWfxA3xqEGO0eUaNIVUFWy
	HoqGe9kR99b5dk4p3PHuDOVF0Igsj5FK68smnH964XGrC95cQAHewGIRyfuelwepPh82+XWlg7k
	N/4BlolcndX9GqsGTmhCpMoTgr7gT8V+0bqMoFbzChWuUWy8yprEFSdJr+mAzheDpQDR/HQRdPF
	fYvr3yZ+OrsFHwAKQLSqio9NCM6sinDzVE+adS4a/QBsECbAE3pijxYYhObIsWA5XyoXef2+ptX
	uL8qn/fenO2F6BaVzMGiRRroPJBUxC5eoILsvbXtOR9RWdXhlJbkNMZX1rLZp/xl5OEAgJfM7rN
	gdV3gOjSxqa5wceHSgekCeFjhTlu+Y79Ig0YrP88tcM1+J9bcbQO6eMkqH6xBpqAFZFtXGPUQZ2
	VF3svh2oRic579ISR842SxcPWnR/EinNmEbCyETYoKJ7JloGvKpP2KIwx0l6G3h9Fbcqox7pxzp
	sQawUVKpR/cTGRKMxRpEL2zYj0ONQRVjg1/J8rqQg==
X-Received: by 2002:a05:690c:f08:b0:79f:3b8c:a7fc with SMTP id 00721157ae682-7bd77144b29mr47963097b3.39.1777759834912;
        Sat, 02 May 2026 15:10:34 -0700 (PDT)
Received: from tradnomic.. (162-196-88-40.lightspeed.frokca.sbcglobal.net. [162.196.88.40])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6655d954sm28853537b3.18.2026.05.02.15.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 15:10:34 -0700 (PDT)
From: rafad900 <rafad900@gmail.com>
X-Google-Original-From: rafad900 <19312533+rafad900@users.noreply.github.com>
To: rafad900@gmail.com,
	bp@alien8.de,
	tglx@kernel.org,
	skhan@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	x86-cpuid@lists.linux.dev,
	rafad900 <19312533+rafad900@users.noreply.github.com>
Subject: [PATCH] tools/x86/kcpuid: bound CSV field copies to avoid overflow
Date: Sat,  2 May 2026 15:10:30 -0700
Message-ID: <20260502221030.1081829-1-19312533+rafad900@users.noreply.github.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I added bounded copies of the bit descriptions to avoid possible
overflows. I tested by compiling the tool and scp into qemu along with
the .csv file. Then ran the tool and saw no errors

Signed-off-by: rafad900 <19312533+rafad900@users.noreply.github.com>
---
 tools/arch/x86/kcpuid/kcpuid.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/arch/x86/kcpuid/kcpuid.c b/tools/arch/x86/kcpuid/kcpuid.c
index 7dc6b9235d02..c17dbcf453eb 100644
--- a/tools/arch/x86/kcpuid/kcpuid.c
+++ b/tools/arch/x86/kcpuid/kcpuid.c
@@ -415,8 +415,8 @@ static void parse_line(char *line)
 
 		bdesc->end = bit_end;
 		bdesc->start = bit_start;
-		strcpy(bdesc->simp, strtok(tokens[4], " \t"));
-		strcpy(bdesc->detail, tokens[5]);
+		strncpy(bdesc->simp, strtok(tokens[4], " \t"), sizeof(bdesc->simp) - 1);
+		strncpy(bdesc->detail, tokens[5], sizeof(bdesc->detail) - 1);
 	}
 	return;
 
-- 
2.43.0

