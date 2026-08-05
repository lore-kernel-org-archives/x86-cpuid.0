Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA83A32B102
	for <x86-cpuid@lists.linux.dev>; Wed,  5 Aug 2026 02:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785898438; cv=none; b=FFLDliXbaX0Nq91gEWwvzCC7DpDrHHvNQNWgXNxuTuJ4wP+UfuQhDiIVmA7egMnmwEStrcoXxUXkEuFV9evpv4e1b/gDFw6RXu6GsrwC7q0uw6VtjhXRWncrXqbbXCGARcOMg2KJMFhHaSF7pSUNHyUCeLkaXkNSfbdcKt6m4nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785898438; c=relaxed/simple;
	bh=nhGRRvAggQHTbpBHRFYC2iQep9jYWVI4uq+xdND0JDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qz4LEAv1FXTDsVHFfkG23J/djMChLDAUYnbAI3IPfaUE6HL9gK6Mjd9gTasAzqbii7g6OJI/zQZJiCVIVdgkqBRIHt9tU9syLaa/1KdoEEW61tgz1gkqZHqGx3bqNPDtYLeBkuBupQQYKATCXxFgkJgkW3C+GWWAJKzuSngaQFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=MlW8S+2o; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="MlW8S+2o"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 8780840E014A;
	Wed,  5 Aug 2026 02:53:52 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id lfqVTjMK4wn3; Wed,  5 Aug 2026 02:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1785898420; bh=CkTQtl8zkYCHk8Zv5QMkPTY2Fk2U0JREkW7J8Fstuik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MlW8S+2oIDTmQI18uR5eEgV0XFLSpV6ljihEAKvX3hYPuvST61NNHTZEKW0kR8VJE
	 KMN5qks28wLpFXYGcMQylJzumWdIvH2x76j2iyakovz15VsqkDPhvujf8TK37X01jn
	 a0uVR4KZpH90APREUrUXsR0J5DLxwPkbW/REJLBAep51Xm2jLGQpOlSNONwZRvJBWh
	 BQrUpOPeCGMdYseswUf2ZRsDoVjBY1PLdxVgfqMuM5lRWjwj1nv+3kPGg7SLMPeVo2
	 ssmQ7j8cvIwQC6ZklQAUMTf3Fa/ChaRcn0i4WoZ1PTao4bVfvwcqrEdqrUROJhvwvb
	 Acd5kq/oggv1bmQLh2P00/Fujp/fHKRWFdnpqA82EHf4Jr0zoRAzjkICVTUQWgh39N
	 3tQ8kt1fMBfU3UWp/IkS5DDqxvbEHrEow3iOtHif94sOsbBZz4HHhjXQkDYC/EjaSm
	 y8yAZv+CSzdEeLTr1zqmnp/f8+D5C7EMcrM/MyJws9xg368I7RGAo0r38WX4UvYVHC
	 /qvsYSQvtnEcln1LF7Du1tiin3FGcqXhm5TZBIrQ+VHOy2o5ZkPrCzIx+eJ936FfrE
	 397Kblw4qbcVaGACOMthnCDsFuEUJ2pz2Kf4McGYufx/7vsKvRLJUo17E18aotgw4D
	 mZL/KLNuYFW0u4AZgKpcaQ70=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 1127A40E0031;
	Wed,  5 Aug 2026 02:53:26 +0000 (UTC)
Date: Tue, 4 Aug 2026 19:53:23 -0700
From: Borislav Petkov <bp@alien8.de>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Christian Ludloff <ludloff@gmail.com>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 012/120] x86/cpuid: Parse CPUID(0x80000000)
Message-ID: <20260805025323.GCanKlox0DF7Gwhpf1@fat_crate.local>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-13-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260528153923.403473-13-darwi@linutronix.de>

On Thu, May 28, 2026 at 05:37:34PM +0200, Ahmed S. Darwish wrote:
> Add CPUID parser logic for CPUID(0x80000000).
> 
> Verify the CPUID output since legacy Intel machines without an extended
> range will repeat the highest standard CPUID leaf output instead.
> 
> This verification is similar to what is done at arch/x86/kernel/head_32.S
> and arch/x86/kernel/cpu/common.c.
> 
> References: 8a50e5135af0 ("x86-32: Use symbolic constants, safer CPUID when enabling EFER.NX")
> References: 67ad24e6d39c ("- pre5:    - Rasmus Andersen: add proper...")  # Historical git
> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Link: https://lore.kernel.org/r/d4fcfd91-cc92-4b3c-9dd2-56ecd754cecc@citrix.com
> ---
>  arch/x86/include/asm/cpuid/types.h |  4 ++++
>  arch/x86/kernel/cpu/cpuid_parser.c | 21 +++++++++++++++++++++
>  arch/x86/kernel/cpu/cpuid_parser.h |  1 +
>  3 files changed, 26 insertions(+)

Before we continue with this, I wanna a bit of a cleanup to the parser:

struct cpuid_read_output was a bit too much. And also those linebreaks should
be like I did them - this is how we usually do them.

Thx.

---
From: "Borislav Petkov (AMD)" <bp@alien8.de>
Date: Tue, 4 Aug 2026 18:53:41 -0700
Subject: [PATCH] x86/CPU: Rename struct cpuid_read_output to struct
 cpuid_output

There's no CPUID "write" operation so there's no need to have
a cpuid_read_output thing - cpuid_output is perfectly clear. And
shortens the code just fine.

Remove the funky function signature line breaks while at it.

No functional changes.

Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
---
 arch/x86/kernel/cpu/cpuid_parser.c | 42 ++++++++++++++----------------
 arch/x86/kernel/cpu/cpuid_parser.h | 20 +++++++-------
 2 files changed, 29 insertions(+), 33 deletions(-)

diff --git a/arch/x86/kernel/cpu/cpuid_parser.c b/arch/x86/kernel/cpu/cpuid_parser.c
index 898b0c441431..dcf8fffbfb88 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.c
+++ b/arch/x86/kernel/cpu/cpuid_parser.c
@@ -11,14 +11,14 @@
 #include "cpuid_parser.h"
 
 /* Clear a single CPUID table entry */
-static void cpuid_clear(const struct cpuid_parse_entry *e, const struct cpuid_read_output *output)
+static void cpuid_clear(const struct cpuid_parse_entry *e, const struct cpuid_output *out)
 {
-	struct cpuid_regs *regs = output->regs;
+	struct cpuid_regs *regs = out->regs;
 
 	for (int i = 0; i < e->maxcnt; i++, regs++)
 		memset(regs, 0, sizeof(*regs));
 
-	memset(output->info, 0, sizeof(*output->info));
+	memset(out->info, 0, sizeof(*out->info));
 }
 
 /*
@@ -29,12 +29,11 @@ static void cpuid_clear(const struct cpuid_parse_entry *e, const struct cpuid_re
  * Default CPUID read function
  * Satisfies the requirements stated at 'struct cpuid_parse_entry'->read().
  */
-static void
-cpuid_read_generic(const struct cpuid_parse_entry *e, const struct cpuid_read_output *output)
+static void cpuid_read_generic(const struct cpuid_parse_entry *e, const struct cpuid_output *out)
 {
-	struct cpuid_regs *regs = output->regs;
+	struct cpuid_regs *regs = out->regs;
 
-	for (int i = 0; i < e->maxcnt; i++, regs++, output->info->nr_entries++)
+	for (int i = 0; i < e->maxcnt; i++, regs++, out->info->nr_entries++)
 		cpuid_read_subleaf(e->leaf, e->subleaf + i, regs);
 }
 
@@ -60,15 +59,14 @@ static unsigned int cpuid_range_max_leaf(const struct cpuid_table *t, unsigned i
 	}
 }
 
-static void
-__cpuid_reset_table(struct cpuid_table *t, const struct cpuid_parse_entry entries[],
-		    unsigned int nr_entries, unsigned int start, unsigned int end, bool fill)
+static void __cpuid_reset_table(struct cpuid_table *t, const struct cpuid_parse_entry entries[],
+				unsigned int nr_entries, unsigned int start, unsigned int end, bool fill)
 {
 	const struct cpuid_parse_entry *entry = entries;
 	unsigned int range = CPUID_RANGE(start);
 
 	for (unsigned int i = 0; i < nr_entries; i++, entry++) {
-		struct cpuid_read_output output = {
+		struct cpuid_output out = {
 			.regs = cpuid_table_regs_p(t, entry->regs_offs),
 			.info = cpuid_table_info_p(t, entry->info_offs),
 		};
@@ -76,14 +74,14 @@ __cpuid_reset_table(struct cpuid_table *t, const struct cpuid_parse_entry entrie
 		if (entry->leaf < start || entry->leaf > end)
 			continue;
 
-		cpuid_clear(entry, &output);
+		cpuid_clear(entry, &out);
 
 		/*
 		 * Read the range's anchor leaf unconditionally so that the cached
 		 * maximum valid leaf value is available for the remaining entries.
 		 */
 		if (fill && (entry->leaf == range || entry->leaf <= cpuid_range_max_leaf(t, range)))
-			entry->read(entry, &output);
+			entry->read(entry, &out);
 	}
 }
 
@@ -91,22 +89,20 @@ __cpuid_reset_table(struct cpuid_table *t, const struct cpuid_parse_entry entrie
  * Zero all cached CPUID entries within [@start-@end] range.  This is needed when
  * certain operations like MSR writes induce changes to the CPU's CPUID layout.
  */
-static void
-__cpuid_zero_table(struct cpuid_table *t, const struct cpuid_parse_entry entries[],
-		   unsigned int nr_entries, unsigned int start, unsigned int end)
+static void __cpuid_zero_table(struct cpuid_table *t, const struct cpuid_parse_entry entries[],
+			       unsigned int nr_entries, unsigned int start, unsigned int end)
 {
 	__cpuid_reset_table(t, entries, nr_entries, start, end, false);
 }
 
-static void
-__cpuid_fill_table(struct cpuid_table *t, const struct cpuid_parse_entry entries[],
-		   unsigned int nr_entries, unsigned int start, unsigned int end)
+static void __cpuid_fill_table(struct cpuid_table *t, const struct cpuid_parse_entry entries[],
+			       unsigned int nr_entries, unsigned int start, unsigned int end)
 {
 	__cpuid_reset_table(t, entries, nr_entries, start, end, true);
 }
 
-static void
-cpuid_fill_table(struct cpuid_table *t, const struct cpuid_parse_entry entries[], unsigned int nr_entries)
+static void cpuid_fill_table(struct cpuid_table *t, const struct cpuid_parse_entry entries[],
+			     unsigned int nr_entries)
 {
 	static const struct {
 		unsigned int start;
@@ -127,8 +123,8 @@ static void __cpuid_scan_cpu_full(struct cpuinfo_x86 *c)
 	cpuid_fill_table(table, cpuid_parse_entries, nr_entries);
 }
 
-static void
-__cpuid_scan_cpu_partial(struct cpuinfo_x86 *c, unsigned int start_leaf, unsigned int end_leaf)
+static void __cpuid_scan_cpu_partial(struct cpuinfo_x86 *c, unsigned int start_leaf,
+				     unsigned int end_leaf)
 {
 	unsigned int nr_entries = ARRAY_SIZE(cpuid_parse_entries);
 	struct cpuid_table *table = &c->cpuid;
diff --git a/arch/x86/kernel/cpu/cpuid_parser.h b/arch/x86/kernel/cpu/cpuid_parser.h
index df627306cc8c..3d8337323958 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.h
+++ b/arch/x86/kernel/cpu/cpuid_parser.h
@@ -35,21 +35,21 @@
  * Translation of compile time offsets to generic runtime pointers:
  */
 
-static inline struct cpuid_regs *
-cpuid_table_regs_p(const struct cpuid_table *t, unsigned long regs_offset)
+static inline struct cpuid_regs *cpuid_table_regs_p(const struct cpuid_table *t,
+						    unsigned long regs_offset)
 {
 	return (struct cpuid_regs *)((unsigned long)(&t->leaves) + regs_offset);
 }
 
-static inline struct leaf_parse_info *
-cpuid_table_info_p(const struct cpuid_table *t, unsigned long info_offset)
+static inline struct leaf_parse_info *cpuid_table_info_p(const struct cpuid_table *t,
+							 unsigned long info_offset)
 {
 	return (struct leaf_parse_info *)((unsigned long)(&t->leaves) + info_offset);
 }
 
 /**
- * struct cpuid_read_output - Output of a CPUID read operation
- * @regs:	Pointer to an array of CPUID outputs, where each array element covers the
+ * struct cpuid_output - Output of a CPUID operation
+ * @regs:	Pointer to an array of CPUID results, where each array element covers the
  *		full EAX->EDX output range.
  * @info:	Pointer to query info; for saving the number of filled elements at @regs.
  *
@@ -59,7 +59,7 @@ cpuid_table_info_p(const struct cpuid_table *t, unsigned long info_offset)
  *
  * See struct cpuid_parse_entry.read().
  */
-struct cpuid_read_output {
+struct cpuid_output {
 	struct cpuid_regs	*regs;
 	struct leaf_parse_info	*info;
 };
@@ -74,8 +74,8 @@ struct cpuid_read_output {
  *		passed to cpuid_table_info_p().
  * @maxcnt:	Maximum number of output storage entries available for the CPUID query.
  * @read:	Read function for this entry.  It must save the parsed CPUID output to the passed
- *		'struct cpuid_read_output'->regs array of size >= @maxcnt.  It must set
- *		'struct cpuid_read_output'->info.nr_entries to the number of CPUID output entries
+ *		'struct cpuid_output'->regs array of size >= @maxcnt.  It must set
+ *		'struct cpuid_output'->info.nr_entries to the number of CPUID output entries
  *		parsed and filled.  A generic implementation is provided at cpuid_read_generic().
  */
 struct cpuid_parse_entry {
@@ -84,7 +84,7 @@ struct cpuid_parse_entry {
 	unsigned int	regs_offs;
 	unsigned int	info_offs;
 	unsigned int	maxcnt;
-	void		(*read)(const struct cpuid_parse_entry *e, const struct cpuid_read_output *o);
+	void		(*read)(const struct cpuid_parse_entry *e, const struct cpuid_output *o);
 };
 
 #define __CPUID_PARSE_ENTRY(_leaf, _subleaf, _suffix, _reader_fn)		\
-- 
2.53.0

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
