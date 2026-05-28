Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96BA286419
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983109; cv=none; b=mCbzjpLur9L4l4JRlggI23iEsEK9ocLe7M5dE2kScMNp1g+incibdGAA3FqQRuEYjnrKyOq9yb9/u8a3WoQ6UBMAK2IW6psr+jLsp5K3nHylA8X0iUVBsrSXOE6pz740lJn3F1zrkLkbXCE6F8lUHgD4ObsZpq5CX/wTFfHhAyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983109; c=relaxed/simple;
	bh=KK9kC9xxUwIFWD7ws+buwaJbXM0b/ccm+VzfjYi+sfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=soSH5LhLh8ZWK4ueg6GUxHleOHunoPkrt8AvWakjquBXNuGmZxv3NWPiXqnXMhAsV7WS3968Y579TChDeQf0qhKNhjIq63fiknWLYSnwKM6dVFWUfFk2CY/ZZoKgVKlyqYY7wJCV8f28D3E5TxZ85LjAYl5XfMTi2eLDUr6gjrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tfl2UNVF; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VnBJL7IG; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tfl2UNVF";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VnBJL7IG"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XwtSzNQ4yoJqt77kf9CQcQ+HEsOJ17/pX7Pa+LfpgjQ=;
	b=tfl2UNVFa0lRAp5ILvL+hI6u/kGv1DV9i907hTiAUf8Xmg8etlJBd8fNSE0BXvnp10FA/S
	ZsJwxDK1lLLxPV/6TUVeRrnVoZU6u2fF3YvmFVoivJkRn81MboTtYX3DKEJI3U5egWh1Sd
	nTR2iZcMKZLF11VMT/eAf7L6VJw8x2mlRvLg6b7hEk7tSXsy0JQKYsiwChwYR3vu9ObvlK
	OrxR3iw6RDaBTxSZ5+CXnv+vZjiRhHYhojyyzuw+hf+HAC8m/CEFvOjRK4Lr0LNIpdZiqy
	gspNLlS1+fy4LqGaszBD9IXFt3thRFPGN2D/Xoi0dNWWUJKeMGJAZihZJZEcbg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XwtSzNQ4yoJqt77kf9CQcQ+HEsOJ17/pX7Pa+LfpgjQ=;
	b=VnBJL7IGgvVPlEgS5Tr8PjEZbP+avqjjC/mP2qBn0jC99T8vDg0An3j/qhVaXqvqvuuh+4
	LQ2CJg1enyfpfyDg==
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
Subject: [PATCH v7 095/120] perf/x86/intel: Remove custom CPUID(0x23) types
Date: Thu, 28 May 2026 17:38:57 +0200
Message-ID: <20260528153923.403473-96-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All CPUID(0x23) call sites have been converted to the CPUID API and its
auto generated x86-cpuid-db data types.

Remove the custom CPUID(0x23) types from perf.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/perf_event.h | 38 +------------------------------
 1 file changed, 1 insertion(+), 37 deletions(-)

diff --git a/arch/x86/include/asm/perf_event.h b/arch/x86/include/asm/perf_event.h
index 6270f4a26a59..ff844cec22ab 100644
--- a/arch/x86/include/asm/perf_event.h
+++ b/arch/x86/include/asm/perf_event.h
@@ -157,46 +157,10 @@
 /* Steal the highest bit of pebs_data_cfg for SW usage */
 #define PEBS_UPDATE_DS_SW	BIT_ULL(63)
 
-/*
- * Intel "Architectural Performance Monitoring extension" CPUID
- * detection/enumeration details:
- */
-#define ARCH_PERFMON_EXT_LEAF			0x00000023
-#define ARCH_PERFMON_NUM_COUNTER_LEAF		0x1
-#define ARCH_PERFMON_ACR_LEAF			0x2
+// _CPUID_TODO_: Remove subleaf 4 and 5 after defining them
 #define ARCH_PERFMON_PEBS_CAP_LEAF		0x4
 #define ARCH_PERFMON_PEBS_COUNTER_LEAF		0x5
 
-union cpuid35_eax {
-	struct {
-		unsigned int	leaf0:1;
-		/* Counters Sub-Leaf */
-		unsigned int    cntr_subleaf:1;
-		/* Auto Counter Reload Sub-Leaf */
-		unsigned int    acr_subleaf:1;
-		/* Events Sub-Leaf */
-		unsigned int    events_subleaf:1;
-		/* arch-PEBS Sub-Leaves */
-		unsigned int	pebs_caps_subleaf:1;
-		unsigned int	pebs_cnts_subleaf:1;
-		unsigned int	reserved:26;
-	} split;
-	unsigned int            full;
-};
-
-union cpuid35_ebx {
-	struct {
-		/* UnitMask2 Supported */
-		unsigned int    umask2:1;
-		/* EQ-bit Supported */
-		unsigned int    eq:1;
-		/* rdpmc user disable Supported */
-		unsigned int    rdpmc_user_disable:1;
-		unsigned int	reserved:29;
-	} split;
-	unsigned int            full;
-};
-
 /*
  * AMD "Extended Performance Monitoring and Debug" CPUID
  * detection/enumeration details:
-- 
2.54.0

