FROM livebook/livebook:latest

RUN export DEBIAN_FRONTEND="noninteractive" && \
    apt-get update && apt-get -y install --no-install-recommends \
    git \
    zsh \
    vim \
    curl ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mix do local.rebar --force, local.hex --force && \
    mix escript.install hex livebook --force

ENV TZ=Asia/Tokyo
RUN zsh -c "$(curl -L raw.github.com/44103/dotfiles/main/install.sh)"
