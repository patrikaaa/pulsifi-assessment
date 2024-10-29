terraform {

  backend "s3" {
    profile = "[your aws profile name]"
    bucket  = "[s3-bucket-name]"
    region  = "[region]"
    key     = "state/terraform.tfstate"  ###path in the s3 bucket
  }
}