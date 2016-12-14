FROM ubuntu:16.04

RUN apt-get update -y && apt-get install -y curl libcurl3 libunwind8 libicu55

ENV POWERSHELL_DEB powershell_6.0.0-alpha.13-1ubuntu1.16.04.1_amd64.deb
ENV POWERSHELL_RELEASE v6.0.0-alpha.13

RUN curl -Lso $POWERSHELL_DEB \
  "https://github.com/PowerShell/PowerShell/releases/download/${POWERSHELL_RELEASE}/${POWERSHELL_DEB}" && \
  dpkg -i $POWERSHELL_DEB

CMD "/usr/bin/powershell"
