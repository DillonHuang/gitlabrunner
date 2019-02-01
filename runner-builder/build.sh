#!/bin/bash

RUNNER_VERSION=v11.4.2

while [[ $# -gt 0 ]]
do
key="$1"
case $key in
    -v|--version)
    RUNNER_VERSION="$2"
    shift
    shift
    ;;
    *)
    shift
    ;;
esac
done

if [ -z $RUNNER_VERSION ]
then
    echo "no runner version passed by \$RUNNER_VERSION exit..."
    exit 1
fi

# pull gitlab-runner base image
docker image pull gitlab/gitlab-runner:$RUNNER_VERSION

# build node-runner
docker image build -t byzan/node-runner:$RUNNER_VERSION --build-arg RUNNER_VERSION=$RUNNER_VERSION -f ./node/Dockerfile ./node

docker image tag byzan/node-runner:$RUNNER_VERSION hub.iubang.com:5000/byzan/node-runner:$RUNNER_VERSION

docker image push hub.iubang.com:5000/byzan/node-runner:$RUNNER_VERSION

# remove node-runner
docker image rm byzan/node-runner:$RUNNER_VERSION
docker image rm hub.iubang.com:5000/byzan/node-runner:$RUNNER_VERSION

# build dotnet-runner
docker image build -t byzan/dotnet-runner:$RUNNER_VERSION --build-arg RUNNER_VERSION=$RUNNER_VERSION -f ./dotnet/Dockerfile ./dotnet

docker image tag byzan/dotnet-runner:$RUNNER_VERSION hub.iubang.com:5000/byzan/dotnet-runner:$RUNNER_VERSION

docker image push hub.iubang.com:5000/byzan/dotnet-runner:$RUNNER_VERSION

# remove dotnet-runner
docker image rm byzan/dotnet-runner:$RUNNER_VERSION
docker image rm hub.iubang.com:5000/byzan/dotnet-runner:$RUNNER_VERSION

# build android-runner
docker image build -t byzan/android-runner:$RUNNER_VERSION --build-arg RUNNER_VERSION=$RUNNER_VERSION -f ./android/Dockerfile ./android

docker image tag byzan/android-runner:$RUNNER_VERSION hub.iubang.com:5000/byzan/android-runner:$RUNNER_VERSION

docker image push hub.iubang.com:5000/byzan/android-runner:$RUNNER_VERSION

# remove android-runner
docker image rm byzan/android-runner:$RUNNER_VERSION
docker image rm hub.iubang.com:5000/byzan/android-runner:$RUNNER_VERSION

# image base runner
docker image rm gitlab/gitlab-runner:$RUNNER_VERSION
