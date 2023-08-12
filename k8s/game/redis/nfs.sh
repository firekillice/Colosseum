yum install nfs-utils -y

BASE_DIR=/data/cuser00/nfs
if [ ! -d $BASE_DIR ]
then
 mkdir -p $BASE_DIR
fi

echo "/data/cuser00/nfs *(rw,no_root_squash)" > /etc/exports

systemctl restart nfs && systemctl enable nfs

showmount -e 
