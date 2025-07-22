Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7935428BAB0
	for <x86-cpuid@lists.linux.dev>; Tue, 22 Jul 2025 14:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753193901; cv=none; b=Vw6fChESEJSiIe+zVcNo06GEja1AvXdsmyXaSFtCAMY3DlzpUtxZr9wWNOjPqI4R6yi3MYcp134XjkjUSJoxs4vy/Tn4sEKb5A7VyjEtrxjZ1ZySsGcMSkR/4C9OsCUCZOCSRBz01/SlohcBB4AsIow55o6BH/oupYPB4s5cVMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753193901; c=relaxed/simple;
	bh=bY3dgqDakttVxVXywMf1PUP4YMbHhxFk8wYvTlCOaiM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=k99jOOi3Js5EMhPAhnWSqK1lguXrKJA+b5RIsD+nwkrOnot5sUjFpm6Vm6ejbkcQRGa2ekoHIwfCDeDp2UOms18SpxrefT6vm4rMnY48Q/UFB6oLbDd4FFVWQ9xgN5JhIh5VpNZYCK40toV9UNzWJNayel1myZhOQ3LqATO8t6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JNjCwxFw; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JNjCwxFw"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2354ba59eb6so80244805ad.1
        for <x86-cpuid@lists.linux.dev>; Tue, 22 Jul 2025 07:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753193899; x=1753798699; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SXJbLhloouFQ+b/2jAnDLI5t1uyZweJN+ft9tmst/ws=;
        b=JNjCwxFwUJXnrnN6q/vao0qGjkcKzbarsxZrrP3bPtPxHvoqFssI9mTEpeY6Oos16X
         ID1amc/BT6osCq+/q1eoQ4M6bDg77jFxkMDdLH1DQj3eQdhbM1Vp57RnDhS48YQfms3x
         5HaiU+WLrloEh6oRmEZogicsW5+JHFXvVGVXLY2aBxsJ5kHAQRnjXIg2QGeQ6XNRZ2e+
         qe2yrVc+JMhNRVJTkFIDAQzL5HbsjLpZNifYPPVGvRZKxUqQRA6uPGsvD3lp3N/41N8n
         du5y8TjtJcm6QVqja0KrSPpF9qdyxN7LbCGun5D9BeEFmKtULZ3dKbwuKwj/gfQRtBJ7
         vIzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753193899; x=1753798699;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SXJbLhloouFQ+b/2jAnDLI5t1uyZweJN+ft9tmst/ws=;
        b=jNCKF/DsoSN5rHC7SHoiADCtaLtLGf5uq7ibrk6eTggmkVb6t5jOBFNOPBhg3TI2ZR
         52SlzEznhsLSE+VXV90n8Bpuh+3lWVdTYWQCzHpXXyUYp6LSjQK/xqz4bRvo+qfes3zn
         WRgcuiTpQV91WDQA0bMH0S+Jz2kZdq0XuYZ3UfQb9P/yCuhg6AemndK/yS74hqKTk6pH
         ZOC08jULPj+EYA7GCCoEXR92CvBhYoy8CJyjH+xJeUbW22SHJedOG/cXJJ3lywObyTwp
         qo/dEIm/PM9fhoegCK4NrK/gpvA6/20ogKSYR9Smsud0B/CXS6n0yZTptNRG4W1ILAur
         Dvxw==
X-Forwarded-Encrypted: i=1; AJvYcCVubAQkG5NfrC8LDxehNXMwR2L7vETXr5tZXx/0YiBOV3tvVBi5dQTIDdu40TTrJn5FOY1RQUu5yI8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwkQSvQf91jUpo7BTwVLk0NR9v9PbkAgKgapjxN+4QiHsbj4GFZ
	5Lq+lI5z+RiEhf+QmQgXVsJM8pajtOYdezEOS01n7GSfT4qSdzNfVmfyRkRXWakPtJ9c5tk41Cs
	GrUOx3w==
X-Google-Smtp-Source: AGHT+IHw9BMi9fY/PnH2o+mBsek9NwZ7XgWDcLI76MPdiLX0RkV1NMzna7IOYa8d2A4uzc7Oh0terxzIuSo=
X-Received: from pjyr14.prod.google.com ([2002:a17:90a:e18e:b0:309:f831:28e0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f650:b0:234:a139:11f0
 with SMTP id d9443c01a7336-23e2566b058mr326510735ad.7.1753193898784; Tue, 22
 Jul 2025 07:18:18 -0700 (PDT)
Date: Tue, 22 Jul 2025 07:18:17 -0700
In-Reply-To: <20250722065448.413503-4-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250722065448.413503-1-darwi@linutronix.de> <20250722065448.413503-4-darwi@linutronix.de>
Message-ID: <aH-dqcMWj3cFDos2@google.com>
Subject: Re: [PATCH v3 3/6] x86: Reorder headers alphabetically
From: Sean Christopherson <seanjc@google.com>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
Cc: Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Ogness <john.ogness@linutronix.de>, x86@kernel.org, 
	kvm@vger.kernel.org, x86-cpuid@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Tue, Jul 22, 2025, Ahmed S. Darwish wrote:
> Multiple x86 source files use the cpuid_*() macros, but implicitly
> include the main CPUID API header.
> 
> Sort their include lines so that <asm/cpuid/api.h> can be explicitly
> included next.
> 
> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
> ---
>  arch/x86/boot/startup/sme.c           |  8 +--
>  arch/x86/coco/tdx/tdx.c               |  5 +-
>  arch/x86/events/amd/uncore.c          | 14 +++---
>  arch/x86/events/zhaoxin/core.c        | 11 ++---
>  arch/x86/kernel/apic/apic.c           | 70 +++++++++++++--------------
>  arch/x86/kernel/cpu/amd.c             | 25 +++++-----
>  arch/x86/kernel/cpu/mce/core.c        | 62 ++++++++++++------------
>  arch/x86/kernel/cpu/microcode/amd.c   | 12 ++---
>  arch/x86/kernel/cpu/microcode/core.c  | 22 ++++-----
>  arch/x86/kernel/cpu/microcode/intel.c | 11 +++--
>  arch/x86/kernel/cpu/mshyperv.c        | 28 ++++++-----
>  arch/x86/kernel/cpu/resctrl/core.c    |  5 +-
>  arch/x86/kernel/cpu/scattered.c       |  2 +-
>  arch/x86/kernel/cpu/topology_common.c |  2 +-
>  arch/x86/kernel/cpu/vmware.c          | 13 ++---
>  arch/x86/kernel/jailhouse.c           |  9 ++--
>  arch/x86/kernel/kvm.c                 | 35 +++++++-------
>  arch/x86/kernel/paravirt.c            | 28 +++++------
>  arch/x86/kvm/mmu/mmu.c                | 56 ++++++++++-----------
>  arch/x86/kvm/svm/sev.c                | 25 +++++-----
>  arch/x86/kvm/svm/svm.c                | 50 +++++++++----------
>  arch/x86/kvm/vmx/pmu_intel.c          |  6 ++-
>  arch/x86/kvm/vmx/sgx.c                |  2 +-
>  arch/x86/kvm/vmx/vmx.c                | 18 +++----

If this series is squeezed into Linus' tree just before rc1, I suppose I'm fine
with this patch.  But I am NOT providing an ack for general inclusion, because
the potential for pain is not worth the warm fuzzies we get by having sorted
includes.
