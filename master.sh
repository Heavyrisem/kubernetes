kubeadm init --config kubernetes.yaml

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# CNI
# kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml
