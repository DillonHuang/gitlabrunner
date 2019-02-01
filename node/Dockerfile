ARG RUNNER_VERSION
FROM gitlab/gitlab-runner:v11.7.0

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:git-core/ppa
RUN apt-get update
RUN apt-get install -y git

RUN curl -sL https://deb.nodesource.com/setup_11.x | bash
RUN apt-get update
RUN apt-get install -y nodejs

RUN apt-get install -y jq

RUN npm install -g yarn@latest

ENV TZ=Asia/Shanghai

LABEL runner-version="$RUNNER_VERSION" node-version="11.x"

USER gitlab-runner

RUN yarn config set network-timeout 100000

RUN yarn config set -- --emoji true

USER root