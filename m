Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F50F43C06A
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982980; cv=none; b=CH+ggixuSvoe+YamkfUkj1feDpdXubMdNq1F6ONscmuxUYGLInoEe+0g0tMWwsV4JvkrLtd/bw+SumKgB2tbv/U+BfEUQuUZqLppjEPwN86Sy+l9SbdIrlc0sJKlvRCz388D+D7+1M+ct7Ayg2AYc0l+D96lfNm5G7LD457uXFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982980; c=relaxed/simple;
	bh=3Hk8qjTpkD/7lz2aOCXBHOQmkw6L0XKu4Gx5z0ZyY/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D0LjYbHJo9nLOJsUBkOhWRFIHs4Hv+Jc0nsbW3JircvW9EH8jfxbd1VG5f8RhaR6S51kpEiKvJPpW7qWRp4paBkORcxdjEyZCn8diqcAWlHJ+xxg/Cg5Z1CJd0HBz2LtlwrBDwO1seA1xKcmSuTnw7nPqEm2wfyayp9BcvCyN+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jhHafDgT; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=M8CwjRTz; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jhHafDgT";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="M8CwjRTz"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pHOcoIQB4PK6V6qk2S6ufDKHEJiNbyx4GdwjToAzx30=;
	b=jhHafDgTH5tYXwWESEb+aGL+sHQ34qXc+jmj+LmW2Wgy1QE+zQ/wXSzWW8OqzFaUOPNUir
	b4WuzR33RVfIV8cEBRt4KKUydPXlWTRcvkbGxL3nZ1ARhXeTtpiU38RqnusunOfpwEczap
	vE2ng2k41MMuN7b5PBUo45OGBE2TmsAtJFPjBosQv90zkXBR+V/AHrXPJZF5E2wmPnXpUb
	BgrNWGxIVsDaTcsFLI16maFciSfpl6bR7tlpFX6L9kEHywMmeIlSNz82p4D6qKuZVVFyXm
	JEelxGmrj8hQE/khcWZl2GGntvOpHjjAC8lrRITGTkl1XHBavB3LaHpD8DIcOQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pHOcoIQB4PK6V6qk2S6ufDKHEJiNbyx4GdwjToAzx30=;
	b=M8CwjRTzhAEpVpDlrHDNjLfEhmavEN+ew3rdT+T8mf7vlsqMH4z+W3eCOqK0J8ZiDyG2la
	DFn8xb1bkRHQ49Ag==
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
Subject: [PATCH v7 056/120] agp/efficeon: Use parsed CPUID(0x1)
Date: Thu, 28 May 2026 17:38:18 +0200
Message-ID: <20260528153923.403473-57-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use parsed CPUID(0x1) instead of manual bitwise operations and a direct
CPUID query.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 drivers/char/agp/efficeon-agp.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/char/agp/efficeon-agp.c b/drivers/char/agp/efficeon-agp.c
index 4d0b7d7c0aad..41c7dac096ab 100644
--- a/drivers/char/agp/efficeon-agp.c
+++ b/drivers/char/agp/efficeon-agp.c
@@ -192,21 +192,24 @@ static int efficeon_free_gatt_table(struct agp_bridge_data *bridge)
 
 static int efficeon_create_gatt_table(struct agp_bridge_data *bridge)
 {
-	int index;
-	const int pati    = EFFICEON_PATI;
+	const struct leaf_0x1_0 *l = cpuid_leaf(&boot_cpu_data, 0x1);
+	int num_entries, l1_pages, clflush_chunk;
 	const int present = EFFICEON_PRESENT;
-	const int clflush_chunk = ((cpuid_ebx(1) >> 8) & 0xff) << 3;
-	int num_entries, l1_pages;
+	const int pati    = EFFICEON_PATI;
 
 	num_entries = A_SIZE_LVL2(agp_bridge->current_size)->num_entries;
 
 	printk(KERN_DEBUG PFX "efficeon_create_gatt_table(%d)\n", num_entries);
 
+	if (!l)
+		return -EIO;
+
 	/* There are 2^10 PTE pages per PDE page */
 	BUG_ON(num_entries & 0x3ff);
 	l1_pages = num_entries >> 10;
 
-	for (index = 0 ; index < l1_pages ; index++) {
+	clflush_chunk = l->clflush_size * 8;
+	for (int index = 0; index < l1_pages; index++) {
 		int offset;
 		unsigned long page;
 		unsigned long value;
@@ -236,13 +239,19 @@ static int efficeon_create_gatt_table(struct agp_bridge_data *bridge)
 
 static int efficeon_insert_memory(struct agp_memory * mem, off_t pg_start, int type)
 {
-	int i, count = mem->page_count, num_entries;
+	const struct leaf_0x1_0 *l1 = cpuid_leaf(&boot_cpu_data, 0x1);
+	int count = mem->page_count, num_entries, clflush_chunk;
 	unsigned int *page, *last_page;
-	const int clflush_chunk = ((cpuid_ebx(1) >> 8) & 0xff) << 3;
-	const unsigned long clflush_mask = ~(clflush_chunk-1);
+	unsigned long clflush_mask;
 
 	printk(KERN_DEBUG PFX "efficeon_insert_memory(%lx, %d)\n", pg_start, count);
 
+	if (!l1)
+		return -EIO;
+
+	clflush_chunk = l1->clflush_size * 8;
+	clflush_mask = ~(clflush_chunk - 1);
+
 	num_entries = A_SIZE_LVL2(agp_bridge->current_size)->num_entries;
 	if ((pg_start + mem->page_count) > num_entries)
 		return -EINVAL;
@@ -255,7 +264,7 @@ static int efficeon_insert_memory(struct agp_memory * mem, off_t pg_start, int t
 	}
 
 	last_page = NULL;
-	for (i = 0; i < count; i++) {
+	for (int i = 0; i < count; i++) {
 		int index = pg_start + i;
 		unsigned long insert = efficeon_mask_memory(mem->pages[i]);
 
-- 
2.54.0

