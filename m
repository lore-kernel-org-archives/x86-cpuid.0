Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30D327EC8F
	for <x86-cpuid@lists.linux.dev>; Tue,  4 Mar 2025 16:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741106094; cv=none; b=aun8tcABq04IF6kZDVEuX8s3AzX3RFwZtIOR+MsjSFuDmoquZlT73f50d4q8DWOwDCCYqiJQqsNnSs/u8fEz5UQH/vkRzRvX1u5gRPHrZW3ESAqsdMdbeX/S2NQsjYxMsoUb0nV07Y3T6Zay8tKpXwEZ4mSlK1TiwEXPiWN+rYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741106094; c=relaxed/simple;
	bh=6XDYKsxiPel84gZStvHlNivAmkJ8SKGWvQDzKMsi9dI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cB0YI4lsyMacOxNm52kFA56ox+7B7FV9t9bVa0szdK0DEuPMp8A/uVZE/erP1bKzzi5DrNUEL1xXfw4foffIt6TxihFo2k7v97MR9EYWnpLpDv6pdqcjmtyZ1K1Fh91q64WI/2BgfvJdVL5Bmkog2fUJ5viFAat0JI5pComkoTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JtQe2+Xu; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ln1iTtVq; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JtQe2+Xu";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ln1iTtVq"
Date: Tue, 4 Mar 2025 17:34:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741106091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QqpZuGs7khsGShK3uil+GffMdDtlXCPOvu34RNszyck=;
	b=JtQe2+XuEvevFOyJuBdptSGfHXkbwBPtTOgSijm9IC+ebVM2KUGzhXvgDedM7f89TnOkTL
	zOB+Dq7sdeSz4MRNRcR5qmF+oNQcc+1ONFBSz1aZLZVm9GhiOiNTIx2CpCyGMitnya2br0
	sxXZlAZBIOe8lVOTBoHjeYlqmNae4Rt+oDxYXYpe742D6zteP0pwG2b0KEklEiqNRTRp+C
	8IV1gBodgUDqSxi+TAtH9NWjwiCJizPqUm0JkG6BkTtgfZme6MydRPUY3oT20RHH/nwuL7
	9BdJexLrSD2bU6K7H1yL6Sg+J6cj6r9v5SYhSvTGG6qtjykgbYHaW6vYzB9kKQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741106091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QqpZuGs7khsGShK3uil+GffMdDtlXCPOvu34RNszyck=;
	b=ln1iTtVqmxZdgOncd37Ah84A3XUirProOJkx0FC3ERrAsXqeX6CF083Zcnb74i3+KNpGAR
	EC+Fax8k0EkZ+eBg==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Avadhut Naik <avadhut.naik@amd.com>
Cc: x86-cpuid@lists.linux.dev, Babu.Moger@amd.com
Subject: Re: [PATCH 0/3] Add missing CPUIDs to the CPUID database
Message-ID: <Z8crqWioDw7Y_cgG@lx-t490>
References: <20241115181345.262296-1-avadhut.naik@amd.com>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241115181345.262296-1-avadhut.naik@amd.com>

Hi Avadhut,

On Fri, 15 Nov 2024, Avadhut Naik wrote:
>
> This set adds some publicly known CPUIDs to the database. These CPUIDs
> were introduced in AMD's Zen5 SOCs and have not yet been added
> to the database.
>
> The first patch adds ABMC and SDCIAE bits to the database.
>
> The second patch adds WL_CLASS_SUPPORT, ERAPS, SBPB, IBPB_BRTYPE, SRSO_NO,
> SRSO_USER_KERNEL_NO and SRSO_MSR_FIX bits to the database.
>
> The third patch adds Rapsize bit to the database and modifies the number
> of bits allocated to MicrocodePatchSize field from 12 to 16 per Zen5 PPR
>
> Avadhut Naik (3):
>   db/leaf_80000020: Add ABMC and SDCIAE CPUID bits
>   db/leaf_80000021: Add missing CPUID bits
>   db/leaf_80000021: Add Rapsize CPUID bit
>

Thanks!  The three patches are now merged to tip:

    https://gitlab.com/x86-cpuid.org/x86-cpuid-db/-/commits/tip

They should also be part of the project's v2.1 release, to be pushed
this week.

All the best,

--
Ahmed S. Darwish
Linutronix GmbH
