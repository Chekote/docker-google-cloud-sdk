# chekote/google-cloud-sdk:latest
# chekote/google-cloud-sdk:$GOOGLE_CLOUD_SDK_VERSION
FROM chekote/alpine:latest

ENV GOOGLE_CLOUD_SDK_VERSION=370.0.0
ENV GOOGLE_CLOUD_SDK_URL_PREFIX=https://dl.google.com/dl/cloudsdk/channels/rapid/downloads

ENV PATH /google-cloud-sdk/bin:$PATH

RUN set -euxo pipefail; \
    #
    # Google Cloud SDK requirements
    apk update; \
    apk add python3; \
    #
    # Assign SDK to download for this architecture
    GOOGLE_CLOUD_SDK_FILE=google-cloud-sdk-${GOOGLE_CLOUD_SDK_VERSION}-linux-$(arch).tar.gz; \
    #
    # Install Google Cloud SDK
    wget -O $GOOGLE_CLOUD_SDK_FILE $GOOGLE_CLOUD_SDK_URL_PREFIX/$GOOGLE_CLOUD_SDK_FILE; \
    tar -xvzf $GOOGLE_CLOUD_SDK_FILE -C /; \
    #
    # Cleanup
    rm $GOOGLE_CLOUD_SDK_FILE;
