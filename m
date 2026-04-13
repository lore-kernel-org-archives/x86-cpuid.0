Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05BD3D3CF5
	for <x86-cpuid@lists.linux.dev>; Mon, 13 Apr 2026 14:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776089047; cv=none; b=uhoQpfcB38V4f8OYnzFTaDwnOMEY92kDVReVZkS78qFYRLc5WDE2BTLIHBdD48w7IPuVRFkZugmKPUNb1otB5tomSmRZ+9HPCXl7nq+URJ9vyaWpMGJPDvF+MLDQyMMIC539Gc21TdGaX9cFDVv/ELlFYkDdsJnA3Dosx7YMLj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776089047; c=relaxed/simple;
	bh=0XmGHg9S44+y10KfivGmGkIFlI+XOrx5liBw6WqhfqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mWqHrVoMbNF1FgZZH6+OrKjx+PSzM2ea5lr7WXdd3A9rqy9IpNVbqOyj2ZnFbjhB3H8yUWbBr94bG+BIuaO/9nWqtTerMa8ofjjDUvzBh8e5IyUUlDmxim+7SC8AFJQxPRIxaWGv49XHEMG3yvDvzEzK0S8NEMlXC1J0R8kImkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=EaXpdEH2; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=8JtVdUk8; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EaXpdEH2";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="8JtVdUk8"
Date: Mon, 13 Apr 2026 16:03:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1776089042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0XmGHg9S44+y10KfivGmGkIFlI+XOrx5liBw6WqhfqQ=;
	b=EaXpdEH2FW1t0YTo8KR2Nqk1OkjMlRQCA1EKPJY4S9yr3y5B/Bvr8xcrEoSaCOytt+2kFC
	+udFDTVgrEMWl3LWDxog/Mr1+mSana0g/g4LTRQquWQyhkjNhoMWo5V/GKy7v/X/4kMCJa
	nabXUo93FtF7A8sE5A376E8dFkgk4/cZYIM7nxwZw/rrdVxNobKdWp7aPas2qpGSDiX7Ko
	6hwpnCrUEQ12xq0Rd0oWImZMa1BUBTVa9ctdAJM2xTXweiwqfSHuA+EOyiKxU/yEEauslb
	pTCpOk97OTGOJX7V1yCnxLaFpSMV+lYusyx9Lw8RIjpb0zApzdyaxruaH/CEQQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1776089042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0XmGHg9S44+y10KfivGmGkIFlI+XOrx5liBw6WqhfqQ=;
	b=8JtVdUk8mTyybj5lVhxgKh1vwj11qmMp6UE79Ly8+LBKdhyUPxgjGiHweEJXYpSuU2ZZjx
	JjDZ/sczeoKZYfDA==
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
Message-ID: <adz3z_MaWJr_GOtc@lx-t490>
References: <20260327021645.555257-1-darwi@linutronix.de>
 <20260327152354.GBacahCioljpw5QqUc@fat_crate.local>
 <acrBBFyU_vi4zFOx@lx-t490>
 <20260330230836.GLacsCdDkVu0H3XU4l@fat_crate.local>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260330230836.GLacsCdDkVu0H3XU4l@fat_crate.local>

Hi!

On Tue, 31 Mar 2026, Borislav Petkov wrote:
>
> Well, since the goal is to have *all* CPUID leaves available to the kernel,
> then we *technically* don't need the synthetic ones anymore with the exception
> of a handful ones which we defined for ourselves, like X86_FEATURE_ALWAYS, for
> example.
>
> But *all* synthetic bits which have correspondence to real CPUID leaves - and
> they're synthetic because we wanted to save space... i.e., all those bits in
> arch/x86/kernel/cpu/scattered.c, they don't need synthetic flags anymore
> because the corresponding full leafs (damn spelling of Blätter eh!) are there.
>
> Then, I'm thinking, we can reorder all the remaining really-synthetic ones
> into the unique 4-byte entries and then not even expose them in any db and not
> make them available in anything because we will have to cast them in stone
> then.
>

I guess that's a very sensible plan.

The X86_FEATURE integration and synthetic bits work is covered by the late
part of the queue (patches #77 => #90), so I'll rework 'em to do the above.

Can I get some review feedback for the patches on top (patches #04 => #76)?
They shouldn't be affected by the requested X86_FEATURE changes.

Thanks,
Ahmed
