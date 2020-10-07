provider "aws" {
  region = "ap-northeast-1"
  alias  = "japan"
}

data terraform_remote_state "this" {
  backend = "remote"

  config = {
    organization = var.tfc_org
    workspaces = {
      name = var.tfc_ws
    }
  }
}

locals {
  public_subnets = data.terraform_remote_state.this.outputs.public_subnets_japan
  vpc_id         = data.terraform_remote_state.this.outputs.vpc_id_japan
}

module "nomad-starter" {
  providers = {
    aws = aws.japan
  }

  source  = "hashicorp/nomad-starter/aws"
  version = "0.2.1"
  # insert the 6 required variables here

  vpc_id                = local.vpc_id
  allowed_inbound_cidrs = var.allowed_inbound_cidrs
  consul_version        = var.consul_version
  nomad_version         = var.nomad_version
  name_prefix           = var.name_prefix
  owner                 = var.owner
  key_name              = var.key_name

  instance_type = var.instance_type
  public_ip     = var.public_ip
}

