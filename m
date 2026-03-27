Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A7A7081E
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774577843; cv=none; b=nxvYDUYVIl+j9NKpDV6prM93XAt7pW3vHbXetdQmXZsPGEYL4S5ZCDMOf+mwyuy/4S+Ak6U0hWsMoy59wAMbLoxHZMJQsc15aDxqZWye3hVBbHKi5yWt3J0k9UhbsWEmdp5NAZkpRddfT3UMHRMZ++plgaTPo+B+jw+vJiCi1A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774577843; c=relaxed/simple;
	bh=j8L2d94s4qo6CLFJ0Pw+g2dX6xTZBDDYNgXzSTunj9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LwQam3SPyrE+bIQ/yNnD2ImNvNSbWOPbnsIzr1B2etZX3uVWapwEjN44ZtR2vU7jAg0pl/qhj1GfbzrvBz7616pjxtJBdcHe1x+n+6uWY+0LE+hzfapUbmmydsWii5H3HDITqMdBsMowcJ/zArP24mE5mU11IYACUyp518mdElg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hxjDF0QJ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=5Jj2//pY; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hxjDF0QJ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="5Jj2//pY"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774577835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lwFrc7kQEUXDzJTFpyBqLk9SXeymwJpEkB5M9QvOU0M=;
	b=hxjDF0QJf6kGiv7HYIg5Mnov/bdYwE4tBcO4MiuAJkfMpC6dZKN6N/OBOBOLzXQdDwOufO
	yDUwhgy8Cj/1jD2ZZw03LkJR0hLDYBi/Zva+kXpn8oea6aVpmgdzbKUZILgkMvYkO/FRUy
	L88v14kkyiU29x2sWxxokxO19oxEFm/WM9LExWWtT3dqVSWMmMjR3Q+10P2tSOT9bWAI8t
	cwBEV/9EeKhzqhMKkHvLXMaidLS0HZF31NPWih53+wr7RLp+I6JQuFRzSA7SYsthsF7wSf
	4cftZXw3FiE4l1hBuLSlg7qG8/sjh1RjTKZX3Ce/QPm0l+Fv/cL5B2ELfkRrQA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774577835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lwFrc7kQEUXDzJTFpyBqLk9SXeymwJpEkB5M9QvOU0M=;
	b=5Jj2//pYMJA/DNeUkK1SRepQI7EyaK1dZhbC9kJqyKUgIPsNRtGSCpl7lqQBIcqKqp8Tf/
	ZdJDKMc/xWa2/+AQ==
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
Subject: [PATCH v6 00/90] x86: Introduce a centralized CPUID data model
Date: Fri, 27 Mar 2026 03:15:14 +0100
Message-ID: <20260327021645.555257-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Introduce a centralized x86 CPUID model, tables, and API.

Rationale for this work can be found at:

    https://lore.kernel.org/lkml/874ixernra.ffs@tglx
    https://gitlab.com/x86-cpuid.org/x86-cpuid-db

By the end of this series, route all X86_FEATURE queries to the CPUID
tables and fully remove x86_capability[].

The introduced tables and APIs then become a "single source of truth" for
all x86 feature state, both the hardware-backed and the Linux-synthetic.

The series is divided as follows:

# Generic updates and fixes

     1  ASoC: Intel: avs: Check maximum valid CPUID leaf
     2  ASoC: Intel: avs: Include CPUID header at file scope
     3  tools/x86/kcpuid: Update bitfields to x86-cpuid-db v3.0

# Header disentanglement (<asm/processor.h> <=> <asm/cpuid/api.h>)

     4  treewide: Explicitly include the x86 CPUID headers
     5  x86/cpu: <asm/processor.h>: Do not include the CPUID API header
     6  x86/cpuid: Rename cpuid_leaf()/cpuid_subleaf() APIs
     7  x86/cpuid: Introduce <asm/cpuid/leaf_types.h>

# CPUID Model (v6)

     8  x86: Introduce a centralized CPUID data model
     9  x86/cpuid: Introduce a centralized CPUID parser
    10  x86/cpu: Rescan CPUID table after disabling PSN
    11  x86/cpu: centaur/zhaoxin: Rescan CPUID(0xc0000001) after MSR writes
    12  x86/cpu/transmeta: Rescan CPUID(0x1) after capability unhide
    13  x86/cpu/intel: Rescan CPUID table after leaf unlock

# CPUID(0x0), CPUID(0x1), CPUID(0x80000000), CPUID(0x8000000[234])

    14  x86/cpu: Use parsed CPUID(0x0)
    15  x86/lib: Add CPUID(0x1) family and model calculation
    16  x86/cpu: Use parsed CPUID(0x1)
    17  x86/cpuid: Parse CPUID(0x80000000)
    18  x86/cpu: Use parsed CPUID(0x80000000)
    19  x86/cpuid: Parse CPUID(0x80000002) to CPUID(0x80000004)
    20  x86/cpu: Use parsed CPUID(0x80000002) to CPUID(0x80000004)

# CPUID Model: x86 vendor discernment + debugfs support

    21  x86/cpuid: Split parser tables and add vendor-qualified parsing
    22  x86/cpuid: Introduce a parser debugfs interface

# CPUID(0x16), Transmeta CPUID(0x8086000[0123456]), Centaur CPUID(0xc000000[01])

    23  x86/cpuid: Parse CPUID(0x16)
    24  x86/tsc: Use parsed CPUID(0x16)
    25  x86/cpuid: Parse Transmeta and Centaur extended ranges
    26  x86/cpu: transmeta: Use parsed CPUID(0x80860000)->CPUID(0x80860006)
    27  x86/cpu: transmeta: Refactor CPU information printing
    28  x86/cpu: centaur: Use parsed CPUID(0xc0000001)
    29  x86/cpu: zhaoxin: Use parsed CPUID(0xc0000001)

# Intel cache descriptors; CPUID(0x2)

    30  x86/cpuid: Parse CPUID(0x2)
    31  x86/cpuid: Warn once on invalid CPUID(0x2) iteration count
    32  x86/cpuid: Introduce parsed CPUID(0x2) API
    33  x86/cpu: Use parsed CPUID(0x2)
    34  x86/cacheinfo: Use parsed CPUID(0x2)
    35  x86/cpuid: Remove direct CPUID(0x2) query helpers

# Intel/AMD deterministic cache; CPUID(0x4), CPUID(0x8000001d)

    36  x86/cpuid: Parse deterministic cache parameters CPUID leaves
    37  x86/cacheinfo: Pass a 'struct cpuinfo_x86' refrence to CPUID(0x4) code
    38  x86/cacheinfo: Use parsed CPUID(0x4)
    39  x86/cacheinfo: Use parsed CPUID(0x8000001d)

# Cache/TLB/mm info; CPUID(0x8000000[568])

    40  x86/cpuid: Parse CPUID(0x80000005), CPUID(0x80000006), CPUID(0x80000008)
    41  x86/cacheinfo: Use auto-generated data types
    42  x86/cacheinfo: Use parsed CPUID(0x80000005) and CPUID(0x80000006)
    43  x86/cacheinfo: Use parsed CPUID(0x80000006)
    44  x86/cpu: Use parsed CPUID(0x80000005) and CPUID(0x80000006)
    45  x86/cpu/amd: Use parsed CPUID(0x80000005)
    46  x86/cpu/amd: Refactor TLB detection code
    47  x86/cpu/amd: Use parsed CPUID(CPUID(0x80000005) and CPUID(0x80000006)
    48  x86/cpu/hygon: Use parsed CPUID(0x80000005) and CPUID(0x80000006)
    49  x86/cpu/centaur: Use parsed CPUID(0x80000005)
    50  x86/cpu: Use parsed CPUID(0x80000008)

# PerfMon; CPUID(0xa), CPUID(0x1c), CPUID(0x23), CPUID(0x80000022)

    51  x86/cpuid: Parse CPUID(0xa) and CPUID(0x1c)
    52  x86/cpu/intel: Use parsed CPUID(0xa)
    53  x86/cpu/centaur: Use parsed CPUID(0xa)
    54  x86/cpu/zhaoxin: Use parsed CPUID(0xa)
    55  perf/x86/intel: Use parsed CPUID(0xa)
    56  perf/x86/zhaoxin: Use parsed CPUID(0xa)
    57  x86/xen: Use parsed CPUID(0xa)
    58  KVM: x86: Use standard CPUID(0xa) types
    59  KVM: x86/pmu: Use standard CPUID(0xa) types
    60  perf/x86: Remove custom CPUID(0xa) types
    61  perf/x86/lbr: Use parsed CPUID(0x1c)
    62  perf/x86/lbr: Remove custom CPUID(0x1c) types
    63  x86/cpuid: Parse CPUID(0x23)
    64  perf/x86/intel: Use parsed per-CPU CPUID(0x23)
    65  perf/x86/intel: Remove custom CPUID(0x23) types
    66  x86/cpuid: Parse CPUID(0x80000022)
    67  perf/x86/amd/lbr: Use parsed CPUID(0x80000022)
    68  perf/x86/amd: Use parsed CPUID(0x80000022)
    69  KVM: x86: Use standard CPUID(0x80000022) types
    70  perf/x86: Remove custom CPUID(0x80000022) types

# Power management flags; CPUID(0x80000007).EBX

    71  x86/cpuid: Parse CPUID(0x80000007)
    72  x86/cpu: Use parsed CPUID(0x80000007)
    73  x86/cpu: amd/hygon: Use parsed CPUID(0x80000007)
    74  x86/cpu: cpuinfo: Use parsed CPUID(0x80000007)
    75  KVM: x86: Use parsed CPUID(0x80000007)

# Model: X86_FEATURE routing to the CPUID tables

    76  x86/microcode: Allocate cpuinfo_x86 snapshots on the heap
    77  x86/cpuid: Parse leaves backing X86_FEATURE words
    78  x86/cpuid: Parse Linux synthetic CPUID leaves
    79  x86/cpuid: Introduce a compile-time X86_FEATURE word map
    80  x86/cpuid: Introduce X86_FEATURE and CPUID word APIs
    81  x86/percpu: Add offset argument to x86_this_cpu_test_bit()
    82  x86/cpufeature: Factor out a __static_cpu_has() helper
    83  x86/asm/32: Cache CPUID(0x1).EDX in cpuid_table
    84  x86: Route all feature queries to the CPUID tables

# x86_capability[] removal

    85  x86/cpu: Remove x86_capability[] and x86_power initialization
    86  x86/cpu/transmeta: Remove x86_capability[] CPUID initialization
    87  x86/cpu: centaur/zhaoxin: Remove x86_capability[] initialization
    88  KVM: x86: Remove BUILD_BUG_ON() x86_capability[] check
    89  x86/cpu: Remove x86_capability[] and x86_power

# Finally

    90  MAINTAINERS: Extend x86 CPUID DATABASE file coverage

Changelog v6
============

This iteration adds the following:

(I.) X86_FEATURE integration
----------------------------

The X86_FEATURE words at <asm/cpufeatures.h> are of two kinds:

(a.) Hardware-defined feature words, mirroring one CPUID output register
(b.) Linux-defined x86 feature words

For the hardware-backed words, the CPUID tables and x86_capability[] fully
overlap.  Route those X86_FEATURE words to the CPUID tables instead.

For the Linux-synthetic feature words, only x86_capability[] defines them
as they have no hardware backing.  Unify their handling by defining them in
x86-cpuid-db as a synthetic CPUID leaf:

<leaf id="0x4c780001">
  <desc>Linux-defined synthetic feature flags</desc>
  <text>
    This is a Linux-defined synthetic CPUID leaf, where "Linux" is a
    virtual vendor mirroring hardware vendors like AMD and Intel.  The leaf
    ID prefix 0x4c78 is for Linux, in its shorthand ASCII form "Lx".

    The bit listing mirrors what Linux defines in its synthetic X86_FEATURE
    words.  The listed feature bits are expected to be stable, and
    allocated new bits must be filled in that order: subleaf 0 (EAX->EDX),
    subleaf 1 (EAX->EDX), and so on.
  </text>
  <vendors>
    <vendor>Linux</vendor>
  </vendors>
  <subleaf id="0">
    <eax>
      <desc>X86_FEATURE word 3: Miscellaneous flags</desc>
      <!-- .. bitfields .. -->
    </eax>
    <ebx>
      <desc>X86_FEATURE word 7: Auxiliary flags</desc>
      <!-- .. bitfields .. -->
    </ebx>
    <ecx>
      <desc>X86_FEATURE word 8: Virtualization flags</desc>
      <!-- .. bitfields .. -->
    </ecx>
    <!-- and so on -->
  </subleaf>
</leaf>

Cover all the synthetic feature and bug words by defining CPUID(0x4c780001)
subleaf 0, CPUID(0x4c780001) subleaf 1, and CPUID(0x4c780002) for the CPU
bugs words, X86_BUG.

(II.) Preserve optimized X86_FEATURE query paths
------------------------------------------------

Feature querying is one of the hottest code paths in the x86 subsystem.
This is evident from the bitops usage and the post-boot ALTERNATIVE_TERNARY
opcode patching at <asm/cpufeature.h>.

Preserve that fast path by implementing a pure compile-time mapping from an
X86_FEATURE word to a CPUID table entry in <asm/cpuid/types.h>:

#define CPUID_FEATURE_WORDS_MAP {						\
    /*   X86_FEATURE word,	Leaf,		Subleaf,	Output reg */	\
    __cpu_feature_word(0,	0x1,		0,		CPUID_EDX),	\
    __cpu_feature_word(1,	0x80000001,	0,		CPUID_EDX),	\
    __cpu_feature_word(2,	0x80860001,	0,		CPUID_EDX),	\
    __cpu_feature_word(3,	0x4c780001,	0,		CPUID_EAX),	\
    __cpu_feature_word(4,	0x1,		0,		CPUID_ECX),	\
    __cpu_feature_word(5,	0xc0000001,	0,		CPUID_EDX),	\
    __cpu_feature_word(6,	0x80000001,	0,		CPUID_ECX),	\
    __cpu_feature_word(7,	0x4c780001,	0,		CPUID_EBX),	\
    ...										\
}

Ensure that all mapped X86_FEATURE words remain "unsigned long" aligned so
that bitops access continues to work.  Translate an X86_FEATURE query, at
compile time, to a bitops-ready bitmap plus bit offset.

The synthetic x86-cpuid-db CPUID leaves (0x4c78 range), remove any need to
distinguish between synthetic and hardware-backed X86_FEATURE words.
Across this whole series, treat both classes identically.

(III.) Partial CPUID Table refresh APIs
---------------------------------------

The CPUID tables now host all the X86_FEATURE words, so /never/ repopulate
those tables wholesale.  Doing so would corrupt the kernel maintained state
of set and cleared feature bits, for both hardware-backed and synthetic
words.  This is especially true since once all direct CPUID queries are
forbidden from the kernel, the kernel will gain even more freedom to modify
the hardware-backed feature bits at will.

But... there are areas in the kernel where parts of the table need to be
refreshed.  This can happen after MSR writes, where CPUID leaves can appear
or disapper, or individual feature bits within them can get set or cleared.

To handle that, introduce the partial CPUID table refresh APIs:

    void cpuid_refresh_leaf(struct cpuinfo_x86 *c, u32 leaf);
    void cpuid_refresh_range(struct cpuinfo_x86 *c, u32 start, u32 end);

The CPUID tables are not a normal array, but a compile-time collection of
different types.  Nonetheless, a reliable implementation was found to
bridge the compile-time layout and the run-time partial refresh logic.

(IV.) Convert more CPUID leaves
-------------------------------

Convert many more call sites to the new CPUID APIs, in the ongoing quest to
forbid the CPUID instruction in all kernel code outside the CPUID parser.

Parse the CPUID leaves required for hardware-backed X86_FEATURE words:

    CPUID(0x6)
    CPUID(0x7).0
    CPUID(0x7).1
    CPUID(0xd).1
    CPUID(0x80000001)
    CPUID(0x80000007)
    CPUID(0x80000008)
    CPUID(0x8000000a)
    CPUID(0x8000001f)
    CPUID(0x80000021)

Parse all Transmeta and Centaur/Zhaoxin leaves, and convert their call
sites:

    CPUID(0x80860000)
    CPUID(0x80860001)
    CPUID(0x80860002)
    CPUID(0x80860003)
    CPUID(0x80860004)
    CPUID(0x80860005)
    CPUID(0x80860006)
    CPUID(0xc0000000)
    CPUID(0xc0000001)

Parse and convert the call sites for the performance monitoring
(PerfMon) leaves:

    CPUID(0xa)
    CPUID(0x1c)
    CPUID(0x23)
    CPUID(0x80000022)

Remove the custom CPUID output types from perf's <asm/perf_event.h> and
use the auto generated x86-cpuid-db output types instead.

Complete all call-site conversions for:

    CPUID(0x80000005)
    CPUID(0x80000006)
    CPUID(0x80000008)

Previous iterations converted only the cacheinfo.c logic. This iteration
also converts cpu/common.c, cpu/centaur.c, and cpu/zhaoxin.c.

(V.) Handle Boris' review remarks
---------------------------------

Get rid of the "static vs. dynamic" CPUID leaf distinction, since that
terminology does not exist in the hardware manuals. What was previously
called a dynamic leaf is now described simply as a leaf with a subleaf
range.  Adjust the CPUID API function names and update all their
kernel-doc.

Reduce commit log verbosity where appropriate.  In general, keep detailed
kernel-doc only for the exported call-site APIs.

Shorten function names for the CPUID parser call-site APIs; e.g.
cpuid_parse_cpu(), cpuid_refresh_leaf(), etc.

(VI.) State of affairs
----------------------

Besides the X86_FEATURE query routing, 36 CPUID leaves are now converted
to the CPUID API.  Namely:

    CPUID(0x0)
    CPUID(0x1)
    CPUID(0x2)
    CPUID(0x4)
    CPUID(0x6)
    CPUID(0x7)
    CPUID(0x7).1
    CPUID(0xa)
    CPUID(0xd).1
    CPUID(0x16)
    CPUID(0x1c)
    CPUID(0x23)
    CPUID(0x23).1
    CPUID(0x23).2
    CPUID(0x80000000)
    CPUID(0x80000001)
    CPUID(0x80000002)
    CPUID(0x80000003)
    CPUID(0x80000004)
    CPUID(0x80000005)
    CPUID(0x80000006)
    CPUID(0x80000007)
    CPUID(0x80000008)
    CPUID(0x8000000a)
    CPUID(0x8000001d)
    CPUID(0x8000001f)
    CPUID(0x80000021)
    CPUID(0x80000022)
    CPUID(0x80860000)
    CPUID(0x80860001)
    CPUID(0x80860002)
    CPUID(0x80860003)
    CPUID(0x80860004)
    CPUID(0x80860005)
    CPUID(0x80860006)
    CPUID(0xc0000000)
    CPUID(0xc0000001)

(VII.) Previous iterations
--------------------------

Previous iterations of this work document the evolution of the call site
CPUID APIs.  Please see:

    (v5) https://lore.kernel.org/lkml/20250905121515.192792-1-darwi@linutronix.de

The cover letter there details the v1-v5 progression in full.

Thank you!
Ahmed

8<-----

base-commit: c369299895a591d96745d6492d4888259b004a9e
-- 
2.53.0
