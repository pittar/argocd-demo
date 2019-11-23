# ArgoCD Demo

To install ArgoCD on OpenShift or CRC, follow these instructions:
[https://blog.openshift.com/introduction-to-gitops-with-openshift/](GitOps on OpenShift)

There seems to be a problem with the CLI and CRC 4.2.2 (at least on MacOS).  UI works fine.

## Add Repo and App

```
argocd repo add https://github.com/pittar/argocd-demo.git

argocd repo list

argocd app create --project default \
    --name java-demo-app \
    --repo https://github.com/pittar/argocd-demo.git \
    --path gitops/java \
    --dest-server https://kubernetes.default.svc \
    --dest-namespace argocd \
    --revision master

argocd app list

argocd app sync java-app-demo
```