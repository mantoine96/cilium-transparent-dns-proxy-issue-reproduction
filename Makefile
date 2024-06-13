up:
	@kind create cluster --config=kind-config.yaml
	@./install-cilium.sh
	@kubectl delete ds kube-proxy -n kube-system
	@echo "Sleeping 20s while CRDs propagate"
	@sleep 20 # Wait for CRDs to be propagated
	@kubectl apply -f ./nodelocaldns.yaml
	@kubectl apply -f ./sample-workloads.yaml
	@echo "Sleeping 20s while pods start"
	@sleep 20 # Wait for pods to start
	@kubectl exec tiefighter -- /bin/bash -c 'apt-get update && apt-get install -yq siege'

down:
	@kind delete cluster
