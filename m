Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666A54266BA
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982943; cv=none; b=am70oEEFj05VRqCxe9vBy6NuVUu/xuyDwLlTK9w7ansEV2Km6dVLfM54Y2HUINZLzZoQ1pA+fh+BZJUxmAEoKXjH/2p4C+OEeqdrc8BPDx7s3ncWdp0Wmq1PpL5IEJgIRw9QBdqaAMPhgrgNDmzYxdcciqqgOrIsRIzWI7hxljA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982943; c=relaxed/simple;
	bh=gGhihDs0BAA5VjAUcgAGwyIPFVLeqlKbeWaemapl464=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rR4DGEjZD/Tm697oJ3wM9koLtvUtxEqO7WE776jksA8pch+h9MTg8Vmg1YlfO67afNCbiZBgQjb7xQCqfQ52hcpEBHdCySWRtlrbAb6i0oTm6EMe+Dsqb9eLvzLdsYUGvMRPY9cXSzbpWYcwQPqBaIEIX13sEG83ToRK6I3cfrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=QSdMJbI6; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=W/65t2R0; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QSdMJbI6";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="W/65t2R0"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wRBgO/dDvAeEyj4PQoDeQ9tFsc/1XuxnxwFhtOqd9dk=;
	b=QSdMJbI6i8tKoPodgpqq+NSvlfKKiJiL7Pwr9JyQaiHVlPNHEJEt36e3zdEqQCam9qZinK
	gZcYH6gDiekoAeYMs5TfMPo7f0pUIrCCOK2Kl9/lSyww8mepY5EXiDqRTQypQRllGblmee
	rFWYSgv4wBAIAtcZICErUl+9H8sAr6NDIx1Wx8BIakyFd/XaaurHzSVXKTveaE8/BlvGEX
	Mkl85JuoOy4uqrqA8h9V3Ea54b1gYu5Af8tjjDavEGo/+j+WQLETfP2os/rMnpfDWisEQI
	Fdibr2k7QGghqaY//p+J32mfo3Dvqx1cqeMDnxqiPhyDLiQcl1DL5qKNP4cAzw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wRBgO/dDvAeEyj4PQoDeQ9tFsc/1XuxnxwFhtOqd9dk=;
	b=W/65t2R0kU7vFJ8Oyz9yXRzg8qNQlKzNR/UCm3puGPSthsKhqbgzSnOqbDQp+w6R0Pfb6C
	w+WuMjIa+dnGmgBQ==
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
Subject: [PATCH v7 046/120] x86/apic: Use parsed and refreshed CPUID(0x1)
Date: Thu, 28 May 2026 17:38:08 +0200
Message-ID: <20260528153923.403473-47-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use parsed CPUID(0x1) instead of doing manual bitwise operations and a
direct CPUID query.

Refresh CPUID(0x1).EDX since one apic_verify() caller may force local APIC
enablement through an MSR write beforehand.

Note, using the CPUID APIs here is safe since setup_arch() calls
early_cpu_init() way before invoking any of the APIC initialization code.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/apic/apic.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/apic/apic.c b/arch/x86/kernel/apic/apic.c
index 8c614750a19b..0ecd923b5809 100644
--- a/arch/x86/kernel/apic/apic.c
+++ b/arch/x86/kernel/apic/apic.c
@@ -1960,14 +1960,15 @@ static bool __init detect_init_APIC(void)
 
 static bool __init apic_verify(unsigned long addr)
 {
-	u32 features, h, l;
+	const struct leaf_0x1_0 *l1;
+	u32 h, l;
 
 	/*
-	 * The APIC feature bit should now be enabled
-	 * in `cpuid'
+	 * The APIC feature bit should now be enabled in CPUID
 	 */
-	features = cpuid_edx(1);
-	if (!(features & (1 << X86_FEATURE_APIC))) {
+	cpuid_refresh_leaf(&boot_cpu_data, 0x1);
+	l1 = cpuid_leaf(&boot_cpu_data, 0x1);
+	if (!l1 || !l1->apic) {
 		pr_warn("Could not enable APIC!\n");
 		return false;
 	}
-- 
2.54.0

