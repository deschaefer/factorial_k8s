* This is the set of k8s artifacts to integrate the factorial containers


# k8s cluster create (create.bat)
* make sure you have built factorial and factorial ui and their images are in docker...
* kubectl apply -f factorial-deploy.yaml
* kubectl apply -f factorial-service.yaml
* kubectl apply -f factorial_ui-deploy.yaml
* kubectl apply -f factorial_ui-service.yaml

# verify it worked
* http://localhost:9091
* Fill in a number and submit
* factorial value should be presented

# expose the factorial service
* as built, the factorial service will not expose its http port
* to expose it uncomment the type line in factorial-service.yaml
* you can also expose it with the "expose" command but the yaml approach works for me...
* if it is exposed correctly you can access it at:
    * localhost:9090/swagger-ui.html

# k8s cluster create clean up (cleanup.bat)
* kubectl delete service -l run=ifactorial-ui
* kubectl delete -n default deployment ifactorial-ui
* kubectl delete service -l run=ifactorial
* kubectl delete -n default deployment ifactorial

# Shell for a pod
* get list of pods
    * kubectl get pods
* kubectl exec -it pod-name -- /bin/bash
    * for our case the pod name starts with "ifactorial"
    * kubectl exec -it ifactorial-ui-76b9b785d5-497vj -- /bin/bash

# Logs
* logging is at debug for the springboot apps.
* you can see them with:
    * kubectl logs pod-name
* for example
    * kubectl logs ifactorial-ui-76b9b785d5-qfvcl

# Articles
* dated but still useful article on debugging https://dev.to/sandrogiacom/kubernetes-for-java-developers-debug-application-4l1a

# k8s useful commands for factorial ui
* don't use minikube - use k8s built into docker
* kubectl apply -f factorial_ui-deploy.yaml
* kubectl delete -n default deployment ifactorial-ui
* kubectl describe deploy
* kubectl get pods -l run=ifactorial_ui -o wide
* kubectl get pods -l run=ifactorial_ui -o yaml | grep podIP
* kubectl apply -f factorial_ui-service.yaml
* kubectl get svc ifactorial_ui
* kubectl delete service -l run=ifactorial-ui

# k8s useful commands for factorial
* don't use minikube - use k8s built into docker
* kubectl apply -f factorial-deploy.yaml
* kubectl delete -n default deployment ifactorial
* kubectl describe deploy
* kubectl get pods -l run=ifactorial -o wide
* kubectl get pods -l run=ifactorial -o yaml | grep podIP
* kubectl apply -f factorial-service.yaml
* kubectl get svc ifactorial
* kubectl delete service -l run=ifactorial

