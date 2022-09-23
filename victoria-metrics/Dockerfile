ARG BUILD_FROM
FROM $BUILD_FROM

# Copy data for add-on
COPY victoria-metrics-prod /
COPY prometheus.yml /
RUN chmod a+x /victoria-metrics-prod /
WORKDIR /share/victoria-metrics-data

# Run service with prometheus scraper
# CMD [ "/victoria-metrics-prod", "-storageDataPath", "/data", "-promscrape.config", "/prometheus.yml"]

# Run service without prometheus scraper
CMD [ "/victoria-metrics-prod", "-storageDataPath", "/share/victoria-metrics-data"]
