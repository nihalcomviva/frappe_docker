Task 3: Monitoring and Incident Management
Overview

This task focuses on implementing observability for the deployed Frappe application using Prometheus and Grafana. It also includes simulating incidents to test monitoring effectiveness.

Components

Prometheus

Collects metrics from the Frappe backend container.

Configured via monitoring/prometheus.yml.

Grafana

Visualizes metrics collected by Prometheus.

Dashboards created for container health, response times, and uptime.

Steps Implemented
1. Setup Prometheus

Created a monitoring folder and added prometheus.yml.

Run Prometheus container:

docker run -d \
  --name prometheus \
  -p 9090:9090 \
  -v $(pwd)/monitoring:/etc/prometheus \
  prom/prometheus


Verified targets at: http://localhost:9090/targets

2. Setup Grafana

Run Grafana container:

docker run -d \
  --name grafana \
  -p 3000:3000 \
  grafana/grafana


Access Grafana UI: http://localhost:3000 (default: admin/admin)

Added Prometheus as data source:

URL: http://host.docker.internal:9090

Created dashboards to monitor:

CPU and memory usage

Container uptime

Frappe backend response time

3. Incident Simulation

Stopped backend container to simulate downtime:

docker stop frappe_docker-backend-1


Observed alerts and metrics in Grafana.

Restarted container after testing:

docker start frappe_docker-backend-1


Recorded incident logs, response steps, and metrics.
