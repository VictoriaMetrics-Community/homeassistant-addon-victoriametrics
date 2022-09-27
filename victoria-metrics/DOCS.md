# Victoria Metrics for Home Assistant

## Data Storage
Data is stored in folder /share/victoria-metrics-data of Home Assistant OS to make individual backups easy.


## Configuration

### Retention
To define the retention, that is how long VictoriaMetrics will keep it's data, set it to a number in months. You can also use value like for example `30d`, `6m` or `3y`.

See: https://github.com/VictoriaMetrics/VictoriaMetrics#retention


## Sending Data to VictoriaMetrics
To send data from Home Assistant to VictoriaMetrics, you can use the `InfluxDB` integration. Add the following code
to your `configuration.yaml` to have a basic setup.

```yml
influxdb:
  api_version: 1
  host: 192.168.178.181
  port: 8428
  max_retries: 3
  ssl: false
  verify_ssl: false
  measurement_attr: entity_id
  tags_attributes:
    - friendly_name
    - unit_of_measurement
  ignore_attributes:
    - icon
    - source
    - options
    - editable
    - min
    - max
    - step
    - mode
    - marker_type
    - preset_modes
    - supported_features
    - supported_color_modes
    - effect_list
    - attribution
    - assumed_state
    - state_open
    - state_closed
    - writable
    - stateExtra
    - event
    - friendly_name
    - device_class
    - state_class
    - ip_address
    - device_file
    - unit_of_measurement
    - unitOfMeasure
  include:
    domains:
      - sensor
      - binary_sensor
      - light
      - switch
      - cover
      - climate
      - input_boolean
      - input_select
      - number
      - lock
      - weather
  exclude:
    entity_globs:
      - sensor.clock*
      - sensor.date*
      - sensor.glances*
      - sensor.time*
      - sensor.uptime*
      - sensor.dwd_weather_warnings_*
      - weather.weatherstation
      - binary_sensor.*_smartphone_*
      - sensor.*_smartphone_*
      - sensor.adguard_home_*
      - binary_sensor.*_internet_access
```

<!-- not availalbe yet
## Scraping data from HomeAssistant
To scrape data from HomeAssistant, you can use the `Prometheus` exporter. Add the following code to you `configuration.yaml`.

```yml
prometheus:
  namespace: hass
  component_config_glob:
    sensor.supply_temperature*:
      override_metric: temperature_celsius
    sensor.indoor_temperature:
      override_metric: temperature_celsius
  filter:
    include_domains:
      - sensor
      - binary_sensor
      - light
      - switch
      - cover
      - climate
      - input_boolean
      - input_select
      - number
      - lock
      - weather
    exclude_entity_globs:
      - sensor.clock*
      - sensor.date*
      - sensor.glances*
      - sensor.time*
      - sensor.uptime*
      - sensor.dwd_weather_warnings_*
      - weather.weatherstation
      - binary_sensor.*_smartphone_*
      - sensor.*_smartphone_*
      - sensor.adguard_home_*
      - binary_sensor.*_internet_access
```

Finally check the `prometheus.yml` of this addon and adjust IP of your installation. 
Also make sure to create a long-living token as `bearer_token` for authentication.
-->
