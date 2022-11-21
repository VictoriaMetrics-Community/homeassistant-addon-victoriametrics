ARG BUILD_FROM
FROM $BUILD_FROM

# Copy data for add-on
COPY start-victoria-metrics /
COPY prometheus.yml /
WORKDIR /share/victoria-metrics-data
ARG VERSION=v1.83.1

RUN /bin/bash -c 'set -ex && \
    ARCH=$(uname -m) && \
    if [ "$ARCH" == "x86_64" ]; then \
        wget https://github.com/VictoriaMetrics/VictoriaMetrics/releases/download/$VERSION/victoria-metrics-linux-amd64-$VERSION.tar.gz -qO- | tar xvz -C /; \
    elif [[ "$ARCH" == "arm"* ]]; then \
        wget https://github.com/VictoriaMetrics/VictoriaMetrics/releases/download/$VERSION/victoria-metrics-linux-arm-$VERSION.tar.gz -qO- | tar xvz -C /; \
    elif [ "$ARCH" == "aarch64" ]; then \
        wget https://github.com/VictoriaMetrics/VictoriaMetrics/releases/download/$VERSION/victoria-metrics-linux-arm64-$VERSION.tar.gz -qO- | tar xvz -C /; \
    else \
       echo "Unsupported architecture $ARCH"; \
       return -1; \
    fi'

RUN chmod a+x /victoria-metrics-prod
RUN chmod a+x /start-victoria-metrics

# Run service with prometheus scraper
# CMD [ "/victoria-metrics-prod", "-storageDataPath", "/data", "-promscrape.config", "/prometheus.yml"]

# Run service without prometheus scraper
#CMD [ "/victoria-metrics-prod", "-storageDataPath", "/share/victoria-metrics-data"]
CMD [ "/start-victoria-metrics"]