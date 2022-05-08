variable "projectid" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "Region for GCP resources. Choose as per your location: https://cloud.google.com/about/locations"
  type        = string
}

variable "compute_zone" {
  type = string
}

variable "wkstation_machine_type" {
  type = string
}

variable "wkstation_boot_disk_size_gb" {
  type = number
}

variable "os_image" {
  type = string
}

variable "machine_name" {
  type = string
}


variable "desired_status" {
  type = string
}

variable "disk_type" {
  type = string

}