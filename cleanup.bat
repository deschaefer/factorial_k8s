kubectl delete service -l run=ifactorial-ui
kubectl delete -n default deployment ifactorial-ui
kubectl delete service -l run=ifactorial
kubectl delete -n default deployment ifactorial
