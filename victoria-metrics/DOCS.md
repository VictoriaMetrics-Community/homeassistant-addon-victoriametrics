# VictoriaMetrics for Home Assistant

## Installation and Configuration

### Install the add-on

If you are reading this in the documentation tab of the add-on - you have already completed this step.

Otherwise:
* Add the reposity. (Quick link: [![Open your Home Assistant instance and show the Supervisor add-on store.](https://my.home-assistant.io/badges/supervisor_store.svg)](https://my.home-assistant.io/redirect/supervisor_store/) )
* Add the reposity (click 3 dots on the top right of the screen). Reposity URL: *https://github.com/VictoriaMetrics-Community/homeassistant-addon-victoriametrics*
* Refresh/reload your browser tab/window
* Install the add-on
* Find, and **install** the VictoriaMetrics Add-on

### Steps to get everything running

Once the add-on is installed:

* Read the add-on documentation
* Check the configuration page of the add-on to change retention time - default is 99 years
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

### Scrape Targets

You can add scrape targets by creating a yaml configuration
file in the `addons_config/victoria_metrics` folder.
Set the `prometheusScrapeConfig` option to the filename of the configuration file.

### Extra Victoria Metrics Arguments

You can use advanced configuration options of VictoriaMetrics using parameters.
As an example add HomeAssistant SSL certificates using the following option:

```-tls -tlsCertFile=/ssl/fullchain.pem -tlsKeyFile=/ssl/privkey.pem```

### Sending data to VictoriaMetrics

To send data from Home Assistant to VictoriaMetrics, you can use the `InfluxDB` integration. 
Add the following code to your `configuration.yaml` to have a basic setup. (And, of course, restart Home Assistant.)
With the option `measurement_attr: entity_id` you will get the `entity_id` as metric name what is great in combination with Grafana - just one click and you get the data you want. In Grafana you can use the prometheus data source to get access to your time series data. Have fun!

```yml
influxdb:
  api_version: 1
  host: <<<Hostname from Addon Page / IP / Custom Hostname / localhost (this works when running HAOS on ProxMox) >>>
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
    - color_mode
    - hs_color
    - rgb_color
    - xy_color
    - hvac_action
    - value
    - writeable
    - attribution
    - dataCorrect
    - dayname
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

### Grafana

#### Setup a data source

Select Prometheus as Data Source with the following parameters (the URL must include the `http://` prefix):

**HTTP / Field: URL**

`http://YOUR_HOMEASSISTANT_IP_ADDRESS:8428/prometheus`

**HTTP / Field: Access**

`Server (default)`

This is all the configuration that is required. There are no user accounts, tokens or secrets to be setup.

#### Add a panel

To get a graph in your dashboard you just have to add a panel.
Then click on `Metric` in the Query UI and start typing for example `livi temp` to find the entity `sensor.livingroom_temperature_value` and show the temperature graph after pressing the blue button `Run queries` or `Apply`.

#### Show friendly names

After adding a entity to your graph you will probably change the long text in the legend to a more readable one.
You can do this for all metrics/entities in the panel at once:

Sidebar / Standard Options / Field: Display name  
`${__field.labels.friendly_name}`

Or you can only change the name of one metric/entity:

Query / Field: Legend  
`{{friendly_name}}`

### Graphite

This can be used to get data from Truenas or other systems that use Graphite.

#### Open port

You will need to open the port 2003 in the settings, along with adding the additional argument `-graphiteListenAddr=:2003`

#### Sending data

Point your graphite exporter to `http://YOUR_HOMEASSISTANT_IP_ADDRESS:2003/`
