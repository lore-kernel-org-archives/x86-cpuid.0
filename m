Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E065244D015
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983030; cv=none; b=bYsDKd93CsBZPFP97CSaZJJ3rkCaCECCTLb3aylfybypC/CNY+fkfNK3/C1yl6SlvVKMcdgSrtKE6rneYodBtBw5OsMmYxbkgdInXTDbtiD3BD0kFGQ73osM186CeUndEtcIm2VZ5o/adl6KVCO7NEUnGpiRpJ++vjjL6HaFt3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983030; c=relaxed/simple;
	bh=GsfqZ4AH01Sc/djHFURU3Zfm+tiG6HnRvpuSoMWoohk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tku2SexwkkIqxgO5rL/YiuOtkI/JavLIYLzCCU4Xs7uFemx8SvGxUXGwhYyMHY35jpZT2z/d+u8eXR3wSKekr7W8JeYVvVDPiaHP4PVuvRQDH/0Re+B0KahSCfd28v3uK9mFvw+/cDNmIXNVpGUYfSseWlT0pct3sQ9RRhnBeRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GN3MDaez; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fr37o7Wb; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GN3MDaez";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fr37o7Wb"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lxP14JpeWfYUl3vDBfyma6XrpNfSgBT3QgJlY9gqEzI=;
	b=GN3MDaezusCiezyyRYLnTuiOfnk9m/LtXE+bzOy+5kwLa4u/bcC58OnXGhB8VskRecD2lA
	yHqxmpRzA3+chbxKeMybaNQr7PUQczYAvq2k2dtxcEbCOFolkPHXDIz54PNgoO3kMxvG5K
	hEHhV/7wUXWHcoJpxssulvT5VaU6HfWyNP31ibSm/Z7S06cYnx7rhRiGGG/bTjONWOCABC
	0lp2mkHa2FfayN+9sfoAEzbi1nebI3KeeJB1Z3oLflyTrYXAJSDNyXxQ4E5gwljkNCU5mb
	ccczI0XYXGpT0eo/PVlC6Anajx09RnY4TQ8d9EgvrG+zqTXYPcqF130ntygI4g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lxP14JpeWfYUl3vDBfyma6XrpNfSgBT3QgJlY9gqEzI=;
	b=fr37o7WbYaOMrHeouRCg1PCUCOVk5uNGQRmRQ4+RZ3fN7y01MopGNcimSTFLd7dKN0M8JH
	GdBylVVnwItkLqAw==
To: Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Christian Ludloff <ludloff@gmail.com>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>,
	x86@kernel.org,
	x86-cpuid@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	"Ahmed S. Darwish" <darwi@linutronix.de>
Subject: [PATCH v7 072/120] ASoC: Intel: avs: Use parsed CPUID(0x15)
Date: Thu, 28 May 2026 17:38:34 +0200
Message-ID: <20260528153923.403473-73-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use parsed CPUID(0x15) instead of doing a direct CPUID query and manual
registers access on the output.

Remove the max CPUID level check as it is already implied by the CPUID APIs
returning NULL.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 sound/soc/intel/avs/tgl.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/avs/tgl.c b/sound/soc/intel/avs/tgl.c
index a7123639de43..d691ba06a4f7 100644
--- a/sound/soc/intel/avs/tgl.c
+++ b/sound/soc/intel/avs/tgl.c
@@ -45,13 +45,14 @@ static int avs_tgl_dsp_core_stall(struct avs_dev *adev, u32 core_mask, bool stal
  */
 static int avs_tgl_set_xtal_freq(struct avs_dev *adev)
 {
+	const struct leaf_0x15_0 *l = cpuid_leaf(&boot_cpu_data, 0x15);
 	unsigned int freq;
 	int ret;
 
-	if (boot_cpu_data.cpuid_level < CPUID_LEAF_TSC)
+	if (!l)
 		return 0;
 
-	freq = cpuid_ecx(CPUID_LEAF_TSC);
+	freq = l->cpu_crystal_hz;
 	if (freq) {
 		ret = avs_ipc_set_fw_config(adev, 1, AVS_FW_CFG_XTAL_FREQ_HZ, sizeof(freq), &freq);
 		if (ret)
-- 
2.54.0

