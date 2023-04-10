global:
  scrape_interval: 1m
  scrape_timeout: 15s

scrape_configs:
  - job_name: "home-assistant"
    scrape_interval: "{{.prometheusScrapeInterval}}"
    scrape_timeout: "{{.prometheusScrapeTimeout}}"
    metrics_path: /api/prometheus
    authorization:
      credentials: "{{.token}}"
    scheme: {{.scheme}}
    static_configs:
      - targets: ['{{.homeassistantUrl}}']
