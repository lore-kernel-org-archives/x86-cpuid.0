Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5852B1E1E04
	for <x86-cpuid@lists.linux.dev>; Wed, 17 Jun 2026 01:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781658520; cv=none; b=rcEEW8vW9JwF4auMmzdGHL0H5ouuD90aFgJ2ioMkTMQZ8iuKbFZ5iWcjXhOFbmccwJEZcHeM93wl3lCb8DqlhR6aiayDs6fik2CeYH9g38vhAglavmoeUdetH4RTgwgr0PCFRgxJujMzbDatfoqdDK1o7ROcDeqkxqf0btHf/o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781658520; c=relaxed/simple;
	bh=hOWBJW4v7dJW5JYRnNO921XaDHiYgkooo/nCQR4hXBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O7BQIfl71T9bIuZCBAKHff67jiC1196IFpZnpgSFxCdSBuZF1+7MoYSU1kIzngy7ZAj3fvp7Xn2cv/fCLIl0DqTewe+tBmDJN4C3w73SxpinrSCHiummW/7c9iaz5EMHp6glhXzGVqyWteVykrHSNL8uRzv4biHK2d7uGyVGAww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=DMG45YgR; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="DMG45YgR"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 87CE540E01C9;
	Wed, 17 Jun 2026 01:08:35 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 9JWnrmYYJpqp; Wed, 17 Jun 2026 01:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1781658505; bh=S4yVGEhaqxkPsiU+R4dO2sDXVVhLR2t/yPRBbyv0g50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DMG45YgRe2Rh3Nt1CVDT1iNi67AfFAEOM9JPNScAxyPMN+gDnA6nScq7WkeDxrKB8
	 RkBKCEBemw3tEkrhbymBzfGKprK/oKuN23fls1jKfeA4BDm7CdArDhTxuuSCvQeYl7
	 owgWP4Sk+P4Q5D7VYDQSVXTxConDMLhzMuw0Rdy/L8lJdVj0/wlj7lQSYBs/RfUgby
	 c28TwrgpycMpGdqVs9YXwbp4vSRfI+CwhFtRoVigFJ5wpjeSdNhWU59tGcLW7M+FxR
	 fecTDGGM+H6WhsUo+eYhWq7bjo61XzpKtKsqk3JhExN15+P9okGp0dlM4mjbyhQbyT
	 YhXaUGe+DOaQKksyuDJzYSC9uW/xXk4Kx36SLxyVSzzJUMtstc3b/VhM1Zwy2ZAEcX
	 GTqlFoMcMhs5NTitjrsOdIu9qazbJ/ycUEMuOBvHEDZ0P5ZJsr5Hzlj3ahiBJ0xjL1
	 rIA9ZLmIdqeasBnUryDdQaWbAENOQc5P0uG3ZlB2r6JYpUUmmkkicW9jSZN+aX5rBB
	 3XD1gO90uI58U1we0ablB2EH1lgFX9PgYAmUzuKtV3ZxeMdlijioEmuE3tz3dkctWt
	 LU9rtvEu+Fdou0ARitcHGh3WKmt7TJ/QStt+37Hna1eXycWqTQLsb6ygtuHxVN6e7P
	 h1mirlR+UA8hu+fjPwQ7Aiv4=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id EE64040E00BF;
	Wed, 17 Jun 2026 01:08:11 +0000 (UTC)
Date: Tue, 16 Jun 2026 18:08:08 -0700
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
Subject: Re: [PATCH v7 016/120] x86/cpuid: Split parser tables and add
 vendor-qualified parsing
Message-ID: <20260617010808.GAajHzeOsoMYzO3XF4@fat_crate.local>
References: <20260528153923.403473-1-darwi@linutronix.de>
 <20260528153923.403473-17-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260528153923.403473-17-darwi@linutronix.de>

On Thu, May 28, 2026 at 05:37:38PM +0200, Ahmed S. Darwish wrote:
> Subject: Re: [PATCH v7 016/120] x86/cpuid: Split parser tables and add vendor-qualified parsing

This patch is doing two things:

1. split parser
2. add vendor stuff

I think it should be split.

> +static bool cpuid_leaf_matches_vendor(unsigned int leaf, u8 cpu_vendor)

This function needs documentation.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
