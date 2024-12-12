output "service_urls" {
  value = { for k, v in google_cloud_run_service.service : k => v.status[0].url }
}