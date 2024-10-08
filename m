Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616551DFD84
	for <x86-cpuid@lists.linux.dev>; Tue,  8 Oct 2024 13:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728394275; cv=none; b=o3Q9e1idGpjO0VLfimazgkak3aEA/N9hsVUP8lgWCJ1xl5Gs8Up+tmfml4gKmJz8oIfZuY+9LwlFQchSGsQapf+jqvPNuMwhcMoTIWbu/5Upa4UosHTfYK6mfsrJ5pSHuis02xUMM3Km5X+ve7oO9h/SzVLjyHRh+JhUp5NX+gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728394275; c=relaxed/simple;
	bh=lxNZsxtGBlFl8eADXUABqyLvfdhrx3VgXl4xYSoH7Pk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DmM/9sZFVrdsVog5N7/Ol4keT7iBiNozsEVvN6+fTDuuvgu1pViaMJ6WHBPwrFCz69GjSeRGDRTWwN6S5MDCzaR0m8dWPik7fbH9w42ITBjKgAroWiVo/n6o+HQUe3uTN75U60uRYqPQOBKEKyC1w5Z+Q1ZwUpk1X6udSvTPY0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RLkdU8Pk; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=QPmH7t6k; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="RLkdU8Pk";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QPmH7t6k"
Date: Tue, 8 Oct 2024 15:31:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728394272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=gDEhOQtahYLtopKkCcWgKtqFkw83ei278di84r+ISIg=;
	b=RLkdU8PklPFShUQ0ZkaNSFvVnBkRfNojUbGYcETidFlTF0YDWf6MVIMa5nZdaLoJ9TKD4H
	odjopfwvSzfgGFSZ95HAYCoX4hGb4J/o58PDLiKgc9T/szmTkRo9iN0/4Kf3q3ZZpU1JnV
	nDpgcNll20UtlN/elYD0JJ4NCdxE6gFebaAAwtUGjsiEUKtBhZlat9jFSr2XnmnB2hHNX0
	SjefYuXkoesGhYc6+8KBqOpXU3D5VcWE3jYItlgMCRa3Nc2QrEMlR35xuavvKO9/2g/fki
	HnagwrFSc11LagQ0QXE8fvSQioW8UFlY5+2/sysHLBTTpKYdHwkqvWmzTOoozg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728394272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=gDEhOQtahYLtopKkCcWgKtqFkw83ei278di84r+ISIg=;
	b=QPmH7t6kCn4lFfT5H5YMyYA1BWRgGtjIPdnJpg9QgoYbh42kfMc5HsHMia//Ock8DEHib2
	0PhDI1QW3avNPgCw==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: x86-cpuid@lists.linux.dev, Borislav Petkov <bp@alien8.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>,
	linux-kernel@vger.kernel.org
Subject: [ANNOUNCE] x86-cpuid-db: Release v2.0
Message-ID: <ZwU0HtmCTj2rF2T8@lx-t490>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I'm happy to announce release 2.0 of the x86-cpuid-db project:

  https://gitlab.com/x86-cpuid.org/x86-cpuid-db
  https://gitlab.com/x86-cpuid.org/x86-cpuid-db/-/releases/v2.0

Changelog v2.0
--------------

- Introduce a new transformer, which generates one Linux kernel C header
  file for all the cpuid leaves' bitfields.

  (A single linux kernel C header file, with version tag on top, shall be
   easier to maintain than multiple headers; Linux x86 PQ pending)

- Introduce the cpuidgen --kheaders option to invoke that transformer.

- Extend the cpuid database bitfields coverage:

  - Add Transmeta vendor tags to the appropriate bitfields at leaves
    0x0, 0x01, and from leaves 0x80000000 to 0x80000006.

  - Add the Transmeta-specific CPUID leaves 0x03, and 0x80860000 to
    0x80860007.

  - Add Centaur/Zhaoxin leaves 0xc0000000 and 0xc0000001, along with
    Zhoaxin's exclusive feature bits.

- Add some documentation in the schema for the <linux> annotation tag.

CPUID bitfields coverage
~~~~~~~~~~~~~~~~~~~~~~~~

In total, this release increases the x86-cpuid database bitfield
coverage to:

    CPUID leaves:        63 leaves
    CPUID bitfields:     907 entries

Changes to generated files styling
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Beside the new cpuid leaves and bitfields, the generated Linux kernel C
structures has changed from:

    /*
     * CPUID leaf 0
     */

    struct leaf0_sl0 {
        ...;
    };

    /*
     * CPUID leaf 7
     */

    struct leaf7_sl0 {
        ...;
    };

    struct leaf7_sl1 {
        ...;
    };

to:

    /*
     * Leaf 0x0
     * Maximum standard leaf number + CPU vendor string
     */

    struct leaf_0x0_0 {
        ...;
    };

    /*
     * Leaf 0x7
     * Extended CPU features enumeration
     */

    struct leaf_0x7_0 {
        ...;
    };

    struct leaf_0x7_1 {
        ...;
    };

Overall, this removes ambiguity for IDs like 0x16, and improves kernel
code greppability (x86 PQ pending).

Finally, the generated CSV and C header files can be quickly checked in
full from the release artifacts at:

  https://gitlab.com/x86-cpuid.org/x86-cpuid-db/-/releases/v2.0

Thanks,

--
Ahmed S. Darwish
Linutronix GmbH
