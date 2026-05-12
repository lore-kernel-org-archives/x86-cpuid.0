Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D8835838E
	for <x86-cpuid@lists.linux.dev>; Tue, 12 May 2026 07:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778569952; cv=none; b=pn1ukcB2T5ep0i4RS5hKUp/bz7saStfkPIkgI93sTDE2EiTK2ST+v08Q0pGZbQCfoOYYK8T6RFifZEzQYqkHIxtpwtAo2VHKnbUAgI0VLITUGVW9utLiJp2IAl0DKDKWXnQcntnMx72YiuUKDJjakd/Lqt+zSf0ctIw9Zi2cFyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778569952; c=relaxed/simple;
	bh=y3xGxRhU8P3p25tma+ILdvLh+vTcfcxX48mFnTMpbME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NSFbpaNnoW4/gbT2XL9imM3za+9eNclOJ88T5NovlX+a6WG51fU6O2pZX5m7wIlFbCNrjakhfyhPb2+YUAiW/CNBVdp6CNUrTE3xCeCb7T/gYK/9PB30+KxVcVgwtGUUTDTM+5Cc0izzM1XMbscf1GbBt5Nf97W0tED8QS7Pa4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=EbbQ90Qp; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=UGpGME2i; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EbbQ90Qp";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="UGpGME2i"
Date: Tue, 12 May 2026 09:12:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1778569947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UAg2xq0V7tqbrCAEtFiD0UrDs2Rms2AALxJ+qW0fGgQ=;
	b=EbbQ90QpxXLswiFQ2AtloUIkoFqRmbBT95I4URILZJDHAQBnLySkf1+zwixKoTFjftrvvz
	a8WrvPzKhEvW8M4bM5a1rjbW5oC2ok9Q/rkesuhWxWvym2BSbe7G+OW8olDswwHjhpArY+
	wm3MizKy5u2SKumF8pNrZ1gWpCkqHdnGjxwRQluTjA85qqLUlBd9itVgtVM5uv3cQTX81C
	NaRca4xKEPbbNuJba7cvlOBE6mJF8qxibaKYwkI4Ipm1s76l54vh0CYWgTB6SGrVfqdBur
	w8idxN+2FTD9DjZ8bXMW0zZ8J/xxGut3JLkAd+jaOxyzacdE9UpTXqKpXJH4zA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1778569947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UAg2xq0V7tqbrCAEtFiD0UrDs2Rms2AALxJ+qW0fGgQ=;
	b=UGpGME2ivRGPdP0RMuQ4GCblWhdjbH11cjKix2wWHXsu9ktoLnb4eVd6lxE/UwOu6zS9cO
	IiSTvFkkGo+HCADg==
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
Subject: Re: [PATCH v6 10/90] x86/cpu: Rescan CPUID table after disabling PSN
Message-ID: <agLS2Y7smYRHyiHf@lx-t490>
References: <20260327021645.555257-1-darwi@linutronix.de>
 <20260327021645.555257-11-darwi@linutronix.de>
 <20260511200032.GAagI1YMP51EzCo7dn@fat_crate.local>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511200032.GAagI1YMP51EzCo7dn@fat_crate.local>

Hi Boris,

On Mon, 11 May 2026, Borislav Petkov wrote:
>
> Except that those changes do not belong in this set. So I zapped them, see
> below.
>

Yeah, fair enough.

> Also, why are you doing this min_t thing?
>
> +       rescan_from = min_t(int, l0->max_std_leaf, c->cpuid_level) + 1;
> +       cpuid_refresh_range(c, rescan_from, CPUID_BASE_END);
> +       c->cpuid_level = l0->max_std_leaf;
>

The min_t() logic is meant to handle both max-CPUID-level increases and
decreases after the MSR write.

Assuming a machine with PSN and CPUID(0x3) as the max standard level:

	c->cpuid_level == 3

	-> MSR write, disable PSN
	-> hardware: Max CPUID level becomes 2

	Refresh CPUID(0x0)
	l0->max_std_leaf == 2
	cpuid_refresh_range(c, min(2, 3) + 1, CPUID_BASE_END)

Then, the CPUID parser will avoid touching CPUID(0x1) and CPUID(0x2) and
zero the table from CPUID(0x3) upwards.

Similarly, at patch (13/90), "x86/cpu/intel: Rescan CPUID table after leaf
unlock":

	c->cpuid_level == 2

	-> MSR write, disable BIOS limiting all leafs > CPUID(0x2)
	-> hardware: Max CPUID level becomes 8

	Refresh CPUID(0x0)
	l0->max_std_leaf == 8
	cpuid_refresh_range(c, min(2, 8) + 1, CPUID_BASE_END)

Then the CPUID parser will zero and refresh all leaves from CPUID(0x3)
upwards.

So the min_t()'s intent is just to be defensive against hardware surprises.

If you think this is superfulous, then ACK, removing it will not harm.

Thanks!
Ahmed
