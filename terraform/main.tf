module "compute" {
  source                 = "./modules/compute"
  machine_name           = var.machine_name
  wkstation_machine_type = var.wkstation_machine_type
  compute_zone           = var.compute_zone
  desired_status         = var.desired_status
  os_image               = var.os_image
  disk_type              = var.disk_type
  wk_stop_update_status  = var.wk_stop_update_status

}
