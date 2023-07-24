resource "aws_s3_bucket" "static-website-bucket" {
  bucket = var.bucket_prefix

}

resource "aws_s3_bucket_website_configuration" "static-website-bucket-config" {
  bucket = aws_s3_bucket.static-website-bucket.id

  index_document {
    suffix = "index.html"
  }

}

resource "aws_s3_bucket_public_access_block" "static-website-bucket-block" {
  bucket = aws_s3_bucket.static-website-bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "static-website-bucket-policy" {
  bucket = aws_s3_bucket.static-website-bucket.id
  policy = templatefile("s3-policy.json", { bucket = var.bucket_prefix })
}

resource "aws_s3_object" "static-website-bucket-index" {

  for_each     = fileset(path.root, "/documents/*")
  bucket       = aws_s3_bucket.static-website-bucket.id
  key          = replace(each.key,"documents/","")
  source       = each.value
  content_type = lookup(local.content_types, regex("\\.[^.]+$", each.value), null)
}

locals {
  # Define a map with file extensions and their corresponding content types
  content_types = {
    ".html" = "text/html"
    ".css"  = "text/css"
    ".js"   = "text/javascript"
    ".png"  = "image/png"
    ".jpg"  = "image/jpeg"
    ".gif"  = "image/gif"
    # Add more file extensions and their content types as needed
  }
}
