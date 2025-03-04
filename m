Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CA320459C
	for <x86-cpuid@lists.linux.dev>; Tue,  4 Mar 2025 08:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741078443; cv=none; b=h9U3SS+EMgFSMJkFDc84dYSlX2Geb+MXwlTYHRJPNi68RQPr/P1eA++AfvEt2KxMLkh9qEAo3cglFRYskbHIXGSxeFa2ZV5neV4omt/VLnFeXcNuR5Kqcrl/okdIQbPuULCbDfIEqqMsitwfK5spM8qtb4KItAxcHiotTACaeDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741078443; c=relaxed/simple;
	bh=6KtrpdC5+NUVHd7Ozqev3oC0KaGm949m8rnOyMqGMxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aunEDp4pciXI+tVNcOBUuUnmf4FNuHAHSlc3EwAhI7/KitNR0dqwK9oGeiHhrRhXghRWqwodZT6pmbuqKFW5PIMUS4lIRaithelX8teFjVgAkcZ57t/e93OtXxRicrFEvIbop9ojkW0SXVBN9GfuwexE6J7YOUF9UHGLTKGykyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DZ5a53h3; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BPsyyDHh; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DZ5a53h3";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BPsyyDHh"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741078439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E2ZqNYsTPYK5LhLfCcaC6wx91oUbqwJeh6/BPfMbMFY=;
	b=DZ5a53h3uVvt1NaC/ytr4tlwDAigKY03QV2o3r+A8UTu2QEI6JV2K6yFnWDxUqTaFZPtly
	3Te7w/Kc9lz/+5VZR8mX10VgogzlnWsZwbXJ8pWOXVyFqK+2GIB4onMKmF71vV9etd4idv
	pwqiILTPYy7eeAWgips+y73X05Wv+D1yxN/5ynyMNX1iToKdgiTKmUg09/aqNwrMrOf4sl
	XIr7M9WGu44+SIUqpCLJresX6e8UWg/sN10yt+oWAJ7PeUgmP8/Pk2tkD6pOO2Q3bmk2xV
	KKaEeFdGnw8w6M+BO+GrlzCR0wO7Di/0su3ZqgpD87jw6nM12hQgZMQ2PFZxdg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741078439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E2ZqNYsTPYK5LhLfCcaC6wx91oUbqwJeh6/BPfMbMFY=;
	b=BPsyyDHhRmLpCVM+LApPJ4XTwpzpiaEo38ZZwNiUJg5mKZVPK3Uz5kYgSUvAVEmwkBXbBh
	R4nGecjtlStBc4CQ==
To: Borislav Petkov <bp@alien8.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	John Ogness <john.ogness@linutronix.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	x86@kernel.org,
	x86-cpuid@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	"Ahmed S. Darwish" <darwi@linutronix.de>
Subject: [PATCH v1 35/40] x86/cacheinfo: Separate intel leaf 0x4 handling
Date: Tue,  4 Mar 2025 09:51:46 +0100
Message-ID: <20250304085152.51092-36-darwi@linutronix.de>
In-Reply-To: <20250304085152.51092-1-darwi@linutronix.de>
References: <20250304085152.51092-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

init_intel_cacheinfo() was overly complex.  It parsed leaf 0x4 data,
leaf 0x2 data, and performed post-processing, all within one function.
Parent commit moved leaf 0x2 parsing and the post-processing logic into
their own functions.

Continue the refactoring by extracting leaf 0x4 parsing into its own
function.  Initialize local L2/L3 topology ID variables to BAD_APICID by
default, thus ensuring they can be used unconditionally.

Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/cacheinfo.c | 110 ++++++++++++++++----------------
 1 file changed, 54 insertions(+), 56 deletions(-)

diff --git a/arch/x86/kernel/cpu/cacheinfo.c b/arch/x86/kernel/cpu/cacheinfo.c
index a15538d72432..7bd3c33b7f04 100644
--- a/arch/x86/kernel/cpu/cacheinfo.c
+++ b/arch/x86/kernel/cpu/cacheinfo.c
@@ -397,73 +397,71 @@ static void intel_cacheinfo_0x2(struct cpuinfo_x86 *c)
 	intel_cacheinfo_done(c, l3, l2, l1i, l1d);
 }
 
-void init_intel_cacheinfo(struct cpuinfo_x86 *c)
+static bool intel_cacheinfo_0x4(struct cpuinfo_x86 *c)
 {
 	struct cpu_cacheinfo *ci = get_cpu_cacheinfo(c->cpu_index);
-	unsigned int l1i = 0, l1d = 0, l2 = 0, l3 = 0;
-	unsigned int l2_id = 0, l3_id = 0;
-
-	if (c->cpuid_level > 3) {
-		/*
-		 * There should be at least one leaf. A non-zero value means
-		 * that the number of leaves has been initialized.
-		 */
-		if (!ci->num_leaves)
-			ci->num_leaves = find_num_cache_leaves(c);
+	unsigned int l2_id = BAD_APICID, l3_id = BAD_APICID;
+	unsigned int l1d = 0, l1i = 0, l2 = 0, l3 = 0;
 
-		/*
-		 * Whenever possible use cpuid(4), deterministic cache
-		 * parameters cpuid leaf to find the cache details
-		 */
-		for (int i = 0; i < ci->num_leaves; i++) {
-			unsigned int num_threads_sharing, index_msb;
-			struct _cpuid4_info id4 = {};
-			int retval;
+	if (c->cpuid_level < 4)
+		return false;
 
-			retval = intel_fill_cpuid4_info(i, &id4);
-			if (retval < 0)
-				continue;
+	/*
+	 * There should be at least one leaf. A non-zero value means
+	 * that the number of leaves has been previously initialized.
+	 */
+	if (!ci->num_leaves)
+		ci->num_leaves = find_num_cache_leaves(c);
 
-			switch (id4.eax.split.level) {
-			case 1:
-				if (id4.eax.split.type == CTYPE_DATA)
-					l1d = id4.size / 1024;
-				else if (id4.eax.split.type == CTYPE_INST)
-					l1i = id4.size / 1024;
-				break;
-			case 2:
-				l2 = id4.size / 1024;
-				num_threads_sharing = 1 + id4.eax.split.num_threads_sharing;
-				index_msb = get_count_order(num_threads_sharing);
-				l2_id = c->topo.apicid & ~((1 << index_msb) - 1);
-				break;
-			case 3:
-				l3 = id4.size / 1024;
-				num_threads_sharing = 1 + id4.eax.split.num_threads_sharing;
-				index_msb = get_count_order(num_threads_sharing);
-				l3_id = c->topo.apicid & ~((1 << index_msb) - 1);
-				break;
-			default:
-				break;
-			}
+	if (!ci->num_leaves)
+		return false;
+
+	for (int i = 0; i < ci->num_leaves; i++) {
+		unsigned int num_threads_sharing, index_msb;
+		struct _cpuid4_info id4 = {};
+		int ret;
+
+		ret = intel_fill_cpuid4_info(i, &id4);
+		if (ret < 0)
+			continue;
+
+		switch (id4.eax.split.level) {
+		case 1:
+			if (id4.eax.split.type == CTYPE_DATA)
+				l1d = id4.size / 1024;
+			else if (id4.eax.split.type == CTYPE_INST)
+				l1i = id4.size / 1024;
+			break;
+		case 2:
+			l2 = id4.size / 1024;
+			num_threads_sharing = 1 + id4.eax.split.num_threads_sharing;
+			index_msb = get_count_order(num_threads_sharing);
+			l2_id = c->topo.apicid & ~((1 << index_msb) - 1);
+			break;
+		case 3:
+			l3 = id4.size / 1024;
+			num_threads_sharing = 1 + id4.eax.split.num_threads_sharing;
+			index_msb = get_count_order(num_threads_sharing);
+			l3_id = c->topo.apicid & ~((1 << index_msb) - 1);
+			break;
+		default:
+			break;
 		}
 	}
 
+	c->topo.l2c_id = l2_id;
+	c->topo.llc_id = (l3_id == BAD_APICID) ? l2_id : l3_id;
+	intel_cacheinfo_done(c, l3, l2, l1i, l1d);
+	return true;
+}
+
+void init_intel_cacheinfo(struct cpuinfo_x86 *c)
+{
 	/* Don't use CPUID(2) if CPUID(4) is supported. */
-	if (!ci->num_leaves && c->cpuid_level > 1) {
-		intel_cacheinfo_0x2(c);
+	if (intel_cacheinfo_0x4(c))
 		return;
-	}
-
-	if (l2) {
-		c->topo.llc_id = l2_id;
-		c->topo.l2c_id = l2_id;
-	}
-
-	if (l3)
-		c->topo.llc_id = l3_id;
 
-	intel_cacheinfo_done(c, l3, l2, l1i, l1d);
+	intel_cacheinfo_0x2(c);
 }
 
 static int __cache_amd_cpumap_setup(unsigned int cpu, int index,
-- 
2.48.1

