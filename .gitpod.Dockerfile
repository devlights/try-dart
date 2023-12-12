FROM gitpod/workspace-full:latest

USER gitpod

RUN sudo apt-get -q update && \
    sudo apt-get install tree bc && \
    sudo rm -rf /var/lib/apt/lists/*
RUN brew tap dart-lang/dart && brew install dart
