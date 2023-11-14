To verify that the logging stack and application work as expected, run this command: docker-compose up -d

## Grafana
- **Role**: Grafana is the dashboard and visualization component of logging stack. It allows us to create and manage interactive dashboards for log data and other metrics.
- **Configuration**: Grafana is configured with an authentication-disabled mode (`auth_enabled: false`) to simplify access during development. I used default configurations for anonymous authentication.
- **Usage**: Grafana provides a web interface accessible at `http://localhost:3000`. Here, users can create dashboards, query data from Loki, and visualize logs and metrics. I've enabled anonymous access for ease of use during development.

## Loki
- **Role**: Loki is the log aggregation system responsible for collecting and storing log data from various sources.
- **Configuration**: Loki's configuration includes HTTP and gRPC endpoints (`http_listen_port` and `grpc_listen_port`). It uses in-memory storage for the KV store and file system storage for chunks and rules. I've set replication factors and other parameters.
- **Usage**: Loki is accessible at `http://localhost:3100` and can be accessed programmatically for log ingestion. Promtail is configured to send logs to Loki, which stores them efficiently. Queries for log data can be made using Grafana.

## Promtail
- **Role**: Promtail is the log shipper that collects log data from various sources and sends it to Loki for storage and indexing.
- **Configuration**: Promtail is configured to listen on `http_listen_port: 9080`. It collects logs from local log files in `/var/log` using a static configuration. I used labels and patterns to structure the log data.
- **Usage**: Promtail collects log data from the specified log files and sends it to Loki for storage and indexing. It's an essential component for ensuring logs are efficiently ingested and made available for querying in Grafana.


