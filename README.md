# kind Setup with Nginx Ingress Controller

#### 
## 1. Install kubectl and kind

```xml
git clone https://github.com/saifuddin-md/kind-cluster-setup-with-ingress.git
cd kind-cluster-setup-with-ingress
chmod +x kind-kubectl.sh
./install-kind-kubectl.sh
```
### Verify

```xml
kind version
kubectl version --client
```

#### -
## 2. Setup Cluster with one master and two worker Node

**Delete cluster:** *kind delete cluster --name mycluster* | *kind get clusters*

```xml
kind create cluster --name mycluster --config cluster-config.yml --image kindest/node:v1.33.1
```

### Verify

```groovy
kind get clusters
kubectl get pods
docker ps
kubectl get pods
kubectl get ns
kubectl get pods -n kube-system
kubectl get nodes
kubectl get nodes -o wide
kubectl get ns
```

#### -
## 3. Install Nginx Ingress Controller

```xml
kubectl apply -f ingress-controller-for-kind.yaml
```

### Verify

```xml
kubectl get pods -n ingress-nginx
kubectl get svc -n ingress-nginx
kubectl get deploy -n ingress-nginx
kubectl describe pod <pod-name> -n ingress-nginx
```

#### 

#### -
## 4. Install metrics server 

```xml
kubectl apply -f metrics-server-components.yaml
```


### 5. Install HELM 


```xml
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
helm version
helm
```
#### -----------------------------------------

## ingress resources

```xml
kubectl get ingressclass         ## SWhen you installer nginx ingress controller

What is k8s.io/ingress-nginx: It is the unique controller identifier used by the NGINX Ingress Controller to associate itself with an IngressClass and process matching ingress resources.

kubectl get ingress                      # Check Ingress Resource
kubectl describe ingress demo   # Check Ingress Resource

kubectl logs -n ingress-nginx <controller-pod>   # Check Ingress Logs


```

```
