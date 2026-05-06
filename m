Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E313546AECD
	for <x86-cpuid@lists.linux.dev>; Wed,  6 May 2026 14:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778079538; cv=none; b=t5VoFYFhpfKyrVygeU4/QIcMGqi9+nNlUFZwh81AvjMDL9eKTpIgXQZGb60W7+FM4K2VKCUpFrnW4dmReVsqvm04c9r8dinQAtO4QNG6BOszzEAHxfeLgJETnx+h5+bSAJ+4Sca22s1Vog+jb2OrPGgmTH6x3/KI9dCvvMaq3xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778079538; c=relaxed/simple;
	bh=Fsf0mYo+OeNYOSPRbA3FNlEwW/ieA29WFtEoWqsWcpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QZiL5FBab8WNXaA/jA1amzJjszQnHeTq9inGkLpjTzyoUIMxl0jteh/u72donDDROvDErAqAvZ24BBMmxn2M4MMLPPB3NvELKqeHlrqIKaeyvJ71k6Xh/KXtmInbX6Oz0V0AtbWgKtrpWyDFhDZzMxqRpDiRiqOjyxKWZ9xLCp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=V9ZjYylo; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="V9ZjYylo"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 9B03A40E0140;
	Wed,  6 May 2026 14:58:47 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id fOqSea44nCpu; Wed,  6 May 2026 14:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1778079516; bh=unD8I8js2SIkdEiOCaD+DCCU70gGKOTt7Z8cIuN12u0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V9ZjYylougAZy6IHndN4Lkn+scu/ENkza5v0lesC+Xuaep56fa4X9FL0SD6/oivr5
	 p4Jy/s2C7wFUaQJHUNmIC1E5r41zQHUc32ingH6WW2vyPe9pwsP3A7iMwARX4sD//A
	 DN70GEs+47GjN2JLjCgWOH2R8rjFo4nEGveLIeHm7VoQjs3A8srPP+rJMZZv2VIMoY
	 r8jlfoIFUq8ZsT5urhcgpFE5h/gkjTS+i2d05iewYWxmJyNOvKCmm2G/fXRLECzoBs
	 syg5YJlDMeJDBlK8fBRfiiL7S51nwAUlSOX4Ke6gVBoWV3ao+Gu43rq6qZbDh9xUtA
	 QwQJB70rXZzBqR5AdTnHbTcv0wtQ2QpTqB9odSnURJ6PcY8v7VI6HaMtVQ1bcBphG/
	 6dNLBTCNW80EWh+G2vhEmwxWmXkjJF5dS6AMH/QeauvSANt5dUKL7d6Ng9t4Wxhn4d
	 aTi8hQl53UNr0EfUvDzYSHkvqORDlcVok2tUbMltTGo9US/sX5yiQiyTJz65aeUquo
	 8TYI9jy9h+SbPPhU7qilPsAIERtEw2FhzqzINmznoSx72+AMZiaU2yNQs0kRHNovGh
	 Afeyc0v931hp+nDBzEH4GiUxysSEXwP4zSuhphGWgSIpgUacEW2ETJ8DhbZm775nRb
	 yjSOnFXZoOWYRQLXSYALAF0k=
Received: from zn.tnic (pd953014d.dip0.t-ipconnect.de [217.83.1.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 1C2AE40E00C1;
	Wed,  6 May 2026 14:58:21 +0000 (UTC)
Date: Wed, 6 May 2026 16:58:14 +0200
From: Borislav Petkov <bp@alien8.de>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Christian Ludloff <ludloff@gmail.com>,
	"Ahmed S. Darwish" <darwi@linutronix.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Sean Christopherson <seanjc@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 00/90] x86: Introduce a centralized CPUID data model
Message-ID: <20260506145814.GBaftXBsPNE4wgyGB6@fat_crate.local>
References: <20260327152354.GBacahCioljpw5QqUc@fat_crate.local>
 <acrBBFyU_vi4zFOx@lx-t490>
 <20260330230836.GLacsCdDkVu0H3XU4l@fat_crate.local>
 <adz3z_MaWJr_GOtc@lx-t490>
 <ae-uw9836AJScRsq@lx-t490>
 <20260505133350.GAafnxvtgFxJHth8WB@fat_crate.local>
 <20260505151242.GDafoI6oOOs9hknrrK@fat_crate.local>
 <CAKSQd8UvY2iLew9gFYEs0MCgPa9R8RiQLP+kJUb6Cw8BYo=yBA@mail.gmail.com>
 <20260506085049.GAafsA6dyeWjCr4wOE@fat_crate.local>
 <19B93CE3-37F4-42FE-97CC-200372C73462@zytor.com>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <19B93CE3-37F4-42FE-97CC-200372C73462@zytor.com>

On Wed, May 06, 2026 at 06:59:12AM -0700, H. Peter Anvin wrote:
> Sadly, not true; modutila at least does use these numbers due to the brain
> damaged way that cpu feature modprobe strings was done.

That damn thing!

---
Author: Borislav Petkov (AMD) <bp@alien8.de>
Date:   Wed May 6 16:43:12 2026 +0200

    x86/cpufeatures: Document that feature numbers can potentially be an ABI
    
    Way too late to change that so document it so that it is written down
    somewhere and not getting forgotten from time to time and the evil
    awakening during development of fancy new things can be spared.
    
    Reported-by: "H. Peter Anvin" <hpa@zytor.com>
    Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>

diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
index 1d506e5d6f46..5937e2a30da1 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -15,6 +15,10 @@
  *
  * When adding new features here that depend on other features,
  * please update the table in kernel/cpu/cpuid-deps.c as well.
+ *
+ * Note that modutils at least does use these numbers due to the brain-damaged
+ * way that CPU feature modprobe strings was done so the safe assumption is to
+ * think of those as ABI. For that look at do_x86cpu_entry() in file2alias.c.
  */
 
 /* Intel-defined CPU features, CPUID level 0x00000001 (EDX), word 0 */


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
