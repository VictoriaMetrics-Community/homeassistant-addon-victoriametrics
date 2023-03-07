## 1.8.17

- Added setting for basicAuth/httpAuth and prometheus scrape (thanx to dergeberl)
- Updated to VictoriaMetrics 1.88.1
- Updated documentation

## 1.8.15

- Updated to VictoriaMetrics 1.86.1
- Updated documentation

## 1.8.14

- Updated to VictoriaMetrics 1.83.1

## 1.8.13

- Added additionalArgs parameter to allow passing additional options to VictoriaMetrics

## 1.8.12

- Fixed retention scheme was not passed to victoria metrics leading to a default retention of 1m

## 1.8.11

- Added support for amd64 on linux

## 1.8.10

- Updated documentation and added Grafana tips
- Replace binary from docker image victoriametrics/victoria-metrics:v1.81.2 with official build https://github.com/VictoriaMetrics/VictoriaMetrics/releases/download/v1.81.2/victoria-metrics-linux-arm-v1.81.2.tar.gz

## 1.8.9

- Changed configuration files
- Disabled host network
- Disabled Prometheus scraper (use InfluxDB integration instead)
- Disabled Apparmor configuration

## 1.8.1

- Initial setup with Victoria Metrics v1.81.2 and Prometheus scraper
