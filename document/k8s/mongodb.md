# 添加 Helm 仓库

```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
```

## 检查镜像列表

```bash
helm template mongodb bitnami/mongodb \
    --namespace yakyu \
    --atomic \
    --create-namespace \
    --version 10.23.3 \
    > mongodb.yaml
cat mongodb.yaml \
    | grep image: \
    | sed s/[[:space:]]//g \
    | sed "s|image:||g" \
    | sed 's|"||g' \
    | sed 's|docker.io/||g' \
    | sort \
    | uniq > mongodb-images.txt
cat mongodb-images.txt
```

## 生成模板

```bash
# install 安装
# upgrade 升级
helm template mongodb bitnami/mongodb \
    --namespace yakyu \
    --atomic \
    --create-namespace \
    --version 10.23.3 \
    --set global.imageRegistry="capnexus-registry.capstonedev.cn" \
    --set global.storageClass="local-path" \
    --set architecture="standalone" \
    --set useStatefulSet=true \
    --set auth.rootPassword="_Capstone1234" \
    --set resources.limits.cpu="500m" \
    --set resources.limits.memory="2Gi" \
    --set resources.requests.cpu="100m" \
    --set resources.requests.memory="512Mi" \
    --set extraVolumes[0].name="etclocaltime" \
    --set extraVolumes[0].hostPath.path="/etc/localtime" \
    --set extraVolumeMounts[0].name="etclocaltime" \
    --set extraVolumeMounts[0].mountPath="/etc/localtime" \
    --set extraVolumeMounts[0].readOnly=true \
    --set arbiter.enabled=false \
    > mongodb.yaml
```
