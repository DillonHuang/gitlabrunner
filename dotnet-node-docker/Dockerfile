ARG RUNNER_VERSION

FROM gitlab/gitlab-runner:v11.7.0

RUN apt-get update
RUN apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# install docker-ce-cli
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository -y \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"
RUN apt-get update
RUN apt-get install -y docker-ce-cli

# install dotnet-sdk
RUN wget -q https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN apt-get install apt-transport-https
RUN apt-get update
RUN apt-get install -y dotnet-sdk-2.2

# install git
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:git-core/ppa
RUN apt-get update
RUN apt-get install -y git

# install nodejs
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash
RUN apt-get update
RUN apt-get install -y nodejs

RUN apt-get install -y jq

# install yarn
RUN npm install -g yarn@latest

ENV DOTNET_CLI_TELEMETRY_OPTOUT=1 TZ=Asia/Shanghai

LABEL runner-version="$RUNNER_VERSION" node-version="11.8.0"  dotnet-sdk-version="2.2.103" git-version="2.20.1" docker-version="18.09.1" yarn-version="1.13.0" npm-version="6.5.0"

USER gitlab-runner

RUN yarn config set network-timeout 100000

RUN yarn config set -- --emoji true

USER root


