kubeadm init --config kubernetes.yaml

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
sudo apt-get install apt-transport-https --yes
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm

# CNI
# kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml
# kubectl apply -f https://raw.githubusercontent.com/flannel-io/flannel/master/Documentation/kube-flannel.yml


# cloud provider
# helm install --repo https://raw.githubusercontent.com/kubernetes-sigs/cloud-provider-azure/master/helm/repo cloud-provider-azure --generate-name --set cloudControllerManager.imageRepository=mcr.microsoft.com/oss/kubernetes --set cloudControllerManager.imageName=azure-cloud-controller-manager --set cloudNodeManager.imageRepository=mcr.microsoft.com/oss/kubernetes --set cloudNodeManager.imageName=azure-cloud-node-manager
