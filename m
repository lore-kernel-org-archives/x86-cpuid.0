Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6B92222D7
	for <x86-cpuid@lists.linux.dev>; Wed,  9 Jul 2025 17:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752081198; cv=none; b=t1a+8PUBRNgw4vw2/1vttmLIg+2U1DkDddYhIcfJ8gTnl84K3Lz5KS5Xo7AH1Gpx/tCGnoSMbvonwhC96IMLEPHgnMwVMpsbdrlHu+GkWFUVwiLBNP/APJ8aIhO4+RDI7oX8sQ/rN/oweyVW5NcRkfQlrjMiTFbcB2+3OWttXGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752081198; c=relaxed/simple;
	bh=O2YQhZBU1ofBekN2KwRZdHuhqsC4q7S/ZNAWBEom2CU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YTDGcYS/zb8aOlEN+pkGTbzu17ABU+s5W/uzp+2s1i5XYvXTn2eA/DyLskGd0M65uqz5GpJC/Grc8zW6uUl1K/NwjUw8belJM3FIfAfzH7cUPabQ+K6fWmWzfI1BBfpb6YpY5pCMJQWcGkTBZ4FVnhMCF+wxYMjq8/LYcz/p/Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qXv9FDqU; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qXv9FDqU"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-313fb0ec33bso147179a91.2
        for <x86-cpuid@lists.linux.dev>; Wed, 09 Jul 2025 10:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752081195; x=1752685995; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MFdwR3lAJd7vdYwnOv4iE7Hy18jXCV9dXILHs2CzgU0=;
        b=qXv9FDqU5weZsDTNfzEOZS5Vb4kM2jJYEXwyRN87wFy3Gt9E/rb62qR2FtapVZCkun
         qe4WWk3Q4P1P2ELIRzcFzrijrcstqQ8ATlAyTmxsUVOG/yThuJ4YVWz3YGTdCuZ0I5RO
         o58EkY8PcOf4lJrb2yOZIN+APoL9218I1FY21BP5icm5cnW6921nExtMc+c1a63IR5zk
         aPBWDjf/5Kv4CF9ZW20Vt48chE3SfewyxBr0XWsIhpzrijLpUdyZblgV6I/MNxRwNksk
         e30d5QoyCE2G4glwHOe5tj0RD+L1Ln8zmAt9iEmEolwNgsAt+SCh4ah2tDFEGs1B4Yp2
         4/dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752081195; x=1752685995;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MFdwR3lAJd7vdYwnOv4iE7Hy18jXCV9dXILHs2CzgU0=;
        b=vgyIjB6hkUKv/aG8ZBKyCW41XT8i30FS/VZ1kLTUz5qc/GtKRY/m13G2JmHAvD3BHu
         5u5R4su1HCGksDr7o0eXwCSNC0EelOVMdbraI2hVUfgR8MsKlJ3dmZ7hfxpK8rsAPx9W
         TUWlbTglnXhXK/xOU508t4D716ed+9IvjHgi4W6GQRTE3QXLkICL0BbXQQBdwfr+wbCK
         mL5PmYDjpjwa92t2g2ex6y3ZzOIvrN2cwIjeWvOlaEW8ACfZqTlfpcK7bvQlhc32QcZ1
         7dhGzoaHk7ZJevj4g1Etg28RzJv81nQBc2fyvS7RfOR6L+Gip7S5MxscWo5JBL7ady1F
         kq8g==
X-Forwarded-Encrypted: i=1; AJvYcCUaYpwDzMDYnymrrA4fofPEaIKSMlTFi3gOEhYbX+ThPj6PJD+O2pdcN83S7SJahjtGnwERMMT3ONY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwMkK8cGmBV3v4ct2nDmrh5iMLE50uQwReZgMVi/f+CXkGOLRht
	aCXgX6XTo+Nu9LtYx15E7Jv+z7gegt8jqWb56gBFWIP3ZMBB5C8LLR4cWhmE1+5JhRQWFIBJROl
	+pJ7O5w==
X-Google-Smtp-Source: AGHT+IF4KmprglJhQcCJjAzzWMjja6iK8iRcdlNEdxxLpwXx5M10tRiFlzyYJ7m3VJ2DYG0UO1IJjLbBGog=
X-Received: from pjbsz11.prod.google.com ([2002:a17:90b:2d4b:b0:311:b3fb:9f74])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4ec4:b0:312:e9bd:5d37
 with SMTP id 98e67ed59e1d1-31c3c269ae4mr1071299a91.6.1752081185093; Wed, 09
 Jul 2025 10:13:05 -0700 (PDT)
Date: Wed, 9 Jul 2025 10:13:03 -0700
In-Reply-To: <20250709170454.74854-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250709170454.74854-1-darwi@linutronix.de>
Message-ID: <aG6jH9ZHWiTxfFM3@google.com>
Subject: Re: [PATCH v1 0/7] x86: Disentangle <asm/processor.h> dependency on
 CPUID APIs
From: Sean Christopherson <seanjc@google.com>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
Cc: Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, John Ogness <john.ogness@linutronix.de>, x86@kernel.org, 
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 09, 2025, Ahmed S. Darwish wrote:
> Hi,
>=20
> This series avoids including the full CPUID API from <asm/processor.h>.
> That header only needs the CPUID data types and not the full API.
>=20
> Replace the <asm/cpuid/api.h> inclusion in <asm/processor.h> with an
> include of <asm/cpuid/types.h>.
>=20
> Modify all CPUID call sites which implicitly included the CPUID API
> though <asm/processor.h> to explicitly include <asm/cpuid/api.h> instead.
>=20
> This work prepares for an upcoming v4 of the CPUID model:
>=20
>     [PATCH v3 00/44] x86: Introduce a centralized CPUID data model
>     https://lore.kernel.org/lkml/20250612234010.572636-1-darwi@linutronix=
.de
>=20
> where <asm/cpuid/api.h> needs to include <asm/processor.h>, thus creating
> a circular dependency if not resolved beforehand=E2=80=A6  Patches 1->19 =
of the
> v3 above had parts of this series circular dependency disentanglement.
>=20
> Per Boris' remarks above, merge the header includes reorderings into two
> patches only: one patch for x86 and one for drivers.
>=20
> The 0-day bot x86-32 compilation error:
>=20
>     Re: [PATCH v3 41/44] x86/cpu: <asm/processor.h>: Do not include CPUID=
=E2=80=A6
>     https://lore.kernel.org/lkml/202506132039.imS2Pflx-lkp@intel.com
>=20
> is also fixed in this series.
>=20
> Beside the call sites converted at CPUID model v3 above, this series also
> switches below files:
>=20
>     arch/x86/kernel/cpu/microcode/core.c
>     arch/x86/kernel/cpu/microcode/intel.c
>     arch/x86/kernel/cpu/mshyperv.c
>     arch/x86/kvm/lapic.c
>     arch/x86/kvm/svm/sev.c

I'm officially confused.  Neither lapic.c nor svm/sev.c are modified in thi=
s series.
Does "this series" actually mean something other than _this_ seris?

>     drivers/acpi/acpi_processor.c
>     drivers/acpi/processor_core.c
>     drivers/cpufreq/longrun.c
>     drivers/cpufreq/powernow-k7.c
>     drivers/cpufreq/powernow-k8.c
>     drivers/hwtracing/coresight/coresight-platform.c
>     drivers/xen/xen-acpi-processor.c
>=20
> to explicitly include <asm/cpuid/api.h>.
>=20
> Based on v6.16-rc5.
>=20
> Note, the last patch is a CPUID API naming change in preparation for the
> model as well.  It can be skipped if merging it is not desired at this
> stage.
>=20
> Thanks!
>=20
> 8<-----
>=20
> Ahmed S. Darwish (7):
>   x86/cpuid: Remove transitional <asm/cpuid.h> header
>   ASoC: Intel: avs: Include CPUID header at file scope
>   x86: Reorder headers alphabetically
>   drivers: Reorder headers alphabetically
>   treewide: Explicitly include <asm/cpuid/api.h>
>   x86/cpu: <asm/processor.h>: Do not include CPUID API header
>   x86/cpuid: Rename cpuid_leaf()/cpuid_subleaf() APIs
>=20
>  arch/x86/boot/compressed/pgtable_64.c        |  1 +
>  arch/x86/boot/startup/sme.c                  |  9 +--
>  arch/x86/coco/tdx/tdx.c                      |  6 +-
>  arch/x86/events/amd/core.c                   |  2 +
>  arch/x86/events/amd/ibs.c                    |  1 +
>  arch/x86/events/amd/lbr.c                    |  2 +
>  arch/x86/events/amd/power.c                  |  3 +
>  arch/x86/events/amd/uncore.c                 | 15 ++---
>  arch/x86/events/intel/core.c                 |  1 +
>  arch/x86/events/intel/lbr.c                  |  1 +
>  arch/x86/events/zhaoxin/core.c               | 12 ++--
>  arch/x86/include/asm/acrn.h                  |  2 +
>  arch/x86/include/asm/cpuid.h                 |  8 ---
>  arch/x86/include/asm/cpuid/api.h             |  6 +-
>  arch/x86/include/asm/microcode.h             |  1 +
>  arch/x86/include/asm/processor.h             |  2 +-
>  arch/x86/include/asm/xen/hypervisor.h        |  1 +
>  arch/x86/kernel/cpu/amd.c                    | 26 ++++----
>  arch/x86/kernel/cpu/centaur.c                |  1 +
>  arch/x86/kernel/cpu/hygon.c                  |  1 +
>  arch/x86/kernel/cpu/mce/core.c               | 63 ++++++++++----------
>  arch/x86/kernel/cpu/mce/inject.c             |  1 +
>  arch/x86/kernel/cpu/microcode/core.c         | 23 +++----
>  arch/x86/kernel/cpu/microcode/intel.c        | 12 ++--
>  arch/x86/kernel/cpu/mshyperv.c               | 29 +++++----
>  arch/x86/kernel/cpu/resctrl/core.c           |  6 +-
>  arch/x86/kernel/cpu/resctrl/monitor.c        |  1 +
>  arch/x86/kernel/cpu/scattered.c              |  3 +-
>  arch/x86/kernel/cpu/sgx/main.c               |  3 +
>  arch/x86/kernel/cpu/topology_amd.c           |  3 +-
>  arch/x86/kernel/cpu/topology_common.c        |  3 +-
>  arch/x86/kernel/cpu/topology_ext.c           |  3 +-
>  arch/x86/kernel/cpu/transmeta.c              |  3 +
>  arch/x86/kernel/cpu/zhaoxin.c                |  1 +
>  arch/x86/kernel/cpuid.c                      |  6 +-
>  arch/x86/kernel/paravirt.c                   | 29 ++++-----
>  arch/x86/kvm/cpuid.h                         |  3 +
>  arch/x86/kvm/mmu/spte.c                      |  1 +
>  drivers/cpufreq/longrun.c                    |  7 ++-
>  drivers/cpufreq/powernow-k7.c                | 14 ++---
>  drivers/cpufreq/powernow-k8.c                | 17 +++---
>  drivers/cpufreq/speedstep-lib.c              |  6 +-
>  drivers/firmware/efi/libstub/x86-5lvl.c      |  1 +
>  drivers/hwmon/fam15h_power.c                 | 14 +++--
>  drivers/hwmon/k10temp.c                      |  2 +
>  drivers/hwmon/k8temp.c                       | 12 ++--
>  drivers/thermal/intel/intel_hfi.c            |  1 +
>  drivers/thermal/intel/x86_pkg_temp_thermal.c | 15 ++---
>  sound/soc/intel/avs/tgl.c                    | 25 +++++---
>  49 files changed, 235 insertions(+), 173 deletions(-)
>  delete mode 100644 arch/x86/include/asm/cpuid.h
>=20
> base-commit: d7b8f8e20813f0179d8ef519541a3527e7661d3a
> --=20
> 2.49.0
>=20
