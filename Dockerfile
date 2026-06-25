FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
ENV USER=arena
ENV HOME=/home/arena
ENV NPM_CONFIG_PREFIX=/home/arena/.npm-global
ENV PATH=/home/arena/.npm-global/bin:/home/arena/.local/bin:$PATH

RUN apt-get update -qq && \
    apt-get install -y -qq \
    curl \
    npm \
    nodejs \
    python3 \
    python3-pip \
    python3-psutil \
    sysstat \
    htop \
    procps \
    git \
    sudo && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash arena && \
    echo "arena ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/arena && \
    chmod 440 /etc/sudoers.d/arena

USER arena
WORKDIR /home/arena

RUN mkdir -p /home/arena/.npm-global /home/arena/arena/battleground /home/arena/arena/logs /home/arena/arena/results/battle_logs

COPY --chown=arena:arena . /home/arena/arena/

RUN sudo chmod +x /home/arena/arena/setup/*.sh && \
    sudo chmod +x /home/arena/arena/harness/*.sh && \
    sudo chmod +x /home/arena/arena/harness/*.py

EXPOSE 8080

CMD ["/bin/bash"]
