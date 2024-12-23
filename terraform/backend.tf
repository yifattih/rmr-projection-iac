terraform {
  backend "gcs" {
    bucket = "rmr-projection-terraform"
    prefix = "terraform/state"
  }
}