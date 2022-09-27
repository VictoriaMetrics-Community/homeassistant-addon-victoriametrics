# Home Assistant Add-on VictoriaMetrics Time Series Database

If you are looking for an efficient and easy to use way for long term storage of your Home Assistant data - just use VictoriaMetrics.

This Add-on makes it easy to run a Victoria Metrics Time Series Database on your Home Assistant OS on ARM64 systems like Raspberry Pi 4.

## Replacement for InfluxDB and Prometheus

VictoriaMetrics Time Series Database is 100% compatible with the Prometheus and InfluxDB line protocol. So Homeassistant is able to connect to VictoriaMetrics with the InfluxDB. In Grafana you can use the Prometheus or InfluxDB data source.

## Much better long term storage

VictoriaMetrics offers an ultra efficient sompression for data storage, is highly optimized for time series data and has low RAM usage. So this is the perfect solution for long term storage of high amounts of data like all sensor values of your smart home.

There are many reasons to switch to Victoria Metrics. Compared to other products Victoria Metrics offers:

* better compression
* better performance
* lower RAM usage
* fully open source
* outperfomes other time series databases
* ease of use

[Victoria Metrics on GitHub](https://github.com/VictoriaMetrics/VictoriaMetrics)


> VictoriaMetrics wins InfluxDB and Timescale in all the queries by a margin of up to 20x. It especially excels at heavy queries, which scan many millions of datapoints across thousands of distinct timeseries. More info here 
[VictoriaMetrics vs. InfluxDB vs. Timescale](https://valyala.medium.com/when-size-matters-benchmarking-victoriametrics-vs-timescale-and-influxdb-6035811952d4)


This Add-On continues the work of Andreas Habel whose [hassio-victoriametrics](https://github.com/Exceptionfault/hassio-victoriametrics) add-on was not updated anymore since 2021.
I developed this mainly for my purpose running VictoriaMetrics on my Raspberry Pi 4 running Home Assistant Operating System.
The direction of InfluxDB 2.0 was not what I wanted in combination with Grafana so VictoriaMetrics Time Series Database was the best choice.