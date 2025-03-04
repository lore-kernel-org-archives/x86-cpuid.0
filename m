Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5C11FCCF7
	for <x86-cpuid@lists.linux.dev>; Tue,  4 Mar 2025 15:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741103104; cv=none; b=gRv4GB1hL+QKMNwXzOpGv8ooX9d3Vip4m3jk0zOMqvI68JavpLR4GdSkh77zh26F0M5lSRSBzAz0cS/Fx1MnysP6uG7kFpfi5s5dJvCGccjaztqCFuXCi3Bl8o2nqzNC/LAPOgofRiD4uHXuXyqGLTspfapBGVFS3iBYZRSqqu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741103104; c=relaxed/simple;
	bh=GjxHIFAOdT46+PDjk4/gllCo2CbQSMR5kjmzsAar2KI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UlanHEsRPIrRcgkxYRk1NKtQ4nxG0Mbn5EUH9ycMeUvQOBtrgDRCEvhYAxlHod1+/FupfTXUVGgnxaUyEmAAO9/uFa9PLeDn8aKaSfUnPDT9b0cKKPDuUYIu/vQ3budUQto5OOHGq7T7tP7pDEdcE/eeWNyT+UI+JiJEzIkeF30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=rjlSynIX; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=7TY7AHou; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rjlSynIX";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="7TY7AHou"
Date: Tue, 4 Mar 2025 16:45:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741103101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tU6iT6sGY1XfgkyjhnRUm4765Vsz5BsA3+ttVVk9B4o=;
	b=rjlSynIXTBo7tpyxR4ShzVcnQfoGpN/mVL5FasP7z0Vj6/AOgdLZ3nnAUWFMXZk45oIdhs
	Rxb8SC7ePHt4NpGJhDjSqwMjzNCPxiHl7JN7I0i2rtUBCd4bX0BDI1VLrNXONKPBeQybTf
	N6koxsdsGYXKrMUVimxWQ1AwKyf/MBMlGuKx5yF6GaXGsFgWJtGeVcXGzT++V0Gdk4o/hQ
	loLoAPoXozPRA1jXm5tyiA3dldjD72nRnlastVN95DZjGq22cC5Qx971dcTCUDMbaD1aFj
	dKHZm4Qehqb1CLV15d1VZxObfjKQuWAQL804daTANAS/G3TYu7I4m9Xh7CBWkg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741103101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tU6iT6sGY1XfgkyjhnRUm4765Vsz5BsA3+ttVVk9B4o=;
	b=7TY7AHouIZ+DQgVyBGXl9VEIrMplpWYeT3pJRPq68JIyz25rQKn3apybbgEgPoXheuQPOY
	sfK8qEfIKj0EnRAQ==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: "Naik, Avadhut" <avadnaik@amd.com>
Cc: x86-cpuid@lists.linux.dev, Babu.Moger@amd.com,
	Avadhut Naik <avadhut.naik@amd.com>
Subject: Re: [PATCH 0/3] Add missing CPUIDs to the CPUID database
Message-ID: <Z8cf_Due2sg9DBLD@lx-t490>
References: <20241115181345.262296-1-avadhut.naik@amd.com>
 <2e8be526-9a8b-46f3-bf35-05331cf16ea9@amd.com>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e8be526-9a8b-46f3-bf35-05331cf16ea9@amd.com>

Hi Avadhut,

On Tue, 10 Dec 2024, Naik, Avadhut wrote:
>
> Any feedback on this set?
>

I apologize.  For some reason, the x86-cpuid mailing list didn't forward
/any/ emails to me, and I've just discovered all the pending ML emails
through a random check of the lore archive :(

I'm checking this now.

All the best,

--
Ahmed S. Darwish
Linutronix GmbH
