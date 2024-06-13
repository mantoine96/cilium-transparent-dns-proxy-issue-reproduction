# Reproduction for Transparent DNS proxy issue with Node local DNS

This repository contains a reproduction for the issue described in the issue [Transparent DNS proxy issue with Node local DNS]().

This aims at providing a reproduction for this log message: 
```
Timeout waiting for response to forwarded proxied DNS lookup" DNSRequestID=39256 dnsName=deathstar.default.svc.cluster.local. endpointID=388 error="read udp 169.254.20.10:38927->169.254.20.10:53: i/o timeout
```

## Steps to reproduce

* Clone this repository
* `make up`
* Exec into the `tiefighter` pod in the `default` namespace: `kubectl exec tiefighter -n default -it -- /bin/bash`
* Run `siege deathstar`
* You should see the error message in the logs of the Cilium agent

