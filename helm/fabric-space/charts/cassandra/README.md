# Cassandra Helm Chart

![Version: 1.1.0](https://img.shields.io/badge/Version-1.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 3.11.8](https://img.shields.io/badge/AppVersion-3.11.8-informational?style=flat-square)

This Helm chart deploys Cassandra on Kubernetes.

## Values
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
| affinity.type | string | `"none"` | Specifies the type of affinity rule to apply. Options: `affinity`, `anti-affinity`, `none`. |
| affinity.label | object | `{}` | Label configuration for affinity rules. |
| affinity.label.name | string | `""` | The key of the label to be used for affinity rules. For example: `topology.kubernetes.io/zone`. |
| affinity.label.value | string | `""` | The value of the label to be used for affinity rules. For example: `region-a`. |

>NOTE: for mo information about Cassandra configs in the image [Cassandra docker hub](https://hub.docker.com/_/cassandra) in Configuring Cassandra section.

## Installation
### Install from helm repo
1. Add repo
```bash
helm repo add cassandra https://nexus.share.cloud.k2view.com/repository/cassandra
```

2. Install
```bash
helm install cassandra/cassandra cassandra
```
