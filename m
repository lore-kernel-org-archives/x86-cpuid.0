Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180EC47F2E8
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983158; cv=none; b=CI19GaKkEX0UvcyvhfqMl2JgzlouP7orK2e5YMh9i3Haaqn9QtTj5iIVNnYUJKhnTG8o4yislgMhUwvoD6xUDgmFQSuCsRt2Lh77ZZzAHZmn+LwQtKBF9YZDxGSgywjH8PtLEeIE3fnTDCxdXr09L2ezYUIIrt4DkFQoFtRgUeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983158; c=relaxed/simple;
	bh=iYl1o7pffe54rRCv2+GpMYL0NBAoEC4t7k5pUMXDE6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CBRv5f+uzCFjiwoAUvX/+vvwF7tnBVtmTNcG7lsbUUnxVx6zUkpm044O6IC4ONJEX6IPo9tObLRdPLPFEfEWa7ceJ4d6xYUCA3T+gU0APdY4v/jH39y/b9v27vOKObi06QYv4yrMiY8wPKjCLxwgV9h9ZizxdtKnUp7uFTc47NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BKGBb2qE; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yfTSUyBj; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BKGBb2qE";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yfTSUyBj"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yAiB+kWZAA0BC3O8l7lcQ9GmdFwRRVMBmwOZGoqly6E=;
	b=BKGBb2qEPOo+Hik+tjiOKO2+ZeMSBp5oMpAMNAkMjtq7iWpokLdREwtNzC84lwce8F5buV
	wef/TBmk+evluLyMOwvJo6LyI5j9VpKJLNATJ5eW9BLQlUCtB9cRPK51m0li4/KjjLrQpy
	J+FnITcm5qQ8q18LCn/qKu8sP2E1GSdTg17bkR39jRP0+Qwumf2HryHbUBKuCh9G1z+PY1
	dxq7va0x5iECKLLNsYxe/EpJz36xaTTb9iTx8V/BsWOGA27I4+igv5a+tIJ//4DK4bRmkY
	Hei/Y0URO+annhrnBVzX7RmTHnPUPdmMlQA84DEcNW2YMsNLW20HaxIgzreYFw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yAiB+kWZAA0BC3O8l7lcQ9GmdFwRRVMBmwOZGoqly6E=;
	b=yfTSUyBj/qlaNPk+Nt3xJNbQKeapCTjbNGKxFix6F1N9PFTIJxU8O0PdLL//t2SYmR5Auu
	k+/3yIJU8JS00uDw==
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
Subject: [PATCH v7 111/120] x86/percpu: Add offset argument to x86_this_cpu_test_bit()
Date: Thu, 28 May 2026 17:39:13 +0200
Message-ID: <20260528153923.403473-112-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

x86_this_cpu_test_bit() assumes that the queried bitmap starts at the base
address of the percpu object.  For X86_FEATURE bitops, this matches the
current cpuinfo_x86::x86_capability[] layout.

Upcoming changes though will route all X86_FEATURE queries to the CPUID
tables, where the bitmap resides at the per-CPU CPUID table plus an offset.

Add an offset argument to x86_this_cpu_test_bit().

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpufeature.h |  2 +-
 arch/x86/include/asm/percpu.h     | 34 ++++++++++++++++++-------------
 2 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/arch/x86/include/asm/cpufeature.h b/arch/x86/include/asm/cpufeature.h
index 520949560138..b12bde4986b5 100644
--- a/arch/x86/include/asm/cpufeature.h
+++ b/arch/x86/include/asm/cpufeature.h
@@ -56,7 +56,7 @@ extern const char * const x86_bug_flags[NBUGINTS*32];
 
 #define this_cpu_has(bit)						\
 	(__builtin_constant_p(bit) && REQUIRED_MASK_BIT_SET(bit) ? 1 :	\
-	 x86_this_cpu_test_bit(bit, cpu_info.x86_capability))
+	 x86_this_cpu_test_bit(bit, cpu_info.x86_capability, 0))
 
 /*
  * This is the default CPU features testing macro to use in code.
diff --git a/arch/x86/include/asm/percpu.h b/arch/x86/include/asm/percpu.h
index 409981468cba..8a36f0bb979d 100644
--- a/arch/x86/include/asm/percpu.h
+++ b/arch/x86/include/asm/percpu.h
@@ -89,15 +89,17 @@
 #endif /* CONFIG_SMP */
 
 #if defined(CONFIG_USE_X86_SEG_SUPPORT) && defined(USE_TYPEOF_UNQUAL)
-# define __my_cpu_type(var)	typeof(var)
-# define __my_cpu_ptr(ptr)	(ptr)
-# define __my_cpu_var(var)	(var)
+# define __my_cpu_type(var)		typeof(var)
+# define __my_cpu_ptr(ptr)		(ptr)
+# define __my_cpu_ptr_off(ptr, off)	(typeof(ptr))((uintptr_t)(ptr) + (off))
+# define __my_cpu_var(var)		(var)
 
-# define __percpu_qual		__percpu_seg_override
+# define __percpu_qual			__percpu_seg_override
 #else
-# define __my_cpu_type(var)	typeof(var) __percpu_seg_override
-# define __my_cpu_ptr(ptr)	(__my_cpu_type(*(ptr))*)(__force uintptr_t)(ptr)
-# define __my_cpu_var(var)	(*__my_cpu_ptr(&(var)))
+# define __my_cpu_type(var)		typeof(var) __percpu_seg_override
+# define __my_cpu_ptr(ptr)		(__my_cpu_type(*(ptr))*)(__force uintptr_t)(ptr)
+# define __my_cpu_ptr_off(ptr, off)	(__my_cpu_type(*(ptr))*)((__force uintptr_t)(ptr) + (off))
+# define __my_cpu_var(var)		(*__my_cpu_ptr(&(var)))
 #endif
 
 #define __force_percpu_arg(x)	__force_percpu_prefix "%" #x
@@ -570,29 +572,33 @@ do {									\
  */
 #define this_cpu_read_stable(pcp)			__pcpu_size_call_return(this_cpu_read_stable_, pcp)
 
-#define x86_this_cpu_constant_test_bit(_nr, _var)			\
+#define x86_this_cpu_constant_test_bit(_nr, _var, _offset)		\
 ({									\
 	unsigned long __percpu *addr__ =				\
-		(unsigned long __percpu *)&(_var) + BIT_WORD(_nr);	\
+		(unsigned long __percpu *)((u8 __percpu *)&(_var) + (_offset)) +\
+		 BIT_WORD(_nr);						\
+									\
+	/* Ensure bitops safety */					\
+	BUILD_BUG_ON(!IS_ALIGNED((unsigned long)(_offset), sizeof(unsigned long)));\
 									\
 	!!(BIT_MASK(_nr) & raw_cpu_read(*addr__));			\
 })
 
-#define x86_this_cpu_variable_test_bit(_nr, _var)			\
+#define x86_this_cpu_variable_test_bit(_nr, _var, _offset)		\
 ({									\
 	bool oldbit;							\
 									\
 	asm volatile("btl %[nr], " __percpu_arg([var])			\
 		     : "=@ccc" (oldbit)					\
-		     : [var] "m" (__my_cpu_var(_var)),			\
+		     : [var] "m" (*__my_cpu_ptr_off(&(_var), _offset)),	\
 		       [nr] "rI" (_nr));				\
 	oldbit;								\
 })
 
-#define x86_this_cpu_test_bit(_nr, _var)				\
+#define x86_this_cpu_test_bit(_nr, _var, _offset)			\
 	(__builtin_constant_p(_nr)					\
-	 ? x86_this_cpu_constant_test_bit(_nr, _var)			\
-	 : x86_this_cpu_variable_test_bit(_nr, _var))
+	 ? x86_this_cpu_constant_test_bit(_nr, _var, _offset)		\
+	 : x86_this_cpu_variable_test_bit(_nr, _var, _offset))
 
 
 #include <asm-generic/percpu.h>
-- 
2.54.0

