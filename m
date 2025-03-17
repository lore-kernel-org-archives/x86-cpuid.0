Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5442D1C84C5
	for <x86-cpuid@lists.linux.dev>; Mon, 17 Mar 2025 18:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742236513; cv=none; b=fzdMvoWNUmwHabpvodRfyEqBst5DD67G4jleJOe7qG2A7RoEnd/lB/6YOTODOBNxtPDXYcFdjHzk1PvsKFccHY1pckg/q03GA9O70kyb9jDn+pM3dLkRt1NHWwfBf9WfUF0BZLBtCJsQ8rwd0y1mjaWCN8aObWn51PP5WD77UTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742236513; c=relaxed/simple;
	bh=ek9YgddfnB7BFeTMC4Vf3HuE7arpm/E4HIoOHz3t/gY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=XAzQT+InEqjk/ieaAbzMrOSxu263p+RtuCF+WHKZDWD7JPPXycwAxagsZxIpzSO5D63kbv/O7qz4v0tjovmY4C0rws35FdhFLgCOis27H5kiVUlmkIvIbCorNN6izuuARJflYvr2wRyfSHn/y12yjWUu7p+5BfsI8WAb7gtpTVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=DnCbKc3Q; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="DnCbKc3Q"
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 52HIYmoT663000
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 17 Mar 2025 11:34:49 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 52HIYmoT663000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025021701; t=1742236489;
	bh=R46N7/OZsh8Nvb1WuShBPq7hUHVX/v1qfMFp/HE9AAw=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=DnCbKc3QLQsLfVNBQYGlSMaGX5mTnYNh6MDDnJev87qhmrFZwpkWnPMdgvqvxGE8z
	 E8SlyxCCgAsodtp4QFmbe5oD/OPo5nuqenyf1DgzCWKY989lLGA38HDyNujgxEHHIc
	 AEeeGmMbpZ0tzyjjGB4vUqtz57QqY9uRYMsX4+rtY0rQf0+TL+KRC/zPXHkdgoPTUu
	 rIZO7ORmrD4Lsd4NkuGF/tnYpOASt62pAoSwOs1qLYlyaU4bFAVEn8a1CulpJ645ok
	 L+jWBrR+csbpXxx4qxzxokJeYxLLSxUrWRT4bEttPJXIURnSOcXshH97/tGS9kjaiF
	 x/puwPDR+HTLg==
Date: Mon, 17 Mar 2025 11:34:46 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
        Peter Zijlstra <peterz@infradead.org>, Borislav Petkov <bp@alien8.de>
CC: "Ahmed S. Darwish" <darwi@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
        x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_01/29=5D_x86=3A_treewide=3A?=
 =?US-ASCII?Q?_Introduce_x86=5Fvendor=5Famd=5For=5Fhygon=28=29?=
User-Agent: K-9 Mail for Android
In-Reply-To: <ccf47e0f-cd5e-4669-b75a-bbba9e56243f@citrix.com>
References: <20250317164745.4754-1-darwi@linutronix.de> <20250317164745.4754-2-darwi@linutronix.de> <20250317173216.GGZ9hcoDICYl1fBtBG@fat_crate.local> <20250317174848.GJ6888@noisy.programming.kicks-ass.net> <ccf47e0f-cd5e-4669-b75a-bbba9e56243f@citrix.com>
Message-ID: <49E87DED-AE70-4A58-BE74-670C369C60B3@zytor.com>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On March 17, 2025 11:10:27 AM PDT, Andrew Cooper <andrew=2Ecooper3@citrix=
=2Ecom> wrote:
>On 17/03/2025 5:48 pm, Peter Zijlstra wrote:
>> On Mon, Mar 17, 2025 at 06:32:16PM +0100, Borislav Petkov wrote:
>>> On Mon, Mar 17, 2025 at 05:47:17PM +0100, Ahmed S=2E Darwish wrote:
>>>> The pattern to check if an x86 vendor is AMD or HYGON (or not both) i=
s
>>>> pretty common=2E  Introduce x86_vendor_amd_or_hygon() at <asm/process=
or=2Eh>
>>> So if we need to check "intel too", we do
>>>
>>> x86_vendor_amd_or_hygon_or_intel?
>>>
>>> Nah, this is silly=2E
>> Would it make more sense to have a Zen1 feature and check that instead?
>>
>> Because, IIRC Hygon is simply a Zen1 copy=2E
>
>AMD and Hygon the most often compared together, because the Hygon CPUs
>are so close to Zen1/2=2E
>
>One trick you can do to make this easier is to define vendors IDs as (1U
><< $N)=2E=C2=A0 This leaves all existing code with equality checks workin=
g, but
>also lets you check "vendor & (AMD | HYGON)" rather more efficiently=2E
>
>~Andrew

Jinx=2E
