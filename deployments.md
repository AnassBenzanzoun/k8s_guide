## deployments

as for replica set the deployments it's also a wrap around the previous method.
the deployments allow us to create an evironment ready for production in which we have 
rollbacks in case something goes wrong

- kind: Deployment

```bash
kubectl create -f deployment-definition.yml
```

to look at our new deployment we run
```bash
kubectl get deployment
```
you can also look at the replica set created and pods by running previous commands such as

```bash
kubectl get replicaset
```
or 
```bash
kubectl get pods
```


also you can run to see everything at once
```bash
kubectl get all
```
[deployment strategies](./deployment-strat.md)