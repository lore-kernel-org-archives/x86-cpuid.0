Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C833B7B7B
	for <x86-cpuid@lists.linux.dev>; Wed,  4 Mar 2026 14:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772636352; cv=none; b=tDX+kfVGt/AR/5SheUr/TtDp8ng/Mezm+UyCWlritFXy5NSf2viJg857eCShwvPEkOb3ZwGy7ZUym0V7ek3fNlOJMNLj+E5YGrmpgG+4t1m8hkFizwDKJrhboldekqMkA7vZnLUHcqm4rsqOHPKmtq8PBiTaP8UWJVFHiVEU/YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772636352; c=relaxed/simple;
	bh=Mu5PIqxnTAmW/dLgRZx164CcFgRZp6eV+r8aG0ZpIsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kemBh95QkvLsW6Vrq3l8vf0VOPfXsmMzl3dCXetkfpqzW6qvyviKj//Ol0NafYfEGKx7asc0qlLMhU5YMkCK4ysf/xIWblGk10fs/cuPfFNNQBtCafPPBgMzf5/uNB394ftLeaDTY89HdAvkNojDdn8mWKY5jA7zR7u2db1F1TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=JNfvrQof; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="JNfvrQof"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 3206B40E00DE;
	Wed,  4 Mar 2026 14:59:07 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id FImgFe2BXaeO; Wed,  4 Mar 2026 14:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1772636342; bh=WfRe2RIWfIybtxHl8v4WYbjFeZ+ENfjD3tSTCZw3PVY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JNfvrQofhRc4Dc7ao5zpAYmI5Pil7Dg/4stgvWb/yeCvH7yxQ7AmuBIkjtQduM6Gi
	 shF9enKbLJRCXF0MPAfwuSPf2yoYLPFUGbshZgmaG6tWWd6LB6CJ8mL9Rvrev1TAes
	 cZ3FtIBAvYkMwHuUOAqFxve1wwH/Sf8KHnZGG4ShTjlSlkyq0KgK21Vn3J+0IUvrGl
	 r9TGHGsM2+jVvh0UCsDgBSPiewl405+dN0lze87JhLMiulJCriJ6vo1JcW1jUPgQFk
	 8CXfIB0H7QfxGjDZPO419WH/ONLL7Qv1Cub09vWIGsJw0+bpToUr4zeLeKT8rILHCp
	 LeZL15zdNMILMl9HR2gLvkcQU+479USzBjBJnNCfjcKa5NDTl7NdGPDbEp+0dUeoGs
	 z9rJTy2c30l0jIm1LPR+8kQnBzfb49JXFimrO6HOSBRRAgOQjUsFOsdC4QfldCFIMg
	 uWyUz+QIleLN40GBC9yv68g8JzUW33sCU74dicVJ6CZH2CHaoxKuXB0MwH23c9U/vW
	 xxFaedL85bvsL79edtao/YFtdRONz1M1P7ROnnQuZgOSsI98ws9feW9P0QXPZGwfZL
	 vOM90YC/0BMqveezD5FJo5Xf4Vmpf+W4v9VFfgbAQ2ZQap8jLnmU9VONe21TEYxnGm
	 TmEgZRI460M7zk6IMWOsVn/Q=
Received: from zn.tnic (pd9530d5e.dip0.t-ipconnect.de [217.83.13.94])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id C79B840E0184;
	Wed,  4 Mar 2026 14:58:47 +0000 (UTC)
Date: Wed, 4 Mar 2026 15:58:40 +0100
From: Borislav Petkov <bp@alien8.de>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Sean Christopherson <seanjc@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 09/35] x86/cpu: Use parsed CPUID(0x0)
Message-ID: <20260304145840.GCaahIoOvMjf5_z03n@fat_crate.local>
References: <20250905121515.192792-1-darwi@linutronix.de>
 <20250905121515.192792-10-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250905121515.192792-10-darwi@linutronix.de>

On Fri, Sep 05, 2025 at 02:14:49PM +0200, Ahmed S. Darwish wrote:
> Use parsed CPUID(0x0) access instead of a direct CPUID query.

s/access //.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
