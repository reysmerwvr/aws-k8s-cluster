# https://github.com/kubernetes/kops/blob/master/docs/cli/kops_create_cluster.md

export NAME="aws-k8s-cluster"
export CLOUD="aws"
export CLOUD_LABELS="Name=test,Team=test"
export CHANNEL="stable"
export DNS="Public"
export DNS_ZONE="aws-k8s-cluster.domain.name"
export KUBERNETES_VERSION="1.14"
export MASTER_COUNT=3
export MASTER_SIZE=${MASTER_SIZE:-t2.micro}
export MASTER_VOLUME_SIZE=20
export NODE_COUNT=2
export NODE_SIZE=${NODE_SIZE:-t2.micro}
export NODE_VOLUME_SIZE=20
export OUT="./$NAME"
export TARGET="terraform"
export ZONES=${ZONES:-"us-east-1a,us-east-1d"}
export KOPS_STATE_STORE="s3://your-state-bucket"

# Create a cluster in AWS
# Create a cluster in AWS that has HA masters.  This cluster
# will be setup with an internal networking in a private VPC.
# A bastion instance will be setup to provide instance access.

kops create cluster \
--name=$CLUSTER_NAME \
--cloud=$CLOUD \
--cloud-labels=$CLOUD_LABELS \
--channel=$CHANNEL
--dns=$DNS \
--dns-zone=$DNS_ZONE \
--kubernetes-version=$KUBERNETES_VERSION \
--master-count=$MASTER_COUNT \
--master-size=$MASTER_SIZE \
--master-volume-size=$MASTER_VOLUME_SIZE \
--node-count=$NODE_COUNT \
--node-size=$NODE_SIZE \
--node-volume-size=$NODE_VOLUME_SIZE
--out=$OUT \
--target=$TARGET \
--zones=$ZONES \
--state=$KOPS_STATE_STORE
