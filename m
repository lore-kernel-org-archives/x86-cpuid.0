Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACCF20408A
	for <x86-cpuid@lists.linux.dev>; Fri, 15 Aug 2025 07:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755242162; cv=none; b=ttZ4I1JrJAodwf109w450szAo0/Tkb9balJuXSG9IgjvXE7PQ7X8pX6B5BacIe7UKc1X3KSzDtJ2l9CYVopBj7SBFkrtMzaLV3RhW4P7Mzjfom3jCOcULBn+QAQH9MmNYwsyI2sXTxO5ylE/aySArxBWYvHKYVuvp0GY+4/SWnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755242162; c=relaxed/simple;
	bh=RkLDp6zDRxv8BgRNh3MlVTs4P6ItOnLnxvRRn78MzWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bvK+cCinZlRGZwrhuKr5/atUxPRiMt1cbX13S4mBamPHZAeSIESahDY3tRuxc0IB7J5UeesT4hDDQBayIbaTipobp76pEebDENwQJF/lHLFNpXOoJtJG4GAY+Tx8JK8+xqQIcrjrsMxC4TPkGjVNN+SfwBMJnnSMolKZMNWHdKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PQdfvki4; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0WUlp69i; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PQdfvki4";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0WUlp69i"
Date: Fri, 15 Aug 2025 09:15:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1755242157;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C4UN0KzIR1Tf5MZYHvlC0T5XL7J3huLu6aBx5aMBUKU=;
	b=PQdfvki4RNOwwd17t5MzersaHCajZsJPqtyUCp/iLPG1ECLTwYlQ15A/hc88LBddW4MKBW
	RoMcaFOtYdHYAttCxvA130ZtvmJiUPBTQwzKbU0r0M7Fod6/+c8vHZZOAXkwrgzzyuyyd0
	+sKlKF2HnHbTzw7/DKeADQ4eah1188hR4YNfcmw5uU6JiQCwMhXvYM5dGfQtOUk2UXbdZb
	ERfWz5dIJPdYdF7iOUlo8mDkSnSxTgHWSx0dEaWbYmM59JpXlA9BEMeEdipCf6M0QTUcRR
	Hxaf/+kggP5Z6V5tTosa3P5VIU9nuotF4vnH6Tf1lCl37IxkFCcjcnsWshstEA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1755242157;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C4UN0KzIR1Tf5MZYHvlC0T5XL7J3huLu6aBx5aMBUKU=;
	b=0WUlp69ipHyEt5YlVdD0vzcttdVVsQFAtDVw6l1hY/vkKCfo5Wx1n3KPM7fIAb8z2jlo6W
	XsoA4zR0Nh0OuNDw==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Nikunj A Dadhania <nikunj@amd.com>
Cc: x86-cpuid@lists.linux.dev, bp@alien8.de, thomas.lendacky@amd.com,
	santosh.shukla@amd.com
Subject: Re: [PATCH] db/leaf_8000000a: Add Page modification logging
Message-ID: <aJ7erI-UKNIBehjP@lx-t490>
References: <20250811125236.2606331-1-nikunj@amd.com>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811125236.2606331-1-nikunj@amd.com>

Hi,

On Mon, 11 Aug 2025, Nikunj A Dadhania wrote:
>
> Page modification logging(PML) is hardware feature designed to track
> guest modified memory pages. PML enables the hypervisor to identify
> which pages in a guest's memory have been changed since the last
> checkpoint or during live migration.
>
> Signed-off-by: Nikunj A Dadhania <nikunj@amd.com>
> ---
>  db/xml/leaf_8000000a.xml | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/db/xml/leaf_8000000a.xml b/db/xml/leaf_8000000a.xml
> index 7f73318..433c4b1 100644
> --- a/db/xml/leaf_8000000a.xml
> +++ b/db/xml/leaf_8000000a.xml
> @@ -14,6 +14,11 @@
>      <ebx>
>        <bit0  len="32" id="svm_nasid"               desc="Number of address space identifiers (ASID)" />
>      </ebx>
> +    <ecx>
> +      <bit4  len="1"  id="pml"                     desc="Page modification logging (PML)">
> +        <linux        feature="true"               proc="false" />
> +      </bit4>
> +    </ecx>
>

Thanks a lot for the patch.

feature="true" means that the Linux kernel will have an X86_FEATURE_PML
flag at some point.  I've quickly searched LKML, and I didn't find any
draft patches for such a flag.

If that feature flag is not planned, there's no need to send a v2.  I'll
just set feature="false" before merging to tip.

Thanks!

--
Ahmed S. Darwish
Linutronix GmbH
