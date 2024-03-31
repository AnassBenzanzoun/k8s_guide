## Replica set

the replica set allows our pod to be recreated immediately whenever one goes down
also if there are multiple pods it allows load balancing and scaling of our application 
by creating multiple pods to recive traffic

it's very close to how pods are created but in this case we change
- apiVersion: apps/v1
- kind: ReplicaSet
and 
- spec: 
    template: (the template contains the definition of our pod like we previously did with pod apiVersion and kind are no longer needed)

- replicas: (here we add the numbers of replicas of the same pod we need)
- selector: 
    matchLabels:(this allow replica set to get all the pods created now or even earlier that has the same label)

to run it we do the same as we did for the pod

```bash
kubectl create -f (replicaset-definition.yml)
 ```

to check our replica set we run

```bash
kubectl get replicaset
 ```

 also if you run
 ```bash
kubectl get pods 
 ```
 you should see as many replicas as you set in the yml file

 if in the future you want more replicas than what you have specified here you can just add them to yml file and run

  ```bash
kubectl replace -f (replicaset-definition.yml)
 ```
 or you can do it by 
   ```bash
kubectl scale --replicas=number_of_replicas replicaset-definition.yml
 ```
 the second way doesn't update your file number so they might mismatch it is raccomanded to use the first method

 to delete the replica and it's underlying pods use 
   ```bash
kubectl delete replicaset (replicaset name)
 ```

 replica set configuration is saved inside a yml file which is monitored and whenever updated 
 the replica set reruns.. to edit this file (maybe with new image for your containers)
 run

    ```bash
kubectl edit replicaset (replicaset name)
 ```
if you did change the image you must delete the previous pods to make the change effective
so you might want to use the replace command

[deployments](./deployments.md)