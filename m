Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2908643D500
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982986; cv=none; b=NRSEs6vycnhmSk9wRJPX61amh4Ks8tPrDl7VwCGzGnfvhhipz4kWgnJmO746vz2BbrpqH04j3XO1c4tzPxqyYYlE6tTYh/jicz5PFJPGcz7Uzaxjh6gL1BQaBBJ131XZ96/eibR8NnG6J0xJCuCyz25oMsSGXAOAIiWzkGHcqKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982986; c=relaxed/simple;
	bh=OzbMkNfvSgMjh17hw6oBkatjeyZ9fdpsDpYZanXEb6M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F/Uf81f8chZuLMKt8sn4/C5Oye2bDqp9tihpvym6xQ+8o4wF5GvwtKlp+Xg8zpD9TuSJ4jTiTgOpikXJpZmjFVNAws17HBMdw/Ebmm9WDC8MnXCI9JsnHxt0H2ukPvFQEptpBpvYuByBMuodl2iWKCpYBrImZuwl67CPe8LHGpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HVAtGMRK; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DOLiKCnM; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HVAtGMRK";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DOLiKCnM"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uJEK5e8SMRKJ40GkJz3gEJhbYerJ6L85sZzUjPynPZQ=;
	b=HVAtGMRKs6JJe0RyjWSGRw3yM//aRpmIOZ9870dLl909IwaMt5VlMfDJivFi8cPqZe+2zv
	FNxVofjRZMn/93XT2nBm+z5Z6nr9e2KR9vOWdTgGrMvetOBy0Z0uIe2WDW+c+8W21v/9hr
	bxStT8mzC2jgODphF2FkdS/Y6NH7w3Cs6vbpn5YNroYqRED455Dgm3GD5Z4OMTll1NatHf
	AHnvbn5SrAceiWv1pRBdZM9e19vdyksc7eXTQz24ynzMVFybi3SXLL/7hVdNE1xYoQJ9qR
	sadx0LPqqmnMmnTz7gsXwSBGGLbZ3NMhfshAYKK4kjeWBobOOhbyvFHwMWc1Yg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uJEK5e8SMRKJ40GkJz3gEJhbYerJ6L85sZzUjPynPZQ=;
	b=DOLiKCnMNtBlu5yxyVMl288kAuRgAyk7GBHEsh/V6Cg9yfSnIvQWSA7vQB0v1ENf+M9mDj
	rHMYlQICgAkiiIDw==
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
Subject: [PATCH v7 058/120] RAS/AMD/FMPM: Use parsed CPUID(0x1)
Date: Thu, 28 May 2026 17:38:20 +0200
Message-ID: <20260528153923.403473-59-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use parsed CPUID(0x1) instead of a direct CPUID query.  This centralizes
CPUID parsing and access for the kernel.

Note, follow the API requirements by checking the for NULL beforehand.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 drivers/ras/amd/fmpm.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/ras/amd/fmpm.c b/drivers/ras/amd/fmpm.c
index 4ccaaf7b70bf..bd8450ec61e2 100644
--- a/drivers/ras/amd/fmpm.c
+++ b/drivers/ras/amd/fmpm.c
@@ -564,11 +564,15 @@ static int save_new_records(void)
 /* Check that the record matches expected types for the current system.*/
 static bool fmp_is_usable(struct fru_rec *rec)
 {
+	const struct cpuid_regs *l1 = cpuid_leaf_raw(&boot_cpu_data, 0x1);
 	struct cper_sec_fru_mem_poison *fmp = &rec->fmp;
 	u64 cpuid;
 
 	pr_debug("Validation bits: 0x%016llx\n", fmp->validation_bits);
 
+	if (!l1)
+		return false;
+
 	if (!(fmp->validation_bits & FMP_VALID_ARCH_TYPE)) {
 		pr_debug("Arch type unknown\n");
 		return false;
@@ -584,7 +588,7 @@ static bool fmp_is_usable(struct fru_rec *rec)
 		return false;
 	}
 
-	cpuid = cpuid_eax(1);
+	cpuid = l1->eax;
 	if (fmp->fru_arch != cpuid) {
 		pr_debug("Arch value mismatch: record = 0x%016llx, system = 0x%016llx\n",
 			 fmp->fru_arch, cpuid);
@@ -719,15 +723,19 @@ static int get_saved_records(void)
 	return ret;
 }
 
-static void set_fmp_fields(struct fru_rec *rec, unsigned int cpu)
+static int set_fmp_fields(struct fru_rec *rec, unsigned int cpu)
 {
+	const struct cpuid_regs *l1 = cpuid_leaf_raw(&boot_cpu_data, 0x1);
 	struct cper_sec_fru_mem_poison *fmp = &rec->fmp;
 
+	if (!l1)
+		return -EIO;
+
 	fmp->fru_arch_type    = FMP_ARCH_TYPE_X86_CPUID_1_EAX;
 	fmp->validation_bits |= FMP_VALID_ARCH_TYPE;
 
 	/* Assume all CPUs in the system have the same value for now. */
-	fmp->fru_arch	      = cpuid_eax(1);
+	fmp->fru_arch	      = l1->eax;
 	fmp->validation_bits |= FMP_VALID_ARCH;
 
 	fmp->fru_id_type      = FMP_ID_TYPE_X86_PPIN;
@@ -735,6 +743,8 @@ static void set_fmp_fields(struct fru_rec *rec, unsigned int cpu)
 
 	fmp->fru_id	      = topology_ppin(cpu);
 	fmp->validation_bits |= FMP_VALID_ID;
+
+	return 0;
 }
 
 static int init_fmps(void)
@@ -761,7 +771,9 @@ static int init_fmps(void)
 			break;
 		}
 
-		set_fmp_fields(rec, fru_cpu);
+		ret = set_fmp_fields(rec, fru_cpu);
+		if (ret)
+			break;
 	}
 
 	return ret;
-- 
2.54.0

