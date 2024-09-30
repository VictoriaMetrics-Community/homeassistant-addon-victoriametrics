# Home Assistant Add-on VictoriaMetrics Time Series Database

If you are looking for an efficient and easy to use way for long term storage of your Home Assistant data - just use VictoriaMetrics.

This add-on makes it easy to run a VictoriaMetrics Time Series Database on Home Assistant OS on ARM64 systems like Raspberry Pi 4 or AMD64.

## Replacement for InfluxDB and Prometheus

VictoriaMetrics Time Series Database is 100% compatible with the Prometheus and InfluxDB line protocol. So Homeassistant is able to connect to VictoriaMetrics with the InfluxDB integration. In Grafana you can use the Prometheus or InfluxDB data source to use your data in your VictoriaMetrics database.

## Much better long term storage

VictoriaMetrics offers an ultra efficient compression for data storage, is highly optimized for time series data and has low RAM usage. So this is the perfect solution for long term storage of high amounts of data like all sensor values of your smart home.

There are many reasons to switch to VictoriaMetrics. Compared to other products VictoriaMetrics offers:

* better compression
* better performance
* lower RAM usage
* fully open source
* outperfomes other time series databases
* ease of use

[VictoriaMetrics on GitHub](https://github.com/VictoriaMetrics/VictoriaMetrics)


> VictoriaMetrics wins InfluxDB and Timescale in all the queries by a margin of up to 20x. It especially excels at heavy queries, which scan many millions of datapoints across thousands of distinct timeseries. More info here
[VictoriaMetrics vs. InfluxDB vs. Timescale](https://valyala.medium.com/when-size-matters-benchmarking-victoriametrics-vs-timescale-and-influxdb-6035811952d4)


This add-on continues the work of Andreas Habel whose [hassio-victoriametrics](https://github.com/Exceptionfault/hassio-victoriametrics) add-on was not updated since 2021.
I developed this mainly for my purpose running VictoriaMetrics on my Raspberry Pi 4 running Home Assistant Operating System.
The direction of InfluxDB 2.0 was not what I wanted in combination with Grafana so VictoriaMetrics Time Series Database was the best choice.

## Installation and configuration

1. Add the reposity. (Quick link: [![Open your Home Assistant instance and show the Supervisor add-on store.](https://my.home-assistant.io/badges/supervisor_store.svg)](https://my.home-assistant.io/redirect/supervisor_store/) )
    * **Add the reposity** (click 3 dots on the top right of the screen). Reposity URL: *https://github.com/fuslwusl/homeassistant-addon-victoriametrics*
    * Refresh/reload your browser tab/window

2. **Install** the add-on:
    * Find, and **install** the VictoriaMetrics add-on

3. Configure VictoriaMetrics
   > Read the [addon documentation](victoria-metrics/DOCS.md) which can also be found on the **Documentation tab** of the [VictoriaMetrics addon](https://my.home-assistant.io/redirect/supervisor_store/) in the Home Assistant settings.

4. **Start** the *VictoriaMetrics* add-on

5. **Add the *influxdb* integration** to your Home Assistant configuration
   > Instructions for adding and configuring the influxdb integration are in the [addon documentation](DOCS.md) which can also be found on the **Documentation tab** of the [VictoriaMetrics addon configuration](https://my.home-assistant.io/redirect/supervisor_store/).

    > Don't forget to restart Home Assistant!


Well done! You can install and configure Grafana or similar to check data is being logged.

## InfluxDB data migration
Many Home Assistant users may have legacy data in InfluxDB that they wish to [migrate to VictoriaMetrics](https://docs.victoriametrics.com/guides/migrate-from-influx/index.html). There is a generic [command line tool](https://docs.victoriametrics.com/vmctl/) packaged with VictoriaMetrics that has documenation for [InfluxDB v1.x](https://docs.victoriametrics.com/vmctl/#migrating-data-from-influxdb-1x) although has no specific support for Home Assistant data. For users of InfluxDB v2.x, there is customised migration tool that can be found at https://github.com/maxlyth/influxv2tovm.