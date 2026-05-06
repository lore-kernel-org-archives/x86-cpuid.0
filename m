Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D35C21ABD7
	for <x86-cpuid@lists.linux.dev>; Wed,  6 May 2026 23:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778108638; cv=pass; b=VZLT505VSf7/a0JLJwcK8EwMGQxEAOP0vBdoyzU3VPGfPy4TW6QMkxQBNedM8/PN863tgoXYgiLY+9w0/BSDbhZdzWHzZvOW658XKIN93LoiUWYnI7mjwEEQOQAkN6rsdPxi35PAB8qpwUWC4SBppTOsrN5MA3CvleQC1nxLE38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778108638; c=relaxed/simple;
	bh=lY449Yat7j/EgfSC4QI2jMgIs3epqp1fmPaXu+43hgE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=shXk3uliFPGpmlgI4O4PfGCOFBbfqpNX1ZDyYIxnEyLI9rqs0T//Sa/gfnYpZ8BCNLQcdAKfUCd+axyORO0WQR8Usw5jI7BmB1y5Xhyma8XLmls44EH5HC5hkn+CpHXlZdkFeD6t5TmwvDFjwlOE8BHymhs3CArXXRdWTDLDI2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gbjlvR6l; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gbjlvR6l"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b9358bc9c50so28350566b.1
        for <x86-cpuid@lists.linux.dev>; Wed, 06 May 2026 16:03:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778108635; cv=none;
        d=google.com; s=arc-20240605;
        b=dwoy3AKwHzZdVTlyEaJk9s5PqTxKjgPHVn3POyiCK3HLOEsN43oDTGaU/7ee5p76e3
         vttvK11/4EK1eSnRw3WOkq0z9rK7hPgGPzdvuteozr78mA9N/MuGpq4TB+ocdU5fxIQt
         yGmhChqYWDfrqZt4nYSktBXJUUL3bLzHjgDMOVq60BB93PPZrLW9rFfj4NknjEz1inXX
         ZainmKH8ld1l+EWV3XmTo45PnRuH8C2m+/I6WYZooIzHwIKwhy6xmTotGhBD2geR6CMe
         /LruuwFVJaDIW5P3Rvja9OYAwX7kAOfEz8stmZlMqfzp1+JKEcjPaBC6FsChFgmISia8
         AqAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=Rdgp3TEU/YVFg1GLMybRVPIGIQdeJ6+uFtURofHkl8A=;
        fh=+qm2lIa6LguYdCP8vrp7uoAtW2BvIU5jC6o75k4qzsc=;
        b=TYEvWSugIy08kUHgYvJRT/vAAhc7LpUFiNQyBllytIX7cc24acQbMUmSiNzzxmfAfr
         vQwXaKNht0jdI/bd119SCSVGKs/hZARgcBONH+NS2U/5xsCpTyV4UUsIwIMEIrCIHJTi
         q616ZwHZRIMhUV84ILu4d2lYZn1Vc+mtkEw1dlol6clgTKm5vpqaO8+eK3D3+Jcila8K
         H+uH6zn4Ie51iqxn1WPO/c8+reYKfMvOwhacqdzqqzrPjYKmOTrq7ofGMGYjtEw1/G2B
         DGgAafJlGaRuAbcdXCaGKs4mcqUQp1L+FN4d8b1+B+6+5j0DNVB+MyltFuH5Lm1jy5yK
         Ogqg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778108635; x=1778713435; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Rdgp3TEU/YVFg1GLMybRVPIGIQdeJ6+uFtURofHkl8A=;
        b=gbjlvR6lRLCDgYQqYYTYUywujQBI0TkpgOX5GHEpNbzoUUPQEk+7vEZWHit4H69ypJ
         Yey8h5gDNTuspGDjPOXTkHyycbG+EKfhb10NQ4iVA+sinJ/qqFjzIxKcKgVVbtz5tHF1
         ukO/45MSTxK48ZduCsqd0N2enImDLk1QVFKh2NcnFmoQBtF/MLi+0an5UwPqByJtizno
         JAlwVRznbaxymSAggmNafrnP3EV43sFubVzKpxmJ5mm6OqKqfEKtErjfnLdZAXc/pAj4
         +IXqkY/jdz4QgSJFiSfJmQ2QdrtXUs1NWQvZDx1o8Va56uD0930Gr4jblBCTj/OJ1d6O
         Sw/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778108635; x=1778713435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rdgp3TEU/YVFg1GLMybRVPIGIQdeJ6+uFtURofHkl8A=;
        b=NQHiBY4aeo1CXh7K2g+0b1ZIsVncnJ/bAgxern9dFW1SSUDBSiDGbqxwQfZ1q8cIa/
         9KmSUVwYIHaXvDqOHL4hWsmGyUlJhY5v8SlWpVN5HE1W47lilWVUattUUt96RhyuTBLr
         OPyoihoZowLWtqwjAxJgYRel+CHNV+al0gjCMC8435XmcYXoqVAflop9UzHiaaKwuhIb
         VZ9Iu4bwSEoFU3NqPvsw+LQJeBjw6eH/Ze6sMTDYu5TIV3qhCqv3tFEJ3k0ucImFxJHa
         vKsEgIKhIUYcxkF5kqiw4Ir78OAkjjvSSfQOHlvWzoFj4sPZ0GrEEGcNYk8fFhIjgZ5L
         JzHw==
X-Forwarded-Encrypted: i=1; AFNElJ89+lwESR3O3kVHk4WLqkpu8vxZU4kZ26rKD1D4Oe0/GZhyn0MJ76AfDfau4qNH97RcxQRPSMtYYcU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyeLt9ibqrktPFvNw8pu8BUkK0B660c0x6wirtN30pKqBLSRF6o
	lzlI27dyy/DmW4OIgO3QMx7uLMUVjUwBl9nz1Xq98p8I6kIBEkPwoLftyb18i9YtFs52BbXaSwX
	2pki8dp9X21fWrm7kDjEzgojKCQbc9t4=
X-Gm-Gg: AeBDiesGzMyGEHf7tN8OCu9gVptu6laBfK69ShaQQfM7VUwY1dobV1Tr/YgFY7VCuSy
	DcTX/2m7Z95fxR37QvB8fPSnpBfjE+sS6Ly4w6eAQAiez3vyTBX/17m2b6SVj1ndgdnZ45PFvAj
	X1+lsiylrVX/4ONW6Z3Dnswzxpl3nXPhY0TeszFs0zJfFbwNVf5cBT9JASzyS3znrEIRrL1gzdw
	SukKZ9oIqMdTk7pWJoo8hgd36aeHpLw1QFeEjG4O4voTXKAs7zGVPqOk9/mWNIu6bvTgmLCK3FC
	PH93vcLYepXwcPXzZI1O37jcpC8njP5wQBj6n0DFzuP9SRiqKOI=
X-Received: by 2002:a17:907:3cc7:b0:bc4:aafa:65cf with SMTP id
 a640c23a62f3a-bc56c92bfc1mr314777766b.16.1778108634646; Wed, 06 May 2026
 16:03:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260327021645.555257-1-darwi@linutronix.de> <20260327152354.GBacahCioljpw5QqUc@fat_crate.local>
 <acrBBFyU_vi4zFOx@lx-t490> <20260330230836.GLacsCdDkVu0H3XU4l@fat_crate.local>
 <adz3z_MaWJr_GOtc@lx-t490> <ae-uw9836AJScRsq@lx-t490> <20260505133350.GAafnxvtgFxJHth8WB@fat_crate.local>
 <20260505151242.GDafoI6oOOs9hknrrK@fat_crate.local> <CAKSQd8UvY2iLew9gFYEs0MCgPa9R8RiQLP+kJUb6Cw8BYo=yBA@mail.gmail.com>
 <afu5QIInX1POppSl@lx-t490> <20260506221822.GGafu-Lnfw9I8PxOKQ@fat_crate.local>
In-Reply-To: <20260506221822.GGafu-Lnfw9I8PxOKQ@fat_crate.local>
Reply-To: ludloff@gmail.com
From: Christian Ludloff <ludloff@gmail.com>
Date: Wed, 6 May 2026 16:03:42 -0700
X-Gm-Features: AVHnY4KndPEbrHnXRwHI84uV3TSQO9UcfULE2H0Mbq3quO0ktvIkbG08mrk7m1k
Message-ID: <CAKSQd8ViM3JRa47RS-VWawz-yhZ2Pw_+2cD+t3fQ0jb-UC3mHQ@mail.gmail.com>
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

On Wed, May 6, 2026 at 3:18=E2=80=AFPM Borislav Petkov <bp@alien8.de> wrote=
:
> On Wed, May 06, 2026 at 11:57:20PM +0200, Ahmed S. Darwish wrote:
> > > Second, the number of words reported in 0001h and 0002h
> > > should be enumerated, in case the list grows, and so that a
> > > program can tell between all-zero and not-present. (ECX>0
> > > sub leaves, basically.)
> > >
> > > Since 0001h has already used up all four registers, it can't
> > > report a max sub leaf in EAX =E2=80=93 so maybe e.g. 0000h EBX
> > > has to do the job instead: it could do e.g. two byte fields, to
> > > report the number of words instead, i.e. 0000h BL =3D> 0001h
> > > words, and 0001h BH =3D> 0002h words. (Or wider fields... if
> > > you expect more future growth for words.)
> > >
> >
> > For both CPUID(0x4c780001) and CPUID(0x4c780002), I can still reserve
> > their EAX for that.  Something like:
> >
> > <leaf id=3D"0x4c780001">
> >   <subleaf id=3D"0">
>
> Can we slow down here please?
>
> If we're going to deal with maxleaves, then I'd say that ship has already
> sailed looong time ago.
>
> Because up until now there's no maxleaf for those Linux-defined words. So=
 you
> *still* have to know which kernel you're looking at to know which words a=
re
> defined, and which words are reserved zeros.
>
> The only thing you have is the database we're building here.
>
> And since it'll be append-only for the Linux leaves, if it is not in the
> database, it does not exist.
>
> If you want to use it and decypher feature words, you still need to know =
which
> kernel we're talking about. Because cpufeatures.h has the number of
> Linux-specific words which this particular kernel knows about.
>
> And if we're going to differentiate between defined and reserved, then we=
 need
> to save the kernel version from which onwards those bits actually have
> a meaning.
>
> And that would be ugly.
>
> So if you see word X, bit Y set, then that is a synthetic word bit and it=
 is
> enabled. If it is not set, it is not present or not enabled but again, wi=
thout
> kernel version you don't know anyway.

In the end, it is a bit string.

So maybe report the max
bit that is being reported?

And yes, 'version' is hard.

You sort of need the hash
of cpufeatures.h so a pull
of kernel x.y.z plus a mod
around flag or bug words
doesn't just say x.y.z, still.

--
C.
