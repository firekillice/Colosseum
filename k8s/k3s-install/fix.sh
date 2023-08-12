#cgroupfs, systemd
#cat > /etc/docker/daemon.json <<EOF
#{
#  "exec-opts": ["native.cgroupdriver=cgroupfs"]
#}
#EOF



cat <<EOF | sudo tee /etc/docker/daemon.json
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2"
}
EOF
