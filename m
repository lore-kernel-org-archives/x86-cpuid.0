Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBAA4418DC
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983017; cv=none; b=XpzJJCQSIQERodjG0i0O5FLTk4uGx8qbisOYr++LeHFQD0/tmUcKgYw+ezamddqIwSAlRxdQbxdn/7Eq45hflmLdRZvyeZZAVXEDwmAFua6LXYwOHiz4qmUs2qP7N9E4Of9182KjcH7PmtvAoOVqKtuZbKVRBaw5xP3n/MUIGrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983017; c=relaxed/simple;
	bh=24UwSiiUnq91m0gUmYRYtiucM9buj3GOtlBsdEugwtE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PPDrH5RLSCCOgvaqno0EP4oWLQaoLWQT2FR2QbnqTsJBJ5XDWC1NQZocmrgc0IhHwX7+kpFWDXtj9qiHeS4g9ffhCP3rSuiKXMpPd0VEVwOY3pN2x/Gi5eTdWBW2PiJqXG3elljuPqNnSzuErlqLgyM377AO1Sep3BwoWtv7FXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4T5fMfT9; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wxFiun+J; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4T5fMfT9";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wxFiun+J"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PgZZ71omZMRVxIG6jBJNdV70OAiiP5NqOfaciMt/Bkg=;
	b=4T5fMfT9SMsn1h8xtW6GJOSjnoraj+E0odE6zrAdZDunxKOSVoACaW9stcAgE9VBV0nP9F
	B9ihw8slxDZMxC4aTKvNnnG2jsMtmQW5jtZ7SntTSXn6WhMEsTduc0gvuE1Fzgej2GOeFF
	FyQ7vz86yPKJ/cfwYw4rdiphNtnes4hY0puRgCCAxynaUBBZIZvD0o26DrN+ePyvfaR3bR
	qmW0MMYCelv31WbebdGs8dJtInAAa3uC+46YllPfdt+bHQ+tMc3Ix6Ea6zZoNBd5CeoFsS
	x3rcU/q0HpwUiH3MpHSw6BfNvmA3g8KRS7ndxgE/666UT5XJDgLRd/ej2u+JbA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PgZZ71omZMRVxIG6jBJNdV70OAiiP5NqOfaciMt/Bkg=;
	b=wxFiun+JIS3WvSuP1Ivz+vqtgRgyR7nNmEs05i7t1Fw9976nA/1lCFZPnyec1UYwBS/IWd
	VAsjBfjVYbeh/3Cg==
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
Subject: [PATCH v7 066/120] ACPI: PAD: Use Parsed CPUID(0x5)
Date: Thu, 28 May 2026 17:38:28 +0200
Message-ID: <20260528153923.403473-67-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use parsed CPUID(0x5), plus CPUID(0x5) APIs, instead of doing ugly bitwise
operations and a direct CPUID query.

Note, preserve EDX walk semantics: the original code shifted EDX by
MWAIT_SUBSTATE_SIZE before entering the loop, hence skipping the C0
substate count.  Start the parsed lookup at C1 for the same reason.

Note, the original "&& edx" loop condition avoided trailing zero nibbles
but dropping it should not be problematic: zero substate counts are always
ignored.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 drivers/acpi/acpi_pad.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/acpi/acpi_pad.c b/drivers/acpi/acpi_pad.c
index ec94b09bb747..45b1793cd3b4 100644
--- a/drivers/acpi/acpi_pad.c
+++ b/drivers/acpi/acpi_pad.c
@@ -38,27 +38,27 @@ static unsigned char tsc_marked_unstable;
 
 static void power_saving_mwait_init(void)
 {
-	unsigned int eax, ebx, ecx, edx;
+	const struct leaf_0x5_0 *l5 = cpuid_leaf(&boot_cpu_data, 0x5);
 	unsigned int highest_cstate = 0;
 	unsigned int highest_subcstate = 0;
 	int i;
 
-	if (!boot_cpu_has(X86_FEATURE_MWAIT))
+	if (!l5 || !boot_cpu_has(X86_FEATURE_MWAIT))
 		return;
 
-	cpuid(CPUID_LEAF_MWAIT, &eax, &ebx, &ecx, &edx);
-
-	if (!(ecx & CPUID5_ECX_EXTENSIONS_SUPPORTED) ||
-	    !(ecx & CPUID5_ECX_INTERRUPT_BREAK))
+	if (!l5->mwait_ext || !l5->mwait_irq_break)
 		return;
 
-	edx >>= MWAIT_SUBSTATE_SIZE;
-	for (i = 0; i < 7 && edx; i++, edx >>= MWAIT_SUBSTATE_SIZE) {
-		if (edx & MWAIT_SUBSTATE_MASK) {
-			highest_cstate = i;
-			highest_subcstate = edx & MWAIT_SUBSTATE_MASK;
-		}
+	for (i = 0; i < 7; i++) {
+		unsigned int nsubstates = cpuid_mwait_n_substates(l5, i + 1);
+
+		if (!nsubstates)
+			continue;
+
+		highest_cstate = i;
+		highest_subcstate = nsubstates;
 	}
+
 	power_saving_mwait_eax = (highest_cstate << MWAIT_SUBSTATE_SIZE) |
 		(highest_subcstate - 1);
 
-- 
2.54.0

