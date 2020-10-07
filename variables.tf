# Required

variable tfc_org {
  default     = "xxxxxx"
  description = "Org name that contains vpc settings"
}

variable tfc_ws {
  default     = "xxxxxxxxx"
  description = "Workspace name that contains vpc state"
}

variable key_name {
  default     = "xxxxx"
  description = "Keypair name to ssh"
}

variable owner {
  default = ""
}

variable consul_version {
  default = "1.8.0"
}

variable nomad_version {
  default = "0.12.5"
}

variable name_prefix {
  default = ""
}

variable allowed_inboud_cidrs {
  default = ["0.0.0.0/32"]
}

# Optional 

variable instance_type {
  default = "t2.micro"
}

variable public_ip {
  default = false
}
