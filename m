Received: from mail-106118.protonmail.ch (mail-106118.protonmail.ch [79.135.106.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E73B43E9E0
	for <x86-cpuid@lists.linux.dev>; Wed,  3 Jun 2026 17:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780506654; cv=none; b=OvcDYiql9cNQIvEAq0qDoqENufWGhYw4v58Ydp17G7oPgXLV5W7FoVKbztFNTX5QQExmRr3rvFC49t40kl+sqxBVWSc9FS5aE3CLJCdjgKx4qIg+t9CSqf4hLmM2ZOHxpTG57J4x553f3AzVjj6WzPQf4FAVkp8FIaP7XDGghZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780506654; c=relaxed/simple;
	bh=zckHlS7vRoeSg8jPL2VvtcAVZZYNhAz2y+5iFN/P9y0=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Smoh4EJXzN3L9rxvmunTYUjcVdMYAvxYkX4SF6GC5U9lzK2qmjKolaEEkhnX3HTVP/bfqZoy93j0jchhu2/UCDpYetrYUbCl/KcifntHq/Jb0eqtkBbBNzniMPE4Uf3tTvl24r0qwl5vKxk3npGlHbUsWsv4Zw4Bz99TJ50yJOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=A7dXMD5C; arc=none smtp.client-ip=79.135.106.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="A7dXMD5C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1780506648; x=1780765848;
	bh=u1eIQGVywyM45NHMpkmC9PbJXyIvG4/+zrKR3CULm5I=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=A7dXMD5CO/gfePV7X1vBvCxuFWTcSrPofD95GNenvbOcVLRbZZzos/6qor2Qq94V2
	 cXxsxefHjNe5wSMVGojsfG0+vc27U4hPnvFMxZNUiQdYWIIvr/kcwdrXzd8oFoGe9H
	 K+WqWQ1JdsbLFs9A9QrCYbbQKVYbFHB/z0GLNnqxx4VTbXxwhtEqaYDNnB77i4/oo/
	 Itc1UKYdzCNJj4c3BrZXdDPLTiB0vGWgydAuyDkBfh8gfp7HLy2EFPz1zvZcqbOrEw
	 05NM2uwFWlu7Bb6JJjMa3zvVgJKGTvZzKlsUVdxZRh7zYiaiud/iENqhmU/FGPgGTP
	 3qRZG6CN/5xNw==
Date: Wed, 03 Jun 2026 17:10:39 +0000
To: mingo@redhat.com, dave.hansen@linux.intel.com, bp@alien8.de
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: hpa@zytor.com, darwi@linutronix.de, tglx@kernel.org, sohil.mehta@intel.com, andrew.cooper3@citrix.com, linux-kernel@vger.kernel.org, x86@kernel.org, m.wieczorretman@pm.me, john.ogness@linutronix.de, ludloff@gmail.com, maciej.wieczor-retman@intel.com, x86-cpuid@lists.linux.dev
Subject: [PATCH v2 0/2] x86/cpuid: kcpuid: v3.1 x86-cpuid-db update with fixes
Message-ID: <cover.1780506200.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 4ab626c037a8d797ea6f145d93849d044006df34
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Update asm/include/leaf_types.h and kcpuid's CSV file to the latest
x86-cpuid-db release [1].

Changes consist of typo fixes and making formatting of entries
consistent with each other.

[1] https://gitlab.com/x86-cpuid.org/x86-cpuid-db

Changelog v2:
- Reformat the patches according to Ahmed's instructions. No code
  changes overall.

Maciej Wieczor-Retman (2):
  tools/x86/kcpuid: Update bitfields to x86-cpuid-db v3.1
  x86/cpuid: Update bitfields to x86-cpuid-db v3.1

 arch/x86/include/asm/cpuid/leaf_types.h | 62 ++++++++++++-------------
 tools/arch/x86/kcpuid/cpuid.csv         | 52 ++++++++++-----------
 2 files changed, 57 insertions(+), 57 deletions(-)

--=20
2.54.0


