Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BA133B6E4
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774577884; cv=none; b=Py8UqUnXqMN5fw5MwfQW7ICAhofxgTp8L90wCvokHO0gQ+Bb2NK8Bb1CE79qSygYcXd0yT0BS50tFY5UQspYz8FEzMSF6VVKenoNn+dasrfbWgxQppmJaZyHp/ew2fdm49rmPJzsLYZFCukLeJ8toy6uqJqf/lI2oukLHgMBosY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774577884; c=relaxed/simple;
	bh=RoP2lKI84iP9j0jV0ffR/MG7Quj+LKMigM9fxgmDHAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uv0jmxPGkcA8OGCN2UzQZWWm96gFEVxZDVV7GuzAvZMD//rQhYBYt66uH/IiK+VhjoOSEsXPYNBRJEjAVp0hGIzsIljCnleF5OJTb4E2irBQbhr1507hN4YAHhyIEc9ouGwFcCEu5BbNrjT3LNEuex0vNd+XIuOWWrrUAvI53vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wRiLpzNB; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=XIdVUW1l; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wRiLpzNB";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="XIdVUW1l"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774577881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sml/7Y54i5S3ALNBOmu5um8G3+0GTHqkR9Tkf95GOBA=;
	b=wRiLpzNBpDKR4ZmA1hjGdV978BTnZargKD51BilK/ocjhuZiYkbKlmc4tpjW3w4HJiMRoa
	V8eYlI312N4nG0R4XWhNJ+TsvOUNLn8lderAldcYq5UIDK63Y9A5TCyTqirYASFFW5hCcm
	YVzxer8Css48JP1qerI6GWap5f8cnzfqrfV7GlrrnRlVyVNRfgPi+1yqZkyclg/Y7m+7x2
	+Gh/wrZS3XFHfI9DmeyA2cpsWyvpHD8VcdzbeY6aWQFAHR7NFrTxY0Xk573CP7JUHJUURp
	NknGHgBBXzJ0nhY/Mo9IFAi3cmF4tSD/JNJg7ZnDmR7eerUj+iJTVRPZ1I63DQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774577881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sml/7Y54i5S3ALNBOmu5um8G3+0GTHqkR9Tkf95GOBA=;
	b=XIdVUW1lJgyZl4ZaJeB093rl7gS0tckXKob42smyRsK2Z72sIPwrgLqt8k65WH667MydCS
	i5tq0QGUqf20A1DA==
To: Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Sean Christopherson <seanjc@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Christian Ludloff <ludloff@gmail.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>,
	x86@kernel.org,
	x86-cpuid@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	"Ahmed S. Darwish" <darwi@linutronix.de>
Subject: [PATCH v6 11/90] x86/cpu: centaur/zhaoxin: Rescan CPUID(0xc0000001) after MSR writes
Date: Fri, 27 Mar 2026 03:15:25 +0100
Message-ID: <20260327021645.555257-12-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Force-enabling Centaur/Zhaoxin CPU features through MSR writes leads to the
CPUID(0xc0000001) EDX feature flags getting changed.

Rescan CPUID(0xc0000001) in that case.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/centaur.c | 6 ++++--
 arch/x86/kernel/cpu/zhaoxin.c | 5 +++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/cpu/centaur.c b/arch/x86/kernel/cpu/centaur.c
index 681d2da49341..a97e38fa6a9f 100644
--- a/arch/x86/kernel/cpu/centaur.c
+++ b/arch/x86/kernel/cpu/centaur.c
@@ -44,9 +44,11 @@ static void init_c3(struct cpuinfo_x86 *c)
 			pr_info("CPU: Enabled h/w RNG\n");
 		}
 
-		/* store Centaur Extended Feature Flags as
-		 * word 5 of the CPU capability bit array
+		/*
+		 * Force-enabling CPU features affects the CPUID(0xc0000001)
+		 * EDX feature bits.  Refresh the leaf.
 		 */
+		cpuid_refresh_leaf(c, 0xc0000001);
 		c->x86_capability[CPUID_C000_0001_EDX] = cpuid_edx(0xC0000001);
 	}
 #ifdef CONFIG_X86_32
diff --git a/arch/x86/kernel/cpu/zhaoxin.c b/arch/x86/kernel/cpu/zhaoxin.c
index 761aef5590ac..55bc656aaa95 100644
--- a/arch/x86/kernel/cpu/zhaoxin.c
+++ b/arch/x86/kernel/cpu/zhaoxin.c
@@ -46,9 +46,10 @@ static void init_zhaoxin_cap(struct cpuinfo_x86 *c)
 		}
 
 		/*
-		 * Store Extended Feature Flags as word 5 of the CPU
-		 * capability bit array
+		 * Force-enabling CPU features affects the CPUID(0xc0000001)
+		 * EDX feature bits.  Refresh the leaf.
 		 */
+		cpuid_refresh_leaf(c, 0xc0000001);
 		c->x86_capability[CPUID_C000_0001_EDX] = cpuid_edx(0xC0000001);
 	}
 
-- 
2.53.0

