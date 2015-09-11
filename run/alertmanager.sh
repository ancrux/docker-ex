#!/bin/bash

docker run --rm --name=alertmanager -p 9093:9093 -v /opt/prom-alert/alertmanager.conf:/alertmanager.conf \
        prom/alertmanager -config.file=/alertmanager.conf -log.level=debug -notification.smtp.smarthost="172.16.33.101" -notification.smtp.sender="mailer@angusliu.com"

: <<'EOD'
[root@docker1 docker-run]# docker run --rm prom/alertmanager --help
Usage of /bin/alertmanager:
  -alerts.min-refresh-period=5m0s: Minimum required alert refresh period before an alert is purged.
  -config.file="alertmanager.conf": Alert Manager configuration file name.
  -log.level=info: Only log messages with the given severity or above. Valid levels: [debug, info, warn, error, fatal, panic].
  -notification.buffer-size=1000: Size of buffer for pending notifications.
  -notification.flowdock.url="https://api.flowdock.com/v1/messages/team_inbox": Flowdock API V1 URL.
  -notification.hipchat.url="https://api.hipchat.com/v2": HipChat API V2 URL.
  -notification.opsgenie.url="https://api.opsgenie.com/v1/json/alert": OpsGenie API URL.
  -notification.pagerduty.url="https://events.pagerduty.com/generic/2010-04-15/create_event.json": PagerDuty API URL.
  -notification.pushover.retry-expiry-interval=7200: Timeout after which unacknowledged Pushover messages will not be retried further.
  -notification.pushover.retry-interval=60: Interval in seconds at which Pushover should retry pushing a message to receiving users.
  -notification.slack.timeout=10: HTTP timeout to talk to Slack (in seconds).
  -notification.smtp.sender="alertmanager@example.org": Sender email address to use in email notifications.
  -notification.smtp.smarthost="": Address of the smarthost to send all email notifications to.
  -silences.file="silences.json": Silence storage file name.
  -web.external-url="": The URL under which Alertmanager is externally reachable (for example, if Alertmanager is served via a reverse proxy). Used for generating relative and absolute links back to Alertmanager itself. If omitted, relevant URL components will be derived automatically.
  -web.hostname="": Hostname on which the Alertmanager is available to the outside world.
  -web.listen-address=":9093": Address to listen on for the web interface and API.
  -web.path-prefix="/": Prefix for all web paths.
  -web.use-local-assets=false: Serve assets and templates from local files instead of from the binary.
EOD
