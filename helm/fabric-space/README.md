# Fabric-space

![Version: 1.1.5](https://img.shields.io/badge/Version-1.1.5-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 7.2](https://img.shields.io/badge/AppVersion-7.2-informational?style=flat-square)

The following Helm Chart Deploys Fabric and Cassandra

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://./charts/cassandra | cassandra | ~1.1.0-0 |
| file://./charts/fabric | fabric | ~1.1.5-0 |

## Values
### Cassandra
| Key | Type | Default | Description |
|-----|------|---------|-------------|
| container.image.url | string | `"cassandra:3.11.8"` | Sets the Cassandra container image URL. |
| container.image.repoSecret.enabled | bool | `false` | Determines whether the use of a Docker registry secret is enabled. |
| container.image.repoSecret.name | string | `"registry-secret"` | Names the Kubernetes secret used for accessing the private Docker registry. |
| container.image.repoSecret.dockerRegistry.auths."docker.share.cloud.k2view.com".password | string | `""` | Specifies the password for accessing the private Docker registry. |
| container.image.repoSecret.dockerRegistry.auths."docker.share.cloud.k2view.com".username | string | `""` | Provides the username for accessing the private Docker registry. |
| container.replicas | int | `1` | Defines the number of Cassandra replicas to deploy. |
| container.resource_allocation.limits.cpu | string | `"1"` | Sets the maximum CPU limit for each Cassandra container to 1 CPU. |
| container.resource_allocation.limits.memory | string | `"4Gi"` | Specifies the maximum memory limit for each Cassandra container to 4 gigabytes. |
| container.resource_allocation.requests.cpu | string | `"0.4"` | Requests 0.4 CPU for each Cassandra container, ensuring that much CPU is reserved. |
| container.resource_allocation.requests.memory | string | `"2Gi"` | Requests 2 gigabytes of memory for each Cassandra container, reserving that amount of memory. |
| container.envList | list |  | A list of environment variables for the Cassandra container. Each item in the list consists of a key and value pair, where the key represents the name of the environment variable, and the value specifies the setting applied to that variable. This setup allows for customizable configuration of the Cassandra instance in various areas such as heap size, cluster data center and rack information, seed nodes, cluster naming, and other operational settings . |
| container.envList[0].key | string | `"HEAP_NEWSIZE"` | Specifies the key name for the young/new generation heap size environment variable. |
| container.envList[0].value | string | `"128M"` | Sets the initial size of the young generation heap space to 128 megabytes. |
| container.envList[1].key | string | `"MAX_HEAP_SIZE"` | Indicates the key name for the maximum heap size environment variable. |
| container.envList[1].value | string | `"2G"` | Configures the maximum size of the heap to 2 gigabytes. |
| container.envList[2].key | string | `"CASSANDRA_DC"` | Specifies the key name for the Cassandra data center environment variable. |
| container.envList[2].value | string | `"DC1"` | Sets the name of the Cassandra data center to 'DC1'. |
| container.envList[3].key | string | `"CASSANDRA_ENDPOINT_SNITCH"` | Defines the key for the Cassandra endpoint snitch configuration. |
| container.envList[3].value | string | `"GossipingPropertyFileSnitch"` | Configures the snitch implementation as 'GossipingPropertyFileSnitch', which is suitable for production setups. |
| credentials.cassandra_password | string | `"cassandra"` | Sets the default password for the Cassandra database. |
| credentials.cassandra_username | string | `"cassandra"` | Sets the default username for the Cassandra database.|
| labels[0].name | string | `"tenant"` | Defines a label with the key 'tenant'. |
| labels[0].value | string | `"my-tenant"` | Assigns the value 'my-tenant' to the 'tenant' label. |
| labels[1].name | string | `"space"` | Specifies a label with the key 'space'. |
| labels[1].value | string | `"my-space"` | Sets the value 'my-space' for the 'space' label. |
| listening_port | int | `9042` | Configures the port on which Cassandra listens for client connections. |
| namespace.create | bool | `true` | Indicates whether to create a new Kubernetes namespace for the Cassandra deployment. |
| namespace.name | string | `"space-tenant"` | Names the Kubernetes namespace for the deployment. |
| networkPolicy.enabled | bool | `true` | Determines if a network policy should be applied to the Cassandra deployment. |
| storage.alocated_amount | string | `"10Gi"` | Specifies the amount of storage allocated for Cassandra data, set to 10 gigabytes. |
| storage.class | string | `"gp2"` | Defines the storage class to be used for Cassandra data storage. |

### Fabric
| Key | Type | Default | Description |
|-----|------|---------|-------------|
| namespace.create | bool | `true` | Flag to create a new Kubernetes namespace for the deployment. |
| namespace.name | string | `"space-tenant"` | The name of the Kubernetes namespace to be used or created. |
| container.annotationsList | list |`[]`| A list of annotations to be added to the container. Each annotation is defined by a name-value pair. |
| container.image.url | string | `""` | URL of the container image to be used. |
| container.image.repoSecret.enabled | bool | `false` | Flag to enable or disable the use of a Docker registry secret. |
| container.image.repoSecret.dockerRegistry | object |`{}`| Configuration for the Docker registry secret. Includes authentication details like username and password. |
| container.livenessProbe.initialDelaySeconds | int | `120` | Initial delay in seconds for the liveness probe to start. |
| container.livenessProbe.periodSeconds | int | `60` | Time period in seconds for the liveness probe to repeat. |
| container.replicas | int | `1` | Number of container replicas to deploy. |
| container.resource_allocation.limits.cpu | string | `"1"` | The maximum amount of CPU allocated for the container. |
| container.resource_allocation.limits.memory | string | `"4Gi"` | The maximum amount of memory allocated for the container. |
| container.resource_allocation.requests.cpu | string | `"0.4"` | The requested amount of CPU for the container. |
| container.resource_allocation.requests.memory | string | `"2Gi"` | The requested amount of memory for the container. |
| deploy.type | string | `"Deployment"` | The type of deployment, Deployment for single node fabric, StatefulSet for Fabric server cluster. |
| ingress.annotations | list |`[]`| A list of annotations to be added to the ingress resource. Each annotation is defined by a key-value pair. |
| ingress.annotations[0].key | string | `"kubernetes.io/ingress.class"` | Key for the first ingress annotation, typically defining the ingress class. |
| ingress.annotations[0].value | string | `"nginx"` | Value for the first ingress annotation, specifying the ingress class. |
| ingress.enabled | bool | `true` | Flag to enable or disable ingress. |
| ingress.host | string | `"space-tenant.domain"` | Hostname for the ingress resource. |
| ingress.port | int | `3213` | Port number for the ingress resource. |
| ingress.tlsSecret.crt | string | `""` | TLS certificate for the ingress, if enabled. |
| ingress.tlsSecret.enabled | bool | `false` | Flag to enable or disable TLS for the ingress. |
| ingress.tlsSecret.key | string | `""` | TLS private key for the ingress, if TLS is enabled. |
| initSecretsList | list |`[]`| A list of initial secrets to be used by the init cantainer. |
| labels | list |`[]`| A list of labels to be applied to the deployment. Each label is defined by a name-value pair. |
| listening_port | int | `3213` | Port number on which the application will listen. |
| mountSecret | object |`{}`| Configuration for mounting secrets into the container. Includes the mount path and secret data details. |
| mountSecret.name | string | `"config-secrets"` | Name of the secret to be mounted. |
| mountSecret.enabled | bool | `false` | Flag to enable or disable mounting of the secret. |
| mountSecret.mountPath | string | `"/opt/apps/fabric/config-secrets"` | Path where the secret data will be mounted. |
| mountSecret.data.config | string | `""` | Configuration data to be mounted as a secret. |
| mountSecret.data.cp_files | string | `""` | Data for copy files to be mounted as a secret. |
| mountSecret.data.idp_cert | string | `""` | IDP certificate data to be mounted as a secret. |
| networkPolicy.enabled | bool | `false` | Flag to enable or disable network policies. |
| scaling.enabled | bool | `false` | Flag to enable or disable auto-scaling. |
| scaling.maxReplicas | int | `1` | Maximum number of replicas for auto-scaling. |
| scaling.minReplicas | int | `1` | Minimum number of replicas for auto-scaling. |
| scaling.targetCPU | int | `90` | CPU utilization percentage to trigger scaling. |
| secretsList | list |`[]`| A list of secrets to be mounted on a container as a files. |
| storage.alocated_amount | string | `"10Gi"` | Allocated storage amount for the persistent volume. |
| storage.class | string | `"gp2"` | Storage class to be used for persistent storage. |
| storage.pvc.enabled | bool | `true` | Flag to enable or disable the use of Persistent Volume Claims, true for Deployment, false for StatefulSet. |
| storage.securityContext | bool | `true` | Flag to enable or disable the security context for storage. |
| serviceAccount.create | bool | `true` | Flag to create a new service account in Kubernetes. |
| serviceAccount.name | string | `""`   | Name of the service account, left empty for new account creation. |
| serviceAccount.provider | string | `""` | Cloud provider for the service account (aws or gcp). |
| serviceAccount.arn | string | `""` | IAM role ARN for AWS service accounts. |
| serviceAccount.gcp_service_account_name | string |`""`| Service account name for GCP. |
| serviceAccount.project_id | string |`""`| Project ID for GCP service accounts. |
