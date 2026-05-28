Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3766D305669
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982781; cv=none; b=TsaszzQrGC2UDPIJ8FNG36SIeneLwXrhdUneaEkZE7+TToDuhKHEdhPiV+OW/i7NQ1/AypD6ArrxMkQcU3+GBh5GxHjmw2Q0ahoZHia+1YeP7BP3Q6WG7PnFIAVFkU3u1VpBF2NXnM25tS1Dlu4AzODj+DShf2S/vxEoikFijm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982781; c=relaxed/simple;
	bh=bkoeg5r2NxxiZRdMMYlcQ8MXQhRsTAY/sU7LTAeHv5s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qS/YaQLbvw2Hbdq4downBi5wf56+FxHl9ne6DCF6/dlRNszpOvYZd7xs9o0t/a5e3W2/MyTUux4NA+N5NKBPKRWqvBht6RHox+z1eP6u0kJ25bFDLZXIHK8BeFNYKEGwC7GI+tvhNHkA4h4FGsMWouQO//o4qw/WNsqcc0ozyDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=l29KIQJ1; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3A2hc1e8; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="l29KIQJ1";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3A2hc1e8"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=d12xHy1LaKmymE8Xt3YGf35FrormXZcihTWwwyKnWsA=;
	b=l29KIQJ1fMBvGBw936V8sv5IFJRenyDQlcOxcP6Wki4bxqQUKyUJUvMMbxh4wxVNmQ+51b
	9kekPWp/vze7+4OPSqekuTX0/ZFADbgrsWXNsXUVJNw6N+2XzDD40ksgHpAmKUlMf5T0pr
	qWaY7eCr+Wy3dsV0VKNAvASgA0r4gZ2JamPW4uBWsEuWzo3Ye82G3wnvoJAUumuTVgF3lp
	6QnW2Nx851wSeoUO6VBB5zbSXagxqaAl1y3Crxn/PblnzGCo9tjTeb9hpwvlfZvoGrCE9C
	/8xDqab7PRVZRzy+2eVNVehXM6qpZySBfycxxlVkxSuu9Vr/ES+smdxaKFAnAg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=d12xHy1LaKmymE8Xt3YGf35FrormXZcihTWwwyKnWsA=;
	b=3A2hc1e8uwQ+xQAkTYt0H0hZovDVl4xmw2Pn9uCFQr7gj1r4Wp6kP/FfjcxHFCnXqt8be3
	O0O6HPbcO7+8wmCA==
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
Subject: [PATCH v7 000/120] x86: Introduce a centralized CPUID data model
Date: Thu, 28 May 2026 17:37:22 +0200
Message-ID: <20260528153923.403473-1-darwi@linutronix.de>
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

Refactor and convert ~85% of the kernel CPUID call sites to the model.

By the end of this series, route all X86_FEATURE queries to the CPUID
tables and remove x86_capability[].

Please note that the top 6 patches are already in tip:x86/cpu. They are
here to keep a clean queue over -rc5 so that the bots can do their work.

Special thanks to Maciej for testing the previous iteration.

The series is divided as:

# Header disentanglement (<asm/processor.h> <==> <asm/cpuid/api.h>)

     1	treewide: Explicitly include the x86 CPUID headers
     2	x86/cpu: <asm/processor.h>: Do not include the CPUID API header
     3	x86/cpuid: Rename cpuid_leaf()/cpuid_subleaf() APIs

# CPUID Model

     4	x86/cpuid: Introduce <asm/cpuid/leaf_types.h>
     5	x86/cpu: Introduce a centralized CPUID data model
     6	x86/cpuid: Introduce a centralized CPUID parser
     7	x86/cpu: centaur/zhaoxin: Rescan CPUID(0xc0000001) after MSR writes
     8	x86/cpu/transmeta: Rescan CPUID(0x1) after capability unhide

# CPUID(0x0), CPUID(0x1), CPUID(0x80000000), CPUID(0x8000000[234])

     9	x86/cpu: Use parsed CPUID(0x0)
    10	x86/lib: Add CPUID(0x1) family and model calculation
    11	x86/cpu: Use parsed CPUID(0x1)
    12	x86/cpuid: Parse CPUID(0x80000000)
    13	x86/cpu: Use parsed CPUID(0x80000000)
    14	x86/cpuid: Parse CPUID(0x80000002) to CPUID(0x80000004)
    15	x86/cpu: Use parsed CPUID(0x80000002) to CPUID(0x80000004)

# CPUID Model: x86 vendor discernment + debugfs support

    16	x86/cpuid: Split parser tables and add vendor-qualified parsing
    17	x86/cpuid: Introduce a parser debugfs interface

# CPUID(0x16), Transmeta CPUID(0x8086000[0123456]), Centaur CPUID(0xc000000[01])

    18	x86/cpuid: Parse CPUID(0x16)
    19	x86/tsc: Use parsed CPUID(0x16)
    20	x86/cpuid: Parse Transmeta and Centaur extended ranges
    21	x86/cpu/transmeta: Use parsed CPUID(0x80860000)->CPUID(0x80860006)
    22	x86/cpu/transmeta: Refactor CPU information printing
    23	x86/cpu/centaur: Use parsed CPUID(0xc0000001)
    24	x86/cpu/zhaoxin: Use parsed CPUID(0xc0000001)

# Intel cache descriptors; CPUID(0x2)

    25	x86/cpuid: Parse CPUID(0x2)
    26	x86/cpuid: Warn once on invalid CPUID(0x2) iteration count
    27	x86/cpuid: Introduce parsed CPUID(0x2) API
    28	x86/cpu: Use parsed CPUID(0x2)
    29	x86/cacheinfo: Use parsed CPUID(0x2)
    30	x86/cpuid: Remove direct CPUID(0x2) query helpers

# Intel/AMD deterministic cache; CPUID(0x4), CPUID(0x8000001d)

    31	x86/cpuid: Parse deterministic cache parameters CPUID leaves
    32	x86/cacheinfo: Pass a 'struct cpuinfo_x86' reference to CPUID(0x4) code
    33	x86/cacheinfo: Use parsed CPUID(0x4)
    34	x86/cacheinfo: Use parsed CPUID(0x8000001d)

# Cache/TLB/mm info; CPUID(0x8000000[568])

    35	x86/cpuid: Parse CPUID(0x80000005), CPUID(0x80000006), CPUID(0x80000008)
    36	x86/cacheinfo: Use auto-generated data types
    37	x86/cacheinfo: Use parsed CPUID(0x80000005) and CPUID(0x80000006)
    38	x86/cacheinfo: Use parsed CPUID(0x80000006)
    39	x86/cpu: Use parsed CPUID(0x80000005) and CPUID(0x80000006)
    40	x86/cpu/amd: Use parsed CPUID(0x80000005)
    41	x86/cpu/amd: Refactor TLB detection code
    42	x86/cpu/amd: Use parsed CPUID(0x80000005) and CPUID(0x80000006)
    43	x86/cpu/hygon: Use parsed CPUID(0x80000005) and CPUID(0x80000006)
    44	x86/cpu/centaur: Use parsed CPUID(0x80000005)
    45	x86/cpu: Use parsed CPUID(0x80000008)

# Remaining CPUID(0x1) sites

    46	x86/apic: Use parsed and refreshed CPUID(0x1)
    47	x86/cpu/amd: Refactor CPUID(0x1) level calculation
    48	x86/mce: core: Use parsed CPUID(0x1)
    49	x86/mce: inject: Use parsed CPUID(0x1)
    50	x86/microcode/amd: Use standard CPUID(0x1) types
    51	x86/microcode/amd: rdrand: Use standard CPUID(0x1) types
    52	x86/microcode/intel: Explain CPUID parser APIs unavailability
    53	x86/mm/pti: Use standard CPUID(0x1) types
    54	x86/xen: Use parsed CPUID(0x1)
    55	x86/xen: Use standard CPUID(0x1) types
    56	agp/efficeon: Use parsed CPUID(0x1)
    57	dmaengine: ioatdma: Remove custom UP local APID IC code
    58	RAS/AMD/FMPM: Use parsed CPUID(0x1)

# MONITOR/MWAIT: CPUID(0x5)

    59	x86/cpuid: Parse CPUID(0x5)
    60	x86/acpi/cstate: Remove superfluous retval logic
    61	x86/acpi/cstate: Clarify unsupported MWAIT hint warning
    62	x86/acpi/cstate: Use MWAIT helper macros
    63	x86/acpi: Use parsed CPUID(0x5)
    64	x86/process: Use parsed CPUID(0x5)
    65	x86/hpet: Use parsed CPUID(0x5)
    66	ACPI: PAD: Use Parsed CPUID(0x5)
    67	intel_idle: Use parsed CPUID(0x5)
    68	x86/idle: Remove unused CPUID(0x5) symbols

# Misc: CPUID(0x6), CPUID(0x9), CPUID(0x15)

    69	x86/cpuid: Parse CPUID(0x6), CPUID(0x9), and CPUID(0x15)
    70	thermal: intel: hfi: Use parsed CPUID(0x6)
    71	dmaengine: ioatdma: Use parsed CPUID(0x9)
    72	ASoC: Intel: avs: Use parsed CPUID(0x15)
    73	perf/x86/intel: Use parsed CPUID(0x15)

# Intel SGX: CPUID(0x12)

    74	x86/cpuid: Introduce cpuid_subleaf_raw()
    75	x86/cpuid: Parse CPUID(0x12)
    76	x86/sgx/driver: Use parsed CPUID(0x12)
    77	x86/sgx: Use parsed CPUID(0x12)
    78	KVM: x86: Use parsed CPUID(0x12)
    79	KVM: VMX: Use standard CPUID(0x12) types
    80	x86/sgx: Move unused CPUID(0x12) symbols

# Perfmon: CPUID(0xa), CPUID(0x1c), CPUID(0x23), CPUID(0x80000022)

    81	x86/cpuid: Parse CPUID(0xa) and CPUID(0x1c)
    82	x86/cpu/intel: Use parsed CPUID(0xa)
    83	x86/cpu/centaur: Use parsed CPUID(0xa)
    84	x86/cpu/zhaoxin: Use parsed CPUID(0xa)
    85	perf/x86/intel: Use parsed CPUID(0xa)
    86	perf/x86/zhaoxin: Use parsed CPUID(0xa)
    87	x86/xen: Use parsed CPUID(0xa)
    88	KVM: x86: Use standard CPUID(0xa) types
    89	KVM: x86/pmu: Use standard CPUID(0xa) types
    90	perf/x86: Remove custom CPUID(0xa) types
    91	perf/x86/lbr: Use parsed CPUID(0x1c)
    92	perf/x86/lbr: Remove custom CPUID(0x1c) types
    93	x86/cpuid: Parse CPUID(0x23)
    94	perf/x86/intel: Use parsed per-CPU CPUID(0x23)
    95	perf/x86/intel: Remove custom CPUID(0x23) types
    96	x86/cpuid: Parse CPUID(0x80000022)
    97	perf/x86/amd/lbr: Use parsed CPUID(0x80000022)
    98	perf/x86/amd: Use parsed CPUID(0x80000022)
    99	KVM: x86: Use standard CPUID(0x80000022) types
   100	perf/x86: Remove custom CPUID(0x80000022) types

# Power management flags: CPUID(0x80000007).EBX

   101	x86/cpuid: Parse CPUID(0x80000007)
   102	x86/cpu: Use parsed CPUID(0x80000007)
   103	x86/cpu: amd/hygon: Use parsed CPUID(0x80000007)
   104	x86/cpu: cpuinfo: Use parsed CPUID(0x80000007)
   105	KVM: x86: Use parsed CPUID(0x80000007)

# CPUID Model: X86_FEATURE routing

   106	x86/microcode: Allocate cpuinfo_x86 snapshots on the heap
   107	x86/cpuid: Parse leaves backing X86_FEATURE words
   108	x86/cpuid: Parse Linux synthetic CPUID leaves
   109	x86/cpuid: Introduce a compile-time X86_FEATURE word map
   110	x86/cpuid: Introduce X86_FEATURE and CPUID word APIs
   111	x86/percpu: Add offset argument to x86_this_cpu_test_bit()
   112	x86/cpufeature: Factor out a __static_cpu_has() helper
   113	x86/asm/32: Cache CPUID(0x1).EDX in cpuid_table
   114	x86: Route all feature queries to the CPUID tables

# cpuinfo_x86::x86_capability[] Removal

   115	x86/cpu: Remove x86_capability[] and x86_power initialization
   116	x86/cpu/transmeta: Remove x86_capability[] CPUID initialization
   117	x86/cpu: centaur/zhaoxin: Remove x86_capability[] initialization
   118	KVM: x86: Remove BUILD_BUG_ON() x86_capability[] check
   119	x86/cpu: Remove x86_capability[] and x86_power

# Finally

   120	MAINTAINERS: Extend x86 CPUID DATABASE file coverage

Changelogs
==========

* v7

- Per Boris feedback, drop for now the legacy sites CPUID table rescans
- Fix the wording issues pointed by Maciej
- Convert all remaining CPUID(0x1) sites
- Convert CPUID(0x5), CPUID(0x6), CPUID(0x9), and CPUID(0x12) sites

* Previous iterations changelogs

- https://lore.kernel.org/lkml/20260327021645.555257-1-darwi@linutronix.de
- https://lore.kernel.org/lkml/20250905121515.192792-1-darwi@linutronix.de

Thank you,
Ahmed

8<-----

base-commit: e7ae89a0c97ce2b68b0983cd01eda67cf373517d
-- 
2.54.0

