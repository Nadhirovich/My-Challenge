
terraform {
  backend "s3" {
    bucket         = "my-terraform-state-security-cgi"
    dynamodb_table = "my-terraform-state-security-cgi"
    encrypt        = true
    key            = "dev-first.tfstate"
    region         = "eu-central-1"
  }
  /*
  backend "local" {
    path = "./pre-init-state.tfstate"
  }
  */
}

provider "aws" {
  allowed_account_ids = [var.account_id]
  region              = var.region

}

module "pre-init" {
  source = "../../modules/pre-init"

  account_id = var.account_id
  env        = var.env
  project    = var.project
  region     = var.region

  bucket_name = "my-terraform-state-security-cgi"
  table_name  = "my-terraform-state-security-cgi"
}




