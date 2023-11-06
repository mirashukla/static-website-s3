# General Variables

variable "name" {
  description = "name of module"
  type        = string
  default     = "static-website-1"
}

variable "region" {
  description = "Default region for provider"
  type        = string
  default     = "eu-west-1"
}

# EC2 Variables

variable "ami" {
  description = "Amazon machine image to use for ec2 instance"
  type        = string
  default     = "ami-01dd271720c1ba44f" # Ubuntu 20.04 LTS // eu-west-1
}

variable "instance_type" {
  description = "ec2 instance type"
  type        = string
  default     = "t2.micro"
}

# S3 Variables

variable "bucket_prefix" {
  description = "prefix of s3 bucket for app data"
  type        = string
}

variable "domain_name" {
  description = "the domain name of the static website (same as bucket name)"
  type        = string
}

variable "directory_name" {
  description = "the name of the directory holding the documents for static website"
  type        = string
}