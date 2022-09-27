# Victoria Metrics for Home Assistant


## Steps to get everything running
* Just copy the folder `victoria-metrics` to your `homeassistant/addons/`
* Install the Add-on [![Open your Home Assistant instance and show the Supervisor add-on store.](https://my.home-assistant.io/badges/supervisor_store.svg)](https://my.home-assistant.io/redirect/supervisor_store/))
* Read the Add-on documentation
* Check the configuration page of the Add-on to change retention time - default is 99 years
* Now you can press Start - the first start can take a minute or two
* When the green circle shows up victoriametrics is running and ready for your data
* Add influxdb integration to your homeassistant config (using the option `measurement_attr: entity_id` is recommended)
* Restart Home Assistant


## Data Storage
VictoriaMetrtics Data is stored in folder /share/victoria-metrics-data of Home Assistant OS to make individual backups easy.


## Configuration

### Retention
To define the retention, that is how long VictoriaMetrics will keep it's data, set it to a number in months. You can also use value like for example `30d`, `6m` or `3y`.

See: https://github.com/VictoriaMetrics/VictoriaMetrics#retention


### Sending data to VictoriaMetrics
To send data from Home Assistant to VictoriaMetrics, you can use the `InfluxDB` integration. 
Add the following code to your `configuration.yaml` to have a basic setup.
With the option `measurement_attr: entity_id` you will get the entity_id as metric name what is great in combination with Grafana - just one click and you get the data you want. In Grafana you can use the prometheus data source to get access to your time series data. Have fun!

```yml
influxdb:
  api_version: 1
  host: <<<YOUR LOCAL HOME ASSISTANT IP>>>
  port: 8428
  max_retries: 3
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
