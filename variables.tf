variable "name" {}

variable "region" {
  description = "The region you are deploying into"
}

variable "environment" {
  description = "The environment that generally corresponds to the account you are deploying into."
}

//variable "resource_group" {
//  description = "The grouping that is conventionally used to name resources"
//}

variable "tags" {
  description = "Tags that are appended"
  type        = map(string)
}

variable "terraform_state_region" {
  description = "AWS region used for Terraform states"
}

variable "local_public_key" {
  description = "The file location of the key you wish to import.  If you want to generate a key then don't set."
}

