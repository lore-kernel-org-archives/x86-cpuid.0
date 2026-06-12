Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4B73B0AED
	for <x86-cpuid@lists.linux.dev>; Fri, 12 Jun 2026 20:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781295055; cv=none; b=eM0v/zuM/zuMrJOvnCCrXYqbewCG+CZd8s4F5KESK/ZAyagCniiH6C6H6L4KUjDwlAjuJ/HOGantfXTOpMYK7GLPhammjud0y0hSWuJPkSM/cWC+8bSRy/VoGG3yWZUbZ7tu78VGxNgv4pjcwPAJBiaydajXYh7hEmwz/m7tIlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781295055; c=relaxed/simple;
	bh=VWR+emaEslqD4ZtBztklq7SGXLRR7hpco+Fwq/Jwi0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bQ6Usi1YSh8q5OKUWtOu7o/bkdFgFB8vte/6RX6Xc76S8VtWRL1r3FdumqC2l+fxmnRNtBl91fV13OunDgF0aLKVvF2GBh88NQKf3cq0lc8s3XTVTXCOZZxxfZFwVEZjanDShm0SwtHj+sqSNWISCKehmPFI/YVgTyV0y59PkdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4QX3W6OB; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=+/F1L6wy; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4QX3W6OB";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="+/F1L6wy"
Date: Fri, 12 Jun 2026 22:10:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781295053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VWR+emaEslqD4ZtBztklq7SGXLRR7hpco+Fwq/Jwi0Q=;
	b=4QX3W6OB7bfyHPuKEBdjidANkTwzLjArW4JFDFJP6JDr0mcO0+J+lJoP1Sxug11CcPLnAf
	IK3ez24csSm3SpYGtOE93PWEvvymnZvW4YSoipNkVK9tnje+YpB//hT+ewAbxd+IdQ2WkA
	ti5vYnBc5dFK1WVR6LhZs9FVXqNY7L5yinLhdSbI56qUGGox9quGdutN4FRA/nidAeXvTY
	2jxXcTImoyZVRrp5DXPaqZ63r0LTDd/w0+odliN2D/210ktSwWPRwswkl/p+JZr8UQfEZx
	Ei9ocBgRIQnrhXPhn56eOEbYmK56FVzWRkcGScV3NetR4ZYrNJdBNvn/iMxdJQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781295053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VWR+emaEslqD4ZtBztklq7SGXLRR7hpco+Fwq/Jwi0Q=;
	b=+/F1L6wy0DrfLh1NOGdlgdWSOL4tyWDRfLRviKWZLArL1Hd6KH01Vj2okQDV+BI90bn7Nw
	C3L0s+G7wr+m0GDw==
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
Subject: Re: [PATCH v7 015/120] x86/cpu: Use parsed CPUID(0x80000002) to
 CPUID(0x80000004)
Message-ID: <aixny6Sn1F-7L-1B@lx-t490>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-16-darwi@linutronix.de>
 <20260610195645.GCainBfRA0gqiR7mhs@fat_crate.local>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610195645.GCainBfRA0gqiR7mhs@fat_crate.local>

On Wed, 10 Jun 2026, Borislav Petkov wrote:
>
> Please merge this one with the previous patch.
>

ACK.
