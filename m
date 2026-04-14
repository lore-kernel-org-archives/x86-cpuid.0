Received: from mail-106120.protonmail.ch (mail-106120.protonmail.ch [79.135.106.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3055129D260
	for <x86-cpuid@lists.linux.dev>; Tue, 14 Apr 2026 22:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776204296; cv=none; b=DFE/b1WaSQIPg3pTIdUGiYvMhHxoOfE6M69JMjXylRqxHIRA/Mr8SP6xfAFjp650RuLC+Y/8kVJepb48XK/aYksV+t+voWQ+dCrD9+WrkdtFa0/Oh9Wq/F8hEh+sBEtx1dIPRBBwkMNgniujt+ppHS1wg/qgI2NiSLvQsLLvh5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776204296; c=relaxed/simple;
	bh=+jhZSILiXzXhlUC7LaKkM9LXzrsN159wk0vXieJaYjk=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cinBIylwXx0oyRUuOkCgJqXHEaDPPrnMHegfEY525CcMwpA0DUHPUgyKgmfGANccW5BHTcLRQTbcMzbuNr77OgB7+N/NnoMw35u1dsHt7jG5lWmM2oI+wEgQ98WN4iPmHo3QQzgXWye5wYPr9DSWTAAs3eovt8jn6hVEQMC0XRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=d+BNqP0v; arc=none smtp.client-ip=79.135.106.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="d+BNqP0v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776204284; x=1776463484;
	bh=8Swta6GPnGG27iFLHR2XIwWkZL9sLutYpHOIqZ17KUw=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=d+BNqP0v+N/li0AiA8MJ9ZDs4tANaH7x2j2Yos07P8CbXigMT8P+WeFvQm3W3bxVn
	 ZvlrbdwQFpAxqTcSj5e2PmEhTQ7Vyapli6FrIReZarN79/yRlxOu35FXxX/YdZlsUc
	 OWBmdgV5oecrM6RInffhexn2iXLEPSas1gn1SY5IKRyTzTZOpUOAjTDeiOeFN7qTaS
	 A6jyOOnvgaqH0iUsZPTOCMwbxI5HFmgY6slIAoFhGH9EWbAyUshZJRLcS0EZpOF7SX
	 az5M/p0i1APK/Mkrh76NUfJzJiqSqUMBtlrWcXLzW55jIpMSKUD8K+4gDjbPyY7kuU
	 Ac6wuL6Sc926Q==
Date: Tue, 14 Apr 2026 22:04:37 +0000
To: "Ahmed S. Darwish" <darwi@linutronix.de>
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Cooper <andrew.cooper3@citrix.com>, "H. Peter Anvin" <hpa@zytor.com>, Sean Christopherson <seanjc@google.com>, David Woodhouse <dwmw2@infradead.org>, Peter Zijlstra <peterz@infradead.org>, Christian Ludloff <ludloff@gmail.com>, Sohil Mehta <sohil.mehta@intel.com>, John Ogness <john.ogness@linutronix.de>, x86@kernel.org, x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 09/90] x86/cpuid: Introduce a centralized CPUID parser
Message-ID: <ad61pfigERDnC712@wieczorr-mobl1.localdomain>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: e9b801651977aeb92a1bf64f3763ea9b5635c75e
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 2026-03-27 at 03:15:23 +0100, Ahmed S. Darwish wrote:
>Introduce a CPUID parser for populating the system's CPUID tables.
>
>Since accessing a leaf within the CPUID table requires compile time
>tokenization, split the parser into two stages:
>
>  (a) Compile-time macros for tokenizing the leaf/subleaf offsets within
>      the CPUID table.
>
>  (b) Generic runtime code to fill the CPUID data, using a parsing table
>      which collects these compile-time offsets.
>
>For actual CPUID output parsing, support both generic and leaf-specific
>read functions.
>
>To ensure CPUID data early availability, invoke the parser during early
>boot, early Xen boot, and at early secondary CPUs bring up.
>
>Provide call site APIs to refresh a single leaf, or a leaf range, within
>the CPUID tables.  This is for sites issuing MSR writes that partially
>changes the CPU's CPUID layout.  Doing full CPUID table rescans in such

changes -> change?

>cases will be destructive since the CPUID tables will host all of the
>kernel's X86_FEATURE flags at a later stage.

Also should cpuid_parser.c/.h be attached to some subsystem in MAINTAINERS?=
 Not
sure if it should or shouldn't but I noticed you added leaf_types.h before =
and
was curious if not adding new files is intentional here.

>diff --git a/arch/x86/kernel/cpu/cpuid_parser.c b/arch/x86/kernel/cpu/cpui=
d_parser.c
>new file mode 100644
>index 000000000000..898b0c441431
>+
>+static unsigned int cpuid_range_max_leaf(const struct cpuid_table *t, uns=
igned int range)
>+{
>+=09const struct leaf_0x0_0 *l0 =3D __cpuid_table_subleaf(t, 0x0, 0);
>+
>+=09switch (range) {
>+=09case CPUID_BASE_START:=09return l0  ?  l0->max_std_leaf : 0;
>+=09default:=09=09return 0;
>+=09}
>+}

Trailing statements should go on the next line, right?

--=20
Kind regards
Maciej Wiecz=C3=B3r-Retman

