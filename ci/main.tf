/*
terraform {
  backend "gcs" {
    bucket  = "{gcs bucket}"
    prefix  = "managed-rcc-ci"
  }
}
*/

provider "google" {
}

resource "google_cloudbuild_trigger" "img_build" {
  name = ""
  project = var.project
  description = "Create and test a new VM image"
  github {
    owner = "FluidNumerics"
    name = "{customer-managed-repository}"
    push {
      branch = "main"
    }
  }
  substitutions = {
    _ZONE = "us-central1-c"
    _SUBNETWORK = "default"
    _IMAGE_FAMILY = "midjourney-rcc"
    _INSTALL_ROOT = "/opt"
    _SLURM_ROOT = "/usr/local"
  }
  filename = "img/cloudbuild.yaml"
}
