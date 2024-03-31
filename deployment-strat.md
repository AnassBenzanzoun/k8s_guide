## deployment strategies

the default deployment strategy in kubernetes is **Rolling update**
the rolling update allows our containers when there is a new version to get updated 
one at the time so our application doesn't have downs because we always have pods up and running

**under the hood**
our kubernetes will create a new replicaset and start creating the pods in there and one by one
deleting the old replica set pods

to make updates to your deployment all you have to do is update the 
deployment-definition.yml file and then run

```bash
kubectl apply -f deployment-definition.yml
```
you can do it manually by running 

```bash
kubectl set image <deployment name> \ 
<container name>=<registry image>
```
but remember that the 2nd method keeps the original file behind so it's not reccomended


**Rollback**
to go back to a previous version of your deployment run
```bash
kubectl rollout undo <deployment name>
```

if you want to see the status of your current rollout
```bash
kubectl rollout status <deployment name> 
```
or the history of rollouts
```bash
kubectl rollout history <deployment name> 
```

[kubernetes networking](./kubernetes-networking.md)