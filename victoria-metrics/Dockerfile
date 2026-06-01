ARG BUILD_FROM=ghcr.io/home-assistant/base:latest
FROM $BUILD_FROM

COPY start-victoria-metrics /
COPY prometheus.tpl /
WORKDIR /data
ARG VERSION=v1.144.0

RUN /bin/bash -c 'set -ex && \
    ARCH=$(uname -m) && \
    if [ "$ARCH" == "x86_64" ]; then \
    RELEASE_ARCH="amd64"; \
    elif [[ "$ARCH" == "arm"* ]]; then \
    RELEASE_ARCH="arm"; \
    elif [ "$ARCH" == "aarch64" ]; then \
    RELEASE_ARCH="arm64"; \
    else \
    echo "Unsupported architecture $ARCH"; \
    exit 1; \
    fi && \
    wget https://github.com/VictoriaMetrics/VictoriaMetrics/releases/download/$VERSION/victoria-metrics-linux-$RELEASE_ARCH-$VERSION.tar.gz -qO- | tar xvz -C / && \
    wget https://github.com/VictoriaMetrics/VictoriaMetrics/releases/download/$VERSION/vmutils-linux-$RELEASE_ARCH-$VERSION.tar.gz -qO- | tar xvz -C / vmbackup-prod vmrestore-prod'

RUN chmod a+x /victoria-metrics-prod
RUN chmod a+x /vmbackup-prod && ln -sf /vmbackup-prod /usr/local/bin/vmbackup
RUN chmod a+x /vmrestore-prod && ln -sf /vmrestore-prod /usr/local/bin/vmrestore
RUN chmod a+x /start-victoria-metrics

CMD [ "/start-victoria-metrics"]
