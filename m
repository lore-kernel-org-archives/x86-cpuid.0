Received: from mail-43101.protonmail.ch (mail-43101.protonmail.ch [185.70.43.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820D646AEE8
	for <x86-cpuid@lists.linux.dev>; Wed,  3 Jun 2026 12:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780488171; cv=none; b=mFYNhSKeHLcpySScIuv/guCXRuhmHZaCPKnEh5xhkbdBGreM6HJZCq6QNCx18VrNs1wh8encPLSjDOZ2rRbHsK9PrZySjXwzeDB4gmfhXFZ3LLCeW3jtApwYff+CwPpq4rrPh8MnGb4ZfNt0tsEn3gh27XgbW5Q34VUkvc2X4Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780488171; c=relaxed/simple;
	bh=hNOitZL+9vhXa7HBNCVRLC7tkiM0ZFalO98cxxkZq6Q=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=OIXX0sE9AsQmxpTyXpzwtZbkj9ZRwM1xgOsjm7tx7dr95b0LcL+Q8XeSNDQt5ruNgyn8rmzxFyV4RTI44ATNKwhD7Ci27SNWv5C0iy5zj84hfdqUZ1tFUu1ieeG2z/2umWdN21f9IDwf2jiKl7Ni7XwO2fYXSqCgR+lgX/pxYlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=NtTNDR+e; arc=none smtp.client-ip=185.70.43.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="NtTNDR+e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1780488167; x=1780747367;
	bh=1voqKK1JRsaaqWLCH2t/vKxaHlkg7FvSJplCl8m1p+E=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=NtTNDR+e+EZD5d0u4BARsoJd9ZEdwIOxmJLYUNHmoylzWLA0BujKFz1kYIE6DPQcq
	 FOHBZvfIG2XGltxnlSkfiUDJarV8fZiEMSsuJXCD02HrGkp45d2p7WbTVmamUzKkHw
	 4WcDZd9UcoQY7zOK+ycbZUl98kVEY4PxCGg2W0PU4gYABCsHZsrh+Zd9nXIr6Cjum7
	 S4ARtiIxrTtrTld5DigSl7rpe2HMpbWfRkOWFWNxxNtYSsXq3xkTaCfUT2ER9l/QNp
	 u+aAdgqa2z0DR0ag8r7594HKYcco3+DZQb+8vRrt6hXOTJAtN76sFH1zT486MHnfST
	 qwkbQqrk6VWvQ==
Date: Wed, 03 Jun 2026 12:02:10 +0000
To: mingo@redhat.com, dave.hansen@linux.intel.com, bp@alien8.de
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: hpa@zytor.com, darwi@linutronix.de, tglx@kernel.org, sohil.mehta@intel.com, andrew.cooper3@citrix.com, linux-kernel@vger.kernel.org, x86@kernel.org, m.wieczorretman@pm.me, john.ogness@linutronix.de, ludloff@gmail.com, maciej.wieczor-retman@intel.com, x86-cpuid@lists.linux.dev
Subject: [PATCH v1 0/2] x86/cpuid: kcpuid: Update to x86-cpuid-db v3.1 with fixes
Message-ID: <cover.1780487165.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 991f57ea87ba56786b6067b2a6168f3858e77649
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Update asm/include/leaf_types.h and kcpuid's CSV to the latest
x86-cpuid-db release [1].

Changes consist of typo fixes and making formatting of entries
consistent with each other.

[1] https://gitlab.com/x86-cpuid.org/x86-cpuid-db

Ahmed S. Darwish (1):
  x86/cpuid: Fix a few more typos

Maciej Wieczor-Retman (1):
  x86/cpuid: Fix typos

 arch/x86/include/asm/cpuid/leaf_types.h | 62 ++++++++++++-------------
 tools/arch/x86/kcpuid/cpuid.csv         | 52 ++++++++++-----------
 2 files changed, 57 insertions(+), 57 deletions(-)

--=20
2.54.0


