Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B604657F3
	for <x86-cpuid@lists.linux.dev>; Thu, 28 May 2026 15:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983056; cv=none; b=S2RCq1wDQptzNgfnK17FXlCpn7P8q3J4QbKu20ScQf4J2liGc2wlalOtszQbKLPFRrf9LprvRNtn8uqYsUOIamK7L/0vkMa4G1XfMR5P1TQqaPsEwQhKUHkUkmd6sg+X0qsYg05oAnV5istL8Erc7upnVuHB8nfVVcQ7pvBp+5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983056; c=relaxed/simple;
	bh=L/1ikR02exlB2c3QbIKqepsPr7AmfW4/46RPeFrE5gU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sqhAGDErRFZOUc+uCM2QAFmcY7RL9ANNESVaUJZ9GoIRAzNztvne0EVotvI4hIE1Ko8k9qFE85eO1U3LGAmg3UmM+uFCEZyH+9Yo8lsGQ7++slcqxH4AsKwDDyRYrQej9s8kyvF7aAx9mk/xF4UpppQGF9tMpgGa8YhDWgu0gEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VO0FCheP; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=+9sSw2hz; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VO0FCheP";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="+9sSw2hz"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779983053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XhOq7bjuxKHILY+GaiuJSrtf8kbVxcqX/3Xm7uhrUxc=;
	b=VO0FCheP7EeTgNSyVKQDNnV1N6RXex4skauUFsweT7uV0H9tFA/WTJRPZ+sFKuTdT2A43k
	Fv0AXo077d9NEzagwW9vNDF3IXo4kBsQd9TErTmZB81GoIIEB9NYVBDbanInPwCVqq8kni
	lJuN87rMlNKYhC6p2CSyKCauqtYJKkPCmkxD6AvYTTpS7Vi9f7tfjwOIuvkOctN48IuAbx
	3w0LC5ZFVj/08HlFRbgCoKB5r2H48M5H2tejdDf3gGTIDBGMpqiw7bcllZIy5zx2qHY2SR
	WB+B+eHL02LwvztIfMyj0CR0GoYMS+JLqZl7k8ib+6gUbMjUENtAeNmDqxzGPA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779983053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XhOq7bjuxKHILY+GaiuJSrtf8kbVxcqX/3Xm7uhrUxc=;
	b=+9sSw2hzeo0ILXwL6jq7qJRcWBRhOcYIVK+oXHV0ab8K18kMHYq35loDKIKBwTHAgZ41bf
	NIQKm3AdF1XDBkCA==
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
Subject: [PATCH v7 080/120] x86/sgx: Move unused CPUID(0x12) symbols
Date: Thu, 28 May 2026 17:38:42 +0200
Message-ID: <20260528153923.403473-81-darwi@linutronix.de>
In-Reply-To: <20260528153923.403473-1-darwi@linutronix.de>
References: <20260528153923.403473-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kernel CPUID(0x12) call sites have been converted to the CPUID parser API.
They should no longer issue manual CPUID queries on their own.

Remove all symbols previously used for manual CPUID(0x12) enumeration
move them to the SGX selftests where they are still needed.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/sgx.h            | 10 ++--------
 tools/testing/selftests/sgx/defines.h |  9 +++++++++
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/arch/x86/include/asm/sgx.h b/arch/x86/include/asm/sgx.h
index 04958459a7ca..bbd68fc0f839 100644
--- a/arch/x86/include/asm/sgx.h
+++ b/arch/x86/include/asm/sgx.h
@@ -16,16 +16,10 @@
  * together for better readability.  The architectural definitions come first.
  */
 
-/* The SGX specific CPUID function. */
-#define SGX_CPUID		0x12
-/* EPC enumeration. */
+/* First CPUID(0x12) subleaf for EPC enumeration */
 #define SGX_CPUID_EPC		2
-/* An invalid EPC section, i.e. the end marker. */
-#define SGX_CPUID_EPC_INVALID	0x0
-/* A valid EPC section. */
+/* Valid subleaf EPC section */
 #define SGX_CPUID_EPC_SECTION	0x1
-/* The bitmask for the EPC section type. */
-#define SGX_CPUID_EPC_MASK	GENMASK(3, 0)
 
 enum sgx_encls_function {
 	ECREATE		= 0x00,
diff --git a/tools/testing/selftests/sgx/defines.h b/tools/testing/selftests/sgx/defines.h
index 402f8787a71c..e1ab3b36e827 100644
--- a/tools/testing/selftests/sgx/defines.h
+++ b/tools/testing/selftests/sgx/defines.h
@@ -20,6 +20,15 @@
 #include "../../../../arch/x86/include/asm/enclu.h"
 #include "../../../../arch/x86/include/uapi/asm/sgx.h"
 
+/* The SGX specific CPUID function */
+#define SGX_CPUID		0x12
+
+/* An invalid EPC section, i.e. the end marker */
+#define SGX_CPUID_EPC_INVALID	0x0
+
+/* The bitmask for the EPC section type */
+#define SGX_CPUID_EPC_MASK	GENMASK(3, 0)
+
 enum encl_op_type {
 	ENCL_OP_PUT_TO_BUFFER,
 	ENCL_OP_GET_FROM_BUFFER,
-- 
2.54.0

