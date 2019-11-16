data "aws_caller_identity" "this" {}
data "aws_region" "current" {}

terraform {
  required_version = ">= 0.12"
}

locals {
  name = var.name
  common_tags = {
    "Terraform" = true
    "Environment" = var.environment
  }

  tags = merge(var.tags, local.common_tags)
}

//resource "tls_private_key" "key" {
//  //  count = "${var.local_public_key == "" ? 0 : 1}"
//
//  algorithm = "RSA"
//}

//resource "local_file" "key_priv" {
//  //  count = "${var.local_public_key == "" ? 0 : 1}"
//
//  content = tls_private_key.key.private_key_pem
//  filename = "${path.module}/id_rsa"
//}

//resource "null_resource" "key_chown" {
//  //  count = "${var.local_public_key == "" ? 0 : 1}"
//
//  provisioner "local-exec" {
//    command = "chmod 400 ${path.module}/id_rsa"
//  }
//
//  triggers = {
//    always_run = timestamp()
//  }
//  depends_on = [
//    local_file.key_priv]
//}

//resource "null_resource" "key_gen" {
//  //  count = "${var.local_public_key == "" ? 0 : 1}"
//
//  provisioner "local-exec" {
//    command = "ssh-keygen -y -f ${path.module}/id_rsa > ${path.module}/id_rsa.pub"
//  }
//
//  triggers = {
//    always_run = timestamp()
//  }
//  depends_on = [
//    local_file.key_priv]
//}

//data "local_file" "key_gen" {
//  //  count = "${var.local_public_key == "" ? 0 : 1}"
//  filename = "${path.module}/id_rsa.pub"
//  depends_on = [
//    null_resource.key_gen]
//}

data "local_file" "key_local" {
  filename = var.local_public_key
}

resource "aws_key_pair" "key" {
  key_name = local.name
  public_key = data.local_file.key_local.content
}

//resource "aws_key_pair" "key" {
//  key_name = local.name
//  public_key = var.local_public_key == "" ? data.local_file.key_gen.content : data.local_file.key_local[0].content
//}

