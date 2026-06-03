Received: from mail-244123.protonmail.ch (mail-244123.protonmail.ch [109.224.244.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B12472792
	for <x86-cpuid@lists.linux.dev>; Wed,  3 Jun 2026 12:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780488171; cv=none; b=VqMfpNnODdJrsKAwWEgjD+f0Hjf17NFKvfI4hPTKeIDzDJM3UTGD+OW2sfZ/01r41xosjV74ZOKNCtllkftmWnsBAwYiZFNwRKIDdTl1GagNIkZ5K6OVR88jTi8eR+vc4M/eJKvV7osmTp04clbbjf6xHsZAxAYiO4TE+0mFQWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780488171; c=relaxed/simple;
	bh=Ekp05GALZz8ODCTTqQhSaz01+x6hiv8LZLyq2m5MHTs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cBzQ3nCIxe5nIRlpgIfBCcnFymYnBvCbXBu5cYkGUets26gJ+LgOH/RJDRPK1Txf47Whi6a+EgAWbiK9nVcgighbJK0HpQSUzHfGKmS71IzIykry7uxbm9dGngiUTx/VyluSofV/rHJ0aBMsjGZdg/Gego2dVuZXsycQBICAjzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=MoOnCZzd; arc=none smtp.client-ip=109.224.244.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="MoOnCZzd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1780488162; x=1780747362;
	bh=OZqD/KhWk1D0S2VkBNLD1mZ2qg8N1RH4VwYDalBUInU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=MoOnCZzdMpo3Wq8US5l9kWBJ7z7wPJNHcJOGDog/pFrpRWm5y5agGfgaB7+zEHB99
	 FDmPREDlSZhQSEJ5rIVlgqMNX/ZxL/LQtH+7Zqo0UI0UVs8RVil8yNJxsEWNETlGQt
	 hwvyrI/duJLZ1rONFCUpNKLcOkGAmHLbpsi/uiZFiI7Yxkd4+A/DmWXDHosJBWziAR
	 mjbTgxsw7dq6F5vyW93OLnk54uv/MCXju3nUomC3Q0bOJfiePTh21AEKb2llEbjmbB
	 +rIgzkZvqHrUk88kExdDVPlzbkZILXrC9e2m67u8Mm8oDoNCndeDlFpeIi8lNxsmyz
	 J/w1hDexv4hKg==
Date: Wed, 03 Jun 2026 12:02:18 +0000
To: mingo@redhat.com, dave.hansen@linux.intel.com, bp@alien8.de
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: hpa@zytor.com, darwi@linutronix.de, tglx@kernel.org, sohil.mehta@intel.com, andrew.cooper3@citrix.com, linux-kernel@vger.kernel.org, x86@kernel.org, m.wieczorretman@pm.me, john.ogness@linutronix.de, ludloff@gmail.com, maciej.wieczor-retman@intel.com, x86-cpuid@lists.linux.dev
Subject: [PATCH v1 1/2] x86/cpuid: Fix typos
Message-ID: <7d4b42bb1f77a74e257850b466140ac1a5fee821.1780487165.git.m.wieczorretman@pm.me>
In-Reply-To: <cover.1780487165.git.m.wieczorretman@pm.me>
References: <cover.1780487165.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 0660bb951dde6bf3ce7e9943b89e92be535e692f
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>

Fix a few typos that were found during the kernel CPUID data model
review.

Link: https://lore.kernel.org/all/ah2WBnBkz8KQrph0@wieczorr-mobl1.localdoma=
in/
Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
 arch/x86/include/asm/cpuid/leaf_types.h | 6 +++---
 tools/arch/x86/kcpuid/cpuid.csv         | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/cpuid/leaf_types.h b/arch/x86/include/asm=
/cpuid/leaf_types.h
index 5b0008e455e2..b89435a3277d 100644
--- a/arch/x86/include/asm/cpuid/leaf_types.h
+++ b/arch/x86/include/asm/cpuid/leaf_types.h
@@ -711,7 +711,7 @@ struct leaf_0x12_1 {
 =09u32=09=09=09=09=09: 32; // Reserved
 =09// ecx
 =09u32=09xfrm_x87=09=09=09:  1, // Enclave XFRM.X87
-=09=09xfrm_sse=09=09=09:  1, // Enclave XFRM.SEE
+=09=09xfrm_sse=09=09=09:  1, // Enclave XFRM.SSE
 =09=09xfrm_avx=09=09=09:  1, // Enclave XFRM.AVX
 =09=09xfrm_mpx_bndregs=09=09:  1, // Enclave XFRM.BNDREGS (MPX BND0-BND3 r=
egisters)
 =09=09xfrm_mpx_bndcsr=09=09=09:  1, // Enclave XFRM.BNDCSR (MPX BNDCFGU/BN=
DSTATUS registers)
@@ -771,7 +771,7 @@ struct leaf_0x14_0 {
 =09u32=09topa_output=09=09=09:  1, // ToPA output scheme
 =09=09topa_multiple_entries=09=09:  1, // ToPA tables can hold multiple en=
tries
 =09=09single_range_output=09=09:  1, // Single-range output
-=09=09trance_transport_output=09=09:  1, // Trace Transport subsystem outp=
ut
+=09=09trace_transport_output=09=09:  1, // Trace Transport subsystem outpu=
t
 =09=09=09=09=09=09: 27, // Reserved
 =09=09ip_payloads_lip=09=09=09:  1; // IP payloads have LIP values (CS bas=
e included)
 =09// edx
@@ -1380,7 +1380,7 @@ struct leaf_0x4c780002_0 {
 =09=09amd_e400=09=09=09:  1, // CPU is among the affected by Erratum 400
 =09=09cpu_meltdown=09=09=09:  1, // CPU affected by meltdown; needs kernel=
 page table isolation
 =09=09spectre_v1=09=09=09:  1, // CPU affected by Spectre variant 1 with c=
onditional branches
-=09=09specture_v2=09=09=09:  1, // CPU affected by Spectre variant 2 with =
indirect branches
+=09=09spectre_v2=09=09=09:  1, // CPU affected by Spectre variant 2 with i=
ndirect branches
 =09=09spec_store_bypass=09=09:  1, // CPU affected by speculative store by=
pass attack
 =09=09l1tf=09=09=09=09:  1, // CPU affected by L1 Terminal Fault
 =09=09mds=09=09=09=09:  1, // CPU affected by Microarchitectural data samp=
ling
diff --git a/tools/arch/x86/kcpuid/cpuid.csv b/tools/arch/x86/kcpuid/cpuid.=
csv
index 9f5155c825ca..d25346733aac 100644
--- a/tools/arch/x86/kcpuid/cpuid.csv
+++ b/tools/arch/x86/kcpuid/cpuid.csv
@@ -433,7 +433,7 @@
       0x12,         1,  eax,       7,    secs_attr_kss          , Key Sepa=
ration and Sharing
       0x12,         1,  eax,      10,    secs_attr_aexnotify    , Enclave =
threads: AEX notifications
       0x12,         1,  ecx,       0,    xfrm_x87               , Enclave =
XFRM.X87
-      0x12,         1,  ecx,       1,    xfrm_sse               , Enclave =
XFRM.SEE
+      0x12,         1,  ecx,       1,    xfrm_sse               , Enclave =
XFRM.SSE
       0x12,         1,  ecx,       2,    xfrm_avx               , Enclave =
XFRM.AVX
       0x12,         1,  ecx,       3,    xfrm_mpx_bndregs       , Enclave =
XFRM.BNDREGS (MPX BND0-BND3 registers)
       0x12,         1,  ecx,       4,    xfrm_mpx_bndcsr        , Enclave =
XFRM.BNDCSR (MPX BNDCFGU/BNDSTATUS registers)
@@ -466,7 +466,7 @@
       0x14,         0,  ecx,       0,    topa_output            , ToPA out=
put scheme
       0x14,         0,  ecx,       1,    topa_multiple_entries  , ToPA tab=
les can hold multiple entries
       0x14,         0,  ecx,       2,    single_range_output    , Single-r=
ange output
-      0x14,         0,  ecx,       3,    trance_transport_output, Trace Tr=
ansport subsystem output
+      0x14,         0,  ecx,       3,    trace_transport_output , Trace Tr=
ansport subsystem output
       0x14,         0,  ecx,      31,    ip_payloads_lip        , IP paylo=
ads have LIP values (CS base included)
       0x14,         1,  eax,     2:0,    num_address_ranges     , Number o=
f configurable Address Ranges
       0x14,         1,  eax,   31:16,    mtc_periods_bmp        , MTC peri=
od encodings bitmap
--=20
2.54.0


