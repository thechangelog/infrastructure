FROM elixir:1.6.5

RUN apt-get update \
    && apt-get install -y apt-utils \
    && rm -rf /var/lib/apt/lists/*

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get install -y ffmpeg netcat \
    && which ffmpeg \
    && rm -rf /var/lib/apt/lists/*

RUN mix local.hex --force

CMD ["iex"]
