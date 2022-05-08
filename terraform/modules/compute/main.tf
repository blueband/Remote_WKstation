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

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

}