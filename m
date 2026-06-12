Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4393935E948
	for <x86-cpuid@lists.linux.dev>; Fri, 12 Jun 2026 19:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781291825; cv=none; b=jlWTiIYpQzpVR24U/U++WdBdgE8EA2TAKFGAFYxS8XuTmP2EO84wEkLE0LrAeLrIFxnpIRx5KNOogmJltsUb0EHLmEBxFsVtA6o+kXab14hIv/nRE/29oUIgzKXDxOavRmKS748FNHgRTWfYED+eSkcBBJEeO+6w8MDpp8ZITEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781291825; c=relaxed/simple;
	bh=ymUdpjyXdmSE3X1bvYvaMYDUV1eJp0IMgg7LW5TebaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oFKjMDP23jc9l9efllIGvaELyVMubX3/q1speSLzxEgkDtqBO6hI2RJmgRWqV4Q2TTF/QwpiTwg8phMs4uVgYKryeG5EaMzplqmYk6Qno5uGEIW2B1fciIcbrB4FQXSj9Uvb0Mf/C4gnHgiMsijmDLBvBAUGTZxvsB58Jdw34Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GiMOPHEz; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pN7CfyjP; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GiMOPHEz";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pN7CfyjP"
Date: Fri, 12 Jun 2026 21:17:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781291822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ymUdpjyXdmSE3X1bvYvaMYDUV1eJp0IMgg7LW5TebaY=;
	b=GiMOPHEz5pfdlum8b+872T8zx/kChg1ULZhh5GiRD4eTeWxkrncLjRLoztDfB6UECepaLS
	jXF+q9qGXK/Kp4oFTA8iaDma7e2zhVAdj69MWaxgi0AahlGkr1SHnScrBO3Bsw0YpKzMo1
	bXR4aMbtd14JRV3yQOo6FUg0S2q6+8QZtoop0EAg45Gd7UwFNgOcqXsxY47LFmKYfG5vjB
	vNUvztQxvexMeJRhqVk0Kzj+uA/DWrJOGZcFV14EVzFqKmyA5Mg9BqBn47EQBFd5DjMhok
	nd7Xv5+dRzKSHtFWyX6yhZBoD7IMH8JY4eHDEaE1MZNnmzl3Xu2UBXuS8s3CAg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781291822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ymUdpjyXdmSE3X1bvYvaMYDUV1eJp0IMgg7LW5TebaY=;
	b=pN7CfyjPDEhjS41I/zQ7hBMAoJ3dAjG7wxs9NM/SSukt30dM1wlTK3iJnxtJZMXRUqboX3
	U9IKYIH42tx5wKAA==
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
Message-ID: <aixbLPFiOI6fe345@lx-t490>
References: <ah3jPMYIxC1vsUUB@lx-t490>
 <20260601203452.GAah3s7FevsRDFT7rF@fat_crate.local>
 <ah34pi6j5HSMJdrL@lx-t490>
 <20260601225306.GDah4NUvJwaqQem4VQ@fat_crate.local>
 <ah7_wPJ8_FGLOwZd@wieczorr-mobl1.localdomain>
 <20260602174746.GJah8XQvEJo9UKru1l@fat_crate.local>
 <ah9H2hxkMPMeuF-o@lx-t490>
 <20260603003129.GCah914Tc9sEpO4Nxl@fat_crate.local>
 <aiZjpPCTsz4m-1O3@lx-t490>
 <20260608144920.GBaibWcLl3BUAPL8XW@fat_crate.local>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608144920.GBaibWcLl3BUAPL8XW@fat_crate.local>

On Mon, 08 Jun 2026, Borislav Petkov wrote:
>
> On Mon, Jun 08, 2026 at 08:39:32AM +0200, Ahmed S. Darwish wrote:
>
> > How can userspace depend on an internal x86 kernel header?
>
> Well, the recent futex snafu teaches us again that luserspace can depend on
> anything in the kernel.
>

Fair enough, thanks for the explanation.

All the best,
Ahmed
