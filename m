Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CDA2E3FE
	for <x86-cpuid@lists.linux.dev>; Fri, 19 Jun 2026 03:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781838158; cv=none; b=iPTTEenjpwJllOUR3kTisBR4ZbUiGZhntgMi7u+aMdyCoKNLQGwbJKIhzTWuZJ56ClMTc6edSgHPGCrqFPlVAx1P6LAoZn+YYn4tdrHUuTkXxUpR1nPBxu1CMS22p2sQdG09xzqltpxIMMtqj7f3f8tnE7Pj0JbB5/N1jmbQyRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781838158; c=relaxed/simple;
	bh=u9DCmG373bN3b7tvO3y8U7KkABirHpI8FslG0Pcth2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SMD121qY3tLOaipmVpaciotW5yFx8SQxdDQsldPEqrE97KCaMiWnPl1WscPGKJ+d7sQv9HDlFm/UQ68jpnykplSUfTlLUCFZVxsRBrh1QE51olBWZAhMFBh/Us0F5HVjKFbux5JP+LtqZFQRVCjRQhhEm8aX2k6EpgfI1s45NHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=HY3Y5ecX; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="HY3Y5ecX"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 200F740E01D2;
	Fri, 19 Jun 2026 03:02:34 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 3kF1xx1Pgp-j; Fri, 19 Jun 2026 03:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1781838144; bh=V3xY2zZP0uawT1VCUDkx0V50xx4mnnmKkd4dQ5e1Ags=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HY3Y5ecXFTUBvogEmo5ZxkoLvz44usyujWlihZlHKNneQDPTczkQCxOtQ+BKyrf/D
	 7xDBO1fvP+43im9QypeF93mt0wv4gUWlWHInbj3Y2pVSPP0lyfPiVpafdEp3AKMhFq
	 kQFXpwFB4FK/SHn5rDVAip4hsFjvVgqTY84Hltm4ELb9AhvFi6D9gkFD/1gtJCLsGD
	 jzTdm0fnX6Yk9oJuVzfpXZqLwE2FTzAjc+VxHe9WwtEHkDH7INNA/Q+gM2FjjHq+VA
	 FbvbSlVeL02mCO/v/9IpJ0zygSMcWLWpeJhg3ACL2OsDpqapPmX8Vi63cPQsoQY2iR
	 d4O9a7g9l49NmsS0a/ZulJQJ0JVUC6NWlLSLaXEMB8LkvI8wi16NZmsJoT6efOn/yY
	 HZEiy3ET/vI2RteEGJxOvTqR++ltNC8AYhLVAZSP5Iw3B0hdTBKfz9wlDWQrMdE6pg
	 5KBWSEhcvY1rvEvy0c6oq5V8B7rfkcSJDITQPZAOsw52cqlu8faW0JD1NnxkImoJm6
	 3InOJ3MjhNLCusqCPUs7U1X79s0MCAiszcpvKOlG1gaqvexQxdgRnUqoyddwRpQm7X
	 7m/eRoSn4Y1n78Iq88F9MgtewyCbMuMA1TDK3OHSuBSgc6AewIB8lttAitE5MdkTK3
	 9bUZv3PJn0mpXLzgbLfKDt/M=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 671C340E016A;
	Fri, 19 Jun 2026 03:02:10 +0000 (UTC)
Date: Thu, 18 Jun 2026 20:02:07 -0700
From: Borislav Petkov <bp@alien8.de>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
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
Subject: Re: [PATCH v7 018/120] x86/cpuid: Parse CPUID(0x16)
Message-ID: <20260619030207.GDajSxL29eXbooYEC4@fat_crate.local>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-19-darwi@linutronix.de>
 <20260618185231.GCajQ-b8VSy19-y6xZ@fat_crate.local>
 <ajRI0lYAA9_rf51l@lx-t490>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ajRI0lYAA9_rf51l@lx-t490>

On Thu, Jun 18, 2026 at 09:36:50PM +0200, Ahmed S. Darwish wrote:
> The confusion stems from naming the vendor tags table with an _ENTRIES
> suffix, just like EARLY and COMMON.
> 
> I'll find a better name for it.  I guess CPUID_VENDOR_TAGS should work.

Well, this parser clearly needs a lot more documentation.

/*      
 * CPUID leaf vendor table:
 */

struct cpuid_vendor_entry {
        unsigned int    leaf;
        u8              vendors[X86_VENDOR_NUM];
        u8              nvendors;
};

that reads like a CPUID leaf to me.

Btw, for some reason you have

/*
 * Comment...
 */

static ... thing

with an empty line between the comment and the thing. Zap all those empty
lines pls.

In any case, this cpuid_vendor_entries is a mapping between which CPUID leafs
belong to which vendors.

So call it

cpuid_leaf_vendor_map

or so and explain above it what that is and how that is supposed to be used.

The aspect of saving yourself vendor checks is most prominent one so put it
there.

However, that vendor thing is problematic. If a vendor implements a leaf that
belongs to another vendor, that table will have to be updated.

So make sure you document this fact very clearly so that people can find their
way here when they extend the parser.

And so on.

But to come back to the original thing you're trying to solve: why are you
even trying to remove vendor checks? What vendor checks where?

The agreement with CPUID leaves is that, IF you're a second vendor
implementing the CPUID leaf of the vendor to which it belongs to, then you
better implement it exactly the same.

IOW, if AMD implements Intel leaves in the base range, then we make sure we
implement them exactly this way.

If not, those CPUID leafs return zeros.

So what vendor checks exactly are we fixing here?

Even without that, code reading CPUID leafs on a machine which doesn't
implement them, should get all 0s and all fine.

So what is going on here?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
