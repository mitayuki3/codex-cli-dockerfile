FROM debian:trixie-slim
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    git \
    procps \
    && rm -rf /var/lib/apt/lists/*
ENV CODEX_HOME=/root/.codex
ENV PATH=/root/.local/bin:$PATH
RUN curl -fsSL https://chatgpt.com/codex/install.sh | sh \
    && test -x /root/.local/bin/codex \
    && /root/.local/bin/codex --version
WORKDIR /workspace
ENTRYPOINT ["/root/.local/bin/codex"]
