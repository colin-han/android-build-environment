FROM openjdk:8-jdk

RUN apt-get --quiet update --yes && \
    apt-get --quiet install --yes wget tar unzip lib32stdc++6 lib32z1 && \
    wget --quiet --output-document=android-sdk.tgz https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz && \
    tar --extract --gzip --file=android-sdk.tgz && \
    echo y | /android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter android-25 && \
    echo y | /android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter platform-tools && \
    echo y | /android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter build-tools-24.0.0 && \
    echo y | /android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter extra-android-m2repository && \
    echo y | /android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter extra-google-google_play_services && \
    echo y | /android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter extra-google-m2repository

ENV ANDROID_HOME=/android-sdk-linux
ENV PATH=${PATH}:/android-sdk-linux/platform-tools/
