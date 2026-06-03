Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4464644103A
	for <x86-cpuid@lists.linux.dev>; Wed,  3 Jun 2026 12:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780490295; cv=none; b=ujr/xeZWKlcVV7dvQQ11weiFAIoBmcmuN0R81XpDrE24o7N333MpdmSYiI/jma7zDL3MKX/cBQqDmDU0FwoeLhGEchSg8wce8UA9SHDrJ6BEod+aEe2I9zlhkGN7PVusDx7rqGWP9q8hdGX8nL5pjnzsX1pMedcgYy/ZGz65fqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780490295; c=relaxed/simple;
	bh=StlVEVSuH412xi1zcy66Ebvh+j5lcG2PAiPIArAcDAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SE0od0J45gwkP3bD0eglvVqtq4IP81UMLx2OQauSIgxz91KPsCpQ8tk3jURwsy1Urer7LImuB7t9KiY+WvU2csofUvegT1i6udOFPtiD+etpz9OQ3e6nKtWXSwdDVz8AQ0Zm8tN+t8v1HRoMgM3J/6wGhv8B31s+v6DWe/ZJkTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qWwDCt94; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=5ow2ghv8; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qWwDCt94";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="5ow2ghv8"
Date: Wed, 3 Jun 2026 14:38:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780490292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yiZ2vA7NHCPOZYSUXAUkWjAP+hGfSLbBcvMKwd0i8gY=;
	b=qWwDCt94GnhfIUwZ7wmTLiui2fifpAwYrEY0TlO6EAMgrIogHaX++LjyIrbCqTA8+VAn7N
	JHGTPNtJGF+6AhY4bcK12sVyCfMdDp6yoaKoFSJqfCDoWhJfvBGclBlRUu0p/k2eLwYTuJ
	H9HReVblfLhgGWNcuLfB0IVjYuHKQIOzoB3XRqD++9q0+kl3oDBo+D38g8ooqfM4RFP3en
	YOvrriRiEfbiAPTMnbfytCDpYZzn+qyJylQbmWzgfqThgUK7Q0U4SLLmYP53b7TXg8uxkR
	WzfCp3E+GxizUwSZD3gvUI9oILS/LNyC4et53aIaFMA/eo7ae7SrwRj4714j2w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780490292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yiZ2vA7NHCPOZYSUXAUkWjAP+hGfSLbBcvMKwd0i8gY=;
	b=5ow2ghv829txLD2PGvUI318vqUaf0NL4xUsPaxjq5Mbxz6h2oLqtiCEvOoB55rhoPo6Mgm
	Ltbgqgo0WTnIa3Ag==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: mingo@redhat.com, dave.hansen@linux.intel.com, bp@alien8.de,
	hpa@zytor.com, tglx@kernel.org, sohil.mehta@intel.com,
	andrew.cooper3@citrix.com, linux-kernel@vger.kernel.org,
	x86@kernel.org, john.ogness@linutronix.de, ludloff@gmail.com,
	maciej.wieczor-retman@intel.com, x86-cpuid@lists.linux.dev
Subject: Re: [PATCH v1 2/2] x86/cpuid: Fix a few more typos
Message-ID: <aiAgMebb3JpT7g84@lx-t490>
References: <cover.1780487165.git.m.wieczorretman@pm.me>
 <237c2be340be63e67263c76f065b3aaa9fb1fbbe.1780487165.git.m.wieczorretman@pm.me>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <237c2be340be63e67263c76f065b3aaa9fb1fbbe.1780487165.git.m.wieczorretman@pm.me>

Hi Maciej,

On Wed, 03 Jun 2026, Maciej Wieczor-Retman wrote:
>
> From: Ahmed S. Darwish <darwi@linutronix.de>
>

Yes, this is the the CI output from x86-cpuid-db,¹ but I did not author
this patch.  Please keep the From lines as yours, since x86-cpuid-db
already has a git history with all the authorship details.

Also, could we please make the logs of the patches modifying these
auto-generated files consistent with previous patches?  Please check:

  49394b5af45c tools/x86/kcpuid: Update bitfields to x86-cpuid-db v2.4
  300ba891418a tools/x86/kcpuid: Update bitfields to x86-cpuid-db v2.3
  5e0c3c5e95f0 tools/x86/kcpuid: Update bitfields to x86-cpuid-db v2.2
  ...

So this series should IMHO be just two patches instead:

  From: you

  patch #1: tools/x86/kcpuid: Update bitfields to x86-cpuid-db v3.1
  patch #2: x86/cpuid: <leaf_types.h>: Update bitfields to x86-cpuid-db v3.1

And in both of these two patches you summarize the release changes relevant
to the modified files and add a link to the v3.1 release Changelog:

  https://gitlab.com/x86-cpuid.org/x86-cpuid-db/-/blob/v3.1/CHANGELOG.rst

I was confused actually what the first patch was doing, given the existence
of the second.  With the above format, the git history of these auto
generated files will be much cleaner.

¹ https://msgid.link/ah8-uSSdb1KcLByV@lx-t490

Thanks!
Ahmed
