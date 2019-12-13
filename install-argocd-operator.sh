#!/bin/bash

echo "Create argocd project."
oc new-project argocd

echo "Create Argo CD service account, role, and role binding."
oc create -f https://raw.githubusercontent.com/argoproj-labs/argocd-operator/master/deploy/service_account.yaml
oc create -f https://raw.githubusercontent.com/argoproj-labs/argocd-operator/master/deploy/role.yaml
oc create -f https://raw.githubusercontent.com/argoproj-labs/argocd-operator/master/deploy/role_binding.yaml
wait 5000

echo "Add the Argo CD CRDs."
oc create -f https://raw.githubusercontent.com/argoproj-labs/argocd-operator/master/deploy/argo-cd/argoproj_v1alpha1_appproject_crd.yaml
oc create -f https://raw.githubusercontent.com/argoproj-labs/argocd-operator/master/deploy/argo-cd/argoproj_v1alpha1_application_crd.yaml
wait 5000

echo "Add the Argo CD operator CRD."
oc create -f https://raw.githubusercontent.com/argoproj-labs/argocd-operator/master/deploy/crds/argoproj_v1alpha1_argocd_crd.yaml
wait 5000

echo "Listing CRDs.  There should be three!"
oc get crd | grep argo
wait 5000

echo "Deploy the operator."
oc create -f https://raw.githubusercontent.com/argoproj-labs/argocd-operator/master/deploy/operator.yaml
wait 5000

echo "Create an Argo CD instance."
oc create -f https://raw.githubusercontent.com/pittar/argocd-demo/master/deploy/argocd.yaml

echo "Enjoy!"