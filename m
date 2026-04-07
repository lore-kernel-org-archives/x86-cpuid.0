Received: from mail-106121.protonmail.ch (mail-106121.protonmail.ch [79.135.106.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A9739A800
	for <x86-cpuid@lists.linux.dev>; Tue,  7 Apr 2026 08:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775552124; cv=none; b=LO4W5ybVbHjakiI4IuuPLOChItF+svaWViXskqn1QSADu344ccIkHgn4GwZNxzd4Oc+A2aaVCdY6NznzNvh++prcjWJryVNEMRHsccWLV03jTHPn12gqHt5C0Z3vZp//BEWiw5WWg+pzHzYhmD7QD4zL5ZVyNmg53xEqiJoBniU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775552124; c=relaxed/simple;
	bh=VtXZDXNiBKm5ehwSdRe9yuAvAq0kbjYY1vg5yuVDQnU=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VfIoSGGOHtYGwCkmT8Xf93Y5HPQ/jMyJQ0kj41GdT4+duRVwGq7qoktsknSuRKxuONLdbBX2Jw/jtjhOL8OdC4GM9fJqIgoL4LpKdiucqpODPKsmaWgTrVtpxwdwP6leGmsQlF6dDxN0Rj7Z5NEtL0EU70WJqm+lQ/OreNyCGGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=S28kBghl; arc=none smtp.client-ip=79.135.106.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="S28kBghl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1775552113; x=1775811313;
	bh=V5+RFDN1eWVMYtp+zhTp8/ZEE11ParCHbsB68eViv+Q=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=S28kBghlbI3XOw4itGg6A/u/lnSuJbYLCRhVNDU3G9z8hXfZ1ifAzmL+CUvJCTXFL
	 H3XKXJ7FWYoLRZC55il7WAFqGaNp9/eTlRtOfkmu9mpN815D+8+f5nkuLWXtR3D8jq
	 KqNADll3ljO0gBz0sA+Zd5Eja5ScGCxtLPPYxRerK7rQs60AXevssUVjrgeUJ0AzZP
	 t5HcI1TIoU7qkuwA1V/svCTbuujCLcGpJDtUNbRSDuV+xMLrtSpeklhImyPHBJfnsE
	 4ufeLDoEu3farenC3PmSQI9hxL4ZkA5GCk7osIYcaJ39Vfuscuu2ykAgnx5VgI+3ZB
	 vAWiQ0hx6qFeQ==
Date: Tue, 07 Apr 2026 08:55:07 +0000
To: "Ahmed S. Darwish" <darwi@linutronix.de>
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Cooper <andrew.cooper3@citrix.com>, "H. Peter Anvin" <hpa@zytor.com>, Sean Christopherson <seanjc@google.com>, David Woodhouse <dwmw2@infradead.org>, Peter Zijlstra <peterz@infradead.org>, Christian Ludloff <ludloff@gmail.com>, Sohil Mehta <sohil.mehta@intel.com>, John Ogness <john.ogness@linutronix.de>, x86@kernel.org, x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 00/90] x86: Introduce a centralized CPUID data model
Message-ID: <adS_GfkQSB9kEs8F@wieczorr-mobl1.localdomain>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: e4a5e7c0540dafd246ae7a00521e1a46040d4b3e
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi, very cool rework! So far I didn't notice any problems while testing.

Buy anyway I wanted to ask if you thought about including the cpuid_deps[] =
or
cpuid_dependent_features[] into the new cpuid API ecosystem?

Or if not (since this patchset is quite long already :b ), then do you have
any idea where best it could fit in? During discussion on [1] you mentioned=
 the
feature depenedency should be encoded in x86-cpuid-db. I assume you meant i=
t
would need to be first patched into there, then parsed by Kconfig?

Kind regards
Maciej Wiecz=C3=B3r-Retman

[1] https://lore.kernel.org/all/acruJf-pyld-fTh1@lx-t490/

On 2026-03-27 at 03:15:14 +0100, Ahmed S. Darwish wrote:
>Hi,
>
>Introduce a centralized x86 CPUID model, tables, and API.
>
>Rationale for this work can be found at:
>
>    https://lore.kernel.org/lkml/874ixernra.ffs@tglx
>    https://gitlab.com/x86-cpuid.org/x86-cpuid-db
>
>By the end of this series, route all X86_FEATURE queries to the CPUID
>tables and fully remove x86_capability[].
>
>The introduced tables and APIs then become a "single source of truth" for
>all x86 feature state, both the hardware-backed and the Linux-synthetic.
>
>The series is divided as follows:
>
># Generic updates and fixes
>
>     1  ASoC: Intel: avs: Check maximum valid CPUID leaf
>     2  ASoC: Intel: avs: Include CPUID header at file scope
>     3  tools/x86/kcpuid: Update bitfields to x86-cpuid-db v3.0
>
># Header disentanglement (<asm/processor.h> <=3D> <asm/cpuid/api.h>)
>
>     4  treewide: Explicitly include the x86 CPUID headers
>     5  x86/cpu: <asm/processor.h>: Do not include the CPUID API header
>     6  x86/cpuid: Rename cpuid_leaf()/cpuid_subleaf() APIs
>     7  x86/cpuid: Introduce <asm/cpuid/leaf_types.h>
>
># CPUID Model (v6)
>
>     8  x86: Introduce a centralized CPUID data model
>     9  x86/cpuid: Introduce a centralized CPUID parser
>    10  x86/cpu: Rescan CPUID table after disabling PSN
>    11  x86/cpu: centaur/zhaoxin: Rescan CPUID(0xc0000001) after MSR write=
s
>    12  x86/cpu/transmeta: Rescan CPUID(0x1) after capability unhide
>    13  x86/cpu/intel: Rescan CPUID table after leaf unlock
>
># CPUID(0x0), CPUID(0x1), CPUID(0x80000000), CPUID(0x8000000[234])
>
>    14  x86/cpu: Use parsed CPUID(0x0)
>    15  x86/lib: Add CPUID(0x1) family and model calculation
>    16  x86/cpu: Use parsed CPUID(0x1)
>    17  x86/cpuid: Parse CPUID(0x80000000)
>    18  x86/cpu: Use parsed CPUID(0x80000000)
>    19  x86/cpuid: Parse CPUID(0x80000002) to CPUID(0x80000004)
>    20  x86/cpu: Use parsed CPUID(0x80000002) to CPUID(0x80000004)
>
># CPUID Model: x86 vendor discernment + debugfs support
>
>    21  x86/cpuid: Split parser tables and add vendor-qualified parsing
>    22  x86/cpuid: Introduce a parser debugfs interface
>
># CPUID(0x16), Transmeta CPUID(0x8086000[0123456]), Centaur CPUID(0xc00000=
0[01])
>
>    23  x86/cpuid: Parse CPUID(0x16)
>    24  x86/tsc: Use parsed CPUID(0x16)
>    25  x86/cpuid: Parse Transmeta and Centaur extended ranges
>    26  x86/cpu: transmeta: Use parsed CPUID(0x80860000)->CPUID(0x80860006=
)
>    27  x86/cpu: transmeta: Refactor CPU information printing
>    28  x86/cpu: centaur: Use parsed CPUID(0xc0000001)
>    29  x86/cpu: zhaoxin: Use parsed CPUID(0xc0000001)
>
># Intel cache descriptors; CPUID(0x2)
>
>    30  x86/cpuid: Parse CPUID(0x2)
>    31  x86/cpuid: Warn once on invalid CPUID(0x2) iteration count
>    32  x86/cpuid: Introduce parsed CPUID(0x2) API
>    33  x86/cpu: Use parsed CPUID(0x2)
>    34  x86/cacheinfo: Use parsed CPUID(0x2)
>    35  x86/cpuid: Remove direct CPUID(0x2) query helpers
>
># Intel/AMD deterministic cache; CPUID(0x4), CPUID(0x8000001d)
>
>    36  x86/cpuid: Parse deterministic cache parameters CPUID leaves
>    37  x86/cacheinfo: Pass a 'struct cpuinfo_x86' refrence to CPUID(0x4) =
code
>    38  x86/cacheinfo: Use parsed CPUID(0x4)
>    39  x86/cacheinfo: Use parsed CPUID(0x8000001d)
>
># Cache/TLB/mm info; CPUID(0x8000000[568])
>
>    40  x86/cpuid: Parse CPUID(0x80000005), CPUID(0x80000006), CPUID(0x800=
00008)
>    41  x86/cacheinfo: Use auto-generated data types
>    42  x86/cacheinfo: Use parsed CPUID(0x80000005) and CPUID(0x80000006)
>    43  x86/cacheinfo: Use parsed CPUID(0x80000006)
>    44  x86/cpu: Use parsed CPUID(0x80000005) and CPUID(0x80000006)
>    45  x86/cpu/amd: Use parsed CPUID(0x80000005)
>    46  x86/cpu/amd: Refactor TLB detection code
>    47  x86/cpu/amd: Use parsed CPUID(CPUID(0x80000005) and CPUID(0x800000=
06)
>    48  x86/cpu/hygon: Use parsed CPUID(0x80000005) and CPUID(0x80000006)
>    49  x86/cpu/centaur: Use parsed CPUID(0x80000005)
>    50  x86/cpu: Use parsed CPUID(0x80000008)
>
># PerfMon; CPUID(0xa), CPUID(0x1c), CPUID(0x23), CPUID(0x80000022)
>
>    51  x86/cpuid: Parse CPUID(0xa) and CPUID(0x1c)
>    52  x86/cpu/intel: Use parsed CPUID(0xa)
>    53  x86/cpu/centaur: Use parsed CPUID(0xa)
>    54  x86/cpu/zhaoxin: Use parsed CPUID(0xa)
>    55  perf/x86/intel: Use parsed CPUID(0xa)
>    56  perf/x86/zhaoxin: Use parsed CPUID(0xa)
>    57  x86/xen: Use parsed CPUID(0xa)
>    58  KVM: x86: Use standard CPUID(0xa) types
>    59  KVM: x86/pmu: Use standard CPUID(0xa) types
>    60  perf/x86: Remove custom CPUID(0xa) types
>    61  perf/x86/lbr: Use parsed CPUID(0x1c)
>    62  perf/x86/lbr: Remove custom CPUID(0x1c) types
>    63  x86/cpuid: Parse CPUID(0x23)
>    64  perf/x86/intel: Use parsed per-CPU CPUID(0x23)
>    65  perf/x86/intel: Remove custom CPUID(0x23) types
>    66  x86/cpuid: Parse CPUID(0x80000022)
>    67  perf/x86/amd/lbr: Use parsed CPUID(0x80000022)
>    68  perf/x86/amd: Use parsed CPUID(0x80000022)
>    69  KVM: x86: Use standard CPUID(0x80000022) types
>    70  perf/x86: Remove custom CPUID(0x80000022) types
>
># Power management flags; CPUID(0x80000007).EBX
>
>    71  x86/cpuid: Parse CPUID(0x80000007)
>    72  x86/cpu: Use parsed CPUID(0x80000007)
>    73  x86/cpu: amd/hygon: Use parsed CPUID(0x80000007)
>    74  x86/cpu: cpuinfo: Use parsed CPUID(0x80000007)
>    75  KVM: x86: Use parsed CPUID(0x80000007)
>
># Model: X86_FEATURE routing to the CPUID tables
>
>    76  x86/microcode: Allocate cpuinfo_x86 snapshots on the heap
>    77  x86/cpuid: Parse leaves backing X86_FEATURE words
>    78  x86/cpuid: Parse Linux synthetic CPUID leaves
>    79  x86/cpuid: Introduce a compile-time X86_FEATURE word map
>    80  x86/cpuid: Introduce X86_FEATURE and CPUID word APIs
>    81  x86/percpu: Add offset argument to x86_this_cpu_test_bit()
>    82  x86/cpufeature: Factor out a __static_cpu_has() helper
>    83  x86/asm/32: Cache CPUID(0x1).EDX in cpuid_table
>    84  x86: Route all feature queries to the CPUID tables
>
># x86_capability[] removal
>
>    85  x86/cpu: Remove x86_capability[] and x86_power initialization
>    86  x86/cpu/transmeta: Remove x86_capability[] CPUID initialization
>    87  x86/cpu: centaur/zhaoxin: Remove x86_capability[] initialization
>    88  KVM: x86: Remove BUILD_BUG_ON() x86_capability[] check
>    89  x86/cpu: Remove x86_capability[] and x86_power
>
># Finally
>
>    90  MAINTAINERS: Extend x86 CPUID DATABASE file coverage
>
>Changelog v6
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>This iteration adds the following:
>
>(I.) X86_FEATURE integration
>----------------------------
>
>The X86_FEATURE words at <asm/cpufeatures.h> are of two kinds:
>
>(a.) Hardware-defined feature words, mirroring one CPUID output register
>(b.) Linux-defined x86 feature words
>
>For the hardware-backed words, the CPUID tables and x86_capability[] fully
>overlap.  Route those X86_FEATURE words to the CPUID tables instead.
>
>For the Linux-synthetic feature words, only x86_capability[] defines them
>as they have no hardware backing.  Unify their handling by defining them i=
n
>x86-cpuid-db as a synthetic CPUID leaf:
>
><leaf id=3D"0x4c780001">
>  <desc>Linux-defined synthetic feature flags</desc>
>  <text>
>    This is a Linux-defined synthetic CPUID leaf, where "Linux" is a
>    virtual vendor mirroring hardware vendors like AMD and Intel.  The lea=
f
>    ID prefix 0x4c78 is for Linux, in its shorthand ASCII form "Lx".
>
>    The bit listing mirrors what Linux defines in its synthetic X86_FEATUR=
E
>    words.  The listed feature bits are expected to be stable, and
>    allocated new bits must be filled in that order: subleaf 0 (EAX->EDX),
>    subleaf 1 (EAX->EDX), and so on.
>  </text>
>  <vendors>
>    <vendor>Linux</vendor>
>  </vendors>
>  <subleaf id=3D"0">
>    <eax>
>      <desc>X86_FEATURE word 3: Miscellaneous flags</desc>
>      <!-- .. bitfields .. -->
>    </eax>
>    <ebx>
>      <desc>X86_FEATURE word 7: Auxiliary flags</desc>
>      <!-- .. bitfields .. -->
>    </ebx>
>    <ecx>
>      <desc>X86_FEATURE word 8: Virtualization flags</desc>
>      <!-- .. bitfields .. -->
>    </ecx>
>    <!-- and so on -->
>  </subleaf>
></leaf>
>
>Cover all the synthetic feature and bug words by defining CPUID(0x4c780001=
)
>subleaf 0, CPUID(0x4c780001) subleaf 1, and CPUID(0x4c780002) for the CPU
>bugs words, X86_BUG.
>
>(II.) Preserve optimized X86_FEATURE query paths
>------------------------------------------------
>
>Feature querying is one of the hottest code paths in the x86 subsystem.
>This is evident from the bitops usage and the post-boot ALTERNATIVE_TERNAR=
Y
>opcode patching at <asm/cpufeature.h>.
>
>Preserve that fast path by implementing a pure compile-time mapping from a=
n
>X86_FEATURE word to a CPUID table entry in <asm/cpuid/types.h>:
>
>#define CPUID_FEATURE_WORDS_MAP {=09=09=09=09=09=09\
>    /*   X86_FEATURE word,=09Leaf,=09=09Subleaf,=09Output reg */=09\
>    __cpu_feature_word(0,=090x1,=09=090,=09=09CPUID_EDX),=09\
>    __cpu_feature_word(1,=090x80000001,=090,=09=09CPUID_EDX),=09\
>    __cpu_feature_word(2,=090x80860001,=090,=09=09CPUID_EDX),=09\
>    __cpu_feature_word(3,=090x4c780001,=090,=09=09CPUID_EAX),=09\
>    __cpu_feature_word(4,=090x1,=09=090,=09=09CPUID_ECX),=09\
>    __cpu_feature_word(5,=090xc0000001,=090,=09=09CPUID_EDX),=09\
>    __cpu_feature_word(6,=090x80000001,=090,=09=09CPUID_ECX),=09\
>    __cpu_feature_word(7,=090x4c780001,=090,=09=09CPUID_EBX),=09\
>    ...=09=09=09=09=09=09=09=09=09=09\
>}
>
>Ensure that all mapped X86_FEATURE words remain "unsigned long" aligned so
>that bitops access continues to work.  Translate an X86_FEATURE query, at
>compile time, to a bitops-ready bitmap plus bit offset.
>
>The synthetic x86-cpuid-db CPUID leaves (0x4c78 range), remove any need to
>distinguish between synthetic and hardware-backed X86_FEATURE words.
>Across this whole series, treat both classes identically.
>
>(III.) Partial CPUID Table refresh APIs
>---------------------------------------
>
>The CPUID tables now host all the X86_FEATURE words, so /never/ repopulate
>those tables wholesale.  Doing so would corrupt the kernel maintained stat=
e
>of set and cleared feature bits, for both hardware-backed and synthetic
>words.  This is especially true since once all direct CPUID queries are
>forbidden from the kernel, the kernel will gain even more freedom to modif=
y
>the hardware-backed feature bits at will.
>
>But... there are areas in the kernel where parts of the table need to be
>refreshed.  This can happen after MSR writes, where CPUID leaves can appea=
r
>or disapper, or individual feature bits within them can get set or cleared=
.
>
>To handle that, introduce the partial CPUID table refresh APIs:
>
>    void cpuid_refresh_leaf(struct cpuinfo_x86 *c, u32 leaf);
>    void cpuid_refresh_range(struct cpuinfo_x86 *c, u32 start, u32 end);
>
>The CPUID tables are not a normal array, but a compile-time collection of
>different types.  Nonetheless, a reliable implementation was found to
>bridge the compile-time layout and the run-time partial refresh logic.
>
>(IV.) Convert more CPUID leaves
>-------------------------------
>
>Convert many more call sites to the new CPUID APIs, in the ongoing quest t=
o
>forbid the CPUID instruction in all kernel code outside the CPUID parser.
>
>Parse the CPUID leaves required for hardware-backed X86_FEATURE words:
>
>    CPUID(0x6)
>    CPUID(0x7).0
>    CPUID(0x7).1
>    CPUID(0xd).1
>    CPUID(0x80000001)
>    CPUID(0x80000007)
>    CPUID(0x80000008)
>    CPUID(0x8000000a)
>    CPUID(0x8000001f)
>    CPUID(0x80000021)
>
>Parse all Transmeta and Centaur/Zhaoxin leaves, and convert their call
>sites:
>
>    CPUID(0x80860000)
>    CPUID(0x80860001)
>    CPUID(0x80860002)
>    CPUID(0x80860003)
>    CPUID(0x80860004)
>    CPUID(0x80860005)
>    CPUID(0x80860006)
>    CPUID(0xc0000000)
>    CPUID(0xc0000001)
>
>Parse and convert the call sites for the performance monitoring
>(PerfMon) leaves:
>
>    CPUID(0xa)
>    CPUID(0x1c)
>    CPUID(0x23)
>    CPUID(0x80000022)
>
>Remove the custom CPUID output types from perf's <asm/perf_event.h> and
>use the auto generated x86-cpuid-db output types instead.
>
>Complete all call-site conversions for:
>
>    CPUID(0x80000005)
>    CPUID(0x80000006)
>    CPUID(0x80000008)
>
>Previous iterations converted only the cacheinfo.c logic. This iteration
>also converts cpu/common.c, cpu/centaur.c, and cpu/zhaoxin.c.
>
>(V.) Handle Boris' review remarks
>---------------------------------
>
>Get rid of the "static vs. dynamic" CPUID leaf distinction, since that
>terminology does not exist in the hardware manuals. What was previously
>called a dynamic leaf is now described simply as a leaf with a subleaf
>range.  Adjust the CPUID API function names and update all their
>kernel-doc.
>
>Reduce commit log verbosity where appropriate.  In general, keep detailed
>kernel-doc only for the exported call-site APIs.
>
>Shorten function names for the CPUID parser call-site APIs; e.g.
>cpuid_parse_cpu(), cpuid_refresh_leaf(), etc.
>
>(VI.) State of affairs
>----------------------
>
>Besides the X86_FEATURE query routing, 36 CPUID leaves are now converted
>to the CPUID API.  Namely:
>
>    CPUID(0x0)
>    CPUID(0x1)
>    CPUID(0x2)
>    CPUID(0x4)
>    CPUID(0x6)
>    CPUID(0x7)
>    CPUID(0x7).1
>    CPUID(0xa)
>    CPUID(0xd).1
>    CPUID(0x16)
>    CPUID(0x1c)
>    CPUID(0x23)
>    CPUID(0x23).1
>    CPUID(0x23).2
>    CPUID(0x80000000)
>    CPUID(0x80000001)
>    CPUID(0x80000002)
>    CPUID(0x80000003)
>    CPUID(0x80000004)
>    CPUID(0x80000005)
>    CPUID(0x80000006)
>    CPUID(0x80000007)
>    CPUID(0x80000008)
>    CPUID(0x8000000a)
>    CPUID(0x8000001d)
>    CPUID(0x8000001f)
>    CPUID(0x80000021)
>    CPUID(0x80000022)
>    CPUID(0x80860000)
>    CPUID(0x80860001)
>    CPUID(0x80860002)
>    CPUID(0x80860003)
>    CPUID(0x80860004)
>    CPUID(0x80860005)
>    CPUID(0x80860006)
>    CPUID(0xc0000000)
>    CPUID(0xc0000001)
>
>(VII.) Previous iterations
>--------------------------
>
>Previous iterations of this work document the evolution of the call site
>CPUID APIs.  Please see:
>
>    (v5) https://lore.kernel.org/lkml/20250905121515.192792-1-darwi@linutr=
onix.de
>
>The cover letter there details the v1-v5 progression in full.
>
>Thank you!
>Ahmed
>
>8<-----
>
>base-commit: c369299895a591d96745d6492d4888259b004a9e
>--=20
>2.53.0

