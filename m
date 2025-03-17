Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8341F4621
	for <x86-cpuid@lists.linux.dev>; Mon, 17 Mar 2025 16:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742230395; cv=none; b=bBXcqScR7rKnBhqCS+E9na2Hwh7u0vrtJFVsxVIrury/4dkVhlokKIq8SW2geNMYjTqxVBw7JFJnZqFpDMMjUS+DsFMXYHfiLleDpwxqq2iYHpvPJ+pUeSAKsz5BbT8LhmfhIhs1+weLw8oHMkFGi8qRCJLNhD5tnvGtbAHLdHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742230395; c=relaxed/simple;
	bh=wEw51A1Z/Kflsa07gSPSJJT92gdgpGM02PW8kbXEZCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RYW+Qc4L3YTnE39sNqUXIE+b1QtelBIGZKTMkiQUal6t+tYbRaP33Zy8geazhtSDo+AmHhgcak8+iGLdk0h7EA9urcVs4L3C198kqh3BQeEbM9aJJS+2CWUjXXmpbRg2kITx+7sGFeBgE2N71ngzKm35vWIXnIFxmTaR5j6iNAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZzH3cY2W; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=IakDE8ek; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZzH3cY2W";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IakDE8ek"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1742230392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wIM1/UO/olTqtQhk58W5MQceA/7wLYg5WiO97m4eSsc=;
	b=ZzH3cY2WxjJVEH3PujvYdgpQQhJygKMrHR2FkiPLEdA+A9Vhw8b11DacYz/m2z07qmMgFE
	boTJdOrleNntOx7uGBoMb/qxrbr/mAZcAwSBn5w5iCg43W2mQYBQYaz0pCLj7h0EHY5knq
	YAqjOyO++5HWZYNJQPq6g5yxDm2Y//iuflwGylrCe20SXdmcPZazHJRLDm0kRY8F1P3d81
	U6uqto3omlzzpbWfZPSazoa0/3F1SU5CzikSuhIgezpDh97OaGyC3uJaoY3mkxb1pWWQUL
	e7q0+Dc7lKbPOEC+JAI76X3Lw9D8bnt7qx02sAxSX6mpzE0X4gcfsoGEy88a3Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1742230392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wIM1/UO/olTqtQhk58W5MQceA/7wLYg5WiO97m4eSsc=;
	b=IakDE8ekS5JRg0DgViI//USsZLVJN9iw/OyjuQA2anoUAI2j0VVBN9JNfGxvWY+ngWG1F7
	89N7oF3WOuo2lPAw==
To: Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>,
	x86@kernel.org,
	x86-cpuid@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	"Ahmed S. Darwish" <darwi@linutronix.de>
Subject: [PATCH v2 14/29] x86/cacheinfo: Use sysfs_emit() for sysfs attributes show()
Date: Mon, 17 Mar 2025 17:47:30 +0100
Message-ID: <20250317164745.4754-15-darwi@linutronix.de>
In-Reply-To: <20250317164745.4754-1-darwi@linutronix.de>
References: <20250317164745.4754-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Per Documentation/filesystems/sysfs.rst, a sysfs attribute's show()
method should only use sysfs_emit() or sysfs_emit_at() when returning
values to user space.

Use sysfs_emit() for the AMD L3 cache sysfs attributes cache_disable_0,
cache_disable_1, and subcaches.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/amd_cache_disable.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/cpu/amd_cache_disable.c b/arch/x86/kernel/cpu/amd_cache_disable.c
index 6d53aee0d869..d860ad3f8a5a 100644
--- a/arch/x86/kernel/cpu/amd_cache_disable.c
+++ b/arch/x86/kernel/cpu/amd_cache_disable.c
@@ -66,9 +66,9 @@ static ssize_t show_cache_disable(struct cacheinfo *ci, char *buf, unsigned int
 
 	index = amd_get_l3_disable_slot(nb, slot);
 	if (index >= 0)
-		return sprintf(buf, "%d\n", index);
+		return sysfs_emit(buf, "%d\n", index);
 
-	return sprintf(buf, "FREE\n");
+	return sysfs_emit(buf, "FREE\n");
 }
 
 #define SHOW_CACHE_DISABLE(slot)					\
@@ -189,7 +189,7 @@ static ssize_t subcaches_show(struct device *dev, struct device_attribute *attr,
 	struct cacheinfo *ci = dev_get_drvdata(dev);
 	int cpu = cpumask_first(&ci->shared_cpu_map);
 
-	return sprintf(buf, "%x\n", amd_get_subcaches(cpu));
+	return sysfs_emit(buf, "%x\n", amd_get_subcaches(cpu));
 }
 
 static ssize_t subcaches_store(struct device *dev,
-- 
2.48.1

