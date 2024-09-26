Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94A0175B1
	for <x86-cpuid@lists.linux.dev>; Thu, 26 Sep 2024 19:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727380651; cv=none; b=nrtzhZhb6hT2ZysYFaY2I606rmy1FKa/sfw6QYrsuJh4AiPPtKo37SvJeK1/yCDfteHuTMk0UWcmXcZ2Vi+F+gf9VPraOzM7b3cZJ/dUlaDVZGdkMAFw1+1eXzn3eq37qEP7Wc2aOyzzBecEy48TGCKxkxDXhJnEe++vkitCm5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727380651; c=relaxed/simple;
	bh=SWLsb2DQmEKhxQRvg4+3oFjvVF993XNC34Muruibfsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T4gcmbnfBdiqlEV86xXHpgV47VAQrrtz6q0rpZePIrkc6alUGkapTQEmbNuhg4qHINQAOQESw8Xj4vnsbixcYsfJ2fJVXv0OZXLlqrtSWFIDWiPC44mX2L25fTTz8FuKnMA6ysljCaZWGhHMTkcU5sAo7HEAGYTl34hdOYykHVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qXAoFAlx; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=t2JxyuVg; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qXAoFAlx";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="t2JxyuVg"
Date: Thu, 26 Sep 2024 21:57:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1727380647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iITCbX+BFlNJvH5GnrhnPUPOad19Lze5glvLVroqUfM=;
	b=qXAoFAlx2N3+R7+tpV6aDKqBYxAXyCFGnPEwU+zCvs9LbIsaeZUPDXaDGqdNFblEUsDQLz
	4UYkOyGiR7NoeCh+tFTjPd2yDeHs52xwEe1ukzErDREBZDMU+qQbKbnT523nk4bMu0r67N
	GTCfJNWXxdLvevgR4CqfApyrWl44CZycMcPEcBsOCxLMy+hMpGFZp4Cie30j0UnFrJq/l6
	TH7XEOHNWKMVG5LfTKPM3h2hgZ6ZoMQlGrQPLQNx8C+rPTG29f5GV2e4ez9lEz2jwio4aB
	hMHdycpTuZXGwOwt3bU7NMWNsDUcoSHKj9wTmqZnxs1IEY/fNCgWnM7wBil79g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1727380647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iITCbX+BFlNJvH5GnrhnPUPOad19Lze5glvLVroqUfM=;
	b=t2JxyuVgLOdWsOkK6cWJmtXlQdkSr+19HwOdLCj9mk1YrQXzng22N4jacipgs8PU5eTmb0
	w+KEDXss6FEA5CCA==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Sohil Mehta <sohil.mehta@intel.com>, x86-cpuid@lists.linux.dev,
	Thomas Gleixner <tglx@linutronix.de>, Xin Li <xin@zytor.com>,
	"H . Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH] db: Add Intel NMI-source reporting feature flag
Message-ID: <ZvW8pRCqV64eGk8q@lx-t490>
References: <20240923223213.852758-1-sohil.mehta@intel.com>
 <70cf05c3-0ba6-4a5e-a7ab-21cadad3c255@intel.com>
 <ZvVdzJIIqaC_javn@lx-t490>
 <27d8c0ed-62ae-4956-93d4-f68e554fedab@citrix.com>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <27d8c0ed-62ae-4956-93d4-f68e554fedab@citrix.com>

On Thu, 26 Sep 2024, Andrew Cooper wrote:
>
> I guess I need to start getting back to this...
>
> The Xen 'attrs' need stripping. More specifically, they need to live in
> Xen itself, because they are different by release, and are used in the
> derivation of what is safe to offer to guests.
>
> But the same is true for 'feature' too.  It's one think to know what the
> bit means, but it's something else to be making a statement about what
> is supported in an external project.
>
> When this is used in earnest, regenerating the headers will be needed in
> each stable tree to get e.g. the new speculation (anti)features, and
> doing so needs to not change the other features="true" for bits only
> supported in newer branches.
>

Yeah, correct.

I still remember our discussion on how the <xen> tag (and its
attributes) were not fitting Xen's model.  So, for now, it's indeed a
placeholder until work starts earnestly on that part.

Thanks,
Ahmed

--
Linutronix GmbH
