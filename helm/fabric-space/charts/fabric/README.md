# fabric

![Version: 1.1.4](https://img.shields.io/badge/Version-1.1.4-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 7.2.0](https://img.shields.io/badge/AppVersion-7.2.0-informational?style=flat-square)

Fabric Helm Chart for Kubernetes

## Description
The `fabric` Helm chart is designed to deploy the Fabric application on Kubernetes. This chart includes a variety of configurable options for environment variables, resource allocation, storage, ingress, and network policies to ensure a robust, secure, and high-performance deployment.

## Values
| Key | Type | Default | Description |
|-----|------|---------|-------------|
| container.annotationsList[0].name | string | `"description"` | Annotation key for container description |
| container.annotationsList[0].value | string | `"Fabric on Kubernetes"` | Annotation value for container description |
| container.image.repoSecret.dockerRegistry.auths."docker.share.cloud.k2view.com".password | string | `""` | Docker registry password for image pull |
| container.image.repoSecret.dockerRegistry.auths."docker.share.cloud.k2view.com".username | string | `""` | Docker registry username for image pull |
| container.image.repoSecret.enabled | bool | `false` | Enable Docker registry secret for image pull |
| container.image.repoSecret.name | string | `"registry-secret"` | Name of the Docker registry secret |
| container.image.url | string | `""` | URL of the Docker image |
| container.livenessProbe.initialDelaySeconds | int | `120` | Initial delay seconds for liveness probe |
| container.livenessProbe.periodSeconds | int | `60` | Period seconds for liveness probe |
| container.replicas | int | `1` | Number of container replicas |
| container.resource_allocation.limits.cpu | string | `"2"` | CPU limits for container |
| container.resource_allocation.limits.memory | string | `"8Gi"` | Memory limits for container |
| container.resource_allocation.requests.cpu | string | `"0.4"` | CPU requests for container |
| container.resource_allocation.requests.memory | string | `"2Gi"` | Memory requests for container |
| deploy.type | string | `"Deployment"` | Deployment type |
| global.labels[0].name | string | `"tenant"` | Global label key for tenant |
| global.labels[0].value | string | `"my-tenant"` | Global label value for tenant |
| global.labels[1].name | string | `"space"` | Global label key for space |
| global.labels[1].value | string | `"my-space"` | Global label value for space |
| global.namespace.name | string | `"space-tenant"` | Global namespace for deployment |
| ingress.appgw_ssl_certificate_name | string | `""` | Application Gateway SSL certificate name |
| ingress.class_name | string | `"nginx"` | Ingress class name |
| ingress.custom_annotations.annotations[0].key | string | `"kubernetes.io/ingress.class"` | Custom annotation key for ingress class |
| ingress.custom_annotations.annotations[0].value | string | `"nginx"` | Custom annotation value for ingress class |
| ingress.custom_annotations.annotations[1].key | string | `"nginx.ingress.kubernetes.io/proxy-body-size"` | Custom annotation key for proxy body size |
| ingress.custom_annotations.annotations[1].value | string | `"0"` | Custom annotation value for proxy body size |
| ingress.custom_annotations.annotations[2].key | string | `"nginx.ingress.kubernetes.io/proxy-read-timeout"` | Custom annotation key for proxy read timeout |
| ingress.custom_annotations.annotations[2].value | string | `"7d"` | Custom annotation value for proxy read timeout |
| ingress.custom_annotations.annotations[3].key | string | `"nginx.ingress.kubernetes.io/ssl-redirect"` | Custom annotation key for SSL redirect |
| ingress.custom_annotations.annotations[3].value | string | `"false"` | Custom annotation value for SSL redirect |
| ingress.custom_annotations.enabled | bool | `false` | Enable custom annotations for ingress |
| ingress.enabled | bool | `true` | Enable ingress |
| ingress.host | string | `"space-tenant.domain"` | Host for ingress |
| ingress.port | int | `3213` | Port for ingress |
| ingress.tlsSecret.crt | string | `""` | TLS certificate |
| ingress.tlsSecret.crt_b64 | string | `""` | Base64 encoded TLS certificate |
| ingress.tlsSecret.enabled | bool | `false` | Enable TLS secret for ingress |
| ingress.tlsSecret.key | string | `""` | TLS key |
| ingress.tlsSecret.key_b64 | string | `""` | Base64 encoded TLS key |
| ingress.type | string | `"nginx"` | Type of ingress |
| initSecretsList[0].data.GIT_BRANCH | string | `""` | Git branch for initialization secrets |
| initSecretsList[0].data.GIT_PATH_IN_REPO | string | `""` | Git path in repository for initialization secrets |
| initSecretsList[0].data.GIT_REPO | string | `""` | Git repository for initialization secrets |
| initSecretsList[0].data.GIT_TOKEN | string | `""` | Git token for initialization secrets |
| initSecretsList[0].data.IDP_CERT_PATH | string | `""` | IDP certificate path for initialization secrets |
| initSecretsList[0].data.IDP_ROLE | string | `""` | IDP role for initialization secrets |
| initSecretsList[0].data.START_FABRIC | string | `"false"` | Start Fabric flag for initialization secrets |
| initSecretsList[0].name | string | `"config-init-secrets"` | Name of the initialization secrets |
| labels[0].name | string | `"tenant"` | Label key for tenant |
| labels[0].value | string | `"my-tenant"` | Label value for tenant |
| labels[1].name | string | `"space"` | Label key for space |
| labels[1].value | string | `"my-space"` | Label value for space |
| listening_port | int | `3213` | Port for listening |
| mountSecret.data.config | string | `"fabricdb|MDB_DEFAULT_SCHEMA_CACHE_STORAGE_TYPE|NFS\\nfabricdb|MDB_DEFAULT_CACHE_PATH|/opt/apps/fabric/pod_tmp/fdb_cache\\ndefault_pubsub|TYPE|MEMORY\\ncommon_area_pubsub|TYPE|MEMORY\\nfabric|WEB_SESSION_EXPIRATION_TIME_OUT|540\\nfabric|ENABLE_BROADWAY_DEBUG_SERVLET|true\\ndefault_session|RECONNECT_MAX_DELAY_MS|1000\\nfabric|ENABLE_DB_INTERFACE_PROXY|true\\nfabric|WEBSERVER_FILTERS|[{\\\"class\\\":\\\"com.k2view.cdbms.ws.ProxyForward\\\",\\\"patterns\\\":[\\\"/studio/*\\\"],\\\"params\\\":{\\\"target\\\":\\\"http://localhost:3000\\\",\\\"isStaticTarget\\\":true}},{\\\"class\\\":\\\"com.k2view.cdbms.ws.ProxyForward\\\",\\\"patterns\\\":[\\\"/socket.io/*\\\"],\\\"params\\\":{\\\"target\\\":\\\"http://localhost:3000\\\",\\\"isStaticTarget\\\":false}}];\\nfabric|OVERRIDE_API_SCHEMA|HTTPS|ADD\\nfabric|OVERRIDE_API_PORT|443|ADD\\ndata_discovery|GRAPH_DB_URL|neo4j://dev-neo4j-service:7687\\ndata_discovery|GRAPH_DB_USER|neo4j\\ndata_discovery|GRAPH_DB_PASSWORD|Q1w2e3r4t5\\n"` | Configuration data for mount secret |
| mountSecret.data.cp_files | string | `""` | Copy files for mount secret |
| mountSecret.data.idp_cert | string | `""` | IDP certificate for mount secret |
| mountSecret.enabled | bool | `false` | Enable mount secret |
| mountSecret.mountPath | string | `"/opt/apps/fabric/config-secrets"` | Mount path for mount secret |
| mountSecret.name | string | `"config-secrets"` | Name of the mount secret |
| namespace.name | string | `"space-tenant"` | Namespace for deployment |
| networkPolicy.egress.enabled | bool | `false` | Enable egress network policy |
| networkPolicy.ingress.enabled | bool | `true` | Enable ingress network policy |
| scaling.enabled | bool | `false` | Enable scaling |
| scaling.maxReplicas | int | `1` | Maximum replicas for scaling |
| scaling.minReplicas | int | `1` | Minimum replicas for scaling |
| scaling.targetCPU | int | `90` | Target CPU utilization for scaling |
| scaling.targetKind | string | `"StatefulSet"` | Target kind for scaling |
| scaling.targetName | string | `"fabric-stateful-sets"` | Target name for scaling |
| secretsList[0].data.config | string | `""` | Configuration data for secrets |
| secretsList[0].data.cp_files | string | `""` | Copy files for secrets |
| secretsList[0].data.idp_cert | string | `""` | IDP certificate for secrets |
| secretsList[0].data.local_key | string | `""` | Local key for secrets |
| secretsList[0].name | string | `"config-secrets"` | Name of the secrets |
| secretsList[1].data.CONFIG_UPDATE_FILE | string | `"/opt/apps/fabric/config-secret/config"` | Configuration update file for secrets |
| secretsList[1].data.COPY_FILES | string | `""` | Copy files for secrets |
| secretsList[1].data.INIT_CONF | string | `""` | Initialization configuration for secrets |
| secretsList[1].data.PROJECT_ID | string | `""` | Project ID for secrets |
| secretsList[1].data.PROJECT_NAME | string | `""` | Project name for secrets |
| secretsList[1].data.SPACE_NAME | string | `""` | Space name for secrets |
| secretsList[1].name | string | `"common-env-secrets"` | Name of the secrets |
| secretsList[2].data."cassandra.default.hosts" | string | `"cassandra-service"` | Default hosts for Cassandra secrets |
| secretsList[2].data."cassandra.default.password" | string | `"cassandra"` | Password for Cassandra secrets |
| secretsList[2].data."cassandra.default.user" | string | `"cassandra"` | Username for Cassandra secrets |
| secretsList[2].name | string | `"cassandra-secrets"` | Name of the Cassandra secrets |
| serviceAccount.arn | string | `""` | ARN for service account |
| serviceAccount.cluster_name | string | `""` | Cluster name for service account |
| serviceAccount.create | bool | `true` | Enable creation of service account |
| serviceAccount.name | string | `""` | Name of the service account |
| serviceAccount.project_id | string | `""` | Project ID for service account |
| serviceAccount.provider | string | `""` | Provider for service account |
| storage.alocated_amount | string | `"10Gi"` | Amount of storage allocated |
| storage.class | string | `"gp2"` | Storage class |
| storage.pvc.enabled | bool | `true` | Enable PVC for storage |
| storage.securityContext | bool | `true` | Enable security context for storage |
| affinity.type | string | `"none"` | Specifies the type of affinity rule to apply. Options: `affinity`, `anti-affinity`, `none`. |
| affinity.label | object | `{}` | Label configuration for affinity rules. |
| affinity.label.name | string | `""` | The key of the label to be used for affinity rules. For example: `topology.kubernetes.io/zone`. |
| affinity.label.value | string | `""` | The value of the label to be used for affinity rules. For example: `region-a`. |

## Installation
### Install from helm repo
1. Add repo
```bash
helm repo add fabric https://nexus.share.cloud.k2view.com/repository/fabric
```

2. Install
```bash
helm install fabric/fabric fabric
```
