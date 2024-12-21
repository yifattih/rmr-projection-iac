terraform {
  backend "gcs" {
    bucket      = var.bucket
    prefix      = var.bucket_prefix
  }
}