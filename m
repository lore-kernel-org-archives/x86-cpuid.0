Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123B1246762
	for <x86-cpuid@lists.linux.dev>; Tue, 18 Aug 2026 18:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787079045; cv=none; b=hj+emAAqx3edtR/Tps4hMBg6L7MI65wt825LRSC8C8r0bkf/SSH56gdMDyVnowPWy5Tw79NuZvasziEVV2VASLwdkijLpfRAN2U9uuRLktBqIYWT3PcycD5deW4+h2zmaQYCDqI3RFmfCXGrHN/dCxTpCsni5Y5JDoDtUzSwLC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787079045; c=relaxed/simple;
	bh=iwhZ7/Eq9JlglkTgvvaTr2Osw3kbtrqwQQniz1TSBds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rfxpelrYxz5txy22JuzM9OqbNZ6Mgbd3mbCH2JablMszOHoFYCRDIjvv6m8wh2HWWf7t0CHPkuHJOScOjMq9VV8/O+efe4/h0SLF7TeC/t5ZCQiwcZPBWPMAlaKbga6iPNcZfqNIRZ4BqsUGZmnDBQX5bvfKx+6G0PIKMsFAdxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=V0+H0V+X; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=YpYUTkEN; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="V0+H0V+X";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YpYUTkEN"
Date: Tue, 18 Aug 2026 20:50:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1787079041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iwhZ7/Eq9JlglkTgvvaTr2Osw3kbtrqwQQniz1TSBds=;
	b=V0+H0V+XztB89o5ZcD7QHZ3+WZcapK5ZGwl8UkZUvIcOt8FYeLCJAapGm7c8Rn1gMtqsSo
	ntezNVMpDgIwLomdFlBV0uY+4BhfFa18WerrokruzhbQ/pZzj6ggLJWIA0NzCY4QWXkyIr
	r9/ogT/myLE3GiXGZt4ypVJfV4oUwL7dbUf7euV0GxFazjOIOGovaYbphw4erdNj9FJtiv
	cYUa/mYiKDWCZbOtej/YNoBLNyQRiL1UAc1nIkt8MI1LdplZTsv3+ij/OjgT3fe0i/LjIB
	bMBophqjtumi0HoG1XYhrTsaS1ynbTdsm1Xge83F9YUwd/X2xaAU1nMc+TxMeA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1787079041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iwhZ7/Eq9JlglkTgvvaTr2Osw3kbtrqwQQniz1TSBds=;
	b=YpYUTkENW8goOlgsuSaqqo/LpZy5q/QUzeqzE1euMGHXCd77liiTEV2wDv6gaPmtOnxoNE
	LrC+wCM44kvUSgBg==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Luigi Leonardi <leonardi@redhat.com>
Cc: Tanish Desai <tanishdesai37@gmail.com>, x86-cpuid@lists.linux.dev
Subject: Re: [PATCH] db: add Hyper-V leaf 0x40000001
Message-ID: <aoSpgOi3VXJuKwVj@lx-t490>
References: <20260721173159.46494-1-tanishdesai37@gmail.com>
 <anW5m3Mb-Puk5hBu@leonardi-redhat>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anW5m3Mb-Puk5hBu@leonardi-redhat>

Hi Luigi,

On Fri, 07 Aug 2026, Luigi Leonardi wrote:
>
> Thanks for the patch, this would be very useful for SVSM!
>

Sorry for the late response.

Could you point me please to the kernel patch queue in need of this?

So far, no hypervisor leaf callsites are converted. See:

https://msgid.link/20260528153923.403473-1-darwi@linutronix.de

(Another iteraion of that work will be posted soon.)

Thanks!
Ahmed
