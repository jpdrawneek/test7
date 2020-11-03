terraform {
  backend "s3" {
      encrypt = true
      key     = "apps/static-site.tfstate"
  }
}
