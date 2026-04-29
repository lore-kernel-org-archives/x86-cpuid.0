Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AED341AB8
	for <x86-cpuid@lists.linux.dev>; Wed, 29 Apr 2026 10:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777457101; cv=none; b=qYWqFnSV5EXVGg67oqH5fPG1Uky/ptBd5i708dngVfmJneLmYIPj6rq2lI21knJTW/T/QaxOIxhKsb15JGnFVX53QA0CYSur+i/hIfcrzem86Q3+OPtivgYkQWcgrh//wu6WntEdS7iJd5rVnGbktTPj33GGK3GrZlnwJidFiec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777457101; c=relaxed/simple;
	bh=VUWr6+GtqierVc28TMwnK8TQ3Uqjscy02ugrt/GE1xU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iMHkJrqeVI6JrYPV+RH6bAn6B8m64ivHzBldDwIWgBeHRtIB9dzYXEcQEAaPtEgnSAEWxtYz6SLfv8OZPbWnlhDsFRmhkqrOddf7iyx46w0PZDT3flFTSla2Z3OCVndXAB6qcKWXmdOJwpJq8qPvWRChn7aTfyqANrcBELRuo6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CXG7zY1L; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=rhphyHyi; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CXG7zY1L";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rhphyHyi"
Date: Wed, 29 Apr 2026 12:04:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1777457097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8ZjQCAvxqXc+5t7FrSoiojVDH/7PHIuO52jjify+RIc=;
	b=CXG7zY1LDKozqMnAYI70Ec69tXivbund3GaR3rSIAW7QBpECLvDG+0lG9Hr9MUeaFthiKe
	d7VhSRyhZ/WMOI9A7b0fXhvox3sWEyOT7oJ+mcB4nphxGMMhyEPtrkULUH9U5QMMFmMGET
	NweSSfAYlxBcv0ISb+FlOkais35dnn8yKyZz8hBxoZDO7Se31NaBVKDLANHSzzLYFzJPvi
	K6qsfSpdD/KDIicRbmW79IEr10T/mQ02vgmo//sYs0jSDiMPWDTM9oEP+kcQLwXQ3JuPY4
	dTu1hbJzXAAiYtMjsjFR4Jp67VEzYpq/yVNNixF7ywb3LGZ8C9bh+WWKmf/4ng==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1777457097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8ZjQCAvxqXc+5t7FrSoiojVDH/7PHIuO52jjify+RIc=;
	b=rhphyHyitqDJecb7iPB24dzp5YG3BXfzEhIr/C6DqixSXgueFXeHVgwue28RF3bGhl7jl0
	W606sHGd+4hOYYBg==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
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
Subject: Re: [PATCH v6 21/90] x86/cpuid: Split parser tables and add
 vendor-qualified parsing
Message-ID: <afHXx3Cmd7jlva4Z@lx-t490>
References: <20260327021645.555257-1-darwi@linutronix.de>
 <20260327021645.555257-22-darwi@linutronix.de>
 <ad_mwz-EtyAQLLoR@wieczorr-mobl1.localdomain>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad_mwz-EtyAQLLoR@wieczorr-mobl1.localdomain>

On Wed, 15 Apr 2026, Maciej Wieczor-Retman wrote:
>
> Isn't the general kernel coding style to put these multiline defines in curly
> brackets? Then they're not needed when assigning the macro to a variable:
>
> 	-static const struct cpuid_parse_entry cpuid_parse_entries[] = {
> 	-	CPUID_PARSE_ENTRIES
> 	+static const struct cpuid_parse_entry cpuid_early_entries[] = CPUID_EARLY_ENTRIES
>

That looks better; will do.
