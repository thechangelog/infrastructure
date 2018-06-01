FROM elixir:1.6.5

RUN apt-get update \
    && apt-get install -y apt-utils \
    && rm -rf /var/lib/apt/lists/*

RUN export DEBIAN_FRONTEND=noninteractive \
    && gpg --keyserver pgpkeys.mit.edu --recv-key 5C808C2B65558117 \
    && gpg -a --export 5C808C2B65558117 | apt-key add - \
    && echo "deb http://www.deb-multimedia.org jessie main" > /etc/apt/sources.list.d/deb-multimedia.list \
    && apt-get update \
    && apt-get install -y deb-multimedia-keyring ffmpeg \
    && which ffmpeg \
    && rm -rf /var/lib/apt/lists/*

RUN mix local.hex --force

CMD ["iex"]
