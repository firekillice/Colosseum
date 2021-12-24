# 添加 Helm 仓库

```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
```

## 检查镜像列表

```bash
helm template etcd bitnami/etcd \
    --namespace yakyu \
    --atomic \
    --create-namespace \
    --version 6.2.11 \
    > etcd.yaml
cat etcd.yaml \
    | grep image: \
    | sed s/[[:space:]]//g \
    | sed "s|image:||g" \
    | sed 's|"||g' \
    | sed 's|docker.io/||g' \
    | sort \
    | uniq > etcd-images.txt
cat etcd-images.txt
```

## 生成模板

```bash
# install 安装
# upgrade 升级
helm template etcd bitnami/etcd \
    --namespace yakyu \
    --atomic \
    --create-namespace \
    --version 6.2.11 \
    --set global.imageRegistry="capnexus-registry.capstonedev.cn" \
    --set global.storageClass="local-path" \
    --set auth.rbac.allowNoneAuthentication=false \
    --set auth.rbac.rootPassword="_Capstone1234" \
    --set auth.peer.secureTransport=true \
    --set auth.peer.useAutoTLS=true \
    --set resources.limits.cpu="500m" \
    --set resources.limits.memory="512Mi" \
    --set resources.requests.cpu="100m" \
    --set resources.requests.memory="128Mi" \
    --set extraVolumes[0].name="etclocaltime" \
    --set extraVolumes[0].hostPath.path="/etc/localtime" \
    --set extraVolumeMounts[0].name="etclocaltime" \
    --set extraVolumeMounts[0].mountPath="/etc/localtime" \
    --set extraVolumeMounts[0].readOnly=true \
    > etcd.yaml
```
