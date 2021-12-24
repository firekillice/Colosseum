# 添加 Helm 仓库

```bash
helm repo add elastic https://helm.elastic.co/
helm repo update
```

## 检查镜像列表

```bash
helm template filebeat elastic/filebeat \
    --namespace elastic \
    --atomic \
    --create-namespace \
    --version 7.13.4 \
    > filebeat.yaml
cat filebeat.yaml \
    | grep image: \
    | sed s/[[:space:]]//g \
    | sed "s|image:||g" \
    | sed 's|"||g' \
    | sed 's|docker.io/||g' \
    | sort \
    | uniq > filebeat-images.txt
cat filebeat-images.txt
```

## 生成模板

```bash
# install 安装
# upgrade 升级
helm template filebeat elastic/filebeat \
    --namespace elastic \
    --atomic \
    --create-namespace \
    --version 7.13.4 \
    --set extraVolumes[0].name="etclocaltime" \
    --set extraVolumes[0].hostPath.path="/etc/localtime" \
    --set extraVolumeMounts[0].name="etclocaltime" \
    --set extraVolumeMounts[0].mountPath="/etc/localtime" \
    --set extraVolumeMounts[0].readOnly=true \
    --set "filebeatConfig.filebeat\.yml=filebeat.autodiscover:
  providers:
    - type: kubernetes
      node: \${NODE_NAME}
      templates:
        - condition:
            equals:
              kubernetes.annotations.elastic.co/filebeat.enabled: true
          config:
            - type: container
              paths:
                - /var/log/containers/*\${data.kubernetes.container.id}.log
              exclude_lines: [\"^\\\\\\\\s+[\\\\\\\\-\`('.|_]\"]  # drop asciiart lines
              
processors:
  - decode_json_fields:
      fields: [\"message\"]
      target: json_message
      add_error_key: true
  - copy_fields:
      when.has_fields: [\"json_message.@l\"]
      fields:
        - from: json_message.@l
          to: level
  - add_fields:
      when.not.has_fields: [\"json_message.@l\"]
      fields:
        - level: Information
  - copy_fields:
      when.has_fields: [\"json_message.TraceId\"]
      fields:
        - from: json_message.TraceId
          to: trace-id
  - drop_fields:
      fields:
        - agent
        - ecs
        - input
        - stream
        - container.id
        - container.image.name
        - container.runtime
        - kubernetes.labels.controller-revision-hash
        - kubernetes.labels.pod-template-hash
        - kubernetes.labels.statefulset_kubernetes_io/pod-name
        - kubernetes.namespace_labels.kubernetes_io/metadata_name
        - kubernetes.namespace_uid
        - kubernetes.pod.uid
        - kubernetes.node.labels.beta_kubernetes_io/arch
        - kubernetes.node.labels.beta_kubernetes_io/instance-type
        - kubernetes.node.labels.beta_kubernetes_io/os
        - kubernetes.node.labels.kubernetes_io/arch
        - kubernetes.node.labels.kubernetes_io/hostname
        - kubernetes.node.labels.kubernetes_io/os
        - kubernetes.node.labels.node_kubernetes_io/instance-type
        - kubernetes.node.labels.node-role_kubernetes_io/control-plane
        - kubernetes.node.labels.node-role_kubernetes_io/master
        - kubernetes.node.uid
        - log.file.path
        - log.offset
output.elasticsearch:
  hosts: [\"http://elasticsearch-coordinating-only:9200\"]
  index: log-%{[kubernetes.namespace]}-%{+yyyy-MM-dd}

setup.ilm.enabled: false
setup.template.name: log-%{[kubernetes.namespace]}
setup.template.pattern: log-%{[kubernetes.namespace]}-*
      " \
    --set resources.limits.cpu="500m" \
    --set resources.limits.memory="128Mi" \
    --set resources.requests.cpu="100m" \
    --set resources.requests.memory="128Mi" \
    --set tolerations[0].key="node-role.kubernetes.io/master" \
    --set tolerations[0].operator="Exists" \
    --set tolerations[0].effect="NoSchedule" \
    --set image="capnexus-registry.capstonedev.cn/beats/filebeat" \
    > filebeat.yaml
```
