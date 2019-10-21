variable "name" {
  type = string
}

variable "environment" {
  type = string
  description = "The environment that generally corresponds to the account you are deploying into."
}

variable "tags" {
  type        = map(string)
  description = "Tags that are appended"
  default = {}
}

variable "local_public_key" {
  type = string
  description = "The file location of the key you wish to import.  If you want to generate a key then don't set."
}

