# Static Website on AWS S3 and Route53 using Terraform 

This repository contains the Terraform code to deploy a static website on AWS S3. By following the instructions below, you can easily create a highly available and scalable static website on Amazon S3.

## Prerequisites

Before you begin, make sure you have the following prerequisites:

1. [Terraform](https://www.terraform.io/) installed on your local machine.
2. An AWS account with appropriate IAM permissions to create S3 buckets and IAM roles.

## Getting Started

To deploy the static website on S3, follow these steps:

1. **Fork this repository**
2. **Ensure you have aws backend set up**
3. **Initialize Terraform:**
```terraform init```
4. **Customize the variables in variables.tf**
5. **Deploy the infrastructure:** ```terraform apply```
6. **Clean Up** ```terraform destroy```
