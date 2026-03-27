Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A152347FDF
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 03:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774580754; cv=none; b=eiCwjwFKbwPXTYXxROf/BoAMU00DGf/Zzq/p0et10GlwfTYAuhbXAiGJ5JQySCMbZ8Jv/wO0T/RTaTA5RsOpiz24z/n7LHxrKL1wLJv8IOKNfaimbJvMjurpcWCTujnfblzJLJ9byvnG3PetvZLK8sxxb9jBdqDC1uxHezta5fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774580754; c=relaxed/simple;
	bh=1tnxdXpMi1S5/+66dwL7MnH9uofYW/fF2PlOqgMX4q8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fli9CcIvwqFkRiDHq+YoapGO6WF2aeCMsTeCbWL6pyJs7NtwOgwBOEW9zT81AvNqqdxM3vf1+EVD2Zt3iZcQNYIsGpGq7u1191NAoj48Xd5UZgUmuAV6TQXP9qIZYdiX6xnT64De0qFAFioqLCD9k26q+UCPa/1bZkIWxFz64+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cvymaYow; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=+hCJtgZt; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cvymaYow";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="+hCJtgZt"
Date: Fri, 27 Mar 2026 04:05:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774580751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=qnZB5smBrh9LBmRAPa3eES7xJrkoaSDuJEFmbxegSTk=;
	b=cvymaYowFro+cgh9RL71/bMp4DsApmUMMA9aBKtZ0YQXYRoTidSB7BVQ67MzBs9yBlFumn
	Ix9dAYixiOHdf9mt9IHKTmByuDE+KvWBm8qaCJI4249UU8n4upwu5F2fQX5ta0Bn1v42b/
	WobLGte9RNOKgxvxNChVzPqe4xhmzEL2OIzt1ccNCHY7FzkPMyks6OOOp7WjcbO9k2j7hr
	zXak792K1KXM6bzYVX+8Aef8UducsjyudGhqbR7KAtx7RGfc/axOF9NM0Lm3Oh4WDkhV+W
	NhFrt6Zu0pLe+lG7ZSujUa7aWb6PPkYmO3C3it4FO2Nvh6e0vuVkj10lTlj1GQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774580751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=qnZB5smBrh9LBmRAPa3eES7xJrkoaSDuJEFmbxegSTk=;
	b=+hCJtgZt9Hh5sbzmU4x2jLW7XX8nF8P0ZGzasrDOMfVNcPSZSDun1Lqf1kURGYlzcNWF1F
	tGNR6ypsuV18NrCQ==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
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
	Maciej Wieczor-Retman <m.wieczorretman@pm.me>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: [ANNOUNCE] x86-cpuid-db: Release v3.0
Message-ID: <acX0Drk_6qD97nbq@lx-t490>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I'm happy to announce release 3.0 of the x86-cpuid-db project:

   https://gitlab.com/x86-cpuid.org/x86-cpuid-db
   https://gitlab.com/x86-cpuid.org/x86-cpuid-db/-/releases/v3.0

Changelog v3.0
--------------

Introduce the Linux-defined synthetic CPUID leaves 0x4c780001 and
0x4c780002.  The range ID prefix 0x4c78 is for Linux in its shorthand ASCII
form "Lx", where Linux becomes a virtual vendor akin to hardware vendors
like AMD or Intel.

In these leaves, provide a 1:1 bitfield mapping for what Linux defines in
its synthetic X86_FEATURE words at <asm/cpufeatures.h>.  Designate leaf
0x4c780001 for feature words in a linear order; i.e., subleaf 0 registers
EAX to EDX, then subleaf 1 registers, and so on.  Similarly, designate leaf
0x4c780001 for the X86_BUG words.

Here is the synthetic leaves bitfield listing:

   https://gitlab.com/x86-cpuid.org/x86-cpuid-db/-/blob/v3.0/db/xml/leaf_4c780001.xml
   https://gitlab.com/x86-cpuid.org/x86-cpuid-db/-/blob/v3.0/db/xml/leaf_4c780002.xml

With that, the Linux kernel x86 feature query code can have zero special
cases.  The synthetic CPUID leaves and X86_FEATURE words are collected,
parsed, modified, and queried just like their hardware-backed counterparts.

Update the CPUID database:

 - Leaf 0x23: Introduce subleaf 2, Auto Counter Reload (ACR)
 - Leaf 0x23: Introduce subleaf 4/5, PEBS capabilities and counters
 - Leaf 0x1c: Return LBR depth as a bitmask instead of individual bits
 - Leaf 0x0a: Define more descriptive PMU bitfield names

Thanks to Dave Hansen (Intel), also add the bits:

 - Leaf 0x0a: Various missing PMU events
 - Leaf 0x06: Missing IA32_HWP_CTL flag
 - Leaf 0x0f: Missing non-CPU (IO) Intel RDT bits

Release coverage
----------------

   CPUID leaves:        64 leaves
   CPUID bitfields:     1104 entries
   Linux feature flags: 465 entries
   Xen feature flags:   198 entries

Artifacts
---------

The generated CSV and C header files can be quickly checked in full from
the release artifacts at:

   https://gitlab.com/x86-cpuid.org/x86-cpuid-db/-/releases/v3.0

Thanks!
Ahmed
