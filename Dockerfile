# chekote/google-cloud-sdk
FROM chekote/alpine:latest

ENV GOOGLE_CLOUD_SDK_VERSION=367.0.0
ENV GOOGLE_CLOUD_SDK_FILE=/root/google-cloud-sdk-${GOOGLE_CLOUD_SDK_VERSION}-linux-x86_64.tar.gz
ENV GOOGLE_CLOUD_SDK_URL=https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${GOOGLE_CLOUD_SDK_VERSION}-linux-x86_64.tar.gz

ENV PATH /google-cloud-sdk/bin:$PATH

RUN set -euxo pipefail; \
    #
    # Google Cloud SDK requirements
    apk update; \
    apk add python3; \
    #
    # Install Google Cloud SDK
    wget -O $GOOGLE_CLOUD_SDK_FILE $GOOGLE_CLOUD_SDK_URL; \
    tar -xvzf $GOOGLE_CLOUD_SDK_FILE -C /;
