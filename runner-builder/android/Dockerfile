ARG RUNNER_VERSION

FROM gitlab/gitlab-runner:$RUNNER_VERSION

RUN apt-get update --quiet
RUN apt-get install --quiet --yes software-properties-common
RUN add-apt-repository ppa:git-core/ppa
RUN apt-get update --quiet
RUN apt-get install --quiet --yes git
RUN apt-get install --quiet --yes unzip
RUN apt-get install --quiet --yes jq

# install open jdk
RUN apt-get install --quiet --yes openjdk-8-jdk

# install android sdk tools
ARG ANDROID_SDK_TOOLS=4333796

RUN wget --quiet --output-document=android-sdk-tools.zip https://dl.google.com/android/repository/sdk-tools-linux-${ANDROID_SDK_TOOLS}.zip

RUN unzip -d /usr/lib/android-sdk android-sdk-tools.zip

RUN rm android-sdk-tools.zip

ENV ANDROID_HOME=/usr/lib/android-sdk

RUN yes | /usr/lib/android-sdk/tools/bin/sdkmanager --install "build-tools;28.0.3"

RUN chmod -R 777 /usr/lib/android-sdk

# install nodejs
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash
RUN apt-get install --quiet --yes nodejs

ENV TZ=Asia/Shanghai
