Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057C043CEE7
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982982; cv=none; b=lQks2CqF4lhYt7Fba7wyhlvUwdcpFyXCvlGKFiei1h+M/A+0uNH5qSSV1FRy3JnJ6xwXMr+bZ7VxXXwLsQbIRlse20uYA4dbjdZebJwM9e5qF6VPYLHMoKCIN8JCkebXCBfq6fP0x/RYhBw9YUrgOgUCFZkRyuux9INHEMuNSX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982982; c=relaxed/simple;
	bh=NtBL1kPLdTCcwDrVgLNh7UBCqxh5930n9Yp5tQPf5zw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uctfeZ+zGNS8tX+CtvnG+vUD2DdRkfaEknihLe4tQwE+sTGyDKOK+g9+yuCbA7Cj+OCuH885gShtldOVMjrwVtNTjVMq/YMjMB6ykm+ZRr/KXujeVZX/gMc56ynXgVC5AmcGmxiexukjN+JRf3zSvqb7NXs5tJ6qC+IxSecPUn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2Tx71IqM; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3EZS2pll; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2Tx71IqM";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3EZS2pll"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XHKPVJcm9wUI5iSR08ga4f6o1fMgcl4v5dV8T+G6oJk=;
	b=2Tx71IqMcLjc6U/uNnwc85aeVkBkYzZUKIp3SaspxaIjX8e+W6qPDCNZimD95xo2t+e5LH
	iN4OYKExh+U540Bvo4Se1VH/M6bV/gBInUZcYPJIS/yZy5Sb7241bL3Hb637YUnTdtZNux
	boRjNRD0eCznS3fAA9NljhU55M1D/NsqZT2HiDbNcuBRZb+TQ4s/RomADx+IEjF6UUfOQJ
	7qWxw9xJ3V608wtTbwNq7Z1ZHLtpbPrFTILJNmqD7HCKL5oM+XcxN9P0HEoeWAfqN9HiHo
	DqQEHh3oDg+WyLCB/HqbizGjnNW6LUqTkHHmDLptzCKRCGiDwVVCz1RhiL++Zw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XHKPVJcm9wUI5iSR08ga4f6o1fMgcl4v5dV8T+G6oJk=;
	b=3EZS2pllXQr0CphgLxmjxoLxrN6r8UqW2OUfH35wI0aa106DDULwCAW7ya4sc7NXC7hVLF
	aGIFd5mBHvP25mAA==
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
Subject: [PATCH v7 057/120] dmaengine: ioatdma: Remove custom UP local APID IC code
Date: Thu, 28 May 2026 17:38:19 +0200
Message-ID: <20260528153923.403473-58-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since

  commit b4033c1715cb ("[PATCH] PCI: Change MSI to use physical delivery mode always")

and a cpu_physical_id() implementation exists for UP kernels.

Replace the driver's private UP APIC ID implementation with the kernel's
generic cpu_physical_id() helper.  This also avoids a direct CPUID query.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 drivers/dma/ioat/dca.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/ioat/dca.c b/drivers/dma/ioat/dca.c
index 5d3c0ae6b342..07c977bef5f8 100644
--- a/drivers/dma/ioat/dca.c
+++ b/drivers/dma/ioat/dca.c
@@ -11,13 +11,9 @@
 #include <linux/dca.h>
 
 #include <asm/cpuid/api.h>
-
-/* either a kernel change is needed, or we need something like this in kernel */
-#ifndef CONFIG_SMP
+#include <asm/mpspec.h>
+#include <asm/cpu.h>
 #include <asm/smp.h>
-#undef cpu_physical_id
-#define cpu_physical_id(cpu) (cpuid_ebx(1) >> 24)
-#endif
 
 #include "dma.h"
 #include "registers.h"
-- 
2.54.0

