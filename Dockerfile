FROM ubuntu:16.04

RUN apt-get update -y && apt-get install -y curl libcurl3 libunwind8 libicu55

ENV POWERSHELL_DEB powershell_6.0.0-alpha.13-1ubuntu1.16.04.1_amd64.deb
ENV POWERSHELL_RELEASE v6.0.0-alpha.13
ENV POWERSHELL_GET_RELEASE 1.1.2.0

ENV SRC_DIR /src
RUN mkdir ${SRC_DIR}
WORKDIR ${SRC_DIR}

RUN curl -Lso $POWERSHELL_DEB \
  "https://github.com/PowerShell/PowerShell/releases/download/${POWERSHELL_RELEASE}/${POWERSHELL_DEB}" && \
  dpkg -i $POWERSHELL_DEB

RUN powershell -c 'Install-PackageProvider Nuget –force –verbose;'
RUN powershell -c 'Install-Module –Name PowerShellGet –Force;'


ENTRYPOINT ["/usr/bin/powershell"]
