Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DFD43637C
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982959; cv=none; b=aJjlmRY9zGm+erxHqhIj7gAerC9XvOfccwrMDle2pgI7nmiKmdHRZA8lk8G7riNkENInTGxxUPK9HmLa9Jd6fX++2HrnYtBWFdJjtKmaDbXgAYnt5eXJdiwia7HiAz1GuxQ8moQL7AjkJUnzurhpt4seIHulKph6B8AZ7WQoCbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982959; c=relaxed/simple;
	bh=UmIuUJT0nMgKKbt+ogQzcEA4UuBVmDeZtClx90JlwHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xt8GeDki3j41rnDjxqIyWOYtbCM9Cb3NelxHdIKf8yV1JyGUbG8dM4QFo6T7K3+Vw1n35THWKlrgfO2ioQDGnqCC0wB3/CYFNbx2kbI/a94Efw1naWTi8l5i1crP79NTtnYYcC99uKgjDdTGF3nPSUCBfGIHKL4Om3c3cJFldH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wr37eegH; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=5rPom+43; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wr37eegH";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="5rPom+43"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KojHsUmnaKlAnVKLT+0v3BUrTmPahlzMHsR5eizc+bo=;
	b=wr37eegHVfXp2lq3ICPplXn0WQEUpOdroNOhoRZA2nCH9UFTgNrnj+/MxI/SU/baK1Rv+n
	cWRyProtK7anwrpIz6b9zeHNIL8FTiDDyGfeWWT8nNa9MxQ7xxkiw4zcsShwf6RHPNklhi
	hsnS+Q0VMY/aN0RcFR8+8lV3GrNoSQI2ELVscfnQoDlU0CYKhHOE5qOIvbSOvH9JJZ+UBh
	ajMRY4gpdYr9l4bWt95wTgSeF/AnR8tkosTtm1DjcPLRsrutmlfwtLV7DWYL7aXSe0FSr3
	KSTtXtGF5HyrCl62fBessMBz+lukVwhzXtVfG0iTLP4tGGn7P+e+FzXCG2dJJQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KojHsUmnaKlAnVKLT+0v3BUrTmPahlzMHsR5eizc+bo=;
	b=5rPom+431AlLnuEmw1tIp4YKVzatpXFNlvW7IHFD1HIyQ/zNO/B7PFsKhI6o4Of5/CVW8n
	153iRPvFTvi9QCCw==
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
Subject: [PATCH v7 051/120] x86/microcode/amd: rdrand: Use standard CPUID(0x1) types
Date: Thu, 28 May 2026 17:38:13 +0200
Message-ID: <20260528153923.403473-52-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use standard CPUID(0x1) types from x86-cpuid-db instead of doing manual
bitwise operations.

Keep using a direct CPUID query, instead of the CPUID parser API.  At a
later step, clearing a feature bit like X86_FEATURE_RDRAND will also clear
its cached backing CPUID bit, while the code clearly mentions that it wants
to query the CPUID state regardless of the X86_FEATURE_RDRAND bit state.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/amd.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
index 0e077a4f2646..5f885fafa238 100644
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -807,6 +807,8 @@ early_param("rdrand", rdrand_cmdline);
 
 static void clear_rdrand_cpuid_bit(struct cpuinfo_x86 *c)
 {
+	struct leaf_0x1_0 l1;
+
 	/*
 	 * Saving of the MSR used to hide the RDRAND support during
 	 * suspend/resume is done by arch/x86/power/cpu.c, which is
@@ -819,7 +821,8 @@ static void clear_rdrand_cpuid_bit(struct cpuinfo_x86 *c)
 	 * The self-test can clear X86_FEATURE_RDRAND, so check for
 	 * RDRAND support using the CPUID function directly.
 	 */
-	if (!(cpuid_ecx(1) & BIT(30)) || rdrand_force)
+	cpuid_read(0x1, &l1);
+	if (!l1.rdrand || rdrand_force)
 		return;
 
 	msr_clear_bit(MSR_AMD64_CPUID_FN_1, 62);
@@ -828,7 +831,8 @@ static void clear_rdrand_cpuid_bit(struct cpuinfo_x86 *c)
 	 * Verify that the CPUID change has occurred in case the kernel is
 	 * running virtualized and the hypervisor doesn't support the MSR.
 	 */
-	if (cpuid_ecx(1) & BIT(30)) {
+	cpuid_read(0x1, &l1);
+	if (l1.rdrand) {
 		pr_info_once("BIOS may not properly restore RDRAND after suspend, but hypervisor does not support hiding RDRAND via CPUID.\n");
 		return;
 	}
-- 
2.54.0

