## 1.8.10

- Updated documentation and added Grafana tips
- Replace binary from docker image victoriametrics/victoria-metrics:v1.81.2 with official build https://github.com/VictoriaMetrics/VictoriaMetrics/releases/download/v1.81.2/victoria-metrics-darwin-amd64-v1.81.2.tar.gz

## 1.8.9

- Changed configuration files
- Disabled host network
- Disabled Prometheus scraper (use InfluxDB integration instead)
- Disabled Apparmor configuration

## 1.8.1

- Initial setup with Victoria Metrics v1.81.2 and Prometheus scraper
