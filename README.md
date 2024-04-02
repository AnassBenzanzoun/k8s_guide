## kubernetes
**requirements**: 
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- [minikube](https://minikube.sigs.k8s.io/docs/start/) or [k3s](https://docs.k3s.io/installation)

after you run the **minikube start** you can procede with the first command
you can also use: 
- gke
- eks 
- aks

```bash
kubectl run (name) --image=(image from dockerhub or other registry)
 ```

the command above run a pod which is 
the smallest deployable unit in Kubernetes, representing a single instance of a running process in your cluster.
```bash
kubectl create deployment (name) --image=(name)
 ```

the command above manages a set of identical Pods, ensuring that they run and scale as desired. Deployments allow you to declaratively manage Pod replicas, rolling updates, and rollbacks.

so that's the difference between creating a single pod or a deployment

check status by running
```bash
kubectl get pods -o wide or kubectl describe pod (name)
 ```

when creating a pod from yml file there are **4 must fields**

- apiVersion: v1 or apps/v1 
- kind: pod, service, replicaset or deployment
- metadata: name, labels (labels is a dict that can contain any key value pair)
- spec: containers (is a list of all containers you want inside a single pod)
each item in the list must have a name and an image pointing to the image inside the registry

```bash
kubectl create -f (pod-file.yml)
 ```
to delete a pod you can run 
```bash
kubectl delete pod <pod-name>
 ```

[replica set](./replication-set.md)