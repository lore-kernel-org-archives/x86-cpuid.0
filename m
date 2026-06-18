Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E061F32AADE
	for <x86-cpuid@lists.linux.dev>; Thu, 18 Jun 2026 19:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781810873; cv=none; b=gTNUPr27PKf+GTagLkJh1OiiJCIAaAHhrPCdvP5G8y1wTBdWk0iyS11Xqi5rikDZ/XUS1xqAdwLisOG8gozI6NYx2swgsozvEeGsGGS5Q9yjtJtcyoMmBiQNqAQeiGV7IGzI8OT+TPm8iK1tlu0vGIAXCqPSbu8BX8PZ9kfXTfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781810873; c=relaxed/simple;
	bh=51W7AgFfOz6Q+7F3xhXlcVONcWuSDrk2VaGVTaJ1p6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A38LkXTjGRQXLIL+mSiL48WJQQa8NdxM73DlD31bH69bv7yAUnkWHGoD2swGRZSmHUL2PbD8SLCGTk2K1VBtO35hmjmeOinO/EnLx4LppDDWu4VsesYrwETOUtmkhNuJEQyTNgCVQ2UNIwqBju/KRseY5z39GZrDD/pERISkVAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ddx53F4E; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MPKvHFrF; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ddx53F4E";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MPKvHFrF"
Date: Thu, 18 Jun 2026 21:27:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781810870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O+5a8GzWDpM02SkSyUwjEtcCko0mBvjiVPjg661o4tM=;
	b=ddx53F4Er5lFAX+ysN8YpcrhUDFbNRFuo5W+gKWH3jAZJXisEPnrFKFbGLV+kFV1FPVICU
	mC5wxQvDALs5FOq2tBd0rqhDYkz0TWempb0hZ0KWRXOQ+Rhu4e4W3OJCBgRGjL+lJsvsnv
	OuUlo9laR87CCYUJwQLIX3tOUxG0OVfbNFXMZoZxUImOQySQnknqz+AJ0fV9+O7HsG/oDX
	8II/Ts+FzRbup7pTRX7xC0MNP62q96RvxSFfRD/uz92JaVrzv8LDqHDyncDhUvRG5p8mqJ
	dE3FFEtqtRmnTg+RnUOq/TCg8b81WLnc4pt5SbNGFA1gOZeyzMyNXxWLl/9Npg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781810870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O+5a8GzWDpM02SkSyUwjEtcCko0mBvjiVPjg661o4tM=;
	b=MPKvHFrFYZIYuJZXSQHrMS58EOfvbWADndzhXdAagZd9XhteUY3zOzX6kPfhsF/Dd8nB88
	19ZZHLPcsmLCdlAQ==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Christian Ludloff <ludloff@gmail.com>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 017/120] x86/cpuid: Introduce a parser debugfs
 interface
Message-ID: <ajRGtILHGoVNKDGN@lx-t490>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-18-darwi@linutronix.de>
 <20260617044123.GBajIlc_E_bvkArzS4@fat_crate.local>
 <ajRC9NqMyEtxSj2X@lx-t490>
 <20260618192058.GEajRFGlay3L0PDwBF@fat_crate.local>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618192058.GEajRFGlay3L0PDwBF@fat_crate.local>

On Thu, 18 Jun 2026, Borislav Petkov wrote:
>
> On Thu, Jun 18, 2026 at 09:11:48PM +0200, Ahmed S. Darwish wrote:
> > On Tue, 16 Jun 2026, Borislav Petkov wrote:
> > >
> > > Except that debugfs *can* become an ABI if something ends up using it,
> > > despite all of my WTFs recently.
> > >
> > > So I think this patch belongs out-of-tree, to be applied only when we
> > > want to dump stuff but not have it in-tree casually...
> > >
> >
> > This shall help with tricky future bug reports to ensure that all the
> > tables are in a sane state.  This is especially true for cases where the
> > tables need a refresh but they were not refreshed for one reason or
> > another.  Maciej just reported a case like that at the late part of the
> > patch queue thanks to this.
> >
> > Can we at least keep this under a kconfig option that defaults to N?
>
> You tell me:
>
> https://lwn.net/Articles/309298/
>

Yeah, fair enough.

I'll include this patch then at the very end of v8 so that people can
still easily test the series.  I'll note that it's not to be merged.

Thanks!
Ahmed
