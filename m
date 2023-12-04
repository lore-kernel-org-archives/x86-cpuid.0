Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA88B1A5A2
	for <x86-cpuid@lists.linux.dev>; Mon,  4 Dec 2023 09:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=contractor.linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=contractor.linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=contractor.linuxfoundation.org header.i=@contractor.linuxfoundation.org header.b="FZIhwogT"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-50bc22c836bso5625742e87.0
        for <x86-cpuid@lists.linux.dev>; Mon, 04 Dec 2023 01:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=contractor.linuxfoundation.org; s=google; t=1701682273; x=1702287073; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/Onvocl7z9tTV39RCCW1Yld6Uw1oloVdWrBn7K39z6I=;
        b=FZIhwogTLlJY1zfETSBsttTVyZwedEa/SpayhiP3boXW+O4r6oXkWk+9x3KU5KdL2T
         Zm3TXcVF4vdGXn0PTj+HnTmRK48RO1BrG4Ha0h5OjBZxQwDzc0LkY6RJY/2FtUdVavLv
         DpwJgNtD0xOGRCF4Tpy+t0K2JiD9oMwMFQti72f814Azkopsz3yTmOEaeM6+NHt9sK7L
         +M7tEMSQcOFTKc50ZKO/PfxTc8ruBjlENrQSyrhkhnE7hXBwHRDf+vZyvPURu+CeWKEJ
         3LpO2PQWrTlJdAHEw2/rKo5hdqawIqIdzeGXctPErTTvnYW8GjoehzbqDS3VfV6Zuf3I
         Ya1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701682273; x=1702287073;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Onvocl7z9tTV39RCCW1Yld6Uw1oloVdWrBn7K39z6I=;
        b=OWgKQADvsDCyhnF/Pkilpw8bqKkPDOn7p5g9OT3cdT6wQxxI3IXRMOOGKPDIS3UCTL
         EiMj2dqdU5/f2svl6kWPt0vjT2mT5byWAXAqRm+0LnsnGcvR1U3NvzzwtDvYMHxMuyN6
         vq4KJg5wQOVXO3Saxx//3WdgyraL6if7hOoTdnCQOn6anYDAMtqyrPGn0VijCoHMZ2Zx
         nYHNI/OyiivMXEJArndxn8d3vVtAOukK+yrNgxLKmErT3D3grCx6oJlTtkBgvE6AarLx
         5Cl4RKhsqguMvbPjCUEojoB4+Sm+d/Wpe8AviksUhXbJjerUu5ZqmEBk19CZ/nVjqYuJ
         2c9w==
X-Gm-Message-State: AOJu0YybTPbNXBWPYX73hdEx9Yft2OddD9C0RrriAOrLHwvJQs5DlVb/
	atxTh3/UY2XdSjo4MCwfBHGE8hk2hCWAHexjuAJQHGV/hRRfEntyRyY=
X-Google-Smtp-Source: AGHT+IFra66Ri3w5L5Djc/RuYnwb06z9CWvSkUTLtIxlsLazILTSGcE3bjHxlnHMqFlR0M4imrpp0NMlmWCrHHLgLeQ=
X-Received: by 2002:a05:6512:6c3:b0:50b:d764:6e99 with SMTP id
 u3-20020a05651206c300b0050bd7646e99mr3690564lff.73.1701682273191; Mon, 04 Dec
 2023 01:31:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: x86-cpuid@lists.linux.dev
List-Id: <x86-cpuid.lists.linux.dev>
List-Subscribe: <mailto:x86-cpuid+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:x86-cpuid+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Shyam Kumar <skachukattu@contractor.linuxfoundation.org>
Date: Mon, 4 Dec 2023 15:01:02 +0530
Message-ID: <CAH=dH98Qy8uwRDrrqadvPMwTe7h5=49-YzScpr6ud0YsHBPC5w@mail.gmail.com>
Subject: Test Mail
To: x86-cpuid@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello:

 This is a test message to test successful delivery and start the
 archive for the list. Please ignore.

-- 
Regards
Shyam Kumar
The Linux Foundation Core Projects
