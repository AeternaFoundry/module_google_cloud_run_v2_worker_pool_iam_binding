resource "google_cloud_run_v2_worker_pool_iam_binding" "cloud_run_v2_worker_pool_iam_bindings" {
  for_each = var.cloud_run_v2_worker_pool_iam_bindings

  members  = each.value.members
  name     = each.value.name
  role     = each.value.role
  location = each.value.location
  project  = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

