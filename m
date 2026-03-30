Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289AA2BE642
	for <x86-cpuid@lists.linux.dev>; Mon, 30 Mar 2026 20:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774902132; cv=none; b=kYIvcAsDiA4KuJLcavi+2OR0tGkw4wuJtyWit1LFUgExaz8SNLk3GWzKy8poT9Wq8R/1kTGJROctRtG3CncFohQWlieHZxPOsdfdjnoI/nv2mZndy/DCk1AaI+PS/Scnn5i52DOWNDNSNh2HVhYWt8XCJAZdQFKF65B6x50MEwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774902132; c=relaxed/simple;
	bh=We4ZjVjNjOTol2XjP++h32vYdwZeglqE60eGXJG5PwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HR73Ufu6Ol9uPgYfAfWo9//wDhNqh1ipWKFRLOYGZJp7+v/NO/wwbuuoY0FiRul7NX3w2DgNxvugeUQdDPO0o2zyvir0PgoN3syUyu8+0Jo3ZkGLlOCp1P+xvjonBaC+1AY1/FZ0jsYuoH6qqt54ijWMbsTDd0P3CI6r3297WPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=adStxN+h; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nKwo6gSf; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="adStxN+h";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nKwo6gSf"
Date: Mon, 30 Mar 2026 22:22:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774902129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5A8tkX3YntkKwuWW7Ps0VVntxvwiR1iVI5TSScUuOdM=;
	b=adStxN+hQ29rmhgXIMzRqEjqk2LyfAwHMDkgqs8Sze2WJuaJ1pkHPtFnREQ+uKdlAl+E0r
	CTj5nTR41rV3H9m2oJ7APaZWDLLOmrwFaw4htl+6/fOaB9K75nOuvAfSy9687iMPAz9fQ5
	C3+4GR+30JcFSSbaSWK55XxoE39Ep3TjrvaU0XhuWAPBnKfpYkwH/UYqWfKIU9xj53LjBj
	2F/xrYWh10vdmbjUu98zwayv0SGn/dJ6JX8+CfO3GPOXze8sKB1yjVOp6R1R4OI2zGaX4s
	Cik4vqTMwUFX5f6A0SCyKJpkpZjEQdBMYwbWF/JfW7EmaF4EwaoQiSRN2sGXAA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774902129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5A8tkX3YntkKwuWW7Ps0VVntxvwiR1iVI5TSScUuOdM=;
	b=nKwo6gSfHDSv1pGjUwH3JPw+uCGwILmmgQS7xMLT2ibA7+YKDMQmzXB4i5I2yZNfGIMc2M
	m8t5NWMuPMCHZ/Dg==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Sean Christopherson <seanjc@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Christian Ludloff <ludloff@gmail.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	Maciej Wieczor-Retman <m.wieczorretman@pm.me>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [ANNOUNCE] x86-cpuid-db: Release v3.0
Message-ID: <acrbbpXFiTsbiX5B@lx-t490>
References: <acX0Drk_6qD97nbq@lx-t490>
 <646c19398708901454c7336e408d80f8695060fe.camel@infradead.org>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <646c19398708901454c7336e408d80f8695060fe.camel@infradead.org>

Hi!

On Fri, 27 Mar 2026, David Woodhouse wrote:
>
> It still doesn't iterate over the hypervisor blocks at 0x4000_0x00 and
> find all of them. Both Xen and KVM will advertise the Hyper-V leaves at
> 0x4000_0000 and then their own get shifted to 0x4000_0100. And now we
> can host HyperV-enlightened Xen guests under KVM, perhaps we could do
> HyperV, then Xen, then KVM at 0x4000_0200?
>
> I was checking to see if it has all the ways to detect the Extended
> Destination ID enlightenment documented in the last page ("Hypervisor
> detection via CPUID") of https://david.woodhou.se/ExtDestId.pdf
>
> I think I see the Xen and KVM bits there, and I guess reporting them
> with different strings in feature.c is kind of OK? The Bhyve and
> Viridian bits are missing.
>
> Also, the leaf at 0x40000010 isn't necessarily VMware-specific; it's
> seen elsewhere too. At least EC2 exposes it under KVM. See thread at
> about https://lore.kernel.org/all/aLDo3F3KKW0MzlcH@google.com/
>

Yes, it's in the plan.

The priority is to get the CPUID model into the kernel:

  [PATCH v6 00/90] x86: Introduce a centralized CPUID data model
  https://lore.kernel.org/lkml/20260327021645.555257-1-darwi@linutronix.de

including its newly-introduced X86_FEATURE synthetic and hardware-backed
words routing to the CPUID tables.

Then, convert the remaining call sites invoking CPUID, then begin tackling
the guest code querying leaves at the 0x4000 range.

Thanks,
Ahmed
