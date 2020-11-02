provider "aws" {
  region = "eu-west-1"
}

provider "aws" {
  alias  = "use1"
  region = "eu-west-1"
}
