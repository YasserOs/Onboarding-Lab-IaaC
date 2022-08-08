terraform {
  backend "gcs" {
    bucket  = "yasser-statefile-bucket"
    prefix = "terraform/state"
  }
}
provider "google" {
  project     = "iti-2-358616"
  region      = "us-central1"
} 

module "GS_Bucket_1" {
    source = "./Modules/GS_Bucket"
    bucket_name = "iti-2-358616-yasser-bucket-1"
    location = "us-central1"
    storage_class = "STANDARD"

}
module "GS_Bucket_2" {
    source = "./Modules/GS_Bucket"
    bucket_name = "iti-2-358616-yasser-bucket-2"
    storage_class = "STANDARD"
    location = "us-central1"

}
module "GS_Bucket_3" {
    source = "./Modules/GS_Bucket"
    bucket_name = "iti-2-358616-yasser-bucket-3"
    storage_class = "STANDARD"
    location = "us-central1"

}

module "Network" {
    source = "./Modules/Networking"
    VPC_name = "yasser-demo-vpc"
    Subnet_name = "yasser-demo-subnet"
    Subnet_cidr = "10.0.0.0/16"
    Subnet_region = "us-central1"

}
module "Nat" {
    source = "./Modules/Nat"
    router-name = "yasser-router"
    router-region = "${module.Network.subnet-region}"
    router-network = "${module.Network.vpc_id}"
    subnet-id = "${module.Network.subnet-id}"
}
module "Firewall" {
        source = "./Modules/Firewalls"
        depends_on = [module.Network]
        network_id = "${module.Network.vpc_id}"
        firewall-rule-name = "iap-ssh"
        firewall-rule-protocol = "tcp"
        firewall-rule-ports = ["22"]
        source_ranges = ["35.235.240.0/20"]
}

module "ServiceAccount_1" {
    source = "./Modules/ServiceAccount"
    sa-id = "cluster-admin"
    sa-display-name = "k8s-admin"
    project = "iti-2-358616"
    role = "roles/container.admin"
    member = "serviceAccount:${module.ServiceAccount_1.sa-email}"
}
module "ServiceAccount_2" {
    source = "./Modules/ServiceAccount"
    sa-id = "bucket-viewer"
    sa-display-name = "gcs-viewer"
    project = "iti-2-358616"
    role = "roles/storage.objectViewer"
    member = "serviceAccount:${module.ServiceAccount_2.sa-email}"
}
module "ServiceAccount_3" {
    source = "./Modules/ServiceAccount"
    sa-id = "bigquery-admin"
    sa-display-name = "bigquery-admin"
    project = "iti-2-358616"
    role = "roles/bigquery.admin"
    member = "serviceAccount:${module.ServiceAccount_3.sa-email}"
}
module "VM" {
    source = "./Modules/VM"
    Machine_name = "yasser-test-vm"
    Machine_type = "f1-micro"
    Zone = "us-central1-a"
    OS_image = "ubuntu-os-cloud/ubuntu-2204-lts"
    sa-email= "${module.ServiceAccount_3.sa-email}"
    subnet-id = "${module.Network.subnet-id}"
}



module "GKE"{
    source = "./Modules/GKE"
    project = "iti-2-358616"
    cluster_name = "yasser-demo-cluster"
    node-pool-name = "yasser-node-pool"
    cluster_zones = ["us-central1-f","us-central1-c"]
    cluster_region = "us-central1"
    nodes-count = 2
    node-type = "n1-standard-1"
    disk-type = "pd-standard"
    disk-size = 100
    os-image = "COS"
    vpc-selflink = "${module.Network.vpc-selflink}"
    subnet-selflink = "${module.Network.subnet-selflink}"
    sa = "${module.ServiceAccount_2.sa-email}"
    authorized-cidr-range = "${module.VM.instance-ip}/32"
}

module "BQ-dataset1" {
    source = "./Modules/BigQuery"
    dataset-id = "yasser_bq_dataset_1"
    friendly-name = "Dataset1"
    location = "US"
}


module "BQ-dataset2" {
    source = "./Modules/BigQuery"
    dataset-id = "yasser_bq_dataset_2"
    friendly-name = "Dataset2"
    location = "US"
}
module "BQ-dataset3" {
    source = "./Modules/BigQuery"
    dataset-id = "yasser_bq_dataset_3"
    friendly-name = "Dataset3"
    location = "US"
}