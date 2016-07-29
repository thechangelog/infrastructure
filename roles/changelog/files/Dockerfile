# ==> combine
# Compiling 6 files (.ex)

# == Compilation error on file lib/combine/parsers/text.ex ==
# ** (CompileError) Elixir.Combine.Parsers.Text: function float_impl/1+43:
#   Internal consistency check failed - please report this bug.
#   Instruction: {call,4,{f,129}}
#   Error:       {multiple_match_contexts,[{x,0},1]}:

#     (stdlib) lists.erl:1338: :lists.foreach/2
#     (stdlib) erl_eval.erl:670: :erl_eval.do_apply/6

# could not compile dependency :combine, "mix compile" failed. You can recompile this dependency with "mix deps.compile combine", update it with "mix deps.update combine" or clean it with "mix deps.clean combine"

# https://github.com/bitwalker/combine/issues/17
# FROM erlang:19
FROM erlang:18.3.4.1

# elixir expects utf8.
ENV ELIXIR_VERSION="v1.3.2" \
  LANG=C.UTF-8

RUN set -xe \
  && ELIXIR_DOWNLOAD_URL="https://github.com/elixir-lang/elixir/releases/download/${ELIXIR_VERSION}/Precompiled.zip" \
  && ELIXIR_DOWNLOAD_SHA256="45fdb9464b0fbe44c919482f1247740cc9c5d399280ef07e386aa7402b085be7"\
  && buildDeps=' \
    unzip \
  ' \
  && apt-get update \
  && apt-get install -y --no-install-recommends $buildDeps \
  && curl -fSL -o elixir-precompiled.zip $ELIXIR_DOWNLOAD_URL \
  && echo "$ELIXIR_DOWNLOAD_SHA256 elixir-precompiled.zip" | sha256sum -c - \
  && unzip -d /usr/local elixir-precompiled.zip \
  && rm elixir-precompiled.zip \
  && apt-get purge -y --auto-remove $buildDeps \
  && rm -rf /var/lib/apt/lists/*

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

CMD ["iex"]
