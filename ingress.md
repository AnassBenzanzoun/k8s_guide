## Ingress
Ingress in Kubernetes is an API object that manages external access to the services in a cluster, typically HTTP and HTTPS. It provides HTTP and HTTPS routing to services based on hostnames or URL paths.

Here are some key points about Ingress:

- **Routing**: Ingress allows you to route traffic to services based on the request host or path, allowing you to have multiple services, each exposed on the same port, with different paths or hostnames.

- **Load Balancing**: Ingress, when used with Ingress Controllers, can provide load balancing features.

- **SSL/TLS termination**: Ingress allows you to terminate SSL/TLS encryption at the load balancer before traffic is sent to the services. This offloads the decryption overhead from the services.

- **Name-based virtual hosting**: Ingress allows you to route traffic to multiple host names at the same IP address.

Here's an example of an Ingress that routes traffic based on the request path:

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: example-ingress
spec:
  rules:
  - host: myapp.mydomain.com
    http:
      paths:
      - pathType: Prefix
        path: "/service1"
        backend:
          service:
            name: service1
            port:
              number: 80
      - pathType: Prefix
        path: "/service2"
        backend:
          service:
            name: service2
            port:
              number: 80
```

In this example, HTTP requests to `myapp.mydomain.com/service1` are routed to `service1`, and requests to `myapp.mydomain.com/service2` are routed to `service2`.

you must deploy an ingress controller before manging resources through ingress, it can be:

- nginx 
- GCP Load balancer

- contour 
- haproxy 
- traefik
- istio

the first 2 are supported by kubernetes in here we will use nginx

there are different way to route traffic here which can be by path on same host
different host/ domanin 