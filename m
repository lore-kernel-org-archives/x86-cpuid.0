Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D813E5EEA
	for <x86-cpuid@lists.linux.dev>; Wed,  5 Aug 2026 08:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785917078; cv=none; b=fSxSDbJ70pubdggIVjsLNoH78obbTgLi89SY453cMowo1rSlBUrN/uqRwSD1AHggbUnvlIpLCSNjKMsI0K9WnhaghniiYHqR9qZRbbCaCYo8u2vgYg9GWwzxmC0C0t8KhQU68ypkd//sz8k8YmZfpwrMpaBVISFOFQ2bQQ02biE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785917078; c=relaxed/simple;
	bh=yBn/3H5ZjvJZc/L7t9nTWNlEdv8pkNEIBhIZeCS+bD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XpVqcqLJ4/+Mq2PGJ5NBx2XWX4Y3xhsF7BSDNei3yDuwhiPTDtSVSGa/C7spgabBzJ/PdJpo1yyIOqb0jJ/fBou+R87EJfa+xhY5JgD8DXVfaqYrTOcofoOn8a7dCcRQKjinPl07XAezp5RO9T0T+sWf1+jfTan+Tpqe92J64+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=R6wJt0GE; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3bxsdfsN; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="R6wJt0GE";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3bxsdfsN"
Date: Wed, 5 Aug 2026 10:04:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785917074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yBn/3H5ZjvJZc/L7t9nTWNlEdv8pkNEIBhIZeCS+bD0=;
	b=R6wJt0GEOJbqcWcDXpu2Lwqdq0qK2bKxO6qoGstoag3f+zeHp5RfzIKdkIdeemKlj9KOBp
	mrE6AkXCTu4FQWIIATMi6D2bzuaSwqUrysbXZZtV61tGYcYfRQGzAwi4Bu/t0u5iD+Qosr
	UBlwrQuTrQtdLDOkI2T8lTEhXWlejoFchPcRjEOhDxNFnV7EyKR11VhrWHtqK2oi4nQKw+
	GXC/vens95id6no9/REDiQF6v6HThM0Y/D1216/q/shy51U6Axs0GoAcB7QxuEeJAlqVEn
	SEgXEnTfTPJ9WKPY2GMs3/8/oaa8A6wOXxElIFlX2VjDPJ/Tig6L9m30mxdXnw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785917074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yBn/3H5ZjvJZc/L7t9nTWNlEdv8pkNEIBhIZeCS+bD0=;
	b=3bxsdfsNDBZrPsZQlrwyxcwEM12KLVhssgxG2HRRORuP9FdiE21AvR5vMC3CM6JfDUFABk
	RoQWr7nlkic2clAg==
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
Subject: Re: [PATCH v7 012/120] x86/cpuid: Parse CPUID(0x80000000)
Message-ID: <anLukFZerFLqFEmd@lx-t490>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-13-darwi@linutronix.de>
 <20260805025323.GCanKlox0DF7Gwhpf1@fat_crate.local>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805025323.GCanKlox0DF7Gwhpf1@fat_crate.local>

On Tue, 04 Aug 2026, Borislav Petkov wrote:
>
> Before we continue with this, I wanna a bit of a cleanup to the parser:
>
> struct cpuid_read_output was a bit too much. And also those linebreaks should
> be like I did them - this is how we usually do them.
>
> Thx.

Yup.
