Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6D7438FF5
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982967; cv=none; b=Up3BrqZPUSLWYueo5EkfSJThlA3Y3AKclnz+uskvASoj9Rg9melw3g6hg5NOg8lMve0BwNhe/jKP8pZgYxSLEuRdXGzp7mLEQ24DE0qUI6UtoFGV16rA1dTHoToB8lLfppYSoLYANzdEWAVWrGz/xYNcW7gUyYs6GPRB+txESsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982967; c=relaxed/simple;
	bh=47zD+8J/8CbmBWJ5KTw468g0/eK/SOXKQkm9KaesEPA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JAcPvoT/eKA9VF8zNSeVArIpYG89HKe6ZIprGS6YHNQxV3sizYjLnaQe1TiCOiVrolkj35+PR3X12kdvbNEFFP5fjE2JHcGo8geURmBOPvJoRu2Vjw6gcfW92ADn0YEEcuDWGCkd1jjn0AmRKaNihiipCLl1Rx7CV2YxHVkjJ/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=uY24mQ4a; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vRMp24H6; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="uY24mQ4a";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vRMp24H6"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P92cwmICW7XddJY+iMJcvZ9lc5RFe5xb/yx8TGv/6yw=;
	b=uY24mQ4aV2aHGOqkdVwxZTb14L7H5jb7WuFNRXVfh6Xbo2PLKmgl363gS8DHWKARUDuqva
	tn2a3EhG6vKWNAq+SECOVl4D10xxQ+sjqaHgHMYvKnStFcm10UB0E7edpGDTRq0ewRS6oP
	hh8mAkMg8mbTspTDH6OjmMZ1cFkBB4mlGhjN6iSFYV7k/XpvkTdF4UDSD3/2R8746B4H1E
	0wLJkLxVtR/F+m+BytXKRBA1wdf9/N8bo+dyNbj90evFwR+eFrmrWNuTyX1jhTXQX3rRmt
	we1bFPq3X0wrzKeMqGJ4FD+Bkpj6EB0+oxTSnpnZ9wVgC2i88L+TG3Fl8TXFjw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P92cwmICW7XddJY+iMJcvZ9lc5RFe5xb/yx8TGv/6yw=;
	b=vRMp24H6T3M8QxaTEpBLPDxKzlkc2/L5zu6JSSjecAjnyVkA5vhiFuw6jfZ61Sb7vlVu61
	ifoHhEeU8FE+2vBw==
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
Subject: [PATCH v7 052/120] x86/microcode/intel: Explain CPUID parser APIs unavailability
Date: Thu, 28 May 2026 17:38:14 +0200
Message-ID: <20260528153923.403473-53-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

intel_cpuid_vfm() is defined so that it can be used before cpuinfo_x86
structures are populated.

Explain why it should not use the CPUID parser APIs as well.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/microcode/intel.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/microcode/intel.c b/arch/x86/kernel/cpu/microcode/intel.c
index 18d2eff7a4b7..a3d0f8197d4d 100644
--- a/arch/x86/kernel/cpu/microcode/intel.c
+++ b/arch/x86/kernel/cpu/microcode/intel.c
@@ -123,8 +123,8 @@ static inline unsigned int exttable_size(struct extended_sigtable *et)
 
 
 /*
- * Use CPUID to generate a "vfm" value. Useful before cpuinfo_x86
- * structures are populated.
+ * Use a direct CPUID query to generate a "vfm" value. To be used before
+ * the CPUID parser is initialized; e.g. head's load_ucode_bsp() stage.
  */
 static u32 intel_cpuid_vfm(void)
 {
-- 
2.54.0

