### Run image in k8s

```
kubectl run -it redis-client --rm --image=redis --restart=Never -- bash
```
