Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B224DA553
	for <x86-cpuid@lists.linux.dev>; Wed, 13 May 2026 17:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778692933; cv=none; b=SB+LKlIx8BaH/obST++w8yAXrz0OfsOH5S950fh1+fiV8X8gfF/yS0drhtZVMOAMdUzqGVLxwUtO9romyBIzr+7chWqaQaZbGfIQHBKp1nY/dMM6CTtO/064f+2IraLu5xoK46iS0OnzcA9dK2vAP8pQnzKhVabqptSqIyc0VeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778692933; c=relaxed/simple;
	bh=cY9Y8rWBlzIvA3FfW1g494ERWunmJldAZ8d3jmLa0zw=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=gCZwJ2hruV78erTIL0slfXMnTJ4YqqPJiPz2dG9zWgDvEOl5JL1tixN1OgkdWARE8z4brBEg2IxePuVrhKTvzUyf4eaunBnlj9T0DhObOJEL3kDqGthZCo+0yw2Sdm3kLYZjHAQ5wqLI9JP5BXF1jHtXtIoAU18ZmIWsGJTVm38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=dCbe4S5p; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="dCbe4S5p"
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 64DHLInO3015542
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Wed, 13 May 2026 10:21:18 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 64DHLInO3015542
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026042601; t=1778692879;
	bh=K0ubH4aoqmo/5gcWtDokup5VvFs17iAoI+Hl5UvwKrA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=dCbe4S5pgED5a5Eo7P65tr6s2dER8MSm1Lfz0LpzjhpAxhA5exXYPZAlFe5giybgc
	 fDs6PTsPcSLYO8W6tMamhJ2BNKcWxzy2g6HB5iCrgH5hN7pMd68cJ/k6Ji3wvBZ2iR
	 ZxKLPM5pGhqL83/S+WnNfMfCtH+dbzCjEgQW2Fl2Td0ETWOWuExs+QFMV5TzoNRMu4
	 YI4Eq9Fnfmjt5r1CMba4tQ2VvAJCBHg5SxbHUwC+CEvQN4CcaygSIRPOt7pkgdUgxK
	 9/NGEzp395Xw76+tcq83TmlEFH1HJ6Maos+vqQS0X3t5DwGNEpUWQfXMvoFpOOfMDS
	 FavALZGOKYF6Q==
Date: Wed, 13 May 2026 10:21:13 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Borislav Petkov <bp@alien8.de>, "Ahmed S. Darwish" <darwi@linutronix.de>
CC: Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Sean Christopherson <seanjc@google.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Christian Ludloff <ludloff@gmail.com>,
        Sohil Mehta <sohil.mehta@intel.com>,
        John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
        x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 10/90] x86/cpu: Rescan CPUID table after disabling PSN
User-Agent: K-9 Mail for Android
In-Reply-To: <20260513170932.GIagSwTN4oawRCcEYw@fat_crate.local>
References: <20260327021645.555257-1-darwi@linutronix.de> <20260327021645.555257-11-darwi@linutronix.de> <20260511200032.GAagI1YMP51EzCo7dn@fat_crate.local> <agLS2Y7smYRHyiHf@lx-t490> <20260512143412.GDagM6ZLBpvt6X3jzq@fat_crate.local> <20260513152742.GDagSYbheCBWwNeVj-@fat_crate.local> <agShjbCo_HSs9YOf@lx-t490> <20260513165128.GFagSsEPFCogQu7n5t@fat_crate.local> <20260513170932.GIagSwTN4oawRCcEYw@fat_crate.local>
Message-ID: <C1E6A0F6-4BFC-44B0-9933-5080B24A880C@zytor.com>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On May 13, 2026 10:09:32 AM PDT, Borislav Petkov <bp@alien8=2Ede> wrote:
>On Wed, May 13, 2026 at 06:51:28PM +0200, Borislav Petkov wrote:
>> I guess we need to know which leaf changes when a MSR bit is toggled an=
d
>> rescan only that leaf alone=2E
>
>And looking at the current code there:
>
>        /* Disabling the serial number may affect the cpuid level */
>        c->cpuid_level =3D cpuid_eax(0);
>
>So why do you need to rescan leafs at all?
>
>We don't have to do them now=2E=2E=2E
>

Not to mention that the only change this *specific* leaf could cause is a =
change from 2 to 1=2E The only reason it matters at all is that the number =
of leaves is reported in /proc/cpuinfo for purely historical reasons (it is=
 completely useless information since parsing CPUID these days requires a l=
ot more than that piece of information=2E)

 
