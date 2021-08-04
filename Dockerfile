FROM debian:10.8

ENV ANDROID_SDK_ROOT=/usr/lib/android-sdk
ENV PATH="$ANDROID_SDK_ROOT/platform-tools:$ANDROID_SDK_ROOT/cmdline-tools/bin:$ANDROID_SDK_ROOT/tools:${PATH}"

RUN cd
RUN apt-get update 
RUN apt-get upgrade -y
RUN apt-get -y install android-sdk wget zip vim
RUN wget https://dl.google.com/android/repository/commandlinetools-linux-7583922_latest.zip
RUN unzip commandlinetools-linux-7583922_latest.zip
RUN rm commandlinetools-linux-*
RUN mv cmdline-tools /usr/lib/android-sdk/

RUN yes | sdkmanager "platforms;android-30" --sdk_root=/usr/lib/android-sdk
RUN yes | sdkmanager "build-tools;30.0.3" --sdk_root=/usr/lib/android-sdk

