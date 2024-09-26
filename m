Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614DC26AE6
	for <x86-cpuid@lists.linux.dev>; Thu, 26 Sep 2024 13:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727356370; cv=none; b=awyKPs/i8JUQ4LQ+C6jtNmt7Yrs4dSczCRRGEh1wcuP1QDHuctzjylrpZ1ZYnfIeDo61Qb4EJl+CAw3eSSpcZMKaf4/vQ0wmpTHYFaNblwq4I277lm6/XITvFIXg1RRRh1LsT+P46UOlRjVWZRhEEIGRM7iT56Yl9B/yo92J3DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727356370; c=relaxed/simple;
	bh=6Gq0JQ+CXW6EAzxNsoBDkW5Ejezi+l0iIa/6jBRFTPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S1ChcMP0S7wvPPfFbrMYOEtXgHJqWBNf7FNQDX+8B0pO+n+TEXEWZPvbimVrRQaSWWbqyA3ilA396ABYIPwEebAmL0HolpIwDhsq/c13HCrJOoJiEhO3pepHSo+nC6bSO3PnCEJueOGN7P6s8p9ayCNcLwrXfFI7cKo5BkfXVEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=M/b6/0EV; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=79KBvgS4; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="M/b6/0EV";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="79KBvgS4"
Date: Thu, 26 Sep 2024 15:12:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1727356366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1yXN7MXvHYide1pPfnE4vdW29HxVEnVYtaRIL2MPQ3w=;
	b=M/b6/0EV03PArwCc5lmCKAdxASProNtUbYZOUgFQZy03/PyWxX74CYlvGgSuWcwPLGk7z+
	xGHpnNmiAwnBCwPAMnVPx/ld+LEuHszYrBR96ZY+7tErDFlxj12SjAcGe4d++CweAOZn8e
	1aIw8bQNsVAABOrNbHLH5hDOR3nc0Lt15dVjnjK9GJMnqa9dVuwSzFPS6Ci30fnBSPYdeJ
	uj4XuWivXN+PB2AjnrN6pAzyddQRvffrGcQF5Z2oSspLSUjAp+qKFszU3SL52YKE1RAB2o
	BiYCi1Q/cX5b367bGr30ccOp7mc6EqxR76Trwyyjrpxyr2y8Y0IQxf8IpSOn8g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1727356366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1yXN7MXvHYide1pPfnE4vdW29HxVEnVYtaRIL2MPQ3w=;
	b=79KBvgS4bwG6+f2fszJWLfWrNMl0MpWpHgNYuc8h8VPTDKusfCqMQ9+T5CWhqHf6o4mqg3
	azBihFMYAu4fRGBw==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Sohil Mehta <sohil.mehta@intel.com>
Cc: x86-cpuid@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>,
	Xin Li <xin@zytor.com>, "H . Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH] db: Add Intel NMI-source reporting feature flag
Message-ID: <ZvVdzJIIqaC_javn@lx-t490>
References: <20240923223213.852758-1-sohil.mehta@intel.com>
 <70cf05c3-0ba6-4a5e-a7ab-21cadad3c255@intel.com>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70cf05c3-0ba6-4a5e-a7ab-21cadad3c255@intel.com>

Hi Sohil,

On Mon, 23 Sep 2024, Sohil Mehta wrote:
>
> >  <bit21 len="1"  id="amx_fp16"   desc="AMX-FP16: FP16 tile operations">
> >    <linux        feature="true"  proc="false" />
>
> I couldn't find much documentation for the <linux> tag. When is it
> expected to be included?
>
> Also, are the following linux hint attributes documented somewhere? I
> couldn't decipher them from their name itself.
>
> >   <xs:complexType name="linuxType">
> >     <xs:attribute type="xs:boolean" name="feature" use="required" />
> >     <xs:attribute type="xs:boolean" name="proc"    use="required" />
> >     <xs:attribute type="xs:string"  name="altid"   use="optional" />
> >     <xs:attribute type="xs:string"  name="procid"  use="optional" />
> >   </xs:complexType>
> >

Yeah, I should've documented the schema more, either in-place or in a
separate file.

The <linux> tag means that this bit is also represented inside the Linux
Kernel x86 tree in various means.

Here are two nice examples from leaf_01.xml:

  <bit2  len="1" id="dtes64"    desc="64-bit DS save area">
    <vendors>
      <vendor>Intel</vendor>
    </vendors>
    <linux	 feature="true"  proc="true" />
    <xen         feature="true"  attrs="" />
  </bit2>
  ...
  <bit0  len="1" id="sse3"      desc="Streaming SIMD Extensions 3 (SSE3)">
    <vendors>
      <vendor>Intel</vendor>
      <vendor>AMD</vendor>
    </vendors>
    <linux       feature="true"	proc="true" altid="xmm3" procid="pni" />
    <xen         feature="true"	attrs="A" />
  </bit0>

<linux> "feature=true" attribute means that the feature bit is also an
X86_FEATURE_* flag.  So, in the "dtes64" case, there's indeed an
X86_FEATURE_DTES64 defined flag in the Linux kernel x86 tree.

<linux> "feature=true altid=NAME" means there's an X86_FEATURE_* flag,
but the name is slightly different from the database attribute id name
(for various reasons).  Thus, in the SSE3 feature flag case, the Linux
feature flag is actually called X86_FEATURE_XMM3 (altid="xmm3".)

<linux> "proc=true" means that the feature bit is also displayed at
Linux's /proc/cpuinfo if available on the CPU.  So, in the "dtes64"
case, you'll indeed see dtes64 flag at /proc/cpuinfo on most Intel CPUs.

<linux> "proc=true procid=PROCNAME' means that the feature bit is
displayed at /proc/cpuinfo, but the flag name there is different from
the database attribute id name (for various reasons.)  Thus, in the
"sse3" case, "procid=pni" because that's how Linux displays SSE3 feature
flag at /proc/cpuinfo.

So far, that <linux> tag is not used by any of the XSLT transformers.
But, we plan to use this information as we go deeper into the Linux x86
tree refactoring(s).  For now, the goal was to cover all known names for
the cpuid feature bits, especially when they differ; i.e. canonical name
vs. Linux X86_FEATURE name vs. Linux /proc/cpuinfo name.

Thanks for the question! I'll indeed need to document that part of the
schema before the v2.0 release.

All the best,

--
Ahmed S. Darwish
Linutronix GmbH
