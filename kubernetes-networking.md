## Kubernetes networking

in kubernetes an ip address get assigned to a pod internal network to allow comunication between containers

**kubernetes services** helps connect applications together, like frontend with backend and databases
services is an object like pods, replica set or deployment

- NodePort: listen in on a port and forward requests to the pod
- ClusterIP: create a virtual ip inside the cluster to allow comunication between applications
- Loadbalancer: allow to manage traffic between pods


**Nodeport** basically map a port on the Node to a port on the Pod
we have the pod port(target port), the service port and the node port

Nodeports can be in a valid range within 3000 to 32767

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

