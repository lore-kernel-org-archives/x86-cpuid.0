Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA143BED14
	for <x86-cpuid@lists.linux.dev>; Mon, 30 Mar 2026 18:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774895370; cv=none; b=IS6VUlbZfegwgZKk3XGUq+1qgHywJWznZGzP2o8KNZfKcPcsR2SCYu+gTbcGYM70PYPWyUJg8ERCdaSHF7ZaYtPX957u13sGf/cxlcAWryqesturUgJVGcsFLCTPlMTagPdXkdruGti5zaVFH/NcUqZBSEwdqap827a6/GUgdik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774895370; c=relaxed/simple;
	bh=PDy1XWfkqoUnJwDZ47Gs6f2XLQKquswLKOIBMI0mfso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bge/KvnQ2fA0vj3Llsmto8NOEuDrEII0W1AkIv9M3bH5he7H0ByGoUjKDRjr+gJPLCzAjtlBpDJvvc3caOPhWY+RKmmcj9bY8XglJHyzGxcKnFPJISNrIhawtbLeWJiwP1gQu+YIciwTMPKwmC6dSlGwyy+VQsC1uYwr3g5o+IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=EJ2cpeMN; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TAvh8Iu9; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EJ2cpeMN";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TAvh8Iu9"
Date: Mon, 30 Mar 2026 20:29:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774895367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+A2BpRVjxd+Gcfbf5YqHJ63xnyE6g1cnSQE7sFuSYgY=;
	b=EJ2cpeMN74oEPgh5mprnttmK97dDg6RifdHF3aHCcEALFC0hJxS7ko9gMOrLSpeie7BU9h
	No58sP+1ueQB4RvPUppzrsd21ew3+azRywWII1yGVQ0X5+ydr6/IVz0QDx8WKhEzLZHvMz
	lGLb0QObGCOKZJvzBgi2p8wIajepOA3ug6/qhTmO/6z0PjsRnRkbjWTBUQO1mz/OARjMNL
	wLPgSf5LXlxTe45WmgIPAWEfoEg5HbdmDJzuregTsVNuruwrc76KXNVbTX5krS2frOUsye
	AdwSLwHPmnumygHXQpm7p7cmDw5653uIqohanr3aemwZz0mTDd+O/5bWmjfLvw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774895367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+A2BpRVjxd+Gcfbf5YqHJ63xnyE6g1cnSQE7sFuSYgY=;
	b=TAvh8Iu9uRbaKu91XytJA9Tdgsw2ANcemd1twzYsHE7kRNcWE2IcwNF+/N9f/qCR9Ysurq
	5o6UqjcOi/a77IAw==
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
Message-ID: <acrBBFyU_vi4zFOx@lx-t490>
References: <20260327021645.555257-1-darwi@linutronix.de>
 <20260327152354.GBacahCioljpw5QqUc@fat_crate.local>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327152354.GBacahCioljpw5QqUc@fat_crate.local>

Hi Boris,

On Fri, 27 Mar 2026, Borislav Petkov wrote:
>
> Hmm, this makes me wonder: we have cases where we take a x86_capability
> element which mirrors a real CPUID reg and then turn it into a synthetic
> word because we end up using only a handful of the real bits and there's
> no need to have almost unused word.
>
> Example:
>
> ddde4abaa0ec ("x86/cpufeatures: Make X86_FEATURE leaf 17 Linux-specific")
>
> I guess I'll see what happens when I reach the end of the patchset - I'm
> just pointing this out now, before I forget so that we don't shoot
> ourselves in the foot ABI-wise and for no good reason.
>

That commit got my attention indeed, and it is referenced below:

  https://gitlab.com/x86-cpuid.org/x86-cpuid-db/-/blob/v3.0/db/xml/leaf_4c780001.xml#L360

There is an important difference with this series though: all hardware
backed X86_FEATURE words do not consume extra space.  They are redirected,
at compile-time, to their respective entries in the CPUID tables.

It is the synthetic X86_FEATURE words which now consume extra space, as a
unique 4-byte entry in the CPUID tables is required for them.

Now that I'm thinking deeper about this, I guess I should revert that
commit above at this point in the patch queue:

    76  x86/microcode: Allocate cpuinfo_x86 snapshots on the heap
==> NN  Revert "x86/cpufeatures: Make X86_FEATURE leaf 17 Linux-specific"
    77  x86/cpuid: Parse leaves backing X86_FEATURE words
    78  x86/cpuid: Parse Linux synthetic CPUID leaves

Then we let X86_FEATURE word 17 be redirected to CPUID(0x80000007).EBX, as
it was before, and save the CPUID table 4-byte entry for a future synthetic
word.  I'll have to update the XML accordingly, but it's no big deal.

Thanks,
Ahmed
