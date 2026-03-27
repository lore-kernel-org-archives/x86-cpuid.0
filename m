Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C4938F24E
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774578141; cv=none; b=PH6p/AkEoiwDjvodcbBc9/Nate0ENXd3QJ9Hj/ywszDNRnLpkUNrjmlzC13GYkV6Bc3URx1wvcwETIecL+xhU9zK2aHPwMgnr51c8U3cwI4uy0FTwPcvrN4HxkU7t6R2atadwoEHXXfr7x8nYbR3OCoFiblInTr2i9PUmidzsBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774578141; c=relaxed/simple;
	bh=sE08eqiU2xZOGqhKPBhyfzLZOLKANlL3MRoJtZaBHhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d9D23zBe98yJ4FEo3pcmILLf0Cfa7xK9DMv8lFOdV4tnqHtzO0ENdcY/lcudAH7Xrv4iUF4gG9cnAsvBzM4d0Jyo4aQe/N00WbVqt2jz9spXvuUak7xdv8twprAAhWWHm/DzCACbb2BKrK9SwUHhhZuyRTimrS07LuYm5l2WiuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VAL0CxNE; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=6SvnV/2V; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VAL0CxNE";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="6SvnV/2V"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774578138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d/LntpVYOfA4up32fys2FDzXvCQAm7j5iDmSNqaGO9c=;
	b=VAL0CxNEct5juydLn6AyvBJWny6N2M02Xrb+4qJRXPFomqMjHrpIDLw8cuX6rYGO/2G1ld
	mzD2zjY9igAgEM9XVUJDdbjDwL6LtmTu68/Jqcl11D3QRLDnGUfh8bZUENcP1Som10KxbC
	d7MWc/FTslq0ye/vJLJJhmwuMHn5LjSuDzb9yYFSsAR/LsJ52pBMD4C8ze+Qopc0uwT3J5
	ShxLZH91x9nuTLLKJmKIDKSyimWRQ2ADX9ZPD0LV24TmqSXAV4mLPPPf+IjKoEYqTTo2k8
	XbRxxO+zxY0ZmVMu2EK0tEoDLu9EtLSiC9tLb3HuZvl8d5Mz2lWhKIhPpHn3gQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774578138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d/LntpVYOfA4up32fys2FDzXvCQAm7j5iDmSNqaGO9c=;
	b=6SvnV/2VB+9TfAEFw6GWYmWN+837x6iDYrNkfJYVUPejcXekCRWzdiuZw2QCkYGUXKqN8/
	Bn3CsHTF8ptHksDw==
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
Subject: [PATCH v6 82/90] x86/cpufeature: Factor out a __static_cpu_has() helper
Date: Fri, 27 Mar 2026 03:16:36 +0100
Message-ID: <20260327021645.555257-83-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Later changes will route X86_FEATURE querying to centralized CPUID tables.
In that case, the X86_FEATURE's bit value from <asm/cpufeatures.h> is
different from the bitmap's own bit value to be checked by the fallback
capability-byte "testb" check.

Factor the asm goto fallback code out of _static_cpu_has() and into
__static_cpu_has().  Pass the X86_FEATURE bit, and the bitmap offset bit,
separately.

No functional change intended.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpufeature.h | 44 +++++++++++++++++--------------
 1 file changed, 24 insertions(+), 20 deletions(-)

diff --git a/arch/x86/include/asm/cpufeature.h b/arch/x86/include/asm/cpufeature.h
index b12bde4986b5..48643b4b1e24 100644
--- a/arch/x86/include/asm/cpufeature.h
+++ b/arch/x86/include/asm/cpufeature.h
@@ -90,29 +90,33 @@ void check_cpufeature_deps(struct cpuinfo_x86 *c);
 #define setup_force_cpu_bug(bit) setup_force_cpu_cap(bit)
 
 /*
- * Do not use an "m" constraint for [cap_byte] here: gcc doesn't know
- * that this is only used on a fallback path and will sometimes cause
- * it to manifest the address of boot_cpu_data in a register, fouling
- * the mainline (post-initialization) code.
+ * Helper macro for CPU feature detection with alternative instructions.
+ *
+ * Do not use an "m" constraint for [cap_byte]: GCC does not know that this is
+ * only used on a fallback path and will sometimes manifest the address of
+ * boot_cpu_data in a register, fouling the mainline post-initialization code.
  */
+#define __static_cpu_has(_feature_bit, _bitmap, _bitmap_bit)			\
+	asm goto(ALTERNATIVE_TERNARY("jmp 6f", %c[feature], "", "jmp %l[t_no]")	\
+		".pushsection .altinstr_aux,\"ax\"\n"				\
+		"6:\n"								\
+		ANNOTATE_DATA_SPECIAL "\n"					\
+		" testb %[bitnum], %a[cap_byte]\n"				\
+		" jnz %l[t_yes]\n"						\
+		" jmp %l[t_no]\n"						\
+		".popsection\n"							\
+		 : : [feature]	"i" (_feature_bit),				\
+		     [bitnum]	"i" (1 << ((_bitmap_bit) & 7)),			\
+		     [cap_byte] "i" (&((const char *)(_bitmap))[(_bitmap_bit) >> 3]) \
+		 : : t_yes, t_no);						\
+	t_yes:									\
+		return true;							\
+	t_no:									\
+		return false							\
+
 static __always_inline bool _static_cpu_has(u16 bit)
 {
-	asm goto(ALTERNATIVE_TERNARY("jmp 6f", %c[feature], "", "jmp %l[t_no]")
-		".pushsection .altinstr_aux,\"ax\"\n"
-		"6:\n"
-		ANNOTATE_DATA_SPECIAL "\n"
-		" testb %[bitnum], %a[cap_byte]\n"
-		" jnz %l[t_yes]\n"
-		" jmp %l[t_no]\n"
-		".popsection\n"
-		 : : [feature]  "i" (bit),
-		     [bitnum]   "i" (1 << (bit & 7)),
-		     [cap_byte] "i" (&((const char *)boot_cpu_data.x86_capability)[bit >> 3])
-		 : : t_yes, t_no);
-t_yes:
-	return true;
-t_no:
-	return false;
+	__static_cpu_has(bit, &boot_cpu_data.x86_capability, bit);
 }
 
 #define static_cpu_has(bit)					\
-- 
2.53.0

