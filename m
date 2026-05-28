Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D7847ECC3
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983139; cv=none; b=cqa0QRqpWOFxBUgkR2Mb47We0Ho79G8uBHgtkl7ztrRRsWsR7vMp2cVTV/JTVTCicWrT/gOaIG/uVFZJi4QTeZGepHUCvIQG02zvSDUpw8ZLwdBXMA1gAmKyZ6WZjKIynxVvpKLFZ9Fx8U//kJD7BXXQsBvJb/nJVsZmEzIUGjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983139; c=relaxed/simple;
	bh=7PsV/lPJUipHrTfXVY36m34aQ2nGBD+pTn/Z24Ffaqg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i0/uCAJfOAWaYRQPwvR7frKjNpKcplb0sHmKqneOL/QBgOTHmVA4O5ougYchxk0wCZp5uf/yxLz+LdDyuRpiuPhiZjoWK/AE3eHIIITiy6f/4gjow8j3QFUKgHY/CEX1kswIlfwU5D/D4DmqYX2Gqr0GRX3DPYf3vqtnb5lUxnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=f2z7dh8d; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=q2DhBNIQ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="f2z7dh8d";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="q2DhBNIQ"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KxgFHB4mmTpW3f7Yfqq79u+k/lebkmZ2DbSwyYqnAbM=;
	b=f2z7dh8dnPpGBAltYWm7EW/14Fy4LPo3C7tgLRX/tJoIYIOWhDe36viI8KH6HOL5SJ/UWe
	lHsBKE7qc4Koj3JP5651W7W+b42+/kVLFjUTnB9Rpdsizfbel9xFAreLNNK6cMhw42DKj+
	qJfZsjIpgdz7oj/0/6kr40GKw2NFnsRRgbb9ZbV4XEPJr5Y4iTlIcpqG+5qWSaWwvL5CBo
	lc9o3DbZoe89f5DOzAQTs07q9Cshku0dNdFIJZlkqSIk2NaI5CCqCaRiC0R3JIt60/Tds/
	7rlzoqqSqs2r8swcLqgtXqNpqOyTzrI+0LcFTrX43ECy1P+AK3K0c0O3QY28xQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KxgFHB4mmTpW3f7Yfqq79u+k/lebkmZ2DbSwyYqnAbM=;
	b=q2DhBNIQHERt+k27LQuLNUQ7cjkQsqT0AsjJvSfU25TrrdTsqZ1c3/PxV6HagsiJ5nkj+S
	7Yg7OLnETygvS7CQ==
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
Subject: [PATCH v7 105/120] KVM: x86: Use parsed CPUID(0x80000007)
Date: Thu, 28 May 2026 17:39:07 +0200
Message-ID: <20260528153923.403473-106-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For KVM cpuid, use parsed CPUID(0x80000007) instead of poking at x86_power.

The latter is backed by a direct CPUID query and will be removed later.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kvm/cpuid.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
index 040e15ff87c5..ad0a5410899d 100644
--- a/arch/x86/kvm/cpuid.c
+++ b/arch/x86/kvm/cpuid.c
@@ -1764,13 +1764,18 @@ static inline int __do_cpuid_func(struct kvm_cpuid_array *array, u32 function)
 		/* Drop reserved bits, pass host L2 cache and TLB info. */
 		entry->edx &= ~GENMASK(17, 16);
 		break;
-	case 0x80000007: /* Advanced power management */
+	case 0x80000007: { /* Advanced power management */
+		const struct cpuid_regs *el7 = cpuid_leaf_raw(&boot_cpu_data, 0x80000007);
+
 		cpuid_entry_override(entry, CPUID_8000_0007_EDX);
 
-		/* mask against host */
-		entry->edx &= boot_cpu_data.x86_power;
+		/* Mask against host */
+		if (el7)
+			entry->edx &= el7->edx;
+
 		entry->eax = entry->ebx = entry->ecx = 0;
 		break;
+	}
 	case 0x80000008: {
 		/*
 		 * GuestPhysAddrSize (EAX[23:16]) is intended for software
-- 
2.54.0

