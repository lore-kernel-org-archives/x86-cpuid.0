Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946D8207DEB
	for <x86-cpuid@lists.linux.dev>; Thu,  6 Mar 2025 20:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741294230; cv=none; b=mDUHB0HQrlfqW6DsdMZz66aiYdcJMl9TklvqqKa3mZ7rZvez98KcoYfqEXuZxl6aQmxYScPPYadKL8D8zWaeDG58ouLIe/F6yoRL9qMPEimZCgM4jiXdqPFCzjNRjZXa+Hnd1m+/WUuuaRr8vgUvoGC3WfuzLM2I4hAzzK+k/Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741294230; c=relaxed/simple;
	bh=KRluoi8tQE78rsIoqjBBTa7FMdeeGx8cw5Ioy9X4io4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j8/AQlFTABDl/AfaZwOUaflRtNTHIyTAo9lWBzrQyW9p+YSwaSksfRut4y4zTs1Q6WdIei3CWaPWCDl2BE3QL2cdB5kpGbIEe+W98NjHNB9zsUBFjW0G+A4KyVRjACU21JAXTX0IqxI/cc/8viLRzLVKLciI/hVNaHGtXi5Q1uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=KRZI9nZp; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NQt5d+D9; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KRZI9nZp";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NQt5d+D9"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741294225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lwVtck4Unu5sM6JeYtaPoha2zMPYGqqNVUo58AiBHJk=;
	b=KRZI9nZpx97ZwvF+V/AwxSLCv5eRtaF1o2o3OYqRjErxo1D7FCMuOd/JPWPoYqqJ39gXF2
	fALQ5Y56xV4CRZdWB7TNHsVT+BqZCIFZ5yzXZU+hanma56C7QyALn4cuJ+/T22qR55Oq4y
	sNHUba/CwTOwCv7fXoGD+X/mwmrU6I82tKxZ0rd3wnWGtC764SJk8oDgxiW8leGPa0HOvp
	UEJGNdR0W3ATB2qN4Me/FJU/qPQ+zJZspXCn1KURMYOLico4FbdIQwAeUAzmCwnWzsEARQ
	KgF+c9a2dSuRgJIW2R1S1h79xt6vGqg9DMGmjRFhTcIPu5EINvKIHKfM2/kdHQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741294225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lwVtck4Unu5sM6JeYtaPoha2zMPYGqqNVUo58AiBHJk=;
	b=NQt5d+D9SrmvSpLtQC14+WKrdBWrzwjC3BvNY7UPquwg1ZnB5yI1GdOI7TVQxToFJwX6JU
	yJFRouxFg6YdEzCg==
To: Borislav Petkov <bp@alien8.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	x86@kernel.org,
	John Ogness <john.ogness@linutronix.de>,
	x86-cpuid@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	"Ahmed S. Darwish" <darwi@linutronix.de>
Subject: [PATCH v1 02/12] tools/x86/kcpuid: Remove unused local variable
Date: Thu,  6 Mar 2025 21:49:50 +0100
Message-ID: <20250306205000.227399-3-darwi@linutronix.de>
In-Reply-To: <20250306205000.227399-1-darwi@linutronix.de>
References: <20250306205000.227399-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The local variable "index" is not used anywhere. Remove it.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 tools/arch/x86/kcpuid/kcpuid.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tools/arch/x86/kcpuid/kcpuid.c b/tools/arch/x86/kcpuid/kcpuid.c
index abfeecce5aa8..1159204b9902 100644
--- a/tools/arch/x86/kcpuid/kcpuid.c
+++ b/tools/arch/x86/kcpuid/kcpuid.c
@@ -180,10 +180,6 @@ static void raw_dump_range(struct cpuid_range *range)
 
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

