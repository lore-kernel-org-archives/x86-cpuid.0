Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17424D9909
	for <x86-cpuid@lists.linux.dev>; Wed, 13 May 2026 17:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778692205; cv=none; b=dBSWj+B2FGbJFIS1u38wYLpn1LBkL6Hr7nD5cNCUWG9Xl98UOakhAEvv87eeEhoeYw8yeUHy+t/rq2LW+UmO028JrTlEx5haqM4KGl0B7nUsEIKY6gYkqY4yUSC4i/AfZeXKvOG9BTV8y6qiE3PyJZM4F6YbeiUoJX0L1QyZPZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778692205; c=relaxed/simple;
	bh=BLfUucJAa1p7eBwP2/g+ZYdIdt9wEIKlDqPMbxMhOHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=impC2BGLHfFV8FsQHDo7aOkSds0rlFUIQ5cvYYkWy0lzavfZpA2tKg1j1gTQRa3tp3gmEHjfTNyBHJ6Nu9Mh752RG8RyFrUSlIA4ttsYCf93l6eXcrE7m+sZ19I1RN+hXLLyPo2J4JRE4QxYiPJE4gI3XrsqTqud56qSXZZ1WqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=X8rNKAsJ; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="X8rNKAsJ"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id B0D1F40E01A1;
	Wed, 13 May 2026 17:09:58 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id idMGb2mrgx1e; Wed, 13 May 2026 17:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1778692188; bh=eGNhxehJuvtYUstlvDzMF/lGpFYXMNdpZAa1DMzhi/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X8rNKAsJ4L7cDqDMnBr/ZyIDYrP781PggOcVWjhcRXrPV4Xkoz1j9a683WlCP2/Km
	 UkMV5xHBlWYDfgAyvqhch89T3RH/vJBI9GYZHEAXcwZKqa0NnuNooMJYIMuJukgviZ
	 tLQr91Arql/XUtaqX7zUO4XaBvNxni7HATWLUJ1ZKakMjLQoiPwm8ZxW2t0vQd0iRY
	 bKGEH4AeWqLWKA1/Usqzm6qEZcoOCy1zG3LC9bX0jIYqjzAELxSZmMzd4H15N+GF/t
	 yjGS8Nkjgn0x3n5qs+tEPBwpGYm57JAa/twe3QVgO3vCuSFU4fDnM8ZhvVHwyVn1wZ
	 wUEHSU/vi1ABReI45zHnz+udT+qns0fwF1ycF84vJQCkiHFXBh/PMF1alcbTnBF5WJ
	 bq+IsfaE4xZHombYPMZCHczCJ50cFOe82hJdiAbnItmDH0URPBKT/ZQToyNxgIQCCA
	 IprCZV/nXprrvcqEbDI2c4vcxOMp5Hbk3zgOkPwmI/98dstMqeTzgXRuxGmghslQQe
	 tQJgLhmrvCHylbNPBTXMkgTDfV+R7nApqpsI2yrC1tqzTUp9rmYhK0o0An5B1+Qs3Q
	 o8n0dViPVUKSlnmlAOyuHIuTGewYqtYheEs+dVR7Qu8nS9rqHnqaklnTcFtx2szPwU
	 JwYHX2Jz58DKuLH6j+zmLByI=
Received: from zn.tnic (pd953014d.dip0.t-ipconnect.de [217.83.1.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 7DF8140E00BA;
	Wed, 13 May 2026 17:09:33 +0000 (UTC)
Date: Wed, 13 May 2026 19:09:32 +0200
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
Subject: Re: [PATCH v6 10/90] x86/cpu: Rescan CPUID table after disabling PSN
Message-ID: <20260513170932.GIagSwTN4oawRCcEYw@fat_crate.local>
References: <20260327021645.555257-1-darwi@linutronix.de>
 <20260327021645.555257-11-darwi@linutronix.de>
 <20260511200032.GAagI1YMP51EzCo7dn@fat_crate.local>
 <agLS2Y7smYRHyiHf@lx-t490>
 <20260512143412.GDagM6ZLBpvt6X3jzq@fat_crate.local>
 <20260513152742.GDagSYbheCBWwNeVj-@fat_crate.local>
 <agShjbCo_HSs9YOf@lx-t490>
 <20260513165128.GFagSsEPFCogQu7n5t@fat_crate.local>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260513165128.GFagSsEPFCogQu7n5t@fat_crate.local>

On Wed, May 13, 2026 at 06:51:28PM +0200, Borislav Petkov wrote:
> I guess we need to know which leaf changes when a MSR bit is toggled and
> rescan only that leaf alone.

And looking at the current code there:

        /* Disabling the serial number may affect the cpuid level */
        c->cpuid_level = cpuid_eax(0);

So why do you need to rescan leafs at all?

We don't have to do them now...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
