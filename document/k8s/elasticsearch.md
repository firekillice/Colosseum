# 添加 Helm 仓库

```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
```

## 检查镜像列表

```bash
helm template elasticsearch bitnami/elasticsearch \
    --namespace elastic \
    --atomic \
    --create-namespace \
    --version 15.9.5 \
    > elasticsearch.yaml
cat elasticsearch.yaml \
    | grep image: \
    | sed s/[[:space:]]//g \
    | sed "s|image:||g" \
    | sed 's|"||g' \
    | sed 's|docker.io/||g' \
    | sort \
    | uniq > elasticsearch-images.txt
cat elasticsearch-images.txt
```

## 生成模板

```bash
# install 安装
# upgrade 升级
helm template elasticsearch bitnami/elasticsearch \
    --namespace elastic \
    --atomic \
    --create-namespace \
    --version 15.9.5 \
    --set global.imageRegistry="capnexus-registry.capstonedev.cn" \
    --set global.storageClass="local-path" \
    --set global.kibanaEnabled=true \
    --set extraVolumes[0].name="etclocaltime" \
    --set extraVolumes[0].hostPath.path="/etc/localtime" \
    --set extraVolumeMounts[0].name="etclocaltime" \
    --set extraVolumeMounts[0].mountPath="/etc/localtime" \
    --set extraVolumeMounts[0].readOnly=true \
    --set master.replicas=1 \
    --set master.resources.limits.cpu="500m" \
    --set master.resources.limits.memory="1Gi" \
    --set master.resources.requests.cpu="100m" \
    --set master.resources.requests.memory="512Mi" \
    --set coordinating.replicas=2 \
    --set coordinating.resources.limits.cpu="500m" \
    --set coordinating.resources.limits.memory="1Gi" \
    --set coordinating.resources.requests.cpu="100m" \
    --set coordinating.resources.requests.memory="512Mi" \
    --set data.replicas=1 \
    --set data.heapSize="2Gi" \
    --set data.resources.limits.cpu="500m" \
    --set data.resources.limits.memory="4Gi" \
    --set data.resources.requests.cpu="100m" \
    --set data.resources.requests.memory="4Gi" \
    --set kibana.extraVolumes[0].name="etclocaltime" \
    --set kibana.extraVolumes[0].hostPath.path="/etc/localtime" \
    --set kibana.extraVolumeMounts[0].name="etclocaltime" \
    --set kibana.extraVolumeMounts[0].mountPath="/etc/localtime" \
    --set kibana.extraVolumeMounts[0].readOnly=true \
    --set kibana.ingress.enabled=true \
    --set kibana.ingress.hostname="kibana.ingress.capstonedev.cn" \
    --set kibana.resources.limits.cpu="500m" \
    --set kibana.resources.limits.memory="512Mi" \
    --set kibana.resources.requests.cpu="100m" \
    --set kibana.resources.requests.memory="256Mi" \
    > elasticsearch.yaml
```
