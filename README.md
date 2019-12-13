# ArgoCD Demo for OpenShift 4

Install ArgoCD and some resources to demonstrate GitOps concepts and how they relate to OpenShift.

Based on [this GitOps blog post](https://blog.openshift.com/introduction-to-gitops-with-openshift/) from the [OpenShift blog](https://blog.openshift.com).

Unlike the blog post, this will install ArgoCD based on the [ArgoCD Operator](https://github.com/argoproj-labs/argocd-operator) that is in development.

When logging in with the CLI locally using CodeReady Containers (CRC), you need do some port forwarding:
```
kubectl port-forward svc/argocd-server -n argocd 8080:443
argocd login 127.0.0.1:8080
```

## Install ArgoCD

For now, all the steps are distilled into `install-argocd-operator.sh`.  Running that script will install the operator, then install an Argo CD instance.

```
./install-argocd-operator.sh
```


## Add Repo and App

To add CI/CD tools (Jenkins, SonarQube, Nexus):
```
oc create -f gitops/applications/cicd -n argocd
```

To add CodeReady Workspacdes:
```
oc create -f gitops/applications/codeready -n argocd
```