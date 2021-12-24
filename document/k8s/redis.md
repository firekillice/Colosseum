# 添加 Helm 仓库

```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
```

## 检查镜像列表

```bash
helm template redis bitnami/redis \
    --namespace yakyu \
    --atomic \
    --create-namespace \
    --version 14.8.4 \
    --set architecture="standalone" \
    > redis.yaml
cat redis.yaml \
    | grep image: \
    | sed s/[[:space:]]//g \
    | sed "s|image:||g" \
    | sed 's|"||g' \
    | sed 's|docker.io/||g' \
    | sort \
    | uniq > redis-images.txt
cat redis-images.txt
```

## 生成模板

```bash
# install 安装
# upgrade 升级
helm template redis bitnami/redis \
    --namespace yakyu \
    --atomic \
    --create-namespace \
    --version 14.8.4 \
    --set global.imageRegistry="capnexus-registry.capstonedev.cn" \
    --set global.storageClass="local-path" \
    --set global.redis.password="_Capstone1234" \
    --set architecture="standalone" \
    --set master.resources.limits.cpu="500m" \
    --set master.resources.limits.memory="1Gi" \
    --set master.resources.requests.cpu="100m" \
    --set master.resources.requests.memory="128Mi" \
    --set master.extraVolumes[0].name="etclocaltime" \
    --set master.extraVolumes[0].hostPath.path="/etc/localtime" \
    --set master.extraVolumeMounts[0].name="etclocaltime" \
    --set master.extraVolumeMounts[0].mountPath="/etc/localtime" \
    --set master.extraVolumeMounts[0].readOnly=true \
    > redis.yaml
```
