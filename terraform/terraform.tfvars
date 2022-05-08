region                      = "us-east1"
compute_zone                = "us-east1-b"
wkstation_boot_disk_size_gb = 100
wkstation_machine_type      = "e2-standard-2"
os_image                    = "ubuntu-os-cloud/ubuntu-2110"
desired_status              = "TERMINATED" # optional can either take RUNNING or TERMINATED values.
machine_name                = "workstation-4-development"
disk_type                   = "pd-ssd"