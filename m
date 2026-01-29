Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32507287263
	for <x86-cpuid@lists.linux.dev>; Thu, 29 Jan 2026 17:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769706970; cv=none; b=fh9lZCVVKRQkRJd81znau26seaTH18X//1KcNqMMmyP8psMmcBluSaiOvozI8CI6PNsT9bg+gVWv3plPrtVyD7j9MGbSb3PVI9BrvLsyva/GqSPPYhTvUDaxf2k5cRsoAgyco9GMJZ7tii7PUpM65lPfgx1vSGgCjZOVjauA4sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769706970; c=relaxed/simple;
	bh=O3acQOB10H+ccAZkd5nS2GKf2XGVJKAJLYd1KGeshwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RJtghWleDEYWgaQdeGtoXNNGb8iTkCbzSYfanjQjAnkDE1hjavzEwRbEgzBsYXSyJ/PAuknaI3LjuPyj8VLjdVYtT/IVh9l10k3WUtoaMH8qhK5WVCEGT8kJGgq2uFYV/mdgfi9zI2BvH4c5X3lWblQmPEy6QMwfCo36cMUxAhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cZttp0Ok; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=mB88WkRQ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cZttp0Ok";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mB88WkRQ"
Date: Thu, 29 Jan 2026 18:16:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1769706967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O3acQOB10H+ccAZkd5nS2GKf2XGVJKAJLYd1KGeshwI=;
	b=cZttp0OkF3sC/sHIWyyAaHsO8pLJ0Lr+1eedhWxWEAFw2RbpiVX3hAzWCm6YNIPOEAj2Tk
	5eD+5tMvl5tGWIn5nzBtJrNMJWjfrdZQ32XoTfDv16NxkFq6y3zjNpS4uOAIYT77hxrZyr
	Owrof8b9ilOND7weyfMCMSZ6o6leCXinUU1PMBByl47pXHhDJ5q8gEHvLF1ah3MLg0QQtO
	UwiqolJEAIM/Zw7Ithlm5fGJHHTQx9dZ3Z8t/ihm6y2iXRUXUmcucEzOCJKs6jO84Bmm/z
	CsfkYnhLU6wG4NJC9rwjrsf5DaIvyArciGRRDgPWBTpxndeCnLbRf7h8zwKZng==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1769706967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O3acQOB10H+ccAZkd5nS2GKf2XGVJKAJLYd1KGeshwI=;
	b=mB88WkRQi5AxHY+bav06FqIL/FdZw7e2TLekNEbdQNNK7WyOS+UINfrPewk+545Mph8n5R
	knLHgMeyh6Rh5mBw==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Borislav Petkov <bp@alien8.de>
Cc: Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Sean Christopherson <seanjc@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 07/35] x86: Introduce a centralized CPUID data model
Message-ID: <aXuV1IQYiMyn34ps@lx-t490>
References: <20250905121515.192792-1-darwi@linutronix.de>
 <20250905121515.192792-8-darwi@linutronix.de>
 <20260116203117.GAaWqgFYTv1bHLxKV_@fat_crate.local>
 <aXdmc6F5wLthVDEU@lx-t490>
 <20260129160709.GSaXuFreAkumbetUYJ@fat_crate.local>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129160709.GSaXuFreAkumbetUYJ@fat_crate.local>

On Thu, 29 Jan 2026, Borislav Petkov wrote:
>
> But this is not about static and dynamic - you simply have different
> subleaf layouts. And I guess you don't have to call them anything. You
> simply have different struct types: leaf_0xd_0, leaf_0xd_1, leaf_0xd_n,
> ...
>
> And that's fine.
>
> The point being: we want our definitions to be as close to the hw spec
> definition as possible. Not invent new things. Just use what the SDM
> says and that's it.
>

ACK.
