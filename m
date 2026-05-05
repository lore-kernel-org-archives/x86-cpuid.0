Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E7A36495D
	for <x86-cpuid@lists.linux.dev>; Tue,  5 May 2026 13:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777988066; cv=none; b=JWaxWB6rT32PDZTaPwkHcElhw2lXHMGEmhPagI68h/ibf1rtnKesj/l0gWd4myR8S5E9hW3hBN1eBX0NOotGhDozhQ0ZDh4NvPCnzc/ODu9fPYE45X5PnjVaKh8V/HgnPKo6Q8Ufuee2WqoFEU4zVD0llLunrWp9oM9ibPxL+fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777988066; c=relaxed/simple;
	bh=qWDwjBEUbpmFVtdokhHaFiyCBdsEe3HmMhKV4KeTEM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K4r4yF+tqnjrOgCwvkMkE7zBx6ytfWYQDfYjoD9ueODpJhFw76h0cHqHUaScjX1srMkud+iH9GTjgMxrbLK+wtD2Ud0Z69YqxBgIEZx5me0NTVjl+5pvGklT4NXHxBghxcQqOxV3xHV5Gh5uKS6WlY9h9H72WyJCEZCuPGeT0+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=PpVHrM9C; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="PpVHrM9C"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 46B3A40E0140;
	Tue,  5 May 2026 13:34:22 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id PZdF8hn2qBfM; Tue,  5 May 2026 13:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1777988051; bh=CDnqH0DTw8XGvkc3FTTSF1AHe1iqKa+us8LHhZw8/Fw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PpVHrM9CFMY3kdUNOe8Yd6e3hg1+D1lsbyhVhmaPocap4bKhE7OFQRXY1P6iUc7aV
	 UYxqO/Kkl4WnhjF161Rfqk7PJkilL9CzB4JPzcSHJQPzrJWc6rHyRQP+XiiDYhsea3
	 N/L/r/fxtMjgF39G8BdFbMkeHTbS+pUDzRDrs+IWUcg1YGTU9SQQwl9kyUgfaHJS2w
	 oGfTpq11BcMonLJtLdgBvdCh/8WjjXs9CqxtvmdAqgJDdmUhQ150AS/O4uMuNqg8n2
	 flkVtk8f8DXK4mi4k7zlamNoPmi51Q2uYxJpVKukAA/ghfVRoDPzvhJDgsbm9Om/Jc
	 YrjLkRfeOrbF3Z6qQyx/E6HSuqkUVn7uMCPYbT1EV6BNG9RZ/pXMj/93U9FGcCcJV4
	 PZYcFJoGkZN8o8gfxe4zbzpmyCYqHgFbphkT0YNgdDJNdlYHr7bOEkI4qv8ziCbU75
	 +POH3R1DyWw6UBs6iLFzZ0JrlhbUKPVwKCZEqNGCHVA52xODU3QzmNDGKGraP/epOH
	 nnKVhKmMfZZDxN8PjPUcfPi5qg3E7bpsQhVTZs7bTbuv60kX4OzKDhjFPGoJS7ZheE
	 Agg80UJjrDyZ7OVXJ1LYIz/GKGkecztvqhPHjQKf60cRkyU8OJCXTq1MTxGEUwh78D
	 +jyn7VgpfHHXU31dC8NNfQzo=
Received: from zn.tnic (pd953014d.dip0.t-ipconnect.de [217.83.1.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 54DA140E00BF;
	Tue,  5 May 2026 13:33:56 +0000 (UTC)
Date: Tue, 5 May 2026 15:33:50 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
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
Message-ID: <20260505133350.GAafnxvtgFxJHth8WB@fat_crate.local>
References: <20260327021645.555257-1-darwi@linutronix.de>
 <20260327152354.GBacahCioljpw5QqUc@fat_crate.local>
 <acrBBFyU_vi4zFOx@lx-t490>
 <20260330230836.GLacsCdDkVu0H3XU4l@fat_crate.local>
 <adz3z_MaWJr_GOtc@lx-t490>
 <ae-uw9836AJScRsq@lx-t490>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ae-uw9836AJScRsq@lx-t490>

On Mon, Apr 27, 2026 at 08:45:23PM +0200, Ahmed S. Darwish wrote:
> * Keep the current synthetic CPUID(0x4c780001) and CPUID(0x4c780002)
>   bitfield listings, with their hardware-backed scattered bits, as is.
>   Mark them as "v1" instead of setting them in stone.

Except that they're already cast in stone:

https://gitlab.com/x86-cpuid.org/x86-cpuid-db/-/blob/tip/db/xml/leaf_4c780001.xml

and that 02 one.

I don't want any of that to be in any database - this is Linux-internal only
and needs to go from there and nothing should depend on it.

So, instead of taking this and then converting stuff ontop, the proper thing
to do would be:

- rip out the linux-specific leafs from the cpuid db
- keep both facilities in the kernel for querying and convert the hardware
  leafs to the new method but use the old method for querying the synthetic
  leafs. I'm sure we can multiplex between the two in cpu_feature_enabled()

- then start converting the synthetic ones to hidden, Linux-specific ones

Ok?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
