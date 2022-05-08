resource "google_compute_instance" "default" {
  name           = var.machine_name
  machine_type   = var.wkstation_machine_type
  zone           = var.compute_zone
  desired_status = var.desired_status


  boot_disk {
    initialize_params {
      image = var.os_image
      type  = var.disk_type
    }
  }

metadata = {
    monitor_uptime_script = "https://gist.githubusercontent.com/justinshenk/312b5e0ab7acc3b116f7bf3b6d888fa4/raw/59f021c2bf0388ba36e5a589dba52e233ee84964/idle-shutdown.sh"
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

}