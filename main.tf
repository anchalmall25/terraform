# Configure the AWS Provider
provider "aws" {
  access_key = "AKIA22Z76WOAGYR3EYFZ"
  secret_key = "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"
  region     = "us-east-1"
}
  
variable "s3_bucket_names" {
  type = list
  default = ["buc1.app", "buc2.app", "buc3.app","buc4.app","buc5.app"]
}

resource "aws_s3_bucket" "rugged_buckets" {
  count         = length(var.s3_bucket_names) //count will be 3
  bucket        = var.s3_bucket_names[count.index]
  acl           = "public-read"
  force_destroy = true
}