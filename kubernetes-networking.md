## Kubernetes networking

in kubernetes an ip address get assigned to a pod internal network to allow comunication between containers

**kubernetes services** helps connect applications together, like frontend with backend and databases
services is an object like pods, replica set or deployment

- NodePort: listen in on a port and forward requests to the pod
- ClusterIP: create a virtual ip inside the cluster to allow comunication between applications
- Loadbalancer: allow to manage traffic between pods

## Node port
A NodePort is a type of Kubernetes Service that exposes a service on a static port on each Node's IP address. This is one way to expose a service to outside traffic and make it accessible from outside the cluster.

When a Service of type NodePort is created, Kubernetes allocates a port from a default range (30000-32767), or from a custom range specified by the `--service-node-port-range` flag (if set). This port is open on every Node, and any traffic that is sent to this port on any Node is forwarded to the service.

The service is also accessible on a cluster IP address and port. The NodePort service is automatically assigned a cluster IP address and port, and traffic can be routed to the service's Pods using this cluster IP address and port.

In the context of a NodePort service, there are three types of ports:

- **Pod port (TargetPort)**: The port on which the application in the Pod is running and accepting traffic.
- **Service port (Port)**: The port on which the service is exposed internally, within the cluster. Other applications within the cluster will use this port to communicate with the service.
- **NodePort**: The port on which the service is exposed on each Node. This port is accessible from outside the cluster.

to create a service you need a yml file <service-definition.yml>

- apiVersion: v1
- kind: Service
- metadata: 
    name: <myname>
- spec
    type: NodePort
    ports:
    - targetPort: 80
    port: 80
    nodeport: 3008
- selector


## ClusterIP
A ClusterIP is the default type of Kubernetes Service. It exposes the Service on a cluster-internal IP, making it accessible only within the cluster.

When a Service of type ClusterIP is created, Kubernetes assigns it a unique IP address from a range of cluster-internal IPs. This IP is not exposed on any Node, and is only accessible from within the cluster.

The ClusterIP service routes traffic to its Pods using a combination of the Service's IP and the target port.

In the context of a ClusterIP service, there are two types of ports:

- **Pod port (TargetPort)**: The port on which the application in the Pod is running and accepting traffic.
- **Service port (Port)**: The port on which the service is exposed internally, within the cluster. Other applications within the cluster will use this port to communicate with the service.

Unlike a NodePort, a ClusterIP does not have a port that is exposed on each Node. Instead, it is accessible via the Service's cluster IP and port. This makes it a good choice for internal communication between services in the same cluster.

apiVersion: v1
kind: Service
metadata: 
  name: <myname>
spec:
  type: ClusterIP
  ports:
  - targetPort: 80
    port: 80
  selector:
    app: <app-name>

**remember** the label of your pods must match the selector of your services
Sure, here's a similar explanation for a Service of type `LoadBalancer`:

## LoadBalancer
A LoadBalancer is a type of Kubernetes Service that exposes the Service externally using a cloud provider's load balancer. It is accessible from outside the cluster.

When a Service of type LoadBalancer is created, Kubernetes creates a NodePort and ClusterIP Service, to which the external load balancer will route.

The cloud provider provisions a load balancer and updates the Service with the IP address of the load balancer. The traffic from the external load balancer is directed to the Service's NodePort, which then routes it to the Pods.

In the context of a LoadBalancer service, there are three types of ports:

- **Pod port (TargetPort)**: The port on which the application in the Pod is running and accepting traffic.
- **Service port (Port)**: The port on which the service is exposed internally, within the cluster. Other applications within the cluster will use this port to communicate with the service.
- **NodePort**: The port on which the service is exposed on each Node. This port is accessible from outside the cluster, and is the port to which the external load balancer routes traffic.


```yaml
apiVersion: v1
kind: Service
metadata: 
  name: <myname>
spec:
  type: LoadBalancer
  ports:
  - targetPort: 80
    port: 80
  selector:
    app: <app-name>
```

[ingress](./ingress.md)