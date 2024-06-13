#!/bin/bash

cilium_version="v1.14.12"

docker pull quay.io/cilium/cilium:${cilium_version}
kind load docker-image quay.io/cilium/cilium:${cilium_version}

helm install cilium cilium/cilium --version ${cilium_version} \
   --namespace kube-system \
   --set image.pullPolicy=IfNotPresent \
   --set ipam.mode=kubernetes \
   --set kubeProxyReplacement=true \
   --set hostPort.enabled=true

