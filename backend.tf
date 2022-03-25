terraform {
  backend "s3" {
    bucket = "myfirst-bucket-233353466532-tfstates-morgan"
    key    = "project1/march2022/terraform.tfstates"
 dynamodb_table = "terraform-lock"
  }
}