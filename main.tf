resource "aws_s3_bucket" "my_project_bucket" {
     bucket = "myfirst-bucket-233353466532-tfstates-morgan"

    lifecycle {
      prevent_destroy = true
    }

    tags = {
        Name = "myfirst-bucket-233353466532-tfstates-morgan"
        Environment = "Test"
    }
}

resource "aws_s3_bucket_versioning" "version_my_bucket" {
  bucket = aws_s3_bucket.my_project_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "terraform_lock_tbl" {
  name           = "terraform-lock"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags           = {
    Name = "terraform-lock"
  }
}