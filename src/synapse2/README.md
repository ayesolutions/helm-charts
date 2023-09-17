# synapse

![Version: 0.24.0](https://img.shields.io/badge/Version-0.24.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v1.92.2](https://img.shields.io/badge/AppVersion-v1.92.2-informational?style=flat-square)

The reference implementation for a Matrix.org chat server

**Homepage:** <https://github.com/matrix-org/synapse>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Gavin Mogan | <helm@gavinmogan.com> |  |

## Source Code

* <https://github.com/matrix-org/synapse>
* <https://hub.docker.com/r/matrixdotorg/synapse>
* <https://matrix.org/blog/home/>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | postgresql | ~12.3.0 |
| https://charts.bitnami.com/bitnami | redis | ~17.10.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| cacheFactor | float | `0.5` | How much data should be cached in ram - See https://github.com/matrix-org/synapse#help-synapse-is-slow-and-eats-all-my-ramcpu |
| database.host | string | `nil` |  |
| database.mode | string | `"sqlite"` |  |
| database.name | string | `"synapse"` |  |
| database.password | string | `nil` |  |
| database.port | int | `5432` |  |
| database.username | string | `"synapse"` |  |
| deploymentAnnotations | object | `{}` |  |
| existingMediaClaim | string | `nil` |  |
| extraConfigs | object | `{}` |  |
| extra_python_modules[0] | string | `"https://github.com/devture/matrix-synapse-shared-secret-auth/archive/refs/tags/2.0.2.zip"` |  |
| extra_python_modules[1] | string | `"https://github.com/t2bot/synapse-simple-antispam/archive/refs/heads/master.zip#egg=synapse-simple-antispam"` |  |
| federation_sender.redis.enabled | bool | `true` |  |
| federation_sender.redis.host | string | `"synapse-redis-master.matrix.svc.cluster.local"` |  |
| federation_sender.redis.password | string | `"riches-jarring-acts"` |  |
| federation_sender.worker_app | string | `"synapse.app.federation_sender"` |  |
| federation_sender.worker_listeners[0].port | int | `8083` |  |
| federation_sender.worker_listeners[0].resources[0].names[0] | string | `"federation"` |  |
| federation_sender.worker_listeners[0].type | string | `"http"` |  |
| federation_sender.worker_log_config | string | `"/config/log.config"` |  |
| federation_sender.worker_name | string | `"federation_sender"` |  |
| fullnameOverride | string | `""` |  |
| generic_worker.redis.enabled | bool | `true` |  |
| generic_worker.redis.host | string | `"synapse-redis-master.matrix.svc.cluster.local"` |  |
| generic_worker.redis.password | string | `"riches-jarring-acts"` |  |
| generic_worker.worker_app | string | `"synapse.app.generic_worker"` |  |
| generic_worker.worker_listeners[0].port | int | `8083` |  |
| generic_worker.worker_listeners[0].resources[0].names[0] | string | `"federation"` |  |
| generic_worker.worker_listeners[0].type | string | `"http"` |  |
| generic_worker.worker_log_config | string | `"/config/log.config"` |  |
| homeserver.account_threepid_delegates | object | `{}` |  |
| homeserver.account_validity | string | `nil` |  |
| homeserver.acme.account_key_file | string | `"/data/acme_account.key"` |  |
| homeserver.acme.bind_addresses[0] | string | `"::"` |  |
| homeserver.acme.bind_addresses[1] | string | `"0.0.0.0"` |  |
| homeserver.acme.domain | string | `"matrix.example.com"` |  |
| homeserver.acme.enabled | bool | `false` |  |
| homeserver.acme.port | int | `80` |  |
| homeserver.acme.reprovision_threshold | int | `30` |  |
| homeserver.database.args.database | string | `"/data/homeserver.db"` |  |
| homeserver.database.name | string | `"sqlite3"` |  |
| homeserver.email | string | `nil` |  |
| homeserver.enable_metrics | bool | `true` |  |
| homeserver.federation_ip_range_blacklist[0] | string | `"127.0.0.0/8"` |  |
| homeserver.federation_ip_range_blacklist[1] | string | `"10.0.0.0/8"` |  |
| homeserver.federation_ip_range_blacklist[2] | string | `"172.16.0.0/12"` |  |
| homeserver.federation_ip_range_blacklist[3] | string | `"192.168.0.0/16"` |  |
| homeserver.federation_ip_range_blacklist[4] | string | `"100.64.0.0/10"` |  |
| homeserver.federation_ip_range_blacklist[5] | string | `"169.254.0.0/16"` |  |
| homeserver.federation_ip_range_blacklist[6] | string | `"::1/128"` |  |
| homeserver.federation_ip_range_blacklist[7] | string | `"fe80::/64"` |  |
| homeserver.federation_ip_range_blacklist[8] | string | `"fc00::/7"` |  |
| homeserver.federation_sender_instances[0] | string | `"federation_sender"` |  |
| homeserver.form_secret | string | `""` |  |
| homeserver.instance_map.federation_sender.host | string | `"{{ include \"synapse.fullname\" . }}-federation-sender"` |  |
| homeserver.instance_map.federation_sender.port | int | `8083` |  |
| homeserver.instance_map.main.host | string | `"localhost"` |  |
| homeserver.instance_map.main.port | int | `8030` |  |
| homeserver.instance_map.worker.host | string | `"{{ include \"synapse.fullname\" . }}-worker"` |  |
| homeserver.instance_map.worker.port | int | `8083` |  |
| homeserver.listeners[0].bind_addresses[0] | string | `"0.0.0.0"` |  |
| homeserver.listeners[0].port | int | `9000` |  |
| homeserver.listeners[0].type | string | `"metrics"` |  |
| homeserver.listeners[1].bind_addresses[0] | string | `"0.0.0.0"` |  |
| homeserver.listeners[1].port | int | `9093` |  |
| homeserver.listeners[1].resources[0].names[0] | string | `"replication"` |  |
| homeserver.listeners[1].type | string | `"http"` |  |
| homeserver.listeners[2].port | int | `8008` |  |
| homeserver.listeners[2].resources[0].compress | bool | `true` |  |
| homeserver.listeners[2].resources[0].names[0] | string | `"client"` |  |
| homeserver.listeners[2].resources[1].compress | bool | `false` |  |
| homeserver.listeners[2].resources[1].names[0] | string | `"federation"` |  |
| homeserver.listeners[2].tls | bool | `false` |  |
| homeserver.listeners[2].type | string | `"http"` |  |
| homeserver.listeners[2].x_forwarded | bool | `true` |  |
| homeserver.log_config | string | `"/config/log.config"` |  |
| homeserver.macaroon_secret_key | string | `""` |  |
| homeserver.media_store_path | string | `"/data/media_store"` |  |
| homeserver.metrics_flags | string | `nil` |  |
| homeserver.old_signing_keys | string | `nil` |  |
| homeserver.opentracing | string | `nil` |  |
| homeserver.outbound_federation_restricted_to[0] | string | `"federation_sender"` |  |
| homeserver.password_config | string | `nil` |  |
| homeserver.pid_file | string | `"/data/homeserver.pid"` |  |
| homeserver.redis.enabled | bool | `true` | If you want workers/distributed processing, you want redis as of 1.67 https://matrix-org.github.io/synapse/v1.67/upgrade.html#direct-tcp-replication-is-no-longer-supported-migrate-to-redis |
| homeserver.redis.host | string | `"synapse-redis-master.matrix.svc.cluster.local"` |  |
| homeserver.redis.password | string | `"riches-jarring-acts"` |  |
| homeserver.registration_shared_secret | string | `""` |  |
| homeserver.report_stats | bool | `true` |  |
| homeserver.retention | string | `nil` |  |
| homeserver.saml2_config.user_mapping_provider.config | string | `nil` |  |
| homeserver.send_federation | bool | `false` |  |
| homeserver.server_name | string | `"server_name"` |  |
| homeserver.signing_key_path | string | `"/data/server_name.signing.key"` |  |
| homeserver.sso | string | `nil` |  |
| homeserver.trusted_key_servers[0].server_name | string | `"matrix.org"` |  |
| homeserver.worker_replication_secret | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"matrixdotorg/synapse"` |  |
| image.tag | string | `"{{ .Chart.AppVersion }}"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths | list | `[]` |  |
| ingress.ingressClassName | string | `nil` |  |
| ingress.tls | list | `[]` |  |
| logconfig.disable_existing_loggers | bool | `false` |  |
| logconfig.filters.context.() | string | `"synapse.logging.context.LoggingContextFilter"` |  |
| logconfig.filters.context.request | string | `""` |  |
| logconfig.formatters.precise.format | string | `"%(asctime)s - %(name)s - %(lineno)d - %(levelname)s - %(request)s - %(message)s"` |  |
| logconfig.handlers.console.class | string | `"logging.StreamHandler"` |  |
| logconfig.handlers.console.filters[0] | string | `"context"` |  |
| logconfig.handlers.console.formatter | string | `"precise"` |  |
| logconfig.handlers.file.backupCount | int | `10` |  |
| logconfig.handlers.file.class | string | `"logging.handlers.RotatingFileHandler"` |  |
| logconfig.handlers.file.encoding | string | `"utf8"` |  |
| logconfig.handlers.file.filename | string | `"/data/homeserver.log"` |  |
| logconfig.handlers.file.filters[0] | string | `"context"` |  |
| logconfig.handlers.file.formatter | string | `"precise"` |  |
| logconfig.handlers.file.maxBytes | int | `104857600` |  |
| logconfig.loggers."synapse.storage.SQL".level | string | `"INFO"` |  |
| logconfig.root.handlers[0] | string | `"file"` |  |
| logconfig.root.handlers[1] | string | `"console"` |  |
| logconfig.root.level | string | `"INFO"` |  |
| logconfig.version | int | `1` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| persistence.accessModes[0] | string | `"ReadWriteMany"` |  |
| persistence.enabled | bool | `false` |  |
| persistence.existingClaim | string | `nil` |  |
| persistence.size | string | `"8Gi"` |  |
| persistence.storageClassName | string | `nil` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| postgresql.enabled | bool | `false` |  |
| probes.liveness.failureThreshold | int | `5` |  |
| probes.liveness.initialDelaySeconds | int | `5` |  |
| probes.liveness.periodSeconds | int | `10` |  |
| probes.readiness.failureThreshold | int | `5` |  |
| probes.readiness.initialDelaySeconds | int | `5` |  |
| probes.readiness.periodSeconds | int | `10` |  |
| probes.startup.failureThreshold | int | `30` |  |
| probes.startup.initialDelaySeconds | int | `5` |  |
| probes.startup.periodSeconds | int | `10` |  |
| redis.auth.password | string | `"riches-jarring-acts"` |  |
| redis.enabled | bool | `true` |  |
| replicaCounts.federation_sender | int | `1` |  |
| replicaCounts.generic_worker | int | `1` |  |
| replicaCounts.master | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.externalTrafficPolicy | string | `nil` |  |
| service.port | int | `8443` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `nil` |  |
| settings.gid | string | `"991"` |  |
| settings.report_stats | string | `"yes"` |  |
| settings.uid | string | `"991"` |  |
| tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
