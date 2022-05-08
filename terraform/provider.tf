# The configuration for the `remote` backend.
terraform {
  # Terraform Backend  
  backend "remote" {
    #         # The name of your Terraform Cloud organization.
    organization = "bluemoonltd"
    #
    #         # The name of the Terraform Cloud workspace to store Terraform state files in.
    workspaces {
      name = "gh-action-setup"
    }
  }

  #   backend "gcs" {
  #   bucket  = "tf-tfstatefile"
  #   prefix  = "terraform/state"
  # }
}

provider "google" {
  project = var.projectid
  region  = var.region
  zone    = var.compute_zone
}