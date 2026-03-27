Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4E435F616
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774578121; cv=none; b=jofp7bh/+IWs9imtBTUgg1SebdnKmqSkBqC+VFXIZRdSIE7y9Kgt+8iRbKlOvVI+iYxboqr0Yo8Ec+wIYtKJwlTcLgn43faSgPtT1W0AIQgLym6ht63KSRQIkYlIDjtwAfBVq5SuYz2gE2t/tfHP1qfpLgyVjm8jiTZ8NjCPYsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774578121; c=relaxed/simple;
	bh=s1f3pyf+/i5IW706fn6yTdIIunq0yuSWr/ay+LNfuFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EhK1r577YY4WeB6QIhXoaQ6wsPxs5PSTScp7PQzeLINnOv5K3w6DN4HDMJONg+2QChDb/vLY9Ds93aobkxG2yGPfFGAMQWm6lXs3oiVP/+vFShrDdUYIN/+KveWKasDAGW/REb+HiRBN7JkH+D3gT9nnX40kFBydB/mgzjYKCYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Q69I9Vl4; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MEvB2xdi; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Q69I9Vl4";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MEvB2xdi"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774578119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B1/dj0aiJxPrVtjeZ/PwDKekOoP3+cq3AouSDZ8vkV4=;
	b=Q69I9Vl4ufRub2ZemEWv35dy9KTO4JDnTjicg9NqfJjzYf7igbLdNDfm3A6sK7YtOwbfnK
	rzVipmjv0ntjIqy+5J+pH3qI/ecrT3bpOjuhInXQ7a+d1P1CM4tG/PrJ7LpR2rVo0BZigP
	qkq8cvEOPJUnfN7xg25K3r4iorgIKCsJZ0NWwWYv1KFd89QRmJf0Hs335zT+FaGyJPjTnU
	CouR21YF2W/wVYBZlYjkebIWCO+J16Uhc4WUDzg5iOWQTay1U9jrfok6297rsmLZ9C/Raq
	5BZSFmTgsIPGSQS8Q9h5hzE/gHBn78ebCKHPTAyBX/YYx6+P+6aLREMQu17jHQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774578119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B1/dj0aiJxPrVtjeZ/PwDKekOoP3+cq3AouSDZ8vkV4=;
	b=MEvB2xdiYu4THBCPpBZ+LNmEpKg8HjNwz0Bf5t8k7xp05epRUWh+5P1IP85pXkZI5CU95Z
	vm6cK0Go1z5IGVBg==
To: Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Sean Christopherson <seanjc@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Christian Ludloff <ludloff@gmail.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>,
	x86@kernel.org,
	x86-cpuid@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	"Ahmed S. Darwish" <darwi@linutronix.de>
Subject: [PATCH v6 76/90] x86/microcode: Allocate cpuinfo_x86 snapshots on the heap
Date: Fri, 27 Mar 2026 03:16:30 +0100
Message-ID: <20260327021645.555257-77-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
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
index 2beb53f6bed7..ece5a59124f5 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -2543,15 +2543,20 @@ void store_cpu_caps(struct cpuinfo_x86 *curr_info)
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
2.53.0

