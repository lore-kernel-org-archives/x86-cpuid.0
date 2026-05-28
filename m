Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6547A47ECE0
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983142; cv=none; b=hj8TzCX4JVUtPXbU8fggqAY5EHDUwyZaAR8NqKnFAtZYcrepCDOO3/CqCgkOLRYiPMGg4hz3q77BQJTTqKWZDv/QnOHmSafSXtO1KAT9Q0xXdYNQ6ZPDTDmyLigyTt7LKPo7IG7uwIr05wd5YBu4ImjpYPttO87BPB8AfoA3VDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983142; c=relaxed/simple;
	bh=/+g0P7BlkUBU5/CP6EIZ9Om/dRb+w98SvUrSJD7sCvg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=osKaYMbt5IvglhBya8iwCoJfXaFKx26odyRYy8dyYlm57DmI5PNDUL+Quiqi9SeiwS3ejBskr3cm6fUAqBhxKXxnJlLspxpTm0BhMTnAS5g/ThifloVbZaIVms7UUQ43mUHIc1Sz7KyeiFL7Z0U3gmTFD1rNRNkG/z3KVlVtlzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zZgxTOIP; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bV4F8ai8; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zZgxTOIP";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bV4F8ai8"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l3YnuoTW582QSiSINfEO33oPRdnAjkCClmMq5boZbRI=;
	b=zZgxTOIPgxYXaCJ1OBw+FGEyCRmyewfvhUKMJk9Bfz5oViAcwJmL7S4bYSjBWabZY3UQrj
	C2dLHmVcZz4UoxPYar2zAo1GEbxX/G4RxJaewjGitR3xtrC3dwSNY1OIePliVJ6xa4TpvU
	LbqURz7p+o5frZjBoeoiU8+wUKrza15hzd2WjBGUA1DPjEk1W1fQYQWBZtX/j+gVz7kl7n
	n9t6s/BYb81lgghnk2mZIfkEyPDRWyo51E5obceV2OpxMEzzuE5pBKC1ymplRxxKfwMAUl
	xRRKB8mfkvIN1sdkmykTXk8E8vs4m3SSfu3f/3YOuL94KpWMwsndg5Ya3+6H/w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l3YnuoTW582QSiSINfEO33oPRdnAjkCClmMq5boZbRI=;
	b=bV4F8ai83tNWai9mkQneZlUQHSe/SUKMfdzVuyMykx1YD3bAinAkd+WZSx+2Usz2r79an7
	y+L+7kzjJ7bApqBQ==
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
Subject: [PATCH v7 106/120] x86/microcode: Allocate cpuinfo_x86 snapshots on the heap
Date: Thu, 28 May 2026 17:39:08 +0200
Message-ID: <20260528153923.403473-107-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

load_late_stop_cpus() snapshots CPU capabilities before a late microcode
update, while microcode_check() snapshots the capabilities again after the
update.

Both functions allocate their struct cpuinfo_x86 snapshots on the stack.

Meanwhile, cpuinfo_x86 contains the parsed CPUID tables where more leaves
will be added; resulting in "stack frame length exceeded" warnings.

Allocate the before/after cpuinfo_x86 snapshots on the heap.

For load_late_stop_cpus(), do the memory allocation before the microcode
staging step.  This leaves no leaked or stale microcode state in -ENOMEM
failure modes.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/common.c         | 11 ++++++++---
 arch/x86/kernel/cpu/microcode/core.c |  9 ++++++---
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index d78063e4e665..f5e3aaed67ef 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -2551,15 +2551,20 @@ void store_cpu_caps(struct cpuinfo_x86 *curr_info)
  */
 void microcode_check(struct cpuinfo_x86 *prev_info)
 {
-	struct cpuinfo_x86 curr_info;
+	struct cpuinfo_x86 *curr_info __free(kfree) = kmalloc_obj(*curr_info);
 
 	perf_check_microcode();
 
 	amd_check_microcode();
 
-	store_cpu_caps(&curr_info);
+	if (!curr_info) {
+		pr_warn("x86/CPU: Microcode update CPU capability changes check was skipped (ENOMEM)\n");
+		return;
+	}
+
+	store_cpu_caps(curr_info);
 
-	if (!memcmp(&prev_info->x86_capability, &curr_info.x86_capability,
+	if (!memcmp(&prev_info->x86_capability, &curr_info->x86_capability,
 		    sizeof(prev_info->x86_capability)))
 		return;
 
diff --git a/arch/x86/kernel/cpu/microcode/core.c b/arch/x86/kernel/cpu/microcode/core.c
index 56d791aeac4e..7a00671540bc 100644
--- a/arch/x86/kernel/cpu/microcode/core.c
+++ b/arch/x86/kernel/cpu/microcode/core.c
@@ -588,16 +588,19 @@ static int load_cpus_stopped(void *unused)
 
 static int load_late_stop_cpus(bool is_safe)
 {
+	struct cpuinfo_x86 *prev_info __free(kfree) = kmalloc_obj(*prev_info);
 	unsigned int cpu, updated = 0, failed = 0, timedout = 0, siblings = 0;
 	unsigned int nr_offl, offline = 0;
 	int old_rev = boot_cpu_data.microcode;
-	struct cpuinfo_x86 prev_info;
 
 	if (!is_safe) {
 		pr_err("Late microcode loading without minimal revision check.\n");
 		pr_err("You should switch to early loading, if possible.\n");
 	}
 
+	if (!prev_info)
+		return -ENOMEM;
+
 	/*
 	 * Pre-load the microcode image into a staging device. This
 	 * process is preemptible and does not require stopping CPUs.
@@ -617,7 +620,7 @@ static int load_late_stop_cpus(bool is_safe)
 	 * Take a snapshot before the microcode update in order to compare and
 	 * check whether any bits changed after an update.
 	 */
-	store_cpu_caps(&prev_info);
+	store_cpu_caps(prev_info);
 
 	if (microcode_ops->use_nmi)
 		static_branch_enable_cpuslocked(&microcode_nmi_handler_enable);
@@ -666,7 +669,7 @@ static int load_late_stop_cpus(bool is_safe)
 		       num_online_cpus() - (updated + siblings));
 	}
 	pr_info("revision: 0x%x -> 0x%x\n", old_rev, boot_cpu_data.microcode);
-	microcode_check(&prev_info);
+	microcode_check(prev_info);
 
 	return updated + siblings == num_online_cpus() ? 0 : -EIO;
 }
-- 
2.54.0

