#  main.tf
#
provider "aws" {
  region  = "us-east-1"
}

resource "aws_transfer_user" "transfer_server_user" {
  count = length(var.transfer_server_user)

  server_id      = var.transfer_server
  user_name      = element(var.transfer_server_user, count.index)
  role           = var.transfer_server_role
  home_directory_type = "LOGICAL"
  home_directory_mappings {
    entry =  "/"
    target = "/${var.bucket_name}"
 }

}

resource "aws_transfer_ssh_key" "transfer_server_ssh_key" {
  count = length(var.transfer_server_user)

  server_id = var.transfer_server
  user_name = element(aws_transfer_user.transfer_server_user.*.user_name, count.index)
  body      = element(var.transfer_server_ssh_key, count.index)
}

#
# vars.tf define variables
#
variable  "transfer_server" {
    description = "Transfer_server"
    type = string
    default = "s-ad41f033819941279"
}
variable "bucket_name" {
    description = " S3 bucket name"
    type = string
    default = "ohiobucket2/folder2"
}

variable  "transfer_server_role" {
    description = "Transfer_server"
    type = string
    default = "arn:aws:iam::013700525790:role/role_ohb"

}

variable "transfer_server_user" {
   description = " A list of users"
   type = list
}

variable "transfer_server_ssh_key" {
   description = " A list of public keys"
   type = list

}
