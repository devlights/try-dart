FROM gitpod/workspace-full-vnc:latest
SHELL ["/bin/bash", "-c"]
ENV ANDROID_HOME=$HOME/androidsdk \
    FLUTTER_VERSION=3.19.0-stable \
    QTWEBENGINE_DISABLE_SANDBOX=1
ENV PATH="$HOME/flutter/bin:$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$PATH"

USER root
RUN install-packages libgtk-3-dev libnss3-dev fonts-noto fonts-noto-cjk

USER gitpod
RUN wget -q "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${FLUTTER_VERSION}.tar.xz" -O - | tar xpJ -C "$HOME" \
    && flutter precache \
    && flutter config --enable-web \
    && flutter config --no-enable-macos-desktop \
    && flutter config --no-enable-windows-desktop \
    && flutter config --no-enable-linux-desktop \
    && flutter config --no-enable-ios \
    && flutter config --no-enable-android \
    && dart --disable-analytics \
    && flutter doctor
