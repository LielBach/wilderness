helm repo add cetic https://cetic.github.io/helm-charts
helm repo update

helm repo add bitnami https://charts.bitnami.com/bitnami

helm install scout-zookeeper bitnami/zookeeper -n scout-nifi-cluster
helm install scout-nifi cetic/nifi --set replicaCount=1 --set persistence.enabled=true --set zookeeper.enabled=false --set zookeeper.url=scout-zookeeper.scout-nifi-cluster.svc.cluster.local --set persistence.storageClass=azurefile -n scout-nifi-cluster