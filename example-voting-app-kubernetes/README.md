## Example Voting App Kubernetes

This is based on the original [example-voting-app](https://github.com/dockersamples/example-voting-app) 

this is the simplest way to make your first app in kubernetes, basically you have a voting app in python
that comunicate with redis in memory db
then get pulled by a worker in .net and pushed to a postgress db.. after it gets pushed to the result app

- vote app must be exposed to the internet
- redis must be a private pod
- worker must be a private pod
- db must be a private pod
- result must be exposed to the internet

you can set different deployments for each app or make it using a single pod
in a real world app you would use deployment or demon sets to allow your app to scale
