#stop
k0s stop; k0s reset; reboot;
ssh root@10.10.50.116 "k0s stop; k0s reset;reboot;"
ssh root@10.10.50.120 "k0s stop; k0s reset;reboot;"


#install master
#k0s config create > /etc/k0s/k0s.yaml
k0s install controller -c /etc/k0s/k0s.yaml 
k0s start

k0s token create --role=worker > token.file
scp token.file root@10.10.50.116:~
scp token.file root@10.10.50.120:~
ssh root@10.10.50.116 "k0s install worker --token-file ./token.file; k0s start"
ssh root@10.10.50.120 "k0s install worker --token-file ./token.file; k0s start"



