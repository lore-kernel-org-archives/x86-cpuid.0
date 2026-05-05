Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DD117A300
	for <x86-cpuid@lists.linux.dev>; Tue,  5 May 2026 19:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778008327; cv=pass; b=hv37snm5f2H5YLhFQYjdTaX8X7PYz3WdAcIiW+bxFPqiPIc0w6jD3MzBedbQZAglaHW8Q/AGvyDO+zgi8jUBRszlRdMpyFZSHNAjnzbZ7rSEW15tzXXN9RcG3Ts+9+T7CQg4pEZXogJtmLYAlFxB6/gZqxHRkQSJRx1V1A7/GWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778008327; c=relaxed/simple;
	bh=2WabOMfm3ng1/6F7OWr6cexXgnsFtdx3v8mcWn3oNaQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JuFQgzFd/LDCkE473+HQSA6/LCgzQ6swiq680K1gtXA4wcn8/23SIkWBLR8v8fVv14qRyjkDfIoxjqQDRyAIOodpvG0PvmpJywKVGuBnER7+bILqSdi23G3TmsZ4gUA73eD8E+Y5XJfqxMjxNlNoLp1ta0NEV06rICva5Lphgnc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rJgIDsDT; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rJgIDsDT"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-bc4da3e2729so103174066b.0
        for <x86-cpuid@lists.linux.dev>; Tue, 05 May 2026 12:12:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778008323; cv=none;
        d=google.com; s=arc-20240605;
        b=J4hFs+PzAsCwP9kCLB7ajUgcF0pisRVkSVEx/U4RQe82oxkGgNMQrG5u2/O8g7Vjos
         D9xRXmzOAA85frP9M4RBaKgSLhPNZK+s87bUngigTr8PIIfXhidD5OAMES9JAhdFYfX3
         Un/KAFKUQJZrMqglUiwxU14xewU9evr3/k1zsvwOEddoCbgj+ebe+CaZnlLpBfCtaHUC
         mOEDPJXsLxNGprlmTsqRBVsSjDQwlzYRTpYR6xQE7Y5j5SJcp6tB2U7CU4cL7Vevqh0Y
         iik4IP0qWL6+GqRc2fmFigMRT4ITxSGQ8ihqrHww2gKMub6L17wsOCcaxEpVyTcM5p64
         nq6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=vgLFZBErrKcL8xgOhX456i9Ay3KCiO7YOnoGtc+aWtY=;
        fh=cf0O7x8FVghaAYa1NaYMtW63kmPq3t/+oCBYDosEGDI=;
        b=KMLFcy3uhubVTBWqvmnexcXKdUDhWN+C8ByO9aDI/R/pPlHHeGL2bfedrkmax/JSQa
         jvHvOrZjj1fg2z8utG2v4LqrmEx2uYkaVVjqIb1fhkjwbxHZIQfqgOrCb91LP30y00qY
         3oNuhjdmt08NDqYRaVPlRugfsDXGFw57OEpKgEscHacvVWDC6ajrscIi+VzoxpH7BxMX
         gOXySiCvAyp1PaCGGjKDdQJL4GFjI3oRbB9upNzt9rgBuQguNTnDTa1OQ89rAUbXjIEZ
         zz+cJBIZYd4aoQIeS08Ycau9sZ5T1eqj3cqj50HNSdjwOvEPRY5EQVEDWEhFIcx4f5r8
         XpcQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778008323; x=1778613123; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vgLFZBErrKcL8xgOhX456i9Ay3KCiO7YOnoGtc+aWtY=;
        b=rJgIDsDTGgVHQf++E8WBt5Rm6cGoYG91vIUs6A9JgK1Ki8tKKAVr/n1p/fo+jwI207
         nRar5CXAa/iCFPHLTR9LlwDwNy1jWASYyDdDfgahPAfEe/KfJQdJuMDNq/w9LqPj9wMG
         /dZDhfmwOEp4Z1FuYvokYui5uahVVm9iKPl/SISM17R8bi+4HMJFuc0nSxpwQ4wWqNkq
         eLlLL/Tu+N1+5ok3FZlcXTj6+YXgp8flmH1hhBEO5R7IN3enW2+bDFyiQSB8p6ousgmI
         6XhUhiUXb9LRu04xbyP6jQnirjLlMeQDTsYIsK76xZKvitMGEtZYGeM6HM9aSFlXI9TN
         4SEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778008323; x=1778613123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vgLFZBErrKcL8xgOhX456i9Ay3KCiO7YOnoGtc+aWtY=;
        b=iBE2uAn1jFq3dnAT5p7EPwBWQ5LViwdlNlLB4K9gv6pzwq9a6PnuNycWu5tRL0hhZv
         zRrrVE3O+NDL11aFQeOfcGNqpdT+3nvKqdygWfhQCYNxm8kLjd8K3k4reuSe/Vt/kPC2
         q9K0u65xlPO+jcVQfFaUYHw4tXtE+WjXPnjI4JGU/Dk6gg4VP+zpBDOAEm8OwCsvI3qR
         JKzwpo9tgLkPr0zV48fymSDsel+izKpsTpMuMPLfFIIPNGfvWGbhvF1biAjV8lUklfrt
         V/QueRcqWZgoTTzYWgBGSnKXGiY+9/wV80aFJsIW193OSFo3++qbOF5kieE20f9w24Em
         ogJw==
X-Forwarded-Encrypted: i=1; AFNElJ95KaZpCpFkEVG5yL/IyuVgWm1XOrAHTOsJggDLJnQ7/yX56qJNSWe92MgUa+jSqB9nHt8fzZvWg38=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/SRC1G+Vve/WxP6qJkXgV3Gt+CaS5T/ziu5ezhUDDzEnv+Kpb
	xZlhsvaQFAguEuM492w8TeLOqAkAlMLv90WSQTQa98QDbZHUXRn3/0b0vez0mp9Ro+fQ9s8S2Os
	lSp8GHFFoDFAezPHpFnOPdli9fwijZRA=
X-Gm-Gg: AeBDieuCEWh+iZgm8D1uBSI4BqNU4x6+bE5hw08ND4pDUIi3UE+uye+HsjuBUxIfCTy
	rVIBo0VvlFMjF5s7NXl5WrkEpq1VAJZqL/9iQs5uO+nhybwL0Msq+4M/2MT+Z4tyckjMi6CSQHA
	QQ3ysgST9/b1WV8FOFmu0bl5dGjFDRgYg/xYqlUKdH7D99u53RVTqMiLziubMC5b7cTpV7wpQg9
	xX3T0/nVkVgjjVo4GRHTyn6iRMOkSQ13Besng6PYp274lyCJAt5/BpgFbLXUyrK7y1VwGOSr0tZ
	2XBZ21ZQSHVvG1lqpyuWedbIjeymcIKDwJfoT+CDE7IQ0DD9oXA=
X-Received: by 2002:a17:907:5c2:b0:ba2:4338:e9fb with SMTP id
 a640c23a62f3a-bbffb846e76mr864040166b.32.1778008322429; Tue, 05 May 2026
 12:12:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260327021645.555257-1-darwi@linutronix.de> <20260327152354.GBacahCioljpw5QqUc@fat_crate.local>
 <acrBBFyU_vi4zFOx@lx-t490> <20260330230836.GLacsCdDkVu0H3XU4l@fat_crate.local>
 <adz3z_MaWJr_GOtc@lx-t490> <ae-uw9836AJScRsq@lx-t490> <20260505133350.GAafnxvtgFxJHth8WB@fat_crate.local>
 <20260505151242.GDafoI6oOOs9hknrrK@fat_crate.local>
In-Reply-To: <20260505151242.GDafoI6oOOs9hknrrK@fat_crate.local>
Reply-To: ludloff@gmail.com
From: Christian Ludloff <ludloff@gmail.com>
Date: Tue, 5 May 2026 12:11:50 -0700
X-Gm-Features: AVHnY4IaNyPOkDIX1jFmIuPXW9D65E3Mim1y0-lyojd7Olfb-71Mj55x5FH9Omg
Message-ID: <CAKSQd8UvY2iLew9gFYEs0MCgPa9R8RiQLP+kJUb6Cw8BYo=yBA@mail.gmail.com>
Subject: Re: [PATCH v6 00/90] x86: Introduce a centralized CPUID data model
To: Borislav Petkov <bp@alien8.de>
Cc: "Ahmed S. Darwish" <darwi@linutronix.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Sean Christopherson <seanjc@google.com>, David Woodhouse <dwmw2@infradead.org>, 
	Peter Zijlstra <peterz@infradead.org>, Sohil Mehta <sohil.mehta@intel.com>, 
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org, x86-cpuid@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 5, 2026 at 8:13=E2=80=AFAM Borislav Petkov <bp@alien8.de> wrote=
:
> On Tue, May 05, 2026 at 03:33:50PM +0200, Borislav Petkov wrote:
> > On Mon, Apr 27, 2026 at 08:45:23PM +0200, Ahmed S. Darwish wrote:
> > > * Keep the current synthetic CPUID(0x4c780001) and CPUID(0x4c780002)
> > >   bitfield listings, with their hardware-backed scattered bits, as is=
.
> > >   Mark them as "v1" instead of setting them in stone.
> >
> > Except that they're already cast in stone:
> >
> > https://gitlab.com/x86-cpuid.org/x86-cpuid-db/-/blob/tip/db/xml/leaf_4c=
780001.xml
> >
> > and that 02 one.
> >
> > I don't want any of that to be in any database - this is Linux-internal=
 only
> > and needs to go from there and nothing should depend on it.
> >
> > So, instead of taking this and then converting stuff ontop, the proper =
thing
> > to do would be:
> >
> > - rip out the linux-specific leafs from the cpuid db
> > - keep both facilities in the kernel for querying and convert the hardw=
are
> >   leafs to the new method but use the old method for querying the synth=
etic
> >   leafs. I'm sure we can multiplex between the two in cpu_feature_enabl=
ed()
> >
> > - then start converting the synthetic ones to hidden, Linux-specific on=
es
> >
> > Ok?
>
> Ok, talked it over with tglx - he brought up the argument that actually
> having those flags documented is good for other tools like crash, etc, wh=
ere
> you want to consult a single db for *all* X86_FEATURE flags in the kernel=
 - no
> matter how they're defined.
>
> So, what we will do is, we'll leave those leafs as is and not touch them.
>
> If we need to add new, solely synthetic bits, we'll add them where there'=
s
> room, document them in the db and that's it. Synthetic bits will be add-o=
nly
> and the cpuid-db will collect them.
>
> This way you have a single source for all CPUID info.
>
> The scattered.c thing goes away because we have full CPUID leaf
> representation now.
>
> We only get purely synthetic new additions to the db and we can use the L=
x
> namespace for that. I guess that's plenty of room for the foreseeable fut=
ure.
>
> Makes sense?

When Ahmed published, I added them like this:

  https://www.sandpile.org/x86/cpuid.htm#leaf_4C78_0001h
  https://www.sandpile.org/x86/cpuid.htm#leaf_4C78_0002h

That is, list which Linux word goes where, but not the bits:
for those, simply have a pointer to code (the "golden ref").

I did suggest two small improvements to Ahmed in private.

First, 4C78_0000 EAX should report the max 4C78 leaf, in
case there is future expansion. (CPUID does always grow.)

Second, the number of words reported in 0001h and 0002h
should be enumerated, in case the list grows, and so that a
program can tell between all-zero and not-present. (ECX>0
sub leaves, basically.)

Since 0001h has already used up all four registers, it can't
report a max sub leaf in EAX =E2=80=93 so maybe e.g. 0000h EBX
has to do the job instead: it could do e.g. two byte fields, to
report the number of words instead, i.e. 0000h BL =3D> 0001h
words, and 0001h BH =3D> 0002h words. (Or wider fields... if
you expect more future growth for words.)

That said, it would be good to get the initial set of commits
done so that db updates can start to flow in, to catch up...

--
C.
