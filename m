Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD849412C12
	for <x86-cpuid@lists.linux.dev>; Wed, 19 Aug 2026 08:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787128218; cv=none; b=o7tuQIIElK8xZzTAqcrbrfmXFfyl2Xv5ZjYVtV8sqwoBL9EGSc3k7vEr0NJXZiE58anKiB/Uf4fP9m+u6l45B7EZwBhkYDA+9Uz5CZY9KoHwsJ5B7Z7N8qF+GgOCEgYoixYSe7GalWT8DeAH2l0m2T0djUGV0tvLFO9Lah12tSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787128218; c=relaxed/simple;
	bh=uWKfkVzVaoNnuZy6L0lMEDnZ5gK+SPssk/IZ+Vr0I+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Fz8cIJCkyfNs61reOqEhHBj7lh4eqLOOVpu023YwegWlNrjH6YM8EJgnaccZOuphSSErKNz7SivXhaH27DB63Jm1AAPkYkbgodBH0ehxBtRMze/5K+68d+cuiWRsmLKgbxmR+tboxHM0+WzFheecmErL26taZSgyfSxci7BaHyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SfeL4ZWr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SfeL4ZWr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787128215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uWKfkVzVaoNnuZy6L0lMEDnZ5gK+SPssk/IZ+Vr0I+k=;
	b=SfeL4ZWrSKwCx1ZWQIcVdQwDJOm//FVqY6y0kch4bfbQVjqORFR8Ab+YZlakEP3fgUnims
	7JEx+yzR1N+rjeWv3BCSI6w56tMQKiRgAIXyTS/sEgVTVkWxZBTEtULi4PWTtg0EKMTXsm
	xDGVcIw61sO8vanxUPQdcwv4QAd5MnM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-3dzulYNuOJyhgafpm4k9NA-1; Wed, 19 Aug 2026 04:30:09 -0400
X-MC-Unique: 3dzulYNuOJyhgafpm4k9NA-1
X-Mimecast-MFC-AGG-ID: 3dzulYNuOJyhgafpm4k9NA_1787128208
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-47f6db77430so396071f8f.0
        for <x86-cpuid@lists.linux.dev>; Wed, 19 Aug 2026 01:30:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787128208; x=1787733008;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uWKfkVzVaoNnuZy6L0lMEDnZ5gK+SPssk/IZ+Vr0I+k=;
        b=c/S6/vEXorKjyHHKTCZqRCVso5uJZbyTh/lOnrxpUICtaFxzTD6O/uFEMvRJwQHcBq
         Z65+PTo0r0EM5W+sx2h/ml2M3dCrmfj/NBe6WOVt5VETGB3zMW341Sx5KxDv+HOz/ma+
         uVOOiY2LzCQTdlzuJ5vKfuRe7vNjCKDIQOJdFyNG19tNF9yE6sRW6Sq4tBNNqTpFXpSe
         UFn5wjYMgM9r+Q3i9ZC9jBIv030QY3lRKSWsAt/9SYcIvEILPUzs1GB6XFMmKD64Du/7
         QkmwInOGHxTPdy4hHArwRKQE9y9XB4WQtY8hKIcro8HHsCLYFGDw9HsVPuW/EbI777Ny
         pngw==
X-Forwarded-Encrypted: i=1; AHgh+RrivkCbcXDNfyFmcfJ7uPgmXPT+x28gYFWq8xqQ+b6/NC9QgGXC/7MWnvCkEhpolUPuFl5QjDZYuwQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxQ13/+Q0zkzD+uQce2KPMqoCRZN62YJtDhQwtHUEJoR3TbFaUM
	yovWoOJpOC147zyipCmaYe3+nDhEK8uCY4lIpBZ7pbgIGpY0GUtvNVvH0PJy79hMnC3Z3WqeUDa
	vYt/nURak1a/lDMtCbyGsKPicdp959FK8is7V1TIwn24xl62ZkP5fBx7UAwgkKomp7qv1MQ==
X-Gm-Gg: AR+sD108q10FjLAdWPXsfI40WWfE4LI8smMcDCwv9UaIhoAGCBoyEqZAkgfjwLA5rBO
	4UnsuHoTfmm4j1m1Kw2t/XhDzBb95TlPR9/EZhWP+p3mGhS/Q70iRhjQSMABCeyn6hWbFb2rqY1
	z/vNAtkdo4U+FRYtcTecMfwjVw8meWULBQqH2GHhqU2nxQhQdRteaboRivGjMxKbMGgOjrbgDJs
	WTEHxfSd2nwqGlnCnSS7IeYcIqBGzQ+uLfNYoMmbvrbHh066mTDsUmIDxWx5a7oR+7nBSITB8LZ
	xYrGzH97yjkcKrK/XzLdIzu8RWIqAfsibm3NXEfH4HmuZDAKTr1cAOQThkuADW2e4Xn/h9kkgkV
	6iIHB1So9SpxluiL6oRjbesawuiSEdpRbIwUbAbU0anBzsPgM2Ik8k3vmxqVgSRdwRrgeQ+XbBM
	n/60y1nDdc/+k=
X-Received: by 2002:a05:600c:3e0c:b0:499:4e47:eaf2 with SMTP id 5b1f17b1804b1-499aa1a3e87mr52693275e9.6.1787128207785;
        Wed, 19 Aug 2026 01:30:07 -0700 (PDT)
X-Received: by 2002:a05:600c:3e0c:b0:499:4e47:eaf2 with SMTP id 5b1f17b1804b1-499aa1a3e87mr52692465e9.6.1787128207419;
        Wed, 19 Aug 2026 01:30:07 -0700 (PDT)
Received: from leonardi-redhat (host-95-233-147-132.retail.telecomitalia.it. [95.233.147.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9b6ed64sm28457345e9.1.2026.08.19.01.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 01:30:06 -0700 (PDT)
Date: Wed, 19 Aug 2026 10:30:03 +0200
From: Luigi Leonardi <leonardi@redhat.com>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
Cc: Tanish Desai <tanishdesai37@gmail.com>, x86-cpuid@lists.linux.dev, 
	Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH] db: add Hyper-V leaf 0x40000001
Message-ID: <aoVlgRjVWzaKTPuo@leonardi-redhat>
References: <20260721173159.46494-1-tanishdesai37@gmail.com>
 <anW5m3Mb-Puk5hBu@leonardi-redhat>
 <aoSpgOi3VXJuKwVj@lx-t490>
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <aoSpgOi3VXJuKwVj@lx-t490>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SfgOSdtxpHH9qbhJrICLB8FhDT5cEUPEts07VKH43VY_1787128208
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

Hi Ahmed,

On Tue, Aug 18, 2026 at 08:50:40PM +0200, Ahmed S. Darwish wrote:
>Hi Luigi,
>
>On Fri, 07 Aug 2026, Luigi Leonardi wrote:
>>
>> Thanks for the patch, this would be very useful for SVSM!
>>
>
>Sorry for the late response.
>
>Could you point me please to the kernel patch queue in need of this?
>
>So far, no hypervisor leaf callsites are converted. See:
>
>https://msgid.link/20260528153923.403473-1-darwi@linutronix.de
>
>

Thanks for sharing this link!

SVSM[1] is a firmware used for confidential computing written in rust.
In this project we consume a rust crate called cpufeature[2] that is
automatically generated from the x86-cpuid-db, that exports the cpuid
leaves to rust structures. Our plan is to upstream the conversion script
once we finalize the crate design.

In SVSM we do use the HV leaf[3] to detect if the code is running on an
hyper-v system.

Hope that helps!

Thanks,
Luigi


[1]https://github.com/coconut-svsm/svsm/
[2]https://github.com/coconut-svsm/cpufeature/
[3]https://github.com/coconut-svsm/svsm/blob/ec10d69313742cc337b696a800f6863b12c9f824/kernel/src/cpu/features.rs#L41

