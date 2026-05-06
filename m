Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69133B3C13
	for <x86-cpuid@lists.linux.dev>; Wed,  6 May 2026 21:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778104646; cv=none; b=BM+EeegHIwFBKLsH+2EhjVoEVmYmzVsJtUWbb2MYrGtTiZBDFrisUFSSKH9zOEXzsbgPdjlfrFgAHE7fBeTBpswP+q3Akm7vOXhWWc3XRAcD7aawdioYsm1G+ZhedK01QL0rHcD+NZyiXIy8QB3fcVlbo1bDr9AAa3ZU5eHYisA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778104646; c=relaxed/simple;
	bh=PL7KH4SvgUbJjSxh4HcF6SA2NVviz/PXJEjuGpJLKp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fKcJuA94YUui6Mq9p2lKJVftAELVT+WbTL2yrc0g8zqVfMatEWaLYUHgs+ElCZCvekUW6L7OLXp2qG26S4a1LixwlfQp36JANp4BGDQXBHObqDtpKhVTgyG8d77bbja5TTmy6ramlfk8x0MT1MaRFTgO3FejCzx5x3dJKVAt/Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xVfe0l63; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=gUyiOS3/; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xVfe0l63";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gUyiOS3/"
Date: Wed, 6 May 2026 23:57:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1778104642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3fjJgPlZLMI9RWijx8+EjLI3RGt09JYB4+G5ThykOio=;
	b=xVfe0l63eVuLCPX7wKOJowwJkQbj7bEL592x49YqK7U3AK6C+xya2stE3lKjIfK1CNEsQi
	FTRYY3e5uX/M+XETWUu6Y0u0ZqsFhySM3EtbB3zRQMvWY6I/xV6Oi+2NyPbYiJ51aJ0gxj
	toc94VYoziuiDL3Nt4jaerqMCbeluMNaEdm9LY1YN5jS74xFKfmVYx+QC6Ya2/XevTwauf
	H9bzV3GzZurHa+pCaAI/n+PKzJ701FVT5yaycpI/ob1C1qwJCPfmiArz3Xllu/zSmKHCl4
	u9/cNu0dCTxfI2I8r75y/9klw3ubPBnNFRg8zqplOGH9pzSf8oGXG1Wtz/91BA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1778104642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3fjJgPlZLMI9RWijx8+EjLI3RGt09JYB4+G5ThykOio=;
	b=gUyiOS3/BT6NMooFKu4NywoGndrJEF2DpsKSXXufHt9EvYzm7JntS1dioqvuHBFhEs1i6c
	sc+ruDpkZqHTmpBw==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Christian Ludloff <ludloff@gmail.com>
Cc: Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Sean Christopherson <seanjc@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 00/90] x86: Introduce a centralized CPUID data model
Message-ID: <afu5QIInX1POppSl@lx-t490>
References: <20260327021645.555257-1-darwi@linutronix.de>
 <20260327152354.GBacahCioljpw5QqUc@fat_crate.local>
 <acrBBFyU_vi4zFOx@lx-t490>
 <20260330230836.GLacsCdDkVu0H3XU4l@fat_crate.local>
 <adz3z_MaWJr_GOtc@lx-t490>
 <ae-uw9836AJScRsq@lx-t490>
 <20260505133350.GAafnxvtgFxJHth8WB@fat_crate.local>
 <20260505151242.GDafoI6oOOs9hknrrK@fat_crate.local>
 <CAKSQd8UvY2iLew9gFYEs0MCgPa9R8RiQLP+kJUb6Cw8BYo=yBA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKSQd8UvY2iLew9gFYEs0MCgPa9R8RiQLP+kJUb6Cw8BYo=yBA@mail.gmail.com>

Hi Christian,

On Tue, 05 May 2026, Christian Ludloff wrote:
>
> When Ahmed published, I added them like this:
>
>   https://www.sandpile.org/x86/cpuid.htm#leaf_4C78_0001h
>   https://www.sandpile.org/x86/cpuid.htm#leaf_4C78_0002h
>
> That is, list which Linux word goes where, but not the bits:
> for those, simply have a pointer to code (the "golden ref").
>
> I did suggest two small improvements to Ahmed in private.
>
> First, 4C78_0000 EAX should report the max 4C78 leaf, in
> case there is future expansion. (CPUID does always grow.)
>

Yes, this will be done.

> Second, the number of words reported in 0001h and 0002h
> should be enumerated, in case the list grows, and so that a
> program can tell between all-zero and not-present. (ECX>0
> sub leaves, basically.)
>
> Since 0001h has already used up all four registers, it can't
> report a max sub leaf in EAX – so maybe e.g. 0000h EBX
> has to do the job instead: it could do e.g. two byte fields, to
> report the number of words instead, i.e. 0000h BL => 0001h
> words, and 0001h BH => 0002h words. (Or wider fields... if
> you expect more future growth for words.)
>

For both CPUID(0x4c780001) and CPUID(0x4c780002), I can still reserve
their EAX for that.  Something like:

<leaf id="0x4c780001">
  <subleaf id="0">
    <eax>
      <bit0  len="16"  id="max_subleaf"    desc="Max valid subleaf" />
      <!-- Bits 17:31 reserved -->
    </eax>
    ...
  </subleaf>
</leaf>

since "2^{32} - 1" is too much subleaves anyway, and each mapped
X86_FEATURE word still need a whole register by definition.

I'm not sure if this will have any practical usage right now, but some
future debugfs dumping code might indeed use it.  It will not harm.

Thanks,
Ahmed
