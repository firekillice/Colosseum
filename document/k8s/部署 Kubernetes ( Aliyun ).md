## 准备安装文件

```bash
sudo curl -sfL https://github.com/k3s-io/k3s/releases/download/v1.21.1%2Bk3s1/k3s -o /usr/local/bin/k3s && sudo chmod +x /usr/local/bin/k3s
```

## 配置镜像和私有注册表

```bash
sudo mkdir -p /etc/rancher/k3s && sudo tee /etc/rancher/k3s/registries.yaml << EOF
mirrors:
  docker.io:
    endpoint:
      - "https://wixr7yss.mirror.aliyuncs.com"
  gcr.io:
    endpoint:
      - "https://wixr7yss.mirror.aliyuncs.com"
  mcr.microsoft.com:
    endpoint:
      - "https://wixr7yss.mirror.aliyuncs.com"
  quay.io:
    endpoint:
      - "https://wixr7yss.mirror.aliyuncs.com"

configs:
  registry-vpc.cn-beijing.aliyuncs.com:
    auth:
      username: capsupport
      password: Capjx@1234
EOF
```

## 配置 Traefik 配置

```bash
sudo mkdir -p /var/lib/rancher/k3s/server/manifests && sudo tee /var/lib/rancher/k3s/server/manifests/traefik-config.yaml << EOF
apiVersion: helm.cattle.io/v1
kind: HelmChartConfig
metadata:
  name: traefik
  namespace: kube-system
spec:
  valuesContent: |-
    externalTrafficPolicy: Local
EOF
```

## 部署控制节点

```bash
# 配置外部地址
# NODE_EXTERNAL_IP=

# 配置本地存储路径
# LOCAL_STORAGE_PATH=

# 配置节点名
# K3S_NODE_NAME="k3s"

# 安装 K3s Server
curl -sfL https://get.k3s.io | \
    sudo \
    INSTALL_K3S_SKIP_DOWNLOAD=true \
    INSTALL_K3S_EXEC="--node-external-ip ${NODE_EXTERNAL_IP} --tls-san ${NODE_EXTERNAL_IP} --default-local-storage-path ${LOCAL_STORAGE_PATH}" \
    K3S_NODE_NAME="${K3S_NODE_NAME}" \
    sh -
```

## 查看访问凭证

```bash
echo "$(sudo cat /etc/rancher/k3s/k3s.yaml | sed -r "/server: https:\/\//{s@127.0.0.1@${NODE_EXTERNAL_IP}@}")"
echo $(sudo cat /etc/rancher/k3s/k3s.yaml | sed -r "/server: https:\/\//{s@127.0.0.1@${NODE_EXTERNAL_IP}@}" | base64 -w 0)
```
