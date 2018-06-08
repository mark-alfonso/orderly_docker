FROM ubuntu:16.04

LABEL maintainer <markkram.alfonso@gmail.com>

RUN useradd -ms /bin/bash devuser \
    && adduser devuser sudo \
    && apt-get update \
    && apt-get install git-core -y \
    && apt-get install curl -y 

USER devuser
WORKDIR /home/devuser

RUN export OVERLAY_FS_INDEX=y \
    && export OVERLAY_FS_INDEX=y \
    && curl https://install.meteor.com/ | sh \
    && export PATH="$PATH:$HOME/.meteor" \
    && curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash \
    && export NVM_DIR="$HOME/.nvm" \
    && [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" \
    && [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" \
    && nvm install 8.9.4 \
    && npm install -g mup

EXPOSE 3000

CMD '/bin/bash'