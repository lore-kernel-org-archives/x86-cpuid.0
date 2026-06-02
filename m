Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A200379C43
	for <x86-cpuid@lists.linux.dev>; Tue,  2 Jun 2026 20:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780432574; cv=none; b=hCw1QfIm6DUTK7DwluUjyzY8Ta9X0FfkzbxpsblGyYkXs6BGQyq+4i9Zqn92g93ojDv1Y2/GHwv2W1nnVwsU+q7kT2ML3fwZwX4GlbOUrKyVb0i+LT5EkzeHZNjsg9xEf1tUOIPRX1dz4exTLLJm4PQZkF+VKq4VKyoFcUT9YAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780432574; c=relaxed/simple;
	bh=e76iSRU93jvofF6PlkUB74YoeaGjdwgCc41EqZIkhJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WD1tTZOwGjUBnOT4hFL2vFrjeLTzYIARFbrCeh5ddd7PAuwUB/J5Htj9DAbHU0X72Bddr97JuVxoqV8NKb3VUmiy7n8jNfXsyWQqm9RBhJfNp7jppTHwJmHGk9iHWrHsCMixe4ihjwo3zTVZr63LY7axVcKSkeib8xa/xQBcREI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=LHkX1FfI; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dX5nU65P; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LHkX1FfI";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dX5nU65P"
Date: Tue, 2 Jun 2026 22:36:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780432571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7utZFboU00HrF0aYWO3k0BY57up7/Pvp8NOTPZoQwD8=;
	b=LHkX1FfI2uf+uen+z70iyHLWZa9IBmVBmyV+QuwcjkO0NrJKFRe2jkHhtlHr3FSllfmKJT
	TygBbzFsCQvu1nsoylXuC/2ZFBUsw7Skvo0FNAp8MwYTQSj4056ENoObMP+3Tv0epAA/9d
	BIlXk9nsVPki1GYmX0YXg+6cLmoiVbIVCv4wA5kNZFeq1DwOCHmfmxErbNDRm/PjQroRpC
	QSpmERqd1pLA+ZwmKHjgoIzUc8ULes3umyf8JCKX7oJBNKBw3zNE1CSlCvKUX4RfsBAVky
	IqE1IW6EBb5we2h0Ky14/mSSH9GHElhJstf7bMz3DApltcMntRI39htDsAhB8A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780432571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7utZFboU00HrF0aYWO3k0BY57up7/Pvp8NOTPZoQwD8=;
	b=dX5nU65PwSZwVMLuRBQYeWfderpHvqYZzwNdFXqAxj2dzwkt9vfZlThwppz3QpYWQD2reQ
	XsnFNJYaHM5HTVBw==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Borislav Petkov <bp@alien8.de>
Cc: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Christian Ludloff <ludloff@gmail.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 004/120] x86/cpuid: Introduce <asm/cpuid/leaf_types.h>
Message-ID: <ah8-uSSdb1KcLByV@lx-t490>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-5-darwi@linutronix.de>
 <ah2WBnBkz8KQrph0@wieczorr-mobl1.localdomain>
 <20260601194150.GDah3gfjoIZIByCa3d@fat_crate.local>
 <ah3jPMYIxC1vsUUB@lx-t490>
 <20260601203452.GAah3s7FevsRDFT7rF@fat_crate.local>
 <ah34pi6j5HSMJdrL@lx-t490>
 <20260601225306.GDah4NUvJwaqQem4VQ@fat_crate.local>
 <ah7_wPJ8_FGLOwZd@wieczorr-mobl1.localdomain>
 <20260602174746.GJah8XQvEJo9UKru1l@fat_crate.local>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260602174746.GJah8XQvEJo9UKru1l@fat_crate.local>

On Tue, 02 Jun 2026, Borislav Petkov wrote:
>
> Well, I think it would be best if in such cases we do both: send it against
> x86-cpuid-db and then generate the kernel patch from it. So that we don't lose
> time.
>
> I wouldn't want for 7.2 to release with those typos in a user-visible header.
> I mean, there's time until 7.2 releases but it would be good to send a fixed
> and complete pull request to Linus already in 2-3 weeks time.
>

I've just pushed a new x86-cpuid-db release.¹  It contains Maciej's patch
plus some minor fixes.

Here are the release artifacts from the x86-cpuid-db's CI:

https://gitlab.com/x86-cpuid.org/x86-cpuid-db/-/jobs/14661106966/artifacts/download
https://gitlab.com/x86-cpuid.org/x86-cpuid-db/-/jobs/14661106968/artifacts/download

The former is kcpuid's CSV and the latter is <asm/cpuid/leaf_types.h>.
@Maciej, tip:x86/cpu kernel patches can be generated from those.

¹ https://gitlab.com/x86-cpuid.org/x86-cpuid-db/-/blob/v3.1/CHANGELOG.rst

Thanks,
Ahmed
