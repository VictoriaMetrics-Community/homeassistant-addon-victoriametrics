# Victoria Metrics for Home Assistant

## Data Storage
Data is stored in folder /share/victoria-metrics-data of Home Assistant OS to make individual backups easy.


## Configuration

### Retention
To define the retention, that is how long VictoriaMetrics will keep it's data, set it to a number in months. You can also use value like for example `30d` or `2y`.

See: https://github.com/VictoriaMetrics/VictoriaMetrics#retention


## Sending Data to VictoriaMetrics
To send data from Home Assistant to VictoriaMetrics, you can use the `InfluxDB` integration. Add the following code
to your `configuration.yaml` to have a basic setup.

```yml
influxdb:
  api_version: 1
  host: localhost
  port: 8428
  measurement_attr: domain__device_class
  include:
    entity_globs:
      - sensor.*_temperature
      - sensor.*_humidity
      - sensor.*_illumination
      - sensor.*_brightness
      - sensor.*_wind_speed
```

<!-- not availalbe yet
## Scraping data from HomeAssistant
To scrape data from HomeAssistant, you can use the `Prometheus` exporter. Add the following code to you `configuration.yaml`.

```yml
prometheus:
  filter:
    include_entity_globs:
      - sensor.*_temperature
      - sensor.*_humidity
      - sensor.*_illumination
      - sensor.*_brightness
      - sensor.*_wind_speed
```

Finally check the `prometheus.yml` of this addon and adjust IP of your installation. 
Also make sure to create a long-living token as `bearer_token` for authentication.
-->
