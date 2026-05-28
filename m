Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D307043E48B
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982999; cv=none; b=XLTnlMM7d6LVHzOH2sAWPR85cS1wJyu2Nrwi2wilm1TrAb/EEwsxpcVNoKT5p8QlBmi5K5gEKP29zDTduzpefNp2ukfNO+67p9N0cJnlUM+RJpMDpLvR3sTkoKBTJUug7bs3YgkPNF9nuP8uluWnqzt1e+5ZOS1JqezR/XV54pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982999; c=relaxed/simple;
	bh=CzU626xh4+g/BtRfruWcH4vyGNF8gxkk++waKovub60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CUGEQMeHwnYMDRkcLl6aXNPi1RSJ5PT+DjVW24IN2Exwcbj71afH6WYDNhxoGS+s0sxxAwIzhgasUb/5lHnVFqJgDKY2YGS88KFsGpe88lrj9Piey2EY7fRKL+3N2d0+tu7rWpa/lQ8mcRMel+Pw+UwZWFG8wxMr5D+TFTpRmZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nHIKbpBi; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vC38LxMG; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nHIKbpBi";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vC38LxMG"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GXVF7Zk/72ix9wX9ncM5wA+01plTJ9IQoNnnBYHMDcc=;
	b=nHIKbpBiVcVZjvXZAtCWY/nGQ5JFB4jF6P6+BNfyvGm93LzRX4AAaxRRr51TVFNlRYOcH+
	8UyDr24+GiOrhbZFEIbw7pMVLXxsX8scySSXK4e8mCeu+a1R6Nf/RcGA3yr1oGwxaQXZmE
	uXl3G2m7WfmHl77+XWHqiuEpd+slQD1ZrpuFHdGWVvHPPUQQlvl/I0yKd6qI+OPL4oFDnn
	bxICb03OwZqygWyPcc93vmeQZ/U5P3+shSnDCvvUy7f+DopHUakyAhqeHB7/0WZDrIXDsY
	SK2Sv2XM/ZpT1SdlFQoFGxphTqMaP1xAzHkcqjPVyE7A53DaueDSHK0TCrAXKg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GXVF7Zk/72ix9wX9ncM5wA+01plTJ9IQoNnnBYHMDcc=;
	b=vC38LxMG0bmLHTBqlHd7Ewr2wcLh6DL1QvricSESoqTCyZpwGlLhjVRhTYBagsZV5uNrHt
	6M4rKLTumtwk4BAA==
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
Subject: [PATCH v7 061/120] x86/acpi/cstate: Clarify unsupported MWAIT hint warning
Date: Thu, 28 May 2026 17:38:23 +0200
Message-ID: <20260528153923.403473-62-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MWAIT hint warning calls the ACPI FFH address an "ACPI MWAIT C-state"
which is misleading.  It is the firmware-provided MWAIT hint, where the
C-state type is decoded separately from that hint.

Clarify the warning message.

Also remove the printed CPUID(0x5).EDX part value.  The value printed is
the shifted remainder used to extract the sub-state count, not the 4-bit
sub-state field itself.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/acpi/cstate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/acpi/cstate.c b/arch/x86/kernel/acpi/cstate.c
index f6bd7214fec4..dbdacfbf53bd 100644
--- a/arch/x86/kernel/acpi/cstate.c
+++ b/arch/x86/kernel/acpi/cstate.c
@@ -139,8 +139,8 @@ static long acpi_processor_ffh_cstate_probe_cpu(void *_cx)
 
 	/* If the HW does not support any sub-states in this C-state */
 	if (num_cstate_subtype == 0) {
-		pr_warn(FW_BUG "ACPI MWAIT C-state 0x%x not supported by HW (0x%x)\n",
-				cx->address, edx_part);
+		pr_warn(FW_BUG "ACPI MWAIT hint 0x%x for MWAIT C-state type %u not supported by HW\n",
+			cx->address, cstate_type);
 		return -1;
 	}
 
-- 
2.54.0

