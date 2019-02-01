ARG RUNNER_VERSION

FROM gitlab/gitlab-runner:v11.7.0

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:git-core/ppa
RUN apt-get update
RUN apt-get install -y git

RUN wget -q https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN apt-get install apt-transport-https
RUN apt-get update
RUN apt-get install -y dotnet-sdk-2.2

RUN apt-get install -y jq

ENV DOTNET_CLI_TELEMETRY_OPTOUT=1 TZ=Asia/Shanghai

LABEL runner-version="$RUNNER_VERSION" dotnet-sdk-version="2.2"
