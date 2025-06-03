# Cluster Configuration
cluster_name              = "test-eks-cluster"
region                    = "us-east-2"
vpc_id                    = "vpc-0a91436a90a5c8d14"
subnet_ids                = ["subnet-09383880cabdcca0d", "subnet-089dabd56ebf46b27", "subnet-0afb2e2bb5c8ad1cb"]
availability_zones        = ["us-east-2a", "us-east-2b", "us-east-2c"]
kubernetes_version        = "1.32"

# Addon Versions
vpc_cni_version           = "v1.19.3-eksbuild.1"
#coredns_version           = "v1.11.4-eksbuild.2"
kube_proxy_version        = "v1.32.0-eksbuild.2"

# Master Security Group ID
master_security_group_id = "sg-01842d013a6d0c1bd"
owner                    = "emr"
project                  = "emr"       