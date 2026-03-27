Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B1638F233
	for <x86-cpuid@lists.linux.dev>; Fri, 27 Mar 2026 02:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774578137; cv=none; b=IXjy74yKFUw5tLRxe6UH0InrlhfTfPL23TV4G+GpPfXtSKVyjeVCNO1jDn0Y0jRn2MIcdqsd6n77FJiSSJORftdyvCfLaO4d3tvzQrrdy/2YT9+a/kn3YnkaRa3w7o94vg8CXpVLAwJFrLKNE8ZcdIrZXPll1PGDK4f/YdAfKw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774578137; c=relaxed/simple;
	bh=UGzU1mq0mWTa3MC6NaQ1zDuSMBjlUw2dx1/E5mRiol8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IQ0sbxkQxFBse2XlHISr/3jJEr4A2Ahhz9OuUai887RoZidYbBM1ryBrYOc6m1zoX++woXUK15tn3zIAQji9vwGfDffSSozngCU+3NhHH8jpm3JueKp1PeSFoD0w7d5awPGxyYc7UJS9OxV9HMd7ktFEUXLEU4O0k6OuW5Yxamw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=csX6smVV; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=c+mj4E82; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="csX6smVV";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="c+mj4E82"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774578135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DXjrn8JaZj55Y3q5GBHuBALmB2iH7f42lYVO8MWGAqs=;
	b=csX6smVVqU8dVFeANDf4oVE/WqfJGsfwdxGccsu01oM3RwMI+Mhb9/frKKykSl8P3vuTYY
	MKiqPNwsF7ljjsXn/N/aX1D6IWasOKfZgYplyAfWDGDFkwfEOYQtnOwYQsWWy2X4JvtvwH
	H8YqrgOM9upbrNpdghzWtdsSQpYNkx6l/No4dX64EeGu1nlttzYjQFm+GG1DALhwEvnkJ5
	ml9CgFGcYoOmCxm7iz2tB1Rp6RuzBfYt6HpVQVtSHiNXJIlJbQzypiMfmKLb7SeLAUE6Mr
	mE/T36xeYYzepYT79bwm0XVPQB0YunRaSXbZDfQhD8gcHaK3hxPgHYHa+SoQFA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774578135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DXjrn8JaZj55Y3q5GBHuBALmB2iH7f42lYVO8MWGAqs=;
	b=c+mj4E82tg6Mi/6J6Xu2BgGQizDC3Vs5kyuQP7tNoyi2miIUsCCOpN1Dg+cMQN42f7wnnj
	7F40lfI0uCaEGWAg==
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
Subject: [PATCH v6 81/90] x86/percpu: Add offset argument to x86_this_cpu_test_bit()
Date: Fri, 27 Mar 2026 03:16:35 +0100
Message-ID: <20260327021645.555257-82-darwi@linutronix.de>
In-Reply-To: <20260327021645.555257-1-darwi@linutronix.de>
References: <20260327021645.555257-1-darwi@linutronix.de>
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
2.53.0

