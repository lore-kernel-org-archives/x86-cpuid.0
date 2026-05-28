Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE91F4534B7
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983049; cv=none; b=IFEQC04gZGNNXpZy9hbZrgRL8Jfq/+1EcdbBMc193Q0EQWZMuX6VTQhkad0f4aSatvFUEwh2nL/EqFiCZVvnOznhVKy5YB9jKMt/EA3kDO0mGxTu5cQCsxWV53vw4cpYnM/voKiXteHmCXRukKlWLSPHP2OLs1f5fm4PrsQDya0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983049; c=relaxed/simple;
	bh=O3i2oif+oGGamDWEXbp1yTDyQaSEUs1kLrOWHirpsQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sC6BL/4eXOMRwEriapW4NzdWKLqTrKNe/sG6v84z6GZVpMGcP+Savm3Kjo+FqUfs+MNAc2OAEJ0UoxFMP1mAI9Bwsv0ZHoz3amOW4C1phUbv8GdAUgBIBNkYjpl+8YCnvO32H0sqk2vcpvCSCmJFg30isjN8odg6wH3lNiU3hGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tRRVBJ+h; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=SHViSYEb; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tRRVBJ+h";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="SHViSYEb"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WkEC6lf3SUuIXoXlnT9WA5c9bDEzPLRW/frQJYtnm5A=;
	b=tRRVBJ+hjFxbIidLHJnQvMRjWJ9SqmeReUlEhmQHkVW9QPSc24zYfXvPpSt5r0GTQ+CDAg
	7ZYnLzDfts80jXSVIZgA5nnMGncuvhzPmpb8t0EEA6yUi+PqWoMaakPwIxpes9CmtjBFfz
	0OCu2QVIWQJUYCyviqtOq9sepgmRvAnvfna25cEIyCXo6gTF0slB4b0AW5oVh9SWtREBbr
	qNmV3xBfBI52KmcOuVpOY/wcQMXXTCSpyDHkg+XENptuoceE7BYawqqHvXWHBH/PsyxZ4I
	NqrQ1xsiimOioVll0QI9ixZ4l1oCFDMCz67NU6lPPa4ArTusuILTI8B83DjNkQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WkEC6lf3SUuIXoXlnT9WA5c9bDEzPLRW/frQJYtnm5A=;
	b=SHViSYEbFLVLTzv0cnSsE+I5LX/zEenSpGacJf/CEkrqXf/JzNwM9x262t7ExqpAeMNxN9
	gsWfTydzKoBH0VAA==
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
Subject: [PATCH v7 078/120] KVM: x86: Use parsed CPUID(0x12)
Date: Thu, 28 May 2026 17:38:40 +0200
Message-ID: <20260528153923.403473-79-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For KVM's SGX ECREATE intercept logic, use parsed CPUID(0x12).0 and
CPUID(0x12).1 instead of issuing direct CPUID queries.

This centralizes CPUID parsing and cached access across the kernel.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kvm/vmx/sgx.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/vmx/sgx.c b/arch/x86/kvm/vmx/sgx.c
index 29a1f8e3be60..3f381f0f2395 100644
--- a/arch/x86/kvm/vmx/sgx.c
+++ b/arch/x86/kvm/vmx/sgx.c
@@ -440,8 +440,12 @@ void vcpu_setup_sgx_lepubkeyhash(struct kvm_vcpu *vcpu)
  */
 static bool sgx_intercept_encls_ecreate(struct kvm_vcpu *vcpu)
 {
+	const struct cpuid_regs *sl0 = cpuid_subleaf_raw(&boot_cpu_data, 0x12, 0);
+	const struct cpuid_regs *sl1 = cpuid_subleaf_raw(&boot_cpu_data, 0x12, 1);
 	struct kvm_cpuid_entry2 *guest_cpuid;
-	u32 eax, ebx, ecx, edx;
+
+	if (!sl0 || !sl1)
+		return true;
 
 	if (!vcpu->kvm->arch.sgx_provisioning_allowed)
 		return true;
@@ -450,17 +454,15 @@ static bool sgx_intercept_encls_ecreate(struct kvm_vcpu *vcpu)
 	if (!guest_cpuid)
 		return true;
 
-	cpuid_count(0x12, 0, &eax, &ebx, &ecx, &edx);
-	if (guest_cpuid->ebx != ebx || guest_cpuid->edx != edx)
+	if (guest_cpuid->ebx != sl0->ebx || guest_cpuid->edx != sl0->edx)
 		return true;
 
 	guest_cpuid = kvm_find_cpuid_entry_index(vcpu, 0x12, 1);
 	if (!guest_cpuid)
 		return true;
 
-	cpuid_count(0x12, 1, &eax, &ebx, &ecx, &edx);
-	if (guest_cpuid->eax != eax || guest_cpuid->ebx != ebx ||
-	    guest_cpuid->ecx != ecx || guest_cpuid->edx != edx)
+	if (guest_cpuid->eax != sl1->eax || guest_cpuid->ebx != sl1->ebx ||
+	    guest_cpuid->ecx != sl1->ecx || guest_cpuid->edx != sl1->edx)
 		return true;
 
 	return false;
-- 
2.54.0

