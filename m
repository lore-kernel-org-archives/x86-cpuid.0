Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA5D2BE7D4
	for <x86-cpuid@lists.linux.dev>; Tue,  4 Mar 2025 16:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107206; cv=none; b=kzDLcxOwmFBZ8+2nMFeTO5ADhXIeuoLIUEmC2Xwufvu0ESReEqrYkFD2Hndin6uZr5EQd4LYwWlnI78mFhMmfhxhZrHB1+u+G0o4jODoFUanekvcbMib+qojH6lvmNxfAQtLeDH5x5Op0ij6Kuv6qQPhoWJxIJZfiZ5/GbBLFRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107206; c=relaxed/simple;
	bh=V5g77Nc7uZ8QqlN0FWqZH0GKc1zME+tFKHwd7vBzHgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PbncgylQ7BhRd9T4mVYhAYKjRLtumOgvHZmd7Du/bJqAt2zSEE4eJz7roVmWlnLEwnxI+iMXeVUxLQ7rPzWPL33gnG05sSMaR1J3Ne8ZmwnCp3DJ5iMJHsD6k6DttN1zIIT4E42+Mil6fj4m9gdmyvPrxbTBVID8+J8YMXxdq+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0TYL2xWP; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=EBh435Xc; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0TYL2xWP";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EBh435Xc"
Date: Tue, 4 Mar 2025 17:53:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741107203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V5g77Nc7uZ8QqlN0FWqZH0GKc1zME+tFKHwd7vBzHgc=;
	b=0TYL2xWPcYP21snrtCsciGVspMQw5sqrrtJlvQXLAgRYlDp2DQ/fwhYokxCEl+6zOROAxQ
	UChhN+naVyXUaxyFV5QMTITsbTl+juOZZWCvUNS+DQtw5KWk9ifc/U/XFluOFl+PGgAWYu
	zQJnch5v+hu/ht/XSYk/pc5lpKm4iLEmvRPe5oTMiCvIYFSfXMgFteKyv7cnfoBmXu4Bm6
	RPWQz9EHId13niC7E/j2A/1tZREzXumZzEjVKbSIIMuv5yGnIQRevD0KTDtXtREc48HRzc
	rJALR6tuIVmCzde5dWJgEiibqOScO1Ngw14X0wZoGGGeD1kOSaw27Sr4eL43FQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741107203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V5g77Nc7uZ8QqlN0FWqZH0GKc1zME+tFKHwd7vBzHgc=;
	b=EBh435Xc6DaL/+NPydBp4dIT8FxuFvO8UzjFQnVV7kHwmeJ0k0OJdrYfHh+LMkZNWdNEX6
	qFcQhljUl1eEbgBw==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: "Naik, Avadhut" <avadnaik@amd.com>
Cc: x86-cpuid@lists.linux.dev, Babu.Moger@amd.com,
	Avadhut Naik <avadhut.naik@amd.com>
Subject: Re: [PATCH 0/3] Add missing CPUIDs to the CPUID database
Message-ID: <Z8cwAT6N_T0oomkL@lx-t490>
References: <20241115181345.262296-1-avadhut.naik@amd.com>
 <Z8crqWioDw7Y_cgG@lx-t490>
 <c63d4cda-b583-40a0-8dda-c5786f1f56f3@amd.com>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c63d4cda-b583-40a0-8dda-c5786f1f56f3@amd.com>

On Tue, 04 Mar 2025, Naik, Avadhut wrote:
>
> Thank you so much!
>

Welcome :)
