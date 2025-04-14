Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9312275872
	for <x86-cpuid@lists.linux.dev>; Mon, 14 Apr 2025 14:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744641133; cv=none; b=jH9qrWCDPiDqoc0YKqCIC9hrXkJH0nU3QF9dQG4bEPBQtQeeskahZgkxbZCxnJVIfvjkiQf2tvILMiztclZjdzsudoCCR+OwRyeaxxy3gb6gXwHwjUBI74ZRdXxMnQ9U3uLqPvEA+tsrVn+DXAb1XZoWsMz+ds2mh8Z37ADeP7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744641133; c=relaxed/simple;
	bh=qaPnQFoggjTvbZSrFzdoznbRVbBYn7p2ZNBLBZBMjhk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=XEm9Qes8EpoyYAMs4IIhpBnoYwPt4AwR8QL4/RprBclUhd6Flphm1SstEJWMKiCK/wQu1eHuUg33iD/Lr0nYECBNSdpz0I/Q3HidTeyzPVi8QYidiXguzJvIhsZBOmDZzoPPCZwAxGzX2R72tqHO2kESlJRLsQx6R0oFXNfL1YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CxVunIhf; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CxVunIhf"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e5cd420781so8690597a12.2
        for <x86-cpuid@lists.linux.dev>; Mon, 14 Apr 2025 07:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744641130; x=1745245930; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qaPnQFoggjTvbZSrFzdoznbRVbBYn7p2ZNBLBZBMjhk=;
        b=CxVunIhfVubhRe0pCnYEEb8VANcNBf5zpLvQpDpl4rwxFH93Nn6TwmJnnBQ86lnvc5
         PR+3fmCm6Umd43HSYwmucEefXOw/inE9+FtWZEwkrS/rhf6pPka5w+2J/glTEeKTqI0w
         +pZEqdyXeaisVHho8YqfYRe4PbyB61UhGBCP3ACiUdwFxFTsGffuW0bFXBc/kBSxa8mN
         O9zHyLQdK7O7L8WeI08Ys4+Sfuadj7d0whmxJalw3eJIZeJs115YQHFA9L7PBHIujR7d
         ZpEycxtuMofdpxlU3dS/TNAq3a42scugB2uXvYabBndGQlOCCsulH0lQBq1meJ/41Izo
         IK+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744641130; x=1745245930;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qaPnQFoggjTvbZSrFzdoznbRVbBYn7p2ZNBLBZBMjhk=;
        b=QV8LtmQEl5YQ4FKJcXoPX/wsoRJuZDwmTPHD01H0isCX4gyzt1Qa5Z73N8DnwHL2r1
         24sGY5mm6boy61++P1YrbK0pJGWRbXa11Cj7onXDCpc3cympMKysLI2l5Az4KaJprUp7
         JlY7jD5lDIzEk92mCkLO7Jq1QnSjBfVNs6OCpRh7kFYryHVp3m4LnMudAULuTJjQsFM1
         FAPUZEFzByIXbDVqDt7rUqtfAsy68cZWyHekwwjRFrxnOI4b1CkiFn3+mZK8xTktWkRc
         gAe668O+k5C2zEgD2bKOKSdMfb7voyE0gufBXMxnQVxGo+/EwAtqV+yxlz0DMGEatI4z
         BtMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUA/5zxgpHZlFC14VS/Uux/UOLmWIg50xIo9x3zUtmofNUiQo5KEeOXVCjHnQvVjKqIyQlKkJv+wAI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzUEs8mYcgHWjLWUfISiySIGE9bzxm34AMUneLfwatYU/vw1tsF
	bpoTCZntJwA8hobE7Gks30d9kJvtLuW9BsHRRBAm/SLG9YRNzHQZqojN718yr/FvL7hSECNz9j+
	rWvCgDM3NV7obtn/Dcl3+rExxd48=
X-Gm-Gg: ASbGncvWkLgcxWFvjGv/ifh7SOZWYJCkZJ/jY+28pFRya54YTLMxaaTJT1hMg6MP4La
	w2H7Va7CgNL82Jld/gvDNEXEne4kB+ZvgyyqjKCct03MU0UID3dM8S6gRzeIXAFHtKyqGOYqDjO
	xEGpWUncEqngHLXd7xSeT5iw==
X-Google-Smtp-Source: AGHT+IFwifLEktr9aApbyUVSW8lz9lOQQfiZXAuDaosCai1wQCjS4QaqENkSe9iSjJgq3a6xKGk9HoI7OY+yLN/dBDA=
X-Received: by 2002:a05:6402:2350:b0:5ed:5fa2:98d9 with SMTP id
 4fb4d7f45d1cf-5f370115dfamr10868064a12.28.1744641129574; Mon, 14 Apr 2025
 07:32:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Reply-To: ludloff@gmail.com
From: Christian Ludloff <ludloff@gmail.com>
Date: Mon, 14 Apr 2025 16:31:57 +0200
X-Gm-Features: ATxdqUHgwk6QnA7tWrnbRv2z6G41jj9yv6cmRAuOUO6oR2RE0gElrJrwXP2CyaY
Message-ID: <CAKSQd8Ug3Vk3A7eE6nB8UbhmOBBzVpfAqDYLf35Ym444MeQRdA@mail.gmail.com>
Subject: Re: [tip: x86/urgent] x86/cpu: Add CPU model number for Bartlett Lake
 CPUs with Raptor Cove cores
To: linux-kernel@vger.kernel.org
Cc: Pi Xiange <xiange.pi@intel.com>, Ingo Molnar <mingo@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Tony Luck <tony.luck@intel.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	John Ogness <john.ogness@linutronix.de>, "Ahmed S. Darwish" <darwi@linutronix.de>, 
	x86-cpuid@lists.linux.dev, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

> +#define INTEL_RAPTORCOVE IFM(6, 0xD7) /* Bartlett Lake */

Please fix this. It has the core and the product reversed. That is, it
should be INTEL_BARTLETTLAKE and /* Raptor Cove */ to match
the bulk of that file.

And yes, you also want to fix this for INTEL_PANTHERCOVE_X
and /* Diamond Rapids */ entry.

The macros refer to products.
The comments refer to cores.

Consistency, please.
Sanity, please.

--
Christian
