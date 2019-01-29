FROM mhart/alpine-node:11

ENV PACKAGES="\
    build-base \
    curl \
    bash \
    ca-certificates \
    python2 \
    py-setuptools \
"

RUN apk update && apk add --no-cache $PACKAGES \
    && if [[ ! -e /usr/bin/python ]];        then ln -sf /usr/bin/python2.7 /usr/bin/python; fi \
    && if [[ ! -e /usr/bin/python-config ]]; then ln -sf /usr/bin/python2.7-config /usr/bin/python-config; fi \
    && if [[ ! -e /usr/bin/easy_install ]]; then ln -sf /usr/bin/easy_install-2.7 /usr/bin/easy_install; fi \
    && easy_install pip \
    && pip install --upgrade pip \
    && if [[ ! -e /usr/bin/pip ]]; then ln -sf /usr/bin/pip2.7 /usr/bin/pip; fi \
    && pip install awscli \
    && curl https://sdk.cloud.google.com | bash \
    && echo