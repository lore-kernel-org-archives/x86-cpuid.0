Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D93735836B
	for <x86-cpuid@lists.linux.dev>; Mon, 27 Apr 2026 18:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777315529; cv=none; b=s4rpg1KWmQ+IYZrTkdCQ4Us0TDpHkYUXnHJNp5i8SUG5urJID6127McdN11NQAFflhzG5b507FH+gXdxNV87p/10mZGbKc72THs0PwbaDvwbHKaLGThWGK3nSa6p1eJrVW42R/LMyLVrfTYazP8MlQoFj8CIxioQ/F/IzivM5pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777315529; c=relaxed/simple;
	bh=C+Ax/ykGMiSFKPsMkDUVv7dfA30yNlIXifl4yS1AxCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VsO+L40KJtMeWhS5QLLpZJX1GJTb/LEgvK0UKTRb1n0jYxCRFwXlFejviXuleY3AontEGHw3W5Ca/RlM4Z0b9PpScpn4q7/oWCSFeAkUeEyPY8WgM7UsOzGXqd/09jIP/j/G/QBwAEzwvduUjKUP22WSHCVFHUNNuqIoyWaF+1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OhuceKuV; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PgVCJd8R; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OhuceKuV";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PgVCJd8R"
Date: Mon, 27 Apr 2026 20:45:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1777315526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iTePoKXOpwN0V7137q3rKyrGgRkFfMLxGc1Ygas6uhM=;
	b=OhuceKuVVQU+tUmyyJl+7P6OKiW9YvSJR7RNqmlwrs2+f7IjqVs3t9L+CNy2topUpewLYv
	WtWdTpDgl6z00RAqtRdOdAmCOxEsgNIg0NJnxrAHRMOciRQHk6g13WFWWc0QnvEiUye9on
	RHQGQfV8lESOyhgbhxfv/CQpBCdrPo5uUcrkeH/d4yoxLL/7FIQhZtiFRdW6u6ypvhk0uv
	Ek+O20TmOnNmEHxQFSqEEhgxr0SglXlPOvgKuVG9KLVxaj+67kWOV9cClSGTd7k36inZpg
	A8Us1UoAjd+IqB5hTJtK/luDQeGn/ybB2uD2IGfgnClcBaWqvqofGmsZoaBcYA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1777315526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iTePoKXOpwN0V7137q3rKyrGgRkFfMLxGc1Ygas6uhM=;
	b=PgVCJd8R8YXeZotz9pJ4D55nepcjQxE+PeiKA5EYTCtt3sdNy8gKYB0e1v+9GKzRfV/Vxg
	AuPSG/UdPA9aPYCQ==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Sean Christopherson <seanjc@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Christian Ludloff <ludloff@gmail.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 00/90] x86: Introduce a centralized CPUID data model
Message-ID: <ae-uw9836AJScRsq@lx-t490>
References: <20260327021645.555257-1-darwi@linutronix.de>
 <20260327152354.GBacahCioljpw5QqUc@fat_crate.local>
 <acrBBFyU_vi4zFOx@lx-t490>
 <20260330230836.GLacsCdDkVu0H3XU4l@fat_crate.local>
 <adz3z_MaWJr_GOtc@lx-t490>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <adz3z_MaWJr_GOtc@lx-t490>

Hi Boris,

On Mon, 13 Apr 2026, Ahmed S. Darwish wrote:
>
> On Tue, 31 Mar 2026, Borislav Petkov wrote:
> >
> > Well, since the goal is to have *all* CPUID leaves available to the kernel,
> > then we *technically* don't need the synthetic ones anymore with the exception
> > of a handful ones which we defined for ourselves, like X86_FEATURE_ALWAYS, for
> > example.
> >
> > But *all* synthetic bits which have correspondence to real CPUID leaves - and
> > they're synthetic because we wanted to save space... i.e., all those bits in
> > arch/x86/kernel/cpu/scattered.c, they don't need synthetic flags anymore
> > because the corresponding full leafs (damn spelling of Blätter eh!) are there.
> >
> > Then, I'm thinking, we can reorder all the remaining really-synthetic ones
> > into the unique 4-byte entries and then not even expose them in any db and not
> > make them available in anything because we will have to cast them in stone
> > then.
> >
>
> I guess that's a very sensible plan.
>
> The X86_FEATURE integration and synthetic bits work is covered by the late
> part of the queue (patches #77 => #90), so I'll rework 'em to do the above.
>

So I prototyped this.

Removing the scattered hardware-backed feature bits from within synthetic
X86_FEATURE words (i.e. the ones listed in scattered.c) required changing
the mapping tables at patch (79/90), "x86/cpuid: Introduce a compile-time
X86_FEATURE word map", from:

    X86_FEATURE word => CPUID table word
to:

    X86_FEATURE bit => CPUID table bit

That prototype actually did that and included converting all the capability
code at common.c: apply_forced_caps(), identify_cpu(), store_cpu_caps(),
microcode_check(), etc.

That part actually worked fine.

But then there were a lot of places with deeply ingrained logic that deals
with X86_FEATURE in terms of words.  This includes KVM's reverse feature
maps, early 32-bit ASM code, the AWK and shell code generation build
scripts, early boot feature validation, feature naming tables, and others;
all relying on X86_FEATURE word access. [*]  At that point, this started
looking like as a new phase of the CPUID work.

So, my suggestion would be:

* Keep the current word-granular X86_FEATURE compile-time mappings.

* Keep the current synthetic CPUID(0x4c780001) and CPUID(0x4c780002)
  bitfield listings, with their hardware-backed scattered bits, as is.
  Mark them as "v1" instead of setting them in stone.

* Work on getting this large patch queue merged, and in the background I
  continue transitioning the remaining CPUID call sites to the CPUID API.

* Then, after all that is properly discussed and merged, I'll follow up
  with a separate series that converts the X86_FEATURE mappins from
  word-based to per-bit, together with the KVM, boot/asm, and build-time
  machinery that currently assumes X86_FEATURE word access.  At the end of
  that series, the hardware-backed bits within the Linux synthetic words
  can be removed; along with all the scattered.c code.

I understand that with the current design, querying a scattered X86_FEATURE
bit (say X86_FEATURE_APERFMPERF) might lead to a different result than
directly querying its backing CPUID leaf (CPUID(0x6).ECX[0]), but this is
already the state of the kernel as of today.  So IMHO better have all this
new CPUID code merged and widely tested in a kernel release first, then
work on that next.

[*] git grep -E '(NCAPINTS|NBUGINTS|REQUIRED_MASK|cpuid\.flags)' arch/x86/

Thanks a lot!
Ahmed
