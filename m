Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067442FFF8B
	for <x86-cpuid@lists.linux.dev>; Thu,  7 May 2026 20:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778184140; cv=none; b=cz2rUvmfwiKRsJNxaHTqFKz2b5eNRAjVwlmAPBAYcL2QoQO3WoS7QTHMc/Sz0sNA0wlYupDcCvm2vssaooHLioUZhudEEsSWprkQVf0UQve/wR1Lm2Gc24D9LANZDIwAF+H/Mxy1Y62BkKMGpFsKYKVhecQ8CeTO6ZGNKYLkXJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778184140; c=relaxed/simple;
	bh=3frMAdaMSrhnjIvP6s1L3NnqNfvL+jxnPsDDsFgjax4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bzrKXJ9xtUvtMSpjE2t/SpcPXNt/LMKBdw6aCaika+YUX4IVZrfN5RugNzQyknDnPj7VB+jvFdloTwx+RVRJI8NzR61dukVjmpC//KUkVlh0fz+E9BTZFXTzsnAzOLbyNal/GxmqgjmewPDNVCCOaEIfd93EQYQNhnBJ1dkVung=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nfHygp2Z; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=eYv6RZe7; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nfHygp2Z";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="eYv6RZe7"
Date: Thu, 7 May 2026 22:02:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1778184136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Qp/+q7jz7DTqahWEA3gEFXcOkLMoxAPdyc7ONwnCMz4=;
	b=nfHygp2ZDdMWO5uhpO5rWWkWaP4dz2w7UgciGpIxP3st+aB0eJ+J/M6xmtKtYXoVKpWeAK
	n4TFxxxLbmWe5kOsHueOKyYq9sxHcMF+IikZKRh2WXhr8vmjXxDW3DRnxSHas8LNRdoOOK
	WEDDGz7pibBq3sEp3Xw+CSR1tJTqj5i/yXUmBUwbE+IvJZ/Qywf1uF4aSn5zuvFbGHG+nF
	48qJFANEOrPri5mb/jG/SgW0TbtMmXmzmiqi5/Ze1I9aFgLJEAYJWwz4aGqDrfx9wpHsn4
	9GwKvh4J6ATQtEmVIAJFPhhARKgzIlLY0j8Q+a28+XTuTx+LGgodwzRffe8BtQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1778184136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Qp/+q7jz7DTqahWEA3gEFXcOkLMoxAPdyc7ONwnCMz4=;
	b=eYv6RZe7feEIg6zVqo0CP1aQon0Kb9h0Z2SZjWFnJKCb+QwUJAVmrJ5h5GoWncue3moYpC
	j6v6+eEsN4sIafDA==
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
Message-ID: <afzvx3datNVJJtST@lx-t490>
References: <20260327021645.555257-1-darwi@linutronix.de>
 <20260327152354.GBacahCioljpw5QqUc@fat_crate.local>
 <acrBBFyU_vi4zFOx@lx-t490>
 <20260330230836.GLacsCdDkVu0H3XU4l@fat_crate.local>
 <adz3z_MaWJr_GOtc@lx-t490>
 <ae-uw9836AJScRsq@lx-t490>
 <20260505133350.GAafnxvtgFxJHth8WB@fat_crate.local>
 <20260505151242.GDafoI6oOOs9hknrrK@fat_crate.local>
 <afup8Zf9cmmACdoh@lx-t490>
 <20260507101732.GAafxmvEcQ3W3UHE1j@fat_crate.local>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507101732.GAafxmvEcQ3W3UHE1j@fat_crate.local>

Hi,

On Thu, 07 May 2026, Borislav Petkov wrote:
>
> On Wed, May 06, 2026 at 10:52:01PM +0200, Ahmed S. Darwish wrote:
> > For the /current/ scattered feature bits, the array which maps them to
> > their hardware backing:
> >
> >     static const struct cpuid_bit cpuid_bits[] = {
> > 	{ X86_FEATURE_APERFMPERF,	CPUID_ECX,  0, 0x00000006, 0 },
> > 	{ X86_FEATURE_EPB,		CPUID_ECX,  3, 0x00000006, 0 },
> > 	{ ... },
> >     }
> >
> > is needed.
>
> My assumption is that at the end of the patchset, scattered.c is gone because
> we have *all* hw CPUID functions present.
>

Not in this patchset, but in a follow-up one, yes.

For the scattered.c code to be removed, per-bit mappings to the CPUID
table, for the hardware-backed synthetic feature bits, will need to be
added.

Due to all the code which required per-word access semantics to x86
features, [*] I prioritized finishing the cpuid_word.*() APIs and such word
mappings first.

Thanks,
Ahmed

[*] KVM's reverse feature maps, early 32-bit ASM code, the AWK and shell
    code generation build scripts, early boot feature validation, feature
    naming tables, etc.
