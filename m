Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F991859
	for <x86-cpuid@lists.linux.dev>; Sat, 28 Sep 2024 07:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727508902; cv=none; b=fP4mBRo+4Chzcie0fU63h5bMcbTyHFDKFOuHv5abZrAIYlAI+5qgjcmMCd5C3O8TSA/Jy30jU2EC0cq49HIVXv3snYwxniRkrK7TdmHdDAeNDPuGNo3ZrNqCBMyoOjZI9qSur51/YMKIELQfjJ6yo7R59bMAj4YExoz7DqbJbb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727508902; c=relaxed/simple;
	bh=MTeaTOZDCAQhhj9oAtGx/p0E8P85Hz6Fss6gR1aXpPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CMK3xLT7bpHLDNPcyagTRrLLeXHL6V2fENhIEh3ln+ae0cvYg8Z7CctjoVNe7v7u5H8XdcoF3lf0jA2lJQZONwAcI/ARBKHbKk3LUe7qOk4iG+lVE4dW1hTwGdetRQvxhNY4AcDUTWKMpTPMopL9a9XsxUZGNvfrB3q9DvvuHi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=39gPvE7X; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wLSgFoRe; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="39gPvE7X";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wLSgFoRe"
Date: Sat, 28 Sep 2024 09:34:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1727508897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tQ8QHHIGdIFgRmt6yNOvGyEvmqk1RDNcer+n7njQefE=;
	b=39gPvE7Xb0l9lACx0UD3e+euHm+Zh3dmPk/R9C3kOlV1Up4ReFG80vbScLz4M+rJDUtirQ
	qCxWeGJ+YTZmpboou/knWtn5Zi3gvkQys1F3g2D/Ax/RvuVnvAji1tSYRFOBMmxaNzOjxc
	z4Qkx0eHjfe/5dOziodJctoYYRuaD8QNSp/SXBmpFkiyrAPVBnrEifGwOwPAp8yCM3j+kd
	nunsiWQbU6/sRZ9eXt6TVznDleaOMF5NQEILXd+yINvB09Q6oMudL4IKw/UBFmmxe03F0j
	LsoSSszY9cKMdXFK9u/3uoi19e+tBu/0IVPs/XWCkRRfRqdAhlOmiXBKhcHIiA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1727508897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tQ8QHHIGdIFgRmt6yNOvGyEvmqk1RDNcer+n7njQefE=;
	b=wLSgFoRe1Sl4WT2lDzGwZGfLz+FRaNthOk3sN2i0WXIb4EyXou00SNgd3jKP3in4TWn/zJ
	ARRGaLYjr3sH3ABw==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Sohil Mehta <sohil.mehta@intel.com>, x86-cpuid@lists.linux.dev,
	Thomas Gleixner <tglx@linutronix.de>, Xin Li <xin@zytor.com>
Subject: Re: [PATCH] db: Add Intel NMI-source reporting feature flag
Message-ID: <Zvexn9PPCmX0WEYw@lx-t490>
References: <20240923223213.852758-1-sohil.mehta@intel.com>
 <70cf05c3-0ba6-4a5e-a7ab-21cadad3c255@intel.com>
 <ZvVdzJIIqaC_javn@lx-t490>
 <a8fc6ca4-79e3-41f5-b195-e91d4d515f8b@intel.com>
 <6CFCC415-2F08-465D-B61B-E465A44DDD67@zytor.com>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6CFCC415-2F08-465D-B61B-E465A44DDD67@zytor.com>

Hi hpa,

On Fri, 27 Sep 2024, H. Peter Anvin wrote:
>
> Should we include a copy of this database in the kernel sources?
>

We expclitily didn't want it to make it a linux kernel build dependency.
Mainly out of a desire to use the database for other projects beside the
kernel as well, starting with Xen.

So, the tool have multiple transformers which generates "listings".  One
of these listings is now merged:

    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/arch/x86/kcpuid/cpuid.csv

The tool also generates Linux kernel C data structures:

    https://gitlab.com/x86-cpuid.org/x86-cpuid-db/-/jobs/7907817537/artifacts/download

We're working on a patch series for the x86 subsystem, where the above
data structures will be integrated in the kernel -- along with cpuid
accessors and a data model.

All geneated files also has tags on top that will allow KernelCI to
verify the integrity of these CSV or C header-file listings:

   "Tagging Conventions for Generated Files"
   https://gitlab.com/x86-cpuid.org/x86-cpuid-db/-/blob/tip/README.rst

(I was going to show this and other things at Plumbers x86 track demo,
 but sadly, BBB screen sharing misbehaved during the talk...  Next time
 I'll have a proper fallback mechanism.)

Thanks,

--
Ahmed S. Darwish
Linutronix GmbH
