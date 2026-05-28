Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E77C3F23B1
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982784; cv=none; b=UOPwpLV3uzcnxnyEVAZKkcKHebrirPK4Fb/SQekop06J04IOSiDgWtiYwKHzd7Ca7WpKh8n9ImfHEPBs41dKEaYcbMLBMs5dDhQ134wmrGSWIc+rSFZIy3cScrxnJqUCFevCB9kepKujHCkihAZMJDk4mIr3AGGdwUKaHUO0HyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982784; c=relaxed/simple;
	bh=Ig/z0FPwjUkEY8P4s2fyeRs2/kG+1UjKWkvxSj7bHjw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RUHXDpqmJnFObGp7v4TiJDx0xopvMIAjO5fJ2Zno1tCU2KR8VxN/tc7Swb2yhQGABFMvtiYLg5B9vsBeq+447Dtd4D1YinC3ZEjmgvnTBFmmerGGHYGaXMjQP6NmNCYxHW1z15r8rQ3yU/b4WBwP3opXuZi5f+dPTSSuYtV2Mw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=f/xFJH6H; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Oy05rU7v; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="f/xFJH6H";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Oy05rU7v"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5Wv8TwKSlmi5MYZd9HJ9IoIoratGX0jpRaZ+QqQfUpA=;
	b=f/xFJH6HBD8YUmfjtOgFjOz/8hBn54NqmijvSCaM/BWIzXLipDPDYLxjxuco3m7HtemyE0
	MK3+s9JNEX3uZFol/yxmFLkLebG4TmBESQ98zLVHu1ttTkoAeAv/B0yhL0qZQ3sRRbcL2F
	J92VgCg61Xk2MfzRvJMwItkFbYHu2AtJMmHbCwN2T8jc/dVQq8HHg3Cu4UqwwIT8O3ioIA
	XjaSJCKFe/7Ov8sNKr7tO9EnOzu4HSw3q0a3YhSodVrhhZO4rMlG4Y5f23GPrr27ub2ySi
	f0I/cUbH9sCiSKePYwtGEWsB4NAHKSUSdYMoRhL9Dp+yv4yZAkywVGGfu/DxUA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5Wv8TwKSlmi5MYZd9HJ9IoIoratGX0jpRaZ+QqQfUpA=;
	b=Oy05rU7vZaCjcfogolRRYI3XI1y/KbviXTKUOFpBP1D1Qqxz650MNfCnCiBs/yp8qtTQEw
	gtdyBpq6tyqkrcAw==
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
Subject: [PATCH v7 001/120] treewide: Explicitly include the x86 CPUID headers
Date: Thu, 28 May 2026 17:37:23 +0200
Message-ID: <20260528153923.403473-2-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modify all CPUID call sites which implicitly include any of the CPUID
headers to explicitly include them instead.

For KVM's reverse_cpuid.h, just include <asm/cpuid/types.h> since it
references the CPUID_EAX..EDX symbols without using the CPUID APIs.

Note, this allows removing the inclusion of <asm/cpuid/api.h> from within
<asm/processor.h> next.  That allows the CPUID API headers to include
<asm/processor.h> without introducing a circular dependency.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Link: https://lore.kernel.org/20260327021645.555257-1-darwi@linutronix.de
---
 arch/x86/boot/compressed/pgtable_64.c             | 1 +
 arch/x86/boot/startup/sme.c                       | 1 +
 arch/x86/coco/tdx/tdx.c                           | 1 +
 arch/x86/events/amd/core.c                        | 2 ++
 arch/x86/events/amd/ibs.c                         | 1 +
 arch/x86/events/amd/lbr.c                         | 2 ++
 arch/x86/events/amd/power.c                       | 3 +++
 arch/x86/events/amd/uncore.c                      | 1 +
 arch/x86/events/intel/core.c                      | 1 +
 arch/x86/events/intel/lbr.c                       | 1 +
 arch/x86/events/zhaoxin/core.c                    | 1 +
 arch/x86/include/asm/acrn.h                       | 2 ++
 arch/x86/include/asm/microcode.h                  | 1 +
 arch/x86/include/asm/xen/hypervisor.h             | 1 +
 arch/x86/kernel/apic/apic.c                       | 1 +
 arch/x86/kernel/cpu/amd.c                         | 1 +
 arch/x86/kernel/cpu/centaur.c                     | 1 +
 arch/x86/kernel/cpu/hygon.c                       | 1 +
 arch/x86/kernel/cpu/mce/core.c                    | 1 +
 arch/x86/kernel/cpu/mce/inject.c                  | 1 +
 arch/x86/kernel/cpu/microcode/amd.c               | 1 +
 arch/x86/kernel/cpu/microcode/core.c              | 1 +
 arch/x86/kernel/cpu/microcode/intel.c             | 1 +
 arch/x86/kernel/cpu/mshyperv.c                    | 1 +
 arch/x86/kernel/cpu/resctrl/core.c                | 1 +
 arch/x86/kernel/cpu/resctrl/monitor.c             | 1 +
 arch/x86/kernel/cpu/scattered.c                   | 1 +
 arch/x86/kernel/cpu/sgx/driver.c                  | 3 +++
 arch/x86/kernel/cpu/sgx/main.c                    | 3 +++
 arch/x86/kernel/cpu/topology_amd.c                | 1 +
 arch/x86/kernel/cpu/topology_common.c             | 1 +
 arch/x86/kernel/cpu/topology_ext.c                | 1 +
 arch/x86/kernel/cpu/transmeta.c                   | 3 +++
 arch/x86/kernel/cpu/vmware.c                      | 1 +
 arch/x86/kernel/cpu/zhaoxin.c                     | 1 +
 arch/x86/kernel/cpuid.c                           | 1 +
 arch/x86/kernel/jailhouse.c                       | 1 +
 arch/x86/kernel/kvm.c                             | 1 +
 arch/x86/kernel/paravirt.c                        | 1 +
 arch/x86/kvm/mmu/mmu.c                            | 1 +
 arch/x86/kvm/mmu/spte.c                           | 1 +
 arch/x86/kvm/reverse_cpuid.h                      | 2 ++
 arch/x86/kvm/svm/sev.c                            | 1 +
 arch/x86/kvm/svm/svm.c                            | 1 +
 arch/x86/kvm/vmx/pmu_intel.c                      | 1 +
 arch/x86/kvm/vmx/sgx.c                            | 1 +
 arch/x86/kvm/vmx/vmx.c                            | 1 +
 arch/x86/mm/pti.c                                 | 1 +
 arch/x86/pci/xen.c                                | 1 +
 arch/x86/xen/enlighten_hvm.c                      | 1 +
 arch/x86/xen/pmu.c                                | 1 +
 arch/x86/xen/time.c                               | 1 +
 drivers/char/agp/efficeon-agp.c                   | 1 +
 drivers/cpufreq/longrun.c                         | 1 +
 drivers/cpufreq/powernow-k7.c                     | 1 +
 drivers/cpufreq/powernow-k8.c                     | 1 +
 drivers/cpufreq/speedstep-lib.c                   | 1 +
 drivers/firmware/efi/libstub/x86-5lvl.c           | 1 +
 drivers/gpu/drm/gma500/mmu.c                      | 2 ++
 drivers/hwmon/fam15h_power.c                      | 1 +
 drivers/hwmon/k10temp.c                           | 2 ++
 drivers/hwmon/k8temp.c                            | 1 +
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 1 +
 drivers/ras/amd/fmpm.c                            | 1 +
 drivers/thermal/intel/intel_hfi.c                 | 1 +
 drivers/thermal/intel/x86_pkg_temp_thermal.c      | 1 +
 drivers/virt/acrn/hsm.c                           | 1 +
 drivers/xen/events/events_base.c                  | 1 +
 drivers/xen/grant-table.c                         | 1 +
 drivers/xen/xenbus/xenbus_xs.c                    | 3 +++
 70 files changed, 86 insertions(+)

diff --git a/arch/x86/boot/compressed/pgtable_64.c b/arch/x86/boot/compressed/pgtable_64.c
index 0e89e197e112..1b2fb35704f9 100644
--- a/arch/x86/boot/compressed/pgtable_64.c
+++ b/arch/x86/boot/compressed/pgtable_64.c
@@ -2,6 +2,7 @@
 #include "misc.h"
 #include <asm/bootparam.h>
 #include <asm/bootparam_utils.h>
+#include <asm/cpuid/api.h>
 #include <asm/e820/types.h>
 #include <asm/pgtable.h>
 #include <asm/processor.h>
diff --git a/arch/x86/boot/startup/sme.c b/arch/x86/boot/startup/sme.c
index b76a7c95dfe1..c07a2c381ed1 100644
--- a/arch/x86/boot/startup/sme.c
+++ b/arch/x86/boot/startup/sme.c
@@ -43,6 +43,7 @@
 #include <asm/init.h>
 #include <asm/setup.h>
 #include <asm/sections.h>
+#include <asm/cpuid/api.h>
 #include <asm/coco.h>
 #include <asm/sev.h>
 
diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index 186915a17c50..29b6f1ed59ec 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -14,6 +14,7 @@
 #include <asm/ia32.h>
 #include <asm/insn.h>
 #include <asm/insn-eval.h>
+#include <asm/cpuid/api.h>
 #include <asm/paravirt_types.h>
 #include <asm/pgtable.h>
 #include <asm/set_memory.h>
diff --git a/arch/x86/events/amd/core.c b/arch/x86/events/amd/core.c
index 0c92ed5f464b..d66a357f219d 100644
--- a/arch/x86/events/amd/core.c
+++ b/arch/x86/events/amd/core.c
@@ -8,8 +8,10 @@
 #include <linux/slab.h>
 #include <linux/delay.h>
 #include <linux/jiffies.h>
+
 #include <asm/apicdef.h>
 #include <asm/apic.h>
+#include <asm/cpuid/api.h>
 #include <asm/msr.h>
 #include <asm/nmi.h>
 
diff --git a/arch/x86/events/amd/ibs.c b/arch/x86/events/amd/ibs.c
index e0bd5051db2a..20c2de5c697b 100644
--- a/arch/x86/events/amd/ibs.c
+++ b/arch/x86/events/amd/ibs.c
@@ -15,6 +15,7 @@
 #include <linux/sched/clock.h>
 
 #include <asm/apic.h>
+#include <asm/cpuid/api.h>
 #include <asm/msr.h>
 
 #include "../perf_event.h"
diff --git a/arch/x86/events/amd/lbr.c b/arch/x86/events/amd/lbr.c
index d24da377df77..5b437dc8e4ce 100644
--- a/arch/x86/events/amd/lbr.c
+++ b/arch/x86/events/amd/lbr.c
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/perf_event.h>
+
+#include <asm/cpuid/api.h>
 #include <asm/msr.h>
 #include <asm/perf_event.h>
 
diff --git a/arch/x86/events/amd/power.c b/arch/x86/events/amd/power.c
index dad42790cf7d..744dffa42dee 100644
--- a/arch/x86/events/amd/power.c
+++ b/arch/x86/events/amd/power.c
@@ -10,8 +10,11 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/perf_event.h>
+
 #include <asm/cpu_device_id.h>
+#include <asm/cpuid/api.h>
 #include <asm/msr.h>
+
 #include "../perf_event.h"
 
 /* Event code: LSB 8 bits, passed in attr->config any other bit is reserved. */
diff --git a/arch/x86/events/amd/uncore.c b/arch/x86/events/amd/uncore.c
index dd956cfcadef..05cff39968ec 100644
--- a/arch/x86/events/amd/uncore.c
+++ b/arch/x86/events/amd/uncore.c
@@ -16,6 +16,7 @@
 #include <linux/smp.h>
 
 #include <asm/perf_event.h>
+#include <asm/cpuid/api.h>
 #include <asm/msr.h>
 
 #define NUM_COUNTERS_NB		4
diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index dd1e3aa75ee9..ea7507bb7047 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -17,6 +17,7 @@
 #include <linux/kvm_host.h>
 
 #include <asm/cpufeature.h>
+#include <asm/cpuid/api.h>
 #include <asm/debugreg.h>
 #include <asm/hardirq.h>
 #include <asm/intel-family.h>
diff --git a/arch/x86/events/intel/lbr.c b/arch/x86/events/intel/lbr.c
index 72f2adcda7c6..cae2e02fe6cc 100644
--- a/arch/x86/events/intel/lbr.c
+++ b/arch/x86/events/intel/lbr.c
@@ -4,6 +4,7 @@
 #include <linux/types.h>
 
 #include <asm/cpu_device_id.h>
+#include <asm/cpuid/api.h>
 #include <asm/perf_event.h>
 #include <asm/msr.h>
 
diff --git a/arch/x86/events/zhaoxin/core.c b/arch/x86/events/zhaoxin/core.c
index 4bdfcf091200..6ed644fe89aa 100644
--- a/arch/x86/events/zhaoxin/core.c
+++ b/arch/x86/events/zhaoxin/core.c
@@ -13,6 +13,7 @@
 #include <linux/nmi.h>
 
 #include <asm/cpufeature.h>
+#include <asm/cpuid/api.h>
 #include <asm/hardirq.h>
 #include <asm/apic.h>
 #include <asm/msr.h>
diff --git a/arch/x86/include/asm/acrn.h b/arch/x86/include/asm/acrn.h
index fab11192c60a..db42b477c41d 100644
--- a/arch/x86/include/asm/acrn.h
+++ b/arch/x86/include/asm/acrn.h
@@ -2,6 +2,8 @@
 #ifndef _ASM_X86_ACRN_H
 #define _ASM_X86_ACRN_H
 
+#include <asm/cpuid/api.h>
+
 /*
  * This CPUID returns feature bitmaps in EAX.
  * Guest VM uses this to detect the appropriate feature bit.
diff --git a/arch/x86/include/asm/microcode.h b/arch/x86/include/asm/microcode.h
index 3c317d155771..9cd136d4515c 100644
--- a/arch/x86/include/asm/microcode.h
+++ b/arch/x86/include/asm/microcode.h
@@ -3,6 +3,7 @@
 #define _ASM_X86_MICROCODE_H
 
 #include <asm/msr.h>
+#include <asm/cpuid/api.h>
 
 struct cpu_signature {
 	unsigned int sig;
diff --git a/arch/x86/include/asm/xen/hypervisor.h b/arch/x86/include/asm/xen/hypervisor.h
index c2fc7869b996..7c596cebfb78 100644
--- a/arch/x86/include/asm/xen/hypervisor.h
+++ b/arch/x86/include/asm/xen/hypervisor.h
@@ -37,6 +37,7 @@ extern struct shared_info *HYPERVISOR_shared_info;
 extern struct start_info *xen_start_info;
 
 #include <asm/bug.h>
+#include <asm/cpuid/api.h>
 #include <asm/processor.h>
 
 #define XEN_SIGNATURE "XenVMMXenVMM"
diff --git a/arch/x86/kernel/apic/apic.c b/arch/x86/kernel/apic/apic.c
index 639904911444..8c614750a19b 100644
--- a/arch/x86/kernel/apic/apic.c
+++ b/arch/x86/kernel/apic/apic.c
@@ -64,6 +64,7 @@
 #include <asm/tsc.h>
 #include <asm/hypervisor.h>
 #include <asm/cpu_device_id.h>
+#include <asm/cpuid/api.h>
 #include <asm/intel-family.h>
 #include <asm/irq_regs.h>
 #include <asm/cpu.h>
diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
index 2f8e8ff2d000..62f74a7f2f8d 100644
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -16,6 +16,7 @@
 #include <asm/cacheinfo.h>
 #include <asm/cpu.h>
 #include <asm/cpu_device_id.h>
+#include <asm/cpuid/api.h>
 #include <asm/spec-ctrl.h>
 #include <asm/smp.h>
 #include <asm/numa.h>
diff --git a/arch/x86/kernel/cpu/centaur.c b/arch/x86/kernel/cpu/centaur.c
index 81695da9c524..681d2da49341 100644
--- a/arch/x86/kernel/cpu/centaur.c
+++ b/arch/x86/kernel/cpu/centaur.c
@@ -5,6 +5,7 @@
 
 #include <asm/cpu.h>
 #include <asm/cpufeature.h>
+#include <asm/cpuid/api.h>
 #include <asm/e820/api.h>
 #include <asm/mtrr.h>
 #include <asm/msr.h>
diff --git a/arch/x86/kernel/cpu/hygon.c b/arch/x86/kernel/cpu/hygon.c
index 7f95a74e4c65..3e8891a9caf2 100644
--- a/arch/x86/kernel/cpu/hygon.c
+++ b/arch/x86/kernel/cpu/hygon.c
@@ -10,6 +10,7 @@
 
 #include <asm/apic.h>
 #include <asm/cpu.h>
+#include <asm/cpuid/api.h>
 #include <asm/smp.h>
 #include <asm/numa.h>
 #include <asm/cacheinfo.h>
diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index f3a793e3a6c8..eebc60342cd6 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -49,6 +49,7 @@
 
 #include <asm/fred.h>
 #include <asm/cpu_device_id.h>
+#include <asm/cpuid/api.h>
 #include <asm/processor.h>
 #include <asm/traps.h>
 #include <asm/tlbflush.h>
diff --git a/arch/x86/kernel/cpu/mce/inject.c b/arch/x86/kernel/cpu/mce/inject.c
index d02c4f556cd0..42c82c14c48a 100644
--- a/arch/x86/kernel/cpu/mce/inject.c
+++ b/arch/x86/kernel/cpu/mce/inject.c
@@ -26,6 +26,7 @@
 
 #include <asm/amd/nb.h>
 #include <asm/apic.h>
+#include <asm/cpuid/api.h>
 #include <asm/irq_vectors.h>
 #include <asm/mce.h>
 #include <asm/msr.h>
diff --git a/arch/x86/kernel/cpu/microcode/amd.c b/arch/x86/kernel/cpu/microcode/amd.c
index e533881284a1..874b5b70c0d2 100644
--- a/arch/x86/kernel/cpu/microcode/amd.c
+++ b/arch/x86/kernel/cpu/microcode/amd.c
@@ -34,6 +34,7 @@
 
 #include <asm/microcode.h>
 #include <asm/processor.h>
+#include <asm/cpuid/api.h>
 #include <asm/cmdline.h>
 #include <asm/setup.h>
 #include <asm/cpu.h>
diff --git a/arch/x86/kernel/cpu/microcode/core.c b/arch/x86/kernel/cpu/microcode/core.c
index 651202e6fefb..56d791aeac4e 100644
--- a/arch/x86/kernel/cpu/microcode/core.c
+++ b/arch/x86/kernel/cpu/microcode/core.c
@@ -34,6 +34,7 @@
 
 #include <asm/apic.h>
 #include <asm/cpu_device_id.h>
+#include <asm/cpuid/api.h>
 #include <asm/perf_event.h>
 #include <asm/processor.h>
 #include <asm/cmdline.h>
diff --git a/arch/x86/kernel/cpu/microcode/intel.c b/arch/x86/kernel/cpu/microcode/intel.c
index 37ac4afe0972..18d2eff7a4b7 100644
--- a/arch/x86/kernel/cpu/microcode/intel.c
+++ b/arch/x86/kernel/cpu/microcode/intel.c
@@ -25,6 +25,7 @@
 #include <linux/mm.h>
 
 #include <asm/cpu_device_id.h>
+#include <asm/cpuid/api.h>
 #include <asm/processor.h>
 #include <asm/tlbflush.h>
 #include <asm/setup.h>
diff --git a/arch/x86/kernel/cpu/mshyperv.c b/arch/x86/kernel/cpu/mshyperv.c
index b5b6a58b67b0..640e6b223c2d 100644
--- a/arch/x86/kernel/cpu/mshyperv.c
+++ b/arch/x86/kernel/cpu/mshyperv.c
@@ -19,6 +19,7 @@
 #include <linux/random.h>
 #include <asm/processor.h>
 #include <asm/hypervisor.h>
+#include <asm/cpuid/api.h>
 #include <hyperv/hvhdk.h>
 #include <asm/mshyperv.h>
 #include <asm/desc.h>
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 7667cf7c4e94..9c01d2562b7a 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -22,6 +22,7 @@
 #include <linux/cpuhotplug.h>
 
 #include <asm/cpu_device_id.h>
+#include <asm/cpuid/api.h>
 #include <asm/msr.h>
 #include <asm/resctrl.h>
 #include "internal.h"
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 9bd87bae4983..145be7abee52 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -21,6 +21,7 @@
 #include <linux/resctrl.h>
 
 #include <asm/cpu_device_id.h>
+#include <asm/cpuid/api.h>
 #include <asm/msr.h>
 
 #include "internal.h"
diff --git a/arch/x86/kernel/cpu/scattered.c b/arch/x86/kernel/cpu/scattered.c
index 837d6a4b0c28..937129ce6a96 100644
--- a/arch/x86/kernel/cpu/scattered.c
+++ b/arch/x86/kernel/cpu/scattered.c
@@ -6,6 +6,7 @@
 
 #include <asm/memtype.h>
 #include <asm/apic.h>
+#include <asm/cpuid/api.h>
 #include <asm/processor.h>
 
 #include "cpu.h"
diff --git a/arch/x86/kernel/cpu/sgx/driver.c b/arch/x86/kernel/cpu/sgx/driver.c
index 473619741bc4..9268289cd9f9 100644
--- a/arch/x86/kernel/cpu/sgx/driver.c
+++ b/arch/x86/kernel/cpu/sgx/driver.c
@@ -6,7 +6,10 @@
 #include <linux/mman.h>
 #include <linux/security.h>
 #include <linux/suspend.h>
+
+#include <asm/cpuid/api.h>
 #include <asm/traps.h>
+
 #include "driver.h"
 #include "encl.h"
 
diff --git a/arch/x86/kernel/cpu/sgx/main.c b/arch/x86/kernel/cpu/sgx/main.c
index 38b7fd2f63be..4505f808af5e 100644
--- a/arch/x86/kernel/cpu/sgx/main.c
+++ b/arch/x86/kernel/cpu/sgx/main.c
@@ -15,9 +15,12 @@
 #include <linux/slab.h>
 #include <linux/sysfs.h>
 #include <linux/vmalloc.h>
+
+#include <asm/cpuid/api.h>
 #include <asm/msr.h>
 #include <asm/sgx.h>
 #include <asm/archrandom.h>
+
 #include "driver.h"
 #include "encl.h"
 #include "encls.h"
diff --git a/arch/x86/kernel/cpu/topology_amd.c b/arch/x86/kernel/cpu/topology_amd.c
index 6ac097e13106..cc103c85b96d 100644
--- a/arch/x86/kernel/cpu/topology_amd.c
+++ b/arch/x86/kernel/cpu/topology_amd.c
@@ -2,6 +2,7 @@
 #include <linux/cpu.h>
 
 #include <asm/apic.h>
+#include <asm/cpuid/api.h>
 #include <asm/memtype.h>
 #include <asm/msr.h>
 #include <asm/processor.h>
diff --git a/arch/x86/kernel/cpu/topology_common.c b/arch/x86/kernel/cpu/topology_common.c
index d0d79d5b8eb9..cf7513416b70 100644
--- a/arch/x86/kernel/cpu/topology_common.c
+++ b/arch/x86/kernel/cpu/topology_common.c
@@ -6,6 +6,7 @@
 #include <asm/intel-family.h>
 #include <asm/apic.h>
 #include <asm/processor.h>
+#include <asm/cpuid/api.h>
 #include <asm/smp.h>
 
 #include "cpu.h"
diff --git a/arch/x86/kernel/cpu/topology_ext.c b/arch/x86/kernel/cpu/topology_ext.c
index 467b0326bf1a..eb915c73895f 100644
--- a/arch/x86/kernel/cpu/topology_ext.c
+++ b/arch/x86/kernel/cpu/topology_ext.c
@@ -2,6 +2,7 @@
 #include <linux/cpu.h>
 
 #include <asm/apic.h>
+#include <asm/cpuid/api.h>
 #include <asm/memtype.h>
 #include <asm/processor.h>
 
diff --git a/arch/x86/kernel/cpu/transmeta.c b/arch/x86/kernel/cpu/transmeta.c
index 42c939827621..1fdcd69c625c 100644
--- a/arch/x86/kernel/cpu/transmeta.c
+++ b/arch/x86/kernel/cpu/transmeta.c
@@ -3,8 +3,11 @@
 #include <linux/sched.h>
 #include <linux/sched/clock.h>
 #include <linux/mm.h>
+
 #include <asm/cpufeature.h>
+#include <asm/cpuid/api.h>
 #include <asm/msr.h>
+
 #include "cpu.h"
 
 static void early_init_transmeta(struct cpuinfo_x86 *c)
diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index eee0d1a48802..34b73573b108 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -33,6 +33,7 @@
 #include <asm/div64.h>
 #include <asm/x86_init.h>
 #include <asm/hypervisor.h>
+#include <asm/cpuid/api.h>
 #include <asm/timer.h>
 #include <asm/apic.h>
 #include <asm/vmware.h>
diff --git a/arch/x86/kernel/cpu/zhaoxin.c b/arch/x86/kernel/cpu/zhaoxin.c
index 031379b7d4fa..761aef5590ac 100644
--- a/arch/x86/kernel/cpu/zhaoxin.c
+++ b/arch/x86/kernel/cpu/zhaoxin.c
@@ -4,6 +4,7 @@
 
 #include <asm/cpu.h>
 #include <asm/cpufeature.h>
+#include <asm/cpuid/api.h>
 #include <asm/msr.h>
 
 #include "cpu.h"
diff --git a/arch/x86/kernel/cpuid.c b/arch/x86/kernel/cpuid.c
index dae436253de4..cbd04b677fd1 100644
--- a/arch/x86/kernel/cpuid.c
+++ b/arch/x86/kernel/cpuid.c
@@ -37,6 +37,7 @@
 #include <linux/gfp.h>
 #include <linux/completion.h>
 
+#include <asm/cpuid/api.h>
 #include <asm/processor.h>
 #include <asm/msr.h>
 
diff --git a/arch/x86/kernel/jailhouse.c b/arch/x86/kernel/jailhouse.c
index 9e9a591a5fec..f58ce9220e0f 100644
--- a/arch/x86/kernel/jailhouse.c
+++ b/arch/x86/kernel/jailhouse.c
@@ -17,6 +17,7 @@
 #include <asm/io_apic.h>
 #include <asm/acpi.h>
 #include <asm/cpu.h>
+#include <asm/cpuid/api.h>
 #include <asm/hypervisor.h>
 #include <asm/i8259.h>
 #include <asm/irqdomain.h>
diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
index 29226d112029..06534e16cfb5 100644
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -41,6 +41,7 @@
 #include <asm/hypervisor.h>
 #include <asm/mtrr.h>
 #include <asm/tlb.h>
+#include <asm/cpuid/api.h>
 #include <asm/cpuidle_haltpoll.h>
 #include <asm/msr.h>
 #include <asm/ptrace.h>
diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index 792fa96b3233..44f29fc05b3d 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -24,6 +24,7 @@
 #include <asm/time.h>
 #include <asm/pgalloc.h>
 #include <asm/irq.h>
+#include <asm/cpuid/api.h>
 #include <asm/delay.h>
 #include <asm/fixmap.h>
 #include <asm/apic.h>
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index f0144ae8d891..91843e9224d0 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -52,6 +52,7 @@
 #include <asm/page.h>
 #include <asm/memtype.h>
 #include <asm/cmpxchg.h>
+#include <asm/cpuid/api.h>
 #include <asm/io.h>
 #include <asm/set_memory.h>
 #include <asm/spec-ctrl.h>
diff --git a/arch/x86/kvm/mmu/spte.c b/arch/x86/kvm/mmu/spte.c
index 85a0473809b0..4e753386c8d4 100644
--- a/arch/x86/kvm/mmu/spte.c
+++ b/arch/x86/kvm/mmu/spte.c
@@ -15,6 +15,7 @@
 #include "x86.h"
 #include "spte.h"
 
+#include <asm/cpuid/api.h>
 #include <asm/e820/api.h>
 #include <asm/memtype.h>
 #include <asm/vmx.h>
diff --git a/arch/x86/kvm/reverse_cpuid.h b/arch/x86/kvm/reverse_cpuid.h
index 657f5f743ed9..2ad25781cefb 100644
--- a/arch/x86/kvm/reverse_cpuid.h
+++ b/arch/x86/kvm/reverse_cpuid.h
@@ -3,8 +3,10 @@
 #define ARCH_X86_KVM_REVERSE_CPUID_H
 
 #include <uapi/asm/kvm.h>
+
 #include <asm/cpufeature.h>
 #include <asm/cpufeatures.h>
+#include <asm/cpuid/types.h>
 
 /*
  * Define a KVM-only feature flag.
diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index c2126b3c3072..e107f368ed2d 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -23,6 +23,7 @@
 
 #include <asm/pkru.h>
 #include <asm/trapnr.h>
+#include <asm/cpuid/api.h>
 #include <asm/fpu/xcr.h>
 #include <asm/fpu/xstate.h>
 #include <asm/debugreg.h>
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index e02a38da5296..d38a21be099d 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -41,6 +41,7 @@
 #include <asm/irq_remapping.h>
 #include <asm/spec-ctrl.h>
 #include <asm/cpu_device_id.h>
+#include <asm/cpuid/api.h>
 #include <asm/traps.h>
 #include <asm/reboot.h>
 #include <asm/fpu/api.h>
diff --git a/arch/x86/kvm/vmx/pmu_intel.c b/arch/x86/kvm/vmx/pmu_intel.c
index 27eb76e6b6a0..74e0b01185b8 100644
--- a/arch/x86/kvm/vmx/pmu_intel.c
+++ b/arch/x86/kvm/vmx/pmu_intel.c
@@ -15,6 +15,7 @@
 #include <linux/perf_event.h>
 #include <asm/msr.h>
 #include <asm/perf_event.h>
+#include <asm/cpuid/api.h>
 #include "x86.h"
 #include "cpuid.h"
 #include "lapic.h"
diff --git a/arch/x86/kvm/vmx/sgx.c b/arch/x86/kvm/vmx/sgx.c
index df1d0cf76947..29a1f8e3be60 100644
--- a/arch/x86/kvm/vmx/sgx.c
+++ b/arch/x86/kvm/vmx/sgx.c
@@ -2,6 +2,7 @@
 /*  Copyright(c) 2021 Intel Corporation. */
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <asm/cpuid/api.h>
 #include <asm/msr.h>
 #include <asm/sgx.h>
 
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index b9103de01428..ede773ce065a 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -33,6 +33,7 @@
 #include <asm/asm.h>
 #include <asm/cpu.h>
 #include <asm/cpu_device_id.h>
+#include <asm/cpuid/api.h>
 #include <asm/debugreg.h>
 #include <asm/desc.h>
 #include <asm/fpu/api.h>
diff --git a/arch/x86/mm/pti.c b/arch/x86/mm/pti.c
index 631f0375bd42..598f553cc871 100644
--- a/arch/x86/mm/pti.c
+++ b/arch/x86/mm/pti.c
@@ -31,6 +31,7 @@
 
 #include <asm/cpufeature.h>
 #include <asm/hypervisor.h>
+#include <asm/cpuid/api.h>
 #include <asm/vsyscall.h>
 #include <asm/cmdline.h>
 #include <asm/pti.h>
diff --git a/arch/x86/pci/xen.c b/arch/x86/pci/xen.c
index 6818515a501b..550c631bc77f 100644
--- a/arch/x86/pci/xen.c
+++ b/arch/x86/pci/xen.c
@@ -18,6 +18,7 @@
 #include <linux/io.h>
 #include <asm/io_apic.h>
 #include <asm/pci_x86.h>
+#include <asm/cpuid/api.h>
 
 #include <asm/xen/hypervisor.h>
 
diff --git a/arch/x86/xen/enlighten_hvm.c b/arch/x86/xen/enlighten_hvm.c
index 2f9fa27e5a3c..2bf05bf3e17b 100644
--- a/arch/x86/xen/enlighten_hvm.c
+++ b/arch/x86/xen/enlighten_hvm.c
@@ -20,6 +20,7 @@
 #include <asm/setup.h>
 #include <asm/idtentry.h>
 #include <asm/hypervisor.h>
+#include <asm/cpuid/api.h>
 #include <asm/e820/api.h>
 #include <asm/early_ioremap.h>
 
diff --git a/arch/x86/xen/pmu.c b/arch/x86/xen/pmu.c
index 8f89ce0b67e3..5f50a3ee08f5 100644
--- a/arch/x86/xen/pmu.c
+++ b/arch/x86/xen/pmu.c
@@ -2,6 +2,7 @@
 #include <linux/types.h>
 #include <linux/interrupt.h>
 
+#include <asm/cpuid/api.h>
 #include <asm/msr.h>
 #include <asm/xen/hypercall.h>
 #include <xen/xen.h>
diff --git a/arch/x86/xen/time.c b/arch/x86/xen/time.c
index 6f9f665bb7ae..d62c14334b35 100644
--- a/arch/x86/xen/time.c
+++ b/arch/x86/xen/time.c
@@ -18,6 +18,7 @@
 #include <linux/timekeeper_internal.h>
 #include <linux/sched/cputime.h>
 
+#include <asm/cpuid/api.h>
 #include <asm/pvclock.h>
 #include <asm/timer.h>
 #include <asm/xen/hypervisor.h>
diff --git a/drivers/char/agp/efficeon-agp.c b/drivers/char/agp/efficeon-agp.c
index 0d25bbdc7e6a..4d0b7d7c0aad 100644
--- a/drivers/char/agp/efficeon-agp.c
+++ b/drivers/char/agp/efficeon-agp.c
@@ -27,6 +27,7 @@
 #include <linux/gfp.h>
 #include <linux/page-flags.h>
 #include <linux/mm.h>
+#include <asm/cpuid/api.h>
 #include "agp.h"
 #include "intel-agp.h"
 
diff --git a/drivers/cpufreq/longrun.c b/drivers/cpufreq/longrun.c
index 1caaec7c280b..f3aaca0496a4 100644
--- a/drivers/cpufreq/longrun.c
+++ b/drivers/cpufreq/longrun.c
@@ -14,6 +14,7 @@
 #include <asm/msr.h>
 #include <asm/processor.h>
 #include <asm/cpu_device_id.h>
+#include <asm/cpuid/api.h>
 
 static struct cpufreq_driver	longrun_driver;
 
diff --git a/drivers/cpufreq/powernow-k7.c b/drivers/cpufreq/powernow-k7.c
index 6b7caf4ae20d..6a930d7e6a5c 100644
--- a/drivers/cpufreq/powernow-k7.c
+++ b/drivers/cpufreq/powernow-k7.c
@@ -29,6 +29,7 @@
 #include <asm/timer.h>		/* Needed for recalibrate_cpu_khz() */
 #include <asm/msr.h>
 #include <asm/cpu_device_id.h>
+#include <asm/cpuid/api.h>
 
 #ifdef CONFIG_X86_POWERNOW_K7_ACPI
 #include <linux/acpi.h>
diff --git a/drivers/cpufreq/powernow-k8.c b/drivers/cpufreq/powernow-k8.c
index 4d77eef53fe0..2b791f1ec51b 100644
--- a/drivers/cpufreq/powernow-k8.c
+++ b/drivers/cpufreq/powernow-k8.c
@@ -39,6 +39,7 @@
 
 #include <asm/msr.h>
 #include <asm/cpu_device_id.h>
+#include <asm/cpuid/api.h>
 
 #include <linux/acpi.h>
 #include <linux/mutex.h>
diff --git a/drivers/cpufreq/speedstep-lib.c b/drivers/cpufreq/speedstep-lib.c
index f8b42e981635..973716c1c29c 100644
--- a/drivers/cpufreq/speedstep-lib.c
+++ b/drivers/cpufreq/speedstep-lib.c
@@ -15,6 +15,7 @@
 #include <linux/init.h>
 #include <linux/cpufreq.h>
 
+#include <asm/cpuid/api.h>
 #include <asm/msr.h>
 #include <asm/tsc.h>
 #include "speedstep-lib.h"
diff --git a/drivers/firmware/efi/libstub/x86-5lvl.c b/drivers/firmware/efi/libstub/x86-5lvl.c
index c00d0ae7ed5d..c3da05c0df8b 100644
--- a/drivers/firmware/efi/libstub/x86-5lvl.c
+++ b/drivers/firmware/efi/libstub/x86-5lvl.c
@@ -2,6 +2,7 @@
 #include <linux/efi.h>
 
 #include <asm/boot.h>
+#include <asm/cpuid/api.h>
 #include <asm/desc.h>
 #include <asm/efi.h>
 
diff --git a/drivers/gpu/drm/gma500/mmu.c b/drivers/gpu/drm/gma500/mmu.c
index 6b6b44e426cf..4fbc22a59ac7 100644
--- a/drivers/gpu/drm/gma500/mmu.c
+++ b/drivers/gpu/drm/gma500/mmu.c
@@ -7,6 +7,8 @@
 #include <linux/highmem.h>
 #include <linux/vmalloc.h>
 
+#include <asm/cpuid/api.h>
+
 #include "mmu.h"
 #include "psb_drv.h"
 #include "psb_reg.h"
diff --git a/drivers/hwmon/fam15h_power.c b/drivers/hwmon/fam15h_power.c
index efcbea2d070e..ad4ed4162b57 100644
--- a/drivers/hwmon/fam15h_power.c
+++ b/drivers/hwmon/fam15h_power.c
@@ -19,6 +19,7 @@
 #include <linux/sched.h>
 #include <linux/topology.h>
 #include <asm/processor.h>
+#include <asm/cpuid/api.h>
 #include <asm/msr.h>
 
 MODULE_DESCRIPTION("AMD Family 15h CPU processor power monitor");
diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
index a5d8f45b7881..de0760dc597d 100644
--- a/drivers/hwmon/k10temp.c
+++ b/drivers/hwmon/k10temp.c
@@ -20,7 +20,9 @@
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/pci_ids.h>
+
 #include <asm/amd/node.h>
+#include <asm/cpuid/api.h>
 #include <asm/processor.h>
 
 MODULE_DESCRIPTION("AMD Family 10h+ CPU core temperature monitor");
diff --git a/drivers/hwmon/k8temp.c b/drivers/hwmon/k8temp.c
index 2b80ac410cd1..53241164570e 100644
--- a/drivers/hwmon/k8temp.c
+++ b/drivers/hwmon/k8temp.c
@@ -15,6 +15,7 @@
 #include <linux/err.h>
 #include <linux/mutex.h>
 #include <asm/processor.h>
+#include <asm/cpuid/api.h>
 
 #define TEMP_FROM_REG(val)	(((((val) >> 16) & 0xff) - 49) * 1000)
 #define REG_TEMP	0xe4
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 7898b5075a8b..b8d467ba6d72 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -6,6 +6,7 @@
 #include <linux/pci.h>
 #include <linux/dmi.h>
 #include <linux/platform_data/x86/intel_pmc_ipc.h>
+#include <asm/cpuid/api.h>
 #include "dwmac-intel.h"
 #include "dwmac4.h"
 #include "stmmac.h"
diff --git a/drivers/ras/amd/fmpm.c b/drivers/ras/amd/fmpm.c
index 34ef75af31cb..4ccaaf7b70bf 100644
--- a/drivers/ras/amd/fmpm.c
+++ b/drivers/ras/amd/fmpm.c
@@ -52,6 +52,7 @@
 #include <acpi/apei.h>
 
 #include <asm/cpu_device_id.h>
+#include <asm/cpuid/api.h>
 #include <asm/mce.h>
 
 #include "../debugfs.h"
diff --git a/drivers/thermal/intel/intel_hfi.c b/drivers/thermal/intel/intel_hfi.c
index 8c4ae75231f8..3273b8fe3d4d 100644
--- a/drivers/thermal/intel/intel_hfi.c
+++ b/drivers/thermal/intel/intel_hfi.c
@@ -41,6 +41,7 @@
 #include <linux/topology.h>
 #include <linux/workqueue.h>
 
+#include <asm/cpuid/api.h>
 #include <asm/msr.h>
 
 #include "intel_hfi.h"
diff --git a/drivers/thermal/intel/x86_pkg_temp_thermal.c b/drivers/thermal/intel/x86_pkg_temp_thermal.c
index 540109761f0a..d1dd2f5910e4 100644
--- a/drivers/thermal/intel/x86_pkg_temp_thermal.c
+++ b/drivers/thermal/intel/x86_pkg_temp_thermal.c
@@ -20,6 +20,7 @@
 #include <linux/debugfs.h>
 
 #include <asm/cpu_device_id.h>
+#include <asm/cpuid/api.h>
 #include <asm/msr.h>
 
 #include "thermal_interrupt.h"
diff --git a/drivers/virt/acrn/hsm.c b/drivers/virt/acrn/hsm.c
index 74f2086fa59f..f170ff4617fd 100644
--- a/drivers/virt/acrn/hsm.c
+++ b/drivers/virt/acrn/hsm.c
@@ -16,6 +16,7 @@
 #include <linux/slab.h>
 
 #include <asm/acrn.h>
+#include <asm/cpuid/api.h>
 #include <asm/hypervisor.h>
 
 #include "acrn_drv.h"
diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
index bc9a41662efc..6ea945508a89 100644
--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -40,6 +40,7 @@
 #include <linux/ktime.h>
 
 #ifdef CONFIG_X86
+#include <asm/cpuid/api.h>
 #include <asm/desc.h>
 #include <asm/ptrace.h>
 #include <asm/idtentry.h>
diff --git a/drivers/xen/grant-table.c b/drivers/xen/grant-table.c
index a6abf1ccd54c..35f879dc5dfb 100644
--- a/drivers/xen/grant-table.c
+++ b/drivers/xen/grant-table.c
@@ -59,6 +59,7 @@
 #include <xen/swiotlb-xen.h>
 #include <xen/balloon.h>
 #ifdef CONFIG_X86
+#include <asm/cpuid/api.h>
 #include <asm/xen/cpuid.h>
 #endif
 #include <xen/mem-reservation.h>
diff --git a/drivers/xen/xenbus/xenbus_xs.c b/drivers/xen/xenbus/xenbus_xs.c
index 82b0a34ded70..c202e7c553a6 100644
--- a/drivers/xen/xenbus/xenbus_xs.c
+++ b/drivers/xen/xenbus/xenbus_xs.c
@@ -47,6 +47,9 @@
 #include <linux/rwsem.h>
 #include <linux/mutex.h>
 #include <asm/xen/hypervisor.h>
+#ifdef CONFIG_X86
+#include <asm/cpuid/api.h>
+#endif
 #include <xen/xenbus.h>
 #include <xen/xen.h>
 #include "xenbus.h"
-- 
2.54.0

