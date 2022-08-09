module "GS_Bucket_1" {
    source = "./Modules/GS_Bucket"
    bucket_name = "${var.project_}-${var.bucket_name}-1"
    location = var.location
    storage_class = var.storage_class
    bucket-role = var.bucket_access_role
    authorized-members = ["serviceAccount:${module.ServiceAccount-1-testVm.sa-email}"]

}
module "GS_Bucket_2" {
    source = "./Modules/GS_Bucket"
    bucket_name = "${var.project_}-${var.bucket_name}-2"
    location = var.location
    storage_class = var.storage_class
    bucket-role = var.bucket_access_role
    authorized-members = ["serviceAccount:${module.ServiceAccount-1-testVm.sa-email}"]

}
module "GS_Bucket_3" {
    source = "./Modules/GS_Bucket"
    bucket_name = "${var.project_}-${var.bucket_name}-3"
    location = var.location
    storage_class = var.storage_class
    bucket-role = var.bucket_access_role
    authorized-members = ["serviceAccount:${module.ServiceAccount-1-testVm.sa-email}"]

}

module "Network" {
    source = "./Modules/Networking"
    VPC_name = var.VPC_name
    Subnet_name = var.Subnet_name
    Subnet_cidr = var.Subnet_cidr
    Subnet_region = var.region

}
module "Nat" {
    source = "./Modules/Nat"
    router-name = var.router-name
    router-region = "${module.Network.subnet-region}"
    router-network = "${module.Network.vpc_id}"
    subnet-id = "${module.Network.subnet-id}"
}
module "Firewall" {
        source = "./Modules/Firewalls"
        depends_on = [module.Network]
        network_id = "${module.Network.vpc_id}"
        firewall-rule-name = var.firewall-rule-name
        firewall-rule-protocol = var.firewall-rule-protocol
        firewall-rule-ports = var.firewall-rule-ports
        source_ranges = var.source_ranges
}

module "ServiceAccount-1-testVm" {
    source = "./Modules/ServiceAccount"
    sa-id = var.sa-id
    sa-display-name = var.sa-display-name
    project = var.project_
    role = var.role
    member = "serviceAccount:${module.ServiceAccount-1-testVm.sa-email}"
}
module "ServiceAccount-2-gcr" {
    source = "./Modules/ServiceAccount"
    sa-id = var.sa-id-2
    sa-display-name = var.sa-display-name-2
    project = var.project_
    role = var.role2
    member = "serviceAccount:${module.ServiceAccount-2-gcr.sa-email}"
}

module "VM" {
    source = "./Modules/VM"
    Machine_name = var.Machine_name
    Machine_type = var.Machine_type
    Zone = var.Zone
    OS_image = var.OS_image
    sa-email= "${module.ServiceAccount-1-testVm.sa-email}"
    subnet-id = "${module.Network.subnet-id}"
}



module "GKE"{
    source = "./Modules/GKE"
    project = var.project_
    cluster_name = var.cluster_name
    node-pool-name = var.node_pool_name
    cluster_zones = var.cluster_zones
    cluster_region = var.cluster_region
    nodes-count = var.nodes_per_zone 
    node-type = var.node_type
    disk-type = var.gke_disk_type
    disk-size = var.gke_disk_size
    os-image = var.gke_os_image
    vpc-selflink = "${module.Network.vpc-selflink}"
    subnet-selflink = "${module.Network.subnet-selflink}"
    sa = "${module.ServiceAccount-2-gcr.sa-email}"
    authorized-cidr-range = "${module.VM.instance-ip}/32"
}

module "BQ-dataset1" {
    source = "./Modules/BigQuery"
    dataset-id = "${var.dataset-id}_1"
    friendly-name = "${var.friendly-name}_1"
    location = var.bq_location
    dataset-role = var.dataset-access-role
    authorized-member = "${module.ServiceAccount-1-testVm.sa-email}"
}

module "BQ-dataset2" {
    source = "./Modules/BigQuery"
    dataset-id = "${var.dataset-id}_2"
    friendly-name = "${var.friendly-name}_2"
    location = var.bq_location
    dataset-role = var.dataset-access-role
    authorized-member = "${module.ServiceAccount-1-testVm.sa-email}"
}
module "BQ-dataset3" {
    source = "./Modules/BigQuery"
    dataset-id = "${var.dataset-id}_3"
    friendly-name = "${var.friendly-name}_3"
    location = var.bq_location
    dataset-role = var.dataset-access-role
    authorized-member = "${module.ServiceAccount-1-testVm.sa-email}"
}

