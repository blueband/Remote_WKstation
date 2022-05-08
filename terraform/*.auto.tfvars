region                      = "us-central1"
compute_zone                = "us-central1-a"
wkstation_boot_disk_size_gb = 100
wkstation_machine_type      = "e2-standard-2"
os_image                    = "ubuntu-os-cloud/ubuntu-2110"
desired_status              = "RUNNING" # optional can either take RUNNING or TERMINATED values.
machine_name                = "workstation-4-development"
disk_type                   = "pd-ssd"