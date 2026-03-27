Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9620B33689E
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774578125; cv=none; b=br/uHPQv/I+dA5Fm75VPf1kAEyP7rqVFSEa1tt+eqznHk1l+PSCQmrvN4LfxHO0bjdvMr6dE/l4qc0lW4HNSUt5r6y5rRPFGCnO7sRlMy+vBV8Fh4f+ppjxzrKi3mrEtChB2uj+eA3s1X1iUuuPDlDVFWiDpyMhMmqjYLkDKkXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774578125; c=relaxed/simple;
	bh=jM6IyPtqSl0Z/qb+GWetwbBK0Q5qGgMBAsPTAYXFv64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pjeFybss58GJzwzdAkqeRVdXqr5xRGMiL5VF5irwMCWxAvWO2oqdKZFsR8RcoGqsL/boV6sM610zf5AkVLTmRicL9bNd2MCfpvFh6Cd9LLtKJ5vZjQOJGmNKn7ETIlrJaphUE7hzE3OZ8T5PLJO+x2X06Qk3IWhCUUNRzAqQDBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=W4KS8TML; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=6m7ZH0Q4; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="W4KS8TML";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="6m7ZH0Q4"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774578122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3AvHztOH2N1gnVwaEaY4sQY0Ui0R/lMvPlZuC+Cycvk=;
	b=W4KS8TMLqUtaebF21Y9fVNf33/AkeMxalcKSGBXoq2OzEnH+LrMOaqrKTjQR2S057hz3bG
	LDcyyoANWl7uZ1AGDUJsvRNKsQYigNwjLUd/eOjX9vptIPCov2M7EO/bocGp8TO8KU2kVg
	RpVs5oS8nQFjCf5gIGRKy9ClJwXmy4zq2ii1AwuQiJOTgAMkEvHvn80znEf1XmvdU3BxD4
	6Rj89pXeEI996xujY56wFd8iCNz2W5CDtlXCrwtzE6wCgGAthJF9UQcf52DafrEeTYtIAq
	H47MwT7gSJ+YGgQWbckgHwg650XjNTnbkdiB370HkyEh6xqctCaJHdXRNaS7nw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774578122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3AvHztOH2N1gnVwaEaY4sQY0Ui0R/lMvPlZuC+Cycvk=;
	b=6m7ZH0Q4kRzOXjJVoI2VcOlr6HTxnkYnQGAw2czwojtzBDXDbv3EzXy0BRfOOTS7tlQ+md
	geODGQSqqdYJVRDQ==
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
Subject: [PATCH v6 77/90] x86/cpuid: Parse leaves backing X86_FEATURE words
Date: Fri, 27 Mar 2026 03:16:31 +0100
Message-ID: <20260327021645.555257-78-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add CPUID parser support for:

    CPUID(0x6)
    CPUID(0x7)
    CPUID(0x7).1
    CPUID(0xd).1
    CPUID(0x80000001)
    CPUID(0x8000000a)
    CPUID(0x8000001f)
    CPUID(0x80000021)

where one or more of these leaves output registers back the X86_FEATURE
words at <asm/cpufeatures.h>.

Handle CPUID(0x7).1 via a custom reader.  Its availability depends on the
subleaf count reported by CPUID(0x7).0, so check that first.

Do not use a custom reader for CPUID(0xd).1.  Per the Intel SDM regarding
CPUID(0xd)'s subleaf availability: "sub-leafs 0 and 1 are always valid".

Note, this prepares for later changes that will route X86_FEATURE queries
from cpuinfo_x86::x86_capability[] to the system's CPUID tables.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpuid/types.h |  8 ++++++++
 arch/x86/kernel/cpu/cpuid_parser.c | 13 +++++++++++++
 arch/x86/kernel/cpu/cpuid_parser.h |  8 ++++++++
 3 files changed, 29 insertions(+)

diff --git a/arch/x86/include/asm/cpuid/types.h b/arch/x86/include/asm/cpuid/types.h
index 6180acd35f59..204d6277c8cd 100644
--- a/arch/x86/include/asm/cpuid/types.h
+++ b/arch/x86/include/asm/cpuid/types.h
@@ -212,7 +212,11 @@ struct cpuid_leaves {
 	CPUID_LEAF   (	0x1,		0  );
 	CPUID_LEAF   (  0x2,		0  );
 	CPUID_LEAF_N (  0x4,		8  );
+	CPUID_LEAF   (  0x6,		0  );
+	CPUID_LEAF   (  0x7,		0  );
+	CPUID_LEAF   (  0x7,		1  );
 	CPUID_LEAF   (  0xa,		0  );
+	CPUID_LEAF   (  0xd,		1  );
 	CPUID_LEAF   (  0x1c,		0  );
 	CPUID_LEAF   (	0x16,		0  );
 	CPUID_LEAF   (  0x23,		0  );
@@ -222,6 +226,7 @@ struct cpuid_leaves {
 	CPUID_LEAF   (  0x23,		4  );
 	CPUID_LEAF   (  0x23,		5  );
 	CPUID_LEAF   (  0x80000000,	0  );
+	CPUID_LEAF   (  0x80000001,	0  );
 	CPUID_LEAF   (  0x80000002,	0  );
 	CPUID_LEAF   (  0x80000003,	0  );
 	CPUID_LEAF   (  0x80000004,	0  );
@@ -229,7 +234,10 @@ struct cpuid_leaves {
 	CPUID_LEAF   (  0x80000006,	0  );
 	CPUID_LEAF   (  0x80000007,	0  );
 	CPUID_LEAF   (  0x80000008,	0  );
+	CPUID_LEAF   (  0x8000000a,	0  );
 	CPUID_LEAF_N (  0x8000001d,	8  );
+	CPUID_LEAF   (  0x8000001f,	0  );
+	CPUID_LEAF   (  0x80000021,	0  );
 	CPUID_LEAF   (  0x80000022,	0  );
 	CPUID_LEAF   (  0x80860000,	0  );
 	CPUID_LEAF   (  0x80860001,	0  );
diff --git a/arch/x86/kernel/cpu/cpuid_parser.c b/arch/x86/kernel/cpu/cpuid_parser.c
index de11fb4116f2..b3bf4141db15 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.c
+++ b/arch/x86/kernel/cpu/cpuid_parser.c
@@ -99,6 +99,19 @@ cpuid_read_0x2(const struct cpuid_parse_entry *e, const struct cpuid_read_output
 	output->info->nr_entries = 1;
 }
 
+static void
+cpuid_read_0x7_1(const struct cpuid_parse_entry *e, const struct cpuid_read_output *output)
+{
+	struct leaf_0x7_0 l7;
+
+	cpuid_read_subleaf(0x7, 0, &l7);
+	if (l7.leaf7_n_subleaves == 0)
+		return;
+
+	cpuid_read_subleaf(e->leaf, e->subleaf, output->regs);
+	output->info->nr_entries = 1;
+}
+
 /*
  * Shared read function for Intel CPUID(0x4) and AMD CPUID(0x8000001d), as both have
  * the same subleaf enumeration logic and register output format.
diff --git a/arch/x86/kernel/cpu/cpuid_parser.h b/arch/x86/kernel/cpu/cpuid_parser.h
index c81f76c1c077..f6a620a03312 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.h
+++ b/arch/x86/kernel/cpu/cpuid_parser.h
@@ -146,7 +146,11 @@ struct cpuid_parse_entry {
 	/*			Leaf		Subleaf		Reader function */		\
 	CPUID_PARSE_ENTRY   (	0x2,		0,		0x2			),	\
 	CPUID_PARSE_ENTRY_N (	0x4,				deterministic_cache	),	\
+	CPUID_PARSE_ENTRY   (	0x6,		0,		generic			),	\
+	CPUID_PARSE_ENTRY   (	0x7,		0,		generic			),	\
+	CPUID_PARSE_ENTRY   (	0x7,		1,		0x7_1			),	\
 	CPUID_PARSE_ENTRY   (	0xa,		0,		generic			),	\
+	CPUID_PARSE_ENTRY   (	0xd,		1,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x1c,		0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x16,		0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x23,		0,		generic			),	\
@@ -156,6 +160,7 @@ struct cpuid_parse_entry {
 	CPUID_PARSE_ENTRY   (	0x23,		4,		0x23_4			),	\
 	CPUID_PARSE_ENTRY   (	0x23,		5,		0x23_5			),	\
 	CPUID_PARSE_ENTRY   (	0x80000000,	0,		0x80000000		),	\
+	CPUID_PARSE_ENTRY   (	0x80000001,	0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80000002,	0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80000003,	0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80000004,	0,		generic			),	\
@@ -163,7 +168,10 @@ struct cpuid_parse_entry {
 	CPUID_PARSE_ENTRY   (	0x80000006,	0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80000007,	0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80000008,	0,		generic			),	\
+	CPUID_PARSE_ENTRY   (	0x8000000a,	0,		generic			),	\
 	CPUID_PARSE_ENTRY_N (	0x8000001d,			deterministic_cache	),	\
+	CPUID_PARSE_ENTRY   (	0x8000001f,	0,		generic			),	\
+	CPUID_PARSE_ENTRY   (	0x80000021,	0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80000022,	0,		generic			),	\
 	CPUID_PARSE_ENTRY   (	0x80860000,	0,		0x80860000		),	\
 	CPUID_PARSE_ENTRY   (	0x80860001,	0,		generic			),	\
-- 
2.53.0

